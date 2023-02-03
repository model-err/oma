use action::AoscptAction;

mod pkgversion;
mod update;
mod utils;
mod verify;
mod download;
mod action;
mod formatter;

fn main() {
    env_logger::init();

    let app = AoscptAction::new().unwrap();

    if let Err(e) = app.install(&["s-tui".to_owned()]) {
        eprintln!("{}", e);
    }
}
