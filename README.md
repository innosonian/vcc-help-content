# vcc-help-content

Localized help content(Terms Info) for the VCC app, served via WebView.
VCC 앱 내 WebView로 제공되는 다국어 도움말(용어 설명) 콘텐츠 저장소입니다.

---

## Purpose / 목적

This repository manages multilingual markdown content (CPR Score, CPR Metrics terminology and definitions) displayed inside the VCC app through a WebView. The app detects the device locale and loads the corresponding language file at runtime.

VCC 앱이 기기 언어 설정을 감지하여 해당 언어의 마크다운 파일을 WebView로 로드합니다. 이 저장소는 CPR Score 및 CPR Metrics 용어 정의 콘텐츠를 언어별로 관리합니다.

---

## Supported Languages / 지원 언어

| File | Language |
|---|---|
| `en.md` | English (US) |
| `de.md` | German / 독일어 |
| `es.md` | Spanish / 스페인어 |
| `es-419.md` | Spanish (Latin America) / 스페인어 (라틴아메리카) |
| `fr.md` | French / 프랑스어 |
| `it.md` | Italian / 이탈리아어 |
| `ja.md` | Japanese / 일본어 |
| `ru.md` | Russian / 러시아어 |
| `zh-Hans.md` | Chinese Simplified / 중국어 (간체) |
| `zh-Hant.md` | Chinese Traditional / 중국어 (번체) |

---

## Repository Structure / 구조

```
HelpContent/
├── en.md
├── de.md
├── es.md
├── es-419.md
├── fr.md
├── it.md
├── ja.md
├── ru.md
├── zh-Hans.md
└── zh-Hant.md
```

---

## Access & Permissions / 편집 권한

> ⚠️ Content changes are restricted to designated team members only.
> 콘텐츠 수정은 지정된 팀원만 가능합니다.

If you need to request a content update, contact the team member responsible for this repository.
수정이 필요한 경우, 담당 팀원에게 요청하세요.

---

## Editing Guidelines / 편집 시 주의사항

- `en.md` is the **source of truth**. All other language files must reflect the same structure and content.
  `en.md`가 **원본 기준**입니다. 모든 언어 파일은 영어 버전과 동일한 구조를 유지해야 합니다.

- When updating `en.md`, the corresponding sections in all other language files must be updated in the same PR.
  `en.md` 수정 시, 동일 PR에서 모든 언어 파일의 해당 항목도 함께 업데이트해야 합니다.

- Do **not** change the table structure (column order, column count). The app rendering depends on consistent markdown table formatting.
  테이블 구조(컬럼 순서, 컬럼 수)를 **변경하지 마세요**. 앱 렌더링이 마크다운 테이블 포맷에 직접 의존합니다.

- Medical terminology must follow regional guidelines (AHA / ERC / ARC). Do not translate clinical terms loosely.
  의학 용어는 각 지역 가이드라인(AHA / ERC / ARC) 기준을 따릅니다. 임상 용어를 임의로 번역하지 마세요.

- File names must match locale codes exactly (e.g., `zh-Hans.md`, not `zh-hans.md`). The app maps device locale codes directly to file names.
  파일명은 locale 코드와 대소문자까지 정확히 일치해야 합니다. 앱이 기기 locale 코드를 파일명에 직접 매핑합니다.

---

## How to Contribute / 기여 방법

1. Create a branch from `main` / `main`에서 브랜치 생성
2. Make changes to the relevant language file(s) / 해당 언어 파일 수정
3. Open a PR with a clear description of what changed and why / 변경 내용과 이유를 명시하여 PR 생성
4. PRs must be reviewed and approved by a designated team member before merging / 지정된 팀원의 리뷰 및 승인 후 머지 가능

---

## Notes / 참고

- This repository contains **content only** — no application code.
  이 저장소는 **콘텐츠 전용**입니다. 앱 코드는 포함되지 않습니다.
- Merging to `main` triggers the build and publish pipeline.
  `main` 브랜치에 머지되면 자동으로 빌드 및 배포가 실행됩니다.
