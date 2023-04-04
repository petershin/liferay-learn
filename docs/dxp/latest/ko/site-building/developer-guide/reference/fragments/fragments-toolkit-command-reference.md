---
uuid: afe56739-fa42-4145-a09a-24c56a0b9ec8
---

# Fragments Toolkit 명령 참조

[Fragments Toolkit](../../developing-page-fragments/using-the-fragments-toolkit.md) 현재 실행 중인 Liferay DXP 인스턴스에 연결하여 조각을 가져오고 내보낼 수 있습니다. 포털로 자동으로 가져온 툴킷으로 생성한 조각을 가질 수도 있습니다. 다음 명령을 사용할 수 있습니다.

<!-- TODO: The description for `npm run preview` is probably too long, it's overrunning the column width into a new table cell when the site is built. Probably should consider adding an asterisk and adding the version specific info separately after the table. -->

| 명령                                 | 묘사                                                                                                                                                                                                                                 |
|:---------------------------------- |:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `npm run add-collection`           | 조각을 구성할 새 컬렉션을 만듭니다. 플랫폼에서 단편 세트라고 합니다.                                                                                                                                                                                            |
| `npm run add-fragment`             | 새 컬렉션이나 기존 컬렉션에 구성 요소, 입력 또는 React 조각을 추가합니다.                                                                                                                                                                                      |
| `npm run add-fragment-composition` | 새 컬렉션 또는 기존 컬렉션에 새 조각 구성을 추가합니다.                                                                                                                                                                                                   |
| `npm run add-page-template`        | 새 표시 페이지 템플릿, 페이지 템플릿 또는 마스터 페이지를 만듭니다.                                                                                                                                                                                            |
| `npm run build`                    | `fragment.json`의 `cssPath` 키에 지정된 `.sass` 또는 `.scss` 파일을 컴파일하고 컴파일된 CSS 코드를 `build/liferay-fragments`에 저장합니다. 컴파일된 CSS만 저장되고 SCSS는 데이터베이스에 저장되지 않습니다. 외부 프래그먼트는 외부 저장소에 저장해야 합니다.                                                  |
| `npm run compress`                 | Portal로 수동으로 가져올 수 있는 `.zip` 파일을 만듭니다.                                                                                                                                                                                             |
| `npm run export`                   | 실행 중인 서버에서 컬렉션 및 조각 가져오기                                                                                                                                                                                                           |
| `npm run import`                   | 현재 프로젝트의 컬렉션과 조각을 실행 중인 서버로 보냅니다. Fragment의 구성 JSON(사용 가능한 경우)이 잘못된 경우 가져오기가 실패하고 오류 메시지가 표시됩니다.                                                                                                                                   |
| `npm run import:watch`             | 컬렉션 및 조각이 생성되거나 수정되면 자동으로 포털로 가져옵니다.                                                                                                                                                                                               |
| `npm run preview`                  | 가져오기 전에 조각을 미리 봅니다. 프래그먼트에 대한 변경 사항은 자동으로 다시 로드되어 업데이트를 표시합니다. 이 기능은 Liferay DXP 7.2 SP1+ 및 Liferay Portal 7.2 GA2+에서 사용할 수 있으며 포털 인스턴스에 [OAuth 2](https://web.liferay.com/marketplace/-/mp/application/109571986) 플러그인을 설치해야 합니다. |

```{note}
Fragment Set 프로젝트의 `package.json`에 있는 `scripts` 섹션에서 사용 가능한 모든 작업을 볼 수 있습니다.
```

이러한 도구를 사용하여 로컬 환경의 명령줄에서 페이지 조각 생성 및 편집을 효율적으로 관리할 수 있습니다.
