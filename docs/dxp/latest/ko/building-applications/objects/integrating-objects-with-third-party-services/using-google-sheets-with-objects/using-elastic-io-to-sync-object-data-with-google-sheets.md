# Elastic.io를 사용하여 Google Sheets와 객체 데이터 동기화

{bdg-secondary}`라이프레이 7.4+`

데이터 통합 도구와 함께 Liferay 객체를 사용하여 객체 데이터를 외부 서비스와 동기화하기 위한 자동화된 작업을 생성할 수 있습니다. 이러한 작업은 웹후크를 사용하여 트리거되며 Google 애플리케이션, Microsoft Office 등에 연결할 수 있습니다.

여기서는 웹훅을 사용하여 [Elastic.io](https://www.elastic.io/) 을 사용하여 Liferay 개체와 Google 스프레드시트 간의 동기화 작업을 트리거하는 방법을 알아봅니다. 이러한 방식으로 데이터를 동기화하려면 Elastic.io 계정, Google 스프레드시트 및 활성 DXP 7.4 인스턴스가 필요합니다. DXP 인스턴스에는 Google 스프레드시트로 데이터를 보내거나 받기 위해 원하는 필드가 포함된 게시된 개체도 있어야 합니다.

## 개체 데이터를 Google 시트에 동기화하기

개체 데이터를 Google 시트에 동기화하려면 다음 단계를 따르세요.

1. [Elastic.io](https://www.elastic.io/) 에 로그인하고 **통합** 페이지로 이동한 후 **흐름** 을 클릭합니다.

   ![Navigate to the Integrate page, and click Flow.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/01.png)

1. **새 흐름 추가** 를 클릭합니다.

   ![Add a new flow.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/02.png)

1. **초기 트리거 추가** 를 클릭하세요.

   ![Add the initial trigger.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/03.png)

1. **트리거** 의 경우 **Webhook** 구성요소를 선택합니다.

   ![Search for and select Webhook.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/04.png)

1. 생성된 **웹훅 URL** 을 복사하세요.

   ![Copy the generated Webhook URL.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/05.png)

1. Liferay 인스턴스에서 복사된 URL을 사용하여 언제든지 웹훅 엔드포인트에 요청을 보내는 [객체 작업 정의](../../creating-and-managing-objects/actions/defining-object-actions.md) 새로운 개체 항목이 추가됩니다.

   ![Define an action that sends a request to the webhook endpoint whenever an entry is added.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/06.png)

1. 웹훅을 트리거하려면 테스트 개체 항목을 추가하세요.

   이를 통해 Webhook 구성 요소는 개체의 데이터 구조를 자동으로 결정할 수 있습니다.

1. **샘플 요청 보내기** 버튼을 클릭하세요.

   ![Click the Send Sample Request button.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/07.png)

1. 테스트를 통해 개체의 데이터 구조가 성공적으로 결정되었는지 확인하세요. 웹훅 URL로 전송된 데이터가 발견되면 해당 단계에서 성공했다고 표시됩니다.

   ![Verify the test was successful.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/08.png)

1. **새 작업 추가** 를 클릭합니다.

    ![Add a new action.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/09.png)

1. **작업** 의 경우 **Google 스프레드시트** 구성요소를 선택하세요.

    ![Select the Google Sheets component.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/10.png)

1. **스프레드시트 행 추가** 기능을 선택하세요.

    ![Select the Add Spreadsheet Row function.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/11.png)

1. 원하는 **스프레드시트** 와 **워크시트** 를 선택하여 개체와 동기화하세요.

    ![Select the desired Spreadsheet and sheet to sync with the Object.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/12.png)

1. 선택한 시트에 헤더가 포함되어 있는지 여부를 나타냅니다.

    ![Indicate whether the selected Sheet includes headers.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/13.png)

1. 시트의 열을 개체 구조의 데이터 필드에 매핑합니다.

    ![Map the Sheet's columns to Object fields.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/14.png)

1. **Google 스프레드시트에서 샘플 검색** 버튼을 클릭하세요.

    ![Click the Retrieve Sample from Google Spreadsheet button.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/15.png)

1. 테스트가 성공했는지 확인합니다.

    ![Verify the test was successful.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/16.png)

1. **초안 게시** 를 클릭하세요.

    ![Click Publish Draft.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/17.png)

1. **Start Flow** 를 클릭하여 새 흐름을 활성화합니다.

    ![Click Start Flow.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/18.png)

## 관련 주제

* [객체 개요](../../../objects.md)
* [객체 생성 및 관리](../../creating-and-managing-objects.md)
* [객체 통합 이해](../../understanding-object-integrations.md)
