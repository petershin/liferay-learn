# Fragments Toolkit 명령 참조

[Fragments Toolkit](../../developing-page-fragments/using-the-fragments-toolkit.md) 은 현재 실행 중인 Liferay DXP 인스턴스에 연결하여 조각을 가져오고 내보낼 수 있습니다. 포털로 자동으로 가져온 툴킷으로 생성한 조각을 가질 수도 있습니다. 다음 명령을 사용할 수 있습니다.

<!-- TODO: The description for `npm run preview` is probably too long, it's overrunning the column width into a new table cell when the site is built. Probably should consider adding an asterisk and adding the version specific info separately after the table. -->

| 명령                     | 묘사                                                                                                                                                                           |
|:---------------------- |:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `npm run export`       | 실행 중인 서버에서 컬렉션 및 조각 가져오기                                                                                                                                                     |
| `npm run import`       | 현재 프로젝트의 컬렉션과 조각을 실행 중인 서버로 보냅니다. Fragment의 구성 JSON(사용 가능한 경우)이 잘못된 경우 가져오기가 실패하고 오류 메시지가 표시됩니다.                                                                             |
| `npm run import:watch` | 컬렉션 및 조각이 생성되거나 수정될 때 자동으로 포털로 가져오기                                                                                                                                          |
| `npm run preview`      | Fragment를 가져올 때 Fragment가 어떻게 보이는지 미리 봅니다. 이것은 Fragment를 가져오지 않고 지정된 Liferay 서버에서 렌더링합니다. 미리보기 중에 프래그먼트를 변경하면 변경 사항이 자동으로 다시 로드되어 업데이트를 빠르게 표시합니다. Liferay DXP에서 사용할 수 있습니다. |
 7.2 SP1+ 및 Liferay Portal 7.2 GA2+. 이 명령이 제대로 작동하려면 포털 인스턴스에 

[OAuth 2](https://web.liferay.com/marketplace/-/mp/application/109571986) 플러그인을 설치해야 합니다. | | `실행 압축` | 포털로 수동으로 가져올 수 있는 `.zip` 파일 만들기 |

```{note}
Fragment Set 프로젝트의 `package.json`에 있는 `scripts` 섹션에서 사용 가능한 모든 작업을 볼 수 있습니다.
```

이러한 도구를 마음대로 사용하면 로컬 환경의 명령줄에서 페이지 조각 생성 및 편집을 효율적으로 관리할 수 있습니다.
