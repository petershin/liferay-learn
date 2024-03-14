# 조각 구성 유형 참조

이 참조에는 조각에 사용 가능한 구성 유형이 나열되어 있습니다. 조각을 구성 가능하게 만드는 방법에 대한 자세한 내용은 [조각에 구성 옵션 추가](../../developing-page-fragments/adding-configuration-options-to-fragments.md) 참조하세요.

구현에 사용할 수 있는 구성 가능한 조각 유형은 다음과 같습니다.

- `text`
- `select`
- `checkbox`
- `colorPicker`(Liferay 7.4+ 사용 가능)
- `길이`(Liferay 7.4+ U44/GA44 사용 가능)
- `itemSelector`
- `url`(Liferay 7.4+ 사용 가능)
- `videoSelector`(Liferay 7.4+ 사용 가능)
- `collectionSelector`
- `colorPalette`
- `navigationMenuSelector`(Liferay 7.4+ 사용 가능)

!!! note

    FreeMarker 컨텍스트에 삽입된 구성 값은 JSON 파일에 지정된 정의된 `datatype` 값을 따릅니다. 예를 들어 `dataType`이 문자열인 경우 `configuration.[name-value]?is_string`은 `true`입니다.

## 텍스트 구성

이 JSON 구성은 텍스트 옵션을 수동으로 입력해야 하는 경우 구현할 수 있는 입력 텍스트 필드를 생성합니다.

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "name": "buttonText",
                    "label": "Button Text",
                    "description": "button-text",
                    "type": "text",
                    "typeOptions": {
                        "placeholder": "Placeholder"
                    },
                    "dataType": "string",
                    "defaultValue": "Go Somewhere"
                }
            ]
        }
    ]
}
```

![The text configuration is useful when an input text option is necessary.](./fragment-configuration-types-reference/images/01.png)

## 구성 선택

이 JSON 구성은 사전 정의된 옵션을 선택해야 하는 경우에 구현할 수 있는 선택기를 생성합니다.

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "name": "numberOfFeatures",
                    "label": "Number Of Features",
                    "description": "number-of-features",
                    "type": "select",
                    "dataType": "int",
                    "typeOptions": {
                        "validValues": [
                            {"value": "1"},
                            {"value": "2"},
                            {"value": "3"}
                        ]
                    },
                    "defaultValue": "3"
                }
            ]
        }
    ]
}
```

![The select configuration is useful when an option choice is necessary.](./fragment-configuration-types-reference/images/02.png)

## 체크박스 구성

이 JSON 구성은 부울 값 선택이 필요한 경우 구현할 수 있는 확인란을 생성합니다.

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "name": "hideBody",
                    "label": "Hide Body",
                    "description": "hide-body",
                    "type": "checkbox",
                    "defaultValue": false
                }
            ]
        }
    ]
}
```

![The checkbox configuration is useful when a boolean selection is necessary.](./fragment-configuration-types-reference/images/03.png)

## 색상 선택기 구성

{bdg-secondary}`liferay 7.4+`

색상 선택기 JSON 구성은 모든 색상을 선택할 수 있는 유연한 색상 선택기를 생성합니다. 다음 방법 중 하나를 사용하여 색상을 선택할 수 있습니다.

* 색상을 선택하려면 왼쪽의 색상을 클릭하여 색상 선택기를 엽니다.

* 색상의 16진수 코드를 텍스트 상자에 입력합니다.

* **Stylebook의 값** 버튼을 클릭하면 현재 사용되는 [스타일 북](../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) 에서 정의된 색상을 선택할 수 있는 사전 정의된 색상 메뉴가 열립니다. 그러면 버튼을 다시 눌러 연결을 해제할 때까지 필드 값이 선택한 토큰에 연결됩니다. 토큰 값의 연결을 해제하면 선택한 색상이 해당하는 16진수 코드 값으로 다시 변환됩니다.

* 색상 선택기에 정의된 기본값이 없으면 **기본값** 드롭다운 메뉴를 클릭하여 현재 사용되는 스타일 북에서 색상을 선택하세요. 이는 값을 선택할 때 Stylebook의 값 버튼과 동일하게 작동합니다.

![The color picker configuration lets you directly input a color value, select one from a range, or select one from your style book.](./fragment-configuration-types-reference/images/04.png)

!!! note

    사용 중인 테마에 스타일 북 [에 대한](../../../site-appearance/style-books/developer-guide/frontend-token-definitions.md) 토큰 정의가 없는 경우 페이지의 색상 선택기 구성이 [색 팔레트](#color-palette configuration) 구성으로 대체됩니다.

이 JSON 구성은 `headingColor`라는 색상 선택기 필드를 생성합니다.

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "name": "headingColor",
                    "label": "Heading Color",
                    "description": "heading-color",
                    "type": "colorPicker",
                    "defaultValue": "#FF0000"
                }
            ]
        }
    ]
}
```

