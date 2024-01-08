# 기술 자료 관리

{bdg-secondary}`liferay 7.4 U72+/GA72+`

기술 자료를 사용하면 제품 문서의 초안을 신속하게 작성하고 최종 사용자가 탐색할 수 있는 계층 구조로 구성할 수 있습니다. 폴더와 중첩된 기사를 추가하여 원하는 구조와 순서를 만드세요. 또한 의도한 사용자만 콘텐츠에 액세스할 수 있도록 기사 및 폴더 권한을 관리하세요.

![Add folders and nested articles to create the desired structure and order.](./managing-the-knowledge-base/images/01.png)

## 폴더 추가

1. **사이트 메뉴**(![사이트 메뉴](../../images/icon-menu.png))를 열고 **콘텐츠 및 데이터** &rarr; **기술 자료** 로 이동합니다.

1. 폴더 및 아티클 섹션(![폴더 및 아티클](../../images/icon-pages-tree.png))에서 **추가**(![추가 버튼](../../images)를 클릭합니다. /icon-add.png))**폴더** 를 선택합니다.

1. 이름과 설명을 입력합니다.

1. 폴더의 권한을 구성합니다. 기본적으로 보기 권한은 게스트 역할에 할당됩니다. 즉, 누구나 폴더를 볼 수 있습니다.

   ![Enter a name, description, and configure permissions.](./managing-the-knowledge-base/images/02.png)

1. **저장** 을 클릭하세요.

## 폴더 및 기사 관리

폴더와 기사를 추가한 후 왼쪽 패널에 끌어다 놓아 문서를 정리하고 순서를 정할 수 있습니다. 또한 작업(![작업 버튼](../../images/icon-actions.png))을 클릭하여 추가 관리 옵션에 액세스할 수도 있습니다.

![Drag and drop folders and articles to organize and order your documentation.](./managing-the-knowledge-base/images/03.png)

```{note}
7.4 U71/GA71 및 이전 버전의 경우 기술 자료 문서에 우선 순위 값이 포함되어 있습니다. 이 값은 기사 제목 아래에 나타나며 기술 자료 표시 위젯에서 기사의 순서를 결정합니다. [기술 자료 시스템 설정](knowledge-base-system-settings.md) 을 통해 이 동작을 구성할 수 있습니다.
```

### 폴더 옵션

![Click the Actions button for a folder to access these management options.](./managing-the-knowledge-base/images/04.png)

**편집**(![편집](../../images/icon-edit.png)): 기사의 이름과 설명을 업데이트합니다.

**가져오기**(![가져오기](../../images/icon-import.png)): 마크다운 파일 및 이미지 첨부 파일의 ZIP 아카이브를 가져옵니다. 자세한 내용은 [기술 자료 문서 가져오기](./importing-knowledge-base-articles.md) 참조하세요.

**이동**(![이동](../../images/icon-move-folder.png)): 폴더를 재배치합니다.

**구독**(홈 폴더에만 해당): 기술 자료 문서가 생성, 업데이트 또는 삭제될 때 알림을 받습니다.

**권한**(![권한](../../images/icon-permissions.png)): 다양한 역할에 리소스 권한을 할당합니다.

**삭제**(![삭제](../../images/icon-app-trash.png)): 폴더와 해당 내용을 즉시 삭제합니다.

또한 **정보**(![정보 버튼](../../images/icon-information.png))를 클릭하여 현재 폴더에 대한 정보 패널을 전환할 수 있습니다.

### 기사 옵션

![Click the Actions button for an article to access these management options.](./managing-the-knowledge-base/images/05.png)

**편집**(![편집](../../images/icon-edit.png)): 폴더 이름과 설명을 변경합니다.

**하위 기사 추가**(![페이지](../../images/icon-document.png)): 하위 기사를 만듭니다.

