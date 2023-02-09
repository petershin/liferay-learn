# Liferay 유틸리티 버퍼 사용

버퍼 태그는 자동으로 닫히는 태그가 아닙니다. 이 태그의 열기 및 닫기 사이에 배치된 내용은 버퍼에 저장되고 해당 출력은 태그의 `var` 속성으로 선언된 Java 변수에 할당됩니다. 출력은 문자열로 반환되므로 후처리할 수 있습니다. 예를 들어 이를 사용하여 [JSP의 기존 콘텐츠를 재정의](https://help.liferay.com/hc/en-us/articles/360029122451-JSP-Overrides-Using-OSGi-Fragments)할 수 있습니다.

아래 예제는 링크의 생성된 마크업을 버퍼에 저장한 다음 반환된 문자열을 `liferay-ui:message` 키의 인수로 사용합니다.

```jsp
<liferay-util:buffer
        var="linkContent"
>
        <aui:a 
            href="https://www.liferay.com/" 
            target="_blank">Liferay
        </aui:a>
</liferay-util:buffer>

<liferay-ui:message 
        arguments="<%= linkContent %>" 
        key="see-x-for-more-information" 
        translateArguments="<%= false %>" 
/>
```

이제 `<liferay-util:buffer>` 태그를 사용하여 내용을 버퍼에 저장하는 방법을 알았습니다. 

![Liferay Util Buffer 태그를 사용하여 JSP에서 재사용할 마크업 조각을 저장할 수 있습니다.](./liferay-util-buffer/images/01.png)

## 관련 항목

* [OSGi 조각을 사용하여 JSP 재정의](https://help.liferay.com/hc/en-us/articles/360029122451-JSP-Overrides-Using-OSGi-Fragments)
* [Liferay Util 매개변수 태그 사용](./liferay-util-param.md)
* [Liferay 프런트 엔드 Taglib 사용](../liferay-frontend-tag-library.md)