`colorPicker` 유형은 구성된 이름으로 선택한 색상 값을 보유하는 객체를 저장합니다. 다음과 같이 조각의 HTML에서 이 객체를 참조할 수 있습니다.

```html
<div class="fragment_69">
    <h1 style="color: ${configuration.headingColor}">
        This text's color is configurable.
    </h1>
</div>
```

조각이 렌더링되면 `${configuration.OBJECT_NAME}` 토큰이 선택한 색상으로 대체됩니다. 색상이 선택되는 방식에 따라 값 유형이 달라집니다.

* 색상을 직접 선택한 경우 해당 색상은 해당 16진수 코드 값으로 대체됩니다.
* 현재 스타일 북에서 색상을 선택한 경우 연결된 토큰에 대한 CSS 변수(예: `var(--danger)`)로 대체됩니다.
* 현재 테마에 사용할 토큰 정의가 없으면(대신 [색상 팔레트](#color-palette-configuration) 이 사용됨) CSS 색상(예: `rgb(255, 0, 0)`)으로 대체됩니다.

## 길이 구성

{bdg-secondary}`liferay 7.4 U44 및 GA44+`

`길이` 구성 유형은 숫자를 입력하고 사전 정의된 단위를 선택하거나 너비, 여백, 패딩과 같은 설정에 대한 자체 단위를 지정할 수 있는 필드를 생성합니다.

이 JSON 샘플은 `length` 구성 유형을 사용하는 필드를 보여줍니다. 여기에는 이름, 레이블 및 기본값을 정의하는 속성이 포함됩니다.

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "defaultValue": "300px",
                    "label": "size",
                    "name": "size",
                    "type": "length"
                }
            ]
        }
    ]
}
```

사용자 인터페이스에서 사용 가능한 단위 중에서 선택하거나 사용자 정의 단위를 지정할 수 있습니다.

![A field labeled 'Size' from a custom fragment uses the length configuration to show a drop-down of available units.](./fragment-configuration-types-reference/images/05.png)

## 항목 선택기 구성

{bdg-secondary}`liferay 7.3+`

이 구성은 조각에 포함할 기존 콘텐츠(기본적으로 문서, 웹 콘텐츠 기사, 블로그 항목, 카테고리, 제품 또는 지식 기반 기사) 하나를 선택하기 위한 선택기를 생성합니다.

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "label": "select-content",
                    "name": "itemSelector1",
                    "type": "itemSelector",
                    "typeOptions": {
                        "enableSelectTemplate": true
                    }
                }
            ]
        }
    ]
}
```

![The item selector configuration is useful when an option choice to display existing content is necessary.](./fragment-configuration-types-reference/images/06.png)

