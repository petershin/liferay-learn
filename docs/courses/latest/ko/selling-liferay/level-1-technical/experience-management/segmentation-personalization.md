---
visibility:
  - Employee
  - Partner
---
# 세분화 및 개인화

**한눈에 보기**

* Liferay의 경험 관리 기능을 입증하는 기본 사항은 다음과 같습니다.
  * 페이지
  * 세분화 및 개인화
  * 만족한 관리
  * 해석학
* 세분화는 사이트 사용자에 대해 알려진 내용과 수행한 활동을 기반으로 사이트 사용자를 그룹화하는 기능을 제공합니다.
* 개인화는 다양한 세그먼트에 속한 사용자에게 고유한 경험을 제공하는 기능을 제공합니다.

## 세분화 및 개인화

[사이트 경험 개인화](https://learn.liferay.com/web/guest/w/dxp/site-building/personalizing-site-experience) 통해 사용자 청중을 세분화하고 각 세그먼트에 맞게 디지털 경험을 맞춤화하여 보다 매력적이고 관련성 높은 경험을 만들 수 있습니다. 이는 고객 만족도, 충성도 및 비즈니스 수익 증가로 이어집니다. 여기서 논의할 핵심 사항은 다음과 같습니다.

* 이 주제는 일반적으로 많은 관심을 불러일으킵니다.
* 항상 관련 예시를 제공하세요.
* 세그먼트 생성이 얼마나 쉬운지 강조하세요.

개인화는 민감하고 오해를 받을 수 있는 주제일 수 있으며 종종 청중으로부터 많은 관심을 불러일으킵니다. 일반적인 질문은 다음과 같습니다.

* 익명 사용자를 분류하는 방법
* 사용자가 브라우저에서 쿠키를 비활성화하면 어떻게 되나요?

신중하게 준비하고, 잠재 고객이 구현하려는 상황과 솔루션을 기반으로 예시를 제공하는 것이 중요합니다.

예를 들어 온라인 소매업체는 고객의 이전 구매 내역, 검색 기록 또는 검색어를 기반으로 쇼핑 경험을 개인화할 수 있습니다. 또한 고객의 사이트
, 언어 또는 관심사에 따라 웹사이트의 콘텐츠를 개인화할 수도 있습니다.

또는 직원 포털의 경우 조직은 직원의 역할, 부서 또는 사이트
에 따라 다양한 콘텐츠와 기능을 제공하여 경험을 개인화할 수 있습니다. 예를 들어, 영업 담당자는 인사 관리자와 비교하여 다른 리소스 및 도구 세트를 볼 수 있습니다.

### 예제 분할 연습

데모에서는 세그먼트 생성이 비즈니스 사용자에게 쉬운 작업이고 코드를 작성할 필요가 없으며 관리 사용자 인터페이스를 통한 쉬운 구성으로 모든 작업이 완료된다는 점을 보여줍니다.

Liferay는 정적 정보와 행동 정보를 모두 사용하여 청중을 분류할 수 있다는 점을 언급하는 것이 중요합니다. 세그먼트는 매우 쉬운 방법으로 Liferay 자체에서 생성될 수 있습니다.

**세그먼트 생성**

![Liferay allows users to create new segments by dragging and dropping any number of attributes that describe users and their activities.](./segmentation-personalization/images/01.png)

사용자 섹션에서 역할 속성을 끌어다 놓아 새 세그먼트를 생성할 수 있습니다. 플랫폼이 방금 생성된 세그먼트에 속한 사용자 수를 즉시 미리 볼 수 있음을 보여주기 위해 정의된 조건과 일치하는 사용자가 있는지 확인하십시오. 또한 조직 또는 세션 속성과 같은 다른 조건을 추가하고 결합하는 것이 쉽다는 것을 보여줍니다.

데모 환경이 Liferay의 Analytics와 연결되어 있고 고객이 Analytics에 관심이 있는 경우 Analytics UI를 통해 직접 세분화를 표시하십시오. 이는 사용자 행동을 사용하여 더욱 발전된 세분화 가능성을 제공합니다. 예를 들어 사용자가 문서를 다운로드했는지, 양식을 제출했는지, 일부 주제에 관심을 보였는지 등을 표시할 수 있습니다.

관련이 있는 경우 세그먼트를 외부 시스템에서 생성한 다음 Liferay로 가져와 개인화된 경험을 만들 수도 있다는 점을 언급하는 것이 도움이 될 수 있습니다.

**경험 만들기**

![alt_text](./segmentation-personalization/images/02.png)

새로운 세그먼트가 생성되면 새로운 경험을 생성하는 방법을 보여줍니다. 페이지에서 구성 요소를 제거하고 페이지의 구성 요소를 배너로 추가하거나 교체합니다.

이미지를 선택할 때 적절한 이미지가 준비되어 있는지 확인하세요. 이는 다양한 경험이 어떻게 만들어질 수 있는지 보여주는 예일 뿐이며, 이 접근 방식을 통해 다양한 사용자 세그먼트에 대해 완전히 다른 사용자 여정을 구축할 수 있다는 점을 잊지 마세요. 모든 것이 구성에 따라 수행되며 기술적 또는 코딩 기술이 필요하지 않다는 점을 강조하십시오.

개인화 및 세분화에 대한 자세한 내용과 제공된 기능을 사용하는 방법은 이 사이트의 다른 곳에서 확인할 수 있습니다.

* [사용자 세그먼트 생성 및 관리](https://learn.liferay.com/w/dxp/site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments) 
* [경험 생성 및 관리](https://learn.liferay.com/w/dxp/site-building/personalizing-site-experience/experience-personalization/creating-and-managing-experiences) 

### 세분화 뿐만 아니라

세분화는 개인화된 경험을 창출하는 유일한 방법이 아닙니다. Liferay DXP는 다음을 포함하여 사용자 경험과 페이지에 표시되는 콘텐츠를 개인화하는 기타 기능을 제공합니다.

* 역할 및 권한
* 제품 추천
* 카탈로그 및 가격 개인화

**역할 및 권한**

Liferay는 정교하고 세분화된 [역할 및 권한](https://learn.liferay.com/web/guest/w/dxp/users-and-permissions/roles-and-permissions) 설정을 제공하므로 사용자가 콘텐츠나 페이지를 볼 수 있는 적절한 권한이 없으면 콘텐츠 기사나 페이지가 사용자에게 표시되지 않을 수 있습니다. 예를 들어 내부 문서는 직원 포털 내의 HR 담당자만 액세스할 수 있습니다.

Liferay를 개인화하기 위해 역할 및 권한을 사용할 수 있는 가능성에 대해 이야기할 때 모범 사례는 필요할 때만 액세스를 제한하고 세분화 및 경험을 사용하여 안내 보기를 제공하면서도 사용자가 찾을 수 있도록 허용하는 것임을 언급하는 것이 중요합니다. 다른 방식으로 다른 콘텐츠. 자세한 내용은 [인증](../liferay-authentication.md) 모듈을 참조하세요.

**제품 추천**

디지털 카탈로그를 표시할 때 또 다른 가능성은 [제품 추천](https://learn.liferay.com/web/guest/w/commerce/pricing/promoting-products/product-recommendations) 사용하여 사용자의 관심 사항에 따라 다른 콘텐츠를 표시하는 것입니다. Liferay DXP는 Liferay Analytics Cloud와 함께 이러한 탐색 행동을 분석하고 사용자에게 관련 제품을 보여줄 수 있습니다.

이는 사용자가 구매하거나 소비할 가능성이 더 높은 특정 제품이나 콘텐츠를 홍보하는 데 유용할 수 있습니다. 예를 들어, 사용자가 온라인 매장을 방문하여 특정 유형의 상품에 관심을 보이면 상품 추천을 통해 현재 조회한 상품과 유사한 상품, 과거에 구매했거나 유사한 고객이 구매한 상품을 추천할 수 있습니다.

**카탈로그 및 가격 개인화**

또한 카탈로그와 가격을 개인화할 수 있습니다. 회사가 특정 고객을 위해 맞춤형 제품을 판매하는 경우 제품에 대한 가시성을 [계정 그룹을 사용하여 제품 가시성 구성](https://learn.liferay.com/ko/w/commerce/product-management/creating-and-managing-products/products/configuring-product-visibility-using-account-groups) 할 수 있습니다. 또는 특정 유형의 고객에게만 판매되는 일부 제품(예: 골드 고객에게만 판매하는 일부 프리미엄 서비스)이 있을 수도 있습니다.

Liferay를 사용하면 간단한 구성을 사용하여 제품 목록을 쉽게 개인화할 수 있습니다. [가격표 생성](https://learn.liferay.com/w/commerce/pricing/creating-a-price-list) 과 [프로모션 생성](https://learn.liferay.com/w/commerce/pricing/promoting-products/creating-a-promotion) 고객 또는 고객 그룹별로 구성할 수 있습니다. 이는 Liferay를 통해 조직은 고객이 맞춤형 제품, 가격, 프로모션 및 할인만 볼 수 있음을 확신할 수 있음을 의미합니다.

다음: [콘텐츠 관리 및 분석](./content-management-analytics.md).
