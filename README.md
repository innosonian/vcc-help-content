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
| `en(only_for_hstm).md` | English (US, HSTM only) / 영어 (미국, HSTM 전용) |
| `de.md` | German / 독일어 |
| `es.md` | Spanish / 스페인어 |
| `es-419.md` | Spanish (Latin America) / 스페인어 (라틴아메리카) |
| `fr.md` | French / 프랑스어 |
| `it.md` | Italian / 이탈리아어 |
| `ja.md` | Japanese / 일본어 |
| `ko.md` | Korean / 한국어 |
| `ru.md` | Russian / 러시아어 |
| `zh-Hans.md` | Chinese Simplified / 중국어 (간체) |
| `zh-Hant.md` | Chinese Traditional / 중국어 (번체) |

---

## Repository Structure / 구조

```
HelpContent/
├── en.md
├── en.html            ← auto-generated / 자동 생성
├── en(only_for_hstm).md
├── en(only_for_hstm).html  ← auto-generated / 자동 생성
├── de.md
├── de.html            ← auto-generated / 자동 생성
├── es.md
├── es.html            ← auto-generated / 자동 생성
├── es-419.md
├── es-419.html        ← auto-generated / 자동 생성
├── fr.md
├── fr.html            ← auto-generated / 자동 생성
├── it.md
├── it.html            ← auto-generated / 자동 생성
├── ja.md
├── ja.html            ← auto-generated / 자동 생성
├── ko.md
├── ko.html            ← auto-generated / 자동 생성
├── ru.md
├── ru.html            ← auto-generated / 자동 생성
├── zh-Hans.md
├── zh-Hans.html       ← auto-generated / 자동 생성
├── zh-Hant.md
└── zh-Hant.html       ← auto-generated / 자동 생성
scripts/
├── pre-commit         ← HTML 생성 로직
├── setup-hooks.sh     ← 최초 세팅 스크립트
└── help-style.css     ← HTML 스타일 (Apple HIG 기반)
.githooks/
└── pre-commit         ← Git이 직접 실행하는 tracked hook
package.json
package-lock.json       ← local dev dependency lockfile
```

`.html` files are automatically generated from `.md` files via a Git pre-commit hook. The hook checks staged markdown/CSS changes and regenerates the matching `.html` files. Do not edit `.html` files directly.
`.html` 파일은 Git pre-commit hook에 의해 `.md`로부터 자동 생성됩니다. 이 hook은 stage된 markdown/CSS 변경을 기준으로 대응하는 `.html` 파일을 다시 생성합니다. `.html` 파일을 직접 편집하지 마세요.

---

## How It Works / 동작 방식

The VCC app opens a WebView pointing to the GitHub Pages URL for the detected locale. Content is authored in markdown and automatically converted to styled HTML on commit.

VCC 앱은 기기 locale에 맞는 GitHub Pages URL을 WebView로 열어 콘텐츠를 표시합니다. 콘텐츠는 마크다운으로 작성되며, 커밋 시 `help-style.css`가 적용된 HTML로 자동 변환됩니다.

```
.md 파일 수정
    ↓
git add / git commit
    ↓ pre-commit hook 자동 실행
    ├── .html 파일이 없으면 새로 생성
    ├── stage된 .md 변경분만 대응 .html로 재변환
    ├── help-style.css가 변경되면 전체 .html 재변환
    ├── help-style.css 스타일 주입
    └── 생성된 .html 자동 스테이징
    ↓
커밋에 .md + .html 함께 포함
    ↓
git push → GitHub Pages에 자동 반영
    ↓
앱 WebView에서 표시
```

**GitHub Pages URL:**
```
https://innosonian.github.io/vcc-help-content/HelpContent/{langCode}.html
```

For special-purpose files that are not locale-mapped, use the exact file name directly.
locale 매핑 대상이 아닌 특수 목적 파일은 locale 코드 대신 파일명을 그대로 사용합니다.

Example / 예시:
```
https://innosonian.github.io/vcc-help-content/HelpContent/en(only_for_hstm).html
```

---

## Initial Setup / 최초 세팅

> ⚠️ Every contributor must complete this setup once after cloning the repository.
> 레포지토리를 클론한 후 모든 기여자는 아래 세팅을 **반드시 1회 실행**해야 합니다.

### 1. Install dependencies / 의존성 설치

레포지토리 루트 경로에서 아래 명령어를 실행하세요.

```bash
npm install
```

설치 후 아래 명령어로 `marked`가 준비되었는지 확인하세요.

```bash
./node_modules/.bin/marked --version
```

