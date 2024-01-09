---
toc:
  - ./deployment-strategies/deployment-strategies-explained.md
  - ./deployment-strategies/choosing-the-right-deployment-strategy.md
visibility:
  - Employee
  - Partner
---
# 배포 전략

**한눈에 보기**

* 비즈니스 문제를 해결하기 위해 Liferay DXP를 선택한 후 고객은 Liferay 애플리케이션을 호스팅할 사이트를 선택해야 합니다.
* 각 프로젝트의 세부 사항에 따라 하나의 접근 방식 또는 다른 접근 방식을 결정하는 데 고려 사항이 있습니다.
* Liferay는 세 가지 제품 배포 서비스를 제공합니다.
  * Liferay 소프트웨어 - 자체 호스팅
  * Liferay Experience Cloud 자체 관리형 - PaaS
  * Liferay Experience Cloud - SaaS
* Liferay가 선호하는 접근 방식은 SaaS 우선입니다.

## 배경

이 모듈에서는 모든 배포 전략은 물론 그 특성, 비즈니스 가치, 그리고 각 잠재 고객에게 가장 적합한 접근 방식을 결정하는 방법을 다룹니다.

배포 전략이 Liferay 시연과 관련이 없어 보일 수도 있지만 이 주제는 잠재 고객과 그들의 요구 사항에 대해 자세히 알아볼 때 자주 발생합니다.

```{note}
* 이 모듈의 라이브 워크숍에서 [녹화](https://learn.liferay.com/c/portal/login?p_l_id=3026&redirect=%2Fweb%2Fguest%2Fd%2Fse1-8-deployment-strategies) 를 확인하세요.
* 라이브 워크숍에 사용된 프레젠테이션의 [PDF](https://learn.liferay.com/c/portal/login?redirect=%2Fdocuments%2Fd%2Fguest%2Fse1-8-deployment-strategies-pdf) 를 다운로드하세요.
```

## 라이프레이의 제품

배포 전략을 진행하기 전에 애플리케이션이 어디에 사이트하더라도 배포되는 제품은 항상 Liferay DXP라는 점을 강조하는 것이 중요합니다.

Liferay의 최신 버전에는 Digital Experience Platform 코어, 상거래 및 분석이라는 세 가지 주요 기능 세트가 포함되어 있습니다. 이 제품에는 고객이 솔루션을 개발하고 비즈니스 성과를 달성할 수 있도록 하는 모든 도구와 기능이 통합되어 있으며 모든 고객이 모든 기능에 액세스할 수 있습니다.

![Liferay DXP contains core Digital Experience Platform capabilities along with Commerce and Analytics.](./deployment-strategies/images/01.png)

## 모든 배포 접근 방식 지원

Liferay는 항상 선택한 소프트웨어 스택 및 인프라에 대한 고객 투자를 보호해 왔습니다. 결과적으로 Liferay는 고객이 자신의 요구 사항에 맞는 접근 방식을 선택할 수 있도록 세 가지 제품 배포 서비스를 제공합니다.

* **Liferay Experience Cloud SaaS** 는 인프라 및 업그레이드 관련 문제에 대해 걱정할 필요 없이 Liferay DXP의 모든 이점을 제공합니다. 고객은 비즈니스 문제를 해결하기 위한 솔루션 구축에 집중할 수 있습니다.
* **Liferay Experience Cloud 자체 관리형** 은 Liferay 플랫폼에 맞춰진 서비스형 플랫폼을 제공합니다.
* **Liferay DXP 셀프 호스팅** 을 통해 고객은 Liferay DXP 구현을 호스팅하는 방법과 사이트를 정확하게 선택할 수 있으므로 유연성을 극대화하는 동시에 더 많은 책임을 맡을 수 있습니다.

![Liferay offers deployment strategies for SaaS, PaaS, and on-premise deployments of Liferay DXP.](./deployment-strategies/images/02.png)

## SaaS 첫 번째 접근 방식

고객에게 세 가지 배포 전략의 유연성을 제공하면서도 Liferay의 접근 방식은 엔지니어링 및 영업 관점 모두에서 SaaS 우선입니다.

이는 제품 이니셔티브가 SaaS 옵션에 대한 경험과 사용 가능한 도구 및 기능을 개선하고 확장하는 데 중점을 두고 있음을 의미합니다.

