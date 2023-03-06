---
uuid: 3c74d619-bfc3-4747-88d1-a993b4ff48ac
---

# 알림 템플릿 변수 참조 가이드

알림 템플릿을 생성할 때 변수를 사용하여 트리거 채널 이벤트의 데이터로 이메일 필드를 동적으로 채울 수 있습니다. 알림 템플릿을 선택합니다. **변수를 보려면** 을 입력합니다. 알림을 트리거하는 채널 이벤트를 결정합니다.

![알림 템플릿 유형을 선택합니다.](./notification-template-variables-reference-guide/images/01.png)

유형을 선택한 후 **이메일 설정** 및 **이메일 내용** 섹션에서 **용어 정의** 을 확장하여 해당 변수 및 해당 설명을 볼 수 있습니다. 예를 들면 고객 이름, 주문 ID, 배송 및 청구 주소, 주문 항목 목록 등이 있습니다.

![이메일 본문에 이러한 변수를 사용하십시오.](./notification-template-variables-reference-guide/images/02.png)

## 이메일 설정

![이메일 설정 필드에서 이러한 변수를 사용하십시오.](./notification-template-variables-reference-guide/images/03.png)

| 변하기 쉬운                           | 묘사                                                                                                            |
|:-------------------------------- |:------------------------------------------------------------------------------------------------------------- |
| [%ACCOUNT_ROLE_ORDER_MANAGER%] | 주문한 계정의 주문 관리자                                                                                                |
| [%ORDER_CREATOR%]                | 주문을 생성한 사용자                                                                                                   |
| [%ACCOUNT_ROLE_ADMINISTRATOR%] | 주문한 계정의 계정 관리자                                                                                                |
| [%USER_GROUP_NAME%]            | 사용자 그룹의 이름입니다. `NAME` 사용자 그룹 이름으로 바꿉니다(예: 사용자 그룹 Sales Consultants의 경우 `[%USER_GROUP_Sales Consultants%]`입력). |

## 주문 기반 알림 템플릿 유형

![이러한 변수를 사용하여 이메일 알림에 주문 관련 정보를 포함합니다.](./notification-template-variables-reference-guide/images/04.png)

채널에는 주문 이벤트에 대한 6가지 유형의 알림 템플릿이 있습니다.

1. 주문 완료

1. 주문 처리

1. 배송 대기 주문

1. 주문 부분 배송됨

1. 배송된 주문

1. 완료된 주문

| 변하기 쉬운                                | 묘사                    |
|:------------------------------------- |:--------------------- |
| [%ORDER_ITEMS%]                       | 주문의 모든 항목을 나열하는 표     |
| [%ORDER_SHIPPING_ADDRESS%]          | 주문 배송 주소              |
| [%ORDER_BILLING_ADDRESS%]           | 주문 청구 주소              |
| [%ORDER_ID%]                          | Order Id              |
| [%ORDER_TOTAL%]                       | 주문 총액(세금 제외)          |
| [%ORDER_DATE%]                        | 주문한 날짜                |
| [%ORDER_CURRENCY_SYMBOL%]           | 주문의 통화 기호(예: $, £)    |
| [%ORDER_SHIPPING_WITH_TAX_TOTAL%] | 세금을 포함한 주문의 총 배송비     |
| [%ORDER_EXTERNAL_REFERENCE_CODE%]   | 주문의 외부 참조 코드          |
| [%ORDER_URL%]                         | 주문 URL                |
| [%PAYMENT_TERMS_DESCRIPTION%]       | 주문에 첨부된 결제 조건         |
| [%ORDER_PAYMENT_METHOD%]            | 주문결제수단                |
| [%ORDER_TAX_TOTAL%]                 | 주문에 대한 총 세금           |
| [%ORDER_WITH_TAX_TOTAL%]            | 세금을 포함한 총 주문 금액       |
| [%ORDER_CREATOR_USER_FIRST_NAME%] | 주문을 생성한 사용자의 이름       |
| [%ORDER_SHIPPING_OPTION%]           | 주문 배송 옵션              |
| [%ORDER_CREATOR_USER_LAST_NAME%]  | 주문을 생성한 사용자의 성        |
| [%DELIVERY_TERMS_DESCRIPTION%]      | 주문에 첨부된 배송 조건         |
| [%ORDER_CREATOR%]                     | 주문을 생성한 사용자           |
| [%ORDER_CURRENCY_CODE%]             | 주문 통화 코드(예: USD, GBP) |
| [%ORDER_CREATOR_USER_TITLE%]        | 주문을 생성한 사용자의 직함       |
| [%ORDER_SHIPPING_TOTAL%]            | 세금을 제외한 주문의 총 배송비     |

## 구독 기반 알림 템플릿 유형

![이러한 변수를 사용하여 이메일 알림에 구독 관련 정보를 포함합니다.](./notification-template-variables-reference-guide/images/05.png)

채널에는 구독 이벤트에 대한 네 가지 유형의 알림 템플릿이 있습니다.

1. 구독 갱신

1. 구독이 활성화됨

1. 구독 보류

1. 구독 취소됨

| 변하기 쉬운            | 묘사          |
|:----------------- |:----------- |
| [%PRODUCT_NAME%]  | 상품 이름       |
| [%ORDER_CREATOR%] | 주문을 생성한 사용자 |
| [%ORDER_ID%]      | Order Id    |

## 추가 정보

* [알림 템플릿 사용](./using-notification-templates.md)
