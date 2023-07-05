# utils
can-not-run-dpkg-print-arch = Could not run `dpkg --print-architecture': {$e}.
dpkg-return-non-zero = `dpkg' returned an error: {$e}.
need-more-size = Insufficient storage space: {$a} is availble, but {$n} is needed.
old-pid-still-running = Another Omakase instance (PID: {$pid}) is still running, aborting.
can-not-create-lock-dir = Failed to create /run/lock: {$e}.
can-not-create-lock-file = Failed to create lock file: {$e}.
can-not-write-lock-file = Failed to write to lock file: {$e}.
can-not-unlock-oma = Failed to unlock Omakase: {$e}.
execute-pkexec-fail = Failed to execute `pkexec': {$e}.

# history
can-not-create-oma-log-dir = Failed to create Omakase log directory: {$e}.
can-not-create-oma-log = Failed to create Omakase history file: {$e}.
can-not-create-oma-log-database = Failed to create Omakase history database: {$e}.
can-not-read-oma-log-database = Failed to read Omakase history database: {$e}. Database may be corrupted.
can-not-ser-oma-log-database = BUG: Failed to serialize Omakase history database: {$e}. Please report this issue at https://github.com/AOSC-Dev/oma.
can-not-deser-oma-log-database = BUG: Failed to deserialize Omakase history database: {$e}. Please report this issue at https://github.com/AOSC-Dev/oma.
invaild-index = Invaild Omakase history index: {$index}.
index-is-nothing = Index {$index} does not contain any action.
select-op-undo = Select an operation ID to undo:
select-op-redo = Select an operation ID to redo:
history-tips-1 = Omakase has completed applying changes to your system.
history-tips-2 = If you would like to undo these changes, please use the `oma history {$undo_or_redo}' command.

# verify
fail-load-certs-from-file = Failed to load repository signature from {$path}.
cert-file-is-bad = Repository signature at {$path} is invalid.
inrelease-bad-signature = InRelease contains bad signature: {$e}.
inrelease-must-signed = Malformed PGP signature, InRelease must be signed.

# topics
can-not-find-specified-topic = Cannot find the specified topic: {$topic}
failed-to-enable-following-topics = Failed to enable the following topics: {$topic}
saving-topic-settings = Saving topic enrollment settings ...
do-not-edit-topic-sources-list = # Generated by Omakase. DO NOT EDIT!
select-topics-dialog = Enable topic(s) to receive testing updates, deselect to rollback to stable version(s):
removing-topic = Removing topic: {$name}
tips = Press [Space]/[Enter] to toggle selection, [q] to apply changes, [Ctrl-c] to abort.
scan-topic-is-removed = Topic {$name} has been removed from the repository, disabling ...
refreshing-topic-metadata = Refreshing topics metadata ...

# pkg
can-not-get-pkg-from-database = Failed to get metadata for package {$name} from the local database.
can-not-get-pkg-version-from-database = Failed to get metadata for package {$name} ({$version}) from the local database.
can-not-get-package-with-branch = Failed to get package {$name} from the {$branch} branch.
debug-symbol-available = (debug symbols available)
full-match = exact match
already-installed = {$name} ({$version}) is already installed
can-not-mark-reinstall = Cannot reinstall package {$name} ({$version}), as the specified package and version could not be found in any available repository.
mayble-dep-issue = Cannot install package {$name} due to a dependency issue.
pkg-is-essential = Package {$name} is essential. Refusing to remove.
pkg-search-avail = AVAIL
pkg-search-installed = INSTALLED
pkg-search-upgrade = UPGRADE

# pager
question-tips-with-x11 = Press [q] to end review, [Ctrl-c] to abort, [PgUp/Dn], arrow keys, or mouse wheel to scroll.
normal-tips-with-x11 = Press [q] or [Ctrl-c] to exit, [PgUp/Dn], arrow keys, or mouse wheel to scroll.
question-tips = Press [q] to end review, [Ctrl-c] to abort, [PgUp/Dn] or arrow keys to scroll.
normal-tips = Press [q] or [Ctrl-c] to exit, [PgUp/Dn] or arrow keys to scroll.

