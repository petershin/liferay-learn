# Wyzebulb를 사용하여 Google 스프레드시트와 개체 데이터 동기화

{bdg-secondary}`라이프레이 7.4+`

여기서는 웹후크를 사용하여 [Wyzebulb](https://www.wyzebulb.com/) 을 사용하여 Liferay 개체와 Google 스프레드시트 간의 동기화 작업을 트리거하는 방법을 알아봅니다. 이러한 방식으로 데이터를 동기화하려면 Wyzebulb 계정, Google 스프레드시트 및 활성 DXP 7.4 인스턴스가 필요합니다. DXP 인스턴스에는 Google 스프레드시트로 데이터를 보내거나 받기 위해 원하는 필드가 포함된 게시된 개체도 있어야 합니다.

## 개체 데이터를 Google 시트에 동기화하기

개체 데이터를 Google 시트에 동기화하려면 다음 단계를 따르세요.

1. [Wyzebulb](https://www.wyzebulb.com/) 에 로그인하고 흐름을 생성합니다.

1. 트리거로 **Webhooks** 앱을 선택하세요.

   ![Select an App for the trigger.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/01.png)

   ![Select Webhooks.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/02.png)

1. **Catch Hook** 트리거를 선택하고 **Save + Continue** 를 클릭하세요.

   ![Select the Catch Hook trigger.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/03.png)

   ![Click Save and Continue.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/04.png)

1. **Webhooks URL** 을 클릭하고 생성된 URL을 복사하세요.

   ![Select the Webhooks URL.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/05.png)

   ![Copy the Webhook URL.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/06.png)

1. Liferay 인스턴스에서 복사된 URL을 사용하여 언제든지 웹훅 엔드포인트에 요청을 보내는 [객체 작업 정의](../../creating-and-managing-objects/actions/defining-object-actions.md) 새로운 개체 항목이 추가됩니다.

   ![Define an action that sends a request to the webhook endpoint whenever an entry is added.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/07.png)

1. 웹훅을 트리거하려면 테스트 개체 항목을 추가하세요.

   이를 통해 Webhooks 모듈은 객체의 데이터 구조를 자동으로 결정할 수 있습니다.

1. 테스트가 성공했는지 확인하고 **저장 + 계속** 을 클릭하세요.

   ![Successful Test.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/08.png)

1. **작업** 의 경우 **Google 스프레드시트** 앱을 선택하세요.

   ![Click App to select an app.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/09.png)

   ![Select Google Sheets.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/10.png)

1. **Google 스프레드시트에서 새 행 만들기** 작업을 선택하고 **저장 + 계속** 을 클릭하세요.

   ![Click Action to select an action.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/11.png)

   ![Select Create a new row in Google Sheets.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/12.png)

1. Google 스프레드시트 앱을 Google 계정에 연결하세요.

    ![Connect the Google Sheet app to a Google account.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/13.png)

1. 원하는 **스프레드시트** 와 **워크시트** 를 선택합니다.

    ![Select the desired Spreadsheet and Worksheet.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/14.png)

1. 시트의 열을 개체 구조의 데이터 필드에 매핑합니다.

    ![Map the Sheet's columns to Object fields.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/15.png)

1. **테스트 작업** 버튼을 클릭하고 테스트가 성공했는지 확인하세요.

    ![Successful Test.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/16.png)

1. **내 흐름** 페이지로 이동하여 흐름이 실행 중인지 확인하세요.

    ![Verify your flow is running.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/17.png)

## 관련 주제

* [객체 개요](../../../objects.md)
* [객체 생성 및 관리](../../creating-and-managing-objects.md)
* [객체 통합 이해](../../understanding-object-integrations.md)
