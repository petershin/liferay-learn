# 마스터 페이지 템플릿

{bdg-secondary}`사용 가능: Liferay DXP/Portal 7.3+`

마스터 페이지 템플릿은 조각(예: 이전에 테마에서 제공한 머리글 및 바닥글)을 사용하여 모든 페이지에 공통된 요소를 정의하는 방법을 제공하므로 플러그인을 배포하지 않고도 포털에서 쉽게 유지 관리할 수 있습니다. 전체 사이트에서 동일한 마스터 페이지 템플릿을 사용하거나 각 페이지마다 고유한 템플릿을 사용할 수 있습니다. 각 페이지와 페이지 템플릿에는 연결된 마스터 페이지 템플릿이 있어야 합니다.

기본적으로 기본 제공되는 빈 마스터 페이지 템플릿은 공통 요소를 제공하지 않습니다.

![The blank master page template is the default for pages, and page templates.](./master-page-templates/images/01.png)

## 마스터 페이지 템플릿 작성

마스터 페이지 템플릿을 만드는 것은 콘텐츠 페이지를 만드는 과정과 비슷합니다. 마스터 페이지 템플릿은 콘텐츠 페이지와 같은 페이지 조각을 원하는 수만큼 포함할 수 있습니다. 그러나 마스터 페이지 템플릿은 페이지 조각을 배치할 수 있는 사이트를 지정하는 드롭 영역이라는 하나의 주요 영역이 정의되어 있다는 점에서 다릅니다. 이 영역은 제거할 수 없지만 페이지 레이아웃의 다른 사이트에 배치할 수 있습니다. 드롭 영역에 추가할 수 있는 페이지 조각을 정의할 수도 있습니다. 마스터 페이지 템플릿의 일반적인 사용 사례는 머리글, 바닥글 및 드롭 영역을 갖는 것입니다. 자세한 내용은 [마스터 페이지 템플릿 만들기](./creating-a-master-page-template.md)를 참조하세요.

![A typical use case for a master page template has a header, a drop zone, and a footer](./master-page-templates/images/02.png)

## 관련 주제

[마스터 페이지 템플릿 만들기](./creating-a-master-page-template.md)

[마스터 페이지 템플릿 관리](./managing-master-page-templates.md)
