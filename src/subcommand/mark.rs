use std::{borrow::Cow, path::PathBuf};

use clap::{builder::PossibleValue, Args, ValueEnum};
use oma_console::{print::Action, success};
use oma_pm::{
    apt::{AptConfig, OmaApt, OmaAptArgs},
    matches::PackagesMatcher,
};
use oma_utils::dpkg::dpkg_arch;
use tracing::info;

use crate::{color_formatter, config::Config, error::OutputError, utils::root};

use super::utils::handle_no_result;
use crate::args_v2::CliExecuter;
use crate::fl;

#[derive(Debug, Copy, Clone, Eq, PartialEq)]
pub enum MarkAction {
    /// Lock package version(s), this will prevent the specified package(s) from being updated or downgraded
    Hold,
    /// Unlock package version(s), this will undo the “hold” status on the specified package(s)
    Unhold,
    /// Mark package(s) as manually installed, this will prevent the specified package(s) from being removed when all reverse dependencies were removed
    Manual,
    /// Mark package(s) as automatically installed, this will mark the specified package(s) for removal when all reverse dependencies were removed
    Auto,
}

impl ValueEnum for MarkAction {
    fn value_variants<'a>() -> &'a [Self] {
        &[Self::Hold, Self::Unhold, Self::Manual, Self::Auto]
    }

    fn to_possible_value(&self) -> Option<PossibleValue> {
        Some(match self {
            Self::Hold => PossibleValue::new("hold"),
            Self::Unhold => PossibleValue::new("unhold"),
            Self::Manual => PossibleValue::new("manual"),
            Self::Auto => PossibleValue::new("auto"),
        })
    }
}

#[derive(Debug, Args)]
pub struct Mark {
    #[arg(required = true)]
    action: MarkAction,
    /// Package(s) to mark status for
    #[arg(required = true)]
    packages: Vec<String>,
    /// Run oma in “dry-run” mode. Useful for testing changes and operations without making changes to the system
    #[arg(from_global)]
    dry_run: bool,
    /// Set sysroot target directory
    #[arg(from_global)]
    sysroot: PathBuf,
    /// Set apt options
    #[arg(from_global)]
    apt_options: Vec<String>,
}

impl CliExecuter for Mark {
    fn execute(self, _config: &Config, no_progress: bool) -> Result<i32, OutputError> {
        root()?;

        let Mark {
            action,
            packages,
            dry_run,
            sysroot,
            apt_options,
        } = self;

        let oma_apt_args = OmaAptArgs::builder()
            .sysroot(sysroot.to_string_lossy().to_string())
            .another_apt_options(apt_options)
            .build();

        let apt = OmaApt::new(vec![], oma_apt_args, false, AptConfig::new())?;

        let set = match action {
            MarkAction::Hold | MarkAction::Unhold => apt
                .mark_version_status(&packages, action == MarkAction::Hold, dry_run)?
                .into_iter()
                .map(|(x, y)| (Cow::Borrowed(x), y))
                .collect::<Vec<_>>(),
            MarkAction::Auto | MarkAction::Manual => {
                let arch = dpkg_arch(&sysroot)?;
                let matcher = PackagesMatcher::builder()
                    .cache(&apt.cache)
                    .native_arch(&arch)
                    .build();

                let (pkgs, no_result) =
                    matcher.match_pkgs_and_versions(packages.iter().map(|x| x.as_str()))?;

                handle_no_result(sysroot, no_result, no_progress)?;

                apt.mark_install_status(pkgs, action == MarkAction::Auto, dry_run)?
                    .into_iter()
                    .map(|(x, y)| (Cow::Owned(x), y))
                    .collect()
            }
        };

        for (pkg, is_set) in set {
            let pkg = color_formatter()
                .color_str(pkg, Action::Emphasis)
                .to_string();

            match action {
                MarkAction::Hold if is_set => {
                    success!("{}", fl!("set-to-hold", name = pkg));
                }
                MarkAction::Hold => {
                    info!("{}", fl!("already-hold", name = pkg));
                }
                MarkAction::Unhold if is_set => {
                    success!("{}", fl!("set-to-unhold", name = pkg));
                }
                MarkAction::Unhold => {
                    info!("{}", fl!("already-unhold", name = pkg));
                }
                MarkAction::Auto if is_set => {
                    success!("{}", fl!("setting-auto", name = pkg));
                }
                MarkAction::Auto => {
                    info!("{}", fl!("already-auto", name = pkg));
                }
                MarkAction::Manual if is_set => {
                    success!("{}", fl!("setting-manual", name = pkg));
                }
                MarkAction::Manual => {
                    info!("{}", fl!("already-manual", name = pkg));
                }
            };
        }

        Ok(0)
    }
}
