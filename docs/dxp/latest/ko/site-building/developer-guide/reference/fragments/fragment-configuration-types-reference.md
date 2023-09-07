# 조각 구성 유형 참조

이 참조에는 조각에 사용할 수 있는 구성 유형이 나열되어 있습니다. 조각을 구성 가능하게 만드는 방법에 대한 자세한 내용은 [조각에 구성 옵션 추가하기](../../developing-page-fragments/adding-configuration-options-to-fragments.md) 를 참조하세요.

구현할 수 있는 구성 가능한 조각 유형은 다음과 같습니다:

- `text`
- `select`
- `checkbox`
- `컬러피커` (Liferay 7.4 이상 사용 가능)
- `길이` (사용 가능한 Liferay 7.4+ U44/GA44)
- `itemSelector`
- `url` (라이프레이 7.4 이상 사용 가능)
- `비디오 셀렉터` (라이프레이 7.4 이상 사용 가능)
- `collectionSelector`
- `colorPalette`

```{note}
FreeMarker 컨텍스트에 삽입된 구성 값은 JSON 파일에 지정된 정의된 `데이터 유형` 값을 따릅니다. 예를 들어, `데이터 유형`이 문자열인 경우 `configuration.[name-value]?is_string`은 `true`입니다.
```

## 텍스트 구성

이 JSON 구성은 텍스트 옵션을 수동으로 입력해야 하는 경우를 위해 구현할 수 있는 입력 텍스트 필드를 생성합니다:

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

![텍스트 구성은 입력 텍스트 옵션이 필요할 때 유용합니다.](./fragment-configuration-types-reference/images/06.png)

## 구성 선택

이 JSON 구성은 미리 정의된 옵션을 선택해야 하는 경우에 대해 구현할 수 있는 선택기를 생성합니다:

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

![선택 구성은 옵션 선택이 필요할 때 유용합니다.](./fragment-configuration-types-reference/images/05.png)

## 체크박스 구성

이 JSON 구성은 부울 값 선택이 필요한 경우에 대해 구현할 수 있는 확인란을 생성합니다:

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

![체크박스 구성은 부울 선택이 필요할 때 유용합니다.](./fragment-configuration-types-reference/images/01.png)

## 색상 선택기 구성

{bdg-secondary}`라이프레이 7.4 이상 사용 가능`

색상 선택기 JSON 구성은 모든 색상을 선택할 수 있는 유연한 색상 선택기를 생성합니다. 이러한 방법 중 하나를 사용하여 색상을 선택할 수 있습니다:

* 왼쪽의 색상을 클릭하면 색상 선택기가 열리고 색상을 선택할 수 있습니다.

* 텍스트 상자에 색상의 16진수 코드를 입력합니다.

* *스타일북의 값* 버튼을 클릭하면 현재 사용 중인 [스타일북](../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md)에 정의된 색상을 선택할 수 있는 사전 정의된 색상 메뉴가 열립니다. 이렇게 하면 필드 값이 선택한 토큰에 연결되며, 버튼을 다시 눌러 연결을 해제할 때까지 연결이 해제됩니다. 토큰 값의 연결을 해제하면 선택한 색상이 다시 해당 16진수 코드 값으로 변환됩니다.

* 색상 선택기에 기본값이 정의되어 있지 않은 경우 *기본값* 드롭다운 메뉴를 클릭하여 현재 사용 중인 스타일북에서 원하는 색상을 선택합니다. 이는 값을 선택할 때 스타일북의 값 버튼과 동일하게 작동합니다.

![색상 선택기 구성을 사용하면 색상 값을 직접 입력하거나 범위에서 하나를 선택하거나 스타일 북에서 선택할 수 있습니다.](./fragment-configuration-types-reference/images/02.png)

```{note}
사용 중인 테마에 [스타일 북에 대한 토큰 정의](../../../사이트-외관/스타일 북/개발자 가이드/스타일 북 토큰 정의.md)가 없는 경우 페이지의 색상 선택기 구성이 [색상 팔레트](#컬러 팔레트 구성) 구성으로 바뀝니다.
```

이 JSON 구성은 `headingColor`라는 색상 선택기 필드를 생성합니다:

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

`colorPicker` 유형은 선택한 색상 값과 구성된 이름을 가진 객체를 저장합니다. 조각의 HTML에서 이 객체를 다음과 같이 참조할 수 있습니다:

```html
<div class="fragment_69">
    <h1 style="color: ${configuration.headingColor}">
        This text's color is configurable.
    </h1>
</div>
```

조각이 렌더링되면 `${configuration.OBJECT_NAME}` 토큰이 선택한 색상으로 대체됩니다. 색상을 선택하는 방법에 따라 값의 유형이 달라집니다:

