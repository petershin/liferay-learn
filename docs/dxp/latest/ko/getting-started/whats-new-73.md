# Liferay DXP 7.3의 새로운 기능

Liferay DXP의 최신 릴리스에는 많은 중요한 새로운 기능과 개선 사항이 포함되어 있습니다. 이러한 기능은 사이트 구축, 사이트 트래픽 분석, 문서 관리 및 필요한 애플리케이션 생성 방법을 향상시킵니다. Liferay DXP 7.3에는 App Builder, 마스터 페이지, 자산 라이브러리 등이 포함되어 있습니다.

## 페이지 빌딩

### 마스터 페이지

[마스터 페이지](../site-building/creating-pages/defining-headers-and-footers/creating-a-master-page-template.md) 은 사이트 전체의 여러 페이지 또는 모든 페이지에서 일관된 페이지 영역을 정의합니다. 가장 일반적으로 머리글, 바닥글 및 사이드바를 정의하는 데 사용됩니다. 이 기능 이전에는 공통 페이지 영역을 테마 내에서만 정의할 수 있었습니다. 이제 기술적인 지식이 없는 사용자도 자신만의 마스터 페이지를 만들고, 사이트 전체에서 사용하고, 언제든지 변경할 수 있습니다(변경 사항이 모든 페이지에 자동으로 적용됨).

### 실행 취소 및 다시 실행

![Undo and redo works for the entire editing session.](./whats-new-73/images/01.gif)

새로운 버튼을 사용하면 작업을 실행 취소/다시 실행할 수 있습니다. 키보드 단축키도 사용할 수 있습니다: `CMD + z` / `CMD + Shift + z`(MacOS) `Ctrl + z` / `Ctrl + Shift + z`(Windows, Linux)

편집 세션의 모든 페이지 상태로 빠르게 이동할 수 있도록 수행된 모든 작업을 나열하는 패널도 있습니다.

### 콜렉션 디스플레이

![The Collection Display fragment publishes assets using a drag and drop interface.](./whats-new-73/images/02.gif)

