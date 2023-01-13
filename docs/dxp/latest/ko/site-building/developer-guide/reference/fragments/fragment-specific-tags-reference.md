# 단편별 태그 및 속성 참조

표준 HTML, CSS 및 JavaScript와 함께 Liferay 전용 태그를 사용할 수 있으며 Liferay Portal 7.3 GA3 및 Liferay DXP 7.3부터 속성을 사용하여 조각에 편집 가능한 섹션을 만들거나 위젯을 포함할 수 있습니다. 편집 가능한 요소는 게시 전에 수정할 수 있습니다. 즉, 서식이 동일하지만 특정 컨텍스트에 적용할 수 있는 요소를 포함하는 단순하고 재사용 가능한 조각을 만들 수 있습니다.

```{warning}
프래그먼트의 다른 편집 가능한 요소 내부에 편집 가능한 요소를 중첩하는 것은 지원되지 않습니다.
```

페이지 조각은 이러한 기능을 추가하는 이러한 유형의 liferay 관련 태그 및 속성에 액세스할 수 있습니다.

- [편집 가능한 텍스트](#making-text-editable)
- [편집 가능한 이미지](#making-images-editable)
- [편집 가능한 링크](#creating-editable-links)
- [편집 가능한 HTML(Liferay Portal 7.3 GA3+ 및 DXP 7.3+)](#creating-editable-html)
- [임베디드 위젯](#including-widgets-within-a-fragment)
- [현지화 가능한 조각 필드](#localizing-fragment-configurations)

```{tip}
태그 이름 입력을 시작하면 [HTML 편집기](../../developing-page-fragments/using-the-fragments-editor.md)가 편집 가능한 요소와 같은 `lfr` 태그에 대한 자동 완성 기능을 제공합니다. 포함 가능한 위젯.
```

여기에 제공하는 텍스트 또는 이미지는 필드의 기본값입니다. 페이지의 최종 버전에 표시하거나 페이지를 게시하기 전에 교체해야 하는 필러 텍스트를 원할 수 있습니다.

이 모든 것이 함께 작동하여 사이트 구축을 위한 동적이며 재사용 가능한 요소를 만드는 데 도움이 됩니다. 예를 들어 제품 설명을 제공하기 위해 이미지와 링크가 있는 작은 텍스트 상자가 필요한 경우 편집 가능한 필러 텍스트, 편집 가능한 이미지를 위한 공간, 적절한 서식 및 편집 가능한 링크가 포함된 조각을 만들 수 있습니다. 그런 다음 조각을 여러 페이지에 추가하고 설명해야 하는 각 제품에 대한 이미지, 텍스트 및 링크를 정의할 수 있습니다.

```{warning}
편집 가능한 요소의 ID는 고유해야 합니다. 페이지 조각이 페이지에 추가된 후에는 ID를 변경하지 마십시오. 편집 가능한 조각이 수정된 후 ID를 변경하면 변경 사항이 손실될 수 있습니다.
```

위젯을 포함하여 프래그먼트를 더욱 동적으로 만들 수 있습니다. 현재 포틀릿은 포함할 수 있는 유일한 위젯 유형이지만 다른 옵션도 계획되어 있습니다.

![프래그먼트 편집기는 프래그먼트별 태그에 대한 자동 완성 기능을 제공합니다.](./fragment-specific-tags-reference/images/01.png)

이 참조는 프래그먼트에서 사용하는 방법의 예와 함께 사용 가능한 편집 가능한 태그 및 속성을 나열합니다.

```{note}
Liferay Portal 7.3 GA3 및 Liferay DXP 7.3부터 편집 가능한 요소를 `lfr-editable` 태그로 래핑하는 대신 `data-lfr-editable*` 속성을 사용하여 요소를 편집 가능한 것으로 정의할 수 있습니다. 이전 태그는 이전 버전과의 호환성을 위해 여전히 작동하지만 Portal 7.3 GA3+ 또는 Liferay DXP 7.3을 실행 중인 경우 쓰기가 더 쉽기 때문에 최신 데이터 속성을 사용하는 것이 좋습니다.
```

## 텍스트를 편집 가능하게 만들기

이미지 요소에 `data-lfr-editable-type="text"` 속성을 포함하여 조각 텍스트를 편집 가능하게 만들 수 있습니다. `data-lfr-editable-id` 은 다음 예와 같이 고유한 ID여야 합니다.

```html
<p data-lfr-editable-id="text1" data-lfr-editable-type="text">
  Placeholder
</p>
```

```{note}
편집 가능한 텍스트에는 모든 블록 요소와 인라인 요소가 지원됩니다.
```

Liferay Portal 7.3 GA2 이하의 경우 아래 구문을 사용하십시오. 요소를 올바르게 렌더링하려면 고유 ID가 필요합니다.

```html
<lfr-editable id="unique-id" type="text">
   This is editable text!
</lfr-editable>
```

텍스트 또는 색상 스타일과 같은 서식 옵션이 필요한 경우 `서식있는 텍스트`을 사용하십시오.

```html
<p data-lfr-editable-id="text1" data-lfr-editable-type="rich-text">
  Placeholder
</p>
```

```{note}
모든 블록 요소 태그는 편집 가능한 서식 있는 텍스트에 대해 지원됩니다.
```

Liferay Portal 7.3 GA2 이하의 경우 아래 구문을 사용하십시오.

```html
<lfr-editable id="unique-id" type="rich-text">
   This is editable text that I can make bold or italic!
</lfr-editable>
```

```{note}
HTML 요소 내부의 텍스트를 편집 가능하게 하려면 `rich-text` 유형을 사용해야 합니다. '텍스트' 유형은 렌더링 전에 텍스트에서 HTML 서식을 제거합니다.
```

## 이미지를 편집 가능하게 만들기

이미지는 텍스트와 동일한 `data-lfr-editable-type` 속성을 사용하지만 다음과 같이 `이미지` 유형을 사용합니다.

```html
<img
  src="placeholder.jpg"
  alt="Placeholder"
  data-lfr-editable-id="img1"
  data-lfr-editable-type="image"
>
```

Liferay Portal 7.3 GA2 이하의 경우 다음 구문을 사용하십시오.

```html
<lfr-editable id="unique-id" type="image">
   <img src="...">
</lfr-editable>
```

유형 `이미지` 이 포함된 `lfr-editable` 태그를 조각에 추가한 후 해당 조각을 페이지에 추가하면 편집 가능한 이미지를 클릭하고 콘텐츠 페이지 편집기에서 이미지 소스 및 기타 속성을 구성할 수 있습니다. 사이드바.

![콘텐츠 페이지에서 이미지를 정의하기 위한 몇 가지 옵션이 있습니다.](./fragment-specific-tags-reference/images/02.png)

대부분의 이미지는 이와 같이 처리할 수 있지만 편집 가능한 배경 이미지를 추가하려면 추가 속성을 추가하여 배경 이미지 ID, `data-lfr-background-image-id`을 설정해야 합니다. 배경 이미지 ID는 조각의 기본 `div` 에 설정되며 편집 가능한 이미지 ID와 동일합니다.

```html
<div data-lfr-background-image-id="unique-id">
   <lfr-editable id="unique-id" type="image">
      <img src="...">
   </lfr-editable>
</div>
```

콘텐츠 매핑은 프래그먼트의 편집 가능한 필드를 웹 콘텐츠 또는 블로그와 같은 자산 유형의 필드와 연결합니다. 예를 들어 이미지 필드를 매핑하여 웹 콘텐츠 기사의 미리보기 이미지를 표시할 수 있습니다. 매핑 필드에 대한 자세한 내용은 [Fragment Mapping Settings](../../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#mapping-settings)을 참조하십시오.

## 편집 가능한 링크 만들기

편집 가능한 링크 요소를 생성하기 위한 특정 구문도 있습니다.

```html
<a
  href="#placeholder"
  target="_blank"
  data-lfr-editable-id="link1"
  data-lfr-editable-type="link"
>
  Go to placeholder
</a>
```

Liferay Portal 7.3 GA2 이하의 경우 다음 구문을 사용하십시오.

```html
<lfr-editable id="unique-id" type="link">
    <a href="default-target-url-goes-here">Link text goes here</a>
</lfr-editable>
```

콘텐츠 페이지 편집기 사이드바에서 링크 유형, 대상 URL 및 링크 매핑을 편집할 수 있습니다.

![링크의 모양과 동작을 정의하기 위한 몇 가지 옵션이 있습니다.](./fragment-specific-tags-reference/images/03.png)

편집 가능한 링크에 대한 자세한 내용은 [편집 가능한 링크](../../../creating-pages/page-fragments-and-widgets/configuring-fragments/fragment-sub-elements-reference.md#link-settings)을 참조하십시오.

## 편집 가능한 HTML 만들기

`data-lfr-editable-type` 속성을 `html`으로 설정하여 일반 HTML 요소를 편집 가능하게 만들 수도 있습니다.

```html
<article data-lfr-editable-id="text1" data-lfr-editable-type="html">
  <h1>Placeholder</h1>
</article>
```

Liferay Portal 7.3 GA2 이하의 경우 다음 구문을 사용하십시오.

```html
<lfr-editable type="html" id="text1">
  <h1>Placeholder</h1>
</lfr-editable>
```

## 조각 내에 위젯 포함

각 위젯에는 등록된 이름과 해당하는 `lfr-widget-[name]` 태그가 있으며 이를 조각에 포함하는 데 사용해야 합니다. 예를 들어 메뉴 표시 위젯은 `nav`로 등록되어 있으므로 태그는 `<lfr-widget-nav />`입니다. 다음과 같이 블록에 포함할 수 있습니다.

```html
<div class="nav-widget">
    <lfr-widget-nav>
    </lfr-widget-nav>
</div>
```

포함할 수 있는 위젯과 관련 태그는 다음과 같습니다.

| 위젯 이름                 | 태그                                     |
| --------------------- | -------------------------------------- |
| DDL 디스플레이             | `<lfr-widget-dynamic-data-list>` |
| 양식                    | `<lfr-widget-form>`              |
| 콘텐츠 퍼블리셔              | `<lfr-widget-asset-list>`        |
| 이동 경로                 | `<lfr-widget-breadcrumb>`        |
| 종류 항법                 | `<lfr-widget-categories-nav>`    |
| Flash                 | `<lfr-widget-flash>`             |
| 미디어 갤러리               | `<lfr-widget-media-gallery>`     |
| 메뉴 표시                 | `<lfr-widget-nav>`               |
| 투표 전시                 | `<lfr-widget-polls>`             |
| 관련 애셋                 | `<lfr-widget-related-assets>`    |
| 사이트 맵                 | `<lfr-widget-site-map>`          |
| 꼬리표 구름                | `<lfr-widget-tag-cloud>`         |
| 꼬리표 항법                | `<lfr-widget-tags-nav>`          |
| 웹 내용 전시               | `<lfr-widget-web-content>`       |
| RSS 게시자(더 이상 사용되지 않음) | `<lfr-widget-rss>`               |
| 아이프레임                 | `<lfr-widget-iframe>`            |

### 위젯에 임베딩 활성화

조각에 포함하려는 사용자 정의 위젯이 있는 경우 해당 위젯을 포함할 수 있도록 구성할 수 있습니다. 위젯을 포함하려면 OSGi 구성 요소여야 합니다. 임베드하려는 포틀릿 클래스에 대한 `@Component` 주석 내부에 다음 특성을 추가하십시오.

```properties
com.liferay.fragment.entry.processor.portlet.alias=app-name
```

위젯을 배포하면 추가할 수 있습니다. 속성에서 지정하는 이름은 다음과 같이 `lfr-widget` 태그에 추가되어야 합니다.

```markup
<lfr-widget-app-name>
</lfr-widget-app-name>
```

```{note}
W3C HTML 표준에 따르면 사용자 정의 요소는 자동으로 닫힐 수 없습니다. 따라서 여는 태그와 닫는 `<lfr-widget...>` 태그 사이에 아무 것도 추가할 수 없더라도 태그에 대해 자체 닫기 표기법을 사용할 수 없습니다.
```

## 조각 구성 현지화

> 사용 가능: Liferay DXP/Portal 7.4+

페이지의 대상 언어에 대한 조각 구성을 현지화할 수 있습니다. 예를 들어 버튼 조각에서 페이지 언어가 en-US일 때 하나의 버튼 유형을 정의하고 페이지 언어가 es-ES일 때 다른 버튼 유형을 정의할 수 있습니다. 프래그먼트 구성 필드를 현지화하려면 `localizable` 속성을 사용하십시오.

```{note}
`configurationRole` 속성이 `style`로 설정된 프래그먼트 구성 필드에는 `localizable` 속성을 사용할 수 없습니다. 
```

다음 코드 발췌에서 버튼 조각 구성은 `fieldSets`아래의 `필드` 섹션에 대해 `localizable` 속성을 `true` 으로 설정합니다. `지역화 가능` 특성은 필드 수준에서 설정됩니다. 이 예에는 `buttonType` 필드가 하나만 있습니다. 여러 필드가 있는 프래그먼트가 있는 경우 각각에 대해 `localizable` 속성을 설정할 수 있습니다.

```markup
"fieldSets": [
  {
    "fields": [
      {
        "dataType": "string",
        "defaultValue": "primary",
        "label": "type",
        "name": "buttonType",
        "type": "select",
        "localizable": true,
        "typeOptions": {
          "validValues": [
            {
              "value": "primary"
            },
            {
              "value": "secondary"
            },
            {
              "value": "link"
            },
            {
              "value": "outline-primary"
            },
            {
              "value": "outline-secondary"
            }
          ]
        }
      }
    ]
  }
```

이 샘플 코드를 사용하여 페이지의 대상 언어에 따라 버튼 유형을 변경할 수 있습니다. 다음 예에서 _Contact Us_/_Contacto_ 버튼 조각은 `buttonType` 필드에 대해 `localizable` 속성을 `true` 로 설정합니다. 예제에서는 이 속성을 사용하여 페이지가 en-US 언어(A)를 사용하는 경우 _기본_ 버튼 유형을 구성하고 페이지가 es-ES(B)를 사용하는 경우 _개요 기본_ 유형을 구성합니다.

![프래그먼트의 현지화 가능한 요소는 일반 탭 아래에 플래그 아이콘을 표시하고 언어마다 다른 구성을 지원합니다.](./fragment-specific-tags-reference/images/04.png)

```{tip}
프래그먼트의 일반 설정 아래 플래그 아이콘은 구성 필드가 현지화 가능함을 나타냅니다. 
```

언어에 대한 사용자 정의 구성을 지정하지 않는 `지역화 가능` 속성이 있는 조각은 기본 페이지 언어의 구성을 사용합니다.

## 추가 정보

- [Fragments Toolkit 명령 참조](./fragments-toolkit-command-reference.md)
- [페이지 조각 편집기 인터페이스 참조](./page-fragment-editor-interface-reference.md)
- [조각 구성 유형 참조](./fragment-configuration-types-reference.md)
