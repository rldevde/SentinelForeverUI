# SentinelForeverUI – Developer API

This API is for **adapting your own addon to the Sentinel look**. You skin
*your* frames, widgets and fonts so they blend into the user's UI — it
never changes Sentinel's own frames or settings. Everything is applied
to objects you pass in. Available once SentinelForeverUI is loaded
(declare `SentinelForeverUI` as `OptionalDeps` in your .toc).

```lua
local A = _G.SentinelUI_API or _G.SentinelForeverUI and _G.SentinelForeverUI.API
if not A then return end -- addon is not installed
```

## Skins & toolkit

```lua
local f = CreateFrame("Frame", "MyFrame", UIParent)
A.SetTemplate(f, "Default")            -- Sentinel backdrop + border
local btn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
A.SkinButton(btn)                      -- flat Sentinel button
A.SkinCheckBox(cb) / A.SkinSlider(sl) / A.SkinDropDown(dd)
A.SkinEditBox(eb) / A.SkinScrollBar(sb) / A.SkinTab(tab) / A.SkinCloseButton(x)

local fs = A.FontString(f, 12, "OUTLINE")  -- themed FontString
fs:SetText("Hello")
local bar = A.CreateStatusBar(f, "MyBar")  -- themed statusbar
A.CreateMover(f, "myaddon.myframe", "My Frame")  -- movable with /sui move
```

`A.SetTemplate(f, t)` accepts `"Default"`, `"Transparent"`, `"Glass"`,
`"Border"`, `"Button"`, `"Invisible"`. `A.RegisterAccent(fs, "SetTextColor")`
re-colors an object live when the user changes the accent color.

`A.media` exposes `blank`, `glow`, `logo`, `logoBanner` etc.
`A.accent` / `A.accent2` are `{r,g,b,hex}` tables. `A.Scale(n)` returns
pixel-perfect sizes for the current UI scale.

## Translations for all client languages

Sentinel uses English keys: `A.L["My Option"]` returns the translated
string (or the key itself as fallback). Add your own translations:

```lua
A.AddLocales({
    deDE = { ["My Option"] = "Meine Option" },
    frFR = { ["My Option"] = "Mon option" },
    esES = { ["My Option"] = "Mi opción" },   -- esES also covers esMX
    itIT = { ["My Option"] = "La mia opzione" },
    ptBR = { ["My Option"] = "Minha opção" },
    ruRU = { ["My Option"] = "Моя опция" },
    koKR = { ["My Option"] = "내 옵션" },
    zhCN = { ["My Option"] = "" },
    zhTW = { ["My Option"] = "" },
})
-- or per-locale: A.AddLocaleStrings("frFR", { ... })
```

Only the table matching `A.Locale()` (`GetLocale()`) is applied; all
other locales fall back to the English key automatically. Fonts for
CJK/Cyrillic clients are already handled by the media system.

## Data helpers

```lua
local n = A.CurrentLayer()     -- world layer number, 0 = not detected yet
local accentOn = A.GetDB("useClassAccent")  -- read-only access to settings
A.Print("loaded")              -- Sentinel-branded chat print
```
