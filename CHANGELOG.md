# Changelog

**English** | [Deutsch](CHANGELOG.de.md) | [Français](CHANGELOG.fr.md) | [Español](CHANGELOG.es.md) | [Italiano](CHANGELOG.it.md) | [Português](CHANGELOG.pt.md) | [Русский](CHANGELOG.ru.md) | [한국어](CHANGELOG.ko.md) | [简体中文](CHANGELOG.zh-CN.md) | [繁體中文](CHANGELOG.zh-TW.md)

All notable changes to SentinelForeverUI are documented here.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [1.5.5] - 2026-11-04

### Added

- **Own addon-list section**: the addon now sits under a collapsible `Sentinel` group with localized description for all ten client languages and an Addon Compartment entry (left click: options, right click: movers)
- **WoW Forever ready**: TOC now declares interface `16001` (`Interface-Camelot`) and `S.isForever` detects the Camelot client (project constant or 160xx build range); Forever runs the retail 12.x codebase, so `isRetail` covers it automatically - secret-value guards and the aura compat layer already apply
- **Developer API** (`_G.SentinelUI_API` / `API.md`): external addons can apply the Sentinel skins and templates to their frames and widgets, read settings and the current world layer, and register translations for every client language via `AddLocaleStrings`/`AddLocales`
- **All client languages supported**: new locale files for frFR, esES + esMX, itIT, ptBR, ruRU, koKR, zhCN and zhTW with translations for the visible UI strings (options pages, installer, data texts, BugFolder); anything not yet translated falls back to English via the locale metatable
- **BugFolder module** (`/sbug`, `/sbugs`, `/suibug`): internal BugGrabber + BugSack replacement - captures every Lua error from all addons (load errors included), deduplicates them and keeps stack trace and locals. Sentinel-styled sack window with All/Session/Previous tabs, search, prev/next navigation, wipe, per-error bugtracker report and a plain-text export view. Minimap button: click opens the sack, right-click settings, shift-click reload, alt-click wipe. Other addons keep working via the BugGrabber-compatible global (`BugGrabber:GetDB()`); if the real !BugGrabber is installed BugFolder mirrors its database instead of fighting over the error handler

### Changed

- **New brand logo everywhere**: the lion sigil from the new logo is now the addon icon (addon list, minimap button, options header) and the full Sentinel Forever banner is shown on the options Start page and at the top of the AFK screen; the installer sidebar uses the crisp lion mark with wordmark text
- **Theme updated to the logo palette**: backdrop is a deeper navy and borders a steel blue, matching the banner background; the top edge of the options window runs a gold-to-azure gradient like the logo

### Fixed

- **Layer detection works now**: the Layer data text stayed on "?" because it read the wrong GUID field and referenced a module that does not exist here. Detection now works the way the well-known buff trackers do it - every NPC GUID carries its spawn shard, the discriminator key combines instanceID and zoneUID (which field holds the layer varies per client), keys are remembered per zone and realm and numbered in sorted order so "Layer 2" means the same thing your friends' addons report. Detection is passive too: combat-log GUIDs and nameplates feed it even without targeting an NPC, and it re-detects after joining a group or changing zones
- **Gold data text no longer flickers**: the 5-second rotation between current gold, session and month display is off by default - the slot now always shows the current amount, and the longer labelled phases no longer truncate. Rotation can be re-enabled under Data Texts (`goldRotate`)
- **Installer text readability**: a soft dim sits behind the content area so the copy no longer blends into the bright world behind the translucent window
