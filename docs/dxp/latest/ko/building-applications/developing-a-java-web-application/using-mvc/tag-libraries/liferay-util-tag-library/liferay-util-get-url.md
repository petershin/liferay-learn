# Liferay Util Get URL 사용

get URL 태그는 `url` 속성에서 제공하는 URL을 스크랩합니다. `var` 속성에 값이 제공되면 화면 스크랩의 콘텐츠 범위가 해당 변수로 지정됩니다. 그렇지 않으면 taglib이 사용되는 곳에 스크랩한 콘텐츠가 표시됩니다.

`<liferay-util:get-url>` 태그의 기본 구성은 다음과 같습니다.

```jsp
<liferay-util:get-url url="https://www.liferay.com/" />
```

다음은 `var` 속성을 사용하는 예입니다.

```jsp
<liferay-util:get-url url="https://www.liferay.com/" var="Liferay" />

<div>
                <h2>We borrowed <a href="https://www.liferay.com/">Liferay</a>. Here it is.</h2>

                <div class="Liferay">
                                <%= Liferay %>
                </div>
</div>
```

![Liferay Util Get URL 태그를 사용하여 URL을 스크랩할 수 있습니다.](./liferay-util-get-url/images/01.png)

이제 `<liferay-util:get-url>` 태그를 사용하여 URL을 긁는 방법을 알았습니다.

## 관련 항목

* [Liferay Util 매개변수 태그 사용](./liferay-util-param.md)
* [Liferay Util 포함 태그 사용](https://help.liferay.com/hc/ko/articles/360029145351-Using-Liferay-Util-Include)
* [AUI 태그립 사용](https://help.liferay.com/hc/ko/articles/360028832812-Using-AUI-Taglibs)