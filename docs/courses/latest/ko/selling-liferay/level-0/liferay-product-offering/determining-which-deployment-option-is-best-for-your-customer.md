---
visibility:
  - Employee
  - Partner
---
# 고객에게 가장 적합한 배포 옵션 결정

이미 언급했듯이 모든 배포 옵션이 가능하지만 당사의 영업 접근 방식은 SaaS 우선입니다. 그러나 이것이 실제로 의미하는 바는 무엇이며, 이것이 항상 고객에게 올바른 선택이 될까요?

```{note}
* 이 모듈의 라이브 워크숍에서 [녹화](https://learn.liferay.com/c/portal/login?p_l_id=3026&redirect=%2Fweb%2Fguest%2Fd%2Fl0-2a-liferay-offering) 를 시청하세요.
* 라이브 워크숍에 사용된 프레젠테이션의 [PDF](https://learn.liferay.com/c/portal/login?redirect=%2Fdocuments%2Fd%2Fguest%2Fl0-2a-liferay-offering-pdf) 를 다운로드하세요.
* 이 모듈에 언급된 [판매 결정 흐름](https://learn.liferay.com/c/portal/login?redirect=%2Fdocuments%2Fd%2Fguest%2Fnew-customer-new-project-sales-decision-flow) 을 다운로드하세요.
```

## 비즈니스 문제 해결

* 고객의 비즈니스 문제는 Liferay DXP로 해결됩니다
* 모든 기회는 여기에서 시작됩니다
* 비즈니스 문제를 먼저 생각하고 배포 전략은 나중에 생각하십시오.

궁극적으로 Liferay 솔루션의 핵심은 고객의 비즈니스 문제를 해결하는 것입니다. 기회가 시작되면 제품이 최종적으로 어떻게 배포될지는 중요하지 않습니다. 가장 중요한 것은 Liferay DXP로 문제를 해결할 수 있느냐는 것입니다.

질문에 대한 대답이 "예"라면, 여기서부터 시작하는 것이 좋습니다. 이후 모듈에서는 이상적인 고객 프로필, 고유한 가치 제안, 우리가 해결해야 할 과제를 다룰 것입니다.

그러나 지금은 잠재 고객에 대해 더 자세히 알아보면 가장 적합한 배포 접근 방식을 선택하는 데 도움이 될 것입니다.

## 맞춤형 솔루션 구축

Liferay로 구현된 솔루션은 고객이 배포 접근 방식으로 Liferay Experience Cloud SaaS를 선택하는 경우에도 턴키 애플리케이션이 아닙니다. Liferay DXP는 기본적으로 광범위한 기능을 제공합니다. 모든 경우에 솔루션 구축을 시작하려면 다음을 구성해야 합니다.

* 페이지를 추가해야 합니다.
* 콘텐츠가 만들어져야 한다
* 사용자와 역할을 정의해야 합니다.
* 등.

그러나 대부분의 경우 이러한 기능만으로는 비즈니스의 모든 문제가 해결되지는 않습니다. Liferay DXP의 주요 강점은 항상 특정 요구 사항에 맞게 플랫폼을 확장하고 사용자 정의할 수 있는 능력이었습니다. 플랫폼 확장에 대해 선호되는 접근 방식은 [원격 앱](https://learn.liferay.com/web/guest/w/dxp/building-applications/client-extensions) 을 생성하는 것입니다. 클라이언트 확장은 Liferay의 코드에 묶여 있지 않으며 모든 배포 접근 방식과 함께 사용할 수 있습니다. 클라이언트 확장을 통해 개발자는 익숙한 기술을 사용할 수 있으며 핵심 플랫폼으로의 업그레이드를 쉽게 수행할 수 있습니다.

![Client extensions are loosely-coupled, use modern technologies, and support easy upgrades.](../liferay-product-offering/images/05.png)

매우 복잡한 사용자 정의가 필요한 일부 상황에서 고객은 대체 Java 기반 개발 접근 방식을 사용하여 OSGi 모듈을 핵심 플랫폼에 배포할 수 있지만 이를 위해서는 SaaS가 아닌 배포 접근 방식이 필요합니다.

## SaaS가 가능한지 확인

Liferay는 **모든** 고객이 SaaS 배포를 통해 고유한 비즈니스 문제를 해결할 수는 없다는 점을 인식하고 있습니다.

고객이 SaaS에 **편안하다고** 가정하고, 다음 사항이 사실이라면 SaaS 우선 접근 방식을 따라야 합니다.

* 즉시 사용 가능한 Liferay 기능으로 비즈니스 문제를 해결할 수 있습니까?
* 확장에 대해 선호하는 접근 방식으로 모든 사용자 정의 요구 사항을 해결할 수 있습니까?
* 이미 로드맵에 있거나 요청된 향후 기능으로 사용자 정의 요구 사항을 해결할 수 있습니까?

```{note}
마지막 사항에 대해서는 솔루션 컨시어지 데스크를 통해 확인하십시오. Liferay는 고객 요구 사항을 지원하기 위해 새로운 기능을 추가하기 위해 적극적으로 노력하고 있으며 많은 경우 판매 주기 동안 잠재 고객을 위해 새로운 기능을 개발할 수 있습니다.
```

## SaaS가 불가능할 수 있는 시기 결정

Liferay Experience Cloud SaaS는 기본 옵션이어야 하지만 고객에게 최적의 접근 방식이 아닐 수 있는 상황이 있을 수 있다는 점을 인식하고 있습니다.

* 고객은 SaaS에 열려 있지 않습니다.
* 데이터 주권에 대한 우려가 있습니다. 예를 들어 Liferay가 아직 고객의 로컬 데이터 센터를 보유하지 않은 경우
* 다른 데이터 보안 또는 데이터 제어 문제가 있습니다.

이러한 경우에는 다른 배포 옵션을 고려해야 합니다.

* Liferay Experience Cloud 자체 관리형(PaaS가 허용되는 경우)
* Liferay DXP 자체 호스팅

이러한 접근 방식 모두 Liferay 또는 파트너가 제공하는 관리형 서비스 옵션과 함께 제공될 수 있으며, 이를 통해 고객의 우려 사항을 해결하면서 SaaS와 유사한 경험을 제공할 수 있습니다.

이러한 모든 문제는 솔루션 컨시어지 데스크를 통해 엄격히 검증되고 검증되어야 합니다.

```{note}
이러한 모든 사례는 제품이 발전하고 시간이 지남에 따라 SaaS에 대한 저항이 감소함에 따라 점차적으로 감소해야 합니다.
```

## 신규 고객 및 신규 프로젝트 판매 결정 흐름

Liferay는 신규 고객 및 기존 고객과의 신규 프로젝트에 사용할 판매 결정 흐름을 개발했습니다. 파트너는 이 흐름을 사용하여 각 고객 또는 프로젝트에 대한 최적의 접근 방식을 결정할 수 있습니다. 이는 SaaS, PaaS, 관리형 서비스가 포함된 PaaS 또는 셀프 호스팅을 안내하는 주요 결정 단계를 다루고, 기회에 적합한 배포 접근 방식에 대한 지침을 제공하고 이상값에 대한 솔루션 컨시어지 데스크로 안내합니다.

![Sales decision flow for new customers and new projects with existing customers.](../liferay-product-offering/images/06.png)

## 다음

훌륭한! Liferay 제품 제공의 기본 사항에 대한 모듈을 완료했습니다.

[다음 모듈을 시작](../liferay-product-overview.md)하여 Liferay DXP의 기능에 대한 개요와 고객 요구 사항을 충족하는 방법을 알아보세요.
