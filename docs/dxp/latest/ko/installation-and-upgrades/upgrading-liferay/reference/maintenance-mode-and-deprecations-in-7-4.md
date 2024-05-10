# 7.4의 유지 관리 모드 및 지원 중단

각각의 새로운 Liferay DXP 및 Liferay Portal 릴리스에서는 기능이 지속적인 개선을 보장하지 않거나 더 이상 사용되지 않을 수 있습니다. 기능 개선을 중지하면 해당 기능이 **유지관리 모드** 로 전환됩니다.

**유지 관리 모드:** 추가 개선 계획이 없는 지원 기능

사용되지 않는 기능은 결국 제거되거나 더 새롭고 향상된 기능으로 대체됩니다. 더 이상 사용되지 않는 기능에 대한 지원을 중단하기 전에 Liferay는 해당 기능을 **Deprecated** 로 표시합니다.

**더 이상 사용되지 않음:** 다음 마이너 버전 릴리스에서는 지원되지 않습니다.

```{important}
다음 마이너 릴리스부터 지원이 중단될 수 있으므로 더 이상 사용되지 않는 기능 사용을 중단할 계획을 세우세요.
```

```{important}
자세한 내용은 [유지 관리 모드 및 지원 중단 정책](https://help.liferay.com/hc/ko/articles/360015767952-Maintenance-Mode-and-Deprecation) 을 참조하세요.
```

## 더 이상 사용되지 않는 기능 가용성

더 이상 사용되지 않는 기능은 가용성이 다릅니다.

**번들:** Liferay에는 기능이 포함되어 있습니다.

**마켓플레이스:** 이 기능은 마켓플레이스 앱 최종 버전에 포함되어 있습니다.

**최종:** Liferay 버전에 대해 Marketplace 앱의 최종 버전이 출시되었습니다.

**최종:** Marketplace 앱의 최종 버전이 이 Liferay 버전용으로 출시되었습니다.

**제거됨:** 해당 기능과 해당 코드를 사용할 수 없습니다.

## 7.4에서 더 이상 사용되지 않는 기능

7.4에서 더 이상 사용되지 않는 기능은 다음과 같습니다.

