# utils
can-not-run-dpkg-print-arch = 无法执行 `dpkg --print-architecture'。
execute-pkexec-fail = 无法执行 `pkexec' 命令：{ $e }。
# history
history-tips-1 = oma 已成功应用对系统的更改。
history-tips-2 = 如需撤销本次操作，请使用 { $cmd } 命令。
# verify
fail-load-certs-from-file = 无法从 { $path } 载入软件源签名。
cert-file-is-bad = 位于 { $path } 的软件源签名无效。
# topics
can-not-find-specified-topic = 找不到测试源：{ $topic }。
do-not-edit-topic-sources-list = # 本文件使用 oma 生成，请勿编辑！
select-topics-dialog = 打开测试源以获取实验性更新，关闭测试源以回滚到稳定版本：
tips = 按 [Space]/[Enter] 切换开关状态，按 [Esc] 应用更改，按 [Ctrl-c] 退出。
scan-topic-is-removed = 测试源 { $name } 已从软件源中被删除，现将关闭 ...
refreshing-topic-metadata = 正在刷新测试源数据 ...
failed-to-read = 无法读取状态文件 ({ $p })。
# pkg
can-not-get-pkg-from-database = 无法从本机数据库中获取软件包 { $name } 的元数据。
invalid-path = 非法路径：{ $p }
debug-symbol-available = 调试符号可用
full-match = 完整匹配
already-installed = 软件包 { $name } ({ $version }) 已经安装。
can-not-mark-reinstall = 无法重装软件包 { $name } ({ $version })，因为当前可用的软件源中找不到指定的软件包和版本。
pkg-is-essential = 软件包 { $name } 是不允许删除的关键组件。
pkg-no-checksum = oma 无法修复软件包 { $name }：找不到该本地或第三方软件包的校验和。
pkg-unavailable = 软件源中找不到 { $ver } 版本的软件包 { $pkg }。
# pager
question-tips-with-gui = 按 [q] 结束审阅并应用更改，按 [Ctrl-c] 中止操作，按 [PgUp/Dn]、方向键或使用鼠标滚轮翻页。
normal-tips-with-gui = 按 [q] 或 [Ctrl-c] 退出，按 [PgUp/Dn]、方向键或使用鼠标滚轮翻页。
question-tips = 按 [q] 结束审阅并应用更改，按 [Ctrl-c] 中止操作，按 [PgUp/Dn] 或方向键翻页。
normal-tips = 按 [q] 或 [Ctrl-c] 退出，按 [PgUp/Dn] 或方向键翻页。
# oma
no-need-to-do-anything = 无需进行任何操作。
apt-error = `apt' 返回了错误。
invalid-pattern = 非法的表达式：{ $p }
additional-version = 另有 { $len } 个可用版本。请使用 `-a' 列出所有可用版本。
could-not-find-pkg-from-keyword = 无法找到匹配关键字 { $c } 的软件包。
no-need-to-remove = 软件包 { $name } 尚未安装，因此无需卸载。
packages-can-be-upgrade = 有 { $len } 个可升级的软件包
packages-can-be-removed = 有 { $len } 个可删除的软件包
comma = ，
successfully-refresh-with-tips = 成功刷新本机软件包数据库。{ $s }
successfully-refresh = 成功刷新本机软件包数据库。系统各软件包均为最新。
no-candidate-ver = 无法从软件包仓库中获取当前版本的软件包 { $pkg } 。
pkg-is-not-installed = 无法标记软件包 { $pkg } 的属性，因为该软件包尚未安装。
already-hold = 软件包 { $name } 已被标记为版本锁定。
set-to-hold = 成功标记软件包 { $name } 属性：版本锁定。
already-unhold = 软件包 { $name } 尚未标记为版本锁定。
set-to-unhold = 成功标记软件包 { $name } 属性：版本解锁。
already-manual = 软件包 { $name } 已被标记为手动安装。
setting-manual = 成功标记软件包 { $name } 属性：手动安装。
already-auto = 软件包 { $name } 已被标记为自动安装。
setting-auto = 成功标记软件包 { $name } 属性：自动安装。
command-not-found-with-result = { $kw }：找不到命令。该命令可能由如下软件包提供：
command-not-found = { $kw }：找不到命令。
clean-successfully = 成功清理 oma 本机数据库和缓存。
dpkg-configure-a-non-zero = `dpkg --configure -a' 返回错误。
dpkg-triggers-only-a-non-zero = `dpkg --triggers-only -a' 返回错误。
automatic-mode-warn = 正以无人值守模式运行 oma。如非本人所为，请立即按 Ctrl + C 中止操作！
removed-as-unneed-dep = 清理未使用的依赖
purge-file = 清理配置文件
semicolon = ；
pick-tips = 请指定要安装的 { $pkgname } 的版本：
battery = 您的电脑目前似乎正在使用电池供电。oma 在执行任务时可能消耗大量电量，推荐您接入交流电源以防断电导致数据损坏。
continue = 您确定要继续吗？
changing-system = oma 正在修改您的系统。
failed-to-lock-oma = 无法解锁 oma 进程锁文件 (/run/lock/oma.lock)
# main
user-aborted-op = 用户已中止操作。
# formatter
count-pkg-has-desc = { $count } 个软件包将被
dep-issue-1 = oma 发现指定软件包存在依赖问题，故无法安装。
dep-issue-2 = 请复制或截图如下依赖问题报告并联系 AOSC OS 维护者：
how-to-op-with-x = 按 [PgUp/Dn]、方向键或使用鼠标滚轮翻页。
end-review = 按 [q] 结束审阅并应用更改
cc-to-abort = 按 [Ctrl-c] 中止操作
how-to-op = 按 [PgUp/Dn] 或方向键翻页。
total-download-size = { "总下载大小： " }
change-storage-usage = { "预计磁盘占用变化： " }
pending-op = 待操作清单
review-msg = oma 将执行如下操作，请仔细验证。
install = 安装
installed = 安装
remove = 卸载
removed = 卸载
upgrade = 更新
upgraded = 更新
downgrade = 降级
downgraded = 降级
reinstall = 重装
reinstalled = 重装
colon = ：
# download
invalid-filename = 文件名 { $name } 无效。
checksum-mismatch-retry = 文件 { $c } 完整性验证失败，正在重试第 { $retry } 次 ...
can-not-get-source-next-url = 无法下载文件：{ $e }，将使用下一个镜像源重试 ...
checksum-mismatch = 文件 { $filename } 完整性验证失败。
# db
invalid-url = URL { $url } 无效。
can-not-parse-date = BUG：无法将 Date 值转换为 RFC2822 格式，请于 https://github.com/AOSC-Dev/oma 报告问题。
can-not-parse-valid-until = BUG：无法将 Valid-Until 值转换为 RFC2822 格式，请于 https://github.com/AOSC-Dev/oma 报告问题。
earlier-signature = InRelease 文件 { $filename } 无效：系统时间早于内联签名时间戳。
expired-signature = InRelease 文件 { $filename } 无效：内联签名已过期。
inrelease-sha256-empty = InRelease 中未找到校验和。
inrelease-checksum-can-not-parse = InRelease 文件无效：无法解析文件：{ $p }。
inrelease-parse-unsupported-file-type = BUG：解析器不支持该 InRelease 文件的格式，请于 https://github.com/AOSC-Dev/oma 报告问题。
can-not-parse-sources-list = 无法解析 sources.list 文件 { $path }。
unsupported-protocol = oma 不支持协议：{ $url }。
refreshing-repo-metadata = 正在刷新本机软件包数据库 ...
not-found = 无法从 { $url } 下载 InRelease 文件：找不到远端文件 (HTTP 404)。
inrelease-syntax-error = 位于 { $path } 的 InRelease 文件解析失败。
# contents
contents-does-not-exist = 找不到软件包内容数据库文件 (Contents)。
contents-may-not-be-accurate-1 = 本机软件包内容数据库文件已超过一周未有更新，因此搜索结果可能不准确。
contents-may-not-be-accurate-2 = 请使用 `oma refresh' 命令刷新该数据库。
execute-ripgrep-failed = 无法执行 `rg' 命令。
searching = 正在搜索 ...
search-with-result-count = 正在搜索，已找到 { $count } 个结果 ...
contents-entry-missing-path-list = BUG：oma 无法解析本机软件包内容数据库中的条目 { $entry }，请于 https://github.com/AOSC-Dev/oma 报告问题。
rg-non-zero = `rg' 报错退出。
# checksum
sha256-bad-length = SHA256 校验和无效：长度不正确。
can-not-checksum = 无法解析 SHA256 校验和。
failed-to-open-to-checksum = BUG：无法打开用于验证校验和的路径 { $path }，请于 https://github.com/AOSC-Dev/oma 报告问题。
# config
config-invalid = oma 配置文件 (/etc/oma.toml) 似乎已损坏！将使用默认配置。
cleaning = 正在清理本地软件包缓存 ...
download-failed-with-len = { $len } 个软件包下载失败。
download-failed = 下载 { $filename } 文件失败！
download-package-failed-with-reason = 下载软件包 { $filename } 失败，原因：{ $reason }。
download-failed-no-name = 下载文件失败！
need-more-size = 存储空间不足：{ $a } 可用，但需要 { $n }。
successfully-download-to-path = 已下载 { $len } 个软件包到该路径：{ $path }。
oma-may = 为应用您指定的更改，oma 可能 { $a }、{ $b }、{ $c }、{ $d } 或 { $e } 软件包。
failed-to-read-decode-inrelease = 无法读取解密后的 InRelease 文件。
failed-to-operate-path = 无法在路径 { $p } 中执行文件操作。
failed-to-get-parent-path = 无法获取路径 { $p } 的父目录。
failed-to-read-file-metadata = 无法读取 { $p } 的文件元数据。
failed-to-get-rg-process-info = 无法获取 `rg' 的进程状态。
failed-to-calculate-available-space = 无法计算可用存储空间。
failed-to-create-http-client = 无法创建 HTTP 客户端。
failed-to-connect-history-database = 无法连接到历史数据库。
failed-to-execute-query-stmt = 无法在历史数据库中执行查询命令。
failed-to-parse-history-object = 无法解析历史数据库中的对象。
failed-to-set-lockscreen = 无法设置系统锁屏状态。
failed-to-create-proxy = 无法创建系统消息总线 (D-Bus) 代理：{ $proxy }。
failed-check-dbus = 由于当前管理的系统尚未启动，oma 无法探测系统运行状态。
failed-check-dbus-tips-1 = 在此状态下，oma 无法检查电源及用户会话等关键系统状态，如继续操作可能会导致系统故障！
failed-check-dbus-tips-2 = 如果您正尝试用 chroot 等方式修复系统，请在 oma 命令后加 --no-check-dbus 参数。
failed-check-dbus-tips-3 = 如果您的系统是长期在容器或 chroot 环境下运行的，请修改 oma 配置文件 (/etc/oma.toml) 下的 `no_check_dbus' 选项为 `true' 。
no-check-dbus-tips = 目前 oma 已被配置为不探测系统运行状态，将忽略电源及用户会话等关键系统状态；如继续操作可能会导致系统故障。
oma-history-is-empty = oma 历史记录为空。
tui-pending = 待办事项
tui-search = 搜索软件包
tui-packages = 软件包列表（{ $u } 可更新，{ $r } 可删除，{ $i } 已安装）
tui-start-1 = 欢迎使用小熊猫包管理！
tui-start-2 = 切换面板
tui-start-3 = 显示/隐藏待办事项
tui-start-4 = 应用修改
tui-start-5 = 添加/删除操作条目
tui-start-6 = 搜索
tui-start-7 = 退出
tui-upgrade = 升级系统
tui-autoremove = 清理软件包
tui-no-system-update = 目前无需更新系统。
tui-no-package-clean-up = 目前无需清理无用软件包。
tui-continue-tips = 请按 [c] 继续。
oma = 小熊猫包管理
another-oma-is-running = 有另一个 oma 实例正在运行中：{ $s }
table-name = 软件名
table-version = 版本
table-size = 大小
table-detail = 备注
reading-database = 正在为软件包数据库建立索引 ...
reading-database-with-count = 正在为软件包数据库建立索引，已索引 { $count } 个软件包 ...
has-error-on-top = 您指定的操作未成功完成，请查阅上方输出。
mirror-is-not-trusted = 镜像源 { $mirror } 未签名或不受信任，请检查您的软件源配置。
please-run-me-as-root = oma 需执行系统管理操作，请使用管理员权限执行 oma 命令。
topic-not-in-mirror = 测试源 { $topic } 在镜像源 { $mirror } 上不可用。
skip-write-mirror = 这一般是您指定的镜像源未同步导致的，将尝试从您开启的其他镜像源中刷新测试源信息 ...
pkexec-tips-1 = 请在弹出的密码框输入密码以授权 oma 执行系统管理操作。
pkexec-tips-2 = 如果您无法操作该输入框，请按 Ctrl + C 退出并以管理员权限运行 oma。
cnf-too-many-query-2 = 请考虑使用 `oma provides --bin { $query }' 命令查阅所有匹配命令。
cnf-too-many-query = 您查询的命令有大量匹配项。
failed-to-decompress-contents = 无法解压缩 Contents 数据库。
removed-as-unmet-dep = 因依赖关系不满足而移除
no-result-bincontents-tips = 您可能在找这些软件包：
no-result-bincontents-tips-2 = 命令 { $cmd } 由 { $pkg } 软件包提供
oma-refresh-lock = 无法刷新本地软件包数据库。
oma-refresh-lock-dueto = { $exec } ({ $pid }) 正占用数据库锁。
oma-refresh-success-invoke = 正在执行刷新后配置脚本 (Post-Invoke-Success) ...
autoremove-tips-1 = 您的系统中有 { $count } 个可清理的软件包，清理后可释放 { $size } 存储空间；请使用 { $cmd } 查阅可清理的软件包。
autoremove-tips-2 = 如需保留某个软件包，请使用 { $cmd1 } 标记保留；否则，您可以使用 { $cmd2 } 清理不再需要的软件包。
essential-tips = { $pkg } 乃是系统必备组件，移除后将导致系统无法工作。
essential-continue = 您确定要移除该软件包吗？
yes-do-as-i-say-prompt = 直面天命
yes-do-as-i-say = 如果您确认要继续，请键入：{ $input }
yes-do-as-i-say-abort = 提示回答错误。
features-without-value = 当前操作可能导致部分关键 AOSC OS 组件被移除，如继续操作，将导致某些系统特性不可用。
features-tips-1 = 当前操作可能导致部分关键 AOSC OS 组件被移除，如继续操作，将导致如下系统特性不可用：
features-abort = 为避免系统故障，oma 已中止该操作。
features-continue-prompt = 您确定要继续该操作吗？
select-mirror-prompt = 按 [Space]/[Enter] 启用或禁用镜像源
set-mirror-order-prompt = 按 [Space]/[Enter] 选中镜像源，而后使用上下方向键修改优先顺序
all-speedtest-failed = 所有镜像源速度测试均失败，请检查您的网络连接。
failed-to-parse-file = 无法解析文件 { $p }。
mirror-not-found = 找不到镜像源 { $mirror } 。请使用 `oma mirror' 命令选择可用镜像源。
failed-to-serialize-struct = BUG: 解析配置时发生未知错误。
failed-to-write-file = 无法写入文件 { $p } 。
failed-to-create-file = 无法创建文件 { $p } 。
mirror-name = 镜像源
mirror-score = 速度
mirror-speedtest-start = 即将开始镜像源测速 ...
speedtest-complete = 镜像源测速完毕。
search-tips-with-result = 按 [Esc] 取消搜索，按 [N]/[n] 跳转至上/下一个匹配项。
search-tips-with-query = 搜索关键字：{ $query }
search-tips-with-empty = 搜索关键字不能为空（请按 [/] 重试搜索）。
search-tips-not-found = 您搜索的关键字无任何匹配项（请按 [/] 重试搜索）。
doplicate-component = 源配置文件中包含重复条目：{ $url } { $c }。
resolving-dependencies = 正在解析依赖关系 ...
auth-need-permission = 软件包所在的软件源可能需要访问鉴权，请使用管理员权限以允许 oma 读取鉴权配置。
lack-auth-config-1 = 由于缺少鉴权配置，oma 无法从软件源访问指定的软件包。
lack-auth-config-2 = 请检查您的 APT 鉴权配置 (/etc/apt/auth.conf.d)。
success = 操作已成功完成。
topics-unchanged = oma 在退出测试源时遇到错误，因此未保存测试源配置状态。
status-pending = 等待操作中
status-downloading = 正在下载软件包
status-package = 正在处理软件包 { $pkg }
tum-1 = oma 找到了 { $updates } 个可用系统更新。
tum-1-with-security = oma 找到了 { $updates } 个关键系统更新（含 { $security } 个 { $security_str })。
tum-2 = 根据您指定的操作，oma 还需要对系统组件执行若干变更，变更详情如下。
security = 安全更新
verify-error = 在验证 { $p } 的签名时遇到错误。
sources-list-empty = 软件源配置为空。
failed-refresh = 无法刷新软件源数据，
