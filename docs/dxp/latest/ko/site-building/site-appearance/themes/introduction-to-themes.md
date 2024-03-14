# 테마 소개

테마는 사이트의 기본 모양과 느낌을 사용자 지정합니다. 전체 사이트에서 브랜드 또는 레이블의 스타일과 시각적 정체성을 정의할 수 있습니다.

## 테마 및 사이트 디자인

테마는 귀하가 만든 모든 사이트에서 즉시 사용할 수 있고 사용됩니다. 사이트의 모양과 느낌을 정의하는 다른 방법(예: [Style Books](../style-books/using-a-style-book-to-standardize-site-appearance.md))도 있지만 테마는 완전히 사용자 정의된 솔루션이 필요할 때 가장 유연하게 사용할 수 있습니다.

![사이트 디자인 계층](./introduction-to-themes/images/01.png)

테마는 사이트의 모양을 디자인하는 방법의 계층 구조에서 사용자 정의를 추가하는 가장 광범위하고 유연한 방법 중 하나입니다. 테마는 보다 구체적인 도구(예: [마스터 페이지](../../creating-pages/defining-headers-and-footers/master-page-templates.md) 및 [스타일 북](../style-books/using-a-style-book-to-standardize-site-appearance.md))가 구축할 수 있는 사이트의 가장 기본적인 기반을 제공하는 데 사용됩니다. 그러나 테마를 사용하여 다른 방법으로는 불가능한 사용자 정의를 추가할 수도 있습니다.

```{warning}
테마를 통해 사이트에 사용자 정의를 추가하면 한 버전의 Liferay에서 다른 버전으로 업그레이드할 때 유지 관리가 증가할 수 있습니다. 가능하면 [마스터 페이지 템플릿](../../creating-pages/defining-headers-and-footers/master-page-templates.md) 및 [Style Books](. ./style-books/using-a-style-book-to-standardize-site-appearance.md).
```

## 테마 개발

테마를 사용하여 페이지 스타일 지정, 템플릿 생성, 런타임 시 기능 확장 등 다양한 방법으로 사이트를 사용자 정의할 수 있습니다.

### 사이트 스타일링

테마는 모든 사이트에서 스타일 지정의 기초를 제공합니다. 사이트 페이지, 사용자 정의 포틀릿 데코레이터에 대한 UI 세부 정보를 정의할 수 있습니다. <!--Add link when available--> , 색 구성표를 정의합니다. <!--Add link when available--> 귀하의 사이트.

테마에 따라 사용자 지정 [Frontend 토큰 정의](../style-books/developer-guide/frontend-token-definitions.md) 을 구성할 수도 있습니다. <!--Add link when available: See Hooking Style Book Tokens into Your Theme for more information.-->

### 페이지 디자인

테마는 또한 사이트 페이지의 템플릿을 디자인하기 위해 [페이지 템플릿](../../creating-pages/adding-pages/creating-a-page-template.md) 또는 [마스터 페이지 템플릿](../../creating-pages/defining-headers-and-footers/master-page-templates.md) 을 보완합니다. 테마의 디자인 위에 추가되는 다른 방법과 함께 사용할 수 있습니다.

예를 들어, [테마에](./theme-development/working-with-templates/embedding-widgets-via-templates.md) 을 삽입하여 사이트 페이지의 영구적인 요소로 만들 수 있습니다.

```{note}
[마스터 페이지](../../creating-pages/defining-headers-and-footers/master-page-templates.md) 또는 [페이지 템플릿](../. ./creating-pages/adding-pages/creating-a-page-template.md).
```

### 번들 리소스

여러 코드 소스를 한 번에 모으기 위해 테마 또는 다른 소스에서 리소스를 번들로 묶을 수 있습니다. 이를 통해 다양한 변경 사항을 배포하려는 방법에 따라 전략을 조정할 수 있습니다.

* [Themelets](./theme-development/bundling-resources/bundling-and-installing-resources-into-your-theme-via-themelets.md) 을 사용하면 많은 테마에 적용할 수 있는 모듈 방식으로 적은 수의 파일을 사용자 지정할 수 있습니다.

* 테마 기여자 <!--Add link when available--> 테마와 독립적으로 배포할 수 있는 UI 리소스 및 사용자 지정을 패키징할 수 있습니다.

* 자원 수입업자 <!--Add link when available--> 사이트 템플릿을 사용하여 테마를 구현하는 데 필요한 파일과 콘텐츠를 가져옵니다.

```{warning}
리소스 가져오기는 Liferay DXP 7.1부터 더 이상 사용되지 않습니다.
```

### 행동 수정

테마는 사이트의 다른 부분의 동작을 수정하기 위한 강력한 도구이기도 합니다.

* 페이지 템플릿 [에서 사용할 수 있는 컨텍스트 변수를 추가하여 이러한 템플릿이 테마의 기능에](../../creating-pages/adding-pages/creating-a-page-template.md) 수 있습니다.

* 변수 값을 설정할 수 있습니다. <!--Add link when available--> 테마를 사용하여 DXP의 기존 기능 동작에 영향을 줍니다.

* [Style Books](../style-books/using-a-style-book-to-standardize-site-appearance.md)으로 스타일링 범주를 정의하는 데 사용되는 [토큰 정의](../style-books/developer-guide/frontend-token-definitions.md) 을 추가할 수 있습니다.

## 테마 업그레이드

테마를 업그레이드하는 첫 번째 단계는 Liferay 테마 생성기를 사용하여 업그레이드 작업을 실행하는 것입니다. 이 작업은 새 버전의 DXP에 배포할 수 있도록 테마 버전을 업데이트합니다. 자세한 내용은 [테마 업그레이드](./upgrading-a-theme.md) 을 참조하십시오.


<!-- If and when at least one more article is made for the extra work for upgrades, maybe add:

    Using the Liferay Theme Generator allows your theme to be deployed, but more work may be required to accommodate other changes in the new version, such as UI or functionality changes. See this article for more information... -->

## 공구

테마를 개발하거나 확장하는 데 다양한 도구가 사용됩니다. 자세한 내용은 다음 항목을 참조하십시오.

* Liferay 테마 생성기 <!--Add link when available-->

* [잎](../../../building-applications/tooling/blade-cli/generating-projects-with-blade-cli.md)
* [개발자 도구 개요](../../../building-applications/tooling/developer-tools-overview.md)
<!-- this may just be a single link to all the tooling section. This section is the result of https://issues.liferay.com/browse/IFI-2289 -->
