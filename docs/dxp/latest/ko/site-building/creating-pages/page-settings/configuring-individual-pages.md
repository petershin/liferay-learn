# 개별 페이지 구성

필요에 맞게 개별 페이지를 구성할 수 있습니다. 이러한 방식으로 수행된 모든 변경 사항은 선택한 페이지로 범위가 지정됩니다.

특정 페이지를 구성하려면 **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 **사이트 빌더** &rarr; **페이지** 로 이동하세요. 그런 다음 사용자 정의할 페이지에 대해 **작업**(![작업 버튼](../../../images/icon-staging-bar-options.png))을 클릭하고 **구성** 을 선택합니다.

![Click the Actions button for the page you want to customize, and select Configure](./configuring-individual-pages/images/01.png)

또는 **작업**(![작업 버튼](../../../images/icon-staging-bar-options.png))을 클릭하여 일반 페이지 설정에 액세스할 수 있습니다. &rarr; **구성**(![구성 버튼](./../../../images/icon-cog.png)) 애플리케이션 바 오른쪽 상단에 있습니다.

이러한 설정은 다음 탭으로 구성됩니다.

* [일반](#general) 
* [디자인](#design) 
* [SEO](#seo) 
* [그래프](#open-graph) 열기
* [사용자 정의 메타 태그](#custom-meta-tags) 

```{note}
이러한 설정 중 대부분은 사용자의 로케일을 기반으로 번역을 제공하도록 지역화될 수 있습니다. 자세한 내용은 [초기 인스턴스 지역화](../../../installation-and-upgrades/setting-up-liferay/initial-instance-localization.md) 및 [지역화 가능 사이트 필드 수정](../../site-settings/site-localization.md#modifying-localizable-site-fields) 을 참조하세요.
```

## 일반

여기서 이름, 친숙한 URL, 레이아웃 등을 포함하여 페이지의 기본 정보를 구성할 수 있습니다.

### 기본 정보

이름 필드를 사용하여 사이트 탐색에 사용되고 브라우저의 제목 표시줄에 표시되는 페이지 제목을 설정합니다. 페이지 계층 구조를 표시하도록 구성된 경우 메뉴 표시에서 페이지를 숨길 수 있습니다. 활성화된 경우 숨겨진 페이지가 다른 탐색 메뉴에 추가되면 계속 표시됩니다. 자세한 내용은 [페이지 계층 관리](../../site-navigation/managing-page-hierarchies.md) 참조하십시오.

![Use the name field to set the page's title and check the checkbox to hide it from menu display.](./configuring-individual-pages/images/02.png)

```{note}
하위 페이지는 상위 페이지의 가시성을 상속합니다. 또한 숨겨진 페이지는 기본 탐색 메뉴에 표시되지 않지만 생성된 다른 탐색 메뉴에는 표시될 수 있습니다.
```

### URL

친숙한 URL 필드를 사용하여 페이지의 새 URL을 설정하거나 **복원** 아이콘(![친숙한 URL 복원 아이콘](./../../../images/icon-restore.png))을 클릭합니다. 이전에 사용한 URL을 보고 복원하려면 자세한 내용은 [페이지의 친숙한 URL 구성](./configuring-your-pages-friendly-url.md) 을 참조하세요.

다른 매개변수가 지정되지 않은 경우 **쿼리 문자열** 을 사용하여 페이지의 기본 매개변수를 설정하세요. 쿼리 문자열은 웹 콘텐츠 템플릿 내에서 상당한 이점을 제공합니다. 또한 새 탭이나 특정 프레임 내에서 링크 열기와 같은 속성이 있는 대상 유형 필드를 사용하여 페이지 링크 동작을 제어할 수 있습니다.

![Use the Friendly URL field to set a page's custom URL.](./configuring-individual-pages/images/03.png)

```{tip}
페이지 이름과 친숙한 URL은 페이지 생성 시 처음에 함께 정의되지만 이후에는 독립적으로 구성됩니다. 일치하도록 함께 업데이트하는 것이 가장 좋습니다.
```

### 변경 배치

레이아웃 템플릿은 위젯 페이지에서 위젯을 배치할 수 있는 사이트
를 지정합니다. 전역 템플릿이나 사용자 정의 페이지 템플릿을 사용하여 생성된 기본 위젯 페이지의 경우 사용자는 페이지가 선택한 템플릿에 적용된 **변경 사항을 상속** 하는지 여부를 결정할 수 있습니다. 페이지가 변경 사항을 상속하지 않는 경우 사용자 정의 레이아웃을 선택하여 해당 위젯의 행 및 열 컨테이너를 정의하십시오.

![Select a layout template to define row and column containers for widgets.](./configuring-individual-pages/images/04.png)

### 분류

**주제** 및 **태그** 를 사용하여 페이지 콘텐츠를 분류하면 사용자가 더 쉽게 찾을 수 있습니다. 태그 및 카테고리 사용에 대한 자세한 내용은 [태그 및 카테고리로 콘텐츠 구성](../../../content-authoring-and-management/tags-and-categories.md) 참조하세요.

![Use Topics and Tags to categorize a page's content](./configuring-individual-pages/images/05.png)

### 변경 설정

위젯 페이지의 열이 사용자를 위해 **사용자 정의 가능** 인지 여부를 결정합니다. 사용자 정의가 활성화된 경우 사용자가 사용자 정의할 수 있는 열을 지정합니다. 자세한 내용은 [위젯 페이지의 사용자 개인화 활성화](../using-widget-pages/enabling-user-personalization-of-widget-pages.md) 참조하십시오.

![Determine whether users can customize a widget page.](./configuring-individual-pages/images/06.png)

## 디자인

여기에서 페이지 테마를 구성하고 디자인, CSS 및 JavaScript를 사용자 정의할 수 있습니다. [페이지 세트의 구성 페이지](../../creating-pages/page-settings/configuring-page-sets.md) 에서 이 편집기에 액세스할 수도 있습니다.

### 주제

여기에서 페이지 집합의 테마 설정을 사용하거나 페이지에 대한 사용자 정의 테마를 정의할 수 있습니다. 페이지 테마를 사용자 정의하도록 선택하면 다양한 테마 설정을 전환할 수 있습니다.

![Determine whether to use the page set's theme settings or define a custom theme for your page.](./configuring-individual-pages/images/07.png)

### 기본 설정

여기에서는 페이지 디자인 시스템 및 스타일의 일부 영역을 빠르고 쉽게 변경할 수 있습니다.

**파비콘** : 테마에 적용되는 기본 파비콘을 변경합니다.

**마스터** : 마스터 페이지 템플릿을 변경합니다. 자세한 내용은 [마스터 페이지 템플릿](../../creating-pages/defining-headers-and-footers/master-page-templates.md) 을 참조하세요.

**스타일 북** : 테마에서 적용되는 기본 스타일 북을 변경합니다. 자세한 내용은 [스타일 북을 사용하여 사이트 모양 표준화](../../../site-building/site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) 참조하십시오.

**아이콘** : 사이트 탐색 메뉴에 페이지 이름과 함께 표시할 아이콘을 선택합니다.

![Determine the favicon, master page template, style book and icon for your page.](./configuring-individual-pages/images/08.png)

```{note}
콘텐츠 페이지에는 페이지 디자인 옵션(![페이지 디자인 옵션 아이콘](./../../../images/icon-format.png)) 아래 편집 사이드바 메뉴의 마스터 및 스타일 북 설정도 포함되어 있습니다.
```
### 맞춤화

페이지에 사용자 정의 코드를 추가할 수 있는 CSS 및 JavaScript 편집기에 액세스할 수도 있습니다.

**테마 CSS 클라이언트 확장:** 테마에 포함된 기본 CSS를 완전히 대체하려면 [테마 CSS 클라이언트 확장](../../../building-applications/client-extensions/frontend-client-extensions.md#theme-css-client-extensions) 을 추가하세요.

**CSS 클라이언트 확장:** [CSS 클라이언트 확장](../../../building-applications/client-extensions/frontend-client-extensions.md#css-client-extensions) 을 추가하여 클라이언트 확장으로 페이지의 CSS를 확장합니다. 테마 CSS 뒤와 마스터 확장 뒤에 로드됩니다.

**맞춤 CSS:** 맞춤 CSS를 적용할 수 있으며 테마 다음에 로드됩니다.

**JavaScript 클라이언트 확장 및 사용자 정의 JavaScript:** 이 마스터 페이지 템플릿을 사용하는 페이지를 방문할 때 JavaScript가 실행되도록 [JavaScript 클라이언트 확장](../../../building-applications/client-extensions/frontend-client-extensions.md#javascript-client-extensions) 추가할 수 있습니다. 사용자 정의 JavaScript 코드도 추가할 수 있으며 페이지 하단에서 실행됩니다.

![Use CSS and JavaScript editors to add custom code to the page](./configuring-individual-pages/images/09.png)

```{tip}
사이트 테마에서 JavaScript를 사용하는 경우 개별 페이지나 페이지 세트보다는 테마에 사용자 정의 JavaScript 코드를 추가하는 것이 가장 좋습니다. 이렇게 하면 사이트의 JavaScript 코드가 한 곳에 유지됩니다. 테마에서 JavaScript를 사용하지 않는 경우 사이트의 모든 JavaScript 코드를 여기에 배치하세요.
```

### 고급 설정

페이지의 콘텐츠와 기능을 사용자 정의하려면 추가 설정에 액세스하세요.

**사용자 정의 필드** : 사이트 페이지에 대해 정의한 사용자 정의 필드를 보고 구성합니다. 자세한 내용은 [사용자 정의 필드](../../../system-administration/configuring-liferay/adding-custom-fields.md) 을 참조하세요.

**내장된 위젯** : [웹 콘텐츠 템플릿](./../../../content-authoring-and-management/web-content/web-content-templates/embedding-widgets-in-templates.md) , [페이지 조각](../../developer-guide/developing-page-fragments/developing-fragments-intro.md) 또는 [테마](../../site-appearance/themes/introduction-to-themes.md) 를 사용하여 페이지에 포함된 위젯에 액세스합니다.

**모바일 장치 규칙** : 페이지가 모바일 장치 [에 대한 페이지 집합의](../../../site-building/optimizing-sites/building-a-responsive-site/creating-mobile-device-rules.md) 규칙을 사용하는지 아니면 고유하게 구성되는지 여부를 결정합니다. 이러한 규칙은 다양한 유형의 모바일 장치에 대해 페이지 콘텐츠가 렌더링되는 방식을 결정합니다.

```{note}
*사용자 정의 필드* 및 *내장 위젯* 섹션은 페이지에 사용자 정의 필드와 포함된 위젯을 만든 후에만 나타납니다.
```

## SEO

검색 엔진 최적화(SEO)는 검색 엔진 결과 페이지(SERP)에서 페이지 순위를 높이는 데 사용되는 방법을 말합니다. SEO 탭에서는 페이지 콘텐츠를 최적화하는 데 사용할 수 있는 설정에 쉽게 액세스할 수 있습니다. 다음 설정에 대한 자세한 내용은 [SEO 구성 및 오픈 그래프](../../displaying-content/using-display-page-templates/configuring-seo-and-open-graph.md) 참조하세요.

### HTML제목

페이지의 `<title>` 태그를 정의하려면 HTML 제목 필드를 사용하세요. 이 제목은 검색 엔진에서 페이지 순위를 매기는 데 사용되며, 페이지 [이름](#name-and-friendly-url) 대체하지 않고도 검색 엔진 결과에서 페이지 제목 역할을 합니다. HTML 제목의 권장 길이는 60자 미만입니다.

### 묘사

설명 필드를 사용하여 페이지의 `<description>` 태그를 정의합니다. 이 설명은 검색 엔진에서 페이지 순위를 매기는 데 사용되며 페이지의 검색 결과 미리 보기에도 표시됩니다. 설명의 권장 길이는 155자 미만입니다.

### 커스텀 캐노니컬 URL

페이지에 대한 맞춤 표준 URL을 설정합니다. 이러한 방식으로 구성된 사용자 정의 URL은 시스템 설정 구성보다 우선합니다.

### 키워드

사람들이 귀하의 페이지 콘텐츠를 검색할 때 사용할 가능성이 있는 단어를 나열하세요. 이러한 키워드는 페이지 순위에 영향을 미칩니다.

```{tip}
제목, 표제, 설명, 단락 및 이미지 대체 텍스트를 포함하여 페이지 콘텐츠 전반에 걸쳐 키워드를 자주 사용하십시오.
```

![Set the page's HTML title, description, custom canonical URL and keywords to improve your page's ranking in Search Engine Results Pages (SERP)](./configuring-individual-pages/images/10.png)

### 시사

HTML 제목, 설명 및 사용자 정의 URL 구성을 기반으로 검색 엔진 결과 페이지(SERP)에 페이지가 어떻게 표시되는지 미리 봅니다.

![Preview how a page is displayed in search engine results.](./configuring-individual-pages/images/11.png)

### 로봇

페이지에 대한 `robots.txt` 규칙을 구성합니다. 이러한 규칙은 사이트를 크롤링 및 색인화하는 검색 엔진 및 기타 도구에 지침을 제공하여 지정된 경로에 대한 크롤러 액세스를 차단하거나 허용합니다.

![Configure robots.txt rules for your page to provide instructions to search engines](./configuring-individual-pages/images/12.png)

### 사이트
 지도

사이트 크롤러가 사용하는 사이트맵에 페이지가 포함되어 있는지 확인합니다. 페이지를 제외하면 사이트 크롤러가 사이트를 크롤링하고 색인을 생성할 때 해당 페이지를 건너뛰도록 지시하게 됩니다.

### 페이지 우선권

페이지의 우선순위를 0.0에서 1.0으로 설정합니다. 이는 사이트를 크롤링하고 색인을 생성하는 도구에 사이트의 다른 페이지에 비해 페이지의 우선순위를 지정하는 방법을 알려줍니다.

### 변화 주파수

드롭다운 메뉴를 사용하여 사이트를 크롤링하고 색인을 생성하는 도구에 페이지가 업데이트되는 빈도를 알립니다.

![Determine if the page is included in the sitemap, and set its page priority and change frequency](./configuring-individual-pages/images/13.png)

## Open Graph

{bdg-secondary}`사용 가능: Liferay DXP/Portal 7.3+`

[Graph](https://ogp.me/) Twitter, Facebook 또는 LinkedIn과 같이 이를 지원하는 애플리케이션 컨텍스트에서 공유될 때 사이트 콘텐츠의 미리 보기를 표준화하는 인터넷 프로토콜입니다. [RDFa](https://en.wikipedia.org/wiki/RDFa) 와 유사하게 구조화된 데이터를 페이지 헤더에 `<meta>` 태그로 삽입하여 이를 수행합니다.

**오픈 그래프** 탭에서 오픈 그래프 `<meta>` 태그를 사용하여 페이지의 메타데이터를 정의하고 콘텐츠에 대한 매력적인 표현을 만들 수 있습니다. 여기에 정의된 값은 [사이트](../../site-settings/configuring-open-graph.md) 수준에서 정의된 기본값을 재정의합니다.

```{note}
오픈 그래프`<meta>` 태그는 인증되지 않은 사용자의 페이지 헤더에만 포함됩니다. 사용자가 로그인한 경우에는 포함되지 않습니다.
```

### 심상 화랑 심상

이미지 필드를 사용하여 페이지에 대한 다음 오픈 그래프 `<meta>` 속성을 정의합니다.

```html
<meta property="og:image" content="http://example.com/ogp.jpg" />
<meta property="og:image:secure_url" content="https://secure.example.com/ogp.jpg" />
<meta property="og:image:type" content="image/jpeg" />
<meta property="og:image:width" content="400" />
<meta property="og:image:height" content="300" />
```

### 이미지 대체 설명

페이지의 `og:image:alt` 속성을 정의하려면 이미지 대체 설명 필드를 사용하세요. **언어 플래그** 버튼을 통해 이미지의 대체 설명을 현지화할 수도 있습니다.

### 맞춤 제목 및 설명

사용자 정의 제목 및 설명 필드를 사용하여 `og:title` 및 `og:description` 속성을 정의합니다. 이러한 속성은 페이지의 HTML 제목 및 설명 대신 풍부한 미리 보기에 사용되는 사용자 정의 텍스트를 만듭니다. **언어 플래그** 버튼을 통해 이러한 값을 현지화할 수도 있습니다.

### 오픈 그래프 페이지 표현 미리보기

페이지의 오픈 그래프 구성을 미리 봅니다. 이 섹션에는 프로토콜을 지원하는 컨텍스트에서 URL이 공유될 때 페이지 콘텐츠가 어떻게 표시되는지 표시됩니다. 단, URL 게시 사이트
에 따라 이미지 비율이 변경될 수 있습니다.

![Preview your Open Graph configuration.](./configuring-individual-pages/images/14.png)

## 커스텀 메타 태그

여기에서 페이지의 `<head>`에 사용자 정의 `<meta>` 태그를 추가할 수 있습니다. 이러한 태그는 페이지의 HTML 소스 코드에만 표시되며 페이지의 데이터를 설명하고 검색 엔진 결과 및 소셜 미디어 게시물과 같은 다양한 컨텍스트에서 해당 데이터가 표시되는 방식을 결정하는 데 사용됩니다. 각 태그는 속성 및 콘텐츠 속성을 사용하여 정의됩니다.

![Add custom meta tags to a page's head using the Property and Content fields.](./configuring-individual-pages/images/15.png)

## 관련 주제

* [사이트에 페이지 추가하기](./../adding-pages/adding-a-page-to-a-site.md)
* [콘텐츠 페이지 사용하기](../using-content-pages.md)
* [페이지 세트 구성](./configuring-page-sets.md)
