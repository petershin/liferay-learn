---
toc:
  - ./experience-management/segmentation-personalization.md
  - ./experience-management/content-management-analytics.md
visibility:
  - Employee
  - Partner
---
# 경험관리

**한눈에**

* 관리자로 로그인하면 페이지 구성 방법을 시연할 수 있습니다.
* Liferay의 경험 관리 기능을 입증하는 기본 사항은 다음과 같습니다.
  * 페이지
  * 세분화 및 개인화
  * 만족한 관리
  * 해석학
* 페이지는 Liferay의 모든 정보가 사이트 사용자에게 표시되는 기본 방법을 제공합니다.

```{note}
* 이 모듈의 라이브 워크숍에서 [recording](https://learn.liferay.com/c/portal/login?p_l_id=3026&redirect=%2Fweb%2Fguest%2Fd%2Fse1-4-experience-management) 을 확인하세요.
* 라이브 워크숍에 사용된 프레젠테이션 [PDF](https://learn.liferay.com/c/portal/login?redirect=%2Fdocuments%2Fd%2Fguest%2Fse1-4-experience-management-pdf) 을 다운로드하세요.
```

## 배경

공개 페이지 [공개 페이지](./public-pages-experience.md) 시연하고 사용자가 인증 및 승인을 받을 수 있도록 Liferay에서 제공하는 기능에 대해 이야기한 후 [데모의 다음](./liferay-authentication.md) 는 사용자가 로그인하면 사용할 수 있는 기능을 보여주는 것입니다.

이 모듈의 대부분에는 페이지 작성자 또는 관리자의 관점에서 경험 관리 기능을 보여주는 것이 포함되어 있습니다. 페이지 자체를 보여주는 것은 이미 공개 페이지의 첫 번째 모듈에서 다루었기 때문입니다.

![이 모듈은 페이지, 세분화 및 개인화, 콘텐츠 관리 및 분석 섹션으로 구분됩니다.](./experience-management/images/01.png)

경험 관리의 다양한 측면을 더 잘 이해하기 위해 이 모듈은 네 가지 주요 섹션으로 구성됩니다.

* 페이지
* 세분화 및 개인화
* 만족한 관리
* 해석학

## 페이지

