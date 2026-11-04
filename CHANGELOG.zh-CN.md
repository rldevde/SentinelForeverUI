# 更新日志

[English](CHANGELOG.md) | [Deutsch](CHANGELOG.de.md) | [Français](CHANGELOG.fr.md) | [Español](CHANGELOG.es.md) | [Italiano](CHANGELOG.it.md) | [Português](CHANGELOG.pt.md) | [Русский](CHANGELOG.ru.md) | [한국어](CHANGELOG.ko.md) | **简体中文** | [繁體中文](CHANGELOG.zh-TW.md)

SentinelForeverUI 的所有重要变更都记录在此。
格式遵循 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.1.0/)。

## [1.5.5] - 2026-11-04

### 新增

- **独立的插件分类区域**：插件现在位于可折叠的 `Sentinel` 分组下，支持全部十种客户端语言的本地化描述，并提供 Addon Compartment 入口（左键：选项，右键：移动）
- **WoW Forever 就绪**：TOC 现在声明接口 `16001`（`Interface-Camelot`），`S.isForever` 可检测 Camelot 客户端（项目常量或 160xx 构建范围）；Forever 运行 retail 12.x 代码库，因此 `isRetail` 自动覆盖 - 保密值守卫和光环兼容层已生效
- **开发者 API**（`_G.SentinelUI_API` / `API.md`）：外部插件可将 Sentinel 皮肤和模板应用于自己的框体和控件，读取设置和当前分层，并通过 `AddLocaleStrings`/`AddLocales` 为每种客户端语言注册翻译
- **支持全部客户端语言**：为 frFR、esES + esMX、itIT、ptBR、ruRU、koKR、zhCN、zhTW 新增语言文件，翻译了可见的界面文本（选项页、安装向导、数据文本、BugFolder）；未翻译内容通过语言元表回退到英文
- **BugFolder 模块**（`/sbug`、`/sbugs`、`/suibug`）：内置 BugGrabber + BugSack 替代品 - 捕获所有插件的 Lua 错误（含加载错误），去重并保留堆栈和局部变量。Sentinel 风格窗口带 全部/本次/上次 标签、搜索、前后翻页、清空、按错误生成报告和纯文本导出。小地图按钮：点击打开袋子，右键设置，Shift+点击重载，Alt+点击清空。其他插件通过兼容全局表（`BugGrabber:GetDB()`）继续工作；若安装了真正的 !BugGrabber，BugFolder 会镜像其数据库而非争抢错误处理器

### 变更

- **AFK 屏幕**：现在也可通过鼠标移动、点击和滚轮关闭 - 不再只限于 ESC 或移动
- **全新品牌 Logo**：新 Logo 的狮子徽记现为插件图标（插件列表、小地图按钮、选项标题栏），完整的 Sentinel Forever 横幅显示在选项起始页和 AFK 屏幕顶部；安装向导侧栏使用清晰的狮子标志配文字标
- **主题更新为 Logo 配色**：背景为更深的藏青色，边框为钢蓝色，与横幅背景一致；选项窗口顶部边缘像 Logo 一样呈现金色到蔚蓝的渐变

### 修复

- **小地图按钮收集**：单个出错的框架会中断整个扫描，导致不显示任何外部按钮 - 现在每个候选都通过 pcall 收集，同时扫描伴随框架（MinimapBackdrop/MinimapCluster/MinimapPanel），并默认收集 LDB 数据对象（`grabLDB` 迁移）
- **层位检测现已正常**：Layer 数据文本此前停留在 «?»，因为它读取了错误的 GUID 字段并引用了此处不存在的模块。现在检测方式与知名增益追踪器相同 - 每个 NPC GUID 都携带其生成位面，判别键组合 instanceID 和 zoneUID（哪个字段承载层位因客户端而异），键按区域和服务器记忆并按排序编号，因此 «Layer 2» 与朋友插件报告的含义相同。检测也是被动的：战斗记录 GUID 和姓名板无需选中 NPC 即可提供数据，加入队伍或更换区域后会重新检测
- **金币数据文本不再闪烁**：当前金币、本次、本月之间的 5 秒轮换默认关闭 - 槽位始终显示当前金额，长标签阶段不再被截断。可在数据文本（`goldRotate`）下重新启用轮换
- **安装向导文本可读性**：内容区域后方有柔和的暗化层，使文本不再融入半透明窗口后的明亮世界
