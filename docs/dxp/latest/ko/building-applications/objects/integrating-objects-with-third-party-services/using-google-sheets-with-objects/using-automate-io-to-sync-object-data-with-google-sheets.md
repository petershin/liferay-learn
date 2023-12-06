# Automate.io를 사용하여 Google Sheets와 개체 데이터 동기화

{bdg-secondary}`라이프레이 7.4+`

여기서는 웹후크를 사용하여 [Automate.io](https://automate.io/) 을 사용하여 Liferay 개체와 Google 스프레드시트 간의 동기화 작업을 트리거하는 방법을 알아봅니다. 이러한 방식으로 데이터를 동기화하려면 프리미엄 Automate.io 계정, Google 스프레드시트 및 활성 DXP 7.4 인스턴스가 필요합니다. DXP 인스턴스에는 Google 스프레드시트로 데이터를 보내거나 받기 위해 원하는 필드가 포함된 게시된 개체도 있어야 합니다.

## 개체 데이터를 Google 시트에 동기화하기

개체 데이터를 Google 시트에 동기화하려면 다음 단계를 따르세요.

1. [Automate.io](https://automate.io/) 에 로그인하고 **봇 만들기** 를 클릭하세요.

   ![Open Automate.io and click Create a Bot.](./using-automate-io-to-sync-object-data-with-google-sheets/images/01.png)

1. **트리거** 단계에서는 **Webhooks** 앱을 선택하세요.

   ![Select Webhooks.](./using-automate-io-to-sync-object-data-with-google-sheets/images/02.png)

   ```{note}
   Webhooks는 프리미엄 Automate.io 기능입니다.
   ```

1. **트리거 이벤트** 의 경우 **Incoming Hook** 을 선택하세요.

   ![Select Incoming Hook.](./using-automate-io-to-sync-object-data-with-google-sheets/images/03.png)

1. 생성된 **웹훅 URL** 을 복사하세요.

   ![Copy the Webhooks URL.](./using-automate-io-to-sync-object-data-with-google-sheets/images/04.png)

1. Liferay 인스턴스에서 복사된 URL을 사용하여 언제든지 웹훅 엔드포인트에 요청을 보내는 [객체 작업 정의](../../creating-and-managing-objects/actions/defining-object-actions.md) 새로운 개체 항목이 추가됩니다.

   ![Define an action that sends a request to the webhook endpoint whenever an entry is added.](./using-automate-io-to-sync-object-data-with-google-sheets/images/05.png)

1. 웹훅을 트리거하려면 테스트 개체 항목을 추가하세요.

   이를 통해 Automate.io 봇의 Webhooks 앱이 개체의 데이터 구조를 자동으로 결정할 수 있습니다.

1. **작업** 단계에서는 **Google 스프레드시트** 앱을 선택하세요.

   ![Select Google Sheets.](./using-automate-io-to-sync-object-data-with-google-sheets/images/06.png)

1. **승인** 을 클릭하여 앱을 Google 계정과 연결하세요.

   ![Choose a Google account to connect.](./using-automate-io-to-sync-object-data-with-google-sheets/images/07.png)

1. 작업 필드에서 **행 추가** 를 선택합니다.

   ![Select Add Row.](./using-automate-io-to-sync-object-data-with-google-sheets/images/08.png)

1. 원하는 **스프레드시트** 와 **워크시트** 를 선택하여 개체와 동기화하고 **저장** 을 클릭하세요.

    ![Select the desired Spreadsheet and Worksheet.](./using-automate-io-to-sync-object-data-with-google-sheets/images/09.png)

1. 봇을 **켜세요** .

    ![Turn on your bot.](./using-automate-io-to-sync-object-data-with-google-sheets/images/10.png)

1. 봇을 테스트하려면 개체 항목을 추가하세요.

    ![Test your bot using live data.](./using-automate-io-to-sync-object-data-with-google-sheets/images/11.png)

1. 봇이 개체 데이터를 성공적으로 수신하고 Google Sheets 작업을 트리거했는지 확인합니다.

    ![Verify the test was successful.](./using-automate-io-to-sync-object-data-with-google-sheets/images/12.png)

## 관련 주제

* [객체 개요](../../../objects.md)
* [객체 생성 및 관리](../../creating-and-managing-objects.md)
* [객체 통합 이해](../../understanding-object-integrations.md)
