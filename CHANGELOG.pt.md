# Registro de alterações

[English](CHANGELOG.md) | [Deutsch](CHANGELOG.de.md) | [Français](CHANGELOG.fr.md) | [Español](CHANGELOG.es.md) | [Italiano](CHANGELOG.it.md) | **Português** | [Русский](CHANGELOG.ru.md) | [한국어](CHANGELOG.ko.md) | [简体中文](CHANGELOG.zh-CN.md) | [繁體中文](CHANGELOG.zh-TW.md)

Todas as alterações notáveis do SentinelForeverUI estão documentadas aqui.
O formato segue [Keep a Changelog](https://keepachangelog.com/pt-BR/1.1.0/).

## [1.5.5] - 2026-11-04

### Adicionado

- **Seção própria na lista de addons**: o addon agora fica sob um grupo `Sentinel` recolhível com descrição localizada para os dez idiomas de cliente e uma entrada no Addon Compartment (clique esquerdo: opções, clique direito: âncoras)
- **Pronto para WoW Forever**: o TOC agora declara a interface `16001` (`Interface-Camelot`) e `S.isForever` detecta o cliente Camelot (constante de projeto ou faixa de build 160xx); Forever roda a codebase retail 12.x, então `isRetail` o cobre automaticamente - guardas de valores secretos e camada de compatibilidade de auras já valem
- **API de desenvolvedor** (`_G.SentinelUI_API` / `API.md`): addons externos podem aplicar skins e templates Sentinel aos próprios quadros e widgets, ler configurações e a camada atual, e registrar traduções para cada idioma de cliente via `AddLocaleStrings`/`AddLocales`
- **Todos os idiomas de cliente suportados**: novos arquivos de localização para frFR, esES + esMX, itIT, ptBR, ruRU, koKR, zhCN e zhTW com traduções dos textos visíveis (páginas de opções, instalador, textos de dados, BugFolder); o resto recai no inglês via metatable de localização
- **Módulo BugFolder** (`/sbug`, `/sbugs`, `/suibug`): substituto interno do BugGrabber + BugSack - captura cada erro Lua de todos os addons (erros de carregamento incluídos), deduplica e guarda stack e locais. Janela estilo Sentinel com abas Todos/Sessão/Anterior, busca, navegação, limpeza, relatório por erro e exportação de texto. Botão do minimapa: clique abre o saco, clique direito configurações, Shift+clique recarga, Alt+clique limpeza. Outros addons seguem funcionando via global compatível (`BugGrabber:GetDB()`); se o !BugGrabber real estiver instalado, o BugFolder espelha o banco dele

### Alterado

- **Tela AFK**: agora também fecha com movimento do mouse, cliques e roda - não só ESC ou andar
- **Novo logo em tudo**: o leão do novo logo agora é o ícone do addon (lista de addons, botão do minimapa, cabeçalho das opções) e o banner completo do Sentinel Forever aparece na página inicial das opções e no topo da tela AFK; a barra lateral do instalador usa o leão nítido com a marca
- **Tema atualizado para a paleta do logo**: o fundo é um azul-marinho mais profundo e as bordas um azul-aço, combinando com o fundo do banner; a borda superior da janela de opções mostra um gradiente de ouro para azur como o logo

### Corrigido

- **Coleta de botões do minimapa**: um único frame com erro abortava toda a varredura e nenhum botão externo aparecia - cada candidato agora é coletado com pcall, frames companheiros (MinimapBackdrop/MinimapCluster/MinimapPanel) também são escaneados e objetos LDB são coletados por padrão (migração `grabLDB`)
- **A detecção de camada funciona**: o texto de dados Layer ficava em «?» porque lia o campo GUID errado e referenciava um módulo que aqui não existe. A detecção agora funciona como os trackers de bônus conhecidos - cada GUID de NPC carrega seu shard de spawn, a chave discriminante combina instanceID e zoneUID (qual campo carrega a camada varia por cliente), as chaves são lembradas por zona e reino e numeradas em ordem ordenada, de modo que «Layer 2» significa o mesmo que nos addons dos amigos. A detecção também é passiva: GUIDs do registro de combate e placas de nome a alimentam sem selecionar NPC, e ela redetecta após entrar em grupo ou mudar de zona
- **O texto de dados Ouro não pisca mais**: a rotação de 5 segundos entre ouro atual, sessão e mês está desativada por padrão - o espaço sempre mostra a quantia atual e as fases com rótulos longos não são mais truncadas. A rotação pode ser reativada em Textos de dados (`goldRotate`)
- **Legibilidade do texto do instalador**: um leve escurecimento fica atrás da área de conteúdo para que o texto não se misture mais ao mundo claro atrás da janela translúcida
