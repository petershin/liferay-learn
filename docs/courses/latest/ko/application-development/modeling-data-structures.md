---
toc:
  - ./modeling-data-structures/determining-data-entities.md
  - ./modeling-data-structures/adding-fields-to-the-distributor-application-object.md
  - ./modeling-data-structures/adding-fields-using-rest-apis.md
  - ./modeling-data-structures/creating-picklists-for-distributor-applications.md
  - ./modeling-data-structures/creating-picklists-using-rest-apis.md
  - ./modeling-data-structures/adding-picklist-fields-to-the-object.md
  - ./modeling-data-structures/adding-a-custom-layout-and-view-to-distributor-application.md
  - ./modeling-data-structures/setting-up-the-application-evaluation-object.md
  - ./modeling-data-structures/adding-a-relationship-between-the-object-definitions.md
  - ./modeling-data-structures/adding-the-relationship-to-custom-layouts.md
  - ./modeling-data-structures/relating-object-entries.md
---
# 데이터 구조 모델링

애플리케이션 작성의 첫 번째 단계는 데이터 구조를 모델링하는 것입니다. 이를 위해서는 작성하려는 애플리케이션에 대한 브레인스토밍이 필요합니다.

* 저장하고 조작하려는 데이터 엔터티 유형 식별

* 각 엔터티 유형에 속성 추가

* 엔터티 유형 간의 관계 정의

## 데이터 엔터티 식별

애플리케이션의 데이터 엔터티를 나타내는 [개체](https://learn.liferay.com/ko/w/dxp/building-applications/objects) 를 생성할 수 있습니다. 보험 청구, 지원 티켓, 상거래 제품 등 무엇이든 될 수 있습니다. 사용자 정의 개체를 게시하면 Liferay는 데이터 항목을 저장하기 위한 데이터베이스 테이블을 만듭니다. 또한 CRUD 작업을 수행하기 위한 헤드리스 API를 생성하고 기본 프런트엔드를 제공합니다. Liferay 개체를 사용하면 조직의 특정 요구 사항을 지원할 수 있는 강력하고 유연한 솔루션 기반을 구축할 수 있습니다.

## 속성 추가

속성은 텍스트 및 숫자 값과 같은 애플리케이션에 대한 특정 유형의 정보를 저장하는 데이터베이스 열을 나타냅니다. 데이터 모델의 속성을 정의하려면 사용자 입력을 수신하기 위해 객체 정의에 [분야](https://learn.liferay.com/ko/w/dxp/building-applications/objects/creating-and-managing-objects/fields) 추가해야 합니다. 또한 선택 목록 [선택목록](https://learn.liferay.com/ko/w/dxp/building-applications/objects/picklists) 만들고 이를 개체와 함께 사용하여 사용자에게 미리 정의된 단일 선택 및 다중 선택 필드를 제공할 수 있습니다.

## 관계 정의

관계를 정의하는 것은 실제 엔터티와 해당 상호 작용을 정확하게 나타내는 데이터 모델을 만드는 데 중요합니다. 개발자는 관계를 사용하여 엔터티 연결 및 종속성을 더 잘 캡처하기 위해 시스템 내에서 데이터가 구성되고 연결되는 방식을 결정할 수 있습니다. 개체 정의 간에 일대다 및 다대다 관계를 정의할 수 있습니다. 이러한 관계는 항목을 연결하기 위해 각 개체에 필드나 테이블을 추가하므로 다양한 개체 컨텍스트에서 항목 데이터에 액세스할 수 있습니다.

## 배포자 애플리케이션 흐름을 위한 객체 모델링

Delectable Bonsai는 온보딩 흐름을 위해 두 가지 유형의 데이터 개체를 저장하고 관리해야 합니다.

* 대리점 신청
* 애플리케이션 평가

<!--FINISH: ![](./modeling-data-structures/images/01.png) -->

각 유통업체 애플리케이션은 KYC(Know Your Customer) 모범 사례 및 자금세탁방지(AML) 법률 준수를 위해 각 신청자의 신원과 신용을 확인하는 데 필요한 비즈니스 정보를 저장해야 합니다. 또한 각 잠재 유통업체의 상대적 가치를 평가하는 데 도움이 되는 정보를 수집해야 합니다.

신청서 평가에는 검토 과정에서 작성된 메모와 권장 사항이 저장되어야 합니다. 또한 사용자는 각 평가를 하나의 응용 프로그램에 연결하고 각 응용 프로그램을 여러 평가에 연결할 수 있어야 합니다.

이 솔루션을 구현하는 첫 번째 단계는 잠재적 배포자로부터 응용 프로그램을 받고 관리하기 위한 Distributor Application 개체를 만드는 것입니다.

준비가 된?

[갑시다!](./modeling-data-structures/determining-data-entities.md)
