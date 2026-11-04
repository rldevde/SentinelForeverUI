# 변경 로그

[English](CHANGELOG.md) | [Deutsch](CHANGELOG.de.md) | [Français](CHANGELOG.fr.md) | [Español](CHANGELOG.es.md) | [Italiano](CHANGELOG.it.md) | [Português](CHANGELOG.pt.md) | [Русский](CHANGELOG.ru.md) | **한국어** | [简体中文](CHANGELOG.zh-CN.md) | [繁體中文](CHANGELOG.zh-TW.md)

SentinelForeverUI의 모든 주요 변경 사항이 여기에 기록됩니다.
형식은 [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)를 따릅니다.

## [1.5.5] - 2026-11-04

### 추가됨

- **애드온 목록 전용 섹션**: 이제 애드온이 접을 수 있는 `Sentinel` 그룹 아래에 표시되며, 열 개 클라이언트 언어의 설명과 Addon Compartment 항목을 지원합니다 (좌클릭: 옵션, 우클릭: 이동)
- **WoW Forever 지원 준비**: TOC가 이제 인터페이스 `16001`(`Interface-Camelot`)을 선언하고 `S.isForever`가 Camelot 클라이언트를 감지합니다(프로젝트 상수 또는 160xx 빌드 범위); Forever는 retail 12.x 코드베이스에서 실행되므로 `isRetail`이 자동으로 적용됩니다 - 비밀 값 가드와 오라 호환 계층이 이미 적용됩니다
- **개발자 API**(`_G.SentinelUI_API` / `API.md`): 외부 애드온이 자체 프레임과 위젯에 Sentinel 스킨과 템플릿을 적용하고, 설정과 현재 레이어를 읽고, `AddLocaleStrings`/`AddLocales`로 모든 클라이언트 언어의 번역을 등록할 수 있습니다
- **모든 클라이언트 언어 지원**: frFR, esES + esMX, itIT, ptBR, ruRU, koKR, zhCN, zhTW용 새 로케일 파일과 눈에 보이는 UI 문자열(옵션 페이지, 설치 마법사, 데이터 문자, BugFolder) 번역 제공; 번역되지 않은 부분은 로케일 메타테이블로 영어에 폴백합니다
- **BugFolder 모듈**(`/sbug`, `/sbugs`, `/suibug`): 내부 BugGrabber + BugSack 대체 - 모든 애드온의 Lua 오류(로드 오류 포함)를 캡처하고 중복을 제거하며 스택과 로컬을 보존합니다. 전체/세션/이전 탭, 검색, 탐색, 삭제, 오류별 버그 리포트, 텍스트 내보내기가 있는 Sentinel 스타일 창. 미니맵 버튼: 클릭 자루 열기, 우클릭 설정, Shift+클릭 재시작, Alt+클릭 삭제. 다른 애드온은 호환 전역(`BugGrabber:GetDB()`)으로 계속 작동; 진짜 !BugGrabber가 설치되면 BugFolder가 그 데이터베이스를 미러링합니다

### 변경됨

- **AFK 화면**: 이제 ESC나 이동 외에 마우스 움직임, 클릭, 휠로도 닫힙니다
- **새 로고 전면 적용**: 새 로고의 사자 문양이 애드온 아이콘(애드온 목록, 미니맵 버튼, 옵션 헤더)이 되었고, 전체 Sentinel Forever 배너가 옵션 시작 페이지와 AFK 화면 상단에 표시됩니다; 설치 마법사 사이드바는 선명한 사자 마크와 워드마크를 사용합니다
- **로고 팔레트로 테마 업데이트**: 배경은 더 깊은 남색, 테두리는 스틸 블루로 배너 배경과 어울립니다; 옵션 창 상단 가장자리는 로고처럼 금색에서 하늘색으로 이어지는 그라데이션입니다

### 수정됨

- **레이어 감지 작동**: Layer 데이터 문자가 잘못된 GUID 필드를 읽고 여기에 없는 모듈을 참조해 «?»로 남아 있었습니다. 이제 알려진 버프 트래커처럼 작동합니다 - 모든 NPC GUID가 스폰 샤드를 담고, 식별 키는 instanceID와 zoneUID를 결합합니다(어떤 필드가 레이어를 담는지는 클라이언트에 따라 다름), 키는 지역과 서버별로 기억되어 정렬 순서로 번호가 매겨지므로 «Layer 2»가 친구들의 애드온이 보고하는 것과 같은 의미입니다. 감지는 수동적이기도 합니다: 전투 로그 GUID와 이름표가 NPC를 선택하지 않아도 공급하며, 그룹 참가나 지역 변경 후 다시 감지합니다
- **골드 데이터 문자 깜빡임 해결**: 현재 골드, 세션, 이번 달 사이 5초 순환이 기본적으로 꺼집니다 - 슬롯은 항상 현재 금액을 표시하고 긴 라벨 단계가 더 이상 잘리지 않습니다. 데이터 문자(`goldRotate`)에서 순환을 다시 켤 수 있습니다
- **설치 마법사 텍스트 가독성**: 콘텐츠 영역 뒤에 부드러운 어둡기가 있어 텍스트가 반투명 창 뒤의 밝은 세계에 더 이상 섞이지 않습니다
