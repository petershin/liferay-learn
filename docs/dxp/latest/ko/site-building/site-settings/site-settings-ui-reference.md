# 사이트 설정 UI 참조

Liferay DXP 7.4부터 사이트 설정 애플리케이션 레이아웃은 인스턴스 설정 또는 시스템 설정과 같은 다른 구성 영역과 일치합니다.

```{note}
사이트 설정 응용 프로그램은 Liferay DXP 7.4+에서 크게 변경됩니다. 이전 버전에 대한 정보는 아래의 [Liferay DXP 7.2 및 7.3의 사이트 설정 UI 참조](#site-setting-ui-reference-in-liferay-dxp-7-2-and-7-3) 를 참조하십시오.
```

## 사이트 설정 애플리케이션에 액세스

1. 사이트 관리 &rarr; **구성** &rarr; **사이트 설정** 로 이동합니다.
1. 설정을 클릭하여 구성을 엽니다.

다음 구성 영역을 찾을 수 있습니다.

* [커머스](#commerce)
* [플랫폼](#platform)
* [컨텐츠 및 데이터](#content-and-data)
* [기타](#other)

![사이트 설정은 네 영역으로 구성됩니다.](./site-settings-ui-reference/images/20.png)

## 커머스

기본적으로 상거래 영역에는 다음 설정이 포함됩니다.

- 카탈로그
- 명령
- 결제
- 선박

여기에서 사이트 범위에서 상거래 설정을 구성할 수 있습니다. 상거래 설정에 대한 자세한 내용은 [Liferay Commerce 구성 개요](https://learn.liferay.com/w/commerce/store-management/liferay-commerce-configuration-overview) 을 참조하십시오.

![상거래용 기본 사이트 설정](./site-settings-ui-reference/images/21.png)

## 플랫폼

기본적으로 플랫폼 영역에는 다음 설정이 포함됩니다.

* [해석학](#analytics)
* [지역화](#localization)
* [사이트 환경 설정](#site-configuration)
* [써드파티](#third-party)
* [타사 애플리케이션](#third-party-applications)
* [사용자](#users)

### 해석학

이 설정을 사용하여 사이트에 대한 Google Analytics 옵션을 구성하십시오. Piwik Analytics 추적 코드를 설정할 수도 있습니다.

```{note}
Piwik 구성에서 스크립트 시작 및 종료 태그를 포함한 전체 스크립트 코드를 입력합니다.
```

다른 분석 서비스가 필요한 경우 추가할 수 있습니다. 다른 분석 서비스에 대한 추가 필드를 추가하는 방법에 대한 자세한 내용은 [새 분석 서비스 추가](./adding-a-new-analytics-service.md) 을 참조하십시오.

### 지역화

여기에서 설치의 기본 언어 옵션을 사용할지 또는 사이트에 대해 고유한 언어를 정의할지 여부를 선택할 수 있습니다. 사이트의 언어 옵션 설정에 대한 자세한 내용은 [사이트 현지화](../site-settings/site-localization.md)을 참조하십시오.

![현지화 설정을 사용하여 사이트 언어 옵션을 설정하십시오.](./site-settings-ui-reference/images/22.png)

### 사이트 환경 설정

기본적으로 사이트 구성에는 세부 정보 및 사이트 URL 섹션이 포함됩니다.

#### 세부사항

| 환경         | 묘사                                                                                                                                         |
|:---------- |:------------------------------------------------------------------------------------------------------------------------------------------ |
| 사이트 ID     | 생성 시 사이트에 대해 자동으로 생성되는 고유 번호입니다. 이 ID는 영구적이며 변경할 수 없습니다.                                                                                   |
| 묘사         | 이 필드를 사용하여 사이트의 목적을 설명하십시오.                                                                                                                |
| 현재 제목      | 상위 사이트를 선택하여 사이트를 하위 사이트로 지정합니다. 자세한 내용은 [사이트 계층 구조](../sites/site-hierarchies.md) 을 참조하십시오.                                               |
| 멤버십 유형     | 사이트의 멤버십이 얼마나 제한적인지 결정합니다. 자세한 내용은 [사이트 구성원 유형 변경](../site-settings/site-users/changing-site-membership-type.md) 을 참조하십시오.                 |
| 수동 회원관리 허용 | 구성원을 사이트에서 수동으로 추가하거나 제거하도록 허용할지 여부를 결정합니다. 자세한 내용은 [사이트 구성원 유형](../site-settings/site-users/changing-site-membership-type.md) 변경을 참조하십시오. |

#### 사이트 URL

| 환경     | 묘사                                                                                                                                                      |
|:------ |:------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 친절한URL | 사이트 페이지에 대한 사용자 지정 URL을 설정합니다. 자세한 내용은 [사이트의 친숙한 URL 구성](../site-settings/managing-site-urls/configuring-your-sites-friendly-url.md) 을 참조하십시오.          |
| 페이지    | 사이트 페이지의 친숙한 URL에 매핑되는 가상 호스트를 설정합니다. 자세한 내용은 [가상 호스트 사이트 URL 구성](../site-settings/managing-site-urls/configuring-virtual-hosts-site-urls.md) 을 참조하십시오. |

### 써드파티

Liferay Commerce에 대한 PunchOut2Go 사이트 설정을 구성합니다. 자세한 내용은 [Liferay Commerce Connector to PunchOut2Go 참조 안내서](https://learn.liferay.com/web/guest/w/commerce/add-ons-and-connectors/punchout2go/liferay-commerce-connector-to-punchout2go-reference-guide) 을 참조하십시오.

### 타사 애플리케이션

기본적으로 타사 애플리케이션에는 지도 및 Google 지역 정보 섹션이 포함됩니다.

| 섹션       | 묘사                                                                                                                                                                                                                                  |
|:-------- |:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 자산 자동 태깅 | 활성화되면 인스턴스 범위에서 구성된 공급자가 자산에 자동 태그를 지정합니다. 자세한 내용은 [자산 자동 태깅 구성](../../content-authoring-and-management/tags-and-categories/auto-tagging/configuring-asset-auto-tagging.md) 을 참조하십시오.                                               |
| 분류       | 이 섹션을 사용하여 사이트를 분류하십시오. 이 설정은 사이트에서 사용할 수 있는 범주 및 태그에 영향을 주지 않습니다. 카테고리 및 태그 사용에 대한 자세한 내용은 [카테고리 및 태그로 콘텐츠 구성](../../content-authoring-and-management/tags-and-categories/organizing-content-with-categories-and-tags.md)을 참조하십시오. |

### 사용자

기본적으로 사용자 섹션에는 새 사이트 구성원에 대한 기본 역할 및 팀을 구성할 수 있는 기본 사용자 연결 설정이 포함되어 있습니다. 자세한 내용은 [사이트 구성원의 역할 및 팀 기본값 구성](../site-settings/site-users/configuring-role-and-team-defaults-for-site-members.md)을 참조하십시오.

## 컨텐츠 및 데이터

기본적으로 콘텐츠 및 데이터 영역에는 다음 설정이 포함됩니다.

* [자산](#assets)
* [채팅하기 위해 클릭합니다.](#click-to-chat)
* [커뮤니티 도구](#community-tools)
* [디지탈 서명](#digital-signature)
* [문서 및 미디어](#documents-and-media)
* [게시판](#message-boards)
* [페이지](#pages)
* [휴지통](#recycle-bin)
* [보고서](#reports)
* [나누는](#sharing)

### 자산

| 섹션            | 묘사                                                                                                                                                                                                          |
|:------------- |:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 지도            | 사이트에 지역화된 자산을 표시할 때 사용할 지도 API 공급자를 선택합니다. 문서, 웹 콘텐츠 기사, DDL 레코드 등에 대해 지역화된 자산을 표시할 수 있습니다. 자세한 내용은 [지리적 사이트 자산](../../content-authoring-and-management/tags-and-categories/geolocating-assets.md) 을 참조하십시오. |
| 구글 플레이스 API 키 | Google Places API 키를 설정합니다.                                                                                                                                                                                 |

### 채팅하기 위해 클릭합니다.

> 가능: 라이프레이 7.4 GA2+

Liferay DXP를 여러 라이브 지원 채팅 플랫폼과 통합할 수 있습니다. 사이트 범위의 구성은 인스턴스 범위의 Click to Chat 구성에 따라 다릅니다. 자세한 내용은 [자동 라이브 채팅 시스템 활성화](../personalizing-site-experience/enabling-automated-live-chat-systems.md)을 참조하십시오.

사이트 설정 전략 텍스트 아래의 인스턴스 범위에서 이 설정에 대한 구성 유형을 볼 수 있습니다.

![사이트 설정 전략 아래의 인스턴스 범위에서 구성 유형을 찾으십시오.](./site-settings-ui-reference/images/23.png)

```{note}
인스턴스 범위의 구성에 따라 사이트 범위의 구성을 업데이트하지 못할 수도 있습니다. 인스턴스 구성을 확인하려면 사이트 메뉴 → 제어판 → 인스턴스 설정 → 콘텐츠 및 데이터 → 클릭하여 채팅으로 이동하십시오.
```

### 커뮤니티 도구

| 섹션 | 묘사                                                                                                                                                                        |
|:-- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 멘션 | 사용자가 사이트 응용 프로그램에서 다른 사용자를 언급하도록 허용할지 여부를 결정합니다. 자세한 내용은 [멘션 구성하기](../../collaboration-and-social/notifications-and-requests/user-guide/configuring-mentions.md) 을 참조하세요. |
| 등급 | 여기에서 다양한 사이트 응용 프로그램에 사용되는 등급 유형을 선택할 수 있습니다. 자세한 내용은 [콘텐츠 등급 유형 구성](../site-settings/site-content-configurations/configuring-content-rating-type.md) 을 참조하세요.            |

### 디지탈 서명

Liferay DXP를 DocuSign과 통합하여 전자 서명을 관리할 수 있습니다. 사이트 범위의 구성은 인스턴스 범위의 디지털 서명 구성에 따라 다릅니다. 사이트 설정 전략 텍스트 아래에서 인스턴스 구성을 확인할 수 있습니다.

![사이트 설정 전략 아래의 인스턴스 범위에서 구성 유형을 찾으십시오.](./site-settings-ui-reference/images/24.png)

```{note}
인스턴스 범위에서 디지털 서명 구성에 따라 사이트 범위에서 구성을 업데이트하지 못할 수 있습니다. 인스턴스 구성을 확인하려면 사이트 메뉴 → 제어판 → 인스턴스 설정 → 콘텐츠 및 데이터 → 디지털 서명으로 이동합니다. 
```

### 문서 및 미디어

활성화되면 보기 권한이 있는 사용자가 사이트의 문서 라이브러리 파일 및 폴더를 찾아볼 수 있습니다. 자세한 내용은 [사이트 문서 콘텐츠 보안](../site-settings/site-content-configurations/securing-site-documents-content.md)을 참조하십시오.

### 게시판

이 옵션을 사용하면 미리 정의된 메시지 수 이후 메시지 보드에서 사용자 메시지의 자동 조정을 활성화할 수 있습니다.

![메시지 보드의 자동 조정을 구성합니다.](./site-settings-ui-reference/images/25.png)

### 페이지

| 섹션                                          | 묘사                                                                                                                                                                                                                                                                      |
|:------------------------------------------- |:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Google PageSpeed Insights(Liferay DXP 7.4+) | Liferay DXP에서 Google PageSpeed Insight 통합을 활성화합니다. 이 옵션을 사용하면 접근성 문제에 대해 페이지를 감사하고 문제 해결을 위한 제안을 확인할 수 있습니다. 자세한 내용은 [페이지](../../content-authoring-and-management/page-performance-and-accessibility/analyze-seo-and-accessibility-on-pages.md) 의 SEO 및 접근성 분석을 참조하십시오. |
| Open Graph                                  | 이러한 태그는 Facebook, Slack 및 Twitter와 같은 Open Graph 프로토콜을 지원하는 애플리케이션에서 공유할 때 사이트 콘텐츠의 매력적인 표현을 만들기 위해 페이지 메타데이터를 정의합니다. Open Graph `<meta>` 태그가 활성화되면 사이트 페이지의 `헤드` 에 포함됩니다. 자세한 내용은 [Open Graph 구성](./configuring-open-graph.md)을 참조하십시오.                          |
| 페이지                                         | 사이트의 페이지를 봅니다. 이 섹션에서는 사이트 템플릿(있는 경우)의 변경 전파를 구성할 수도 있습니다. 자세한 내용은 [사이트 템플릿](../sites/site-templates.md) 및 [템플릿 변경 전파](../sites/site-templates/propagating-template-changes.md) 을 참조하십시오.                                                                               |

### 휴지통

사이트의 휴지통을 구성합니다. 자동 삭제 전에 자산이 휴지통에 남아 있는 시간(분)을 지정할 수 있습니다. 기본적으로 재활용 품목의 최대 수명은 43200분(30일)입니다. 자세한 내용은 [사이트용 자산 휴지통 구성](../site-settings/site-content-configurations/configuring-the-asset-recycle-bin-for-sites.md) 을 참조하십시오.

### 보고서

보고서 그룹 서비스 기능에 대한 설정입니다.

### 나누는

| 섹션     | 묘사                                                                                                                                                                                                                                              |
|:------ |:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 만족한 조정 | 하위 사이트가 구조, 템플릿, 범주 또는 위젯 템플릿을 포함하여 이 사이트의 콘텐츠를 표시하도록 허용하려면 이 옵션을 활성화합니다. 이 옵션을 비활성화하면 모든 하위 사이트에서 콘텐츠 공유가 즉시 취소됩니다. 자세한 내용은 [사이트 간 콘텐츠 공유 관리](../site-settings/site-content-configurations/managing-content-sharing-across-sites.md) 을 참조하십시오. |
| 나누는    | 활성화되면 사용자는 서로 항목을 공유할 수 있습니다. 자세한 내용은 [공유 활성화 및 구성](../../content-authoring-and-management/documents-and-media/publishing-and-sharing/managing-document-access/enabling-and-configuring-sharing.md) 을 참조하십시오.                                   |

## 기타

기본적으로 기타 영역에는 다음 설정이 포함됩니다.

| 섹션      | 묘사                                                                                                                                                                                   |
|:------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 기타      | 사이트에 대해 정의한 사용자 정의 사이트 설정(있는 경우)을 포함합니다. 자세한 내용은 [구성 설정 및 액세스](../../building-applications/core-frameworks/configuration-framework/setting-and-accessing-configurations.md)을 참조하십시오. |
| 세금      | Liferay Commerce에서 원격 상거래 세금 구성에 대한 설정을 구성합니다. 자세한 내용은 [커머스](https://learn.liferay.com/w/commerce/index) 설명서를 참조하십시오.                                      |
| 카테고리.세율 | Liferay Commerce Avalara 통합에 대한 설정을 구성합니다. 자세한 내용은 [커머스](https://learn.liferay.com/w/commerce/index) 설명서를 참조하십시오.                                          |

## Liferay DXP 7.2 및 7.3의 사이트 설정 UI 참조

사이트 설정을 보려면 사이트 메뉴(![Site Menu](../../images/icon-product-menu.png))를 열고 **구성** &rarr; **설정** 로 이동합니다. 여기에는 다음 탭이 표시됩니다.

* [일반](#general)
* [사회](#social)
* [언어](#language)
* [고급](#advanced)

![사이트 설정은 4개의 탭으로 구성됩니다.](./site-settings-ui-reference/images/01.png)

```{note}
이러한 설정 중 많은 부분을 현지화하여 사용자의 로케일을 기반으로 번역을 제공할 수 있습니다. [현지화 소개](https://help.liferay.com/hc/ko/articles/360028746672-Introduction-to-Localization) 및 [현지화할 수 있는 사이트 필드 수정](./site-localization.md#modifying 참조) -localizable-site-fields)에서 자세한 내용을 확인하세요.
```

### 일반

일반 설정은 사이트의 구성원 유형과 같은 핵심 구성에서 문서 및 미디어 인덱싱 옵션과 같은 세부 정보에 이르기까지 다양합니다. 탭의 콘텐츠는 세부 정보, 페이지, 분류, 사이트 URL, 문서 및 미디어, 오픈 그래프, 자산 자동 태그 지정, 공유 및 사용자 정의 필드와 같은 하위 섹션으로 구성됩니다.

#### 세부사항

**사이트 ID** : 사이트 생성 시 자동으로 생성되는 고유번호. 이 ID는 영구적이며 변경할 수 없습니다.

**이름** : **이름** 필드를 사용하여 사이트의 제목을 설정합니다. 이 제목은 브라우저의 제목 표시줄과 각 사이트 페이지의 헤더에 표시됩니다. **언어 플래그** 버튼을 통해 사이트 이름을 현지화할 수도 있습니다.

**설명** : **설명** 필드를 사용하여 사이트의 목적을 설명합니다. **언어 플래그** 버튼을 통해 사이트 설명을 현지화할 수도 있습니다.

**활성** : 사이트가 **활성** 또는 **비활성** 확인합니다. 비활성 상태에서는 사용자가 사이트에 액세스할 수 없지만 원하는 경우 다시 활성화할 수 있습니다.

**회원 유형** : A **회원 유형** 은 사이트의 회원 자격이 얼마나 제한적인지를 결정합니다. 자세한 내용은 [사이트 구성원 유형 변경](./site-users/changing-site-membership-type.md) 을 참조하십시오.

**수동 회원 관리 허용** : 사이트에서 회원을 수동으로 추가하거나 제거할 수 있는지 여부를 결정합니다. 사이트의 멤버십이 멤버십 정책에 의해 자동으로 처리되는 경우 이 설정을 비활성화할 수 있습니다. 자세한 내용은 [사이트에 대한 회원 정책 관리](./site-users/changing-site-membership-type.md) 을 참조하십시오.

**상위 사이트** : 상위 사이트를 선택하여 사이트를 하위 사이트로 지정합니다. 자세한 내용은 [사이트 계층 구조](../sites/site-hierarchies.md) 을 참조하십시오.

**상위 사이트 구성원으로 구성원 자격 제한** : 하위 사이트의 구성원 자격이 상위 사이트 구성원으로 제한되는지 여부를 결정합니다. 이 옵션은 하위 사이트에만 나타납니다.

#### 페이지

사이트의 공개 및 비공개 페이지(있는 경우)를 보고 선택한 사이트 템플릿의 변경 사항 전파를 활성화 또는 비활성화합니다. 존재하지 않는 경우 템플릿이 있는 페이지를 만들기 위한 사이트 템플릿 선택기가 나타납니다.

![페이지 섹션에서 사이트의 공개 및 비공개 페이지를 볼 수 있습니다.](./site-settings-ui-reference/images/03.png)

### 주문 속성

페이지에 대해 정의한 모든 사용자 정의 필드를 보고 구성합니다. 이러한 필드를 사용하여 작성자, 생성 날짜 및 지리적 사이트와 같은 페이지 메타데이터를 설정할 수 있습니다. 이 섹션은 사이트에 대한 사용자 정의 필드를 구성한 경우에만 나타납니다. 자세한 내용은 [사용자 정의 필드](../../system-administration/configuring-liferay/adding-custom-fields.md) 을 참조하십시오.

#### 분류

범주 및 태그를 사용하여 사용자가 더 쉽게 찾을 수 있도록 사이트의 콘텐츠를 분류합니다. 태그 및 카테고리 사용에 대한 자세한 내용은 [태그 및 카테고리로 콘텐츠 구성](../../content-authoring-and-management/tags-and-categories/organizing-content-with-categories-and-tags.md)을 참조하십시오.

#### 사이트 URL

**친숙한 URL** : 공개 및 비공개 사이트 페이지 모두에 대해 사용자 정의 URL을 설정합니다. 자세한 내용은 [사이트의 친숙한 URL 구성](./managing-site-urls/configuring-your-sites-friendly-url.md) 을 참조하십시오.

**공개 및 비공개 가상 호스트** : 사이트의 공개 및 비공개 페이지에 매핑할 공개 및 비공개 가상 호스트를 설정합니다. 자세한 내용은 [가상 호스트 사이트 URL 구성](./managing-site-urls/configuring-virtual-hosts-site-urls.md) 을 참조하십시오.

![사이트 URL 섹션에서 공개 및 비공개 페이지에 대한 가상 호스트뿐만 아니라 사이트의 친숙한 URL을 구성할 수 있습니다.](./site-settings-ui-reference/images/05.png)

#### 문서 및 미디어

사이트에 대한 디렉터리 인덱싱을 활성화할지 여부를 결정합니다. 활성화되면 보기 권한이 있는 사용자가 사이트의 문서 라이브러리 파일 및 폴더를 찾아볼 수 있습니다.

#### 사이트 템플렛

**사이트 템플릿** 을 사용하여 사이트를 만든 경우 템플릿이 사용자가 템플릿을 상속하는 페이지를 수정할 수 있도록 허용하는지 여부와 함께 여기에 표시됩니다. 자세한 내용은 [사이트 템플릿](../sites/site-templates.md) 을 참조하십시오.

![페이지에서 선택한 템플릿을 봅니다.](./site-settings-ui-reference/images/07.png)

#### Open Graph

**Open Graph** 사용: 사이트 페이지의 `<head>` 에 [Open Graph](https://ogp.me/) `<meta>` 태그를 삽입할지 여부를 결정합니다. 이러한 태그는 Facebook, Slack 및 Twitter와 같은 Open Graph 프로토콜을 지원하는 애플리케이션에서 공유할 때 사이트 콘텐츠의 매력적인 표현을 만들기 위해 페이지 메타데이터를 정의합니다.

**이미지** : 이미지 필드를 사용하여 페이지에 대한 다음 Open Graph `<meta>` 속성을 정의합니다.

   ```html
      <meta property="og:image" content="http://example.com/ogp.jpg" />
      <meta property="og:image:secure_url" content="https://secure.example.com/ogp.jpg" />
      <meta property="og:image:type" content="image/jpeg" />
      <meta property="og:image:width" content="400" />
      <meta property="og:image:height" content="300" />
   ```

**이미지 대체 설명** : 이미지 대체 설명 필드를 사용하여 페이지에 대한 `og:image:alt` 속성을 정의합니다. **언어 플래그** 버튼을 통해 이미지의 대체 설명을 현지화할 수도 있습니다.

자세한 내용은 [오픈 그래프 구성](./configuring-open-graph.md) 을 참조하십시오.

![Open Graph를 활성화 또는 비활성화하고, 이미지 메타 태그를 정의하고, 이미지 미리보기를 볼 수 있습니다.](./site-settings-ui-reference/images/08.png)

#### 나누는

사이트 사용자 간에 문서 공유를 활성화할지 여부를 결정합니다. 활성화되면 사용자는 서로 항목을 공유할 수 있습니다. 자세한 내용은 [다른 사용자와 문서 공유](../../content-authoring-and-management/documents-and-media/publishing-and-sharing/managing-document-access/sharing-documents-with-other-users.md) 을 참조하십시오.

#### 자산 자동 태깅

사이트에 대해 자산 자동 태그 지정을 활성화할지 여부를 결정합니다. 활성화되면 자산은 인스턴스 범위에서 구성된 제공자에 의해 자동으로 태그 지정됩니다. 자세한 내용은 [자산 자동 태깅 구성](../../content-authoring-and-management/tags-and-categories/auto-tagging/configuring-asset-auto-tagging.md) 을 참조하십시오.

### 사회

여기에서 사이트 사용자 간의 사회적 상호 작용을 관리할 수 있습니다.

#### 등급

여기에서 댓글, 지식 기반, 블로그, Wiki, 게시판, 웹 콘텐츠, 문서 및 미디어와 같은 사이트 응용 프로그램에 사용되는 등급 유형을 선택할 수 있습니다. 자세한 내용은 [콘텐츠 등급 유형 구성](./site-content-configurations/configuring-content-rating-type.md) 을 참조하세요.

![사이트 응용 프로그램에 사용되는 등급 유형을 선택할 수 있습니다.](./site-settings-ui-reference/images/11.png)

#### 멘션

사용자가 사이트 응용 프로그램에서 다른 사용자를 언급하도록 허용할지 여부를 결정합니다. 자세한 내용은 [언급 사용자](../../collaboration-and-social/notifications-and-requests/user-guide/configuring-mentions.md) 을 참조하십시오.

### 언어

여기에서 설치의 기본 언어 옵션을 사용할지 또는 사이트에 대해 고유한 언어를 정의할지 여부를 선택할 수 있습니다.

![사이트 설정의 언어 탭을 통해 언어 옵션을 업데이트할 수 있습니다.](./site-settings-ui-reference/images/13.png)

### 고급

여기에서 분석 서비스, 콘텐츠 공유 등을 포함한 추가 설정을 구성할 수 있습니다.

#### 과태 사용자 협회

새 사이트 구성원이 기본적으로 할당되는 역할 및 팀을 선택합니다. 자세한 내용은 [사이트 구성원의 역할 및 팀 기본값 구성](./site-users/configuring-role-and-team-defaults-for-site-members.md) 을 참조하십시오.

![새 사이트 구성원이 기본적으로 할당되는 역할 및 팀을 선택할 수 있습니다.](./site-settings-ui-reference/images/14.png)

#### 해석학

제공된 필드를 사용하여 사이트의 Google Analytics ID를 설정하고 추가 Google Analytics 옵션을 구성합니다. 스크립트 시작 및 종료 태그를 포함하여 전체 스크립트 코드를 입력하여 사이트에 대한 Piwik Analytics 추적 코드를 설정할 수도 있습니다.

다른 분석 서비스가 필요한 경우 추가할 수 있습니다. 다른 분석 서비스에 대한 추가 필드를 추가하는 방법에 대한 자세한 내용은 [새 분석 서비스 추가](./adding-a-new-analytics-service.md) 을 참조하십시오.

![분석 섹션에서 사이트의 분석 서비스를 구성할 수 있습니다.](./site-settings-ui-reference/images/15.png)

#### 지도

사이트에 지역화된 자산을 표시할 때 사용할 지도 API 공급자를 선택합니다. 문서, 웹 콘텐츠 기사, DDL 레코드 등에 대해 지역화된 자산을 표시할 수 있습니다. 자세한 내용은 [사이트 정보 자산](./site-content-configurations/configuring-geolocation-for-assets.md) 을 참조하십시오.

![사이트 지리적 사이트에 사용되는 지도 API 공급자를 선택할 수 있습니다.](./site-settings-ui-reference/images/16.png)

#### 휴지통

사이트에 대해 휴지통을 활성화할지 여부를 결정합니다. 자산이 자동으로 삭제되기 전에 휴지통에 남아 있는 시간(분)을 지정할 수 있습니다. 기본적으로 재활용 품목의 최대 수명은 43200분(예: 30일)입니다. 자세한 내용은 [사이트용 자산 휴지통 구성](./site-content-configurations/configuring-the-asset-recycle-bin-for-sites.md) 을 참조하십시오.

![사이트의 휴지통을 구성할 수 있습니다.](./site-settings-ui-reference/images/17.png)

#### 만족한 조정

하위 사이트가 구조, 템플릿, 범주, 위젯 템플릿 등을 포함하여 이 사이트의 콘텐츠를 표시할 수 있는지 여부를 결정합니다. 이 옵션을 비활성화하면 모든 하위 사이트에서 콘텐츠 공유가 즉시 취소됩니다. 자세한 내용은 [사이트 간 콘텐츠 공유 관리](./site-content-configurations/managing-content-sharing-across-sites.md) 을 참조하십시오.

![하위 사이트가 이 사이트의 콘텐츠를 표시할 수 있는지 여부를 결정할 수 있습니다.](./site-settings-ui-reference/images/18.png)

## 관련 주제

* [페이지 구성 UI 참조](../creating-pages/page-settings/configuring-individual-pages.md)
* [페이지 세트 구성](../creating-pages/page-settings/configuring-page-sets.md)