| 특징                                | 가용도                       | 주                                                                                                                                                                                                                                                         |
|:--------------------------------- |:------------------------- |:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 앱 빌더, 앱 빌더 워크플로                   | 삭제됨                       | [Liferay 객체로 대체됨](../../../building-applications/objects.md).                                                                                                                                                                                             |
| Bootstrap 3 & Bootstrap 4 호환성 레이어 | 삭제됨                       | [테마 업그레이드](../../../site-building/site-appearance/themes/upgrading-a-theme.md) 중에 호환성 레이어를 추가하도록 선택하거나 수동으로 레이어를 추가하세요.                                                                                                                                   |
| 상거래 계정 위젯                         | 삭제됨                       | DXP/포털 계정 위젯으로 대체됨                                                                                                                                                                                                                                        |
| CAS(중앙 인증 서비스)                    | 보관하는                      | 7.2에서는 더 이상 사용되지 않습니다. 이는 SAML, OpenID Connect 및 토큰 기반 SSO를 포함한 다른 솔루션으로 대체됩니다.                                                                                                                                                                           |
| 상거래 카테고리 탐색 위젯                    | 번들로 제공                    | [디스플레이 페이지 템플릿](../../../site-building/displaying-content/using-display-page-templates.md) [메뉴 디스플레이](../../../site-building/site-navigation/configuring-menu-displays.md) 지원으로 대체되었습니다.                                                                  |
| 상업 BOM(Bill of Materials)         | 삭제됨                       | [다이어그램으로 쇼핑하기](https://learn.liferay.com/w/commerce/product-management/creating-and-managing-products/product-types/shop-by-diagram) 로 대체되었습니다.                                                                                                         |
| 커머스 카테고리 콘텐츠 위젯                   | 번들로 제공                    | [표시 페이지 템플릿으로 대체됨](../../../site-building/displaying-content/using-display-page-templates.md).                                                                                                                                                            |
| 다이제스트 인증                          | 번들로 제공                    | 다이제스트 인증에는 취약점인 취약한 비밀번호 해시 저장이 필요합니다.                                                                                                                                                                                                                    |
| 동적 데이터 목록                         | 번들로 제공                    | 7.3에서는 더 이상 사용되지 않습니다. [Liferay Objects](../../../building-applications/objects.md)로 대체됩니다.                                                                                                                                                               |
| 리소스 가져오기 내보내기/가져오기                | 삭제됨                       | 이 가져오기 도구는 원래 테마가 배포 중에 추가 Liferay 자산을 제공할 수 있도록 만들어졌습니다. 7.4의 이전 버전에서는 더 이상 사용되지 않으며 7.4 U74/7.4 GA74에서는 제거되었습니다. 사이트 초기화나 클라이언트 확장 [클라이언트 확장](../../../building-applications/client-extensions.md)같은 새로운 접근 방식을 활용하는 것이 좋습니다.                                   |
| EXT 플러그인 지원                       | 삭제됨                       | 구성 설정 및 표준 확장 지점으로 대체되었습니다.                                                                                                                                                                                                                               |
| 구글 로그인/SSO                        | 보관하는                      | 7.2에서는 더 이상 사용되지 않습니다. 이는 SAML, OpenID Connect 및 토큰 기반 SSO를 포함한 다른 솔루션으로 대체됩니다.                                                                                                                                                                           |
| 이미지 편집기(Soy 기반)                   | 삭제됨                       | React 기반 이미지 편집기로 대체되었습니다.                                                                                                                                                                                                                                |
| JAAS 지원 코드                        | 번들로 제공                    | 교체가 없습니다.                                                                                                                                                                                                                                                 |
| Liferay 모바일 장치 감지 엔터프라이즈          | 보관하는                      | 7.2에서는 더 이상 사용되지 않습니다. 최신 정의는 51Degrees에 문의하세요.                                                                                                                                                                                                           |
| Liferay Screens                   | 삭제됨. 7.3에 최종 버전이 출시되었습니다. | 직접 교체 없음; 그러나 모바일 SDK 및 헤드리스 API는 모바일 애플리케이션 개발을 지원합니다.                                                                                                                                                                                                   |
| Liferay 동기화 커넥터 및 동기화 클라이언트       | 보관하는                      | 7.3에서는 더 이상 사용되지 않습니다. 직접적인 대체품은 없습니다.                                                                                                                                                                                                                    |
| 라이브 사용자                           | 번들로 제공                    | 7.2에서는 더 이상 사용되지 않습니다. [애널리틱 클라우드](https://learn.liferay.com/w/analytics-cloud/index) 로 대체됩니다.                                                                                                                                          |
| 모바일 SDK                           | 삭제됨                       | [Headless Delivery](../../../headless-delivery/using-liferay-as-a-headless-platform.md)로 대체되었습니다.                                                                                                                                                         |
| NTLM                              | 보관하는                      | 7.2에서는 더 이상 사용되지 않습니다. [Kerberos](../../securing-liferay/configuring-sso/authenticating-with-kerberos.md)로 대체됩니다. NTLM을 사용하여 Microsoft Windows™ 계정을 인증하는 경우 [Kerberos](../../securing-liferay/configuring-sso/authenticating-with-kerberos.md)사용으로 전환하세요. |
| OAuth 1.0a                        | 보관하는                      | 7.2에서는 더 이상 사용되지 않습니다. Liferay Connector to OAuth 2.0으로 대체되었습니다.                                                                                                                                                                                          |
| 투표                                | 삭제됨                       | [개의 양식/양식 보고서](../../../process-automation/forms/sharing-forms-and-managing-submissions/form-reports.md)로 대체되었습니다.                                                                                                                                        |
| 검색 위젯(클래식)                        | 번들로 제공                    | 7.1에서는 더 이상 사용되지 않습니다. 이는 [검색 위젯](../../../using-search/search-pages-and-widgets/search-results/search-results.md)로 대체됩니다.                                                                                                                                |
| SOAP 웹 서비스                        | 번들(기본적으로 비활성화됨)           | JSON 웹 서비스, REST 서비스 및 GraphQL 서비스로 대체되었습니다.                                                                                                                                                                                                              |
| 테마: 안녕하세요 세계                      | 보관하는                      | 7.3에서는 더 이상 사용되지 않습니다. 직접적인 교체는 없습니다.                                                                                                                                                                                                                     |
| 웹 콘텐츠 검색 위젯                       | 보관하는                      |                                                                                                                                                                                                                                                           |


이전 버전에서 업그레이드하는 경우 이전 Liferay 버전에서 더 이상 사용되지 않는 기능도 고려해야 할 수 있습니다.

* [7.3 유지 관리 모드로 전환된 지원 중단 및 기능](./maintenance-mode-and-deprecations-in-7-3.md)
* [7.2 유지 관리 모드로 전환된 기능 및 지원 중단](./maintenance-mode-and-deprecations-in-7-2.md)
* [7.1 지원 중단](https://help.liferay.com/hc/ko/articles/360018403151-Digital-Experience-Platform-7-1-Deprecated-and-Removed-Items)
* [7.0 지원 중단](https://help.liferay.com/hc/ko/articles/360018123832-Digital-Experience-Platform-7-0-Deprecated-and-Removed-Items)

## 7.4에서 유지 관리 모드로 이동된 기능

7.4에서 유지 관리 모드로 이동된 기능은 다음과 같습니다.

| 특징       | 주                                                                                                                                      |
|:-------- |:-------------------------------------------------------------------------------------------------------------------------------------- |
| Kaleo 양식 | [Liferay Objects](../../../building-applications/objects.md)에 대한 비즈니스 프로세스로 대체됩니다.                                                     |
| 솔러 커넥터   | [가능하다면 Elasticsearch](../../../using-search/installing-and-upgrading-a-search-engine/elasticsearch/installing-elasticsearch.md) 사용하세요. |
| 연락처 모듈   | 연락처 모듈의 포틀릿 4개(연락처 센터, 회원, 내 연락처, 프로필)를 유지 관리 모드로 이동했습니다. 현재 교체가 없습니다.                                                                 |

```{note}
Liferay는 특히 한 환경에서 콘텐츠를 생성하고 다른 환경에서 소비해야 하는 시나리오의 원격 라이브 스테이징을 위해 가져오기/내보내기 및 스테이징을 지속적으로 개선합니다. 자세한 내용은 [게시 도구](../../../site-building/publishing-tools.md)를 참조하세요.
```

## 관련 주제

* [7.4 주요 변경 사항](../../../liferay-internals/reference/7-4-breaking-changes.md)
* [7.4 기본 설정 변경](./default-setting-changes-in-7-4.md)