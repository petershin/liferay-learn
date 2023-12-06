# 7.2의 유지 관리 모드 및 지원 중단

각각의 새로운 DXP 릴리스에서는 기능이 지속적인 개선을 보장하지 않거나 더 이상 사용되지 않을 수 있습니다. 기능 개선을 중지하면 해당 기능이 **유지관리 모드** 로 전환됩니다.

**유지 관리 모드:** 이 기능은 지원되지만 더 이상 향상되지 않습니다.

더 이상 사용되지 않는 기능은 결국 제거되거나 더 새롭고 더 나은 기능으로 대체됩니다. 더 이상 사용되지 않는 기능에 대한 지원을 중단하기 전에 Liferay는 해당 기능을 **더 이상 사용되지 않음** 으로 표시합니다.

**더 이상 사용되지 않음:** 이 기능은 이르면 다음 마이너 버전 릴리스부터 지원되지 않습니다.

```{important}
다음 마이너 릴리스부터 지원이 중단될 수 있으므로 더 이상 사용되지 않는 기능 사용을 중단할 계획을 세우세요.
```

```{important}
자세한 내용은 [유지 관리 모드 및 지원 중단 정책](https://help.liferay.com/hc/ko/articles/360015767952-Maintenance-Mode-and-Deprecation) 을 참조하세요.
```

## 더 이상 사용되지 않는 기능 가용성

더 이상 사용되지 않는 기능은 가용성이 다릅니다.

**번들:** 이 기능은 Liferay 제품에 포함되어 있습니다.

**Marketplace:** 이 기능은 Marketplace 앱 최종 버전에 포함되어 있습니다.

**최종:** Marketplace 앱의 최종 버전이 이 Liferay 버전용으로 출시되었습니다.

**보관됨:** 이 기능은 사용할 수 없지만 해당 코드는 Liferay 저장소 https://repository.liferay.com/nexus/index.html#welcome의 소스 아티팩트에서 사용할 수 있습니다.

**제거됨:** 해당 기능과 해당 코드를 사용할 수 없습니다.

Liferay 7.0 이하에서 업그레이드하는 경우 해당 릴리스에서 발생한 지원 중단을 검토하세요.

