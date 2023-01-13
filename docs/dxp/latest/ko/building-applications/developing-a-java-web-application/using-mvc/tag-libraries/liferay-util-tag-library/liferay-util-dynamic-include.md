# Liferay Util 동적 포함 사용

동적 포함 태그를 사용하면 개발자가 `DynamicIncludeRegistry`을 사용하여 추가 HTML, 리소스 또는 기능을 삽입할 수 있는 JSP 또는 테마의 지점을 지정할 수 있습니다. OSGi 서비스 레지스트리 [여기](http://docs.spring.io/osgi/docs/current/reference/html/service-registry.html)에 대한 자세한 내용을 읽을 수 있습니다. `키` 속성은 확장 지점을 식별합니다. 동적 포함 확장 지점을 사용하여 추가 기능을 삽입하는 예제 구성은 [동적 포함](https://help.liferay.com/hc/en-us/articles/360018165711-Dynamic-Includes) 을 참조하세요.

아래 예제 구성은 `<liferay-util:dynamic-include>` 태그를 사용하여 기본 코드 앞에 확장 지점을 포함하고 기본 코드 뒤에 확장 지점을 포함합니다.

```jsp
<%@ taglib uri="http://liferay.com/tld/util" prefix="liferay-util" %>

<liferay-util:dynamic-include key="/path/to/jsp#pre" />

<div>
        <p>And here we have our content</p>
</div>

<liferay-util:dynamic-include key="/path/to/jsp#post" />
```

이제 `<liferay-util:dynamic-include>` 태그를 사용하여 앱에 확장점을 추가하는 방법을 알았습니다.

## 관련 항목

* [동적 포함](https://help.liferay.com/hc/en-us/articles/360018165711-Dynamic-Includes)
* [Liferay Util 본체 상단 태그 사용](./liferay-util-body-top.md)
* [차트 태그 라이브러리 사용](https://help.liferay.com/hc/en-us/articles/360028832592-Using-the-Chart-Taglib-in-Your-Portlets)