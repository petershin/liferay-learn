# 오픈 그래프 구성

> 사용 가능: Liferay DXP/Portal 7.3+

[Open Graph](https://ogp.me/) 은 Facebook, Slack 및 Twitter와 같이 사이트 콘텐츠를 지원하는 애플리케이션 컨텍스트에서 공유할 때 사이트 콘텐츠의 미리보기를 표준화하는 인터넷 프로토콜입니다. [RDFa](https://en.wikipedia.org/wiki/RDFa)와 유사하게 구조화된 데이터를 페이지 헤더에 `<meta>` 태그로 삽입하여 이를 수행합니다.

기본적으로 Open Graph `<meta>` 태그는 모든 공개 Liferay 페이지에 포함되어 있지만 원하는 경우 사이트 수준에서 이 동작을 비활성화할 수 있습니다. 사이트 설정에서 기본 `og:image` 속성을 설정할 수도 있습니다. 이 값은 [페이지](../creating-pages/page-settings/configuring-individual-pages.md#open-graph) 또는 [디스플레이 페이지](../displaying-content/using-display-page-templates/configuring-seo-and-open-graph.md) 수준에서 재정의되지 않는 한 모든 페이지에 사용됩니다.

```{note}
Open Graph `<meta>` 태그는 인증되지 않은 사용자에게만 페이지 헤더에 포함됩니다. 사용자가 로그인하면 포함되지 않습니다.
```

사이트에 대한 Open Graph를 구성하려면 다음 단계를 따르십시오.

1. *사이트 메뉴* (![Site Menu](../../images/icon-product-menu.png))을 열고 *구성* &rarr; *설정* (이전에는 *사이트 설정*)으로 이동합니다.

1. *Open Graph* 하위 제목까지 아래로 스크롤하여 확장합니다.

1. 사이트에 대한 오픈 그래프를 활성화/비활성화하려면 *오픈 그래프 활성화* 설정을 선택/선택 취소합니다.

   ![사이트 페이지에 포함된 오픈 그래프 태그를 활성화 또는 비활성화합니다.](./configuring-open-graph/images/01.png)

1. (선택 사항) *이미지* 및 *이미지 대체 설명* 필드를 사용하여 사이트 페이지의 기본 `og:image` 속성을 설정합니다.

   이러한 값은 [페이지](../creating-pages/page-settings/configuring-individual-pages.md#open-graph) 및 [디스플레이 페이지](../displaying-content/using-display-page-templates/configuring-seo-and-open-graph.md) 구성으로 재정의됩니다.

   ![사이트에 사용되는 기본 og:image 및 og:image:alt 속성을 정의합니다.](./configuring-open-graph/images/02.png)

1. 기본 `og:image` 구성을 미리 봅니다.

   이미지의 비율은 공유 위치에 따라 변경될 수 있습니다.

   ![기본 Open Graph 구성을 미리 봅니다.](./configuring-open-graph/images/03.png)

1. *저장*을 클릭합니다.

## `og:image` 속성 분석

이미지를 선택하면 DXP는 선택한 이미지가 표시되는 방식을 결정하는 여러 가지 구조화된 속성을 자동으로 추가합니다. 이미지 필드는 다음 `<meta>` 태그를 정의합니다.

```html
<meta property="og:image" content="http://example.com/ogp.jpg" />
<meta property="og:image:secure_url" content="https://secure.example.com/ogp.jpg" />
<meta property="og:image:type" content="image/jpeg" />
<meta property="og:image:width" content="400" />
<meta property="og:image:height" content="300" />
```

이미지 대체 설명 필드에 텍스트를 입력하면 선택한 이미지에 대해 화면 판독기가 읽는 기본 텍스트가 결정됩니다.

오픈 그래프 이미지에 대한 현지화된 대체 설명을 생성하려면 *언어 플래그* 버튼을 클릭하고 설정하려는 언어를 선택합니다. 여기에 입력한 값은 기본 `og:image:alt` 태그를 정의합니다.

```html
<meta property="og:image:alt" content="This is an example." />
```

## 추가 정보

* [검색 엔진 최적화](../optimizing-sites.md)
* [사이트 설정 UI 참조](./site-settings-ui-reference.md)
* [개별 페이지 구성](./../creating-pages/page-settings/configuring-individual-pages.md)
