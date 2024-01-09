# Liferay UI 아이콘

Liferay UI taglibs는 앱에 포함할 수 있는 여러 아이콘을 제공합니다. 앱에 아이콘을 추가하려면 `liferay-ui:icon` 태그를 사용하고 `icon`, `iconCssClass`또는 `image` 속성으로 아이콘을 지정합니다. 각 사용 사례의 예는 다음과 같습니다.

`이미지` 속성은 사용할 [Liferay UI 아이콘](https://github.com/liferay/liferay-portal/tree/7.2.x/modules/apps/frontend-theme/frontend-theme-unstyled/src/main/resources/META-INF/resources/_unstyled/images) 지정합니다(Unstyled 테마의 `이미지/공통` 폴더에 정의된 대로). 다음은 JSP 구성의 예입니다.

```jsp
<div class="col-md-3">
    <liferay-ui:icon image="subscribe" />

    <span class="ml-2">Subscribe</span>
</div>
```

![테마 아이콘을 사용하려면 image 속성을 사용하세요.](./liferay-ui-icons/images/01.png)

Liferay UI taglib는 언어 플래그 아이콘도 표시합니다. 언어 플래그 아이콘을 사용하려면 아이콘 이름 앞에 `../언어/` 상대 경로를 제공하십시오. 다음은 현지화된 메시지와 함께 현재 언어의 플래그를 표시하는 웹 컨텐츠 검색 포틀릿의 예제 조각입니다.

```jsp
<liferay-ui:icon
    image='<%= "../language/" + languageId %>'
    message='<%= LanguageUtil.format(
        request,
        "this-result-comes-from-the-x-version-of-this-content",
        snippetLocale.getDisplayLanguage(locale),
        false
    ) %>'
/>
```

사용 가능한 [`init.ftl` 변수](https://github.com/liferay/liferay-portal/blob/7.2.x/modules/apps/frontend-theme/frontend-theme-unstyled/src/main/resources/META-INF/resources/_unstyled/templates/init.ftl) 및 [Liferay DXP 매크로](https://help.liferay.com/hc/ko/articles/360029145851-FreeMarker-Taglib-Macros) 를 사용하는 다음 코드를 사용하여 FreeMarker에서 동일한 결과를 얻을 수 있습니다.

```
<#assign flag_message>
    <@liferay.language_format 
        arguments=language 
        key="this-result-comes-from-the-x-version-of-this-content" 
    />
</#assign>

<@liferay_ui["icon"]
    image="../language/${language_id}"
    message=flag_message
/>
```

사용 가능한 아이콘의 전체 목록은 아래 그림에 나와 있습니다.

![Liferay UI taglib는 앱에서 사용할 수 있는 여러 아이콘을 제공합니다.](./liferay-ui-icons/images/02.png)

![Liferay UI 아이콘은 언어에 따라 구성될 수 있습니다.](./liferay-ui-icons/images/03.png)

`icon` 속성은 다음을 사용할 [Font Awesome 아이콘](https://fontawesome.com/v3.2.1/icons/) 을 지정합니다.

```jsp
<liferay-ui:icon icon="angle-down" />
```

![icon 속성을 사용하여 앱에 Font Awesome 아이콘을 포함할 수 있습니다.](./liferay-ui-icons/images/04.png)

`iconCssClass` 속성은 사용할 [glyphicon](http://marcoceppi.github.io/bootstrap-glyphicons/) 지정합니다.

```jsp
<liferay-ui:icon
    iconCssClass="icon-remove-sign"
    label="<%= true %>"
    message="unsubscribe"
    url="<%= unsubscribeURL %>"
/>
```

![앱에서 Font Awesome 아이콘을 사용할 수 있습니다.](./liferay-ui-icons/images/05.png)

위의 예에서는 아이콘의 사용 가능한 속성 중 일부를 사용합니다. 전체 목록은 [Icon taglibdocs](https://resources.learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/liferay-ui/icon.html) 참조하세요. 

## 관련 주제

* [클레이 아이콘](../clay-tag-library/clay-icons.md)
* [Liferay UI 아이콘 목록](./liferay-ui-icon-lists.md)
* [Liferay UI 아이콘 메뉴](./liferay-ui-icon-menus.md)
