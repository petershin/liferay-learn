# 워크플로 및 알림 구성

Fabulous Frames의 주문 관리자인 Noah Norman은 예산상의 이유로 구매자인 Sarah Stanley의 주문을 검토하고 승인하려고 합니다. Clarity의 B2B 사이트는 기본 제공되는 단일 승인자 워크플로를 사용하는 구매자 주문 승인 워크플로를 사용합니다. 이렇게 하면 구매자가 접수한 모든 주문이 주문 관리자의 승인을 받게 됩니다. 이 워크플로는 구매에 할당된 예산이 있고 승인이 필요할 때 도움이 됩니다.

1. **글로벌 메뉴**(![글로벌 메뉴](../../images/icon-applications-menu.png))를 열고 **커머스** → **채널** 로 이동합니다.

1. 앞서 생성한 B2B 채널을 선택합니다.

1. 주문 섹션의 구매자 주문 승인 워크플로 드롭다운에서 **단일 승인자(버전 1**) 를 선택합니다.

   ![Select the single approver buyer order approval workflow.](./configuring-workflows-and-notifications/images/01.png)

1. **저장** 을 클릭하세요.

## 알림 템플릿 생성

관리자인 Kyle은 주문이 승인되면 사용자에게 알리기 위해 귀하의 도움이 필요합니다. 이렇게 하려면 상거래 주문 시스템 개체에 대한 알림 템플릿과 개체 작업을 설정해야 합니다.

1. **전역 메뉴**(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 **제어판** → **템플릿** 으로 이동합니다.

1. **추가**(![Add](../../images/icon-add.png))를 클릭하고 **이메일** 을 선택합니다.

1. 다음 세부정보를 입력하세요.

   **이름:** Clarity - 주문 승인 알림 템플릿

   **설명:** Clarity에서 주문을 수락할 때 전송되는 이메일에 대한 알림 템플릿입니다.

   **받는 사람:** `[%COMMERCEORDER_AUTHOR_EMAIL_ADDRESS%]`

   **발신 주소:** `orders@clarityvisionsolutions.com`

   **이름:** `Orders @ Clarity`

   **제목:** `귀하의 주문: [%COMMERCEORDER_ID%] 승인되었습니다`

   **템플릿:**

   ```
   Hi [%COMMERCEORDER_AUTHOR_FIRST_NAME%] [%COMMERCEORDER_AUTHOR_LAST_NAME%],

   Your recent order from Clarity with Order ID: [%COMMERCEORDER_ID%] has been accepted. Visit the orders page from your account to know the latest status of your order. 

   Thanks,

   Orders @ Clarity
   ```

   알림 템플릿에서 사용할 수 있는 모든 변수는 다음과 같습니다.

   | 변하기 쉬운                                             | 묘사             |
   | :------------------------------------------------- | :------------- |
   | [%COMMERCEORDER_AUTHOR_SUFFIX%]                 | 작성자 접미사        |
   | [%COMMERCEORDER_AUTHOR_PREFIX%]                 | 작성자 접두사        |
   | [%COMMERCEORDER_AUTHOR_FIRST_NAME%]            | 작성자 이름         |
   | [%COMMERCEORDER_AUTHOR_LAST_NAME%]             | 작성자 성          |
   | [%COMMERCEORDER_AUTHOR_MIDDLE_NAME%]           | 작성자 중간 이름      |
   | [%COMMERCEORDER_AUTHOR_ID%]                     | 작성자 ID         |
   | [%COMMERCEORDER_CURRENCYCODE%]                   | 통화 코드          |
   | [%COMMERCEORDER_EXTERNALREFERENCECODE%]          | 외부 참조 코드       |
   | [%COMMERCEORDER_ID%]                             | ID             |
   | [%COMMERCEORDER_MODIFIEDDATE%]                   | 변경된 날짜         |
   | [%COMMERCEORDER_ORDERSTATUS%]                    | 주문 상태.         |
   | [%COMMERCEORDER_ORDERTYPEEXTERNALREFERENCECODE%] | 주문 유형 외부 참조 코드 |
   | [%COMMERCEORDER_ORDERTYPEID%]                    | 주문 유형 아이디      |
   | [%COMMERCEORDER_SHIPPINGAMOUNT%]                 | 배송금액           |
   | [%COMMERCEORDER_STATUS%]                         | 상태             |

1. **저장** 을 클릭하세요.

그러면 주문이 수락될 때마다 알림을 보내는 알림 템플릿이 생성됩니다. 이제 이를 트리거하려면 상거래 주문 시스템 개체에 개체 작업을 생성해야 합니다.

## 상거래 주문 개체 작업 생성

1. **전역 메뉴**(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 **제어판** → **개체** 로 이동합니다.

1. **상거래 주문** 시스템 개체를 선택합니다.

1. **작업** 탭으로 이동하여 **추가**(![Add](../../images/icon-add.png))를 클릭합니다.

1. 작업 라벨로 **Order Accepted** 를 입력합니다. 작업 이름이 자동으로 채워집니다.

1. **Action Builder** 로 이동합니다.

1. 트리거 아래 드롭다운에서 **주문 상태 업데이트 시** 를 선택합니다.

1. **조건 활성화** 토글을 활성화하고 다음 표현식을 입력합니다.

   `orderStatus=10`

   각 [주문 상태](https://learn.liferay.com/web/guest/w/commerce/order-management/orders/order-life-cycle)는 정수에 해당합니다. 자세한 내용은 아래를 참조하세요.

   | 주문 상태. | 정수값 |
   | :----- | :-- |
   | 열려있는   | 2   |
   | 진도안에   | 6   |
   | 미정     | 1   |
   | 처리중    | 10  |
   | 배송됨    | 15  |
   | 완료하는   | 0   |
   | 취소됨    | 8   |
   | 부분 배송  | 14  |
   | 파악에    | 20  |

1. 작업 아래에서 **알림** 을 선택하고 **Clarity Order Accepted** 알림 템플릿을 선택하세요.

   ![Enter the trigger, condition, and action for the object action.](./configuring-workflows-and-notifications/images/02.png)

1. **저장** 을 클릭하세요.

이는 상거래 주문 시스템 개체에 대한 개체 작업을 생성합니다. 주문이 수락될 때마다 트리거되고 템플릿을 기반으로 이메일을 보냅니다.

다음: [웨어하우스 생성 및 구성](./creating-and-configuring-warehouses.md)
