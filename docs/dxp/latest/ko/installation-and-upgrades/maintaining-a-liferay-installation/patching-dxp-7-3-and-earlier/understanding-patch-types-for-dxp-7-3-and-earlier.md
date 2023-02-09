# 패치 유형 이해

> 가입자

Liferay 지원 팀은 DXP에서 발견된 문제에 대한 수정 사항을 만들고 릴리스합니다. 수정 사항은 일반적으로 _patches_ 라고 하는 ZIP 파일에 패키지되어 있습니다. 보안 문제, 고객별 문제 및 Liferay 커뮤니티에서 보고된 문제에 대한 패치가 있습니다. 여기에서는 DXP 가입자에게 제공되는 패치 유형, Liferay Portal 사용자를 위한 [수정 제공](#ce-ga-releases) 및 [각 패치 유형에 대한 테스트 수준](#patch-testing)에 대해 알아봅니다.

다음은 DXP 패치 유형 및 Portal 수정 제공 방법에 대한 요약입니다.

| 패치 유형                         | 목적                                                 |
|:----------------------------- |:-------------------------------------------------- |
| [수정팩](#fix-packs)             | 가장 최근의 문제를 해결합니다.                                  |
| [보안 수정팩](#security-fix-packs) | 최신 보안 문제를 즉시 해결하십시오.                               |
| [핫픽스](#hotfixes)              | 비즈니스 크리티컬 DXP 문제를 빠르게 해결해 달라는 고객의 요청.              |
| [서비스 팩](#service-packs)       | 최신 수정 팩을 통합하고 더 많은 테스트가 필요한 더 큰 수정 사항을 포함할 수 있습니다. |
| [롤링 릴리스](#rolling-releases)   | 최신 DXP 서비스 팩을 기반으로 Portal에 수정 사항을 적용합니다.           |

## 수정팩

> Liferay DXP 7.3 SP3 이전 버전

Fix Pack은 구독자를 위한 최신 수정사항의 번들 콜렉션입니다. DXP와 함께 제공되는 DXP 코어 및 Marketplace 애플리케이션의 문제를 해결합니다. 수정팩은 누적됩니다. 각 수정팩에는 이전 수정팩과 최신 보안 수정팩의 모든 수정사항이 포함되어 있습니다.

수정 팩은 도움말 센터의 [다운로드](https://customer.liferay.com/downloads) 페이지에서 사용할 수 있으며 [패치 도구](./installing-patches-for-dxp-7-3-and-earlier.md)를 사용하여 설치됩니다. 릴리스 정보 및 변경 로그는 각 수정팩과 함께 제공됩니다. 릴리스 정보는 중요한 변경 사항 및 보안 수정 사항과 같은 주요 정보를 강조 표시합니다. 변경 로그는 각 수정 사항에 대한 자세한 정보를 제공합니다.

Patching Tool은 Fix Pack에 수정 사항을 자동으로 적용합니다. Fix Pack의 새(고정) 버전이 릴리스되면 Patching Tool을 사용하여 설치하십시오. Patching Tool은 이전 Fix Pack 위에 새 버전을 설치합니다.

```{important}
DXP 7.2에서 Patching Tool은 이전 수정팩을 제거하고 새 수정팩으로 교체합니다.
```

## 보안 수정팩

> Liferay DXP 7.3 SP3 이전 버전

[DXP 보안 수정 팩](https://help.liferay.com/hc/en-us/articles/360035038331) 은 최신 중요 보안 문제를 해결합니다. 도움말 센터의 [다운로드](https://customer.liferay.com/downloads) 페이지에서 사용할 수 있으며 [패치 도구](./installing-patches-for-dxp-7-3-and-earlier.md)를 사용하여 설치됩니다.

특정 수정팩용 보안 수정팩(기본 수정팩). [다운로드](https://customer.liferay.com/downloads) 페이지의 각 보안 수정 팩은 기본 수정 팩을 지정합니다. 해당 파일 이름도 기본 수정팩을 나타냅니다.

예를 들어 파일 이름 `liferay-security-dxp-1-201902-1-7210.zip` 의 일부는 다음 특성을 나타냅니다.

* `liferay-security`: 보안 수정팩 접두사.
* `dxp-1`: 기본 수정 팩.
*  `2019`: 빌드 연도.
* `02`: Liferay에서 사용하는 ID입니다.
* `1`: Liferay에서 사용하는 카운터.
* `7210`: 빌드 번호. 하나는 DXP 7.2.10을 나타냅니다.

```{note}
보안 수정팩은 DXP 설치의 일반 수정팩 레벨을 변경하지 않습니다.
```

## 핫픽스

핫픽스는 고객이 요청한 수정 사항 또는 수정 사항 모음이며 7.4 업데이트 릴리스 사이 또는 7.3 또는 7.2 수정 팩 릴리스 사이에 제공됩니다. 핫픽스는 DXP에서 확인된 중요한 문제를 해결합니다. [도움말 센터 티켓](https://help.liferay.com/hc)을 통해 Hotfix에서 요청할 수 있습니다. Liferay 지원 팀은 귀하와 협력하여 문제가 제품에 있는지 확인하고 의도하지 않은 제품 동작에 대한 수정 사항을 제공합니다.

DXP 7.3 또는 7.2에서 핫픽스는 특정 수정 팩 수준에 따라 달라질 수 있습니다. 기본 Fix Pack을 먼저 설치하지 않고 설치를 시도하면 Patching Tool이 필요한 Fix Pack 레벨을 보고합니다. [고객 포털](https://customer.liferay.com/downloads) 로 이동하여 기본 수정 팩을 얻으십시오. 필요한 모든 패치가 `패치` 폴더에 다운로드되면 Patching Tool이 해당 패치를 설치합니다.

```{important}
DXP 7.2에서 이미 핫픽스가 설치되어 있고 해당 핫픽스가 포함된 수정 팩이 릴리스된 경우 패치 도구가 이들의 통합을 관리합니다. 수정팩은 항상 핫픽스를 대체합니다. Fix Pack을 설치하면 포함된 모든 Hotfix가 설치 제거되고 Fix Pack 버전이 그 자리에 설치됩니다.
```

## 서비스 팩

> Liferay DXP 7.3 SP3 이전 버전

서비스 팩은 원래 DXP GA 주요 릴리스 위에 구축되며 최신 수정 팩, 패치 도구 및 번들로 제공되는 Marketplace 응용 프로그램을 포함합니다. 구현 및 테스트에 더 많은 시간이 필요한 수정 사항은 서비스 팩용으로 예약할 수 있습니다.

서비스 팩은 도움말 센터의 [다운로드](https://customer.liferay.com/downloads) 페이지에서 사용할 수 있으며 [패치 도구](./installing-patches-for-dxp-7-3-and-earlier.md)를 사용하여 설치됩니다.

모든 것이 포함되어 있으므로 DXP용 최신 서비스 팩에서 새 프로젝트를 시작하는 것이 가장 좋습니다.

기존 DXP 설치를 유지 관리하는 경우 자체 배포 일정에 따라 최신 수정 팩으로 업데이트된 상태를 유지하는 것이 가장 좋습니다. 이렇게 하면 변경 사항을 더 작은 용량으로 통합할 수 있습니다.

## 롤링 릴리스

롤링 릴리스는 DXP 서비스 팩을 기반으로 하며 일반적으로 해당 서비스 팩 이후 몇 주 후에 제공됩니다. 여기에는 EE 전용 기능을 제외한 동일한 수정 사항이 포함됩니다. 자세한 내용은 [Docker를 통한 업그레이드](../../upgrading-liferay/upgrade-basics/upgrading-via-docker.md) 을 참조하십시오.

## 패치 테스트

다음 표는 각 패치 유형에 적용되는 테스트를 설명합니다.

| 패치 유형  | 테스트                                                                 |
|:------ |:------------------------------------------------------------------- |
| 핫픽스    | Fix Pack(아래 참조)과 유사한 자동화된 회귀 테스트 및 보고된 문제를 수정하는 지원 엔지니어가 이를 테스트합니다. |
| 수정팩    | 자동화된 회귀 테스트 및 수동 테스트.                                               |
| 서비스 팩  | Liferay는 패키지 서비스 팩에서 테스트 제품군을 실행합니다.                                |
| 롤링 릴리스 | 해당 DXP 서비스 팩과 동일한 테스트 및 이전 GA의 업그레이드 테스트.                           |

## 패치 유지

[Liferay의 도움말 센터 \(help.liferay.com\)](https://help.liferay.com/hc) 은 패치 정보 등을 위한 목적지입니다.

* 알림 섹션: 수정팩, 보안 경고, 제품 릴리스 및 시스템 업데이트에 대한 최신 뉴스 링크입니다.

* *구독* 버튼: Liferay DXP 릴리스, 패치 및 시스템 개선 이메일에 등록합니다.

* [다운로드 페이지](https://customer.liferay.com/downloads): 에 대한 액세스를 제공합니다.
  
      * 최신 릴리스
    * 수정팩
    * 서비스 팩 아카이브
    * 보안 수정팩
    * 패치 도구
    * 그리고 더
* [보안 페이지](https://help.liferay.com/hc/en-us/categories/360000892792-Security): 보안 관련 개요, 권고, 보안 업데이트(7.3 SP3+) 및 보안 수정 팩(7.3 SP3 이전 버전)에 대한 링크입니다.

도움말 센터는 계정 지원, 지원 FAQ 등을 위한 출발점이기도 합니다. 라이프레이가 도와드리겠습니다!

## 결론

이제 Liferay가 수정 사항을 제공하기 위해 제공하는 패치 유형을 알고 있으므로 관련 패치에 대한 업데이트를 유지하고 [으로 설치](./installing-patches-for-dxp-7-3-and-earlier.md) 할 수 있습니다.

## 추가 정보

* [패치 설치](./installing-patches-for-dxp-7-3-and-earlier.md)
* [패치 도구 설치](../reference/installing-the-patching-tool.md)
* [Docker를 통한 업그레이드](../../upgrading-liferay/upgrade-basics/upgrading-via-docker.md)