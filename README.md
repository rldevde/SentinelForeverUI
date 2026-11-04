# SentinelForeverUI

Complete user interface replacement for World of Warcraft — Anniversary,
Classic progression clients and WoW Forever (Camelot).

## Features

- Full UI suite: action bars, unit frames, nameplates, auras, bags, chat,
  tooltips, minimap, data texts/data bars, button bars, combat text, AFK
  screen, window mover — all in a consistent dark Sentinel theme
- **Layer detection** — recognizes your current world layer the same way
  Nova-style trackers do (sorted instance/zone GUID keys, passive detection
  via combat log and nameplates, sticky across targets)
- **BugFolder** — internal BugGrabber + BugSack replacement
  (`/sbug`, `/sbugs`, `/suibug`): captures all Lua errors incl. load errors,
  deduped sack window, export and bugtracker report
- **All client languages**: enUS, deDE, frFR, esES/esMX, itIT, ptBR, ruRU,
  koKR, zhCN, zhTW (untranslated strings fall back to English)
- **WoW Forever ready** — detects the Camelot client (`S.isForever`),
  secret-value safe, compat layer for the 12.x API
- Installer wizard, movable elements (`/sui move`), per-character module
  switches, profile system

## Commands

| Command | Action |
| --- | --- |
| `/sui` | Options |
| `/sui move` | Move/lock all elements |
| `/sui install` | Setup wizard |
| `/sbug` | BugFolder sack |

## Developer API

External addons can adopt the Sentinel look without touching the UI itself
— skin your own frames, widgets and fonts, register translations for all
client languages and read the current world layer:

```lua
local A = _G.SentinelUI_API
if A then A.SetTemplate(myFrame, "Default") end
```

See [API.md](API.md) for the full reference and examples.

## Links

- Website: https://xrl-dev.de/
- Bugtracker: https://xrl-dev.de/bugtracker
