---
toc:
  - ./extending-liferay/low-code-no-code.md
  - ./extending-liferay/client-extensions.md
visibility:
  - Employee
  - Partner
---
# 라이프레이 확장

**한눈에 보기**

* Liferay 확장은 플랫폼의 잠재력을 최대한 활용하는 데 있어 중요한 측면입니다.
* 특정 비즈니스 요구 사항을 염두에 두고 Liferay를 사용자 정의함으로써 사용자의 요구 사항에 맞는 디지털 경험을 만들 수 있습니다.
* 이 모듈에서는 Liferay를 확장하는 5가지 주요 방법을 다룹니다.
  * 편집자
  * 설정
  * 로우코드
  * 통합
  * 클라이언트 확장

## 배경

Liferay DXP는 모든 기능을 갖춘 디지털 경험 플랫폼이며 고객을 위한 정교한 솔루션을 구현하는 데 사용할 수 있는 기본 제공되는 광범위한 기능을 제공합니다.

이렇게 광범위한 기능을 갖추고 있더라도 각 고객은 기본 기능만으로는 충족할 수 없는 요구 사항을 갖게 됩니다. Liferay는 항상 각 고객의 고유한 요구 사항을 충족할 수 있도록 사용자 정의 및 확장이 가능한 유연한 플랫폼이었습니다.

이 모듈에서는 고객 요구 사항을 충족하기 위해 Liferay를 확장, 구성 및 사용자 정의하는 데 사용할 수 있는 주요 접근 방식을 간략하게 설명합니다.

```{note}
* 이 모듈의 라이브 워크숍에서 [녹화](https://learn.liferay.com/web/guest/d/se1-7-extending-liferay)를 시청하세요.
* 라이브 워크숍에 사용된 프레젠테이션의 [PDF](https://learn.liferay.com/documents/d/guest/se1-7-extending-liferay-pdf)를 다운로드하세요.
```

## 일부 전통적인 사용자 정의

Liferay DXP 7.3까지 Liferay를 확장하는 기본 방법은 Java OSGi 모듈(예: 포틀릿, 후크 등) 작성을 통한 것이었습니다. 이를 통해 개발자는 높은 수준의 유연성과 사용자 정의를 달성하면서 쉽게 기능을 추가, 제거 및 수정할 수 있었습니다.

OSGi 모듈은 플랫폼의 핵심에 배포되고 확장되므로 다음과 같은 여러 가지 과제가 발생합니다.

* 코어 수정은 API 변경 등으로 인한 업그레이드에 영향을 미칩니다.
* 고객은 전체 업그레이드를 거치지 않으면 Liferay DXP 최신 릴리스의 새로운 기능에 액세스할 수 없습니다.

## Liferay DXP의 최신 버전

다음 사항에 유의하는 것이 중요합니다.

* Liferay DXP의 최신 버전에는 디지털 경험 플랫폼 코어, 상거래, 분석의 세 가지 주요 기능 세트가 포함되어 있습니다.
* 이는 고객에게 단순화된 제품 라인과 분기별 업데이트에 대한 액세스를 제공합니다.
* 업데이트에는 알려진 문제에 대한 수정 사항뿐만 아니라 새로운 기능도 포함되어 있습니다.

![Liferay DXP contains core Digital Experience Platform capabilities along with Commerce and Analytics.](./extending-liferay/images/01.png)

## Liferay 확장 * 편집자

Liferay DXP를 확장하는 한 가지 방법은 기본적으로 제공되는 다양한 편집기를 이용하는 것입니다. 예를 들어 Liferay의 경험 관리 기능을 통해 제공되는 기능을 사용합니다.

이러한 방법을 통해 사용자는 페이지를 시각적으로 구축하고 구성할 수 있습니다. 몇 가지 주목할만한 예는 다음과 같습니다.

* 단편
* 출판
* 주제
* 스타일북
* 템플렛

### 단편

