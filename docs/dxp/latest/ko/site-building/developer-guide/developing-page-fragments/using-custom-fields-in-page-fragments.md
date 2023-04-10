# 페이지 조각에서 사용자 정의 필드 사용

Liferay의 사용자 또는 페이지에 [사용자 정의 필드](../../../system-administration/configuring-liferay/adding-custom-fields.md) 을 추가한 경우 조각으로 액세스할 수 있습니다. 페이지 사용자 정의 필드의 값을 얻으려면 다음을 사용하십시오.

```ftl
layout.getExpandoBridge().getAttribute("ATTRIBUTE_NAME")
```

프래그먼트에서 페이지 사용자 정의 필드를 사용하려면 먼저 [사용자 정의 필드를 추가한 다음](../../../system-administration/configuring-liferay/adding-custom-fields.md)사이트 메뉴 &rarr; 프래그먼트에서 프래그먼트 편집기를 통해 페이지 프래그먼트를 추가하거나 편집합니다.

이 예제 HTML은 사용자 정의 필드 `showFooter` 사용하여 페이지에서 자리 표시자 `바닥글` 요소를 표시하거나 숨깁니다.

```ftl
[#assign showFooter = layout.getExpandoBridge().getAttribute("showFooter")]

[#if showFooter]
    <footer class="bg-dark pb-8 pt-6 section-footer text-white">
        Placeholder footer content...
    </footer>
[/#if]
```

페이지의 `showFooter` 값을 true 또는 false로 전환하면 각각 바닥글이 표시되거나 숨겨집니다.

![페이지 사용자 정의 필드 값을 사용하여 페이지에서 HTML 바닥글 콘텐츠를 표시하거나 숨깁니다.](./using-custom-fields-in-page-fragments/images/01.png)

사용자의 사용자 정의 필드에 액세스하려면 다음을 사용하십시오.

```ftl
user.getExpandoBridge().getAttribute("ATTRIBUTE_NAME")
```

게스트 사용자는 사용자 정의 필드에 대한 값이 없을 수 있습니다. 이 경우 게스트 사용자에 대한 사용자 정의 필드 값을 검색하려고 하면 페이지를 볼 때 오류가 발생합니다. 사용자 정의 필드로 프래그먼트를 개발할 때 게스트 사용자 액세스를 고려하십시오.

다음과 같이 FreeMarker 코드를 추가하여 값을 사용하기 전에 값이 존재하는지 확인할 수 있습니다.

```ftl
[#if user.getExpandoBridge().getAttribute("showFooter")??]
    ...
[#/if]
```

## 추가 정보

* [사용자에게 사용자 정의 필드 추가](../../../system-administration/configuring-liferay/adding-custom-fields.md)

* [조각 편집기 사용](./using-the-fragments-editor.md)
