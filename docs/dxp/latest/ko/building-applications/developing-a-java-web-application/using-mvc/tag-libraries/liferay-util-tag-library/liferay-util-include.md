# Liferay Util 포함 사용

include 태그를 사용하면 포틀릿의 JSP, 테마 또는 웹 컨텐츠에 다른 JSP 파일을 포함할 수 있습니다. 이렇게 하면 가독성을 높이고 JSP 파일에 대한 관심을 분리할 수 있습니다.

`페이지` 속성은 필수이며 포함할 JSP 또는 JSPF에 대한 경로를 지정합니다. `servletContext` 은 포함된 JSP가 사용해야 하는 요청 컨텍스트를 나타냅니다. 이 속성에 `<%= application %>` 을 전달하면 포함된 JSP가 이전 JSP에서 설정할 수 있는 다른 객체와 동일한 `요청` 객체를 사용할 수 있습니다.

다음은 `<liferay-util:include>` 태그의 구성 예입니다.

```jsp
<liferay-util:include 
  page="/relative/path/to/file.jsp" 
  servletContext="<%= application %>"
/>
```

이제 `<liferay-util:include>` 태그를 사용하여 포틀릿, 테마 및 웹 컨텐츠에 다른 JSP를 포함하는 방법을 알았습니다.

## 관련 항목

* [Liferay Util 매개변수 태그 사용](./liferay-util-param.md)
* [Liferay Util 동적 포함 태그 사용](./liferay-util-dynamic-include.md)
* [Liferay 프런트 엔드 Taglib 사용](../clay-tag-library.md)