* [7.1](https://help.liferay.com/hc/ko/articles/360018403151-Digital-Experience-Platform-7-1-Deprecated-and-Removed-Items)
* [7.0](https://help.liferay.com/hc/ko/articles/360018123832-Digital-Experience-Platform-7-0-Deprecated-and-Removed-Items)

## 7.2에서 더 이상 사용되지 않는 기능

7.2에서 더 이상 사용되지 않는 기능은 다음과 같습니다.

| 특징                       | 가용도    | 주                                                                                                                                                                                                                                                          |
| :----------------------- | :----- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 합금UI                     | 번들로 제공 | [ClayUI 태그](https://clayui.com/) 와 동일하게 노출되는 [MetalJS](http://metaljs.com/) (임시)으로 대체되었습니다.                                                                                                                                                                  |
| 잠재고객 타겟팅                 | 삭제됨    | [Personalization](../../../site-building/personalizing-site-experience.md)으로 대체됨( [잠재고객 타겟팅에서 마이그레이션](https://help.liferay.com/hc/ko/ 참조) 기사/360028711992-잠재고객 타겟팅에서 수동으로 마이그레이션)).                                                                   |
| CAS(중앙 인증 서비스)           | 번들로 제공 | [SAML 기반 인증](../../securing-liferay/configuring-sso/authenticating-with-saml.md)으로 마이그레이션합니다.                                                                                                                                                              |
| 씨미스 스토어                  | 삭제됨    | 다른 [파일 저장소 옵션](../../../system-administration/file-storage.md)으로 마이그레이션합니다. [Liferay 7.2로 업그레이드](../upgrade-basics.md)하기 전에 [파일 저장소 데이터 마이그레이션](../../../system-administration/file-storage/file-store-migration.md).                                      |
| 구글 로그인/SSO               | 마켓플레이스 | [OpenID Connect](../../securing-liferay/configuring-sso/using-openid-connect.md)로 대체되었습니다.                                                                                                                                                                 |
| JCR스토어                   | 삭제됨    | 다른 [파일 저장소 옵션](../../../system-administration/file-storage.md)으로 마이그레이션합니다. [Liferay 7.2로 업그레이드](../upgrade-basics.md)하기 전에 [파일 저장소 데이터 마이그레이션](../../../system-administration/file-storage/file-store-migration.md).                                      |
| Liferay 모바일 장치 감지 라이트    | 결정적인   | 직접적인 교체는 없습니다.                                                                                                                                                                                                                                             |
| Liferay 모바일 장치 감지 엔터프라이즈 | 삭제됨    | 최신 정의는 51Degrees에 문의하세요.                                                                                                                                                                                                                                   |
| 라이브 사용자                  | 번들로 제공 | `live.users.enabled` [포털 속성](../../reference/portal-properties.md)을 통해 활성화됩니다.                                                                                                                                                                             |
| NTLM                     | 삭제됨    | NTLM에는 보안 취약성이 지속됩니다. [Kerberos](../../securing-liferay/configuring-sso/authenticating-with-kerberos.md)으로 대체됩니다. NTLM을 사용하여 Microsoft Windows™ 계정을 인증하는 경우 [Kerberos](../../securing-liferay/configuring-sso/authenticating-with-kerberos.md) 사용으로 전환하세요. |
| OAuth 1.0a               | 마켓플레이스 | 번들에 포함된 OAuth 2.0으로 대체되었습니다.                                                                                                                                                                                                                               |
| OpenAM / OpenSSO         | 번들로 제공 | [SAML 기반 인증](../../securing-liferay/configuring-sso/authenticating-with-saml.md)으로 마이그레이션합니다.                                                                                                                                                              |
| OpenID                   | 마켓플레이스 | [OpenID Connect](../../securing-liferay/configuring-sso/using-openid-connect.md)로 대체되었습니다.                                                                                                                                                                 |
| 자원 수입업자                  | 번들로 제공 | 직접 교체 없이 7.1부터 더 이상 사용되지 않음                                                                                                                                                                                                                                |
| **도구** 카테고리의 검색 위젯(클래식)    | 번들로 제공 | 7.1에서는 더 이상 사용되지 않습니다. **검색** 카테고리의 [검색 위젯](../../../using-search/search-pages-and-widgets/search-results/search-results.md)으로 대체되었습니다.                                                                                                                      |
| 스프라이트 프레임워크              | 번들로 제공 | Liferay의 이미지 스프라이트 프레임워크는 더 이상 사용되지 않으며 `sprite.enabled` [문맥 재산](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/reference/portal-properties.html) 을 통해 기본적으로 비활성화됩니다. 원하는 프레임워크를 사용하여 이미지 스프라이트를 계속 빌드하고 이를 플러그인에 배포할 수 있습니다.         |
| 테마: 피요르드                 | 결정적인   | 직접적인 교체는 없습니다.                                                                                                                                                                                                                                             |
| 테마: 폴리곤                  | 결정적인   | 직접적인 교체는 없습니다.                                                                                                                                                                                                                                             |
| 테마: 웨스테로스                | 결정적인   | 직접적인 교체는 없습니다.                                                                                                                                                                                                                                             |
| 사용자 그룹 페이지(복사 모드)        | 번들로 제공 | 활성화 방법은 [기존 사용자 그룹 사이트 동작](../../../users-and-permissions/user-groups/user-group-sites.md) 지침을 참조하세요.                                                                                                                                                      |
| 웹 양식                     | 삭제됨    | 7.0용 최종 버전이 출시되었습니다.                                                                                                                                                                                                                                       |

## 7.2에서 유지 관리 모드로 이동된 기능

7.2에서 유지 관리 모드로 이동된 기능은 다음과 같습니다.

- Liferay 연결 서비스(LCS)
- Liferay 모바일 경험(Liferay 스크린, Liferay 모바일 SDK, Liferay 푸시)
- Liferay Sync

```{note}
Liferay는 특히 콘텐츠를 한 환경에서 생성하고 다른 환경에서 소비해야 하는 시나리오의 원격 라이브 스테이징을 위해 스테이징 애플리케이션을 지속적으로 개선합니다. 자세한 내용은 [게시 도구](../../../site-building/publishing-tools.md)를 참조하세요.
```

## 관련 주제

[7.2 주요 변경 사항](../../../liferay-internals/reference/7-2-breaking-changes.md)

[7.2 기본 설정 변경](./default-setting-changes-in-7-2.md)