작성자가 특정 유형의 콘텐츠만 선택할 수 있도록 하는 고급 구성을 제공할 수 있습니다. 아래 구성은 웹 콘텐츠 기사만 선택할 수 있도록 지정합니다. 선택사항인 'itemSubtype' 속성은 선택한 웹 콘텐츠 기사가 선택되기 위해 'article-structure-key-15' 구조를 사용해야 함을 지정합니다.

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "label": "select-content",
                    "name": "itemSelector1",
                    "type": "itemSelector",
                    "typeOptions": {
                        "itemType": "com.liferay.journal.model.JournalArticle",
                        "itemSubtype": "article-structure-key-15"
                    }
                }
            ]
        }
    ]
}
```

이 예에서는 `image/png` MIME 유형(`.png` 파일)이 있는 문서만 선택할 수 있도록 지정합니다.

```json
{
  "fieldSets": [
    {
      "fields": [
        {
          "label": "select-content",
          "name": "itemSelector1",
          "type": "itemSelector",
          "typeOptions": {
            "itemType": "com.liferay.portal.kernel.repository.model.FileEntry",
            "mimeTypes": [
              "image/png"
            ]
          }
        }
      ]
    }
  ]
}
```

이 예에서는 블로그 항목만 선택할 수 있도록 지정합니다.

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "label": "select-content",
                    "name": "itemSelector1",
                    "type": "itemSelector",
                    "typeOptions": {
                        "itemType": "com.liferay.blogs.model.BlogsEntry"
                    }
                }
            ]
        }
    ]
}
```

그런 다음 블로그 항목에 대해 다음 HTML 스니펫을 사용하여 조각의 콘텐츠를 렌더링할 수 있습니다.

```html
<div class="fragment_name">
  [#if configuration.itemSelector1.content??]
       ${configuration.itemSelector1.content}
  [/#if]
</div>
```

콘텐츠의 특정 부분에 액세스해야 하는 경우 `name` 속성과 `Object` 접미사(이 경우 `itemSelector1Object`)를 사용하여 조각의 Java 객체에 액세스할 수도 있습니다. 아래 예는 블로그 항목의 제목, 설명 및 콘텐츠 본문을 렌더링합니다.

```html
<div class="fragment_name">
  [#if configuration.itemSelector1.content??]
      ${itemSelector1Object.getTitle()}
      ${itemSelector1Object.getDescription()}
      ${itemSelector1Object.getContent()}
  [/#if]
</div>
```

!!! note

    항목 선택기 구성이 포함된 조각을 컬렉션 표시 위젯에 배치하면 컬렉션 항목이 선택한 콘텐츠로 자동 매핑됩니다.

## URL 구성

이 구성은 조각의 마크업에 사용할 URL에 대한 필드를 특별히 추가합니다.

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "label": "My URL",
                    "name": "myURL",
                    "type": "url"
                }
            ]
        }
    ]
}
```

이 구성으로 조각을 설정할 때 드롭다운 메뉴에서 URL을 수동으로 입력('URL')하거나 동일한 사이트에서 다른 페이지를 선택하고 전체 URL('페이지')을 사용하도록 선택할 수 있습니다.

다음은 위 JSON의 URL 구성을 사용하여 하이퍼링크를 생성하는 조각 HTML의 예입니다.

```html
<div class="fragment_1">
    <a href=${configuration.myURL}>Click this link!</a>
</div>
```

## 비디오 선택기

{bdg-secondary}`liferay 7.4+`

`videoSelector` 유형을 사용하면 [외부 비디오](../../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md) 조각을 다른 조각에 통합하는 비디오 선택기를 만들 수 있습니다.

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "label": "My Video Selector",
                    "name": "myVideoConfig",
                    "type": "videoSelector"
                }
            ]
        }
    ]
}
```

이는 기본적으로 비디오가 포함된 조각을 원할 때 유용합니다. 다음 JSON 구성 샘플은 카드 조각에 외부 비디오 선택기를 통합하는 방법을 보여줍니다.

```json
{
"fieldSets": [
    {
        "fields": [
            {
                "label": "Video",
                "name": "video",
                "type": "videoSelector"
            }
        ]
    },
    {
        "configurationRole": "style",
        "fields": [
            {
                "dataType": "string",
                "defaultValue": "w-100",
                "label": "image-size",
                "name": "imageSize",
                "type": "select",
                "typeOptions": {
                    "validValues": [
                        {
                            "label": "fit",
                            "value": "w-100"
                        },
                        {
                            "label": "original-size",
                            "value": "w-0"
                        }
                    ]
                }
            }
        ]
    }
]
}
```

![With the video selector you can include external videos in fragments](./fragment-configuration-types-reference/images/07.png)

