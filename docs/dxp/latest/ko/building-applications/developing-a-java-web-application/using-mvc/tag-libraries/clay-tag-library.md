---
toc:
  - ./clay-tag-library/clay-alerts.md
  - ./clay-tag-library/clay-badges.md
  - ./clay-tag-library/clay-buttons.md
  - ./clay-tag-library/clay-cards.md
  - ./clay-tag-library/clay-dropdown-and-action-menus.md
  - ./clay-tag-library/clay-form-elements.md
  - ./clay-tag-library/clay-icons.md
  - ./clay-tag-library/clay-links-and-labels.md
  - ./clay-tag-library/clay-management-toolbar.md
  - ./clay-tag-library/clay-navigation-bars.md
  - ./clay-tag-library/clay-progress-bars.md
  - ./clay-tag-library/clay-stickers.md
---
# 클레이 태그 라이브러리

Liferay Clay 태그 라이브러리는 앱에서 [Clay](https://clayui.com/) UI 구성요소를 생성하기 위한 태그 세트를 제공합니다.

```{note}
AUI taglibs는 @product-ver@부터 더 이상 사용되지 않습니다. 향후 호환성 문제를 방지하려면 Clay taglibs를 사용하는 것이 좋습니다.
```

앱에서 Clay taglib를 사용하려면 JSP에 다음 선언을 추가하십시오.

```jsp
<%@ taglib prefix="clay" uri="http://liferay.com/tld/clay" %>
```

Liferay Clay taglib는 FreeMarker 테마 템플릿 및 웹 콘텐츠 템플릿용 매크로를 통해서도 사용할 수 있습니다. 다음 구문을 따르십시오.

```
[@clay["tag-name"] attribute="string value" attribute=10 /]
```

Clay taglibs는 앱에 다음과 같은 UI 구성 요소를 제공합니다.

* [알림](clay-tag-library/clay-alerts.md)
* [배지](clay-tag-library/clay-badges.md)
* [버튼](clay-tag-library/clay-buttons.md)
* [카드](clay-tag-library/clay-cards.md)
* [드롭다운 메뉴 및 작업 메뉴](clay-tag-library/clay-dropdown-and-action-menus.md)
* [양식 요소](clay-tag-library/clay-form-elements.md)
* [아이콘](clay-tag-library/clay-icons.md)
* [레이블 및 링크](clay-tag-library/clay-links-and-labels.md)
* [관리 도구 모음](clay-tag-library/clay-management-toolbar.md)
* [내비게이션 바](clay-tag-library/clay-navigation-bars.md)
* [진행률 표시줄](clay-tag-library/clay-progress-bars.md)
* [스티커](clay-tag-library/clay-stickers.md)

이 섹션에서는 Clay taglibs로 이러한 구성 요소를 생성하는 방법에 대해 설명합니다. 각 기사에는 결과 UI의 스크린샷과 함께 점토 구성 요소 예제 세트가 포함되어 있습니다.
