# Journal des modifications

[English](CHANGELOG.md) | [Deutsch](CHANGELOG.de.md) | **Français** | [Español](CHANGELOG.es.md) | [Italiano](CHANGELOG.it.md) | [Português](CHANGELOG.pt.md) | [Русский](CHANGELOG.ru.md) | [한국어](CHANGELOG.ko.md) | [简体中文](CHANGELOG.zh-CN.md) | [繁體中文](CHANGELOG.zh-TW.md)

Toutes les modifications notables de SentinelForeverUI sont documentées ici.
Le format suit [Keep a Changelog](https://keepachangelog.com/fr/1.1.0/).

## [1.5.5] - 2026-11-04

### Ajouté

- **Section dédiée dans la liste d'addons** : l'addon apparaît désormais sous un groupe `Sentinel` repliable avec description localisée pour les dix langues client et une entrée Addon Compartment (clic gauche : options, clic droit : ancrages)
- **Prêt pour WoW Forever** : le TOC déclare désormais l'interface `16001` (`Interface-Camelot`) et `S.isForever` détecte le client Camelot (constante de projet ou plage de build 160xx) ; Forever fonctionne sur la base de code retail 12.x, donc `isRetail` le couvre automatiquement - les gardes de valeurs secrètes et la couche de compatibilité des auras s'appliquent déjà
- **API développeur** (`_G.SentinelUI_API` / `API.md`) : les addons externes peuvent appliquer les skins et gabarits Sentinel à leurs propres cadres et widgets, lire les réglages et la couche actuelle, et enregistrer des traductions pour chaque langue client via `AddLocaleStrings`/`AddLocales`
- **Toutes les langues client prises en charge** : nouveaux fichiers de locale pour frFR, esES + esMX, itIT, ptBR, ruRU, koKR, zhCN et zhTW avec traductions des textes visibles (pages d'options, installeur, textes de données, BugFolder) ; le reste retombe sur l'anglais via la métatable de locale
- **Module BugFolder** (`/sbug`, `/sbugs`, `/suibug`) : remplacement interne de BugGrabber + BugSack - capture chaque erreur Lua de tous les addons (erreurs de chargement incluses), les déduplique et conserve pile et variables locales. Fenêtre style Sentinel avec onglets Tout/Session/Précédente, recherche, navigation, effacement, rapport bugtracker par erreur et export texte. Bouton minicarte : clic ouvre le sac, clic droit réglages, Maj+clic rechargement, Alt+clic effacement. Les autres addons continuent via la globale compatible (`BugGrabber:GetDB()`); si le vrai !BugGrabber est installé, BugFolder reflète sa base

### Modifié

- **Nouveau logo partout** : le lion du nouveau logo est désormais l'icône de l'addon (liste d'addons, bouton minicarte, en-tête des options) et la bannière Sentinel Forever complète s'affiche sur la page d'accueil des options et en haut de l'écran AFK ; la barre latérale de l'installeur utilise le lion net avec le mot-symbole
- **Thème aligné sur la palette du logo** : le fond est un bleu marine plus profond et les bordures un bleu acier, assortis au fond de la bannière ; le bord supérieur de la fenêtre d'options affiche un dégradé or vers azur comme le logo

### Corrigé

- **Détection de couche fonctionnelle** : le texte de données Layer restait sur « ? » car il lisait le mauvais champ du GUID et référençait un module inexistant ici. La détection fonctionne désormais comme les trackers de buffs connus - chaque GUID de PNJ porte son shard d'apparition, la clé discriminante combine instanceID et zoneUID (le champ porteur varie selon le client), les clés sont mémorisées par zone et royaume et numérotées dans l'ordre trié, si bien que « Layer 2 » signifie la même chose que chez les addons de vos amis. La détection est aussi passive : les GUID du journal de combat et les plaques de nom l'alimentent sans cibler de PNJ, et elle se redétecte après un regroupement ou un changement de zone
- **Le texte de données Or ne clignote plus** : la rotation de 5 secondes entre or actuel, session et mois est désactivée par défaut - l'emplacement affiche toujours le montant actuel et les phases aux libellés longs ne se tronquent plus. La rotation peut être réactivée sous Textes de données (`goldRotate`)
- **Lisibilité du texte de l'installeur** : un voile sombre discret se trouve derrière la zone de contenu pour que le texte ne se fonde plus dans le monde lumineux derrière la fenêtre translucide