* 색상을 직접 선택한 경우 해당 16진수 코드 값으로 대체됩니다.
* 현재 스타일북에서 색상을 선택한 경우 연결된 토큰에 대한 CSS 변수로 대체됩니다(예: `var(--danger)`).
* 현재 테마에 사용할 토큰 정의가 없는 경우( [색상표](#color-palette-configuration) 대신 사용됨) CSS 색상으로 대체됩니다(예: `rgb(255, 0, 0)`).

## 길이 구성

{bdg-secondary}`라이프레이 7.4 U44 및 GA44+ 사용 가능`

`길이` 구성 유형은 숫자를 입력하고 미리 정의된 단위를 선택하거나 너비, 여백 및 패딩과 같은 설정에 대해 자체 단위를 지정할 수 있는 필드를 생성합니다.

이 JSON 샘플은 `길이` 구성 유형을 사용하는 필드를 보여줍니다. 여기에는 이름, 레이블 및 기본값을 정의하는 속성이 포함됩니다.

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

사용자 인터페이스에서 사용 가능한 단위 중에서 선택하거나 사용자 지정 단위를 지정할 수 있습니다.

<!-- The below screenshot is way too big. Please reduce. -Rich --> 

![사용자 지정 조각의 '크기' 레이블이 지정된 필드는 길이 구성을 사용하여 사용 가능한 단위의 드롭다운을 표시합니다.](./fragment-configuration-types-reference/images/10.png)

## 항목 선택기 구성

{bdg-secondary}`라이프레이 7.3 이상 사용 가능`

이 구성은 조각에 포함할 기존 콘텐츠(기본적으로 웹 콘텐츠 문서, 블로그 항목 또는 문서) 하나를 선택할 수 있는 선택기를 만듭니다.

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

작성자가 특정 유형의 콘텐츠만 선택하도록 하는 고급 구성을 제공할 수 있습니다. 아래 구성은 웹 콘텐츠 문서만 선택할 수 있도록 지정합니다. 선택 사항인 `itemSubtype` 속성은 선택한 웹 콘텐츠 문서가 `article-structure-key-15` 구조를 사용해야 선택되도록 지정합니다:

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

이 예에서는 `메타데이터셋-구조-키-2` 구조를 사용하는 `img` 또는 `jpg` MIME 형식의 문서만 선택할 수 있도록 지정합니다:

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
            "itemSubtype": "metadataset-structure-key-2",
            "mimeTypes": [
              "img/jpg"
            ]
          }
        }
      ]
    }
  ]
}
```

이 예에서는 블로그 항목만 선택할 수 있도록 지정합니다:

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

그런 다음 웹 콘텐츠 기사에 대한 이 HTML 스니펫을 사용하여 조각의 콘텐츠를 렌더링할 수 있습니다:

```html
<div class="fragment_name">
  [#if configuration.itemSelector1.content??]
       ${configuration.itemSelector1.content}
  [/#if]
</div>
```

콘텐츠의 특정 부분에 액세스해야 하는 경우, `[name-of-field]Object` (아래 예시에서는`itemSelector1Object` ) 키로 조각의 Java 객체에 액세스할 수도 있습니다. 이 예는 웹 콘텐츠 문서의 제목, 설명 및 본문을 렌더링합니다:

```html
<div class="fragment_name">
  [#if configuration.itemSelector1.content??]
      ${itemSelector1Object.getTitle()}
      ${itemSelector1Object.getDescription()}
      ${itemSelector1Object.getContent()}
  [/#if]
</div>
```

![항목 선택기 구성은 기존 콘텐츠를 표시하는 옵션을 선택해야 할 때 유용합니다.](./fragment-configuration-types-reference/images/04.png)

## URL 구성

이 구성은 조각의 마크업에 사용할 URL 전용 필드를 추가합니다:

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

이 구성으로 조각을 구성할 때 드롭다운 메뉴에서 URL을 직접 입력하거나(`URL`), 동일한 사이트의 다른 페이지를 선택하여 전체 URL을 사용할 수 있습니다(`페이지`).

다음은 위 JSON의 URL 구성을 사용하여 하이퍼링크를 생성하는 조각 HTML의 예입니다:

```html
<div class="fragment_1">
    <a href=${configuration.myURL}>Click this link!</a>
</div>
```

## 비디오 선택기

{bdg-secondary}`라이프레이 7.4 이상 사용 가능`

`videoSelector` 유형을 사용하여 동영상 선택기를 생성하여 [외부 동영상](../../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md) 조각을 다른 조각에 통합할 수 있습니다.

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

이 기능은 기본적으로 동영상이 삽입된 조각을 원할 때 유용합니다. 다음 JSON 구성 샘플은 카드 조각에 외부 비디오 선택기를 통합하는 방법을 보여줍니다:

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

![동영상 선택기를 사용하여 외부 동영상을 조각으로 포함할 수 있습니다.](./fragment-configuration-types-reference/images/07.png)

```{note}
비디오 선택기` 유형은 [외부 비디오](../../../페이지-조각 및 위젯 생성/사용-조각/기본-조각 참조.md#external-video) 조각과 호환되지만 [비디오 URL](../../../페이지-조각 및 위젯 생성/사용-조각/기본-조각 참조.md) 조각과 호환되지는 않습니다.
```

## 컬렉션 선택기

{bdg-secondary}`라이프레이 7.3 이상 사용 가능`

`collectionSelector` 구성 유형을 사용하여 [컬렉션](../../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md) 또는 컬렉션 공급자를 포함하는 조각을 개발할 수 있습니다. 수동 컬렉션과 동적 컬렉션 모두에 `collectionSelector` 를 사용할 수 있습니다.

```{note}
개발자는 컬렉션 공급자를 사용하여 고급 기준을 사용하여 특정 컬렉션을 만들 수 있습니다. 자세한 내용은 [정보 프레임워크](https://help.liferay.com/hc/ko/articles/360029067251-Introduction-to-The-Info-Framework) 개발자 문서에서 [정보 목록 공급자 만들기](https://help.liferay.com/hc/ko/articles/360029067271-Creating-an-Information-List-Provider) 에 대한 정보를 참조하세요.
```

다음 JSON 구성은 `collectionSelector`를 사용하는 방법을 보여줍니다:

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

이 조각 구성을 다음 HTML 코드 샘플과 함께 사용하여 컬렉션 항목을 나열할 수 있습니다. `collectionObjectList` 는 [콘텐츠 페이지 편집기](../../../creating-pages/using-content-pages/content-page-editor-ui-reference.md)에서 선택한 컬렉션을 나타냅니다.

HTML에서 이 컬렉션을 참조하려면 JSON 구성에서 컬렉션 `이름` 및 `ObjectList` 접미사를 사용합니다. 이전 JSON 코드 발췌에서 컬렉션 `이름` 은 `컬렉션` 이므로 HTML은 `collectionObjectList`를 사용하여 컬렉션을 참조합니다.

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

![컬렉션 구성을 사용하여 컬렉션 선택기를 사용하여 조각을 개발할 수 있습니다.](./fragment-configuration-types-reference/images/08.png)

### 컬렉션 선택기 필터링

컬렉션 선택기를 필터링하려면 `collectionSelector` 구성에서 `itemType` 을 사용하여 컬렉션 선택기를 필터링할 수 있습니다. 예를 들어 웹 콘텐츠와 블로그 등 서로 다른 컬렉션이 있는 경우 블로그 컬렉션만 표시되도록 컬렉션 선택기를 제한할 수 있습니다. 이 JSON 샘플은 이 구성을 보여줍니다:

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

이 샘플 구성을 사용하면 컬렉션 유형이 자산이기 때문에 웹 콘텐츠와 블로그를 모두 포함하는 컬렉션이 컬렉션 선택기에서 필터링됩니다.

![웹 콘텐츠 및 블로그 항목이 포함된 컬렉션은 자산 유형에 해당합니다.](./fragment-configuration-types-reference/images/09.png)

```{tip}
항목 유형` 외에도 설정에서 `항목 하위 유형`을 지정할 수 있습니다. itemSubtype`은 `classPK` 에셋에 해당합니다.
```

### 반품된 수거 품목의 최대 개수 정의하기

기본적으로 최대 항목 수에 대한 제한을 정의하지 않으면 컬렉션의 모든 항목이 반환됩니다. 이 제한은 JSON 구성에서 `numberOfItems` 을 사용하여 설정할 수 있습니다.

```json
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
```

## 색상 팔레트 구성

색상표 JSON 구성은 색상을 선택해야 하는 경우에 대해 구현할 수 있는 색상 선택기를 생성합니다. [색상 선택기 구성](#color-picker-configuration) 과 달리 현재 사용 중인 [스타일북](../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md)의 색상 시스템에 구성된 테마 색상을 기반으로 하는 옵션만 제공합니다.

이 구성은 `textColor`라는 색상 팔레트 필드를 만듭니다:

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
                        "cssClass": "white",
                        "rgbValue": "rgb(255,255,255)"
                    }
                }
            ]
        }
    ]
}
```

`colorPalette` 유형은 두 개의 값( `cssClass` 및 `rgbValue`)이 있는 객체를 저장합니다.

예를 들어, 위의 스니펫을 구현하면 FreeMarker에서 사용할 수 있습니다:

```html
<h3 class="text-${configuration.textColor.cssClass}">Example</h3>
```

흰색을 선택하는 경우 `h3` 태그 제목은 `text-white'`클래스를 갖게 됩니다.

![색상 팔레트 구성은 색상 선택이 필요할 때 유용합니다.](./fragment-configuration-types-reference/images/03.png)

## 관련 주제

- [프래그먼트 개발](../../developing-page-fragments/developing-fragments-intro.md)
- [조각별 태그 참조](./fragment-specific-tags-reference.md)
- [페이지 조각 편집기 인터페이스 참조](./page-fragment-editor-interface-reference.md)
- [스타일 북을 사용하여 사이트 모양 표준화하기](../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md)
