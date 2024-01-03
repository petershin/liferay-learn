# 주문 가져오기 도구 사용

{bdg-secondary}`liferay DXP 7.4 U1+/GA5+`

Minium 사이트에서 새 주문을 생성하는 방법에는 두 가지가 있습니다.

1. 오른쪽 상단에서 _계정 선택기_를 클릭하고 _새 주문 생성_을 선택하세요.

1. _보류 주문_ 화면으로 이동하여 _주문 추가_를 클릭하세요.

![Create a new Order by clicking on the Create New Order button or the Add Order button.](./using-order-importer/images/01.png)

## CSV 파일에서 주문 가져오기

먼저 특정 형식의 주문이 포함된 파일이 있어야 합니다. 아래 형식을 참조하세요.

`sku,quantity,requestedDeliveryDate`

'requestedDeliveryDate'는 선택사항이며 기본 형식인 'yyyy-MM-dd'를 사용해야 합니다. 기본 동작을 변경하려면 [주문 가져오기 구성](#order-importer-configuration) 을 참조하세요.

CSV 파일에서 주문을 가져오려면,

1. 글로벌 메뉴(![응용 프로그램 메뉴 아이콘](../../images/icon-applications-menu.png))를 열고 제어판 &rarr; 사이트로 이동하여 Minium 사이트를 만듭니다. _추가_ 버튼을 클릭하고 최소를 선택하세요.

1. 새 주문을 생성하고 오른쪽 하단의 점 3개 아이콘(![점 3개 아이콘](../../images/icon-actions.png))을 클릭하고 _CSV에서 가져오기_를 선택합니다.

   ![You can use the Import from CSV option to import orders from a CSV file.](./using-order-importer/images/02.png)

1. _파일 선택_을 클릭하고 가져오려는 CSV 파일을 선택하세요. _템플릿 다운로드_를 클릭하여 템플릿 파일을 다운로드할 수도 있습니다.

   ![You can download a template or select the CSV file to import orders from.](./using-order-importer/images/03.png)

1. _가져오기_를 한 번 클릭하면 주문 항목을 미리 볼 수 있고, _가져오기_를 다시 한 번 클릭하면 해당 항목을 주문에 추가할 수 있습니다.

   ![Click Import to preview and import the orders to your new order.](./using-order-importer/images/04.gif)

## 위시리스트에서 주문 가져오기

주문에 빠르게 추가하고 싶은 제품을 위시리스트에 담을 수 있습니다. 그렇게 하려면 먼저 위시리스트에 원하는 제품이 있는지 확인하세요. 자세한 내용은 [위시리스트 사용](../../creating-store-content/using-wish-lists.md) 참조하세요.

1. 새 주문을 생성하고 오른쪽 하단에 있는 점 3개 아이콘(![점 3개 아이콘](../../images/icon-actions.png))을 클릭합니다.

1. _위시리스트에서 가져오기_를 선택하고 원하는 위시리스트를 선택하세요.

   ![You can use the Import from Wish Lists option to import orders from a wishlist.](./using-order-importer/images/05.png)

1. 주문에 포함된 항목을 미리 보려면 _선택_을 클릭하고 주문에 추가하려면 _가져오기_를 클릭하세요.

   ![You can preview the items in your order and click Import to add them to your order.](./using-order-importer/images/07.gif)

## 과거 주문에서 주문 가져오기

과거 주문에서 주문을 가져올 수도 있습니다.

1. 새 주문을 생성하고 오른쪽 하단에 있는 점 3개 아이콘(![점 3개 아이콘](../../images/icon-actions.png))을 클릭합니다.

1. _과거 주문에서 가져오기_를 선택하고 적절한 주문을 선택하세요.

   ![You can use the Import from Past Orders option to import orders from a past order.](./using-order-importer/images/06.png)

1. 주문에 포함된 항목을 미리 보려면 _선택_을 클릭하고 주문에 추가하려면 _가져오기_를 클릭하세요.

   ![You can preview the items in your order and click Import to add them to your order.](./using-order-importer/images/08.gif)

## 주문 수입업체 구성

Order Importer의 기본 CSV 구분 기호 및 요청된 배송 날짜 형식을 변경할 수 있습니다.

**기본 CSV 구분 기호:** 전역 메뉴(![응용 프로그램 메뉴 아이콘](../../images/icon-applications-menu.png))를 열고 _제어판_ &rarr; _시스템 설정_으로 이동합니다. _주문_을 클릭하고 _주문 수입업체 유형_을 선택하세요. _CSV 구분 기호_ 아래의 값을 변경하고 _저장_을 클릭합니다.

![Use the Default CSV Separator option to change the default CSV separator.](./using-order-importer/images/09.png)

**요청된 배송 날짜 형식:** 글로벌 메뉴(![애플리케이션 메뉴 아이콘](../../images/icon-applications-menu.png))를 열고 _제어판_ &rarr; _인스턴스 설정_으로 이동합니다. _주문_을 클릭하고 _주문 수입업체 날짜 형식 구성_을 선택합니다. 원하는 형식으로 변경하고 _저장_을 클릭하세요.

![Use the Requested Delivery Date Format option to change the default Requested Delivery Date format.](./using-order-importer/images/10.png)