[Collection Display](../site-building/displaying-content/collections-and-collection-pages/displaying-collections.md#adding-a-collection-display-fragment-to-a-page) 조각은 드래그 앤 드롭 편집을 통해 자산 세트를 보여줍니다. 조각이 페이지에 추가되면 이를 컬렉션에 연결합니다. 그런 다음 컬렉션의 각 자산에 대한 공간을 정의합니다. 공간에 대한 조정 사항은 나머지 부분에도 복제됩니다. 편집 가능한 필드는 컬렉션의 일반 필드에 매핑될 수 있습니다. 예를 들어 제목 조각이 추가되면 웹 콘텐츠 구조의 제목 필드에 매핑될 수 있으며 이 매핑은 각 항목에 전파됩니다.

### 시각적 반응형 레이아웃 편집기

반응형 편집기를 사용하면 기본적으로 반응하는 동작을 미세 조정할 수 있습니다. 시각화되는 각 장치에 가장 적합한 방식으로 페이지 콘텐츠를 조정할 수 있습니다.

![The Visual Responsive Layout Editor shows previews for various screen widths.](./whats-new-73/images/03.gif)

### 일반 성능 개선

Liferay DXP 7.3에서는 React를 활용하기 위해 페이지 편집기가 완전히 개편되었습니다. 이는 특히 더 큰 페이지로 작업할 때 편집기의 성능을 크게 향상시켰습니다.

### 시각적 조각 구성

![Visual Fragment Composition makes it easy to save and share Fragment compositions across pages.](./whats-new-73/images/04.gif)

이제 페이지 작성자는 자신의 열 구성을 재사용 및 공유 가능한 조각으로 저장하여 다른 페이지에서 사용할 수 있습니다.

## 디자인 및 테마 편집자

기본 테마 모양과 느낌을 부분적으로 또는 완전히 재정의할 수 있는 마스터 페이지, 템플릿, 조각 및 스타일 북(아래 참조)을 제공하여 테마를 한 단계 더 발전시켰습니다. 이제 클래식 Liferay 테마를 기본으로 사용할 수 있습니다.

![Themes, Style Books, Fragments, Master Pages, Page Templates: they're now all integrated to help you provide great UIs for your content.](./whats-new-73/images/05.png)

### 스타일 북

[스타일북](../site-building/site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) 스타일 편집기 UI를 사용하여 생성할 수 있는 스타일(CSS 규칙) 그룹입니다. 스타일 북은 재사용 및 공유 가능한 스타일과 스타일 규칙을 활용하여 페이지 전체에서 일관된 사용자 경험을 만들고자 하는 UX 디자이너를 위한 "디자인 시스템"을 제공합니다. 테마 작성자는 동일한 사이트에 대해 여러 Style Book을 만들 수 있으며 페이지 작성자는 특정 페이지에 대한 Style Book을 선택할 수 있습니다. Style Books는 여러 콘텐츠 작성자와 웹 디자이너가 동시에 작업하여 새로운 경험을 만들 때 불일치를 줄이는 데 도움이 됩니다.

## 콘텐츠 제작 및 관리

### 애셋 라이브러리

이제 [전용 라이브러리](../content-authoring-and-management/asset-libraries/asset-libraries-overview.md) 생성하여 콘텐츠를 정리하고 재사용할 수 있습니다. 자산 라이브러리를 사용하면 여러 사이트에서 리소스를 더 쉽게 재사용할 수 있습니다.

자산 라이브러리는 웹 콘텐츠에만 국한되지 않습니다. 모든 자산 유형을 공유하고 필요한 사이트에 연결할 수 있습니다. 페이지를 만들거나 블로그 게시물을 작성하는 동안 콘텐츠 작성자는 연결된 자산 라이브러리에 액세스하고 이미지를 사용할 수 있습니다. 문서 또는 그 안에 저장된 콘텐츠.

![Asset Libraries are sharable across Sites and include any asset type.](./whats-new-73/images/06.png)

### 컨텐츠 대시보드

사용하지 않을 수 있는 콘텐츠로 가득 찬 대규모 데이터베이스를 보유한 사람들을 위해 Liferay는 [콘텐츠 대시보드](../content-authoring-and-management/content-dashboard/about-the-content-dashboard.md) 만들었습니다. 이는 콘텐츠 작성자가 특정 사이트뿐만 아니라 Liferay 인스턴스의 모든 사이트 및 자산 라이브러리에 대한 모든 콘텐츠에 액세스할 수 있는 원스톱 장소입니다. 이렇게 많은 양의 콘텐츠를 탐색하는 데 도움이 되도록 포괄적인 필터 세트는 콘텐츠 목록에 대한 필터 및 정렬 기능과 필요한 콘텐츠를 쉽게 찾고 감사하는 데 도움이 되는 감사 그래프를 제공합니다.

글로벌 메뉴 &rarr; 애플리케이션 탭을 통해 이 콘텐츠 대시보드에 액세스할 수 있습니다.

![The Content Dashboard helps you find hidden gems in your data that may be going unused.](./whats-new-73/images/07.gif)

### 콘텐츠 감사 도구

새로운 콘텐츠 대시보드에는 [로 콘텐츠를](../content-authoring-and-management/content-dashboard/content-dashboard-interface.md#content-audit-tool) 쉽게 감사할 수 있는 도구가 포함되어 있습니다. 어휘를 선택하면 콘텐츠 감사 그래프가 어휘의 각 카테고리에 대한 기존 자산 수를 계산합니다. 카테고리, 태그, 작성자, 자산 하위 유형, 사이트 등을 기준으로 필터링하여 그래프에 표시된 자산을 조정할 수 있습니다.

![The Content Audit tool helps you see the kinds of content you have.](./whats-new-73/images/08.gif)

### 확장된 분류 기능

7.3에서는 가시성을 내부 또는 [로 설정하기](../content-authoring-and-management/tags-and-categories/organizing-content-with-categories-and-tags.md#vocabulary-visibility) 어휘에 새로운 구성을 추가했습니다. 새로운 기본 청중, 무대 및 주제 글로벌 어휘는 사이트 전반에 걸쳐 보다 체계적인 분류를 제공합니다.

## 출판물 관리

[퍼블리싱](../site-building/publishing-tools/publications.md) 콘텐츠 제작자가 변경 사항을 준비하고 일정에 따라 게시할 수 있는 새로운 기능입니다. 이미지 업데이트, 복사 및 새 페이지 추가가 포함된 특별 계절 프로모션을 출시해야 하는 경우 출판물을 만들고 필요한 사용자를 초대하여 게시하기 전에 변경하도록 할 수 있습니다. 한 번에 여러 출판물을 작업할 수 있으므로 한 번에 많은 업데이트를 만들고 일정에 따라 배포할 수 있습니다.

![Publications provide a way to update your Site on a schedule of your choosing.](./whats-new-73/images/09.gif)

### 웹 콘텐츠 전용 번역 경험

[의 새로운 번역 UI](../content-authoring-and-management/translating-pages-and-content/translating-web-content.md#manually-translating-content) 사용하면 프로세스를 최적화하는 병렬 UI에서 콘텐츠를 쉽게 번역할 수 있습니다. 번역가는 권한이 있는 언어로만 번역할 수 있으며, 당사의 워크플로 프로세스를 통해 해당 번역을 쉽게 검토할 수 있습니다.

![The new translation UI makes the entire translation process painless.](./whats-new-73/images/10.png)

### 번역을 위한 웹 콘텐츠 가져오기/내보내기

번역을 위해 외부 대행사나 프리랜서를 이용하는 경우 이제 번역할 콘텐츠를 선택하고 필요한 언어를 번역 표준 형식 [번역을 위해 필요한 언어를 표준 형식으로 내보냅니다](../content-authoring-and-management/translating-pages-and-content/translating-web-content.md#exporting-and-importing-translations) XLIFF, 1.2 또는 2.0 버전) 번역본으로 보낼 수 있습니다. 대행사. 번역이 완료되면 번역을 가져와 원본 콘텐츠와 함께 사용할 수 있습니다.

![Translations can now be exported for translation and imported when finished.](./whats-new-73/images/11.gif)

## SEO 구성

### Open Graph

![Open Graph support means you can configure and preview links for social media and search engines.](./whats-new-73/images/12.gif)

이제 내장된 [Open Graph](../site-building/site-settings/configuring-open-graph.md) 지원을 통해 소셜 미디어에서 페이지 미리보기를 구성할 수 있습니다. 또한 귀하의 페이지가 검색 엔진 및 소셜 네트워크에 어떻게 나타나는지 실시간으로 미리 볼 수 있습니다.

### 리디렉션 관리

![You can create redirects and even set the type.](./whats-new-73/images/13.png)

이제 사이트의 [을 유효한 URL로](../site-building/site-settings/managing-site-urls/setting-up-redirects-and-404-tracking.md) 할 수 있습니다. 이제 404 오류로 연결되는 이전 링크에 대해 걱정할 필요가 없습니다. 임시 및 영구 리디렉션을 지원하고 리디렉션 만료 날짜를 설정합니다.

끊어진 링크의 경우 Liferay는 이제 모든 404 오류를 추적합니다. 이 목록을 사용하여 사용자가 원하는 것을 찾는 데 도움이 되는 새로운 리디렉션을 만들 수 있습니다.

![404 reports help you find possible broken links.](./whats-new-73/images/14.png)

### 친숙한 URL 기록

![Friendly URL History shows all URLs ever used for any page.](./whats-new-73/images/15.png)

이제 각 언어별로 [페이지에서 사용되는](../site-building/creating-pages/page-settings/configuring-your-pages-friendly-url.md#managing-a-page-s-url-history) 친숙한 URL을 모두 쉽게 확인하고 시각적으로 관리할 수 있습니다. 다른 페이지에서 재사용할 URL을 "잊거나" 이전에 친숙한 URL을 복원할 수 있습니다.

## 컨텐츠 효과

> 요구되는 기부금

이제 귀하의 콘텐츠를 완전히 읽은 방문자 수를 알 수 있습니다. [콘텐츠 성능 분석](../content-authoring-and-management/content-dashboard/content-dashboard-interface.md#content-performance-sidebar) 콘텐츠 작성자와 마케팅 담당자가 성공적인 콘텐츠 전략을 구축하고 평가하는 데 도움이 되는 관련 콘텐츠와 함께 표시됩니다.

![Content Performance shows views versus reads, search engines' incoming traffic volume, and keyword reports by region.](./whats-new-73/images/16.gif)

## 질문 앱

제품을 지원하기 위해 사이트를 사용하는 경우 새로운 [질문 앱](../collaboration-and-social/questions-application/using-the-questions-app.md) 사용하면 사용자가 제품에 대한 질문에 대한 답변을 찾는 데 도움이 될 수 있습니다. Liferay의 GraphQL API 및 메시지 보드 인프라를 활용하는 질문 앱은 가장 가치 있는 정보에 대한 투표 및 표시를 통해 사용자에게 최고의 답변을 제공합니다.

![Users can post a question and get answers quickly.](./whats-new-73/images/17.gif)

![The best answer can be chosen and voted up.](./whats-new-73/images/18.gif)

## 앱 빌더

![App Builder provides an in-browser development environment for low-code applications.](./whats-new-73/images/19.png)

[앱 빌더](../building-applications/reference/app-builder.md) 데이터 엔진이 지원하는 Liferay DXP용 새로운 로우 코드 애플리케이션 개발 솔루션입니다. 비즈니스 사용자는 직관적인 GUI를 통해 양식과 테이블 보기를 정의하고 워크플로우를 활용하여 비즈니스 프로세스의 디지털화 및 자동화를 목표로 애플리케이션을 구축할 수 있습니다. 애플리케이션은 독립형 방식으로 배포할 수도 있고, 위젯이나 제품 메뉴를 통해 페이지에 추가할 수도 있습니다.

### 양식 보기 규칙 및 필드 세트

App Builder는 필드의 가시성을 설정하거나 사전 정의된 조건을 사용하여 필드를 활성화 또는 비활성화하는 등 동적 양식 동작을 정의하기 위한 규칙 빌더를 제공합니다.

![Form View Rules make it easy to control presentation of a form.](./whats-new-73/images/20.png)

필드 세트는 함께 그룹화된 필드이며, App Builder의 필드 세트를 사용하면 다양한 개체 및 양식 보기에서 필드 세트를 쉽게 생성, 업데이트 및 재사용할 수 있습니다. 이렇게 하면 각 애플리케이션에 대해 동일한 필드 그룹(예: 주소)을 반복해서 다시 만들 필요가 없습니다.

![Fieldsets group fields so they can be shared across forms.](./whats-new-73/images/21.png)

### 프로세스 기반 앱

> 요구되는 기부금

App Builder에는 승인을 위한 [워크플로 프로세스가 포함되어 있습니다](../building-applications/reference/app-builder/creating-a-workflow-powered-application.md) . 프로세스 단계를 정의하고 애플리케이션의 각 단계에서 요청 및/또는 표시해야 하는 정보를 지정할 수 있습니다. 또한 [Workflow Metrics](#workflow-metrics-improvements) 을 활용하여 앱 프로세스의 성능과 상태를 이해할 수도 있습니다.

![Process-Driven Apps](./whats-new-73/images/22.png)

### 현지화된 애플리케이션

App Builder 애플리케이션은 여러 다른 언어로 현지화될 수도 있습니다. Form View Builder는 필드를 선택하고 원하는 언어로 번역하기 위한 인터페이스를 제공합니다.

### 데이터 엔진 개선

App Builder 내부에서는 데이터 엔진을 사용하여 애플리케이션을 구축할 때 개발자 환경을 강화하기 위해 데이터 엔진이 개선되었습니다.

- 필드 세트를 생성하고 재사용하는 기능.
- 데이터 기록 컬렉션을 검색합니다.
- 데이터 정의 키로 레이아웃을 렌더링합니다.
- 데이터 정의 및 레이아웃에 대한 버전 속성을 생성합니다.
- 이름으로 데이터 레이아웃을 검색합니다.
- `ClassNameId`를 사용하여 범위 데이터 정의.
- 빌더 태그 라이브러리를 사용하여 데이터 정의를 저장합니다.
- 데이터 기록을 현지화할 수 있도록 만듭니다.
- 필드를 중첩하는 기능.
- 새로운 필드 유형 및 시각적 요소:
- 구분 기호
- 리치 텍스트 필드
- 이미지 필드
- 지리적 사이트
 필드
- 색상 필드

## 양식

사용자 제공 데이터는 종종 웹 양식 [웹 양식](../process-automation/forms/introduction-to-forms.md) 사용하여 수집되므로 Liferay는 GDPR 요구 사항을 준수하는 양식을 디자인하기 위한 GUI 및 개발 도구를 제공했습니다.

### 데이터 삭제(GDPR 잊혀질 권리라고도 함)

잊혀질 권리(기술적으로는 "삭제 권리"라고 함)에 따라 조직은 개인의 요청에 따라 개인 데이터를 삭제해야 합니다. 개인 데이터는 데이터가 더 이상 식별 가능한 개인과 합리적으로 연결될 수 없는 경우 삭제된 것으로 간주됩니다. 이제 간단한 인터페이스를 통해 양식 항목을 검토하고 필요에 따라 개인 정보를 편집, 익명화 또는 삭제할 수 있습니다.

### 데이터 내보내기(일명 GDPR 데이터 이동성에 대한 권리)

데이터 이동성에 대한 권리는 조직이 요청 시 기계 판독이 가능한 사용자 개인 데이터 내보내기를 제공하도록 요구합니다. 이제 삭제 프로세스를 진행하기 전에 Forms를 통해 제출된 사용자의 개인 데이터를 내보낼 수 있습니다.

### 양식 보고서

이제 Liferay Forms에는 수신된 답변에 대한 요약 보고서가 내장되어 있어 수집된 데이터를 볼 수 있을 뿐만 아니라 답변에 대한 전반적인 분석도 볼 수 있습니다.

![Forms Reports now have a default, easy-to-read summary of answers.](./whats-new-73/images/23.png)

### 페이지 재정렬

이제 여러 페이지로 구성된 양식을 만들고 관리하는 것뿐만 아니라 양식의 페이지 순서를 바꾸는 것도 더 쉬워졌습니다.

![Page Reordering, an oft-requested feature, is now provided in Forms.](./whats-new-73/images/24.png)

### 워크플로 지표 개선

### 담당자의 워크로드

[Workflow Metrics](../process-automation/workflow/using-workflows/using-workflow-metrics.md) 에는 이제 프로세스 담당자의 작업량 분석을 보여주는 카드가 있습니다. 이 새로운 차트는 과부하된 담당자를 식별하고 병목 현상을 제거하기 위해 작업을 재할당하는 등 더 나은 결정을 내릴 수 있는 귀중한 정보를 제공합니다.

![Workload by Assignee shows you at a glance the workflow queues of various users.](./whats-new-73/images/25.png)

### 피배정인 성과

최고의 성과를 낸 사람이 누구인지 이해하는 데 도움이 되도록 성과 탭 아래에 각 담당자의 평균 완료 시간과 완료된 총 작업을 보여주는 새 카드가 있습니다.

![You can now view assignees' average performance at a glance.](./whats-new-73/images/26.png)

### 단계별 성과

각 단계에서 SLA 위반이 발생한 횟수와 단계의 평균 완료 시간을 확인하여 프로세스의 병목 현상이 있는 사이트
를 식별합니다.

![Performance by Step shows you where the bottlenecks are.](./whats-new-73/images/27.png)

### 일괄 작업

이제 워크플로 지표 보고서에서 프로세스 상태와 성능을 분석하는 동안 인스턴스를 대량 전환 및/또는 재할당할 수 있습니다.

![Select multiple items to perform bulk actions on them.](./whats-new-73/images/28.png)

## 글로벌 메뉴

새로운 애플리케이션 서랍에는 워크플로, 양식, 상거래 [커머스](https://learn.liferay.com/w/commerce/index) 의 크로스 사이트 애플리케이션이 들어 있습니다.

![The Global Menu provides convenient access to cross-site applications.](./whats-new-73/images/29.png)

## 애플리케이션 보안

### 다단계 인증

> 요구되는 기부금

[Multi-Factor Authentication](../installation-and-upgrades/securing-liferay/multi-factor-authentication/using-multi-factor-authentication.md) (MFA)은 사용자에게 여러 가지 방법, 즉 **factors** 로 자신의 신원을 증명하도록 요구하여 더 나은 보안을 제공합니다. 기본 사용자 이름/비밀번호 조합은 하나 이상의 추가 구성 요소로 강화됩니다. 여기에는 기본 일회용 비밀번호(OTP)와 구성 가능한 IP 주소, 시간 기반 OTP, 그리고 시스템 확장이 가능하므로 작성하려는 모든 요소가 포함됩니다.

### 인스턴스 수준의 SAML 구성

이 변경을 통해 인증서 처리를 포함하여 인스턴스 수준에서 [SAML](../installation-and-upgrades/securing-liferay/configuring-sso/authenticating-with-saml.md) 설정을 구성할 수 있습니다.

새로운 SAML 속성이 도입되었습니다: **알 수 없는 사용자는 낯선 사람입니다** . 이 속성은 최종 사용자가 낯선 사람일 때 SAML IdP 연결 동작을 결정합니다. 이 속성은 포털 데이터베이스에 아직 존재하지 않는 사용자를 낯선 사람으로 분류해야 하는지 여부를 정의합니다. 분류된 후에는 포털 인스턴스의 기존 낯선 사람 처리 정책에 따라 IdP의 SAML 어설션에서 제공되는 정보를 사용하여 사용자를 자동으로 프로비저닝해야 하는지 여부가 결정됩니다.

### 인스턴스 수준의 OAuth 2 구성

[OAuth 2](../headless-delivery/using-oauth2.md) 애플리케이션 범위 화면이 단순화되었으므로 애플리케이션 승인 요청 중에 범위 표시를 더 효과적으로 제어할 수 있습니다. 예를 들어, 두 개의 별도 API 애플리케이션과 관련된 두 개의 범위가 하나인 것처럼 표시될 수 있습니다.

이제 만료된 인증을 제거하도록 구성할 수 있습니다. 인증 후 유효 기간이 만료되면 인증 데이터는 백그라운드에서 실행되는 예약된 프로세스에 의해 자동으로 제거됩니다.

### 인스턴스 수준의 OpenId Connect 구성

이제 각 인스턴스는 서로 다른 [OpenId Connect](../installation-and-upgrades/securing-liferay/configuring-sso/using-openid-connect.md) 공급자에 대한 연결을 구성할 수 있습니다.

시스템 수준 OpenId Connect 공급자는 모든 인스턴스에 표시되며 기본 OpenId Connect 공급자처럼 작동합니다.

### 인스턴스 수준의 CORS 구성

이제 인스턴스 수준에서 [CORS](../installation-and-upgrades/securing-liferay/securing-web-services/setting-up-cors.md) 설정을 구성할 수 있습니다. 인스턴스 수준에서 구성하는 방법은 시스템 수준에서와 동일하게 유지됩니다.

이제 URL 패턴은 인스턴스 수준에서 먼저 일치한 다음 시스템 수준에서 일치합니다. 인스턴스 수준의 패턴이 우선 적용됩니다.

## 수색

Elasticsearch [에 대한 Liferay DXP](../using-search/installing-and-upgrading-a-search-engine/elasticsearch.md) 의 검색 엔진 커넥터에는 여러 가지 개선 사항과 변경 사항이 있습니다.

### 엘라스틱서치 7 지원

Liferay DXP의 기본 검색 엔진이 Elasticsearch 7로 업그레이드되었습니다.

### 다중 연결

이제 Liferay DXP를 여러 Elasticsearch 클러스터에 연결할 수 있습니다. 이 기능은 낮은 수준 검색 옵션 및 검색 결과 위젯과 함께 사용되어 Elasticsearch 클러스터를 사용하는 타사 시스템의 결과를 표시할 수 있습니다.

### REST 클라이언트

Elasticsearch와의 통신은 이제 전송 클라이언트 대신 REST 클라이언트를 사용합니다.

### 위젯 템플릿 지원

이제 검색 위젯이 위젯 템플릿을 지원합니다.

## 개발자 경험

### API 탐색기

![The API Explorer shows all available APIs in a Liferay DXP installation.](./whats-new-73/images/30.png)

[API 탐색기](../headless-delivery/consuming-apis/consuming-rest-services.md) Liferay DXP의 사용 가능한 API를 탐색하고 쿼리하기 위한 인터페이스를 제공합니다. 모든 REST 애플리케이션과 해당 엔드포인트를 탐색할 수 있습니다.

![You can query any of the APIs from the API Explorer.](./whats-new-73/images/31.png)

[GraphQL 클라이언트](../headless-delivery/consuming-apis/consuming-graphql-apis.md) 사용하면 쿼리를 쉽게 정의하고 테스트할 수 있습니다.

### OpenAPI 유효성 검사기

OpenAPI 유효성 검사기는 구성 파일에 오류가 있는지 알려주고 표준 Liferay에 아직 지원하지 않는 기능이 있는지 알려줍니다.

### 일괄 작업

헤드리스 API는 이제 일괄 작업을 지원합니다.

### 단일 요청으로 현지화된 콘텐츠의 모든 번역을 관리합니다.

헤드리스 API에서 동시에 번역을 추가, 업데이트 또는 검색할 수 있습니다.

### Headless API에서 작업 노출

이제 권한에 따라 허용된 사용자 작업을 쿼리에서 검색할 수 있습니다. 이제 동적 작업 메뉴가 포함된 앱을 만들어 사용자가 수행할 수 있는 작업만 표시할 수 있습니다.

### 문서 및 미디어 API에 메타데이터 노출

문서 및 미디어 API는 이제 문서 유형에 포함된 전체 메타데이터 세트를 노출합니다.

### 콘텐츠 템플릿 API

API를 통해 콘텐츠 템플릿을 가져오고 필요한 경우 Liferay 외부에서 콘텐츠를 렌더링할 수 있습니다.

### 자산 라이브러리 전달 API

헤드리스 REST 및 GraphQL API를 통해 자산 라이브러리에 저장된 콘텐츠와 문서에 액세스할 수 있으므로 Liferay DXP를 다른 애플리케이션의 콘텐츠 저장소로 사용할 수 있습니다.

### 헤드리스 API 확장성

헤드리스 API는 확장 가능하므로 OOTB 애플리케이션에서 새 속성이나 새 구성 요소를 쉽게 노출하고, 엔드포인트를 비활성화하고, GraphQL에 기여를 추가하는 등의 작업을 수행할 수 있습니다.

### 컬렉션의 패싯 반환

헤드리스 API를 사용하면 이제 요소 컬렉션(문서, 구조화된 콘텐츠 등)을 검색할 때 검색 패싯을 요청할 수 있습니다. 이를 사용하여 최종 사용자에게 표시되는 동적 필터를 구축할 수 있습니다.

### React.js 시설

Liferay는 내부 UI의 상당 부분을 React로 전환하기 시작했습니다. 이러한 변경의 부작용으로 비슷한 경로를 따르는 다른 사람들의 삶을 더 쉽게 만들어 줄 수 있는 새로운 유틸리티가 추가되었습니다.

**ReactRenderer:** React 구성 요소를 렌더링하기 위한 낮은 수준의 Java 기본 요소로, React 구성 요소의 부트스트래핑을 단순화하고 초기화에 필요한 JavaScript 코드를 생성합니다.

**React:comComponent:** 기존 'MVCPortlet' 접근 방식과 결합하여 기존 JSP에서 복잡한 React 애플리케이션을 렌더링하고 초기화할 수 있는 상위 수준 JSP 태그입니다. 이를 통해 복잡한 JS 애플리케이션의 점진적인 마이그레이션과 보다 현대적인 프런트엔드 워크플로의 채택이 촉진됩니다.

### 업그레이드 개선

[업그레이드 프로세스](../installation-and-upgrades/upgrading-liferay/upgrade-basics.md) 에 많은 안정성 개선 사항이 추가되었습니다.업그레이드 프로세스가 코어와 모듈 간에 통합되었습니다. 자동 업그레이드 동작은 새로운 포털 속성 `upgrade.database.auto.run`으로 제어할 수 있습니다.
