# Pabbly를 사용하여 Google Sheets와 개체 데이터 동기화

{bdg-secondary}`라이프레이 7.4+`

여기서는 웹후크를 사용하여 [Pabbly](https://www.pabbly.com/) 을 사용하여 Liferay 개체와 Google 스프레드시트 간의 동기화 작업을 트리거하는 방법을 알아봅니다. 이러한 방식으로 데이터를 동기화하려면 Pabbly 계정, Google 스프레드시트 및 활성 DXP 7.4 인스턴스가 필요합니다. DXP 인스턴스에는 Google 스프레드시트로 데이터를 보내거나 받기 위해 원하는 필드가 포함된 게시된 개체도 있어야 합니다.

## 개체 데이터를 Google 시트에 동기화하기

개체 데이터를 Google 시트에 동기화하려면 다음 단계를 따르세요.

1. [Pabbly](https://www.pabbly.com/) 에 로그인하고 **모든 앱** 페이지로 이동한 후 **Pabbly 연결** 을 클릭하세요.

   ![Navigate to the All Apps page and click Pabbly Connect.](./using-pabbly-to-sync-object-data-with-google-sheets/images/01.png)

1. **대시보드** 페이지에서 **워크플로 만들기** 를 클릭합니다.

   ![Click Create Workflow.](./using-pabbly-to-sync-object-data-with-google-sheets/images/02.png)

1. 이름을 입력하고 **만들기** 를 클릭하세요.

   ![Choose a name and click Create.](./using-pabbly-to-sync-object-data-with-google-sheets/images/03.png)

1. **트리거** 의 경우 **웹훅** 앱을 선택하세요.

   ![Search for and select the Webhook app.](./using-pabbly-to-sync-object-data-with-google-sheets/images/04.png)

1. 생성된 **웹훅 URL** 을 복사하세요.

   ![Copy the generated webhook URL.](./using-pabbly-to-sync-object-data-with-google-sheets/images/05.png)

1. Liferay 인스턴스에서 복사된 URL을 사용하여 언제든지 웹훅 엔드포인트에 요청을 보내는 [객체 작업 정의](../../creating-and-managing-objects/actions/defining-object-actions.md) 새로운 개체 항목이 추가됩니다.

   ![Define an action that sends a request to the webhook endpoint whenever an entry is added.](./using-pabbly-to-sync-object-data-with-google-sheets/images/06.png)

1. Webhook를 트리거하기 위한 객체 항목을 추가한 다음 Pabbly에서 **Capture Response** 를 클릭합니다.

   이를 통해 Webhook 앱은 개체의 데이터 구조를 자동으로 결정할 수 있습니다.

   ![Trigger the webhook.](./using-pabbly-to-sync-object-data-with-google-sheets/images/07.png)

1. **작업** 의 경우 **Google 스프레드시트** 앱을 선택하세요.

   ![Select the Google Sheets app.](./using-pabbly-to-sync-object-data-with-google-sheets/images/08.png)

1. **작업 이벤트** 드롭다운 메뉴에서 **새 행 추가** 를 선택하고 **연결** 을 클릭하세요.

   ![Select Add New Row.](./using-pabbly-to-sync-object-data-with-google-sheets/images/09.png)

1. 원하는 Google 계정을 앱에 연결하고 **저장** 을 클릭하세요.

    ![Connect the desired Google account.](./using-pabbly-to-sync-object-data-with-google-sheets/images/10.png)

1. 원하는 **스프레드시트** 와 **시트** 를 선택하여 개체와 동기화하세요.

    ![Select the desired Spreadsheet and sheet to sync with the Object.](./using-pabbly-to-sync-object-data-with-google-sheets/images/11.png)

1. 시트의 열을 개체 구조의 데이터 필드에 매핑합니다.

    ![ Map the Sheet's columns to data fields in the Object's structure.](./using-pabbly-to-sync-object-data-with-google-sheets/images/12.png)

1. **테스트 요청 저장 및 보내기** 버튼을 클릭하고 테스트가 성공했는지 확인하세요.

    ![Click the Save & send Test Request.](./using-pabbly-to-sync-object-data-with-google-sheets/images/13.png)

    성공하면 **워크플로** 가 활성화되어 사용할 준비가 됩니다.

## 관련 주제

* [객체 개요](../../../objects.md)
* [객체 생성 및 관리](../../creating-and-managing-objects.md)
* [객체 통합 이해](../../understanding-object-integrations.md)
