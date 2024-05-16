---
toc:
  - ./success-stories-analysis/presentation-breakdown.md
  - ./success-stories-analysis/additional-solutions.md
visibility:
  - Employee
  - Partner
---
# 성공 사례 * 분석

**한눈에 보기**

* Liferay 데모 제공을 준비하려면 사용할 데모 환경을 배우는 것 이상이 필요합니다.
* 영업 엔지니어는 플랫폼 기능과 이러한 기능이 실제 시나리오에서 어떻게 사용되는지 알아보기 위해 사용 가능한 모든 리소스를 활용해야 합니다.
* 이 모듈에서는 이전 모듈의 프레젠테이션 중 하나를 사용하여 주요 기능을 일반 솔루션 요구 사항에 매핑하는 방법에 대한 예를 제공합니다.

## 배경

레벨 0의 이전 모듈에서는 [Liferay가 해결하는 과제 * 수평적 솔루션](https://learn.liferay.com/web/guest/w/courses/판매-liferay/level-0/what-challenges-does) -liferay-solve-horizontal-solutions) Liferay가 적합한 6가지 수평적 솔루션을 자세히 검토했습니다.

* 고객 포털
* 디지털 상거래 사이트
* 외부 웹사이트
* 공급업체 포털
* 파트너 포털
* 최신 인트라넷

이 모듈은 콘텐츠와 동일한 프레젠테이션을 사용하지만 영업 엔지니어가 추가 검색을 수행하고 사전 구축된 데모 및 잠재 고객에게 유용할 수 있는 Liferay DXP 기능에 대한 지침을 제공하는 데 사용할 수 있는 리소스로 제공됩니다. 비슷한 요구 사항.

이 모듈에서는 높은 수준의 수평적 솔루션과 즉시 사용 가능한 기능을 논의한 다음 이전 레벨 0 모듈에 제공된 프레젠테이션의 맥락에서 솔루션 중 하나를 자세히 살펴봅니다. 이 모듈에서 제공된 **프레젠테이션** 은 참조 소스로 유용합니다. 프레젠테이션이 데모 프로세스의 일부로 사용되는 것은 아닙니다.

이 학습 경로의 이전 모듈 검토 * 시리즈는 검색 통화 중에 수행할 수 있는 작업으로 시작하여 사전 로그인 및 로그인 후 시나리오, Liferay 인증, Liferay 스타일 지정 방법 및 사용자 정의 사용자 정의 접근 방식 등에 대해 설명했습니다. 이러한 세션에서는 잠재 고객에게 30분 안에 제공할 수 있도록 기존 데모를 조정하는 프로세스를 진행하는 방법에 대한 가이드를 제공합니다.

이 모듈에서는 데모 자체를 제시하는 것이 아니라 데모를 보완하기 위한 기존 리소스로 성공 사례를 사용하는 방법에 대한 가이드를 제공합니다.

```{note}
* 이 모듈의 라이브 워크숍에서 [녹화](https://learn.liferay.com/documents/d/guest/se1-9-success-stories-analytic) 를 확인하세요.
* 라이브 워크숍에 사용된 프레젠테이션의 [PDF](https://learn.liferay.com/documents/d/guest/se1-9-success-stories-analytic-pdf) 를 다운로드하세요.
```

## 수평적 솔루션

![Six of the most common Liferay Horizontal Solutions are: Customer Portals, Digital Commerce Sites, External Websites, Supplier Portals, Partner Portals, and Modern Intranets](./success-stories-analysis/images/01.png)

Liferay가 사용되는 가장 널리 사용되는 수평 솔루션은 다음과 같습니다.

* 고객 포털
* 디지털 상거래 사이트
* 외부 웹사이트
* 공급업체 포털
* 파트너 포털
* 최신 인트라넷

첫째, 이것이 LIFeray가 적합한 솔루션의 전체 목록이 **아님** 은 아니라는 점을 기억하는 것이 중요합니다. Liferay는 다양한 사용 사례에 적합한 매우 광범위한 기본 기능을 제공합니다. Liferay를 잘 알고 있더라도 언뜻 보기에는 플랫폼에 논리적으로 적합하지 않은 곳에서 성공적으로 사용되었다는 소식을 들으면 놀랄 때가 있습니다.

이 모듈에서는 구현된 가장 일반적인 솔루션에 중점을 두고 해당 솔루션에 필요한 주요 Liferay 기능을 매핑하여 데모 준비 방법과 잠재 고객이 가질 수 있는 반대 또는 우려 사항을 관리하는 방법에 대한 이해를 제공합니다.

예를 들어, 잠재 고객의 목표가 고객 포털 구축인 회의에 참석하는 것을 고려해 보십시오. 이 문제를 해결하는 데 특히 적합한 특정 Liferay 기능 그룹이 있습니다. 이러한 기능에 대해 잘 알지 못하면 이에 대한 질문에 답하기가 어렵거나 Liferay를 고객 포털로 효과적으로 사용할 수 있다는 잠재 고객의 확신을 구축하기가 어려울 것입니다. 이 모듈에서는 여섯 가지 솔루션 모두에 대한 콘텐츠를 살펴보는 대신 고객 포털을 선택한 예로 사용하여 수평적 솔루션 프레젠테이션의 구조에 대해 설명합니다.

## Liferay DXP 주요 기능

![Liferay DXP provides a wide range of capabilities to support the implementation of an almost unlimited number of different solutions.](./success-stories-analysis/images/02.png)

위 이미지는 플랫폼의 주요 기능을 높은 수준에서 제공합니다. 언급된 모든 수평적 솔루션에는 이러한 기능이 많이 포함되어 있습니다. Liferay DXP가 제공하는 광범위한 기능은 Liferay가 DXP 시장에서 강력한 플레이어가 되는 주요 이유 중 하나입니다.

이 레벨 1 학습 경로의 목표는 영업 엔지니어가 Liferay의 30분 데모를 제공할 수 있도록 준비하는 것이므로 영업 엔지니어가 이러한 광범위한 기능을 잠재 고객에게 전달하고 방법에 대해 이야기할 수 있는 것이 중요합니다. Liferay는 비즈니스 문제를 해결할 수 있습니다. 세일즈 엔지니어로서 이 정보를 학문적으로 아는 것뿐만 아니라 위의 내용을 체크리스트로 사용하여 그룹별로 작업하고 학습하는 등 플랫폼에 대한 실무 경험을 갖는 것이 중요합니다.

Liferay를 사용하여 사이트를 구축할 수 있을 뿐만 아니라 Liferay가 콘텐츠 및 자산 관리, 강력한 검색 및 탐색 기능, 풍부한 헤드리스 API 세트, 통합 지원 방법, 인증 작동 방법 등을 제공한다는 사실을 아는 것이 중요합니다.

이러한 그룹을 높은 수준에서 학습한 다음 더 깊이 학습하세요. 특정 그룹이 다른 그룹보다 더 중요한 작업을 위한 예상 데모를 갖는 것은 더 깊은 수준의 학습을 수행할 수 있는 훌륭한 방법을 제공하며, 그렇게 함으로써 데모를 전달하고 반대 의견을 처리하는 데 더욱 효과적이 됩니다.

다음으로, [수평적 솔루션 분석 프레젠테이션](./success-stories-analytic/presentation-breakdown.md)
