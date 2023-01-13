# Liferay Util HTML Top 사용

HTML 상단 태그는 자동으로 닫히는 태그가 아닙니다. 이 태그의 여는 부분과 닫는 부분 사이에 있는 내용은 `<head>` 태그로 이동합니다. 이 taglib를 사용하여 무언가를 전달하면 [top_head.jsp](https://github.com/liferay/liferay-portal/blob/master/portal-web/docroot/html/common/themes/top_head.jsp#L147-L153) 이 마크업으로 전달되어 이 JSP로 출력됩니다.

이 태그에는 선택적 `outputKey` 속성도 있습니다. 페이지의 여러 포틀릿이 이 태그와 함께 동일한 리소스를 포함하는 경우 리소스가 한 번만 로드되도록 각 태그에 대해 동일한 `outputKey` 값을 지정할 수 있습니다.

아래 예제 구성은 `<liferay-util:html-top>` 태그를 사용하여 포틀릿 번들에서 제공하는 추가 CSS 스타일을 포함합니다.

```jsp
<liferay-util:html-top outputKey="htmltop">
                <link data-senna-track="permanent" 
        href="/o/my-liferay-util-portlet/css/my-custom-styles.css" 
        rel="stylesheet" type="text/css" />
</liferay-util:html-top>
```

이제 `<liferay-util:html-top>` 태그를 사용하여 페이지의 HTML 태그 상단에 추가 리소스를 포함하는 방법을 알았습니다.

## 관련 항목

* [Liferay Util HTML 하단 태그 사용](./liferay-util-html-bottom.md)
* [Liferay Util 본체 상단 태그 사용](./liferay-util-body-top.md)
* [Clay Taglib 사용](../clay-tag-library.md)