이 저장소의 hook은 `node_modules/.bin/marked`를 우선 사용하며, 필요하면 전역 `marked`도 사용할 수 있습니다.
This repository hook prefers `node_modules/.bin/marked` and can fall back to a global `marked` installation if needed.

### 2. Register Git hook / Git hook 등록

레포지토리 루트 경로에서 실행하세요.

```bash
sh scripts/setup-hooks.sh
```

아래 메시지가 나오면 성공입니다.

```
✅ Git hook installed successfully.
```

이 스크립트는 Git의 `core.hooksPath`를 이 저장소의 tracked hook 디렉터리인 `.githooks`로 설정합니다.
This script sets Git `core.hooksPath` to the repository-tracked `.githooks` directory.

### 3. Verify / 확인

```bash
git config --get core.hooksPath
```

출력값이 이 저장소의 `.githooks` 경로이면 정상입니다.

> ⚠️ `scripts/help-style.css` 파일이 반드시 존재해야 합니다. 이 파일이 없으면 커밋 시 HTML 변환이 실패합니다.
> `scripts/help-style.css` must exist in the repository. Without it, the HTML conversion will fail on commit.

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

- `en(only_for_hstm).md` is a special-purpose duplicate of `en.md` for HSTM-only use and must be kept in sync with `en.md`.
  `en(only_for_hstm).md`는 HSTM 전용으로 사용하는 `en.md`의 복제본이며, 항상 `en.md`와 동기화되어야 합니다.

- When updating `en.md`, the corresponding sections in all other language files must be updated in the same PR.
  `en.md` 수정 시, 동일 PR에서 모든 언어 파일의 해당 항목도 함께 업데이트해야 합니다.

- Do **not** edit `.html` files directly. They are auto-generated and will be overwritten on the next commit.
  `.html` 파일을 **직접 편집하지 마세요**. 자동 생성되며 다음 커밋 시 덮어씌워집니다.

- The pre-commit hook regenerates `.html` from staged `.md` changes, and regenerates all `.html` files when `scripts/help-style.css` changes.
  pre-commit hook은 stage된 `.md` 변경으로부터 대응 `.html`을 다시 생성하고, `scripts/help-style.css`가 변경되면 전체 `.html` 파일을 다시 생성합니다.

- Do **not** edit `scripts/help-style.css` unless intentionally updating the visual design for all languages at once.
  시각 디자인을 일괄 변경하려는 경우가 아니라면 `scripts/help-style.css`를 **임의로 수정하지 마세요**.

- Do **not** change the table structure (column order, column count). The app rendering depends on consistent markdown table formatting.
  테이블 구조(컬럼 순서, 컬럼 수)를 **변경하지 마세요**. 앱 렌더링이 마크다운 테이블 포맷에 직접 의존합니다.

- Medical terminology must follow regional guidelines (AHA / ERC / ARC). Do not translate clinical terms loosely.
  의학 용어는 각 지역 가이드라인(AHA / ERC / ARC) 기준을 따릅니다. 임상 용어를 임의로 번역하지 마세요.

- Locale-mapped file names must match locale codes exactly (e.g., `zh-Hans.md`, not `zh-hans.md`). The app maps device locale codes directly to those file names.
  locale 매핑 대상 파일명은 locale 코드와 대소문자까지 정확히 일치해야 합니다. 앱이 기기 locale 코드를 해당 파일명에 직접 매핑합니다.

- Non-locale special-purpose files must be explicitly documented in this README so their usage is clear.
  locale 매핑 대상이 아닌 특수 목적 파일은 사용 목적이 명확하도록 이 README에 반드시 문서화해야 합니다.

---

## How to Contribute / 기여 방법

1. Create a branch from `main` / `main`에서 브랜치 생성
2. Make changes to the relevant `.md` file(s) / 해당 언어 `.md` 파일 수정
3. Commit — `.html` files will be auto-generated / 커밋 시 `.html` 자동 생성됨
4. Open a PR with a clear description of what changed and why / 변경 내용과 이유를 명시하여 PR 생성
5. PRs must be reviewed and approved by a designated team member before merging / 지정된 팀원의 리뷰 및 승인 후 머지 가능

---

## Notes / 참고

- This repository contains **content only** — no application code.
  이 저장소는 **콘텐츠 전용**입니다. 앱 코드는 포함되지 않습니다.
- `.html` files in this repository are the files actually served to the app via WebView through GitHub Pages.
  앱 WebView에 실제로 서빙되는 파일은 GitHub Pages를 통해 제공되는 `.html`입니다.
- GitHub Pages is enabled on the `main` branch. Merging to `main` automatically reflects changes to the live URL.
  GitHub Pages는 `main` 브랜치에 활성화되어 있습니다. `main`에 머지되면 변경사항이 자동으로 반영됩니다.
