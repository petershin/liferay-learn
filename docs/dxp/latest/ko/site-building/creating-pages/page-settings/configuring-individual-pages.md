# 개별 페이지 구성

필요에 맞게 개별 페이지를 구성할 수 있습니다. 이 방법으로 변경한 모든 내용은 선택한 페이지로 범위가 지정됩니다.

페이지를 구성하려면 *사이트 메뉴* 을 열고 *사이트 빌더* &rarr; *페이지*으로 이동합니다. 그런 다음 사용자 지정하려는 페이지에 대해 *작업* 버튼(![Actions button](../../../images/icon-staging-bar-options.png))을 클릭하고 *구성*를 선택합니다.

![사용자 지정하려는 페이지의 작업 버튼을 클릭하고 구성을 선택합니다.](./configuring-individual-pages/images/01.png)

또는 사용자 지정하려는 페이지로 이동하고 *페이지 구성* 버튼( ![페이지 구성 버튼](./../../../images/icon-cog. png) ) *응용 프로그램 표시줄*의 오른쪽 상단에 있습니다.

이러한 설정은 다음 탭으로 구성됩니다.

* [일반](#general)
* [SEO](#seo)
* [Open Graph](#open-graph)
* [커스텀 메타 태그](#custom-meta-tags)

```{note}
이러한 설정 중 다수는 사용자의 로케일을 기반으로 번역을 제공하도록 현지화할 수 있습니다. [현지화 소개](../../../installation-and-upgrades/setting-up-liferay/initial-instance-localization.md) 및 [현지화 가능한 사이트 필드 수정](../../site-settings/site-localization.md#modifying-localizable-site-fields) 를 참조하십시오.
```

## 일반

여기에서 이름, 친근한 URL, 레이아웃 등 페이지의 기본 정보와 디자인을 구성할 수 있습니다.

### 이름 및 친숙한 URL

이름 필드를 사용하여 사이트 탐색에 사용되고 브라우저의 제목 표시줄에 표시되는 페이지 제목을 설정합니다. 친숙한 URL 필드를 사용하여 페이지의 새 URL을 설정하거나 *복원* 아이콘( ![Friendly URL Restore icon](./../../../images/icon-restore.png) )을 클릭하여 이전에 사용한 URL을 보고 복원합니다. 자세한 내용은 [페이지의 친숙한 URL 구성](./configuring-your-pages-friendly-url.md) 을 참조하십시오.

![이름 필드를 사용하여 페이지 제목을 설정합니다.](./configuring-individual-pages/images/02.png) ![친숙한 URL 필드를 사용하여 페이지의 사용자 지정 URL을 설정합니다.](./configuring-individual-pages/images/03.png)

```{tip}
페이지 이름과 친근한 URL은 처음에는 페이지 생성 시 함께 정의되지만 나중에는 독립적으로 구성됩니다. 일치하도록 함께 업데이트하는 것이 가장 좋습니다.
```

### 메뉴 표시

페이지 계층 구조를 표시하는 메뉴 표시 위젯 및 조각에서 페이지를 숨길 수 있습니다. 활성화되면 숨겨진 페이지가 추가된 경우 다른 탐색 메뉴에 계속 나타날 수 있습니다. 자세한 내용은 [사이트 탐색 구성](./../../site-navigation/managing-site-navigation.md) 을 참조하십시오.

### 변경 배치

전역 템플릿(예: 블로그, 위키, 검색)을 사용하여 만든 기본 위젯 페이지의 경우 페이지가 전역 템플릿에 대한 변경 사항을 *상속*하는지 여부를 결정합니다. 페이지가 변경 사항을 상속하지 않는 경우 사용자 정의 레이아웃을 선택하여 해당 위젯에 대한 행 및 열 컨테이너를 정의합니다.

![위젯의 행 및 열 컨테이너를 정의할 레이아웃 템플릿을 선택합니다.](./configuring-individual-pages/images/05.png)

### 분류

*주제* 및 *태그* 을 사용하여 사용자가 더 쉽게 찾을 수 있도록 페이지의 콘텐츠를 분류합니다. 태그 및 카테고리 사용에 대한 자세한 내용은 [태그 및 카테고리로 콘텐츠 구성](../../../content-authoring-and-management/tags-and-categories.md)을 참조하십시오.

### 품질

여기에서 페이지 세트의 테마 설정을 사용하거나 페이지의 고유한 모양과 느낌을 정의할 수 있습니다. 페이지 테마를 사용자 지정하도록 선택하면 다양한 테마 설정을 전환할 수 있습니다.

페이지에 사용자 지정 CSS 코드를 추가할 수 있는 CSS 편집기에 액세스할 수도 있습니다. 이러한 방식으로 페이지에 추가된 모든 CSS 코드는 테마 이후에 로드됩니다.

![페이지 세트의 테마 설정을 사용할지 또는 페이지의 고유한 모양과 느낌을 정의할지 여부를 결정합니다.](./configuring-individual-pages/images/07.png)

```{note}
위젯 페이지에는 *모양과 느낌* 탭이 포함되어 있지만 콘텐츠 페이지에는 *편집* 사이드바 메뉴에 이러한 설정이 포함되어 있습니다.
```

### 고급 설정

추가 설정에 액세스하여 쿼리 문자열, [모바일 장치 규칙](../../optimizing-sites/building-a-responsive-site/creating-mobile-device-rules.md), 사용자 지정 필드 및 포함된 위젯을 포함하여 페이지의 콘텐츠 및 기능을 사용자 지정합니다.

```{note}
위젯 페이지에는 여기에 고급 탭이 포함되어 있지만 콘텐츠 페이지에는 *모양과 느낌* 아래의 편집 사이드바 메뉴에 이러한 설정이 포함되어 있습니다.
```

**쿼리 문자열**: 다른 항목이 없을 때 페이지에 대한 기본 매개 변수를 제공하는 데 사용합니다. 쿼리 문자열은 웹 콘텐츠 템플릿에 유용합니다.

**대상**: 이 필드를 사용하여 새 창, 탭 또는 프레임셋에서 링크 열기와 같은 특정 대상 특성을 사용하여 페이지 링크 동작을 결정합니다.

**아이콘**: 사이트의 탐색 메뉴에서 페이지 이름과 함께 표시할 아이콘을 선택합니다.

**JavaScript**: 페이지에 JavaScript 코드를 추가합니다. 추가된 모든 코드는 페이지 하단에서 실행됩니다. 페이지 세트의 *구성* 페이지에서 이 편집기에 액세스할 수도 있습니다.

```{tip}
사이트의 테마가 JavaScript를 사용하는 경우 개별 페이지 또는 페이지 집합이 아닌 테마에 사용자 정의 JavaScript 코드를 추가하는 것이 가장 좋습니다. 이렇게 하면 사이트의 JavaScript 코드가 한 곳에 유지됩니다. 테마에서 JavaScript를 사용하지 않는 경우 사이트의 모든 JavaScript 코드를 여기에 배치하십시오.
```

**모바일 장치 규칙**: 페이지가 모바일 장치에 대한 페이지 집합의 규칙을 사용하는지 아니면 고유하게 구성되는지를 결정합니다. 이러한 규칙은 다양한 유형의 모바일 장치에서 페이지 콘텐츠가 렌더링되는 방식을 결정합니다.

**사용자 지정 설정**: 위젯 페이지의 열이 사용자를 위한 *사용자 지정 가능 여부를 결정*. 사용자 지정이 활성화된 경우 사용자가 사용자 지정할 수 있는 열을 지정합니다. 자세한 내용은 [페이지 개인화](../using-widget-pages/configuring-widgets/enabling-user-personalization-of-widget-pages.md) 을 참조하십시오.

![사용자가 위젯 페이지를 사용자 지정할 수 있는지 여부를 결정합니다.](./configuring-individual-pages/images/12.png)

**사용자 정의 필드**: 사이트 페이지에 대해 정의한 *사용자 정의 필드* 을 보고 구성합니다. 자세한 내용은 [사용자 정의 필드](../../../system-administration/configuring-liferay/adding-custom-fields.md) 을 참조하십시오.

**포함된 위젯**: [웹 콘텐츠 템플릿](./../../../content-authoring-and-management/web-content/web-content-templates/embedding-widgets-in-templates.md), [페이지 조각](../../developer-guide/developing-page-fragments/developing-fragments-intro.md)또는 [테마](../../site-appearance/themes/introduction-to-themes.md)을 사용하여 페이지에 포함된 위젯에 액세스합니다.

```{note}
*사용자 정의 필드* 및 *포함된 위젯* 섹션은 페이지에서 사용자 정의 필드 및 포함된 위젯을 만든 후에만 나타납니다.
```

## SEO

검색 엔진 최적화(SEO)는 검색 엔진 결과 페이지(SERP)에서 페이지 순위를 개선하는 데 사용되는 방법을 말합니다. SEO 탭에서는 페이지 콘텐츠를 최적화하는 데 사용할 수 있는 설정에 쉽게 액세스할 수 있습니다. 다음 설정에 대한 자세한 내용은 [구성 SEO 및 오픈 그래프](../../displaying-content/using-display-page-templates/configuring-seo-and-open-graph.md) 을 참조하십시오.

### HTML제목

HTML 제목 필드를 사용하여 페이지의 `<title>` 태그를 정의합니다. 이 제목은 검색 엔진에서 귀하의 페이지 순위를 매기는 데 사용되며 페이지의 [이름](#name-and-friendly-url) 을 대체하지는 않지만 검색 엔진 결과에서 페이지의 머리글 역할을 합니다. HTML 제목의 권장 길이는 60자 미만입니다.

### 묘사

설명 필드를 사용하여 페이지의 `<description>` 태그를 정의합니다. 이 설명은 검색 엔진에서 페이지 순위를 매기는 데 사용되며 페이지의 검색 결과 미리 보기에도 나타납니다. 설명의 권장 길이는 155자 미만입니다.

### 커스텀 캐노니컬 URL

페이지에 대한 사용자 지정 표준 URL을 설정합니다. 이러한 방식으로 설정된 사용자 지정 URL은 전역 및 인스턴스 수준 설정보다 우선합니다.

### 키워드

사람들이 페이지 콘텐츠를 검색할 때 사용할 가능성이 높은 단어를 나열하세요. 이러한 키워드는 페이지 순위에 기여합니다.

```{tip}
제목, 표제, 설명, 단락 및 이미지 대체 텍스트를 포함하여 페이지 콘텐츠 전체에서 키워드를 자주 사용하십시오.
```

### SERP 미리보기

HTML 제목, 설명 및 사용자 지정 URL의 구성에 따라 페이지가 검색 엔진 결과 페이지(SERP)에 어떻게 표시되는지 미리 봅니다.

![페이지가 검색 엔진 결과에 어떻게 표시되는지 미리 봅니다.](./configuring-individual-pages/images/13.png)

### 로봇

페이지에 대해 `robots.txt` 규칙을 구성합니다. 이러한 규칙은 지정된 경로에 대한 크롤러 액세스를 차단하거나 허용하여 사이트를 크롤링하고 인덱싱하는 검색 엔진 및 기타 도구에 대한 지침을 제공합니다.

### 사이트 지도

사이트 크롤러가 사용하는 사이트맵에 페이지가 포함되어 있는지 확인합니다. 페이지를 제외하면 사이트를 크롤링하고 인덱싱할 때 페이지를 건너뛰도록 사이트 크롤러에 지시할 수 있습니다.

### 페이지 우선권

페이지의 우선 순위를 0.0에서 1.0으로 설정합니다. 이는 사이트를 크롤링하고 인덱싱하는 도구에 사이트의 다른 페이지와 비교하여 페이지의 우선 순위를 지정하는 방법을 알려줍니다.

### 변화 주파수

드롭다운 메뉴를 사용하여 사이트를 크롤링하고 인덱싱하는 도구에 페이지가 업데이트되는 빈도를 알립니다.

## Open Graph

> 사용 가능: Liferay DXP/Portal 7.3+

[Open Graph](https://ogp.me/) 은 Facebook, Slack 및 Twitter와 같이 사이트 콘텐츠를 지원하는 애플리케이션 컨텍스트에서 공유할 때 사이트 콘텐츠의 미리보기를 표준화하는 인터넷 프로토콜입니다. [RDFa](https://en.wikipedia.org/wiki/RDFa) 와 유사하게 구조화된 데이터를 페이지 헤더에 `<meta>` 태그로 삽입하여 이를 수행합니다.

*Open Graph* 탭에서 Open Graph `<meta>` 태그를 사용하여 페이지의 메타데이터를 정의하고 매력적인 콘텐츠 표현을 만들 수 있습니다. 여기에 정의된 값은 [사이트](../../site-settings/configuring-open-graph.md) 수준에서 정의된 기본값을 재정의합니다.

```{note}
Open Graph `<meta>` 태그는 인증되지 않은 사용자에게만 페이지 헤더에 포함됩니다. 사용자가 로그인하면 포함되지 않습니다.
```

### 심상 화랑 심상

이미지 필드를 사용하여 페이지에 대한 다음 Open Graph `<meta>` 속성을 정의합니다.

   ```html
   <meta property="og:image" content="http://example.com/ogp.jpg" />
   <meta property="og:image:secure_url" content="https://secure.example.com/ogp.jpg" />
   <meta property="og:image:type" content="image/jpeg" />
   <meta property="og:image:width" content="400" />
   <meta property="og:image:height" content="300" />
   ```

### 이미지 대체 설명

이미지 대체 설명 필드를 사용하여 페이지에 대한 `og:image:alt` 속성을 정의합니다. *언어 플래그* 버튼을 통해 이미지의 대체 설명을 현지화할 수도 있습니다.

### 맞춤 제목 및 설명

제목 및 설명 필드를 사용하여 `og:title` 및 `og:description` 속성을 정의합니다. 이러한 속성은 페이지의 HTML 제목 및 설명 대신 풍부한 미리 보기에 사용되는 사용자 지정 텍스트를 만듭니다. *언어 플래그* 버튼을 통해 이러한 값을 현지화할 수도 있습니다.

### 열린 그래프 페이지 표현 미리보기

페이지의 오픈 그래프 구성을 미리 봅니다. 이 섹션은 URL이 프로토콜을 지원하는 컨텍스트에서 공유될 때 페이지 콘텐츠가 어떻게 표시되는지 보여줍니다. URL이 게시되는 사이트에 따라 이미지의 비율이 변경될 수 있습니다.

![Open Graph 구성을 미리 봅니다.](./configuring-individual-pages/images/23.png)

## 커스텀 메타 태그

여기에서 사용자 지정 `<meta>` 태그를 페이지의 `<head>` 에 추가할 수 있습니다. 이러한 태그는 페이지의 HTML 소스 코드에서만 볼 수 있으며 페이지의 데이터를 설명하고 해당 데이터가 검색 엔진 결과 및 소셜 미디어 게시물과 같은 다양한 컨텍스트에서 표시되는 방식을 결정하는 데 사용됩니다. 각 태그는 속성 및 콘텐츠 속성을 사용하여 정의됩니다.

![속성 및 콘텐츠 필드를 사용하여 페이지 헤드에 사용자 지정 메타 태그를 추가합니다.](./configuring-individual-pages/images/24.png)

## 추가 정보

* [사이트에 페이지 추가](./../adding-pages/adding-a-page-to-a-site.md)
* [콘텐츠 페이지 사용](../using-content-pages.md)
* [페이지 세트 구성](./configuring-page-sets.md)