Liferay 직원이든 파트너이든 모든 영업 담당자의 역할은 잠재 고객이 Liferay DXP를 통해 비즈니스 문제를 해결하는 데 집중하도록 유도하고 배포 접근 방식이 SaaS라는 가정에서 시작하는 것입니다.

이 모듈에서는 영업 담당자가 잠재 고객이 SaaS인지 여부를 판단하는 데 도움을 줄 수 있는 방법을 다룹니다.

## Liferay 애플리케이션 배포 요구 사항

Liferay 애플리케이션이 최종적으로 배포되는 방식에 관계없이 해당 배포를 지원하기 위한 기본 요구 사항은 동일합니다. 이 모듈에서 일부 맥락을 제공하기 위해 LifeBank라는 전망 예시가 사용되었습니다.

- LifeBank는 디지털 혁신 프로젝트를 진행하는 회사로, 상거래 및 분석과 함께 로우 코드/노 코드 기능을 갖춘 디지털 경험 플랫폼이 고객에게 도움이 될 것이라고 결정했습니다.
- LifeBank는 공개 웹사이트를 가질 계획이지만 고객이 로그인하여 특정 기능에 액세스하고 개인 정보를 저장할 수 있는 기능도 제공할 것입니다.
- LifeBank는 고객을 위한 맞춤형 경험을 창출하기 위해 디지털 경험 플랫폼의 비즈니스 가치에 집중해야 하며 이를 원합니다.

이 정보를 바탕으로 Liferay는 LifeBank에 적합합니다.

![LifeBank is a fictional company with requirements that are well met with Liferay DXP.](./deployment-strategies/images/03.png)

## Liferay 애플리케이션 호스팅

LifeBank는 Liferay DXP를 통해 비즈니스 요구 사항을 충족할 수 있다고 확신하고 있으며, 다음 단계는 최상의 배포 접근 방식을 결정하도록 돕는 것입니다.

모든 소프트웨어 애플리케이션에는 일반적으로 다양한 인프라 및 소프트웨어 관련 자산이 적절하게 배치되고 구성되어야 하며 Liferay도 다르지 않습니다. 특히 Liferay의 경우 6가지 주요 고려 사항이 있습니다.

![Hosting Liferay Applications requires Infrastructure, Platform Software, Architecture, Monitoring, Security, and Upgrades and Updates.](./deployment-strategies/images/04.png)

* **인프라** - 클라우드에 있든 회사의 물리적 시설에 있든 상관없이 컴퓨터 서버와 네트워크 인프라가 제공되어야 합니다.
* **플랫폼 소프트웨어** - 데이터베이스, 검색 엔진, 웹 서버 등과 같이 애플리케이션을 올바르게 설치하는 데 필요한 모든 관련 소프트웨어가 포함됩니다.
- **아키텍처** - 모든 비즈니스 애플리케이션은 확장이 가능해야 합니다. 아마도 새로운 마케팅 캠페인 때문일 수도 있습니다. 비즈니스 연속성을 보장하려면 장애 감지 또는 고가용성 조치가 필요합니다. 프로덕션과 함께 개발 및 테스트를 위한 다양한 환경이 필요합니다.
* **모니터링** - 상황이 바뀔 수 있으므로 애플리케이션을 지속적으로 모니터링하고 분석해야 합니다.
* **보안** - 사이버 위협이 점점 더 일반화됨에 따라 사용자는 안전하게 연결되어야 하고 데이터도 보호되어야 합니다. 또한 백업 루틴과 재해 복구 계획을 마련해야 합니다.
* **업그레이드 및 업데이트** - 새로운 기능을 계속 제공하거나 버그 수정 또는 보안 수정으로 패치를 적용하려면 애플리케이션을 업데이트하고 업그레이드해야 합니다.

## 소프트웨어 개발 수명주기

![Custom software development requires a well defined Software Development Lifecycle, or SLDC.](./deployment-strategies/images/05.png)

위에 설명된 주요 고려 사항 외에도 코드 변경과 관련된 모든 작업은 SDLC(소프트웨어 개발 수명 주기)를 거쳐 변경으로 인해 자체 문제가 발생하지 않도록 해야 합니다. 여기에는 새로운 기능을 포함하는 변경 사항, 기존 사용자 정의 업데이트, 확인된 문제에 대한 수정 사항이 포함되지만 이에 국한되지는 않습니다.

다음: [Liferay의 배포 전략 설명](./deployment-strategies/deployment-strategies-explained.md)