!!! note

    'videoSelector' 유형은 [외부 비디오](../../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md#external-video) 조각과 호환되지만 [비디오 URL](../../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md) 조각과는 호환되지 않습니다.

## 컬렉션 선택기

{bdg-secondary}`liferay 7.3+`

`collectionSelector` 구성 유형을 사용하면 [컬렉션](../../../displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md) 또는 [컬렉션 공급자](../../../displaying-content/collections-and-collection-pages/collection-providers.md) 을 포함하는 조각을 개발할 수 있습니다. 수동 컬렉션과 동적 컬렉션 모두에서 `collectionSelector`를 사용할 수 있습니다.

!!! note

    개발자는 컬렉션 공급자를 사용하여 고급 기준으로 특정 컬렉션을 만들 수 있습니다. 자세히 알아보려면 [Info Framework](https://help.liferay.com/hc/ko/articles/360029067251-Introduction-to-The-Info-Framework) 개발자 문서에서 [정보 목록 공급자 만들기](https://help.liferay.com/hc/ko/articles/360029067271-Creating-an-Information-List-Provider) 에 대한 정보를 읽어보세요.

다음 JSON 구성은 `collectionSelector`를 사용하는 방법을 보여줍니다.

```json
{
    "fieldSets": [
        {
        "label": "Collection",
        "fields": [
            {
                "name": "collection",
                "type": "collectionSelector"
            }
        ]
        }
    ]
}
```

다음 HTML 코드 샘플과 함께 이 조각 구성을 사용하여 컬렉션 항목을 나열할 수 있습니다. `collectionObjectList`는 콘텐츠 페이지 편집기 [에서 선택된 컬렉션을 나타](../../../creating-pages/using-content-pages/content-page-editor-ui-reference.md) .

HTML에서 이 컬렉션을 참조하려면 JSON 구성의 'name' 컬렉션과 'ObjectList' 접미사를 사용하세요. 이전 JSON 코드 발췌에서 'name' 컬렉션은 'collection'이므로 HTML은 'collectionObjectList'를 사용하여 컬렉션을 참조합니다.

```html
<div class="fragment_310">
    <h1>
        List of Items:
    </h1>
    <ul>
        [#if collectionObjectList??]
        [#list collectionObjectList as item]
        <li>${item.title}</li>
        [/#list]
        [/#if]
    </ul>
</div>
```

![You can develop a fragment with a collection selector using the collection configuration.](./fragment-configuration-types-reference/images/08.png)

### 컬렉션 선택기 필터링

`collectionSelector` 구성에서 `itemType`을 사용하여 컬렉션 선택기를 필터링할 수 있습니다. 예를 들어 웹 콘텐츠와 블로그를 포함한 다양한 컬렉션이 있는 경우 블로그 컬렉션만 표시하도록 컬렉션 선택기를 제한할 수 있습니다. 이 JSON 샘플은 이 구성을 보여줍니다.

```json
{
    "fieldSets": [
        {
            "label": "Collection",
            "fields": [
                {
                    "name": "collection",
                    "type": "collectionSelector",
                    "typeOptions": {
                        "itemType": "com.liferay.blogs.model.BlogsEntry"
                    }
                }
            ]
        }
    ]
}
```

이 샘플 구성을 사용하면 컬렉션 유형이 자산이므로 웹 콘텐츠와 블로그를 모두 포함하는 컬렉션이 컬렉션 선택기에서 필터링됩니다.

![A collection including web content and blog entries corresponds to the asset type.](./fragment-configuration-types-reference/images/09.png)

!!! tip

    `itemType` 외에도 구성에서 `itemSubtype`을 지정할 수 있습니다. 'itemSubtype'은 자산 'classPK'에 해당합니다.

### 반환된 컬렉션 항목의 최대 수 정의

기본적으로 최대 항목 수에 대한 제한을 정의하지 않으면 컬렉션의 모든 항목이 반환됩니다. JSON 구성에서 `numberOfItems`를 사용하여 이 제한을 설정할 수 있습니다.

```json
{
    "fieldSets": [
        {
            "label": "Collection",
            "fields": [
                {
                    "name": "collection",
                    "type": "collectionSelector",
                    "typeOptions": {
                        "numberOfItems": 3
                    }
                }
            ]
        }
    ]
}
```

## 색상 팔레트 구성

색상 팔레트 JSON 구성은 색상을 선택해야 하는 경우에 구현할 수 있는 색상 선택기를 생성합니다. [색상 선택기 구성](#color-picker-configuration) 과 달리 현재 사용되는 [스타일 북](../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) 의 색상 시스템에 구성된 테마 색상을 기준으로 옵션만 제공합니다.

이 구성은 `textColor`라는 색상 팔레트 필드를 생성합니다.

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "name": "textColor",
                    "label": "Text color",
                    "type": "colorPalette",
                    "dataType": "object",
                    "defaultValue": {
                        "color": "white"
                    }
                }
            ]
        }
    ]
}
```

`colorPalette` 유형은 `color` 값을 가진 객체를 저장합니다.

예를 들어 위의 코드 조각을 구현하면 FreeMarker에서 사용할 수 있습니다.

```html
<h3 class="text-${configuration.textColor.color}">Example</h3>
```

흰색을 선택한다면 `h3` 태그 제목은 `text-white` 클래스를 갖게 됩니다.

![The color palette configuration is useful when a color selection is necessary.](./fragment-configuration-types-reference/images/10.png)

## 탐색 메뉴 선택기 구성

{bdg-secondary}`liferay DXP 2024.Q1`

`navigationMenuSelector` 구성 유형을 사용하면 조각 HTML 편집기를 통해 FreeMarker 변수에 액세스하고 사용자 정의 탐색 메뉴를 렌더링하기 위한 마크업을 정의할 수 있습니다.

조각 HTML 편집기에서 FreeMarker 변수를 사용하려면 'navigationMenuSelector'를 [구성 유형](../../developing-page-fragments/adding-configuration-options-to-fragments.md#modify-the-configuration) 로 설정하여 시작하세요. 아래 JSON 조각을 모델로 사용할 수 있습니다.

```json
"fieldSets": [
    {
    "fields": [
        {
        "label": "source",
        "name": "source",
        "type": "navigationMenuSelector"
        }
    ]
    }
]
```

이제 `[name]Object` 아래에서 찾을 수 있는 FreeMarker 변수에 액세스할 수 있습니다. 이 예에서 `sourceObject.navItems`는 `sourceObject` 아래에 있는 `navItems` 목록을 반환합니다. 'source'가 구성에 사용된 이름이므로 개체를 `sourceObject`라고 합니다.

탐색 메뉴 선택기 구성 유형에 사용 가능한 변수는 다음과 같습니다.

| 변하기 쉬운            | 사용                                                                     |
| :---------------- | :--------------------------------------------------------------------- |
| `branchNavItems`  | 탐색 메뉴의 계층 구조를 나타냅니다.                                                   |
| `navItems`        | 각각 표시할 탐색 항목을 나타내는 `NavItem` 개체 목록입니다.                                 |
| `rootLayoutLevel` | 계층 구조의 수준을 정의합니다.                                                      |
| `rootLayoutType`  | 현재 페이지와 관련하여 루트 레이아웃을 해석하는 방법(절대, 상대 또는 선택)을 지정합니다. |

`navigationMenuSelector` 유형을 더 잘 보려면 [탐색 메뉴 조각](https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/reference/fragments/fragment-configuration-types-reference/liferay-r5q5.zip) 을 다운로드하여 조각 세트로 가져옵니다. 조각 가져오기에 대한 자세한 내용은 [조각 관리](../../../creating-pages/page-fragments-and-widgets/using-fragments/managing-fragments.md) 참조하세요.

## 관련 주제

- [조각 개발](../../developing-page-fragments/developing-fragments-intro.md)
- [조각별 태그 참조](./fragment-specific-tags-reference.md)
- [페이지 조각 편집기 인터페이스 참조](./page-fragment-editor-interface-reference.md)
- [스타일 북을 사용하여 사이트 모양 표준화](../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md)
