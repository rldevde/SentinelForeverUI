# Registro delle modifiche

[English](CHANGELOG.md) | [Deutsch](CHANGELOG.de.md) | [Français](CHANGELOG.fr.md) | [Español](CHANGELOG.es.md) | **Italiano** | [Português](CHANGELOG.pt.md) | [Русский](CHANGELOG.ru.md) | [한국어](CHANGELOG.ko.md) | [简体中文](CHANGELOG.zh-CN.md) | [繁體中文](CHANGELOG.zh-TW.md)

Tutte le modifiche rilevanti di SentinelForeverUI sono documentate qui.
Il formato segue [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [1.5.5] - 2026-11-04

### Aggiunto

- **Sezione dedicata nella lista addon**: l'addon appare ora sotto un gruppo `Sentinel` comprimibile con descrizione localizzata per tutte le dieci lingue client e una voce Addon Compartment (clic sinistro: opzioni, clic destro: ancore)
- **Pronto per WoW Forever**: il TOC dichiara ora l'interfaccia `16001` (`Interface-Camelot`) e `S.isForever` rileva il client Camelot (costante di progetto o range build 160xx); Forever gira sulla codebase retail 12.x, quindi `isRetail` lo copre automaticamente - guardie dei valori segreti e layer di compatibilità aure già attivi
- **API per sviluppatori** (`_G.SentinelUI_API` / `API.md`): gli addon esterni possono applicare skin e template Sentinel ai propri frame e widget, leggere impostazioni e strato attuale, e registrare traduzioni per ogni lingua client tramite `AddLocaleStrings`/`AddLocales`
- **Tutte le lingue client supportate**: nuovi file locale per frFR, esES + esMX, itIT, ptBR, ruRU, koKR, zhCN e zhTW con traduzioni dei testi visibili (pagine opzioni, installer, testi dati, BugFolder); il resto ripiega sull'inglese tramite la metatable locale
- **Modulo BugFolder** (`/sbug`, `/sbugs`, `/suibug`): sostituto interno di BugGrabber + BugSack - cattura ogni errore Lua di tutti gli addon (errori di caricamento inclusi), li deduplica e conserva stack e locali. Finestra in stile Sentinel con schede Tutti/Sessione/Precedente, ricerca, navigazione, wipe, report bugtracker per errore ed export testuale. Pulsante minimappa: clic apre il sacco, clic destro impostazioni, Maiusc+clic ricarica, Alt+clic wipe. Gli altri addon continuano via la globale compatibile (`BugGrabber:GetDB()`); se il vero !BugGrabber è installato, BugFolder ne riflette il database

### Modificato

- **Schermo AFK**: si chiude anche con movimento del mouse, clic e rotellina - non solo ESC o il movimento
- **Nuovo logo ovunque**: il leone del nuovo logo è ora l'icona dell'addon (lista addon, pulsante minimappa, header opzioni) e il banner completo Sentinel Forever compare nella pagina iniziale delle opzioni e in cima alla schermata AFK; la barra laterale dell'installer usa il leone nitido con il marchio
- **Tema aggiornato alla palette del logo**: lo sfondo è un blu navy più profondo e i bordi un blu acciaio, in linea con lo sfondo del banner; il bordo superiore della finestra opzioni mostra un gradiente da oro ad azzurro come il logo

### Corretto

- **Il rilevamento dello strato funziona**: il testo dati Layer restava su «?» perché leggeva il campo GUID sbagliato e faceva riferimento a un modulo qui inesistente. Il rilevamento ora funziona come i noti tracker dei benefici - ogni GUID di PNG porta il suo shard di spawn, la chiave discriminante combina instanceID e zoneUID (quale campo porta lo strato varia per client), le chiavi vengono ricordate per zona e reame e numerate in ordine ordinato, così «Layer 2» significa la stessa cosa degli addon degli amici. Il rilevamento è anche passivo: i GUID del combat log e le targhette lo alimentano senza selezionare un PNG, e si rileva di nuovo dopo l'ingresso in gruppo o il cambio di zona
- **Il testo dati Oro non lampeggia più**: la rotazione di 5 secondi tra oro attuale, sessione e mese è disattivata per impostazione predefinita - lo slot mostra sempre l'importo attuale e le fasi con etichette lunghe non vengono più troncate. La rotazione è riattivabile in Testi dati (`goldRotate`)
- **Leggibilità del testo dell'installer**: una leggera velatura sta dietro l'area contenuto così il testo non si fonde più con il mondo luminoso dietro la finestra traslucida
