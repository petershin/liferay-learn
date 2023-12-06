# Zapier를 사용하여 Google 스프레드시트와 개체 데이터 동기화

{bdg-secondary}`라이프레이 7.4+`

여기서는 웹후크를 사용하여 [Zapier](https://zapier.com/) 을 사용하여 Liferay 개체와 Google 스프레드시트 간의 동기화 작업을 트리거하는 방법을 알아봅니다. 이러한 방식으로 데이터를 동기화하려면 프리미엄 Zapier 계정, Google 스프레드시트 및 활성 DXP 7.4 인스턴스가 필요합니다. DXP 인스턴스에는 Google 스프레드시트로 데이터를 보내거나 받기 위해 원하는 필드가 포함된 게시된 개체도 있어야 합니다.

## 개체 데이터를 Google 시트에 동기화하기

개체 데이터를 Google 시트에 동기화하려면 다음 단계를 따르세요.

1. [Zapier](https://zapier.com/) 에 로그인하고 **Create Zap** 을 클릭하세요.

   ![Create a Zap.](./using-zapier-to-sync-object-data-with-google-sheets/images/01.png)

1. **트리거** 단계를 클릭하고 **Zapier의 Webhooks** 를 선택합니다.

   ![Click Trigger and select webhooks by Zapier.](./using-zapier-to-sync-object-data-with-google-sheets/images/02.png)

   ```{note}
   Webhooks is a premium Zapier feature.
   ```

1. **트리거 이벤트** 드롭다운 메뉴를 클릭하고 **Catch Hook** 을 선택한 다음 **계속** 을 클릭하세요.

   ![Select Catch Hook for trigger event.](./using-zapier-to-sync-object-data-with-google-sheets/images/03.png)

1. 생성된 **웹훅 URL** 을 복사하세요.

   ![Copy the generated webhook URL.](./using-zapier-to-sync-object-data-with-google-sheets/images/04.png)

1. Liferay 인스턴스에서 복사된 URL을 사용하여 언제든지 웹훅 엔드포인트에 요청을 보내는 [객체 작업 정의](../../creating-and-managing-objects/actions/defining-object-actions.md) 새로운 개체 항목이 추가됩니다.

   ![Define an action that sends a request to the webhook endpoint whenever an entry is added.](./using-zapier-to-sync-object-data-with-google-sheets/images/05.png)

1. 웹훅을 트리거하려면 테스트 개체 항목을 추가하세요.

   이를 통해 Webhooks 모듈은 객체의 데이터 구조를 자동으로 결정할 수 있습니다.

1. **테스트 트리거** 버튼을 클릭합니다.

   ![Click the test trigger button.](./using-zapier-to-sync-object-data-with-google-sheets/images/06.png)

1. 테스트가 성공했는지 확인하고 **계속** 을 클릭하세요.

   ![Verify the test was successful.](./using-zapier-to-sync-object-data-with-google-sheets/images/07.png)

1. **작업** 단계를 클릭하고 **Google 스프레드시트** 앱을 선택하세요.

   ![Select Google Sheets.](./using-zapier-to-sync-object-data-with-google-sheets/images/08.png)

1. **작업 이벤트** 드롭다운 메뉴를 클릭하고 **스프레드시트 행 만들기** 를 선택합니다.

    ![Select Create Spreadsheet Row.](./using-zapier-to-sync-object-data-with-google-sheets/images/09.png)

1. Google 스프레드시트 앱을 Google 계정에 연결한 다음 **계속** 을 클릭하세요.

    ![Connect the Google Sheets app to a Google account.](./using-zapier-to-sync-object-data-with-google-sheets/images/10.png)

1. 원하는 **스프레드시트** 와 **워크시트** 를 선택하여 개체와 동기화하세요.

    ![Select the desired Spreadsheet and Worksheet.](./using-zapier-to-sync-object-data-with-google-sheets/images/11.png)

    ```{important}
    스프레드시트 행 생성 작업을 사용할 때 첫 번째 열 머리글에 텍스트가 있어야 합니다. 그렇지 않으면 Zap이 데이터를 시트 하단이 아닌 시트 상단으로 보냅니다.
    ```

1. 시트의 열을 개체 구조의 데이터 필드에 매핑하고 **계속** 을 클릭합니다.

    ![Map the Sheet's columns to Object fields.](./using-zapier-to-sync-object-data-with-google-sheets/images/12.png)

1. **테스트 작업** 버튼을 클릭하고 테스트가 성공했는지 확인하세요.

    ![Click the Test Action button and verify the test is successful.](./using-zapier-to-sync-object-data-with-google-sheets/images/13.png)

1. Zap을 켜세요.

    ![Turn on your Zap.](./using-zapier-to-sync-object-data-with-google-sheets/images/14.png)

## 관련 주제

* [객체 개요](../../../objects.md)
* [객체 생성 및 관리](../../creating-and-managing-objects.md)
* [객체 통합 이해](../../understanding-object-integrations.md)
