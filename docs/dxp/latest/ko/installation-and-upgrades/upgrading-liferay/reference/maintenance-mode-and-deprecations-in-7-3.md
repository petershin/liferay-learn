
# 7.3의 유지 관리 모드 및 사용 중단

각각의 새로운 DXP 릴리스에서는 기능이 지속적인 개선을 보장하지 않거나 더 이상 사용되지 않을 수 있습니다. 기능에 대한 향상을 중지하면 **유지 관리 모드** 로 설정됩니다.

**유지 관리 모드:** 기능이 지원되지만 더 이상 개선되지 않습니다.

더 이상 사용되지 않는 기능은 결국 제거되거나 더 새롭고 더 나은 기능으로 대체됩니다. 더 이상 사용되지 않는 기능에 대한 지원을 중단하기 전에 Liferay는 해당 기능을 **Deprecated** 로 표시합니다.

**Deprecated:** 이 기능은 빠르면 다음 마이너 버전 릴리스부터 지원되지 않습니다. 예를 들어 7.3에서 더 이상 사용되지 않는 기능에 대한 지원은 7.4에서 일찍 중단될 수 있습니다.

```{important}
더 이상 사용되지 않는 기능은 빠르면 다음 마이너 릴리스에서 지원이 중단될 수 있으므로 사용 중지를 계획하십시오.
```

```{important}
자세한 내용은 [유지 관리 모드 및 지원 중단 정책](https://help.liferay.com/hc/ko/articles/360015767952-Maintenance-Mode-and-Deprecation) 을 참조하십시오.
```

## 더 이상 사용되지 않는 기능 가용성

더 이상 사용되지 않는 기능은 다음과 같이 사용 가능 여부가 다릅니다.

**번들:** 이 기능은 Liferay 제품에 포함되어 있습니다.

**Marketplace:** 이 기능은 Marketplace 앱 최종 버전에 포함되어 있습니다.

**최종:** Marketplace 앱의 최종 버전이 이 Liferay 버전용으로 출시되었습니다.

**보관됨:** 기능을 사용할 수 없지만 해당 코드는 <https://repository.liferay.com/nexus/index.html#welcome>에 있는 Liferay 저장소의 소스 아티팩트에서 사용할 수 있습니다.

**제거됨:** 기능 및 해당 코드를 사용할 수 없습니다.

## 7.3에서 더 이상 사용되지 않는 기능

7.3에서 더 이상 사용되지 않는 기능은 다음과 같습니다.