**만료**(![시간](../../images/icon-time.png)): 기사를 만료된 것으로 표시하고 검토자, 소유자 및 구독자에게 알립니다. 만료된 기사는 사이트에 표시될 수 없습니다. 자세한 내용은 [기사에 대한 검토 및 만료 날짜 설정](#setting-review-and-expiration-dates-for-articles) 을 참조하세요.

**구독**(![구독](../../images/icon-bell.png)): 기사에 대한 업데이트를 받으려면 가입하세요. 사용자는 시스템 메일 및 알림 설정에 따라 기사에 대한 알림을 받습니다.

**기록**(![기록](../../images/icon-date-time.png)): 기사의 다양한 버전을 보고 비교합니다.

**인쇄**(![인쇄](../../images/icon-print.png)): 기사를 인쇄하려면 대화상자를 엽니다.

**이동**(![이동](../../images/icon-move-folder.png)): 아티클을 다른 폴더나 상위 아티클로 재배치합니다.

**권한**(![권한](../../images/icon-permissions.png)): 기사에 대한 권한을 관리합니다.

**삭제**(![삭제](../../images/icon-app-trash.png)): 하위 기사와 함께 기사를 즉시 삭제합니다.

기사를 보는 동안 **정보**(![정보 버튼](../../images/icon-information.png))를 클릭하여 기사 세부정보와 버전을 볼 수도 있습니다.

## 기사 검토 및 만료 날짜 설정

때로는 기술 자료 문서가 일정 기간 동안만 유효한 경우도 있습니다. 이러한 상황에서는 문서의 무결성을 보장하기 위해 기술 자료 문서의 만료 및 검토 날짜를 설정할 수 있습니다. 설정된 동안 Liferay는 만료 또는 검토 날짜에 도달한 모든 기사에 대해 설정된 간격으로 기술 자료 기사를 확인합니다. 그런 다음 검토자, 소유자 및 구독자에게 알림을 보냅니다. 만료 날짜가 가까워지면 Liferay는 사용자에게 기사가 곧 만료됨을 알립니다.

기본적으로 기사는 만료되거나 검토가 필요하지 않도록 설정되어 있지만 기사를 만들거나 편집하는 동안 이를 변경할 수 있습니다.

![Set review and expiration dates for articles.](./managing-the-knowledge-base/images/06.png)

기본값은 1년 후이지만, 원하는 날짜와 시간을 선택할 수 있습니다. 사용자는 시스템 메일 및 알림 설정에 따라 기사에 대한 알림을 받습니다.

만료 날짜에 도달하면 사이트에서 기술 자료 문서를 사용할 수 없습니다. URL을 통해 기술 자료 문서에 액세스하는 사용자는 404 HTTP 상태를 받습니다. 또한 만료 날짜가 미래 값으로 설정되거나 만료가 비활성화되지 않는 한 만료된 기사를 수정할 수 없습니다.

검토 날짜에 도달해도 기사에는 영향이 없습니다. 사용자에게 기사의 내용을 검토하라는 알림만 제공됩니다.

### 검토 및 만료 알림 구성

1. **전역 메뉴**(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **시스템 설정** 을 클릭합니다.

1. 콘텐츠 및 데이터에서 **지식 베이스** 를 클릭합니다.

   ![확인 간격과 곧 만료되는 기사를 사용자에게 알릴 시기를 설정합니다. ](./managing-the-knowledge-base/images/07.png)

1. 시스템 범위 아래 서비스 탭에서 확인 간격을 입력합니다. 이 값은 확인 간격(분)을 결정합니다. 기본적으로 값은 15분입니다.

1. 알림을 보내기 위해 만료되기까지의 주 수를 결정합니다. 이 범위 내의 기사에는 만료 예정 레이블이 할당됩니다. 기본값은 1주입니다.

1. **저장** 을 클릭하세요.

1. 사이트 범위 아래의 **서비스** 탭으로 이동합니다.

1. 검토 및 만료 이메일을 활성화/비활성화합니다.

1. 검토 및 만료 이메일의 내용을 결정합니다.

   ![Configure review and expiration emails.](./managing-the-knowledge-base/images/08.png)

1. **저장** 을 클릭하세요.

## 기사 기록 검토

기사 기록을 볼 때 버전 세부 정보를 보고, 콘텐츠를 비교하고, 이전 버전으로 되돌릴 수 있습니다.

![View, compare, and revert article versions.](./managing-the-knowledge-base/images/09.png)

버전 콘텐츠를 비교하려면 두 기사를 선택하고 **버전 비교** 를 클릭하세요.

![Compare changes between two versions of an article.](./managing-the-knowledge-base/images/10.png)

버전 간의 모든 추가, 삭제 및 형식 변경 사항이 강조표시됩니다.

## 관련 주제

* [기술 자료 문서 작성](./creating-knowledge-base-articles.md) 
* [기술 자료 문서 가져오기](./importing-knowledge-base-articles.md) 
* [기술 자료 시스템 설정](./knowledge-base-system-settings.md) 
