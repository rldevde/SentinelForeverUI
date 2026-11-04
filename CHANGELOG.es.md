# Registro de cambios

[English](CHANGELOG.md) | [Deutsch](CHANGELOG.de.md) | [Français](CHANGELOG.fr.md) | **Español** | [Italiano](CHANGELOG.it.md) | [Português](CHANGELOG.pt.md) | [Русский](CHANGELOG.ru.md) | [한국어](CHANGELOG.ko.md) | [简体中文](CHANGELOG.zh-CN.md) | [繁體中文](CHANGELOG.zh-TW.md)

Todos los cambios notables de SentinelForeverUI se documentan aquí.
El formato sigue [Keep a Changelog](https://keepachangelog.com/es/1.1.0/).

## [1.5.5] - 2026-11-04

### Añadido

- **Sección propia en la lista de addons**: el addon aparece ahora bajo un grupo `Sentinel` plegable con descripción localizada para los diez idiomas de cliente y una entrada en el Addon Compartment (clic izquierdo: opciones, clic derecho: anclas)
- **Listo para WoW Forever**: el TOC declara ahora la interfaz `16001` (`Interface-Camelot`) y `S.isForever` detecta el cliente Camelot (constante de proyecto o rango de build 160xx); Forever usa la base de código retail 12.x, por lo que `isRetail` lo cubre automáticamente - las guardas de valores secretos y la capa de compatibilidad de auras ya aplican
- **API de desarrollador** (`_G.SentinelUI_API` / `API.md`): los addons externos pueden aplicar las skins y plantillas Sentinel a sus propios marcos y widgets, leer ajustes y la capa actual, y registrar traducciones para cada idioma de cliente mediante `AddLocaleStrings`/`AddLocales`
- **Todos los idiomas de cliente soportados**: nuevos archivos de localización para frFR, esES + esMX, itIT, ptBR, ruRU, koKR, zhCN y zhTW con traducciones de los textos visibles (páginas de opciones, instalador, textos de datos, BugFolder); lo no traducido recurre al inglés mediante la metatabla de localización
- **Módulo BugFolder** (`/sbug`, `/sbugs`, `/suibug`): reemplazo interno de BugGrabber + BugSack - captura cada error Lua de todos los addons (incluidos errores de carga), los deduplica y conserva traza y locales. Ventana estilo Sentinel con pestañas Todos/Sesión/Anterior, búsqueda, navegación, borrado, informe por error y exportación de texto. Botón de minimapa: clic abre el saco, clic derecho ajustes, Mayús+clic recarga, Alt+clic borrado. Otros addons siguen funcionando vía la global compatible (`BugGrabber:GetDB()`); si el verdadero !BugGrabber está instalado, BugFolder refleja su base

### Cambiado

- **Pantalla AFK**: también se cierra con movimiento del ratón, clics y rueda - no solo ESC o moverse
- **Nuevo logo en todas partes**: el león del nuevo logo es ahora el icono del addon (lista de addons, botón de minimapa, cabecera de opciones) y el banner completo de Sentinel Forever se muestra en la página de inicio de opciones y arriba de la pantalla AFK; la barra lateral del instalador usa el león nítido con la marca de texto
- **Tema actualizado a la paleta del logo**: el fondo es un azul marino más profundo y los bordes un azul acero, a juego con el fondo del banner; el borde superior de la ventana de opciones muestra un degradado de oro a azur como el logo

### Corregido

- **Recolección de botones del minimapa**: un solo marco con error abortaba todo el barrido y no aparecía ningún botón externo - cada candidato se recoge ahora con pcall, también se escanean marcos compañeros (MinimapBackdrop/MinimapCluster/MinimapPanel) y los objetos LDB se recogen por defecto (migración `grabLDB`)
- **La detección de capa funciona**: el texto de datos Layer se quedaba en «?» porque leía el campo GUID equivocado y referenciaba un módulo que aquí no existe. La detección ahora funciona como los trackers de beneficios conocidos - cada GUID de PNJ lleva su shard de aparición, la clave discriminante combina instanceID y zoneUID (qué campo lleva la capa varía por cliente), las claves se recuerdan por zona y reino y se numeran en orden ordenado, de modo que «Layer 2» significa lo mismo que en los addons de tus amigos. La detección también es pasiva: los GUID del registro de combate y las placas de nombre la alimentan sin seleccionar un PNJ, y se redetecta tras unirse a un grupo o cambiar de zona
- **El texto de datos Oro ya no parpadea**: la rotación de 5 segundos entre oro actual, sesión y mes está desactivada por defecto - el espacio siempre muestra la cantidad actual y las fases con etiquetas largas ya no se truncan. La rotación puede reactivarse en Textos de datos (`goldRotate`)
- **Legibilidad del texto del instalador**: un suave oscurecimiento queda detrás del área de contenido para que el texto no se funda con el mundo brillante tras la ventana translúcida
