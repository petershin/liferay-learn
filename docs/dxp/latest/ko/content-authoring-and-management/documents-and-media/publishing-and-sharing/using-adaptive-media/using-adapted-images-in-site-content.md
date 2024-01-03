# 사이트 콘텐츠에 적응된 이미지 사용

Adaptive Media는 백그라운드에서 작동하여 Liferay DXP에 업로드하는 이미지에 대해 다양한 해상도를 생성합니다. 블로그, 웹 콘텐츠 및 콘텐츠 페이지 작성자가 이러한 이미지를 사용하면 Adaptive Media는 대상 화면 크기에 가장 적합한 해상도를 자동으로 선택합니다. 적응형 미디어는 사용자가 콘텐츠를 볼 때 최신 적응 이미지로 대체되는 `data-fileentryid` 속성을 사용하여 콘텐츠 HTML의 각 적응 이미지를 식별합니다. 이를 통해 Adaptive Media는 콘텐츠가 해당 이미지 이전에 존재했더라도 콘텐츠에 최신으로 적용된 이미지를 제공할 수 있습니다.

```{note}
 [이미지에 대한 적응형 미디어를 비활성화하면](./managing-image-resolutions.md) 원본 이미지가 블로그 항목, 웹 콘텐츠 기사 및 콘텐츠 페이지에 나타납니다.
```

## 콘텐츠에 적응된 이미지 포함

콘텐츠 페이지에 이미지를 [하는 경우](../../../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#image-source-settings) Adaptive Media는 직접 선택한 이미지와 매핑된 이미지에 대해 작동합니다. 블로그 또는 웹 콘텐츠에 이미지를 업로드할 때 Adaptive Media는 _블로그 이미지_, _문서 및 미디어_, _업로드_ 탭에서 추가된 이미지에 대해서만 작동합니다. 또한 적용된 이미지는 표지 이미지가 아닌 블로그 항목의 콘텐츠에만 적용할 수 있습니다. Adaptive Media는 드래그 앤 드롭을 통해 블로그 항목에 추가된 이미지에 대해 작동합니다. 이미지는 블로그 이미지 저장소에 자동으로 업로드되고 조정된 다음 블로그 항목의 콘텐츠에 포함됩니다. HTML을 검사하고 이미지에 `<img>` 태그와 `data-fileentryid` 속성이 포함되어 있는지 확인하면 이를 확인할 수 있습니다.

웹 콘텐츠 기사의 경우 Adaptive Media는 파일 선택기의 _문서 및 미디어_ 탭에서 추가된 이미지에서만 작동합니다. 블로그와 달리 Adaptive Media는 드래그 앤 드롭을 통해 웹 콘텐츠 기사에 추가된 이미지에 맞게 조정된 이미지를 제공하지 않습니다.

블로그 항목과 미디어 콘텐츠 기사 모두 Adaptive Media는 파일 선택기의 _URL_ 탭에서 추가된 이미지와 작동하지 않습니다. 이는 이미지가 URL에서 직접 연결되므로 Adaptive Media에 복사할 이미지 파일을 제공하지 않기 때문입니다.

블로그 항목이나 웹 콘텐츠 기사를 작성하는 동안 HTML에서 `<img>` 태그 및 `data-fileentryid` 속성을 볼 수 있습니다. 콘텐츠가 표시되면 HTML이 자동으로 대체되고 다음과 유사하게 표시됩니다.

```html
    <picture>

        <source media="(max-width:850px)" srcset="/o/adaptive-media/image/44147/med/photo.jpeg">

        <source media="(max-width:1200px) and (min-width:850px)" srcset="/o/adaptive-media/image/44147/hd/photo.jpeg">

        <source media="(max-width:2000px) and (min-width:1200px)" srcset="/o/adaptive-media/image/44147/ultra-hd/photo.jpeg">

        <img src="/documents/20140/0/photo.jpeg/1992-9143-85d2-f72ec1ff77a0">

    </picture>
```

이 예에서는 각각 해상도가 다른 세 가지 이미지를 사용합니다. 'source' 태그는 이러한 각 이미지를 정의합니다. 또한 조정된 이미지를 사용할 수 없는 경우 원본 이미지(`img`)가 대체 수단으로 사용됩니다.

## 구조화된 웹 콘텐츠에서 적응된 이미지 사용

구조화된 웹 콘텐츠 [에서 적응된 이미지를 사용하려면 콘텐츠 제작자가 웹 콘텐츠 구조에 이미지 필드를 수동](../../../web-content/web-content-structures/creating-structures.md) 포함해야 합니다. 그런 다음 편집기 왼쪽에서 해당 이미지 필드를 선택하여 일치하는 템플릿에서 해당 이미지 필드를 참조할 수 있습니다. 다음은 템플릿에 포함된 `Imagecrrf`라는 이미지 필드의 예제 스니펫입니다.

```markup
    <#if Imagecrrf.getData()?? && Imagecrrf.getData() !="">
      <img data-fileentryid="${Imagecrrf.getAttribute("fileEntryId")}" alt="${Imagecrrf.getAttribute("alt")}" src="${Imagecrrf.getData()}" />
    </#if>
```

이 스니펫에는 Adaptive Media가 이미지를 적응된 이미지로 교체할 수 있도록 'data-fileentryid' 속성이 포함되어 있습니다. 편집기의 코드 보기에서 결과 웹 콘텐츠의 HTML을 검사하면 다음과 같은 태그가 표시되어야 합니다.

```html
    <img data-fileentryid="37308" src="/documents/20143/0/photo.jpeg/85140258-1c9d-89b8-4e45-d79d5e262318?t=1518425" />
```

`data-fileentryid` 속성이 있는 `<img>` 태그에 주목하세요. 적응형 미디어는 파일 항목 ID를 사용하여 `<img>` 요소를 각 해상도에 사용 가능한 적응 이미지가 포함된 `<picture>` 요소로 자동으로 바꿉니다(위의 `<picture>` 예시 참조).

## 적응된 이미지 스테이징

적응형 미디어는 Liferay의 [콘텐츠 스테이징](../../../../content-authoring-and-management.md) 및 [내보내기/가져오기](../../../../site-building/sites/exporting-importing-site-pages-and-content.md) 기능과 통합되어 있습니다. 게시되면 조정된 이미지가 준비된 콘텐츠에 포함됩니다.

마찬가지로, 조정된 이미지가 포함된 콘텐츠를 내보내면 해당 이미지가 LAR 파일에 포함됩니다. 그런 다음 원본 이미지와 함께 가져올 수 있습니다.

성능을 향상시키기 위해 Adaptive Media는 게시 및 내보내기/가져오기 중에 기존에 적용된 이미지를 재사용합니다.

## 관련 주제

* [이미지 해상도 추가](./adding-image-resolutions.md) 
