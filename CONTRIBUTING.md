# Contributing to SentinelForeverUI

Thanks for helping out. A few ground rules keep the codebase consistent.

## Reporting bugs

- Open an issue with the **Bug report** template. Include your client
  flavor/version (Anniversary, Classic Era, Forever…) and the addon version.
- The best bug report is a BugFolder export: `/sbug` → Export, paste the
  captured error(s) into the issue.
- Security-relevant findings go through the
  [security policy](SECURITY.md), not public issues.

## Translations

- User-facing strings are **English keys**: `S.L["My Label"]` falls back to
  the key itself when untranslated.
- Additions go into `Locales/<locale>.lua` inside the `T` table
  (or `T2` block). One file per client locale; `esES.lua` covers `esMX`.
- Never write `L["key"] = nil` or empty strings — missing keys fall back
  automatically.

## Code conventions

- Modules: `S:NewModule("Name", "dbkey")`, enable flags in
  `Core/Defaults.lua` (`S.privateDefaults`).
- Wrap event/API access that can fail in `S:SafeCall` / `pcall`; defer
  combat-sensitive frame work via `S:RunOutOfCombat`.
- Auras only via `S.GetAura` / `S.UnitAura` (Compat.lua) — the global
  `UnitAura` is gone on modern clients.
- Never do arithmetic or comparisons on values that may be secret —
  check `S.IsSecret(v)` first (Forever/Midnight clients).
- No external UI-addon code or branding — own code only, free libs live
  in `Libs/` (Ace3, LibSharedMedia).
- Keep the code compact and match the surrounding style; no comments
  unless they document non-obvious behavior.

## Validation

Before submitting a PR, make sure everything still compiles:

```bash
pip install lupa   # once
SENTINELUI_ROOT="/path/to/SentinelForeverUI" \
  python D:/WoW/SentinelUI-Tools/check_compile.py
# must end in "compile failures: 0"
```

User-visible changes get a `CHANGELOG.md` entry (and the matching
`CHANGELOG.<lang>.md` files) plus a `## Version` bump in the TOC.

## Pull requests

- Keep PRs focused: one feature/fix per PR.
- Describe the *why*, not just the *what*.
