# 주문 수입업자 사용

{bdg-secondary}`사용 가능한 Liferay DXP 7.4 U1+/GA5+`

Minium 사이트에서 새 주문을 생성하는 방법에는 두 가지가 있습니다.

1. 오른쪽 상단의 **Account Selector** 을 클릭하고 **Create New Order** 을 선택합니다.

1. **보류 중인 주문** 화면으로 이동하여 **주문 추가** 을 클릭합니다.

![새 주문 만들기 버튼 또는 주문 추가 버튼을 클릭하여 새 주문을 만듭니다.](./using-order-importer/images/01.png)

## CSV 파일에서 주문 가져오기

먼저 특정 형식의 주문이 포함된 파일이 있어야 합니다. 아래 형식을 참조하십시오.

`sku,quantity,requestedDeliveryDate`

`requiredDeliveryDate` 은 선택 사항이며 기본 형식 `yyyy-MM-dd`입니다. 기본 동작을 변경하려면 [주문 수입자 구성](#order-importer-configuration) 을 참조하십시오.

CSV 파일에서 주문을 가져오려면

1. 전역 메뉴(![Applications Menu icon](../../images/icon-applications-menu.png))를 열고 제어판 &rarr; 사이트로 이동하여 Miniium 사이트를 만듭니다. **_** 추가 버튼을 클릭하고 최소를 선택합니다.

1. 새 주문을 생성하고 오른쪽 하단의 점 3개 아이콘(![3-dot icon](../../images/icon-actions.png))을 클릭하고 **CSV에서 가져오기** 를 선택합니다.

   ![CSV에서 가져오기 옵션을 사용하여 CSV 파일에서 주문을 가져올 수 있습니다.](./using-order-importer/images/02.png)

1. **파일** 선택을 클릭하고 가져올 CSV 파일을 선택합니다. **템플릿 다운로드** 을 클릭하여 템플릿 파일을 다운로드할 수도 있습니다.

   ![템플릿을 다운로드하거나 CSV 파일을 선택하여 주문을 가져올 수 있습니다.](./using-order-importer/images/03.png)

1. **가져오기** 을 한 번 클릭하여 주문 항목을 미리 보고 **가져오기** 을 다시 한 번 클릭하여 주문에 추가하십시오.

   ![가져오기를 클릭하여 주문을 미리 보고 새 주문으로 가져옵니다.](./using-order-importer/images/04.gif)

## 위시리스트에서 주문 가져오기

위시리스트에 주문에 빠르게 추가하고 싶은 제품이 있을 수 있습니다. 이렇게 하려면 먼저 위시리스트에 원하는 제품이 있는지 확인하십시오. 자세한 내용은 [위시리스트 사용](../../creating-store-content/using-wish-lists.md) 을 참조하십시오.

1. 새 주문을 생성하고 오른쪽 하단의 점 3개 아이콘(![3-dot icon](../../images/icon-actions.png))을 클릭합니다.

1. **위시리스트에서 가져오기** 을 선택하고 원하는 위시리스트를 선택합니다.

   ![위시리스트에서 가져오기 옵션을 사용하여 위시리스트에서 주문을 가져올 수 있습니다.](./using-order-importer/images/05.png)

1. **선택** 을 클릭하여 주문 항목을 미리 보고 **가져오기** 를 클릭하여 주문에 추가합니다.

   ![주문 항목을 미리 보고 가져오기를 클릭하여 주문에 추가할 수 있습니다.](./using-order-importer/images/07.gif)

## 과거 주문에서 주문 가져오기

과거 주문에서 주문을 가져올 수도 있습니다.

1. 새 주문을 생성하고 오른쪽 하단의 점 3개 아이콘(![3-dot icon](../../images/icon-actions.png))을 클릭합니다.

1. **과거 주문에서 가져오기** 을 선택하고 적절한 주문을 선택합니다.

   ![과거 주문에서 가져오기 옵션을 사용하여 과거 주문에서 주문을 가져올 수 있습니다.](./using-order-importer/images/06.png)

1. **선택** 을 클릭하여 주문 항목을 미리 보고 **가져오기** 를 클릭하여 주문에 추가합니다.

   ![주문 항목을 미리 보고 가져오기를 클릭하여 주문에 추가할 수 있습니다.](./using-order-importer/images/08.gif)

## 주문 수입자 구성

주문 수입업자에 대한 기본 CSV 구분 기호 및 요청된 배송 날짜 형식을 변경할 수 있습니다.

**기본 CSV 구분 기호:** 전역 메뉴(![Applications Menu icon](../../images/icon-applications-menu.png))를 열고 **제어판** &rarr; **시스템 설정** 으로 이동합니다. **주문** 을 클릭하고 **주문 수입업자 유형** 을 선택합니다. **CSV Separator** 아래의 값을 변경하고 **저장** 을 클릭합니다.

![기본 CSV 구분 기호 옵션을 사용하여 기본 CSV 구분 기호를 변경합니다.](./using-order-importer/images/09.png)

**요청 배송 날짜 형식:** 글로벌 메뉴(![Applications Menu icon](../../images/icon-applications-menu.png))를 열고 **제어판** &rarr; **인스턴스 설정** 로 이동합니다. **주문** 을 클릭하고 **주문 수입업자 날짜 형식 구성** 을 선택합니다. 원하는 형식으로 변경하고 **저장** 을 클릭합니다.

![요청된 배송 날짜 형식 옵션을 사용하여 기본 요청된 배송 날짜 형식을 변경합니다.](./using-order-importer/images/10.png)
