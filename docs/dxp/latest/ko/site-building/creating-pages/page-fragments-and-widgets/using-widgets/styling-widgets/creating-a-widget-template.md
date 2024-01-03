# 위젯 템플릿 만들기

위젯 템플릿은 [FreeMarker](https://freemarker.apache.org/) 사용하여 사이트 페이지에서 위젯이 렌더링되는 방식을 결정합니다. 각 템플릿은 특정 위젯 유형에 맞게 설계되었으며 페이지에서 위젯을 구성하는 동안 선택할 수 있습니다.

```{note}
Liferay DXP/Portal 7.4+의 경우 위젯 템플릿은 FreeMarker만 지원합니다. 속도는 더 이상 지원되지 않습니다.
```

위젯 템플릿을 생성하려면 다음 단계를 따르세요.

1. 위젯 템플릿을 생성하려는 원하는 사이트로 이동합니다.

1. _사이트 메뉴_( ![사이트 메뉴](../../../../../images/icon-product-menu.png) )를 열고 _디자인_ &rarr; _템플릿_ &rarr; _위젯 템플릿_으로 이동합니다.

   ```{note}
   글로벌 사이트에서 샘플 위젯 템플릿을 볼 수 있습니다. 이러한 샘플 템플릿은 앱에 이미 구성된 기본 템플릿과 다릅니다.
   ```
1. _추가_( ![추가 버튼](../../../../../images/icon-add.png) )를 클릭하고 생성할 템플릿 유형을 선택합니다.

   ![Click on Design and Widget templates.](./creating-a-widget-template/images/01.png)

1. 템플릿의 _name_을 입력하세요.

1. 편집기에서 템플릿을 디자인하세요.

   _Elements_ 측면 패널( ![Elements](../../../../../images/icon-list-ul.png) )에서 사용 가능한 위젯 필드, 변수 및 유틸리티 중에서 선택할 수 있습니다. 일부 요소는 모든 위젯에 공통적으로 적용되는 반면 다른 요소는 선택한 위젯 유형에만 적용됩니다.

   ![Design the template using field elements.](./creating-a-widget-template/images/02.png)

1. (선택 사항) 세부 정보 측면 패널(![세부 정보](../../../../../images/icon-cog3.png))에서 _description_을 입력하고 템플릿에 대한 _image_를 선택합니다.

1. _저장_을 클릭하세요.

## 템플릿 편집기

템플릿 편집기 오른쪽에는 템플릿 작성에 사용되는 공통 변수 팔레트가 있습니다. 이는 템플릿을 만들 때 훌륭한 참고 자료가 됩니다. 변수 중 하나를 템플릿 편집기에 배치하려면 배치할 사이트
에 텍스트 커서를 놓고 변수 이름을 클릭합니다.

각 변수에는 자세한 설명을 표시하는 도구 설명도 있습니다. 여러 종류의 위젯 템플릿이 있기 때문에 각 위젯 템플릿마다 다른 변수도 있습니다. 따라서 각 템플릿에는 해당 특정 템플릿에만 적용할 수 있는 다양한 변수 세트가 있습니다.

![Liferay offers a versatile script editor to customize your widget template.](./creating-a-widget-template/images/03.png)

자동 완성 기능을 사용하여 템플릿에 변수를 추가할 수도 있습니다. 사용 가능한 변수의 드롭다운 메뉴를 여는 `${`를 입력하여 호출할 수 있습니다. 변수 중 하나를 클릭하면 편집기가 해당 변수를 편집기에 삽입합니다.

동일한 유형의 템플릿을 다른 템플릿에 포함할 수도 있습니다. 예를 들어 기존 Wiki 위젯 템플릿이 있고 다른 Wiki 위젯 템플릿을 생성한다고 가정해 보겠습니다. 처음부터 시작하는 대신 기존 Wiki 위젯 템플릿을 새 템플릿으로 가져와서 구축할 수 있습니다. 즉, 위젯 템플릿을 일반 템플릿으로 사용하여 시스템의 Velocity 또는 FreeMarker 템플릿에서 가져온 코드를 재사용할 수 있습니다.

## 템플릿 편집기에서 헤드리스 API 호출

템플릿 편집기에서 Liferay의 [Headless](../../../../../headless-delivery/using-liferay-as-a-headless-platform.md) API 서비스를 직접 호출할 수 있습니다. 헤드리스 리소스를 템플릿에 삽입하려면 API 엔드포인트의 상대 URL과 함께 `restClient` 객체를 사용하세요.

!!! note
'restClient' 개체를 사용하여 GET 엔드포인트만 호출할 수 있습니다.

예를 들어 `restClient`를 사용하여 사이트의 블로그 게시물을 검색한 후 다음 FreeMarker 스크립트를 사용하여 헤드라인을 인쇄할 수 있습니다.

```ftl
<#assign 
	blogPostings = restClient.get("/headless-delivery/v1.0/sites/{siteId}/blog-postings").items
/>

<#list blogPostings as blogPosting>
	<h1>${blogPosting.headline}</h1>
</#list>
```

표준 cURL 요청과 동일한 방식으로 API 응답을 필터링, 정렬, 검색 및 페이지 매김할 수 있습니다. 예를 들어:

```ftl
<#assign 
	blogPostings = restClient.get("/headless-delivery/v1.0/sites/{siteId}/blog-postingssort=dateCreated:asc&filter=creatorId+eq+20126").items
/>

<#list blogPostings as blogPosting>
	<h1>${blogPosting.headline}</h1>
</#list>
```

API 필터링에 대한 자세한 내용은 [API 쿼리 매개변수](../../../../../headless-delivery/consuming-apis/api-query-parameters.md) 참조하세요.

[API Explorer](../../../../../headless-delivery/consuming-apis/consuming-rest-services.md) 사용하여 헤드리스 리소스에 대한 API 엔드포인트 및 스키마를 찾으세요.

## 위젯 템플릿 구성

위젯 템플릿을 저장한 후 작업 버튼(![작업 버튼](../../../../../images/icon-actions.png))을 통해 관리할 수 있습니다. 이는 다음과 같은 몇 가지 옵션을 제공합니다.

- _Edit_: 위젯 템플릿의 설정 속성을 수정합니다.
- _권한_: 위젯 템플릿에 대한 _업데이트_, _권한_, _삭제_ 및 _보기_ 권한을 관리합니다.
- _Copy_: 위젯 템플릿의 복사본을 만듭니다.
- _Delete_: 위젯 템플릿을 삭제합니다.

또한 위젯 템플릿은 정적 URL과 WebDAV URL을 생성합니다. 이러한 값은 템플릿의 XML 소스에 액세스합니다. 메뉴에서 위젯 템플릿을 클릭하고 _Details_ 섹션을 확장하면 이러한 URL을 찾을 수 있습니다. WebDAV URL을 사용하여 사이트 관리자는 원격 서버에서 위젯 템플릿을 추가, 탐색, 편집 및 삭제할 수 있습니다. WebDAV URL이 수행할 수 있는 작업에 대해 자세히 알아보려면 [WebDAV 액세스](../../../../../content-authoring-and-management/documents-and-media/publishing-and-sharing/accessing-documents-with-webdav.md) 을 참조하세요.

```{note}
위젯 템플릿에 위젯을 삽입하는 것은 가능하기는 하지만 권장되지 않습니다. 그렇게 하면 다른 위젯과의 충돌이나 예상치 못한 동작(예: 이동 경로에 데이터를 집계하는 위젯 삽입)이 발생할 수 있기 때문입니다. 위젯 템플릿에 위젯을 삽입하는 것이 유일한 옵션인 경우 다른 위젯을 방해하지 않는지 확인하세요.
```

다음으로 새 위젯 템플릿을 사용하도록 위젯을 구성합니다.

1. 수정하려는 위젯의 _구성_ 페이지로 이동하여 _디스플레이 설정_을 엽니다.

1. _디스플레이 템플릿_ 아래 드롭다운 메뉴에서 위젯 템플릿을 선택하세요.

또한 앱에 대한 사이트별 디스플레이 템플릿을 관리할 수 있습니다. _디스플레이 템플릿_ 드롭다운 메뉴 옆에 있는 _[SPECIFIC_SITE]에 대한 디스플레이 템플릿 관리_ 링크를 클릭하면 됩니다. 새 템플릿을 추가하거나 기존 템플릿을 편집할 수 있는 옵션과 함께 사이트에서만 사용할 수 있는 구성된 템플릿 목록이 포함된 창이 나타납니다.

![Click the Configuration menu of an app to edit and manage available widget templates.](./creating-a-widget-template/images/04.png)

## 관련 주제

* [위젯 템플릿 예시](./using-a-widget-template-example.md)
