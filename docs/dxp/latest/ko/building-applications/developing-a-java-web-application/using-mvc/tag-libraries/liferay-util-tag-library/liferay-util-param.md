# Liferay 유틸리티 매개변수 사용

param 태그를 사용하면 포함된 JSP 페이지 [에 대한 매개변수를 설정할 수](./liferay-util-include.md). 이 구성에는 두 개의 JSP가 필요합니다. 앱의 메인 뷰인 JSP A는 JSP B를 포함하고 해당 파라미터 값을 설정합니다. 이렇게 하면 JSP를 포함할 때 동적으로 콘텐츠를 설정할 수 있습니다.

예를 들어 `my-app.jsp`에 기본 기능이 있고 `more-content.jsp`에서 제공하는 추가 기능이 있다고 가정합니다. 아래와 같은 예제 구성을 가질 수 있습니다.

`more-content.jsp`:

```jsp
<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>

<%
String answer = ParamUtil.getString(request, "answer");
%>

<div>
  <p>The answer to life, the universe and everything is <%= answer %>.</p>
</div>
```

그런 다음 `my-app.jsp`에서 `more-content.jsp` 을 포함하고 `응답` 매개변수의 값을 설정할 수 있습니다.

```jsp
<liferay-util:include page="/path/to/more-content.jsp" servletContext="<%= application %>">
  <liferay-util:param name="answer" value="42" />
</liferay-util:include>
```

그 결과 `my-app.jsp`에 다음과 같은 출력이 생성됩니다.

```html
The answer to life, the universe and everything is 42.
```

이제 `<liferay-util:param>` 태그를 사용하여 포함된 JSP에 대한 매개변수를 설정하는 방법을 알았습니다. 이 접근 방식을 사용하여 재사용 가능한 일반적인 코드 조각을 앱에 포함할 수 있습니다.

## 관련 항목

* [Liferay Util 포함 태그 사용](./liferay-util-include.md)
* [Liferay Util 본체 상단 태그 사용](./liferay-util-body-top.md)
* [차트 태그 라이브러리 사용](../clay-tag-library.md)