# Changelog

[English](CHANGELOG.md) | **Deutsch** | [Français](CHANGELOG.fr.md) | [Español](CHANGELOG.es.md) | [Italiano](CHANGELOG.it.md) | [Português](CHANGELOG.pt.md) | [Русский](CHANGELOG.ru.md) | [한국어](CHANGELOG.ko.md) | [简体中文](CHANGELOG.zh-CN.md) | [繁體中文](CHANGELOG.zh-TW.md)

Alle wichtigen Änderungen an SentinelForeverUI werden hier dokumentiert.
Das Format folgt [Keep a Changelog](https://keepachangelog.com/de/1.1.0/).

## [1.5.5] - 2026-11-04

### Hinzugefügt

- **Eigener Addon-Bereich**: Das Addon liegt jetzt unter einer aufklappbaren `Sentinel`-Gruppe mit lokalisierter Beschreibung für alle zehn Clientsprachen und einem Addon-Compartment-Eintrag (Linksklick: Optionen, Rechtsklick: Mover)
- **WoW Forever bereit**: Das TOC deklariert jetzt Interface `16001` (`Interface-Camelot`) und `S.isForever` erkennt den Camelot-Client (Projekt-Konstante oder 160xx-Build-Bereich); Forever läuft auf der Retail-12.x-Codebasis, daher greift `isRetail` automatisch - Secret-Value-Guards und der Aura-Compat-Layer gelten bereits
- **Entwickler-API** (`_G.SentinelUI_API` / `API.md`): Externe Addons können Sentinel-Skins und -Templates auf eigene Frames und Widgets anwenden, Einstellungen und den aktuellen Layer lesen sowie Übersetzungen für jede Clientsprache via `AddLocaleStrings`/`AddLocales` registrieren
- **Alle Clientsprachen unterstützt**: neue Locale-Dateien für frFR, esES + esMX, itIT, ptBR, ruRU, koKR, zhCN und zhTW mit Übersetzungen der sichtbaren UI-Texte (Optionsseiten, Installer, Datatexte, BugFolder); nicht Übersetztes fällt über die Locale-Metatable auf Englisch zurück
- **BugFolder-Modul** (`/sbug`, `/sbugs`, `/suibug`): interner BugGrabber- + BugSack-Ersatz - fängt jeden Lua-Fehler aller Addons (inkl. Ladefehler), dedupliziert und behält Stacktrace und Locals. Sack-Fenster im Sentinel-Look mit Alle/Sitzung/Vorherig-Tabs, Suche, Vor/Zurück-Navigation, Wipe, Bugtracker-Report pro Fehler und Textexport. Minimap-Button: Klick öffnet den Sack, Rechtsklick Einstellungen, Shift-Klick Reload, Alt-Klick Wipe. Andere Addons funktionieren weiter über die BugGrabber-kompatible Globaltabelle (`BugGrabber:GetDB()`); ist das echte !BugGrabber installiert, spiegelt BugFolder dessen Datenbank statt um den Fehler-Handler zu konkurrieren

### Geändert

- **AFK-Bildschirm**: lässt sich jetzt auch per Mausbewegung, Klick und Mausrad ausblenden - nicht nur ESC oder Laufen
- **Neues Logo überall**: das Löwen-Siegel des neuen Logos ist jetzt das Addon-Icon (Addon-Liste, Minimap-Button, Options-Header) und das volle Sentinel-Forever-Banner erscheint auf der Options-Startseite und oben im AFK-Screen; die Installer-Seitenleiste nutzt das scharfe Löwen-Mark mit Wortmarke
- **Theme an die Logo-Palette angepasst**: Hintergrund ist ein tieferes Navy, Rahmen ein Stahlblau passend zum Banner; die obere Kante des Optionsfensters läuft als Gold-nach-Azur-Verlauf wie im Logo

### Behoben

- **Layer-Erkennung funktioniert**: der Layer-Datatext blieb auf „?", weil er das falsche GUID-Feld las und auf ein hier nicht existierendes Modul verwies. Die Erkennung arbeitet jetzt wie die bekannten Buff-Tracker - jede NPC-GUID trägt ihren Spawn-Shard, der Diskriminator-Key kombiniert instanceID und zoneUID (welches Feld den Layer trägt variiert je nach Client), Keys werden pro Zone und Realm gemerkt und sortiert nummeriert, sodass „Layer 2" dasselbe bedeutet wie bei den Addons deiner Freunde. Die Erkennung ist auch passiv: Combat-Log-GUIDs und Nameplates füttern sie ohne NPC-Anvisieren, und nach Gruppenbeitritt oder Zonenwechsel wird neu erkannt
- **Gold-Datatext flackert nicht mehr**: die 5-Sekunden-Rotation zwischen aktuellem Gold, Sitzung und Monat ist standardmäßig aus - der Slot zeigt immer den aktuellen Betrag, und die längeren Label-Phasen kürzen nicht mehr ab. Die Rotation lässt sich unter Datatexte (`goldRotate`) wieder einschalten
- **Lesbarkeit des Installer-Texts**: eine dezente Abdunklung liegt hinter dem Inhaltsbereich, damit der Text nicht mehr in die helle Spielwelt hinter dem durchscheinenden Fenster verläuft