페이지는 사용자에게 컨텐츠와 애플리케이션을 표시하기 위해 Liferay DXP에서 사용되는 기본 방법이기 때문에 [페이지 이해](https://learn.liferay.com/w/dxp/site-building/creating-pages/understanding-pages/understanding-pages) 및 구성 방법을 시연하는 것이 데모의 이 섹션을 시작하는 논리적인 사이트입니다.

데모를 시작하기 전에 페르소나, 사용자 여정 등 잠재 고객이 보게 될 내용을 소개하세요. 더 많은 맥락을 통해 청중은 데모가 시작될 때 표시되는 내용을 더 잘 이해할 수 있습니다. 이에 대한 팁은 다음과 같습니다.

* 시연할 페르소나와 사용자 여정을 소개합니다.
* Liferay가 제공하는 단순성과 페이지 구축에 필요한 적은 노력을 강조합니다.
* 바닐라 환경을 사용하지 말고 사전 구축된 데모를 사용하세요.
* 의미 있고 관련성이 높은 콘텐츠를 미리 준비하세요.

다음 팁을 따르면 Liferay를 사용한 페이지 관리가 얼마나 간단한지 강조하고 보여줄 수 있습니다. 기술적인 지식이 없어도 편집자는 페이지를 인라인으로 편집하고, 페이지 디자인을 변경하고, 페이지 콘텐츠를 추가하거나 변경할 수 있습니다.

사전 구축된 데모나 사이트 이니셜라이저를 사용하여 구축된 사이트에서 시작하는 것이 바닐라 Liferay 환경을 사용하는 것보다 훨씬 더 효과적입니다. 콘텐츠를 업로드할 때나 이미지를 업로드할 때 데모 자체에서 관련 콘텐츠를 반드시 준비하세요. 잠재고객이 보고 있는 내용을 일반적인 정보나 이미지로 이해하려고 하기보다 자신이 보고 있는 내용을 비즈니스와 연관시키는 것이 훨씬 쉽기 때문에 잠재 고객의 브랜드나 산업과 관련된 이미지를 사용하는 것이 훨씬 더 효과적입니다.

### 예제 페이지 편집 연습

**방문 페이지**

![Masterclass는 학습 관리 애플리케이션을 생성할 수 있도록 Liferay와 함께 제공되는 사이트 초기화 프로그램입니다.](./experience-management/images/02.png)

이 경우 페이지 구성을 안내하는 예로 Masterclass 사이트 초기화 템플릿이 사용됩니다. 그러나 이것이 개별 잠재 고객에게 적합하지 않은 경우 잠재 고객의 요구 사항과 업계에 가장 잘 맞는 다른 사이트 초기화 프로그램이나 사전 구축된 데모를 사용하는 것이 훨씬 좋습니다.

**페이지 편집**

![페이지는 도구 모음에서 연필 아이콘을 선택하여 기본 Liferay 사용자 인터페이스를 통해 직접 편집됩니다.](./experience-management/images/03.png)

편집 모드 표시를 시작하려면 도구 모음에서 연필 아이콘을 클릭하세요. 텍스트를 변경하는 것이 얼마나 쉬운지 보여주고 이러한 변경 사항이 미치는 영향을 즉시 미리 볼 수 있습니다.

아래로 스크롤하면 페이지 구조가 어떻게 변경될 수 있는지 표시됩니다(예: 이 그리드 내부의 각 요소 너비 변경).

**장치 미리보기**

![Liferay는 디자이너가 여러 장치에서 각 페이지의 레이아웃을 제어할 수 있는 기능을 제공합니다.](./experience-management/images/04.png)

편집자가 다양한 장치에서 페이지를 미리 볼 수 있는 방법을 보여줍니다. 예를 들어 태블릿이나 모바일에서 그리드가 표시되는 방식을 변경하면 페이지의 응답성을 제어하는 방법을 쉽게 보여줄 수 있습니다.

**이미지 추가**

![페이지에 이미지를 추가하는 것은 단순히 기존 이미지에서 선택하거나 새 이미지를 업로드하기만 하면 됩니다.](./experience-management/images/05.png)

또한 구성 요소를 끌어서 놓아 이미지를 변경하거나 페이지에 구성 요소를 추가하는 방법도 보여줍니다.

**페이지 번역**

![사용자는 모든 페이지를 지원되는 언어로 번역할 수 있습니다.](./experience-management/images/06.png)

Liferay 애플리케이션을 다른 언어로 현지화해야 하는 경우 상단 표시줄의 아이콘에서 직접 [콘텐츠 페이지 번역](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/translating-pages-and-content/translating-content-pages) 을 얼마나 쉽게 추가할 수 있는지 보여주세요. 또한 ML 기반 자동 번역 서비스를 사용하여 페이지 콘텐츠를 자동 번역할 [제3자를 번역에 사용](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/translating-pages-and-content/using-third-parties-for-translation) .

마지막으로 게시 버튼을 클릭하여 페이지 변경 사항을 공개합니다.

페이지와 페이지 구성 방법에 대한 자세한 내용은 이 사이트의 다른 곳에서 확인할 수 있습니다.

* [콘텐츠 페이지 사용](https://learn.liferay.com/w/dxp/site-building/creating-pages/using-content-pages)
* [콘텐츠 페이지 편집기 UI 참조](https://learn.liferay.com/w/dxp/site-building/creating-pages/using-content-pages/content-page-editor-ui-reference)
* [조각 사용](https://learn.liferay.com/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments)

### 다루어야 할 추가 주제

데모의 이 시점에서 다루어야 할 몇 가지 유용한 주제는 다음과 같습니다.

* [퍼블리싱](https://learn.liferay.com/web/guest/w/dxp/site-building/publishing-tools/publications) 워크플로
* [페이지 템플릿 만들기](https://learn.liferay.com/w/dxp/site-building/creating-pages/adding-pages/creating-a-page-template)
* 보고 느끼다

**출판 작업 흐름**

페이지를 게시할 때 게시 워크플로를 활성화하여 변경 사항을 라이브로 게시하기 전에 검증할 수 있으며 Liferay는 라이브 환경에 게시하기 전에 사이트 콘텐츠를 변경할 수 있는 작업 환경을 제공한다는 개념을 소개합니다.

**페이지 템플릿**

이 고급 데모에서는 뉴스 페이지가 생성되지 않지만 소개할 또 다른 주제는 사용자가 각 페이지를 처음부터 생성할 필요가 없다는 것입니다. 사용자는 미리 정의된 페이지 템플릿 중에서 선택하여 페이지를 만드는 데 필요한 시간과 노력을 줄이고 여러 페이지 간의 일관성을 보장할 수 있습니다.

**품질**

표시된 UX는 단지 예시일 뿐이지만 색상, 로고, 글꼴, 머리글, 바닥글 등을 포함하여 회사 브랜드에 맞게 모양과 느낌의 모든 측면을 수정할 수 있다는 점을 강조하세요. 이러한 주제는 [스타일링의 기본]에서 다룰 것입니다. ](./basics-of-styling.md) 모듈.

다음: [세분화 및 개인화](./experience-management/segmentation-personalization.md).
