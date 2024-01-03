# 검색 페이지에서 검색 청사진 사용

기본적으로 검색 페이지에는 연결된 [청사진 검색](./understanding-search-blueprints.md) 없습니다. Liferay 검색 경험에 영향을 미치려면 청사진을 [검색 페이지](../../../search-pages-and-widgets/working-with-search-pages.md) 에 적용해야 합니다. 사이트에 여러 검색 페이지가 있는 경우 청사진을 사용해야 하는 각 페이지에서 아래 단계를 따르세요. 각 페이지는 별도로 구성해야 하기 때문입니다. 원하는 경우 각 페이지에서 서로 다른 청사진을 사용할 수 있습니다.

검색 페이지가 검색 청사진에 반응하도록 하려면,

1. [청사진을 만듭니다](./creating-and-managing-search-blueprints.md) .

1. [검색 페이지](../../../search-pages-and-widgets/working-with-search-pages.md) 을 생성하거나 탐색합니다.

1. Blueprint 옵션 위젯을 페이지에 추가합니다.

1. 위젯의 _옵션_ 아이콘(![옵션](../../../../images/icon-app-options.png))을 클릭하고 _구성_을 클릭합니다.

1. 페이지의 청사진을 선택하려면 _선택_을 클릭하세요.

   ![Select a blueprint for use on the page.](./using-a-search-blueprint-on-a-search-page/images/02.png)

1. 청사진이 선택되면 구성 화면에서 _저장_을 클릭합니다.

이제 청사진의 기능이 페이지에 적용되었습니다.

대신 관리 사용자는 [하위 수준 검색 옵션](../../../search-pages-and-widgets/search-results/understanding-low-level-search-options.md) 위젯을 사용하여 검색 페이지에 청사진을 적용할 수 있습니다. 위젯의 구성을 엽니다. 속성 섹션에서 다음을 추가합니다.

- 키: `search.experiences.blueprint.erc` [^1]
- 값: `[청사진의 외부 참조 코드(ERC)]`

[^1]: Liferay 2023.Q4/GA102 이전 버전에서는 대신 ID `search.experiences.blueprint.id`를 사용해야 합니다. Blueprints 애플리케이션(글로벌 메뉴 &rarr; 애플리케이션 &rarr; Blueprints(검색 경험))에서 청사진 ID 또는 ERC를 찾을 수 있습니다. 청사진을 클릭하여 편집기를 엽니다.

![The blueprint ID and ERC are listed in the blueprint editor.](./using-a-search-blueprint-on-a-search-page/images/01.png)

검색 페이지에서 이미 낮은 수준 검색 옵션 위젯을 사용하고 있지 않는 한, 청사진 옵션 위젯이 청사진을 설정하는 데 더 편리합니다. 청사진 테스트 등을 위해 다른 검색 컨텍스트 속성을 설정해야 하는 경우 낮은 수준 검색 옵션 위젯을 사용하세요.

## 추가 검색 컨텍스트 속성 적용

청사진은 위에서 설명한 대로 청사진 옵션 위젯을 사용하거나 하위 수준 검색 옵션 위젯의 검색 컨텍스트 속성을 사용하여 페이지에 적용됩니다. 하위 수준 검색 옵션 위젯에서 추가 검색 컨텍스트 속성을 설정할 수 있습니다. 검색 페이지에 검색 컨텍스트 속성을 설정해야 하는 두 가지 주요 이유는 다음과 같습니다.

1. 청사진은 사용자 지정 매개 변수(Liferay의 검색 프레임워크에서 설정되지 않은 매개 변수)를 정의하고 이에 응답할 수 있으며, 이러한 매개 변수는 하위 수준 검색 옵션 위젯에서 수동으로 설정할 수 있습니다.
1. 검색 컨텍스트 속성을 설정하고 검색 요청을 실행하여 검색 페이지에서 Blueprint의 동작을 테스트하는 것이 유용할 수 있습니다.

   기본 요소에 사용되는 매개변수에 대한 자세한 내용 [요소](./search-blueprints-elements-reference.md) 를 참조하세요.

<!--
Follow this example to set search context attributes into a blueprint-driven search page:

1. Create two users: name them _Acme User_ and _Other User_.
   - Acme User
      - Screen Name: `acmeuser`
      - Email Address: `acme@liferay.com`
      - First Name: `Acme`
      - Last Name: `User`
   - Other User
      - Screen Name: `otheruser`
      - Email Address: `other@liferay.com`
      - First Name: `Other`
      - Last Name: `User`
1. Create a [User Segment](../../../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) called _Acme Users_. Drag the User attribute and add Acme User to it. Record the segment's ID. It's in the URL as the parameter `segmentsEntryId`.
1. Create an [Asset Category](../../../../content-authoring-and-management/tags-and-categories.md) . Name the Vocabulary and the Category _Business_. Record the Category's ID. It's in the URL as part of the path: `category/[ID]`.
1. Create two pieces of Basic Web Content:
   - Web Content 1
      - Title: Has Business Category
      - Content: Test
      - Category: Business
   - Web Content 2
      - Title: Without Business Category
      - Content: Test
1. [Create a blueprint](./creating-and-managing-search-blueprints.md) with the following Element:
   - Element Name: Boost Contents in a Category for a User Segment
      - Asset Category ID: The _Business_ Category's ID. 
      - User Segment IDs: The ID of the _Acme Users_ User Segment.
      - Boost: 100
1. Navigate to the site's search page.
1. Add the Low Level Search Options widget to the page, and open it's configuration screen.
1. In the Attributes section, add

   - Key: `search.experiences.scope.group.id`
   - Value: `[the site ID]`

You can find the blueprint ID from the Blueprints application (Global Menu &rarr; Applications &rarr; Blueprints (Search Experiences).
-->

<!-- Example is unfinished--uncomment when finalized. -->
