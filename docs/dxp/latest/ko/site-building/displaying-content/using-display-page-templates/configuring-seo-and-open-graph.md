# SEO 및 오픈 그래프 구성

{bdg-secondary}`사용 가능: Liferay DXP/Portal 7.3+`

표시 페이지 템플릿은 전용 URL에 개별 콘텐츠 항목을 표시하는 사용자 정의 레이아웃입니다. 이러한 레이아웃은 조각과 위젯을 모두 사용하며 웹 콘텐츠 기사, 문서, 블로그 항목 등에 대해 생성될 수 있습니다. 각 템플릿에는 수동으로 또는 동적으로 채울 수 있는 자체 SEO 및 오픈 그래프 설정이 있습니다.

디스플레이 페이지 템플릿에 대한 SEO 및 오픈 그래프 설정을 구성하려면 다음 단계를 따르세요.

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 **디자인** &rarr; **페이지 템플릿** 으로 이동한 다음 **를 클릭합니다. 페이지 템플릿** 탭을 표시합니다.

   ![Go to the display page templates tab.](./configuring-seo-and-open-graph/images/01.png)

1. 원하는 템플릿에 대해 **작업**(![작업 아이콘](./../../../images/icon-actions.png))을 클릭하고 **편집** 을 선택합니다. 템플릿 편집 시 애플리케이션 표시줄에서 **옵션**(![옵션 아이콘](./../../../images/icon-options.png))을 클릭하고 **구성**(![아이콘 구성)을 클릭합니다. ](../../../images/icon-cog.png)).

