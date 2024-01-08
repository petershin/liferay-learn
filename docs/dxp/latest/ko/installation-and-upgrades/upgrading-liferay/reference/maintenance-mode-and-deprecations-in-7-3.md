# 7.3의 유지 관리 모드 및 지원 중단

각각의 새로운 DXP 릴리스에서는 기능이 지속적인 개선을 보장하지 않거나 더 이상 사용되지 않을 수 있습니다. 기능 개선을 중지하면 해당 기능이 **유지관리 모드** 로 전환됩니다.

**유지 관리 모드:** 이 기능은 지원되지만 더 이상 향상되지 않습니다.

더 이상 사용되지 않는 기능은 결국 제거되거나 더 새롭고 더 나은 기능으로 대체됩니다. 더 이상 사용되지 않는 기능에 대한 지원을 중단하기 전에 Liferay는 해당 기능을 **더 이상 사용되지 않음** 으로 표시합니다.

**더 이상 사용되지 않음:** 이 기능은 이르면 다음 마이너 버전 릴리스부터 지원되지 않습니다.

```{important}
다음 마이너 릴리스부터 지원이 중단될 수 있으므로 더 이상 사용되지 않는 기능 사용을 중단할 계획입니다.
```

```{important}
자세한 내용은 [유지 관리 모드 및 사용 중단 정책](https://help.liferay.com/hc/ko/articles/360015767952-Maintenance-Mode-and-Deprecation) 참조하세요.
```

## 더 이상 사용되지 않는 기능 가용성

더 이상 사용되지 않는 기능은 가용성이 다릅니다.

**번들:** 이 기능은 Liferay 제품에 포함되어 있습니다.

**Marketplace:** 이 기능은 Marketplace 앱 최종 버전에 포함되어 있습니다.

**최종:** Marketplace 앱의 최종 버전이 이 Liferay 버전용으로 출시되었습니다.

**보관됨:** 이 기능은 사용할 수 없지만 해당 코드는 Liferay 저장소 <https://repository.liferay.com/nexus/index.html#welcome>의 소스 아티팩트에서 사용할 수 있습니다.

**제거됨:** 해당 기능과 해당 코드를 사용할 수 없습니다.

## 7.3에서 더 이상 사용되지 않는 기능

7.3에서 더 이상 사용되지 않는 기능은 다음과 같습니다.

