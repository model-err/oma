use anyhow::{bail, Context, Result};
use console::style;
use glob_match::glob_match_with_captures;
use indicatif::HumanBytes;
use rust_apt::{
    cache::{Cache, PackageSort},
    package::{DepType, Dependency, Version},
    records::RecordField,
};
use std::{collections::HashMap, fmt::Write};

pub struct OmaPkg {
    pub package: String,
    pub version: String,
    pub section: Option<String>,
    pub maintainer: String,
    pub installed_size: String,
    pub dep_map: HashMap<String, String>,
    pub download_size: String,
    pub apt_manual_installed: Option<String>,
    pub apt_sources: Option<String>,
    pub description: Option<String>,
    pub has_dbg: bool,
}

impl OmaPkg {
    fn new(name: &str, version: &Version, has_dbg: bool) -> Self {
        let section = version.section().ok().map(|x| x.to_owned());

        let maintainer = version
            .get_record(RecordField::Maintainer)
            .unwrap_or("Null <null>".to_owned());

        let installed_size = HumanBytes(version.installed_size()).to_string();

        let download_size = HumanBytes(version.size()).to_string();
        let apt_sources = version.get_record(RecordField::Source);
        let description = version.description();
        let dep_map = dep_to_str_map(version.depends_map());

        Self {
            package: name.to_owned(),
            version: version.version().to_owned(),
            section,
            maintainer,
            installed_size,
            dep_map,
            download_size,
            apt_manual_installed: None, // TODO
            apt_sources,
            description,
            has_dbg,
        }
    }
}

fn dep_to_str_map(map: &HashMap<DepType, Vec<Dependency>>) -> HashMap<String, String> {
    let mut res = HashMap::new();
    for (k, v) in map {
        match k {
            DepType::Depends => res.insert("Depends".to_string(), dep_map_str(v)),
            DepType::PreDepends => res.insert("PreDepends".to_string(), dep_map_str(v)),
            DepType::Suggests => res.insert("Suggests".to_string(), dep_map_str(v)),
            DepType::Recommends => res.insert("Recommands".to_string(), dep_map_str(v)),
            DepType::Conflicts => res.insert("Conflicts".to_string(), dep_map_str(v)),
            DepType::Replaces => res.insert("Replaces".to_string(), dep_map_str(v)),
            DepType::Obsoletes => res.insert("Obsoletes".to_string(), dep_map_str(v)),
            DepType::Breaks => res.insert("Breaks".to_string(), dep_map_str(v)),
            DepType::Enhances => res.insert("Enhances".to_string(), dep_map_str(v)),
        };
    }

    res
}

pub fn show_pkgs(cache: &Cache, input: &str) -> Result<Vec<OmaPkg>> {
    let mut res = Vec::new();
    if input.contains('=') {
        let mut split_arg = input.split('=');
        let name = split_arg.next().context(format!("Not Support: {input}"))?;
        let version_str = split_arg.next().context(format!("Not Support: {input}"))?;

        let pkg = cache
            .get(name)
            .take()
            .context(format!("Can not get package: {input}"))?;

        let version = pkg
            .get_version(version_str)
            .context(format!("Can not get package {name} version: {version_str}"))?;

        let name = pkg.name();

        let has_dbg = has_dbg(cache, name, version.version());
        let oma_pkg = OmaPkg::new(name, &version, has_dbg);

        res.push(oma_pkg);
    } else if input.ends_with(".deb") {
        bail!("search_pkg does not support read local deb package");
    } else if input.contains('/') {
        let mut split_arg = input.split('/');
        let name = split_arg.next().context(format!("Not Support: {input}"))?;
        let branch = split_arg.next().context(format!("Not Support: {input}"))?;

        let pkg = cache
            .get(name)
            .take()
            .context(format!("Can not get package: {input}"))?;

        let mut sort = vec![];

        for i in pkg.versions() {
            let item = i
                .get_record(RecordField::Filename)
                .context(format!("Can not get package {name} filename!"))?;

            if item.split('/').nth(1) == Some(branch) {
                sort.push(i)
            }
        }

        if sort.is_empty() {
            bail!("Can not get package {} with {} branch.", name, branch);
        }

        sort.sort_by(|x, y| rust_apt::util::cmp_versions(x.version(), y.version()));

        let version = sort.last().unwrap();
        let name = pkg.name();
        let has_dbg = has_dbg(cache, name, version.version());
        let oma_pkg = OmaPkg::new(name, version, has_dbg);

        res.push(oma_pkg);
    } else {
        let sort = PackageSort::default();
        let search_res = cache
            .packages(&sort)
            .filter(|x| glob_match_with_captures(input, x.name()).is_some());

        for pkg in search_res {
            let name = pkg.name();
            let version = pkg
                .candidate()
                .context(format!("Can not get candidate from package {}", pkg.name()))?;

            let has_dbg = has_dbg(cache, name, version.version());

            let oma_pkg = OmaPkg::new(name, &version, has_dbg);
            res.push(oma_pkg);
        }
    }

    Ok(res)
}