# oma
no-need-to-do-anything = No need to do anything.
retry-apt = `apt' returned an error, retrying: attempt {$count} ...
system-has-broken-dep = Omakase has detected broken dependencies on your system.
system-has-broken-dep-due-to = Omakase can help fix dependency issues. Please use the `{$cmd}' command. If this still fails, please inform us of your issue at https://github.com/AOSC-Dev/aosc-os-abbs.
additional-version = {$len} additional version(s) available. Please use the `-a' switch to list all available version(s).
could-not-find-pkg-from-keyword = Could not find any package for keyword {$c}.
depends = Depends
pre-depends = Pre-Depends
suggests = Suggests
recommends = Recommends
conflicts = Conflicts
replaces = Replaces
obsoletes = Obsoletes
breaks = Breaks
enhances = Enhances
depended-by = Depended by
broken-by = Broken by
pre-depended-by = Pre-Depended by
suggested-by = Suggested by
recommended-by = Recommended by
conflicted-by = Conflicted by
replaced-by = Replaced by
obsoleted-by = Obsoleted by
enhanced-by = Enhanced by
successfully-download-to-path = Successfully downloaded {$len} package(s) to path: {$path}.
no-need-to-remove = Package {$name} is not installed. No need to remove.
packages-can-be-upgrade = {$len} package(s) can be upgraded.
packages-can-be-removed = {$len} package(s) can be removed.
run-oma-upgrade-tips = Upgrade system packages with `oma upgrade'.
comma = {", "}
successfully-refresh-with-tips = Successfully refreshed the package database. {$s}
successfully-refresh = Successfully refreshed the package database. System is up to date.
no-candidate-ver = Current version for package {$pkg} is not available from the repository.
pkg-is-not-installed = Unable to mark package {$pkg}, as it is not yet installed.
dpkg-data-is-broken = Omakase failed to parse the dpkg database. The dpkg database may be corrupted.
already-hold = Package {$name} is already marked for version hold.
set-to-hold = Marked package {$name} for version hold.
already-unhold = Package {$name} is not yet marked for version hold.
set-to-unhold = Marked package {$name} for version unhold.
already-manual = Package {$name} is already marked as manually installed.
setting-manual = Marked package {$name} as manually installed.
already-auto = Package {$name} is already marked as automatically installed.
setting-auto = Marked package {$name} as automatically installed.
command-not-found-with-result = {$kw}: command not found. This command may be found from the following package(s):
command-not-found = {$kw}: command not found.
clean-successfully = Successfully cleaned Omakase database and cache.
dpkg-get-selections-non-zero = `dpkg --get-selections' returned an error. The dpkg database may be corrupted.
can-not-parse-line = Failed to parse line {$i} in the `dpkg --get-selections' output. The dpkg database may be corrupted.
dpkg-was-interrupted = A previous `dpkg' operation was interrupted, Omakase will now resume that operation ...
dpkg-configure-a-non-zero = `dpkg --configure -a' returned an error:
verifying-the-interity-of-pkgs = Verifying the integrity of downloaded packages ...
automatic-mode-warn = Running Omakase in unattended mode. If this is not intended, press Ctrl + C now to abort the operation!
has-no-symbol-pkg = Package {$name} has no debug symbol available.
pkg-no-version = Failed to get version of package {$name}.
removed-as-unneed-dep = removed as unneeded dependency
purge-file = purge configuration files
semicolon = {"; "}
should-installed = BUG: Package {$name} marked for pending operation but it is not installed. This is a program exception. Please report this issue at https://github.com/AOSC-Dev/oma.
pick-tips = Please select {$pkgname} version to install:

# main
user-aborted-op = User aborted the operation.