| 기능 | 가용성 | 참고 사항 |
| :------ | :----------- | :---- |
| 중앙 인증 서비스(CAS) | 번들 | 7.2에서 더 이상 사용되지 않습니다. [SAML 기반 인증](../../securing-liferay/configuring-sso/authenticating-with-saml.md)으로 마이그레이션합니다. |
| 동적 데이터 목록 | 번들 | Liferay 7.4에서 Liferay 개체로 대체됩니다. |
| Elasticsearch 6 커넥터 | 삭제됨 | Elasticsearch 7 커넥터로 대체되었습니다. |
| 플래시 위젯 | 삭제됨 | 직접적인 교체가 없습니다. [FlashPlayer 수명 종료](https://www.adobe.com/products/flashplayer/end-of-life.html) 는 2020년 12월 31일입니다. |
| Internet Explorer 11(IE11) 브라우저 지원 | 번들 | IE11 지원이 활성화된 Microsoft Edge로 전환하세요. |
| JAAS 지원 | 번들 | 직접적인 교체가 없습니다. |
| JQuery 기본 글로벌 Liferay 변수 | 번들(비활성화) | jQuery 타사 [시스템 설정](../../../system-administration/configuring-liferay/system-settings에서 `Enable jQuery` 속성을 `true`로 설정하여 이전 동작을 다시 가져올 수 있습니다. .md). |
| 라이프레이 북마크 | 보관됨 | 직접적인 교체가 없습니다. |
| Liferay 모바일 장치 감지 라이트 | 보관됨 | 직접적인 교체가 없습니다. |
| 라이프레이 푸시 | 마켓플레이스 | [Headless Delivery](../../../headless-delivery/using-liferay-as-a-headless-platform.md)로 대체되었습니다. |
| Liferay 동기화 커넥터 및 동기화 클라이언트 | 마켓플레이스 및 [다운로드](https://web.liferay.com/downloads/liferay-sync) | 직접적인 교체가 없습니다. |
| OpenAM / OpenSSO | 번들 | 7.2에서 더 이상 사용되지 않습니다. [SAML 기반 인증](../../securing-liferay/configuring-sso/authenticating-with-saml.md)으로 마이그레이션합니다. |
| 오픈아이디 | 마켓플레이스 | [OpenID Connect](../../securing-liferay/configuring-sso/using-openid-connect.md)로 대체되었습니다. 7.2에서 더 이상 사용되지 않습니다. |
| 여론 조사 | 번들 | Forms 보고서로 대체되었습니다. |
| 프로젝트 템플릿: project-templates-activator | 보관된 [GitHub](https://github.com/liferay/liferay-blade-cli/tree/master/extensions) | 교체 없음. |
| 프로젝트 템플릿: project-templates-freemarker-portlet | 보관된 [GitHub](https://github.com/liferay/liferay-blade-cli/tree/master/extensions) | 교체 없음. |
| 화면 | Github - iOS: [5.2.0](https://github.com/liferay/liferay-screens/releases/tag/5.2.0) , Android: [5.1.0](https://github.com/liferay /liferay-screens/releases/tag/5.1.0-android) | [모바일 SDK](https://help.liferay.com/hc/ko/articles/360020447511-Mobile-SDK) 및 [헤드리스 API](../../../headless-delivery /using-liferay-as-a-headless-platform.md). |
| **도구** 범주의 검색 위젯(클래식) | 번들 | 7.1에서 더 이상 사용되지 않습니다. **검색** 범주의 [검색 위젯](../../../using-search/search-pages-and-widgets/search-results/search-results.md)으로 대체되었습니다. |
| SOAP 웹 서비스 | 번들(비활성화) | Axis Servlet(예: `http://localhost:8080/api/axis/`에 서비스 게시)은 이 포털 속성 설정 `axis.servlet.enabled`로 활성화할 수 있습니다. Liferay `*SOAP` 클래스는 더 이상 사용되지 않습니다. |
| 테마: 협만 | 보관됨 | 직접적인 교체가 없습니다. |
| 테마: Hello World | 번들 | 직접적인 교체가 없습니다. |
| 테마: 폴리곤 | 보관됨 | 직접적인 교체가 없습니다. |
| 테마: 웨스테로스 | 보관됨 | 직접적인 교체가 없습니다. |
| 가상 인스턴스: 가상 인스턴스별 포털 속성 파일 | 보관됨 | 제어판에서 가상 인스턴스 구성으로 대체되었습니다. |
| 수글러 | 삭제됨 | 직접적인 교체가 없습니다. |

이전 버전에서 업그레이드하는 경우 이전 Liferay 버전에서 더 이상 사용되지 않는 기능도 고려해야 할 수 있습니다.

* [7.2 지원 중단 및 유지 관리 모드로 이동된 기능](./maintenance-mode-and-deprecations-in-7-2.md)
* [7.1 지원 중단](https://help.liferay.com/hc/ko/articles/360018403151-Digital-Experience-Platform-7-1-Deprecated-and-Removed-Items)
* [7.0 지원 중단](https://help.liferay.com/hc/ko/articles/360018123832-Digital-Experience-Platform-7-0-Deprecated-and-Removed-Items)


## 7.3에서 유지 관리 모드로 이동한 기능

다음은 7.3에서 유지 관리 모드로 이동한 기능입니다.

* 구명가오리 잠꼬대
* Liferay 모바일 경험: 모바일 SDK
* 라이프레이 보고서
* 사이트 템플렛

```{note}
내보내기/가져오기는 이전에 유지 관리 모드로 나열되었지만 Liferay는 계속해서 내보내기/가져오기 애플리케이션을 개선하고 있습니다.
```

## 추가 정보

* [7.3 주요 변경 사항](../../../liferay-internals/reference/7-3-breaking-changes.md)
* [7.3 기본 설정 변경](./default-setting-changes-in-7-3.md)
