# Pabbly를 사용하여 개체 데이터를 Google 스프레드시트와 동기화

{bdg-secondary}`가능 7.4+`

여기서는 Webhook을 사용하여 [Pabbly](https://www.pabbly.com/)을 사용하여 Liferay Objects와 Google Sheets 간에 동기화 작업을 트리거하는 방법을 배웁니다. 이러한 방식으로 데이터를 동기화하려면 Pabbly 계정, Google 스프레드시트 및 활성 DXP 7.4 인스턴스가 필요합니다. DXP 인스턴스에는 Google 스프레드시트로 데이터를 보내거나 받기 위해 원하는 필드가 있는 게시된 개체도 있어야 합니다.

## 개체 데이터를 Google 시트에 동기화

개체 데이터를 Google 시트에 동기화하려면 다음 단계를 따르세요.

1. [Pabbly](https://www.pabbly.com/)에 로그인하고 *All Apps* 페이지로 이동한 다음 *Pabbly Connect*를 클릭합니다.

   ![All Apps 페이지로 이동하여 Pabbly Connect를 클릭합니다.](./using-pabbly-to-sync-object-data-with-google-sheets/images/01.png)

1. *대시보드* 페이지에서 *워크플로우 생성*을 클릭합니다.

   ![워크플로 만들기를 클릭합니다.](./using-pabbly-to-sync-object-data-with-google-sheets/images/02.png)

1. 이름을 입력하고 *만들기*을 클릭합니다.

   ![이름을 선택하고 만들기를 클릭합니다.](./using-pabbly-to-sync-object-data-with-google-sheets/images/03.png)

1. *Trigger*에 대해 *Webhook* 앱을 선택합니다.

   ![Webhook 앱을 검색하여 선택합니다.](./using-pabbly-to-sync-object-data-with-google-sheets/images/04.png)

1. 생성된 *webhook URL*을 복사합니다.

   ![생성된 *webhook URL*을 복사합니다.](./using-pabbly-to-sync-object-data-with-google-sheets/images/05.png)

1. Liferay 인스턴스에서 복사된 URL을 사용하여 새 개체 항목이 추가될 때마다 웹후크 엔드포인트에 요청을 보내는 개체 작업 [을 정의](../../creating-and-managing-objects/actions/defining-object-actions.md).

   ![항목이 추가될 때마다 Webhook 끝점에 요청을 보내는 작업을 정의합니다.](./using-pabbly-to-sync-object-data-with-google-sheets/images/06.png)

1. Webhook를 트리거하는 개체 항목을 추가한 다음 Pabbly에서 *Capture Response* 을 클릭합니다.

   이렇게 하면 Webhook 앱이 개체의 데이터 구조를 자동으로 결정할 수 있습니다.

   ![웹후크를 트리거합니다.](./using-pabbly-to-sync-object-data-with-google-sheets/images/07.png)

1. *작업*에 대해 *Google 스프레드시트* 앱을 선택합니다.

   ![Google 스프레드시트 앱을 선택합니다.](./using-pabbly-to-sync-object-data-with-google-sheets/images/08.png)

1. *Action Event* 드롭다운 메뉴에서 *Add New Row* 을 선택하고 *Connect*를 클릭합니다.

   ![새 행 추가를 선택합니다.](./using-pabbly-to-sync-object-data-with-google-sheets/images/09.png)

1. 원하는 Google 계정을 앱에 연결하고 *저장*을 클릭합니다.

   ![원하는 Google 계정을 연결합니다.](./using-pabbly-to-sync-object-data-with-google-sheets/images/10.png)

1. 개체와 동기화할 원하는 *스프레드시트* 및 *시트* 을 선택합니다.

   ![개체와 동기화할 스프레드시트 및 시트를 선택합니다.](./using-pabbly-to-sync-object-data-with-google-sheets/images/11.png)

1. 시트의 열을 개체 구조의 데이터 필드에 매핑합니다.

   ![ 시트의 열을 개체 구조의 데이터 필드에 매핑합니다.](./using-pabbly-to-sync-object-data-with-google-sheets/images/12.png)

1. *저장 & 테스트 요청 보내기* 버튼을 클릭하고 테스트가 성공했는지 확인합니다.

   ![저장 & 보내기 테스트 요청을 클릭합니다.](./using-pabbly-to-sync-object-data-with-google-sheets/images/13.png)

   성공하면 *워크플로* 이 활성화되고 사용할 준비가 됩니다.

## 추가 정보

* [개체 개요](../../../objects.md)
* [객체 생성 및 관리](../../creating-and-managing-objects.md)
* [개체 통합 이해](../../understanding-object-integrations.md)