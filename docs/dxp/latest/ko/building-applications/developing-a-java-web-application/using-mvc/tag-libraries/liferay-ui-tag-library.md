---
toc:
- ./liferay-ui-tag-library/liferay-ui-icons.md
- ./liferay-ui-tag-library/liferay-ui-icon-lists.md
- ./liferay-ui-tag-library/liferay-ui-icon-menus.md
- ./liferay-ui-tag-library/liferay-ui-tabs.md
- ./liferay-ui-tag-library/liferay-ui-icon-help.md
---
# Liferay UI 태그 라이브러리

Liferay UI 태그 라이브러리는 일반적으로 사용되는 UI 구성 요소를 구현하는 태그를 제공합니다. 이러한 태그를 사용하면 마크업이 일관되고 반응이 빠르고 액세스 가능해집니다.

[Liferay UI taglibdocs](https://resources.learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/liferay-ui/tld-summary.html) 에서 사용 가능한 Liferay UI taglib 목록을 찾을 수 있습니다. 각 taglib에는 태그에 전달할 수 있는 속성 목록이 있습니다. 이 중 일부는 필수이고 일부는 선택 사항입니다. 각 태그에 대한 요구 사항을 보려면 taglibdocs를 참조하십시오. [Liferay Github Repo](https://github.com/liferay/liferay-portal/tree/7.2.x/portal-web/docroot/html/taglib/ui) 폴더에서 JSP의 태그로 생성된 전체 마크업을 찾을 수 있습니다.

앱에서 Liferay-UI taglib 라이브러리를 사용하려면 JSP에 다음 선언을 추가해야 합니다.

```jsp
<%@ taglib prefix="liferay-ui" uri="http://liferay.com/tld/ui" %>
```

Liferay-UI taglib는 FreeMarker 테마 및 웹 콘텐츠 템플릿용 매크로를 통해서도 사용할 수 있습니다. 다음 구문을 따르십시오.

```
<@liferay_ui["tag-name"] attribute="string value" attribute=10 />
```

이 섹션에서는 Liferay UI taglibs를 사용하여 UI 구성 요소를 생성하는 방법에 대해 설명합니다. 각 문서에는 결과 UI의 스크린샷과 함께 코드 예제가 포함되어 있습니다.