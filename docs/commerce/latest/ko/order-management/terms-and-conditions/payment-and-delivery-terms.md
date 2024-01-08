# 결제 및 배송 조건

{bdg-secondary}`liferay DXP 7.4 U16+/GA16+`

## 결제 조건

결제 조건은 구매자와 판매자 간의 거래 조건을 규율합니다. 고객마다 다른 결제 조건을 지정할 수 있습니다. Liferay는 아래 조건과 사용자가 생성한 조건을 정의하기 위한 편집 가능한 텍스트 필드를 제공합니다.

* 구매자가 회비를 정산해야 하는 일수입니다.
* 기한 내에 지불하지 못한 경우 연체료.
* 만기일 이전에 결제한 경우 할인이 적용됩니다.
* 판매자와 구매자 사이에 합의된 기타 조건.

```{note}
지불 조건은 협상 가능한 수단 및 송장 지불 조건이라고도 합니다.
```

### 결제 조건 생성

1. **글로벌 메뉴**(![애플리케이션 메뉴 아이콘](../../images/icon-applications-menu.png))를 열고 **상거래** &rarr; **이용 약관** 을 클릭합니다.

   ![The Terms and Conditions menu item is available under the Order Management section.](./payment-and-delivery-terms/images/01.png)

1. **추가**(![아이콘 추가](../../images/icon-add.png))를 클릭하고 다음 정보를 입력합니다.

   **이름:** 결제 조건 1

   **유형:** 지불 조건

   **우선순위:** 0.0

   ![Enter a name, type and priority for the Payment Terms.](./payment-and-delivery-terms/images/02.png)

1. **제출** 을 클릭하세요.

1. 그러면 새 결제 조건이 생성됩니다. 편집 가능한 설명 텍스트 필드에 구매자와 합의한 조건을 추가하고 **활성** 토글을 사용하여 활성화할 수 있습니다.

   ![Use the editable Description text field to add the Payment Terms and use the Active toggle to enable it.](./payment-and-delivery-terms/images/03.png)

1. **게시** 를 클릭하세요.

### 결제 조건을 결제 방법에 연결

채널에는 여러 결제 방법이 있을 수 있으며 결제 조건을 각 결제 방법과 연결할 수 있습니다. 단일 결제 방법에 여러 결제 조건이 연결된 경우 우선 순위에 따라 어떤 결제 방법이 사용되는지가 결정됩니다.

1. **글로벌 메뉴**(![애플리케이션 메뉴 아이콘](../../images/icon-applications-menu.png))를 열고 **상거래** &rarr; **채널** 을 클릭합니다.

1. 채널을 선택하고 **결제 방법** 까지 아래로 스크롤합니다.

1. 원하는 결제 방법을 클릭하고 **자격** 탭을 엽니다.

   ![Search for the Payment Terms to link to a Payment Method.](./payment-and-delivery-terms/images/04.png)

1. **결제 조건 자격** 아래에서 **특정 결제 조건** 을 클릭하세요.

1. **결제 조건 추가** 에서 결제 조건을 검색하고 **선택** 을 클릭하세요.

1. **저장** 을 클릭하여 결제 조건을 연결하고 구성 보기를 닫습니다.

1. **저장** 을 클릭하세요.

### 결제 조건 결제 단계 활성화

하나의 결제 방법에 여러 결제 조건이 연결된 경우 우선 순위가 가장 높은 결제 조건이 다른 결제 조건보다 우선합니다. 사용자에게 기본 결제 조건을 변경할 수 있는 권한이 없으면 결제 시 추가 단계가 표시되지 않습니다.

![You must have the permission to manage Payment Terms to be able to view and change them during checkout.](./payment-and-delivery-terms/images/05.png)

## 배송 조건

배송 조건은 구매자와 판매자 간의 주문 배송 조건을 정의합니다. 고객마다 다른 배송 조건을 지정할 수 있습니다. 배송 조건은 아래와 같은 조건을 가질 수 있으며 귀하가 생성할 수 있습니다.

* 주문에 대한 예상 배송 시간
* 배송 지연에 관한 조건
* 반품 정책
* 판매자와 구매자 사이에 합의된 기타 조건.

### 배송 조건 생성

1. **글로벌 메뉴**(![애플리케이션 메뉴 아이콘](../../images/icon-applications-menu.png))를 열고 **상거래** &rarr; **이용 약관** 을 클릭합니다.

1. **추가**(![아이콘 추가](../../images/icon-add.png))를 클릭하고 다음 정보를 입력합니다.

   **이름:** 배송 조건 1

   **유형:** 배송 조건

   **우선순위:** 0.0

   ![Enter a name, type and priority for the Delivery Terms.](./payment-and-delivery-terms/images/06.png)

1. **제출** 을 클릭하세요.

1. 그러면 새로운 배송 조건이 생성됩니다. **설명** 텍스트 영역에 구매자와 합의한 조건을 추가하고 토글을 사용하여 활성화할 수 있습니다.

   ![Use the editable Description text field to add the Delivery Terms and use the Active toggle to enable it.](./payment-and-delivery-terms/images/07.png)

1. **게시** 를 클릭하세요.

### 배송 조건을 배송 방법에 연결

채널에는 여러 배송 방법이 있을 수 있으며 각 배송 방법과 배송 조건을 연결할 수 있습니다. 단일 배송 방법에 여러 배송 조건이 연결된 경우 우선순위에 따라 어떤 방법이 사용되는지 결정됩니다.

1. **글로벌 메뉴**(![애플리케이션 메뉴 아이콘](../../images/icon-applications-menu.png))를 열고 **상거래** &rarr; **채널** 을 클릭합니다.

1. 채널을 선택하고 **배송 방법** 까지 아래로 스크롤합니다.

1. 원하는 배송 방법을 클릭하고 **배송 옵션** 탭을 엽니다.

1. 적절한 배송 옵션을 선택하고 **자격** 탭을 엽니다.

   ![Search for the Delivery Terms to link to a Shipping Option.](./payment-and-delivery-terms/images/08.png)

1. **배송 조건 자격** 아래에서 **특정 배송 조건** 을 클릭하세요.

1. **배송 조건 추가** 에서 배송 조건을 검색하고 **선택** 을 클릭하세요.

1. **저장** 을 클릭하여 배송 조건을 연결하고 구성 보기를 닫습니다.

1. **저장** 을 클릭하세요.

### 배송 조건 결제 단계 활성화

하나의 배송 방법에 여러 배송 조건이 연결된 경우 우선 순위가 가장 높은 배송 조건이 다른 배송 조건보다 우선합니다. 사용자에게 기본 배송 조건을 변경할 수 있는 권한이 없으면 결제 시 추가 단계가 표시되지 않습니다.

![You must have the permission to manage Delivery Terms to be able to view and change them during checkout.](./payment-and-delivery-terms/images/09.png)

## 이용약관 자격

자격 탭을 사용하여 결제 및 배송 조건을 특정 주문 유형에 연결할 수 있습니다.

1. 결제 또는 배송 조건의 **자격** 탭을 클릭하세요.

1. **특정 주문 유형** 라디오 버튼을 클릭하세요.

   ![Use the eligibility tab to link the Payment and Delivery Terms to specific Order Types.](./payment-and-delivery-terms/images/10.png)

1. 주문 유형을 검색하고 **선택** 을 클릭하세요.

1. **게시** 를 클릭하세요.