| 특징                                                    | 가용도                                                                                                                                                                                               | 주                                                                                                                                                                                                    |
| :-----------------------------------------------------| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| CAS(중앙 인증 서비스)                     | 번들로 제공                                                                                                                                                                                            | 7.2에서는 더 이상 사용되지 않습니다. [SAML 기반 인증](../../securing-liferay/configuring-sso/authenticating-with-saml.md) 로 마이그레이션합니다.                                                                       |
| 동적 데이터 목록                                             | 번들로 제공                                                                                                                                                                                            | Liferay 7.4에서 Liferay 개체로 대체됩니다.                                                                                                                                                                     |
| Elasticsearch 6 커넥터                                   | 삭제됨                                                                                                                                                                                               | Elasticsearch 7 커넥터로 대체되었습니다.                                                                                                                                                                        |
| 플래시 위젯                                                | 삭제됨                                                                                                                                                                                               | 직접적인 교체는 없습니다. [FlashPlayer 수명 종료](https://www.adobe.com/products/flashplayer/end-of-life.html) 2020년 12월 31일입니다.                                                                         |
| IE11(Internet Explorer 11) 브라우저 지원 | 번들로 제공                                                                                                                                                                                            | IE11 지원이 활성화된 Microsoft Edge로 전환하세요.                                                                                                                                                                 |
| JAAS 지원                                               | 번들로 제공                                                                                                                                                                                            | 직접적인 교체는 없습니다.                                                                                                                                                                                       |
| JQuery 기본 전역 Liferay 변수                               | 번들(비활성화)                                                                                                                                                                       | jQuery 타사 [시스템 설정](../../../system-administration/configuring-liferay/system-settings.md) 에서 `Enable jQuery` 속성을 `true`로 설정하여 이전 동작을 되돌릴 수 있습니다.                                           |
| liferay 북마크                                             | 보관하는                                                                                                                                                                                              | 직접적인 교체는 없습니다.                                                                                                                                                                                       |
| Liferay 모바일 장치 감지 라이트                                 | 보관하는                                                                                                                                                                                              | 직접적인 교체는 없습니다.                                                                                                                                                                                       |
| liferay 푸시                                              | 마켓플레이스                                                                                                                                                                                            | [Headless Delivery](../../../headless-delivery/using-liferay-as-a-headless-platform.md) 로 대체되었습니다.                                                                                         |
| Liferay 동기화 커넥터 및 동기화 클라이언트                           | 마켓플레이스 및 [다운로드](https://web.liferay.com/downloads/liferay-sync)                                                                                                                        | 직접적인 교체는 없습니다.                                                                                                                                                                                       |
| OpenAM / OpenSSO                                      | 번들로 제공                                                                                                                                                                                            | 7.2에서는 더 이상 사용되지 않습니다. [SAML 기반 인증](../../securing-liferay/configuring-sso/authenticating-with-saml.md) 로 마이그레이션합니다.                                                                       |
| OpenID                                                | 마켓플레이스                                                                                                                                                                                            | [OpenID Connect](../../securing-liferay/configuring-sso/using-openid-connect.md) 로 대체되었습니다. 7.2에서는 더 이상 사용되지 않습니다.                                                                         |
| 투표                                                    | 번들로 제공                                                                                                                                                                                            | 양식 보고서로 대체되었습니다.                                                                                                                                                                                     |
| 프로젝트 템플릿: 프로젝트-템플릿-활성화자                               | GitHub [에](https://github.com/liferay/liferay-blade-cli/tree/master/extensions) 개 보관됨                                                                                                   | 교체가 없습니다.                                                                                                                                                                                            |
| 프로젝트 템플릿: project-templates-freemarker-portlet        | GitHub [에](https://github.com/liferay/liferay-blade-cli/tree/master/extensions) 개 보관됨                                                                                                   | 교체가 없습니다.                                                                                                                                                                                            |
| 스크린                                                   | Github * iOS: [5.2.0](https://github.com/liferay/liferay-screens/releases/tag/5.2.0) , 안드로이드: [5.1.0](https://github.com/liferay/liferay-screens/releases/tag/5.1.0-android) | [Mobile SDK](https://help.liferay.com/hc/ko/articles/360020447511-Mobile-SDK) 및 [Headless API](../../../headless-delivery/using-liferay-as-a-headless-platform.md) 을 사용하십시오. |
| **도구** 카테고리의 검색 위젯(클래식)              | 번들로 제공                                                                                                                                                                                            | 7.1에서는 더 이상 사용되지 않습니다. **검색** 카테고리의 [검색 위젯](../../../using-search/search-pages-and-widgets/search-results/search-results.md) 로 대체되었습니다.                                                     |
| SOAP 웹 서비스                                            | 번들(비활성화)                                                                                                                                                                       | Axis 서블릿(예: `http://localhost:8080/api/axis/`에 서비스 게시)은 이 포털 속성 설정 `axis.servlet.enabled`를 사용하여 활성화할 수 있습니다. Liferay `*SOAP` 클래스는 더 이상 사용되지 않습니다.                                 |
| 테마: 피요르드                                              | 보관하는                                                                                                                                                                                              | 직접적인 교체는 없습니다.                                                                                                                                                                                       |
| 테마: 안녕하세요 세계                                          | 번들로 제공                                                                                                                                                                                            | 직접적인 교체는 없습니다.                                                                                                                                                                                       |
| 테마: 폴리곤                                               | 보관하는                                                                                                                                                                                              | 직접적인 교체는 없습니다.                                                                                                                                                                                       |
| 테마: 웨스테로스                                             | 보관하는                                                                                                                                                                                              | 직접적인 교체는 없습니다.                                                                                                                                                                                       |
| 가상 인스턴스: 가상 인스턴스별 포털 속성 파일                            | 보관하는                                                                                                                                                                                              | 제어판의 가상 인스턴스 구성으로 대체되었습니다.                                                                                                                                                                           |
| Xuggler                                               | 삭제됨                                                                                                                                                                                               | 직접적인 교체는 없습니다.                                                                                                                                                                                       |

이전 버전에서 업그레이드하는 경우 이전 Liferay 버전에서 더 이상 사용되지 않는 기능도 고려해야 할 수 있습니다.

* [7.2 유지 관리 모드로 이동된 기능 및 지원 중단](./maintenance-mode-and-deprecations-in-7-2.md)
* [7.1 지원 중단](https://help.liferay.com/hc/ko/articles/360018403151-Digital-Experience-Platform-7-1-Deprecated-and-Removed-Items)
* [7.0 지원 중단](https://help.liferay.com/hc/ko/articles/360018123832-Digital-Experience-Platform-7-0-Deprecated-and-Removed-Items)

## 7.3에서 유지 관리 모드로 이동된 기능

7.3에서 유지 관리 모드로 이동된 기능은 다음과 같습니다.

* 생명가오리 침흘림
* Liferay 모바일 경험: 모바일 SDK
* liferay 보고서
* 사이트
 템플렛

```{note}
내보내기/가져오기는 이전에 유지 관리 모드에 나열되었지만 Liferay는 계속해서 내보내기/가져오기 애플리케이션을 개선합니다.
```

## 관련 주제

* [7.3 주요 변경 사항](../../../liferay-internals/reference/7-3-breaking-changes.md)
* [7.3 기본 설정 변경](./default-setting-changes-in-7-3.md)
