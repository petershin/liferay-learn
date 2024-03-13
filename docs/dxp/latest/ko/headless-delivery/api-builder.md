# API 빌더

{bdg-secondary}Liferay DXP 2023.Q4+/Portal 7.4 GA102+
{bdg-link-primary}` [베타 기능](../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags) `

```{important}
API 빌더는 현재 Liferay 객체만 지원하는 베타 기능입니다. API 엔드포인트는 현재 엔터티 컬렉션 검색을 지원합니다.
```

API 빌더를 사용하면 Liferay에서 사용자 정의 API 애플리케이션을 쉽게 만들 수 있습니다. 귀하의 정확한 요구 사항을 충족하는 API 스키마와 엔드포인트를 생성하세요.

API 빌더를 활성화하려면,

1. **글로벌 메뉴**(![글로벌 메뉴](../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **인스턴스 설정** 으로 이동합니다.

1. **Platform** 아래의 **Feature Flags** 를 클릭하세요.

1. 왼쪽 탐색 메뉴에서 **베타** 를 선택하세요. **API Builder** 를 켜세요. 이제 API 빌더가 활성화되었습니다.

## API 애플리케이션 이해

각 사용자 정의 API 애플리케이션에는 여러 엔드포인트와 스키마가 포함될 수 있습니다. 이는 Liferay의 기본 API 애플리케이션과 유사합니다. 예를 들어, `headless-admin-user` API 애플리케이션에는 `accounts`, `organizations`, `roles`, `user-accounts` 등에 대한 엔드포인트가 있습니다.

사용자 정의 API 애플리케이션을 관리하려면 **글로벌 메뉴**(![글로벌 메뉴](../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **API Builder** 로 이동하세요. 사용자 정의 API 애플리케이션 목록을 확인하세요. 각 API 애플리케이션에 대한 제목, URL, 설명, 마지막 업데이트 및 상태가 표시됩니다.

![See a list of your custom API applications.](./api-builder/images/01.png)

새 API 애플리케이션을 생성하려면 **추가**(![아이콘 추가](../images/icon-add.png))를 클릭하고 세부 정보를 입력하세요.

애플리케이션을 편집하거나 삭제하려면 **옵션**(![옵션 아이콘](../images/icon-options.png))을 클릭하고 **편집** 또는 **삭제** 를 클릭하세요. 초안 상태의 API 애플리케이션은 게시된 후에만 사용할 수 있습니다. 일단 게시되면 생성된 API는 Liferay의 기본 API(예: 페이지 매김, 필터링, 정렬 등)와 동일한 기능 세트를 갖습니다.

## 스키마 이해

API 스키마는 API에서 반환(또는 수신)하는 엔터티를 지정합니다. 스키마를 관리하려면 사용자 정의 API 애플리케이션 중 하나를 클릭하고 **Schemas** 탭을 클릭하세요. 사용자 정의 스키마 목록을 확인하세요. 각 스키마에 대한 이름, 설명 및 마지막 업데이트가 표시됩니다.

![See a list of your custom schemas](./api-builder/images/02.png)

새 스키마를 생성하려면 **추가**(![아이콘 추가](../images/icon-add.png))를 클릭하고 세부 정보를 입력하세요. 그런 다음 새 스키마의 **Properties** 탭을 클릭하고 포함할 엔터티를 선택합니다. [Liferay 객체](../building-applications/objects/creating-and-managing-objects.md) 에서 사용 가능한 다양한 엔터티 중에서 선택하십시오. 개체에 개체 관계 [객체 관계](../building-applications/objects/creating-and-managing-objects/relationships.md) 없으면 해당 개체의 엔터티도 선택할 수 있습니다.

객체의 속성 이름은 필요에 따라 이름을 바꿀 수 있습니다. 예를 들어, 스크린샷의 `student` 개체의 경우 `First Name`을 `Given Name`으로 변경합니다.

![Select the entities you want included in your schema.](./api-builder/images/03.png)

스키마를 편집하거나 삭제하려면 **옵션**(![옵션 아이콘](../images/icon-options.png))을 클릭하고 **편집** 또는 **삭제** 를 클릭하세요.

## 엔드포인트 이해

API 엔드포인트는 요청을 수락하는 특정 URL 사이트
입니다. 엔드포인트를 관리하려면 사용자 정의 API 애플리케이션 중 하나를 클릭하고 **Endpoints** 탭을 클릭하여 사용자 정의 엔드포인트 목록을 확인하세요. 각 엔드포인트에 대한 방법, URL 경로, 설명 및 마지막 업데이트가 표시됩니다.

새 엔드포인트를 생성하려면 **추가**(![아이콘 추가](../images/icon-add.png))를 클릭하고 세부 정보를 입력하세요. 엔드포인트의 범위는 인스턴스 또는 사이트로 지정될 수 있습니다. 개체의 범위에 따라 범위를 선택합니다. **구성** 탭을 클릭하여 엔드포인트를 구성하세요. 엔드포인트와 함께 사용할 스키마를 선택합니다.

![Select the configuration tab to configure the endpoint.](./api-builder/images/04.png)

JSON 필터링을 엔드포인트에 통합할 수 있습니다. 예를 들어 `filter=lastName eq 'Smith'`를 사용하면 성이 Smith를 포함하는 항목에 대한 엔드포인트를 필터링할 수 있습니다.

JSON 정렬도 통합할 수 있습니다. 예를 들어 `sort=firstName:asc`를 사용하면 이름을 기준으로 알파벳순으로 항목을 정렬할 수 있습니다.

필터링 및 정렬에 대한 자세한 내용은 [API 쿼리 매개변수](./consuming-apis/api-query-parameters.md) 참조하세요.

엔드포인트를 편집하거나 삭제하려면 **옵션**(![옵션 아이콘](../images/icon-options.png))을 클릭하고 **편집** 또는 **삭제** 를 클릭하세요.

## 다음 단계

* [샘플 API 애플리케이션 구축](./api-builder/building-a-sample-api-application.md)
