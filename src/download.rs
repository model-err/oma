use std::{
    io::Read,
    path::Path,
    sync::Arc,
    time::Duration,
};

use tokio::task::spawn_blocking;

use anyhow::{anyhow, Context, Result};
use indicatif::{MultiProgress, ProgressBar, ProgressStyle};
use reqwest::Client;
use tokio::{
    fs,
    io::AsyncWriteExt,
};

use crate::{checksum::Checksum, db::DOWNLOAD_DIR, WRITER};

/// Download a package
pub async fn download_package(
    path: String,
    mirrors: Vec<String>,
    download_dir: Option<&str>,
    client: &Client,
    hash: String,
    version: String,
    mbc: Arc<MultiProgress>,
    count: usize,
    len: usize,
    global_bar: ProgressBar,
) -> Result<String> {
    async fn download_inner(
        download_dir: Option<&str>,
        filename: &str,
        url: &str,
        client: &Client,
        hash: &str,
        mbc: Arc<MultiProgress>,
        count: usize,
        len: usize,
        global_bar: ProgressBar,
    ) -> Result<()> {
        if download_dir.is_none() {
            tokio::fs::create_dir_all(DOWNLOAD_DIR).await?;
        }

        download(
            url,
            client,
            filename.to_string(),
            Path::new(download_dir.unwrap_or(DOWNLOAD_DIR)),
            None,
            Some(hash),
            Some(mbc),
            Some((count, len)),
            Some(global_bar),
        )
        .await?;

        Ok(())
    }

    let filename = path
        .split('/')
        .last()
        .take()
        .context(format!("Can not parse url {path}"))?;

    // sb apt 会把下载的文件重命名成 url 网址的样子，为保持兼容这里也这么做
    let mut filename_split = filename.split("_");
    let package = filename_split
        .next()
        .take()
        .context("Can not parse filename")?;
    let arch_deb = filename_split
        .nth(1)
        .take()
        .context("Can not parse version")?;

    let arch_deb = if arch_deb == "noarch.deb" {
        "all.deb"
    } else {
        arch_deb
    };

    let version = version.replace(":", "%3a");
    let filename = format!("{package}_{version}_{arch_deb}");

    let mut all_is_err = true;

    let p = Path::new(download_dir.unwrap_or(DOWNLOAD_DIR)).join(&filename);
    if p.exists() {
        let hash_clone = hash.clone();
        let result = spawn_blocking(move || {
            Checksum::from_sha256_str(&hash_clone).and_then(|x| x.cmp_file(&p))
        })
        .await??;

        if !result {
            for i in mirrors {
                if download_inner(
                    download_dir,
                    &filename,
                    &format!("{i}/{path}"),
                    client,
                    &hash,
                    mbc.clone(),
                    count,
                    len,
                    global_bar.clone(),
                )
                .await
                .is_ok()
                {
                    all_is_err = false;
                    break;
                }
            }
        } else {
            return Ok(filename.to_string());
        }
    } else {
        for i in mirrors {
            if download_inner(
                download_dir,
                &filename,
                &format!("{i}/{path}"),
                client,
                &hash,
                mbc.clone(),
                count,
                len,
                global_bar.clone(),
            )
            .await
            .is_ok()
            {
                all_is_err = false;
                break;
            }
        }
    }

    if all_is_err {
        return Err(anyhow!(
            "Can not download package: {}, Maybe your network connect is broken!",
            filename
        ));
    }

    Ok(filename.to_string())
}

/// Download file to buffer
pub async fn download(
    url: &str,
    client: &Client,
    filename: String,
    dir: &Path,
    msg: Option<String>,
    hash: Option<&str>,
    mbc: Option<Arc<MultiProgress>>,
    progress: Option<(usize, usize)>,
    global_bar: Option<ProgressBar>,
) -> Result<()> {
    let barsty = oma_style_pb()?;

    // let p = dir.join(filename);
    let total_size = {
        let resp = client.get(url).send().await?;
        if resp.status().is_success() {
            resp.content_length().unwrap_or(0)
        } else {
            return Err(anyhow!(
                "Couldn't download URL: {}. Error: {:?}",
                url,
                resp.status(),
            ));
        }
    };

    let mut is_mb = false;

    let request = client.get(url);
    let pb = if let Some(mbc) = mbc {
        is_mb = true;
        let pb = mbc.add(ProgressBar::new(total_size));
        pb.set_style(barsty);

        pb
    } else {
        ProgressBar::new_spinner()
    };

    let mut msg = msg.unwrap_or(filename.clone());

    if console::measure_text_width(&msg) > 60 {
        msg = console::truncate_str(&msg, 57, "...").to_string();
    }

    let progress = if let Some((count, len)) = progress {
        format!("({count}/{len}) ")
    } else {
        "".to_string()
    };

    pb.set_message(format!("{progress}{msg}"));
    pb.enable_steady_tick(Duration::from_millis(1000));

    let file = dir.join(filename);

    if file.exists() {
        if let Some(hash) = hash {
            let mut f = std::fs::File::open(&file)?;
            let mut buf = Vec::new();
            f.read_to_end(&mut buf)?;
            let hash = hash.to_owned();

            let file_clone = file.clone();

            let result = spawn_blocking(move || {
                Checksum::from_sha256_str(&hash).and_then(|x| x.cmp_file(&file_clone))
            })
            .await??;

            if result {
                return Ok(());
            } else {
                tokio::fs::remove_file(&file).await?;
            }
        }
    }

    let mut source = request.send().await?;

    let mut dest = fs::File::create(&file).await?;
    while let Some(chunk) = source.chunk().await? {
        dest.write_all(&chunk).await?;
        pb.inc(chunk.len() as u64);

        if let Some(ref global_bar) = global_bar {
            global_bar.inc(chunk.len() as u64);
        }
    }

    if is_mb {
        pb.finish_and_clear();
    } else {
        pb.finish();
    }

    dest.flush().await?;
    drop(dest);

    if let Some(hash) = hash {
        let hash = hash.to_string();
        let result = spawn_blocking(move || {
            Checksum::from_sha256_str(&hash).and_then(|x| x.cmp_file(&file))
        })
        .await??;

        if !result {
            return Err(anyhow!(
                "Url: {url} checksum mismatch! Please check your network connection!"
            ));
        }
    }

    Ok(())
}

pub fn oma_style_pb() -> Result<ProgressStyle> {
    let bar_template = {
        let max_len = WRITER.get_max_len();
        if max_len < 90 {
            " {wide_msg} {total_bytes:>10} {binary_bytes_per_sec:>12} {eta:>4} {percent:>3}%"
        } else {
            " {msg:<48} {total_bytes:>10} {binary_bytes_per_sec:>12} {eta:>4} [{wide_bar:.white/black}] {percent:>3}%"
        }
    };
    let barsty = ProgressStyle::default_bar()
        .template(bar_template)?
        .progress_chars("=>-");

    Ok(barsty)
}