1. [SEO](#seo-settings-reference) 또는 [오픈 그래프](#open-graph-settings-reference) 탭으로 이동하여 원하는 구성을 입력하세요.

   ![Enter the desired configuration in the SEO and Open Graph tabs.](./configuring-seo-and-open-graph/images/02.png)

1. **저장** 을 클릭하세요.

   ```{important}
   SEO와 오픈 그래프 탭 사이를 탐색할 때 저장되지 않은 변경 사항은 손실됩니다.
   ```

SEO 및 오픈 그래프 설정을 구성할 때 값을 직접 입력하고 필드 매핑을 사용하여 동적으로 값을 추가할 수 있습니다. 사용 가능한 매핑 옵션은 템플릿의 콘텐츠 유형과 하위 유형에 따라 다릅니다. 필드를 매핑하려면 **필드 선택기** 버튼(![매핑 버튼](../../../images/icon-map.png))을 클릭하고 사용 가능한 필드 중에서 선택하세요. Liferay DXP 7.4 U1 및 Portal 7.4 GA5부터 이런 방식으로 추가된 필드는 필드 참조 ID와 필드 레이블(`${fieldReferenceID:Field Label}`)이라는 두 부분으로 구성된 `${}` 자리 표시자로 표시됩니다.

이전 버전의 경우 매핑 자리 표시자에는 필드 참조 ID(예: `${title}`, `${authorName}`, `${Text84981642}`)만 포함됩니다.

Liferay는 사용자 정의 웹 콘텐츠 및 문서 구조의 필드 참조 ID가 사람이 읽을 수 없기 때문에(예: `${Text84981642:Contributors}) 관리 측면의 명확성을 위해 필드 레이블 값을 제공합니다. 레이블은 최종 사용자에게 표시되지 않으며 매핑에 영향을 주지 않으므로 사용자는 원하는 대로 편집할 수 있습니다. 매핑은 자리 표시자의 필드 참조 ID에만 의존합니다.

```{note}
Liferay는 가능한 경우 매핑된 필드에 대한 번역을 제공합니다. 그러나 매핑된 필드 외부에 제공된 텍스트는 번역되지 않습니다.
```

## SEO 설정 참조

검색 엔진 최적화(SEO)는 검색 엔진 결과 페이지(SERP)에서 페이지 순위를 높이는 데 사용되는 방법을 말합니다. 디스플레이 페이지 템플릿을 사용하면 SEO를 위한 콘텐츠의 디스플레이 페이지를 구성할 수 있습니다.

### HTML제목

HTML 제목 필드는 디스플레이 페이지의 `<title>` 태그를 정의합니다. 이 제목은 검색 엔진에서 페이지 순위를 매기는 데 사용되며 검색 엔진 결과에서 페이지 제목으로 사용됩니다. 기본적으로 표시 페이지 템플릿은 이 필드를 `${title}`에 매핑합니다. 이 값을 직접 편집하고 필드 선택기를 사용하여 추가 매핑을 포함할 수 있습니다(예: `${title} - ${authorName:Author Name}`).

**HTML 제목** 의 권장 길이는 60자 미만입니다.

```{tip}
SEO와 오픈 그래프 제목을 함께 업데이트하는 것이 가장 좋습니다.
```

![Combine multiple mapped fields to build your own HTML title.](./configuring-seo-and-open-graph/images/03.png)

### 묘사

설명 필드는 디스플레이 페이지의 설명 `<meta>` 태그를 정의합니다. 이 설명은 검색 엔진에서 페이지 순위를 매기는 데 사용되며 검색 엔진 결과에 페이지 미리보기로 표시됩니다. 기본적으로 표시 페이지 템플릿은 이 필드를 `${description}`에 매핑합니다. 이 값을 직접 편집하고 필드 선택기를 사용하여 추가 매핑을 포함할 수 있습니다(예: `${description} - ${authorName:Author Name}`).

페이지 설명의 권장 길이는 155자 미만입니다.

```{tip}
SEO와 오픈 그래프 설명을 함께 업데이트하는 것이 가장 좋습니다.
```

![Combine multiple mapped fields to create a custom HTML description.](./configuring-seo-and-open-graph/images/04.png)

### 로봇

로봇 필드는 디스플레이 페이지에 대한 'robots.txt' 규칙을 구성합니다. 이러한 규칙은 사이트를 크롤링 및 색인화하는 검색 엔진 및 기타 도구에 지침을 제공하고 크롤링해야 할 경로와 크롤링하지 말아야 할 경로를 정의합니다. 웹 크롤러는 `robots.txt`의 지침을 따를 수도 있고 따르지 않을 수도 있습니다.

언어 플래그를 사용하여 이 필드를 지역화할 수도 있습니다.

![The Robots field configures robots.txt rules for a display page.](./configuring-seo-and-open-graph/images/05.png)

### 사이트 지도

`sitemap.xml` 파일에 표시 페이지를 포함할지 여부를 결정하고 우선순위 및 변경 빈도 필드를 설정합니다. 디스플레이 페이지를 크롤링하고 색인화할지 여부, 다른 사이트 페이지에 비해 우선순위를 정하는 방법, 업데이트 빈도 등을 검색 엔진에 알립니다.

![Determine whether to include a display page in your sitemap.xml file, as well as set its priority and change frequency.](./configuring-seo-and-open-graph/images/06.png)

## 그래프 설정 참조 열기

{bdg-secondary}`사용 가능: Liferay DXP/Portal 7.3+`

[오픈 그래프](https://ogp.me/) 는 Facebook, Slack, Twitter 등 사이트 콘텐츠를 지원하는 애플리케이션 컨텍스트에서 공유할 때 사이트 콘텐츠 미리보기를 표준화하는 인터넷 프로토콜입니다. 페이지 헤더에 구조화된 데이터를 [RDFa]과 유사한 '<meta>' 태그로 삽입하여 이를 수행합니다(https://en.wikipedia.org/wiki/RDFa).

Liferay DXP를 사용하면 페이지의 Open Graph `<meta>` 태그를 동적으로 구성하는 디스플레이 페이지 템플릿을 만들 수 있습니다. 여기에 정의된 값은 [site](../../site-settings/configuring-open-graph.md) 수준에서 정의된 기본값을 재정의합니다.

```{note}
오픈 그래프 `<meta>` 태그는 인증되지 않은 사용자의 페이지 헤더에만 포함됩니다. 사용자가 로그인한 경우에는 포함되지 않습니다.
```

### 제목

제목 필드는 풍부한 미리 보기에서 콘텐츠에 대해 표시되는 제목을 정의하는 디스플레이 페이지의 `og:title` 속성을 정의합니다. 기본적으로 이 필드는 `${title}`에 매핑됩니다. 이 값을 직접 편집하고 필드 선택기를 사용하여 추가 매핑을 포함할 수 있습니다(예: `${title} - ${authorName:Author Name}`).

```{tip}
SEO와 오픈 그래프 제목을 함께 업데이트하는 것이 가장 좋습니다.
```

![Combine multiple mapped fields to create a custom og:title value.](./configuring-seo-and-open-graph/images/07.png)

### 묘사

설명 필드는 풍부한 미리보기에서 콘텐츠에 대해 표시되는 설명을 결정하는 디스플레이 페이지의 `og:description` 속성을 정의합니다. 기본적으로 이 필드는 `${description}`에 매핑됩니다. 이 값을 편집하고 필드 선택기를 사용하여 추가 매핑(예: `${description} - ${authorName:Author Name}`)을 포함할 수 있습니다.

```{tip}
SEO와 오픈 그래프 설명을 함께 업데이트하는 것이 가장 좋습니다.
```

![Combine multiple mapped fields to create a custom og:description value.](./configuring-seo-and-open-graph/images/08.png)

### 심상 화랑 심상

이미지 필드는 풍부한 미리보기에서 콘텐츠에 대해 표시되는 이미지를 구성하는 디스플레이 페이지의 'og:image' 속성을 정의합니다. 기본 이미지 태그 외에도 DXP는 선택한 이미지가 표시되는 방식을 결정하는 여러 구조적 속성을 자동으로 추가합니다. 이미지 필드는 다음 `<meta>` 태그를 정의합니다.

```html
<meta property="og:image" content="http://example.com/ogp.jpg" />
<meta property="og:image:secure_url" content="https://secure.example.com/ogp.jpg" />
<meta property="og:image:type" content="image/jpeg" />
<meta property="og:image:width" content="400" />
<meta property="og:image:height" content="300" />
```

기본적으로 이 필드는 표시 페이지 템플릿에서 매핑 해제됩니다. 즉, 다른 이미지 필드를 선택하지 않는 한 템플릿은 사이트 수준에서 설정된 이미지로 기본 설정됩니다.

![The image field defines a display page's og:image property.](./configuring-seo-and-open-graph/images/09.png)

### 이미지 대체 설명

이미지 대체 설명 필드는 표시 페이지의 'og:image:alt' 속성을 정의합니다. 이는 표시된 콘텐츠의 'og:image' 속성에 대해 화면 판독기가 읽는 대체 텍스트를 결정합니다.

```html
<meta property="og:image:alt" content="This is an example." />
```

기본적으로 이 필드는 표시 페이지 템플릿에서 매핑 해제됩니다. 즉, 다른 텍스트 필드를 선택하지 않는 한 템플릿은 기본적으로 사이트 수준에서 설정된 대체 텍스트로 설정됩니다.

![The image alt description field defines a display page's og:image:alt property](./configuring-seo-and-open-graph/images/10.png)

## 관련 주제

[페이지의 친숙한 URL 구성](../../creating-pages/page-settings/configuring-your-pages-friend-url.md)

[오픈 그래프 구성](./../../site-settings/configuring-open-graph.md)
