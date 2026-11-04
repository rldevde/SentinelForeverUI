# 更新日誌

[English](CHANGELOG.md) | [Deutsch](CHANGELOG.de.md) | [Français](CHANGELOG.fr.md) | [Español](CHANGELOG.es.md) | [Italiano](CHANGELOG.it.md) | [Português](CHANGELOG.pt.md) | [Русский](CHANGELOG.ru.md) | [한국어](CHANGELOG.ko.md) | [简体中文](CHANGELOG.zh-CN.md) | **繁體中文**

SentinelForeverUI 的所有重要變更都記錄在此。
格式遵循 [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)。

## [1.5.5] - 2026-11-04

### 新增

- **獨立的插件分類區域**：插件現在位於可摺疊的 `Sentinel` 分組下，支援全部十種客戶端語言的本地化描述，並提供 Addon Compartment 入口（左鍵：選項，右鍵：移動）
- **WoW Forever 就緒**：TOC 現在宣告介面 `16001`（`Interface-Camelot`），`S.isForever` 可偵測 Camelot 客戶端（專案常數或 160xx 建置範圍）；Forever 執行 retail 12.x 程式碼庫，因此 `isRetail` 自動涵蓋 - 保密值守衛和光環相容層已生效
- **開發者 API**（`_G.SentinelUI_API` / `API.md`）：外部插件可將 Sentinel 外觀與範本套用至自己的框架和控件，讀取設定和當前分層，並透過 `AddLocaleStrings`/`AddLocales` 為每種客戶端語言註冊翻譯
- **支援全部客戶端語言**：為 frFR、esES + esMX、itIT、ptBR、ruRU、koKR、zhCN、zhTW 新增語言檔案，翻譯了可見的介面文字（選項頁、安裝精靈、資料文字、BugFolder）；未翻譯內容透過語言元表回退到英文
- **BugFolder 模組**（`/sbug`、`/sbugs`、`/suibug`）：內建 BugGrabber + BugSack 替代品 - 捕捉所有插件的 Lua 錯誤（含載入錯誤），去重並保留堆疊和區域變數。Sentinel 風格視窗帶 全部/本次/上次 標籤、搜尋、前後翻頁、清除、按錯誤產生報告和純文字匯出。小地圖按鈕：點擊開啟袋子，右鍵設定，Shift+點擊重新載入，Alt+點擊清除。其他插件透過相容全域表（`BugGrabber:GetDB()`）繼續運作；若安裝了真正的 !BugGrabber，BugFolder 會鏡像其資料庫而非爭搶錯誤處理器

### 變更

- **AFK 畫面**：現在也可透過滑鼠移動、點擊和滾輪關閉 - 不再只限於 ESC 或移動
- **全新品牌 Logo**：新 Logo 的獅子徽記現為插件圖示（插件列表、小地圖按鈕、選項標題列），完整的 Sentinel Forever 橫幅顯示在選項起始頁和 AFK 畫面頂部；安裝精靈側欄使用清晰的獅子標誌配文字標
- **主題更新為 Logo 配色**：背景為更深的藏青色，邊框為鋼藍色，與橫幅背景一致；選項視窗頂部邊緣像 Logo 一樣呈現金色到蔚藍的漸層

### 修復

- **層位偵測現已正常**：Layer 資料文字此前停留在 «?»，因為它讀取了錯誤的 GUID 欄位並參考了此處不存在的模組。現在偵測方式與知名增益追蹤器相同 - 每個 NPC GUID 都攜帶其生成位面，判別鍵組合 instanceID 和 zoneUID（哪個欄位承載層位因客戶端而異），鍵按區域和伺服器記憶並按排序編號，因此 «Layer 2» 與朋友插件報告的含義相同。偵測也是被動的：戰鬥記錄 GUID 和名條無需選中 NPC 即可提供資料，加入隊伍或更換區域後會重新偵測
- **金幣資料文字不再閃爍**：當前金幣、本次、本月之間的 5 秒輪換預設關閉 - 槽位始終顯示當前金額，長標籤階段不再被截斷。可在資料文字（`goldRotate`）下重新啟用輪換
- **安裝精靈文字可讀性**：內容區域後方有柔和的暗化層，使文字不再融入半透明視窗後的明亮世界