[Fragments](https://learn.liferay.com/web/guest/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments)은 사용할 수 있는 빌딩 블록 중 하나입니다. Liferay DXP에서 풍부한 페이지를 생성합니다. 조각은 콘텐츠 작성자 및 페이지 작성자가 사용하도록 고안되었습니다.

![Liferay's page builder provides page creators with a wide range of fragments which are used to construct individual pages.](./extending-liferay/images/02.png)

Liferay의 드래그 앤 드롭 인터페이스 덕분에 페이지에 조각을 추가하고 추가한 후 구성하는 것은 기술적 전문성에 관계없이 누구나 수행할 수 있는 간단한 프로세스입니다. 사용자는 사전 구성된 조각 세트를 [조각 구성](https://learn.liferay.com/web/guest/w/dxp/site-building/creating-pages/page-fragments-and-widgets/)으로 저장할 수도 있습니다. using-fragments/saving-fragment-compositions), 유사한 페이지를 생성하는 프로세스 속도를 높이기 위해 다른 페이지에 추가할 수 있습니다.

**페이지 조각 개발 중**

![The Fragment Editor allows developers to create custom fragments by adding HTML and if needed CSS, JavaScript and Freemarker.](./extending-liferay/images/03.png)

이 외에도 개발자는 UI 내의 편집기 또는 CLI 도구를 통해 처음부터 새로운 조각을 만들 수 있습니다. 개발자는 HTML과 선택적으로 CSS, JavaScript 및 Freemarker의 조합을 사용하여 거의 모든 목적에 맞는 새로운 조각을 구축합니다.

참조: [페이지 조각 개발](https://learn.liferay.com/web/guest/w/dxp/site-building/developer-guide/developing-page-fragments)

### 출판

![Publications enables content creators to prepare changes and publish them on a schedule.](./extending-liferay/images/04.png)

[publications](https://learn.liferay.com/w/dxp/site-building/publishing-tools/publications) 기능을 사용하면 콘텐츠 제작자가 변경 사항을 준비하고 일정에 따라 게시할 수 있습니다. 이는 일반적인 정기 게시 프로세스를 지원할 수 있으며 특별한 변경(예: 이미지 업데이트, 새 페이지 추가 등이 포함된 계절 프로모션)에도 사용될 수 있습니다.

고객은 출판물을 생성하고 출판하기 전에 필요한 사용자를 초대하여 변경하도록 할 수 있습니다.

### 주제

[Themes](https://learn.liferay.com/en/w/dxp/site-building/site-appearance/themes/introduction-to-themes)은 Liferay 사이트의 모양과 느낌을 사용자 정의하는 유연한 방법을 제공합니다. 테마를 사용하려면 DXP에 코드를 배포해야 하므로 Liferay Experience Cloud SaaS 고객에게는 지원되지 않습니다.

### 스타일북

![Stylebooks are sets of visual standards which apply to a site, such as colors, fonts, and spacing.](./extending-liferay/images/05.png)

[스타일 북](https://learn.liferay.com/en/w/dxp/site-building/site-appearance/style-books/using-a-style-book-to-standardize-site-appearance)은 색상, 글꼴, 간격 등 사이트에 적용되는 시각적 표준 세트입니다. 이를 통해 각 페이지에서 일관된 경험을 유지하면서 모든 페이지의 레이아웃을 독립적으로 디자인할 수 있습니다.

### 템플렛

![Liferay uses the popular Freemarker scripting language to enable developers to create custom templates for widgets and assets.](./extending-liferay/images/06.png)

템플릿은 Liferay 사용자 인터페이스의 모양과 동작을 사용자 정의하기 위한 강력한 도구입니다. Liferay는 콘텐츠와 페이지의 모양과 느낌을 변경하는 데 사용되는 재사용 가능한 템플릿을 만드는 방법을 제공합니다.

편집기에서 작성된 후에는 마케팅 팀과 같은 사용자가 템플릿을 선택하여 페이지에 콘텐츠를 쉽게 표시할 수 있습니다.

기술 수준에서 템플릿은 HTML, CSS, Javascript의 조합을 사용하며 Freemarker라는 널리 사용되는 스크립팅 언어를 기반으로 합니다.

또한보십시오:

* [웹 콘텐츠 템플릿](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/web-content/web-content-templates)
* [정보 템플릿](https://learn.liferay.com/w/dxp/site-building/displaying-content/using-information-templates)
* [위젯 템플릿](https://learn.liferay.com/w/dxp/site-building/displaying-content/additional-content-display-options/styling-widgets-with-widget-templates)

## Liferay 확장 * 구성

기술적으로 Liferay를 확장하지는 않지만 Liferay가 고객의 특정 요구 사항을 충족하는지 확인하는 또 다른 효과적인 방법은 구성 옵션을 이용하는 것입니다. 이를 통해 개발자와 관리자는 코드를 작성하지 않고도 플랫폼 기능을 확장할 수 있습니다.

구성 옵션의 몇 가지 예는 다음과 같습니다.

* 시스템 설정
* 인스턴스 설정

### 시스템 설정

[시스템 설정](https://learn.liferay.com/w/dxp/system-administration/configuring-liferay/system-settings)을 통해 관리자는 Liferay 포털에 대한 전역 설정을 구성할 수 있습니다. 사이트, 메일 또는 검색 설정 등이 포함됩니다.

```{note}
Liferay DXP가 Liferay Experience Cloud SaaS 제품을 통해 배포되면 시스템 설정을 사용할 수 없습니다.
```

### 인스턴스 설정

인스턴스 설정은 특정 Liferay 인스턴스의 동작과 모양을 사용자 정의하기 위한 강력한 도구입니다. 인스턴스 설정을 통해 관리자는 인증, 이메일, 언어, 검색 설정 등을 포함한 광범위한 옵션을 구성할 수 있습니다.

### 가상 인스턴스

[가상 인스턴스](https://learn.liferay.com/w/dxp/system-administration/configuring-liferay/virtual-instances)는 Liferay 리소스를 논리적으로 분리한 것으로, 이를 통해 관리자는 내부에 여러 개의 독립적인 사이트를 만들 수 있습니다. 단일 Liferay 설치. 각 가상 인스턴스에는 완전히 별도의 데이터와 구성이 있습니다. 각각은 고유한 도메인 이름을 통해 액세스되며 모든 의도와 목적을 위해 추가 인스턴스와 설치를 공유하는 별도의 Liferay 기반 구현입니다.

```{note}
Liferay DXP가 Liferay Experience Cloud SaaS 서비스를 통해 배포되면 고객은 가상 인스턴스를 생성할 수 없습니다. 사실상 그들의 환경은 다른 고객과 공유되는 공유 클러스터 내의 가상 인스턴스입니다. 이 가상 인스턴스 내에서 선택한 구독 계획에 제공된 한도까지 추가 사이트를 생성할 수 있습니다.
```

다음: [로우 코드/노코드 기능으로 Liferay 확장](./extending-liferay/low-code-no-code.md)