# formatter
download-not-done = Omakase has finished downloading packages, but the APT backend returned an inconsistent state. Please run Omakase in debug mode (using the `--debug' switch) and submit the log in a bug report at https://github.com/AOSC-Dev/oma.
force-auto-mode = Running Omakase in unattended mode with FORCED operations. If this is not  intended, press Ctrl + C now to stop the operation!
dpkg-force-all-mode = Running Omakase with DPKG FORCE ALL mode (ignores issues such as unsatisfied dependencies). If this is not intended, press Ctrl + C now to stop the operation!
dep-does-not-exist = Dependency package {$name} is not available from any available repository.
count-pkg-has-desc = {$count} package(s) will be
dep-error = Dependency Error
dep-error-desc = Omakase has detected dependency errors(s) in your system and cannot proceed with
    your specified operation(s). This may be caused by missing or mismatched
    packages, or that you have specified a version of a package that is not
    compatible with your system.
contact-admin-tips = Please contact your system administrator or developer.
how-to-abort = Press [q] or [Ctrl-c] to abort.
how-to-op-with-x = Press [PgUp/Dn], arrow keys, or use the mouse wheel to scroll.
end-review = Press [q] to end review
cc-to-abort = Press [Ctrl-c] to abort
how-to-op = Press [PgUp/Dn] or arrow keys to scroll.
total-download-size = {"Total download size: "}
change-storage-usage = {"Estimated change in storage usage: "}
pending-op = Pending Operations
review-msg = Shown below is an overview of the pending changes Omakase will apply to your
    system, please review them carefully.
removed = REMOVED
installed = installed
upgrade = upgrade
downgraded = downgraded
reinstall = reinstall
oma-may = Omakase may {$a}, {$b}, {$c}, {$d}, or {$e} packages in order
    to fulfill your requested changes.
install = install
remove = remove
upgrade = upgrade
downgrade = downgrade
unmet-dep = unmet dependencies
colon = : 

# download
invalid-url = BUG: URL is not valid. Please report this issue at https://github.com/AOSC-Dev/oma.
invaild-filename = Invalid file name: {$name}.
invaild-ver = Invalid version: {$ver}.
checksum-mismatch-try-next-url = Checksum verification failed for package {$c}. Retrying using the next available mirror ...
checksum-mismatch-retry = Checksum verification failed for package {$c}. Retrying {$retry} times ...
can-not-get-source-next-url = Failed to download package {$e}. Retrying using the next available mirror ...
checksum-mismatch = Checksum verification failed for package file {$filename} at {$dir}.
maybe-mirror-syncing = This could be caused by an incomplete or in progress mirror sync.
can-not-download-file = Failed to download package {$filename}: {$e}.
check-network-settings = Please verify your network settings.
can-not-download-file-with-why = Failed to write package file {$filename} to {$dir}: {$e}.
downloading-count-pkg = Downloading {$count} packages ...
progress = Progress:
success-download-pkg = Downloaded {$download_len} package.
no-need-to-fetch-anything = No need to fetch anything.
can-not-get-filename = BUG: Cannot read file {$name}. Please report this issue at https://github.com/AOSC-Dev/oma.

# db
setting-path-does-not-exist = Specified package cache directory {$path} does not exist. Falling back to /var/cache/apt/archives.
invaild-url-with-err = Invalid URL {$url}: {$e}.
cant-parse-distro-repo-data = Failed to parse distribution repository data file {$mirror}: {$e}.
distro-repo-data-invalid-url = Distribution repository data file contains invalid URL {$url}: {$e}.
host-str-err = Failed to detect the hostname of the specified mirror.
can-nnot-read-inrelease-file = Failed to parse InRelease at {$path}: {$e}.
inrelease-date-empty = InRelease file is invalid: The Date field is empty.
inrelease-valid-until-empty = InRelease file is invalid: The Valid-Until entry is empty.
can-not-parse-date = BUG: Failed to parse the Date field {$date} to the RFC2822 format. Please report this issue at https://github.com/AOSC-Dev/oma.
can-not-parse-valid-until = BUG: Failed to parse the Valid-Until field {$valid_until} to the RFC2822 format. Please report this issue at https://github.com/AOSC-Dev/oma.
earlier-signature = InRelease file {$filename} is invalid: System time is earlier than the enclosed signature timestamp.
expired-signature = InRelease file {$filename} is invalid: The enclosed signature has expired.
inrelease-sha256-empty = InRelease file is invalid: The SHA256 field is empty.
inrelease-checksum-can-not-parse = InRelease file is invalid: Failed to parse checksum entry {$i}.
inrelease-parse-unsupport-file-type = BUG: InRelease parser has encountered an unsupport file format. Please report this issue at https://github.com/AOSC-Dev/oma.
can-not-parse-sources-list = Failed parse the sources.list file: {$e}.
unsupport-cdrom = Omakase does not support the cdrom:// protocol: {$url}.
unsupport-some-mirror = Omakase has detected unsupported entries in sources.list.
unsupport-sourceentry = Unsupported sources.list entry(ies):
refreshing-repo-metadata = Refreshing local database ...
can-not-get-suite = Failed to detect suite from sources.list entry: {$url}.
not-found = Failed to download InRelease from URL {$url}: Remote file not found (HTTP 404).
contents = `Contents'
pkg_list = `Packages'
bincontents = `BinContents'
decompressing = Decompressing the
unsupport-decompress-file = BUG: Omakase has encountered an unsupported compression method in {$name}. Please report this issue at https://github.com/AOSC-Dev/oma.
can-not-get-file = Failed to open file {$name}: {$e}
downloading-database = {$file} {$source}

# contents
contents-does-not-exist = Package contents database (Contents) does not exist. Use the {$cmd} command to refresh the contents database.
contents-may-not-be-accurate-1 = The local package contents database has not been updated for over a week, search results may not be accurate.
contents-may-not-be-accurate-2 = Use the `oma refresh' command to refresh the contents database.
execute-ripgrep-failed = Failed to execute `rg': {$e}.
searching = Searching ...
parse-rg-result-failed = BUG: Failed to parse `rg' result {$i}: {$e}. Please report this issue at https://github.com/AOSC-Dev/oma.
search-with-result-count = Searching, found {$count} results so far ...
contents-entry-missing-path-list = BUG: Omakase failed to parse an entry {$entry} in the local contents database. Please report this issue at https://github.com/AOSC-Dev/oma.
rg-non-zero = `rg' returned an error.
cnf-wrong-argument = BUG: The command-not-found method was not passed with the correct parameters, please report upstream: https://github.com/AOSC-dev/oma.

# checksum
sha256-bad-length = Malformed SHA256 checksum: bad length.
can-not-checksum = BUG: Failed to parse SHA256 checksum {$e}. Please report this issue at https://github.com/AOSC-Dev/oma.
failed-to-open-to-checksum = BUG: Failed to open {$path} for checksum verification. Please report this issue at https://github.com/AOSC-Dev/oma.
