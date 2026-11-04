local _, ns = ...
local S = ns.S

-- Public API for external addons.
-- Everything third-party addons should need to match the Sentinel look,
-- register their own settings and provide translations for all client
-- languages lives on S.API (also mirrored as _G.SentinelUI_API).
-- See API.md in the addon root for documentation and examples.

local API = {}
S.API = API
_G.SentinelUI_API = API

API.version = S.version
API.accent = S.accent
API.accent2 = S.accent2
API.media = S.media
API.L = S.L

-- look ---------------------------------------------------------------------
function API.SetTemplate(f, template, glossAlpha) S:SetTemplate(f, template, glossAlpha) end
function API.CreateBackdrop(f, template, glossAlpha, ignoreUpdates) return S:CreateBackdrop(f, template, glossAlpha, ignoreUpdates) end
function API.StripTextures(f) S:StripTextures(f) end
function API.FontString(parent, size, outline, font, layer, justify) return S:FontString(parent, size, outline, font, layer, justify) end
function API.SetFont(fs, font, size, outline) S:SetFont(fs, font, size, outline) end
function API.RegisterAccent(object, key) S:RegisterAccent(object, key) end
function API.AddHover(f) S:AddHover(f) end
function API.SetInside(f) f:SetInside() end
function API.SetOutside(f) f:SetOutside() end

-- widgets ------------------------------------------------------------------
function API.SkinButton(btn, small) S:SkinButton(btn, small) end
function API.SkinCloseButton(btn, parent) S:SkinCloseButton(btn, parent) end
function API.SkinCheckBox(cb) S:SkinCheckBox(cb) end
function API.SkinEditBox(eb, height) S:SkinEditBox(eb, height) end
function API.SkinDropDown(dd, width) S:SkinDropDown(dd, width) end
function API.SkinScrollBar(sb) S:SkinScrollBar(sb) end
function API.SkinSlider(sl) S:SkinSlider(sl) end
function API.SkinTab(tab) S:SkinTab(tab) end
function API.CreateStatusBar(parent, name, template) return S:CreateStatusBar(parent, name, template) end
function API.CreateMover(...) return S:CreateMover(...) end
function API.Scale(n) return S:Scale(n) end

-- read-only helpers --------------------------------------------------------
-- The API is intentionally style-only: it adapts YOUR frames to the
-- Sentinel look. It never mutates Sentinel's own frames or settings.
function API.GetDB(key) return S.db and S.db.profile[key] end

-- localization --------------------------------------------------------------
-- Register translations: call once per client locale your addon supports.
-- Keys are the English source strings, matching Sentinel's own system.
--   API.AddLocaleStrings("frFR", { ["My Option"] = "Mon option" })
-- Strings register only when the client runs that locale; everything else
-- falls back to the English key automatically.
function API.AddLocaleStrings(locale, tbl)
	if type(locale) ~= "string" or type(tbl) ~= "table" then return end
	if GetLocale() ~= locale then return end
	for k, v in pairs(tbl) do S.L[k] = v end
end
function API.Locale() return GetLocale() end
-- convenience: one table per locale in a single call
--   API.AddLocales({ deDE = {...}, frFR = {...}, esES = {...} })
function API.AddLocales(map)
	if type(map) ~= "table" then return end
	local t = map[GetLocale() or ""]
	if not t then return end
	for k, v in pairs(t) do S.L[k] = v end
end

-- layer ---------------------------------------------------------------------
-- returns the current world layer number (0 = not detected yet)
function API.CurrentLayer()
	local dt = S:GetModule("DataTexts")
	return (dt and dt.CurrentLayer and dt:CurrentLayer()) or 0
end

-- print ---------------------------------------------------------------------
function API.Print(msg) S:Print(msg) end
