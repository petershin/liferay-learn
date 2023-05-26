# 사이트 콘텐츠에서 적응된 이미지 사용

Adaptive Media는 백그라운드에서 작동하여 Liferay DXP에 업로드하는 이미지에 대해 서로 다른 해상도를 생성합니다. 블로그, 웹 콘텐츠 및 콘텐츠 페이지 작성자가 이러한 이미지를 사용할 때 Adaptive Media는 대상 화면 크기에 대한 최상의 해상도를 자동으로 선택합니다. Adaptive Media는 사용자가 콘텐츠를 볼 때 가장 최근에 수정된 이미지로 대체되는 `data-fileentryid` 속성으로 콘텐츠의 HTML에서 각 수정된 이미지를 식별합니다. 이렇게 하면 콘텐츠가 해당 이미지보다 먼저 존재하더라도 Adaptive Media가 콘텐츠에 최신으로 조정된 이미지를 제공할 수 있습니다.

```{note}
[이미지에 대해 Adaptive Media를 비활성화](./managing-image-resolutions.md)하면 원본 이미지가 블로그 항목, 웹 콘텐츠 기사 및 콘텐츠 페이지에 나타납니다.
```

## 콘텐츠에 적응된 이미지 포함

콘텐츠 페이지에 이미지를 추가할 때 [직접 선택한 이미지와 매핑된 이미지에 대해 Adaptive Media가 작동](../../../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#image-source-settings) . 블로그 또는 웹 콘텐츠에 이미지를 업로드할 때 Adaptive Media는 **블로그 이미지** , **문서 및 미디어** , **업로드** 탭에서 추가된 이미지에서만 작동합니다. 또한 수정된 이미지는 커버 이미지가 아닌 블로그 항목의 콘텐츠에만 적용할 수 있습니다. Adaptive Media는 이미지가 블로그 이미지 리포지토리에 자동으로 업로드되고 조정된 다음 블로그 항목의 콘텐츠에 포함되기 때문에 드래그 앤 드롭을 통해 블로그 항목에 추가된 이미지에 대해 작동합니다. HTML을 검사하고 이미지에 `<img>` 태그와 `data-fileentryid` 속성이 포함되어 있는지 확인하면 이를 확인할 수 있습니다.

웹 콘텐츠 기사의 경우 Adaptive Media는 파일 선택기의 **문서 및 미디어** 탭에서 추가된 이미지에서만 작동합니다. 블로그와 달리 Adaptive Media는 끌어서 놓기를 통해 웹 콘텐츠 기사에 추가된 이미지에 맞게 조정된 이미지를 제공하지 않습니다.

블로그 항목과 미디어 콘텐츠 기사 모두에서 Adaptive Media는 파일 선택기의 **URL** 탭에서 추가된 이미지와 함께 작동하지 않습니다. 이는 이미지가 URL에서 직접 연결되어 Adaptive Media에서 복사할 이미지 파일을 제공하지 않기 때문입니다.

블로그 항목 또는 웹 콘텐츠 기사를 작성하는 동안 HTML에서 `<img>` 태그 및 `data-fileentryid` 속성을 볼 수 있습니다. 콘텐츠가 표시되면 HTML이 자동으로 교체되고 다음과 유사하게 표시됩니다.

```html
    <picture>

        <source media="(max-width:850px)" srcset="/o/adaptive-media/image/44147/med/photo.jpeg">

        <source media="(max-width:1200px) and (min-width:850px)" srcset="/o/adaptive-media/image/44147/hd/photo.jpeg">

        <source media="(max-width:2000px) and (min-width:1200px)" srcset="/o/adaptive-media/image/44147/ultra-hd/photo.jpeg">

        <img src="/documents/20140/0/photo.jpeg/1992-9143-85d2-f72ec1ff77a0">

    </picture>
```

이 예제에서는 해상도가 각각 다른 세 가지 이미지를 사용합니다. `소스` 태그는 이러한 각 이미지를 정의합니다. 또한 조정된 이미지를 사용할 수 없는 경우 원본 이미지(`img`)가 대체 이미지로 사용됩니다.

## 구조화된 웹 콘텐츠에서 적응 이미지 사용

[구조화된 웹 콘텐츠](../../../web-content/web-content-structures/creating-structures.md)에서 조정된 이미지를 사용하려면 콘텐츠 작성자가 웹 콘텐츠 구조에 이미지 필드를 수동으로 포함해야 합니다. 그런 다음 편집기 왼쪽에서 선택하여 일치하는 템플릿에서 해당 이미지 필드를 참조할 수 있습니다. 다음은 템플릿에 포함된 `Imagecrrf` 이라는 이미지 필드의 예제 스니펫입니다.

```markup
    <#if Imagecrrf.getData()?? && Imagecrrf.getData() !="">
      <img data-fileentryid="${Imagecrrf.getAttribute("fileEntryId")}" alt="${Imagecrrf.getAttribute("alt")}" src="${Imagecrrf.getData()}" />
    </#if>
```

이 스니펫에는 `data-fileentryid` 속성이 포함되어 있어 Adaptive Media가 이미지를 적응된 이미지로 교체하도록 합니다. 편집기의 코드 보기에서 결과 웹 콘텐츠의 HTML을 검사하면 다음과 같은 태그가 표시되어야 합니다.

```html
    <img data-fileentryid="37308" src="/documents/20143/0/photo.jpeg/85140258-1c9d-89b8-4e45-d79d5e262318?t=1518425" />
```

`data-fileentryid` 속성이 있는 `<img>` 태그에 유의하십시오. Adaptive Media는 파일 항목 ID를 사용하여 `<img>` 요소를 각 해상도에 대해 사용 가능한 적응 이미지를 포함하는 `<picture>` 요소로 자동 교체합니다(위의 `<picture>` 예 참조).

## 적응된 이미지 스테이징

Adaptive Media는 DXP의 [콘텐츠 스테이징](../../../../content-authoring-and-management.md) 및 [내보내기/가져오기](../../../../site-building/sites/exporting-importing-site-pages-and-content.md) 기능과 완전히 통합됩니다. Adaptive Media는 게시할 때 스테이징된 콘텐츠에 적응된 이미지를 포함하고 이러한 이미지를 새로운 해상도에 맞게 업데이트할 수 있습니다.

마찬가지로 조정된 이미지가 포함된 콘텐츠를 내보낼 때 Adaptive Media는 해당 이미지를 LAR 파일로 내보냅니다. 그런 다음 해당 LAR 파일을 가져와서 적응된 이미지와 함께 해당 콘텐츠를 복원하거나 전송할 수 있습니다.

Adaptive Media는 준비된 콘텐츠를 내보내거나 가져오는 동안 적응된 이미지를 다시 생성하지 않습니다. 성능을 개선하기 위해 Adaptive Media는 대신 기존의 적응된 이미지를 재사용합니다.

## 관련 주제

* [이미지 해상도 추가](./adding-image-resolutions.md)
