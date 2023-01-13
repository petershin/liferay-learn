# Liferay 유틸리티 바디 탑 사용

본문 상단 태그는 자동으로 닫히는 태그가 아닙니다. 이 태그의 여는 부분과 닫는 부분 사이에 있는 내용은 `본문` 태그의 맨 위로 이동합니다. 이 taglib를 사용하여 무언가를 전달하면  [body_top.jsp](https://github.com/liferay/liferay-portal/blob/7.2.x/portal-web/docroot/html/common/themes/body_top.jsp#L25-L31) 이 마크업으로 전달되어 이 JSP로 출력됩니다.

이 태그에는 선택적 `outputKey` 속성도 있습니다. 페이지의 여러 포틀릿이 이 태그와 함께 동일한 리소스를 포함하는 경우 리소스가 한 번만 로드되도록 각 태그에 대해 동일한 `outputKey` 값을 지정할 수 있습니다.

아래 예제 구성은 `<liferay-util:body-top>` 태그를 사용하여 포틀릿 번들에서 제공하는 JavaScript를 포함합니다.

```jsp
<liferay-util:body-top outputKey="bodytop" >
    <script 
  src="/o/my-liferay-util-portlet/js/my_custom_javascript_body_top.js" 
  type="text/javascript"></script>
</liferay-util:body-top>
```

이제 `<liferay-util:body-top>` 태그를 사용하여 페이지 본문 상단에 추가 리소스를 포함하는 방법을 알았습니다.

## 관련 항목

* [Liferay Util HTML 본문 하단 태그 사용](./liferay-util-body-bottom.md)
* [Liferay Util HTML 하단 태그 사용](./liferay-util-html-bottom.md)
* [Clay Taglib 사용](../clay-tag-library.md)