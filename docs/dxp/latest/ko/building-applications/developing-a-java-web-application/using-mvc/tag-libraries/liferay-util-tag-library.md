---
toc:
- ./liferay-util-tag-library/liferay-util-body-bottom.md
- ./liferay-util-tag-library/liferay-util-body-top.md
- ./liferay-util-tag-library/liferay-util-buffer.md
- ./liferay-util-tag-library/liferay-util-dynamic-include.md
- ./liferay-util-tag-library/liferay-util-get-url.md
- ./liferay-util-tag-library/liferay-util-html-bottom.md
- ./liferay-util-tag-library/liferay-util-html-top.md
- ./liferay-util-tag-library/liferay-util-include.md
- ./liferay-util-tag-library/liferay-util-param.md
- ./liferay-util-tag-library/liferay-util-whitespace-remover.md
---
# Liferay 유틸리티 태그 라이브러리

Liferay Util taglib는 다른 리소스를 포틀릿이나 테마로 가져오는 데 사용됩니다. 이를 사용하여 페이지 HTML의 맨 아래 또는 맨 위에 삽입할 리소스를 지정할 수 있습니다.

Liferay-Util taglib를 사용하려면 JSP에 다음 선언을 추가하십시오.

```jsp
<%@ taglib prefix="liferay-util" uri="http://liferay.com/tld/util" %>
```

Liferay-Util taglib는 FreeMarker 테마 템플릿 및 웹 콘텐츠 템플릿용 매크로를 통해서도 사용할 수 있습니다. 다음 구문을 따르십시오.

```
<@liferay_util["tag-name"] attribute="string value" attribute=10 />
```

이 섹션에서는 포틀릿 및 테마에 컨텐츠를 삽입하기 위해 앱에서 사용할 수 있는 사용 가능한 Liferay Util 태그를 다룹니다.