fn has_dbg(cache: &Cache, name: &str, version: &str) -> bool {
    let has_dbg = if let Some(pkg) = cache.get(&format!("{name}-dbg")) {
        if pkg.get_version(version).is_some() {
            true
        } else {
            false
        }
    } else {
        false
    };

    has_dbg
}

fn dep_map_str(deps: &[Dependency]) -> String {
    let mut depends_str = String::new();
    for dep in deps {
        if dep.is_or() {
            let mut or_str = String::new();
            let total = dep.base_deps.len() - 1;
            for (num, base_dep) in dep.base_deps.iter().enumerate() {
                or_str.push_str(&base_dep.name());
                if let Some(comp) = base_dep.comp() {
                    let _ = write!(or_str, "({} {})", comp, base_dep.version().unwrap());
                }
                if num != total {
                    or_str.push_str(" | ");
                } else {
                    or_str.push_str(", ");
                }
            }
            depends_str.push_str(&or_str)
        } else {
            let lone_dep = dep.first();
            depends_str.push_str(&lone_dep.name());

            if let Some(comp) = lone_dep.comp() {
                let _ = write!(depends_str, " ({} {})", comp, lone_dep.version().unwrap());
            }
            depends_str.push_str(", ");
        }
    }

    depends_str
}

pub fn search_pkgs(cache: &Cache, input: &str) -> Result<()> {
    let sort = PackageSort::default();
    let packages = cache.packages(&sort).collect::<Vec<_>>();

    let mut res = HashMap::new();

    for pkg in packages {
        let cand = pkg.candidate().unwrap();
        if pkg.name().contains(input) && !pkg.name().contains("-dbg") {
            let dbg = has_dbg(cache, pkg.name(), cand.version());
            let oma_pkg = OmaPkg::new(pkg.name(), &cand, dbg);
            res.insert(
                pkg.name().to_string(),
                (oma_pkg, cand.is_installed(), pkg.is_upgradable()),
            );
        }

        if cand.description().unwrap_or("".to_owned()).contains(input)
            && !res.contains_key(pkg.name())
            && !pkg.name().contains("-dbg")
        {
            let dbg = has_dbg(cache, pkg.name(), cand.version());
            let oma_pkg = OmaPkg::new(pkg.name(), &cand, dbg);
            res.insert(
                pkg.name().to_string(),
                (oma_pkg, cand.is_installed(), pkg.is_upgradable()),
            );

            let providers = cand.provides().collect::<Vec<_>>();

            if !providers.is_empty() {
                for provider in providers {
                    if provider.name() == input {
                        let has_dbg = has_dbg(cache, provider.name(), cand.version());
                        let oma_pkg = OmaPkg::new(provider.name(), &cand, has_dbg);
                        res.insert(
                            pkg.name().to_string(),
                            (oma_pkg, cand.is_installed(), pkg.is_upgradable()),
                        );
                    }
                }
            }
        }
    }

    let mut res = res.into_values().collect::<Vec<_>>();

    res.sort_by_cached_key(|x| pkg_score(&x.0.package, input));
    res.reverse();

    for (pkg, installed, upgradable) in res {
        let prefix = if installed {
            style("INSTALLED").green().to_string()
        } else if upgradable {
            style("UPGRADE").yellow().to_string()
        } else {
            style("AVAIL").dim().to_string()
        };

        let mut pkg_info_line = style(&pkg.package).bold().to_string();
        pkg_info_line.push(' ');
        if upgradable {
            let p = cache.get(&pkg.package).unwrap();
            let installed = p.installed().unwrap();
            let now_version = installed.version();
            pkg_info_line.push_str(&format!(
                "{} -> {}",
                style(now_version).yellow(),
                style(pkg.version).green()
            ));
        } else {
            pkg_info_line.push_str(&style(&pkg.version).green().to_string());
        }

        if cache.get(&format!("{}-dbg", pkg.package)).is_some() {
            pkg_info_line.push(' ');
            pkg_info_line.push_str(&style("(debug symbols available)").dim().to_string());
        }

        crate::WRITER.writeln(&prefix, &pkg_info_line)?;
        crate::WRITER.writeln("", &pkg.description.unwrap_or("".to_owned()))?;
    }

    Ok(())
}

fn pkg_score(input: &str, name: &str) -> u8 {
    (255.0 * strsim::jaro_winkler(name, input)) as u8
}
