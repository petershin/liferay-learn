# 기술 자료 문서 가져오기

{bdg-secondary}`liferay 7.4 U72+/GA72+`

기술 자료 문서 초안을 [Markdown](https://www.markdownguide.org/) 파일로 작성하여 Liferay로 가져올 수 있습니다. 이렇게 하려면 각 Markdown 파일의 형식이 적절하고 ZIP 아카이브로 패키지되어 있는지 확인해야 합니다. 가져온 기사는 자동으로 HTML로 변환되어 기술 자료 UI에 표시됩니다.

이렇게 하면 외부 도구를 사용하여 기사를 Liferay에 게시하기 전에 초안 작성, 호스팅 및 공동 작업을 수행할 수 있습니다.

```{note}
Markdown 기사를 가져오려면 *지식 베이스 > 기술 자료: 기사 가져오기* 권한이 있어야 합니다.
```

## 가져올 마크다운 파일 준비

기술 자료는 표 형식 지정, 이미지 캡션 및 각주와 같은 기능으로 기본 Markdown을 확장하는 [Multi-Markdown](https://fletcherpenney.net/multimarkdown) 방언을 지원합니다. 언어로서 Markdown은 읽기 쉽고 직관적이며 다재다능합니다. GitHub와 같은 서비스를 사용하면 귀하와 다른 사람들이 문서를 검토하고 공동 작업할 수 있습니다.

### 파일 요구 사항

Markdown 파일을 가져오려면 다음을 수행해야 합니다.

* ZIP 파일로 패키지되어야 합니다.
* `.md` 또는 `.markdown` 파일 확장자를 사용하세요.
* 기사 제목을 설정하려면 H1(예: `# Some Heading`)으로 시작하세요.
* 기사의 친숙한 URL을 설정하려면 H1 뒤에 고유 ID(예: `# Some Heading [](id=some-heading) ` )를 포함하세요.

예를 들어 'modern-pentathlon.md'라는 기사에는 다음 콘텐츠가 포함될 수 있습니다.

```markdown
# Modern Pentathlon [](id=modern-pentathlon) 

The modern pentathlon is a competition across five different sport disciplines.

Each athlete must compete in fencing, shooting, swimming, horseback riding, and running.
```

각 ZIP 파일에는 새 파일이나 수정된 파일이 얼마든지 포함될 수 있습니다.

### 선택적 구성

파일 이름에 숫자 접두어를 추가하여 가져올 때 기사 순서를 결정할 수 있습니다(예: `00-foo.md`, `01-bar.md`). 또한 확장자가 `.markdown`인 파일에 `-intro` 접미사를 추가하여 가져온 기사에 대한 상위/하위 계층을 생성할 수 있습니다.

예를 들어 `00-foo-intro.markdown`, `01-bar.markdown`, `02-goo.markdown` 파일이 동일한 폴더에 있는 시나리오를 생각해 보세요. 가져올 때 기사 순서 및 계층 구조는 다음과 같습니다.

```bash
└── Foo
    ├── Bar
    └── Goo
```

기사가 이미지를 참조하는 경우 해당 이미지를 ZIP 파일 루트의 `/images` 폴더에 추가하여 가져오기에 포함할 수 있습니다. 지원되는 첨부 파일 확장자는 `.bmp`, `.gif`, `.jpeg`, `.jpg` 및 `.png`입니다.

```{note}
이미지 리소스는 기사에서 참조되는 경우에만 가져옵니다. 그렇지 않으면 무시됩니다.
```

시스템 설정을 통해 기술 자료 가져오기 설정을 보고 구성할 수 있습니다. 자세한 내용은 [기술 자료 시스템 설정](knowledge-base-system-settings.md) 을 참조하세요.

### 소스 URL 설정

[GitHub](https://github.com) 과 같은 서비스에서 Markdown 파일을 호스팅하는 경우 저장소 사이트
를 지정하는 소스 URL을 설정할 수 있습니다. 이 기능을 사용하려면 먼저 [기술 자료 시스템 설정](knowledge-base-system-settings.md) 에서 소스 URL을 활성화하세요. 그런 다음 원하는 저장소의 기본 URL과 함께 `.METADATA` 파일을 ZIP 파일의 루트에 추가하세요. 가져오기 도구는 ZIP 아카이브의 각 파일 경로를 이 기본 URL에 추가하여 전체 소스 URL(`[기본 URL]/[기사 파일 경로]`)을 형성합니다.

예를 들어 다음 기본 URL이 포함된 시나리오를 생각해 보세요.

```
https://github.com/clarity/clarity-guide/blob/master/docs/latest/en
```

`folder-01/file.md`를 사용하여 ZIP 아카이브를 가져오는 경우 결과 소스 URL은 다음과 같습니다.

```
https://github.com/clarity/clarity-guide/blob/master/docs/latest/en/folder-01/file.md
```

## 마크다운 파일 가져오기

1. **사이트 메뉴**(![사이트 메뉴](../../images/icon-menu.png))를 열고 **콘텐츠 및 데이터** &rarr; **기술 자료** 로 이동합니다.

1. 아티클 및 폴더(![아티클 및 폴더](../../images/icon-pages-tree.png)) 섹션에서 원하는 폴더로 이동한 후 **추가**(![추가 버튼](../../images/icon-add.png))**가져오기** 를 선택합니다.

   ![Go to the desired folder, click Add, and select Import.](./importing-knowledge-base-articles/images/01.png)

   또는 원하는 폴더에 대해 **작업** 버튼(![작업 버튼](../../images/icon-actions.png))을 클릭하고 **가져오기** 를 선택합니다.

   ![Click the Actions button for the desired folder and select Import.](./importing-knowledge-base-articles/images/02.png)

1. **파일 선택** 을 클릭하고 원하는 ZIP 파일을 선택하세요.

   ![Upload your ZIP file.](./importing-knowledge-base-articles/images/03.png)

1. 활성화/비활성화 **기사 파일의 숫자 접두어를 우선순위로 적용합니다** . 이것은 기술 자료가 각 파일의 숫자 접두어를 사용하여 순서를 정하는지 여부를 결정합니다.

1. **저장** 을 클릭하세요.

저장되면 가져오기 도구는 각 파일의 Markdown을 HTML로 변환하고 결과 기사가 게시됩니다.

```{important}
가져온 기사는 워크플로 설정과 무관합니다. 이는 가져온 기사가 자동으로 승인됨을 의미합니다.
```

## 가져오기 프로세스 이해

시작되면 Markdown 임포터는 각 파일의 H1 및 ID가 기존 기술 자료 문서와 일치하는지 확인합니다. 일치하는 항목이 발견되면 가져오기 도구는 기존 기사의 콘텐츠를 바꿉니다. 일치하는 항목이 없으면 새 기사가 생성됩니다.

수입업자는 기사를 생성하고 업데이트만 합니다. 기존 기사는 삭제되지 않습니다. 기사를 수동으로 삭제해야 합니다.

```{tip}
파일의 숫자 접두사를 업데이트하여 Liferay에서 순서를 업데이트할 수 있습니다(예: `00-file.md`를 `01-file.md`로 변경).

기사의 헤더 ID를 업데이트하면 새로운 친숙한 URL을 사용하여 새 기사가 생성되며 기존 기사가 업데이트되거나 제거되지 않습니다.
```

## 관련 주제

* [기술 자료 문서 작성](./creating-knowledge-base-articles.md)
* [지식 베이스 관리](./managing-the-knowledge-base.md)
