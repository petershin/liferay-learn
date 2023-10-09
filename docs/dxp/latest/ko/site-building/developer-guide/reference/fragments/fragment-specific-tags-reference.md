# 조각별 태그 및 속성 참조

표준 HTML, CSS 및 JavaScript와 함께 Liferay 관련 태그 및 속성을 사용하여 편집 가능한 섹션, 삽입 위젯 등을 정의할 수 있습니다.

편집 가능한 요소는 게시 전에 수정할 수 있습니다. 즉, 형식은 동일하지만 특정 상황에 적용할 수 있는 요소를 포함하는 간단하고 재사용 가능한 조각을 만들 수 있습니다.

다음과 같은 Liferay 관련 태그 및 속성을 사용할 수 있습니다.

- [편집 가능한 텍스트](#making-text-editable)
- [편집 가능한 이미지](#making-images-editable)
- [편집 가능한 링크](#creating-editable-links)
- [편집 가능한 HTML(Liferay Portal 7.3 GA3+ 및 DXP 7.3+)](#creating-editable-html)
- [내장된 위젯](#including-widgets-within-a-fragment)
- [지역화 가능한 조각 필드](#localizing-fragment-configurations)
- [날짜 조각](#using-date-fragments)
- [객체 작업을 버튼에 매핑](#making-buttons-action-ready)

Liferay Portal 7.3 GA3 및 Liferay DXP 7.3부터는 편집 가능한 요소를 `lfr-editable` 태그로 래핑하는 대신 `data-lfr-editable*` 속성을 사용하여 요소를 편집 가능한 것으로 정의할 수 있습니다.

```{warning}
편집 가능한 요소에는 `data-lfr-editable-id` 속성이 있으며 고유해야 합니다. 페이지 조각이 페이지에 추가된 후에는 ID를 변경하지 마십시오. 조각에 대한 변경 사항이 손실됩니다.
```

이전 태그는 이전 버전과의 호환성을 위해 계속 작동하지만 Portal 7.3 GA3+ 또는 Liferay DXP 7.3+를 실행하는 경우 작성하기 더 쉬운 최신 데이터 속성을 사용해야 합니다.

```{tip}
태그 이름을 입력하기 시작하면 [HTML 편집기](../../developing-page-fragments/using-the-fragments-editor.md)는 편집 가능한 요소와 같은 `lfr` 태그에 대한 자동 완성 기능을 제공합니다. 그리고 내장 가능한 위젯.
```

이 참조에는 사용 가능한 편집 가능한 태그 및 속성이 조각에서 사용하는 방법에 대한 예와 함께 나열되어 있습니다.

## 편집 가능한 요소

사이트 구축을 위해 편집 가능한 섹션, 동적 및 재사용 가능한 조각을 생성하거나 편집 가능한 요소를 사용하여 포틀릿에 내장된 위젯을 포함시켜 조각에 생기를 불어넣습니다.

해당 필드의 기본값이 되는 편집 가능한 요소에 텍스트, 이미지, 링크 및 HTML 코드를 제공합니다. 페이지의 최종 버전에 편집 가능한 콘텐츠를 표시할 수도 있고, 페이지를 게시하기 전에 대체해야 하는 필러 콘텐츠를 원할 수도 있습니다.

```{warning}
편집 가능한 필드의 Freemarker 코드는 조각이 페이지에 추가될 때(기본값을 설정하기 위해) 한 번만 실행됩니다.

값을 재평가해야 하는 경우에는 사용하지 마세요. 예를 들어 `${languageUtil.get(locale,'word')}`를 사용하여 값을 현지화하는 경우 해당 단어는 페이지에 조각을 추가할 때만 현지화됩니다. 포털의 언어를 변경하더라도 코드가 다시 실행되지 않습니다.
```

편집 가능한 요소에는 다양한 용도가 있습니다. 제품 설명을 제공하기 위해 제목, 작은 텍스트 상자, 이미지, 링크가 필요하다고 상상해 보십시오. 편집 가능한 필러 텍스트, 편집 가능한 이미지를 위한 공간, 적절한 형식 및 편집 가능한 링크가 포함된 조각을 만듭니다.

그런 다음 조각을 여러 페이지에 추가하고 설명해야 하는 각 제품에 대한 이미지, 텍스트 및 링크를 정의할 수 있습니다.

![편집 가능한 요소를 사용하여 편집 가능한 텍스트, 이미지, 링크가 포함된 조각을 만들 수 있습니다. 이 조각은 다양한 상황에서 편집하고 재사용할 수 있습니다.](./fragment-specific-tags-reference/images/01.png)

```{warning}
조각의 다른 편집 가능한 요소 내에 편집 가능한 요소를 중첩하는 것은 지원되지 않습니다.
```

## 텍스트를 편집 가능하게 만들기

이미지 요소에 `data-lfr-editable-type="text"` 속성을 포함하여 조각 텍스트를 편집 가능하게 만들 수 있습니다. `data-lfr-editable-id` 은 다음 예와 같이 고유 ID여야 합니다.

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

텍스트나 색상 스타일과 같은 서식 옵션이 필요한 경우 `rich-text`사용하세요.

```html
<p data-lfr-editable-id="text1" data-lfr-editable-type="rich-text">
  Placeholder
</p>
```

```{note}
편집 가능한 서식 있는 텍스트에 대해 모든 블록 요소 태그가 지원됩니다.
```

Liferay Portal 7.3 GA2 이하의 경우 아래 구문을 사용하십시오.

```html
<lfr-editable id="unique-id" type="rich-text">
   This is editable text that I can make bold or italic!
</lfr-editable>
```

```{note}
HTML 요소 내부의 텍스트를 편집 가능하게 만들려면 `rich-text` 유형을 사용해야 합니다. 'text' 유형은 렌더링하기 전에 텍스트에서 HTML 형식을 제거합니다.
```

## 이미지를 편집 가능하게 만들기

이미지는 텍스트와 동일한 `data-lfr-editable-type` 속성을 사용하지만 `image` 유형을 사용합니다. `data-lfr-editable-id` 은 고유 ID여야 합니다.

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

유형 `이미지` 포함된 `lfr-editable` 태그를 조각에 추가한 후 해당 조각을 페이지에 추가하면 편집 가능한 이미지를 클릭하고 콘텐츠 페이지 편집기에서 이미지 소스 및 기타 속성을 구성할 수 있습니다. 사이드바.

![콘텐츠 페이지에서 이미지를 정의하는 데는 여러 가지 옵션이 있습니다.](./fragment-specific-tags-reference/images/02.png)

대부분의 이미지는 이와 같이 처리될 수 있지만 편집 가능한 배경 이미지를 추가하려면 배경 이미지 ID( `data-lfr-Background-image-id`)를 설정하는 추가 속성을 추가해야 합니다. 배경 이미지 ID는 조각의 기본 `div` 에 설정되며 편집 가능한 이미지 ID와 동일합니다.

```html
<div data-lfr-background-image-id="background-img-unique-id">
   <h1 data-lfr-editable-id="h1-unique-id" data-lfr-editable-type="text">
      Placeholder
   </h1>
   <p data-lfr-editable-id="p-unique-id" data-lfr-editable-type="text">
      Placeholder
   </p>
</div>
```

콘텐츠 매핑은 조각의 편집 가능한 필드를 웹 콘텐츠 또는 블로그와 같은 자산 유형의 필드와 연결합니다. 예를 들어 이미지 필드를 매핑하여 웹 콘텐츠 기사에 대한 미리 보기 이미지를 표시할 수 있습니다. 매핑 필드에 대한 자세한 내용은 [조각 매핑 설정](../../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#mapping-settings)을 참조하세요.

## 편집 가능한 링크 만들기

`data-lfr-editable-type` 을 `link`으로 설정하여 일반 링크 요소를 편집 가능하게 만들 수 있습니다. `data-lfr-editable-id` 은 고유 ID여야 합니다.

다양한 방법으로 편집 가능한 링크 요소를 만들 수 있습니다. 여기 몇 가지 예가 있어요.

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

링크를 이메일과 연결하려면 `mailto:` URI 체계를 사용하세요.

```html
<a
  href="mailto:email@liferay.com"
  target="_blank"
  data-lfr-editable-id="link-to-email"
  data-lfr-editable-type="link"
>
  Send a Message
</a>
```

`tel:` URI 체계를 사용하여 링크를 전화번호와 연결합니다.

```html
<a
  href="tel:555-2368"
  target="_blank"
  data-lfr-editable-id="link-to-phone"
  data-lfr-editable-type="link"
>
  Who You Gonna Call?
</a>
```

### Liferay Portal 7.3 GA2 이하를 사용하여 편집 가능한 링크 만들기

Liferay Portal 7.3 GA2 이하의 경우 다음 구문을 사용하십시오.

```html
<lfr-editable id="unique-id" type="link">
    <a href="default-target-url-goes-here">Link text goes here</a>
</lfr-editable>
```

콘텐츠 페이지 편집기 사이드바에서 링크 유형, 대상 URL 및 링크 매핑을 편집할 수 있습니다.

![링크의 모양과 동작을 정의하는 여러 가지 옵션이 있습니다.](./fragment-specific-tags-reference/images/03.png)

편집 가능한 링크에 대한 자세한 내용은 [편집 가능한 링크](../../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#link-settings)을 참조하세요.

## 편집 가능한 HTML 만들기

`data-lfr-editable-type` 속성을 `html`으로 설정하여 일반 HTML 요소도 편집 가능하게 만들 수 있습니다.

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

각 위젯에는 등록된 이름과 해당 `lfr-widget-[name]` 태그가 있으며, 이를 조각에 포함하는 데 사용해야 합니다. 예를 들어 Menu Display 위젯은 `nav`로 등록되어 있으므로 태그는 `<lfr-widget-nav />`입니다. 다음과 같이 블록에 삽입할 수 있습니다.

```html
<div class="nav-widget">
    <lfr-widget-nav>
    </lfr-widget-nav>
</div>
```

삽입할 수 있는 위젯과 해당 태그는 다음과 같습니다.

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

### 위젯에 임베딩 활성화하기

조각에 포함하려는 사용자 정의 위젯이 있는 경우 해당 위젯을 포함 가능하도록 구성할 수 있습니다. 위젯을 포함하려면 OSGi 구성요소여야 합니다. 포함하려는 포틀릿 클래스의 `@Component` 주석 내부에 다음 속성을 추가합니다.

```properties
com.liferay.fragment.processor.PortletRegistry
```

또한 `PortletRegistry`를 사용하여 포틀릿에 대한 별칭을 등록 및 등록 취소하도록 `@Activate` 및 `@Deactivate` 라이프 사이클 메소드를 설정하십시오.

```java
public class MySamplePortlet extends MVCPortlet {

    @Activate
    protected void activate() {
        _portletRegistry.registerAlias(
            _ALIAS,
            MySamplePortletKeys.SAMPLE);
    }

    @Deactivate
    protected void deactivate() {
        _portletRegistry.unregisterAlias(_ALIAS);
    }

    private static final String _ALIAS = "sample";

    @Reference
    private PortletRegistry _portletRegistry;
}
```

위젯을 배포하면 추가할 수 있습니다. 속성에 지정하는 이름은 다음과 같이 `lfr-widget` 태그에 추가되어야 합니다.

```markup
<lfr-widget-app-name>
</lfr-widget-app-name>
```

> 사용 가능: U60 이전의 Liferay DXP/Portal 7.4+

이전 버전의 경우 조각에 포함하려는 사용자 정의 위젯이 있는 경우 해당 위젯을 포함 가능하도록 구성할 수 있습니다. 위젯을 포함하려면 OSGi 구성요소여야 합니다. 포함하려는 포틀릿 클래스의 `@Component` 주석 내부에 다음 속성을 추가합니다.

```properties
com.liferay.fragment.entry.processor.portlet.alias=app-name
```

위젯을 배포하면 추가할 수 있습니다. 속성에 지정하는 이름은 다음과 같이 `lfr-widget` 태그에 추가되어야 합니다.

```markup
<lfr-widget-app-name>
</lfr-widget-app-name>
```

```{note}
W3C HTML 표준에 따르면 맞춤 요소는 자동으로 닫힐 수 없습니다. 따라서 여는 태그와 닫는 `<lfr-widget...>` 태그 사이에 아무것도 추가할 수 없더라도 태그에 대해 자체 닫는 표기법을 사용할 수 없습니다.
```

## 조각 구성 지역화

> 사용 가능: Liferay DXP/Portal 7.4+

페이지의 대상 언어에 대한 조각 구성을 현지화할 수 있습니다. 예를 들어, 버튼 조각에서 페이지 언어가 en-US인 경우 하나의 버튼 유형을 정의하고 페이지 언어가 es-ES인 경우 다른 버튼 유형을 정의할 수 있습니다. 조각 구성 필드를 현지화하려면 `현지화 가능` 속성을 사용하세요.

```{note}
`configurationRole` 속성이 `style`로 설정된 조각 구성 필드에는 `localized` 속성을 사용할 수 없습니다.
```

다음 코드 발췌에서 버튼 조각 구성은 `fieldSets`아래의 `fields` 섹션에 대해 `지역화 가능` 속성을 `true` 으로 설정합니다. `지역화 가능` 속성은 필드 수준에서 설정됩니다. 이 예에는 `ButtonType` 필드가 하나만 있습니다. 여러 필드가 있는 조각이 있는 경우 각 필드에 대해 `지역화 가능` 속성을 설정할 수 있습니다.

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
]
```

이 샘플 코드를 사용하여 페이지의 대상 언어에 따라 버튼 유형을 변경할 수 있습니다. 다음 예에서 _Contact Us_/_Contacto_ 버튼 조각은 `버튼 유형` 필드에 대해 `지역화 가능` 속성을 `true` 로 설정합니다. 예제에서는 이 속성을 사용하여 페이지가 en-US 언어(A)를 사용할 때 _기본_ 버튼 유형을 구성하고, 페이지가 es-ES(B)를 사용할 때 _개요 기본_ 유형을 구성합니다.

![조각의 지역화 가능한 요소는 일반 탭 아래에 플래그 아이콘을 표시하고 다양한 언어에 대해 다양한 구성을 지원합니다.](./fragment-specific-tags-reference/images/04.png)

```{tip}
조각의 일반 설정 아래에 있는 플래그 아이콘은 구성 필드가 현지화 가능함을 나타냅니다.
```

언어에 대한 사용자 정의 구성을 지정하지 않는 `지역화 가능` 속성이 있는 조각은 기본 페이지 언어 구성을 사용합니다.

## 날짜 조각 사용

지역의 날짜 형식을 준수하는 것은 여러 상황에서 어려울 수 있습니다. 조각에 `data-lfr-editable-id="date-time"` 및 `data-lfr-editable-type="date-time"` 속성을 포함하면 날짜 조각을 사용하여 날짜 형식을 사용자 정의하고 현지화할 수 있습니다. `data-lfr-editable-id` 은 다음 예와 같이 고유 ID여야 합니다.

```html
<div data-lfr-editable-type="date-time" data-lfr-editable-id="date-time">
    02/03/11 00:00 AM
</div>
```

### 날짜 형식

기본적으로 가장 일반적인 날짜 형식을 선택하거나 [`SimpleDateFormat`](https://devdocs.io/openjdk~8/java/text/simpledateformat)에 따라 날짜 형식을 사용자 정의할 수 있습니다.

기본적으로 제공되는 네 가지 옵션은 다음과 같습니다.

| 날짜 표시 형식   | 어떻게 보이는지    |
|:---------- |:----------- |
| 월/일/연도     | 08/07/23    |
| DD/MM/YY   | 07/08/23    |
| YY/MM/DD   | 23/08/07    |
| DD/MM/YYYY | 2023년 7월 8일 |

날짜 형식을 사용자 정의하는 경우 다양한 날짜 및 시간 패턴(예: 연대 지정자, 시간대, 주의 요일 이름)을 포함할 수 있습니다.

여기 몇 가지 예가 있어요.

| 날짜 표시 형식                   | 어떻게 보이는지                       |
|:-------------------------- |:------------------------------ |
| MMMM dd, YYYY. 아:mma       | 2023년 8월 7일. 오전 11시 57분        |
| MM.dd.YY                   | 08.07.23                       |
| 아아 '시' 아, zzzz             | 오전 11시, 녹색의 표준시                |
| KK:mm a, z                 | 오전 11시 57분(그리니치 표준시)           |
| EEE, d MMM yyyy HH:mm:ss Z | 2023년 8월 7일 월요일 11:57:00 +0000 |

```{tip}
[조각 구성 필드를 현지화](#localizing-fragment-configurations)하는 것과 동일한 방식으로 날짜 형식을 현지화할 수 있습니다.
```

## 버튼을 작동 가능하게 만들기

`data-lfr-editable-id="action"` 및 `data-lfr-editable-type="action"` 속성을 버튼 태그에 포함시켜 버튼 구성 요소를 사용하여 [객체 작업](../../../../building-applications/objects/creating-and-managing-objects/actions.md) 을 트리거할 수 있습니다. `data-lfr-editable-id` 은 다음 예와 같이 고유 ID여야 합니다.

```html
<button class="btn btn-${configuration.buttonSize} btn-${configuration.buttonType}" data-lfr-editable-id="action" data-lfr-editable-type="action">
    Go Somewhere
</button>
```

## 관련 주제

- [Fragments Toolkit 명령 참조](./fragments-toolkit-command-reference.md)
- [페이지 조각 편집기 인터페이스 참조](./page-fragment-editor-interface-reference.md)
- [조각 구성 유형 참조](./fragment-configuration-types-reference.md)
