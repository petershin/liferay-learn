# 기본 조각 참조

Liferay는 즉시 사용 가능한 다양한 조각을 제공하므로 솔루션 구축을 즉시 시작할 수 있습니다. 사용 가능한 조각을 보려면 콘텐츠 페이지 또는 페이지 템플릿 편집을 시작하세요. 편집하는 동안 편집 사이드바 메뉴에서 **조각 및 위젯** 탭( ![조각 및 위젯](../../../../images/icon-plus.png) )을 엽니다.

조각은 다음 세트로 구성됩니다.

- [기본 조각 참조](#default-fragments-reference)
  - [레이아웃 요소](#layout-elements)
  - [기본 구성품](#basic-components)
  - [양식 구성 요소](#form-components)
  - [콘텐츠 표시](#content-display)
  - [계정](#account)
  - [카트](#cart)
  - [추천 콘텐츠](#featured-content)
    - [배너](#banners)
    - [기능](#features)
    - [하이라이트](#highlights)
  - [바닥글](#footers)
  - [탐색 모음](#navigation-bars)
  - [메뉴 표시](#menu-display)

```{note}
사용 가능한 구성 옵션은 조각 및 조각 하위 요소에 따라 다릅니다. 자세한 내용은 [조각 구성](./configuring-fragments.md) 참조하세요.
```
## 레이아웃 요소

{bdg-secondary}`Liferay 7.3+의 경우`

레이아웃 요소는 페이지 및 템플릿 레이아웃을 디자인하기 위한 드롭 영역을 정의합니다. 기본적으로 Liferay에는 **컨테이너** 와 **그리드** 라는 두 가지 레이아웃 요소가 포함되어 있습니다.

| 단편                               | 묘사                                                    |
| :------------------------------- | :---------------------------------------------------- |
| 컨테이너(이전 **패널**) | 구성 가능한 드롭 영역을 추가합니다.                                  |
| 그리드(이전 **행**)   | 여러 드롭존 모듈을 추가합니다. 이러한 모듈은 수직 또는 수평으로 구성 및 배열될 수 있습니다. |

## 기본 컴포넌트

이는 페이지에 기본 기능을 추가하는 간단한 디자인 요소입니다. 예로는 버튼, 제목, 탭이 있습니다. 이러한 구성 요소를 사용하면 페이지를 하나씩 구성할 수 있습니다. DXP에는 다음과 같은 기본 구성 요소가 포함되어 있습니다.

| 단편                                      | 묘사                                                                                                                                                                                                                                                                                    |
| :-------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 단추                                      | [링크 요소](./configuring-fragments/fragment-sub-elements-reference.md) 을 추가합니다. 링크 또는 작업 유형일 수 있으며 기본, 보조, 링크, 개요 기본 및 개요 보조의 다섯 가지 버튼 스타일을 적용할 수 있습니다.                                                                                                                        |
| 카드                                      | 디스플레이 카드로 배열된 [이미지](./configuring-fragments/fragment-sub-elements-reference.md) , [서식 있는 텍스트](./configuring-fragments/fragment-sub-elements-reference.md) 및 [링크](./configuring-fragments/fragment-sub-elements-reference.md) 요소를 추가합니다.                |
| 날짜                                      | 사용자 정의 날짜 필드에 매핑할 수 있는 필드를 추가합니다.                                                                                                                                                                                                                                                     |
| 드롭다운 {bdg-secondary}`7.4+`              | [간단한 텍스트 요소](./configuring-fragments/fragment-sub-elements-reference.md) 과 드롭 영역을 추가합니다. 다른 조각과 위젯을 드롭 영역으로 드래그 앤 드롭하여 고급 드롭다운 메뉴를 만들 수 있습니다.                                                                                                                              |
| 외부 비디오 {bdg-secondary}`7.4+`            | 페이지나 템플릿에 외부 비디오를 포함합니다. 지원되는 비디오 소스에는 YouTube, Facebook, Twitch, Vimeo 및 문서와 미디어에 저장된 비디오가 포함됩니다. 자세한 내용은 [Liferay 자산 및 페이지에 비디오 삽입](../../../../content-authoring-and-management/documents-and-media/videos/embedding-videos-into-liferay-assets-and-pages.md) 을 참조하십시오. |
| HTML                                    | 편집 가능한 [HTML 요소](./configuring-fragments/fragment-sub-elements-reference.md) 을 추가합니다. 요소를 두 번 클릭하면 HTML 구문을 사용하여 해당 콘텐츠를 편집할 수 있는 모달 창이 열립니다.                                                                                                                               |
| 헤딩                                      | H1-H6 제목 수준을 사용하도록 구성할 수 있는 [간단한 텍스트 요소](./configuring-fragments/fragment-sub-elements-reference.md) 추가합니다.                                                                                                                                                                |
| 심상 화랑 심상                                | 구성 가능한 [이미지 요소](./configuring-fragments/fragment-sub-elements-reference.md) 추가합니다. 구성 시 이미지의 원본 크기를 사용할지, 아니면 상황에 맞게 조정할지 결정하세요.                                                                                                                                            |
| 절                                       | [서식 있는 텍스트 요소](./configuring-fragments/fragment-sub-elements-reference.md) 추가합니다. 편집할 때 추가 서식 옵션에 액세스하려면 조각의 텍스트를 강조표시하세요.                                                                                                                                                  |
| 구분자                                     | 페이지 요소 사이에 수평선을 추가합니다. 간격과 색상을 구성할 수 있습니다.                                                                                                                                                                                                                                            |
| 슬라이더                                    | 슬라이드로 그룹화된 [서식 있는 텍스트](./configuring-fragments/fragment-sub-elements-reference.md) 오버레이가 포함된 [개의 이미지](./configuring-fragments/fragment-sub-elements-reference.md) 을 추가합니다. 사용자는 각 슬라이드를 수동으로 순환할 수 있습니다.                                                        |
| 사회                                      | 각 플랫폼의 페이지에 연결할 수 있는 Facebook, Twitter 및 LinkedIn 아이콘이 포함된 [이미지 요소](./configuring-fragments/fragment-sub-elements-reference.md) 을 추가합니다.                                                                                                                                   |
| 스페이스                                    | 페이지의 조각 사이에 가로 공백을 추가합니다. 높이를 구성할 수 있습니다.                                                                                                                                                                                                                                             |
| Tabs                                    | [간단한 텍스트 요소](./configuring-fragments/fragment-sub-elements-reference.md) 과 위젯 및 기타 조각을 추가하기 위한 개별 드롭 영역이 있는 여러 탭을 추가합니다.                                                                                                                                                   |
| 비디오 URL(이전 **비디오 조각**) | YouTube 또는 문서 및 미디어의 비디오를 페이지나 템플릿에 포함합니다. 비디오를 자동 재생, 반복, 음소거 또는 숨기기 컨트롤로 설정할 수 있습니다. 최종 사용자에게 비디오 컨트롤을 숨길 수도 있습니다. 자세한 내용은 [비디오 삽입](../../../../content-authoring-and-management/documents-and-media/videos/embedding-videos-into-liferay-assets-and-pages.md) 참조하십시오.   |

## 양식 컴포넌트

{bdg-secondary}`Liferay 7.4 U45+/GA45+용`

양식 구성 요소 조각을 사용하여 콘텐츠 페이지에 양식을 작성합니다. 이러한 조각은 사용자 정의 개체만 지원합니다. 이를 활성화하고 액세스하려면 게시된 개체가 하나 이상 있어야 합니다. 자세한 내용은 [조각을 사용하여 양식 작성](../../../../building-applications/objects/using-fragments-to-build-forms.md) 을 참조하세요.

| 단편        | 묘사                                                                                                                                                                                                                                       |
| :-------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 양식 컨테이너   | 콘텐츠 페이지에 양식을 작성하기 위한 컨테이너를 추가합니다. 추가한 후에는 컨테이너를 사용자 정의 개체에 매핑해야 합니다. 컨테이너는 개체의 각 필드에 대한 양식 조각을 자동으로 생성합니다. 컨테이너에서 조각을 추가하거나 제거하고 양식 제출에 대한 사용자 지정 성공 메시지를 설정할 수 있습니다. 매핑된 양식 컨테이너에는 다른 양식 구성 요소만 배치할 수 있습니다.                             |
| CAPTCHA   | 양식 컨테이너에 CAPTCHA 확인을 추가합니다. 양식 컨테이너를 추가한 후에는 제출을 위해 사람의 확인이 필요합니다.                                                                                                                                                                       |
| 체크 박스     | 부울 필드에 매핑할 수 있는 양식 컨테이너에 확인란을 추가합니다.                                                                                                                                                                                                     |
| 날짜        | 사용자 정의 날짜 필드에 매핑할 수 있는 필드를 추가합니다.                                                                                                                                                                                                        |
| 파일 올려주기   | [첨부 파일 필드](../../../../building-applications/objects/creating-and-managing-objects/fields/attachment-fields.md#attachment-fields) 에 매핑할 수 있는 파일 업로드 버튼을 추가합니다. 매핑된 첨부 파일 필드는 파일 업로드 방법을 결정합니다. 기본적으로 이 조각은 지원되는 파일 확장자를 표시합니다. |
| 다중 선택 목록  | 다중 선택 선택 목록에 매핑할 수 있는 필드를 추가합니다.                                                                                                                                                                                                         |
| 숫자 입력     | 사용자 정의 숫자 필드(예: 정수, 긴 정수, 소수 및 정밀도 소수)에 매핑할 수 있는 필드를 추가합니다. 자리 표시자 값과 도움말 텍스트를 설정할 수 있습니다.                                                                                                                            |
| 리치 텍스트 입력 | 서식 있는 텍스트 필드에 매핑할 수 있는 필드를 추가합니다.                                                                                                                                                                                                        |
| 목록에서 선택   | 사용자 정의 선택 목록 및 관계 필드에 매핑할 수 있는 드롭다운 메뉴를 추가합니다. 매핑된 필드에 10개 이상의 옵션이 포함된 경우 사용자는 드롭다운 메뉴에서 옵션을 쿼리할 수 있습니다.                                                                                                                                 |
| 제출 버튼     | 양식 항목을 제출하기 위한 버튼을 추가합니다. 모든 양식 컨테이너에는 제출 버튼이 포함되어야 합니다.                                                                                                                                                                                 |
| 텍스트 입력    | 텍스트 필드(예: 텍스트, 긴 텍스트)에 매핑할 수 있는 필드를 추가합니다.                                                                                                                                                                            |
| 텍스트 영역    | 긴 텍스트 필드에 매핑할 수 있는 필드를 추가합니다.                                                                                                                                                                                                            |
| 꼬리표       | 현재 사이트 또는 글로벌 사이트의 태그를 개체 항목에 추가하는 필드를 추가합니다.                                                                                                                                                                                            |
| 분류        | 현재 사이트 또는 글로벌 사이트의 범주를 개체 항목에 추가하는 필드를 추가합니다.                                                                                                                                                                                            |

## 컨텐츠 디스플레이

{bdg-secondary}`Liferay 7.3+의 경우`

콘텐츠 표시 조각을 사용하여 사이트 콘텐츠를 개별적으로 표시하거나 컬렉션의 일부로 표시합니다. 페이지 콘텐츠를 평가하거나 플래그를 지정하기 위해 페이지 요소를 추가할 수도 있습니다. DXP에는 다음 콘텐츠 표시 조각이 포함되어 있습니다.

| 단편                                      | 묘사                                                                                                                                                                                                                                                                               |
| :-------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 콜렉션 디스플레이                               | 수동 및 동적으로 정의된 컬렉션과 컬렉션 공급자가 정의한 컬렉션을 표시합니다. 컬렉션을 그리드로 표시할지 아니면 목록 템플릿(예: 테두리 있음, 글머리 기호 있음, 인라인, 번호 있음, 스타일 없음)으로 표시할지 구성할 수 있습니다. 자세한 내용은 [컬렉션 표시](../../../displaying-content/collections-and-collection-pages/displaying-collections.md) 참조하세요. |
| 컨텐츠 디스플레이                               | 문서 및 미디어, 웹 콘텐츠, 블로그 또는 카테고리의 단일 콘텐츠 항목을 표시합니다. 사용 가능한 구성 옵션은 선택한 콘텐츠 유형에 따라 다릅니다.                                                                                                                                                                                               |
| 적용된 필터(7.4 이상 사용 가능) | 컬렉션 표시에 적용된 필터를 표시하고 관리하기 위한 요소를 추가합니다.                                                                                                                                                                                                                                          |
| 콘텐츠 플래그                                 | 콘텐츠 항목에 플래그를 지정하기 위한 요소를 추가합니다.                                                                                                                                                                                                                                                  |
| 컬렉션 필터(7.4+ 사용 가능)   | 어휘 또는 카테고리를 사용하여 컬렉션 표시를 필터링하기 위한 요소를 추가합니다.                                                                                                                                                                                                                                     |
| 컨텐츠 평가                                  | 콘텐츠 항목을 평가하기 위한 요소를 추가합니다.                                                                                                                                                                                                                                                       |


!!! note
    Collection Filter fragments used in Collection Display fragments only work if mapped to object collection providers or blueprint collection providers.

<!--| Knowledge Base Article Navigation (Available 7.4 U_+/GA_+) | I moved this comment because it was breaking the admonition. It was on top of it originally. |-->

## 계정

{bdg-secondary}`liferay DXP 7.4 U72+/GA72+`

제품을 탐색하고 주문을 생성할 때 계정 선택기 프래그먼트를 사용하면 계정 간에 쉽게 전환할 수 있습니다. 자세한 내용은 [계정 선택기 조각 사용](https://learn.liferay.com/w/commerce/creating-store-content/liferay-commerce-fragments/using-the-account-selector-fragment) 을 참조하세요.

## 손수레

{bdg-secondary}`liferay DXP 7.4 U69+/GA69+`

카트에 대한 자세한 개요를 얻으려면 미니 카트 조각을 사용하세요. 이를 사용하여 제품 수량을 조정하고, 품목을 제거하고, 결제 프로세스를 시작하거나, 제품을 쉽게 검색하여 장바구니에 추가할 수 있습니다. 자세한 내용은 [미니 카트 조각 사용](https://learn.liferay.com/w/commerce/creating-store-content/liferay-commerce-fragments/using-the-mini-cart-fragment) 참조하세요.

## 추천 컨텐츠

추천 콘텐츠 조각은 여러 구성 요소로 구성된 복잡한 페이지 요소입니다. 조각의 레이아웃을 미리 보려면 조각 및 위젯 패널에서 **카드 보기**( ![카드 보기](../../../../images/icon-cards2.png) )로 전환하세요. Liferay에는 다음과 같은 주요 콘텐츠 조각이 포함되어 있습니다.

```{note}
Liferay DXP/Portal 7.3의 경우 각 조각의 *정보* 아이콘(![정보](../../../../images/icon-information.png)) 위로 마우스를 가져가면 레이아웃을 미리 볼 수 있습니다.
```
### 배너

CTA(Call to Action) 배너를 생성하기 위해 배너 조각을 사용하여 콘텐츠 페이지에 텍스트 및 링크 요소를 추가합니다. DXP에는 다음 레이아웃이 포함되어 있습니다.

![Add text and link elements to a content page for creating call to action banners.](./default-fragments-reference/images/01.png)

### 특징

주요 기능을 홍보하기 위해 기능 조각을 사용하여 콘텐츠 페이지에 텍스트, 이미지 및 링크 요소를 추가합니다. Liferay는 다음과 같은 레이아웃을 제공합니다.

![Add text, image, and link elements to a content page for promoting key features](./default-fragments-reference/images/02.png)

### 하이라이트

강조 표시를 위해 콘텐츠 페이지에 이미지, 텍스트 및 링크 요소를 추가하려면 하이라이트 조각을 사용합니다. Liferay는 다음과 같은 레이아웃을 제공합니다.

![Add image, text, and link elements to a content page for highlighting.](./default-fragments-reference/images/03.png)

## 푸터

{bdg-secondary}`liferay 7.3+`

바닥글 조각을 사용하여 [마스터 페이지 템플릿에 사용자 정의 바닥글을 추가합니다](../../defining-headers-and-footers/master-page-templates.md) . 각 바닥글에는 탐색 메뉴, 로그인 링크, 이미지 요소 및 저작권 텍스트가 포함되어 있습니다. Liferay는 바닥글 조각에 대해 다음 레이아웃을 제공합니다.

![Add a custom footer to master page templates for content page.](./default-fragments-reference/images/04.png)

## 내비게이션 바

{bdg-secondary}`liferay 7.3+`

탐색 모음 조각을 사용하여 [마스터 페이지 템플릿에 사용자 정의 헤더를 추가합니다](../../defining-headers-and-footers/master-page-templates.md) . 각 탐색 모음에는 탐색 메뉴, 로그인 링크, 로고 이미지 요소가 포함되어 있습니다. Liferay는 탐색 모음 조각에 대해 다음 레이아웃을 제공합니다.

![Add a custom header to master page templates for content page.](./default-fragments-reference/images/05.png)

## 메뉴 표시

{bdg-secondary}`liferay 7.4+`

메뉴 표시 조각을 사용하면 콘텐츠 페이지에 메뉴를 추가할 수 있습니다. 배포되면 사전 정의된 탐색 메뉴 [중에서 선택할 수 있습니다](../../../site-navigation/using-the-navigation-menus-application.md) 사이트 탐색을 위한 메뉴 표시 부분을 구성하는 방법에 대해 자세히 알아보려면 [메뉴 표시 구성](../../../site-navigation/configuring-menu-displays.md) 에서 메뉴 표시 위젯 구성을 참조하세요.

탐색 메뉴 선택기 구성 [탐색 메뉴 선택기 구성](../../../developer-guide/reference/fragments/fragment-configuration-types-reference.md#navigation-menu-selector-configuration) 하여 특정 마크업과 원하는 동작을 포함하는 사용자 정의 메뉴 표시 조각을 생성할 수도 있습니다.

<!--## Product-->

<!-- {bdg-secondary}`Liferay 7.4 U_+/GA_+` -->

<!--
| Since this was a recent implementation, Commerce team will explain how to properly use these fragments. This will be documented in the Commerce section, and we'll link it to this article.
-->

## 관련 주제

[콘텐츠 페이지 사용하기](../../using-content-pages.md)

[콘텐츠 페이지 편집기 UI 참조](../../using-content-pages/content-page-editor-ui-reference.md)

[조각 사용](../using-fragments.md)
