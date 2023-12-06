# Make를 사용하여 Google 스프레드시트와 개체 데이터 동기화

{bdg-secondary}`라이프레이 7.4+`

여기서는 웹후크를 사용하여 [Make](https://www.make.com/) (이전 Integromat)을 사용하여 Liferay 개체와 Google 스프레드시트 간의 동기화 작업을 트리거하는 방법을 알아봅니다. 이러한 방식으로 데이터를 동기화하려면 계정 만들기, Google 스프레드시트 및 활성 DXP 7.4 인스턴스가 필요합니다. DXP 인스턴스에는 Google 스프레드시트로 데이터를 보내거나 받기 위해 원하는 필드가 포함된 게시된 개체도 있어야 합니다.

## 개체 데이터를 Google 시트에 동기화하기

개체 데이터를 Google 시트에 동기화하려면 다음 단계를 따르세요.

1. [Make](https://www.make.com/) 에 로그인하고 **시나리오** 페이지로 이동한 후 **새 시나리오 만들기** 를 클릭하세요.

   ![Click Create a new scenario.](./using-make-to-sync-object-data-with-google-sheets/images/01.png)

1. **추가** 버튼을 클릭하고 **Webhooks** 모듈을 선택한 다음 **Custom Webhook** 트리거를 선택합니다.

   이는 웹훅이 데이터를 수신할 때 시나리오를 실행합니다.

   ![Select Webhooks.](./using-make-to-sync-object-data-with-google-sheets/images/02.png)

   ![Select Custom webhook.](./using-make-to-sync-object-data-with-google-sheets/images/03.png)

1. 새 모듈을 선택하고 **추가** 를 클릭하여 새 웹훅을 생성합니다.

   ![Select the module and click Add.](./using-make-to-sync-object-data-with-google-sheets/images/04.png)

1. 생성되면 생성된 **웹훅 URL** 을 복사하세요.

   ![Copy the generated webhook URL.](./using-make-to-sync-object-data-with-google-sheets/images/05.png)

1. Liferay 인스턴스에서 복사된 URL을 사용하여 언제든지 웹훅 엔드포인트에 요청을 보내는 [객체 작업 정의](../../creating-and-managing-objects/actions/defining-object-actions.md) 새로운 개체 항목이 추가됩니다.

   ![Define an action that sends a request to the webhook endpoint whenever an entry is added.](./using-make-to-sync-object-data-with-google-sheets/images/06.png)

1. 웹훅을 트리거하려면 테스트 개체 항목을 추가하세요.

   이를 통해 Webhooks 모듈은 객체의 데이터 구조를 자동으로 결정할 수 있습니다.

1. 모듈이 객체의 데이터 구조를 성공적으로 결정했는지 확인하고 **확인** 을 클릭하세요.

   ![Verify the Object's data structure was determined successfully.](./using-make-to-sync-object-data-with-google-sheets/images/07.png)

   ```{note}
   객체의 구조가 변경되면 Webhooks 모듈 편집으로 돌아가서 *데이터 구조 재결정*을 클릭하세요.
   ```

1. **새 모듈 추가** 버튼을 클릭하고 **Google 스프레드시트** 모듈을 선택한 다음 **행 추가** 작업을 선택합니다.

   ![Select Google Sheets.](./using-make-to-sync-object-data-with-google-sheets/images/08.png)

   ![Select Add a row.](./using-make-to-sync-object-data-with-google-sheets/images/09.png)

1. 새 모듈을 선택하고 **추가** 를 클릭하여 Google 계정을 연결하세요.

1. 연결 이름을 입력하고 **저장** 을 클릭하세요.

    그러면 원하는 Google 계정을 선택하고 계정 파일에 액세스할 수 있는 권한을 Make에 부여하는 창이 열립니다.

    ![Add a Google connection.](./using-make-to-sync-object-data-with-google-sheets/images/10.png)

    만들기 권한을 부여한 후 Google 스프레드시트 모듈 편집으로 돌아갑니다.

1. 모듈의 모드를 결정한 다음 원하는 **스프레드시트** 및 **시트** 를 선택하여 개체와 동기화하세요.

1. 선택한 시트에 헤더가 포함되어 있는지 여부를 나타냅니다.

1. 시트의 열을 개체 구조의 데이터 필드에 매핑합니다. 사용 가능한 개체 필드는 **Webhooks** 모듈에서 제공됩니다.

    ![Map the Sheet's columns to Object fields.](./using-make-to-sync-object-data-with-google-sheets/images/11.png)

1. **예약** 을 켜고 시나리오를 **저장** 하세요.

    ![Turn on scheduling.](./using-make-to-sync-object-data-with-google-sheets/images/12.png)

저장되면 새 개체 항목 데이터가 선택한 시트에 추가됩니다.

## 시트 데이터를 개체에 동기화하기

Google 시트 데이터를 개체에 동기화하려면 다음 단계를 따르세요.

1. Make를 열고 시나리오 페이지로 이동한 후 **새 시나리오 만들기** 를 클릭하세요.

   ![Click Create a new scenario.](./using-make-to-sync-object-data-with-google-sheets/images/13.png)

1. **추가** 버튼을 클릭하고 **Google 스프레드시트** 모듈을 선택한 다음 **조사 행** 트리거를 선택하세요.

   그러면 시트에서 새 행을 감시하도록 모듈이 설정됩니다.

   ![Select Google Sheets.](./using-make-to-sync-object-data-with-google-sheets/images/14.png)

   ![Select Watch rows.](./using-make-to-sync-object-data-with-google-sheets/images/15.png)

1. 새 모듈을 선택하고 **추가** 를 클릭하여 Google 계정을 연결하세요.

1. 연결 이름을 입력하고 **저장** 을 클릭하세요.

   그러면 원하는 Google 계정을 선택하고 계정 파일에 액세스할 수 있는 권한을 Make에 부여하는 창이 열립니다.

   ![Add a Google connection.](./using-make-to-sync-object-data-with-google-sheets/images/16.png)

1. 원하는 **스프레드시트** 및 **시트** 를 선택합니다.

1. 선택한 시트에 헤더가 포함되어 있는지 여부를 나타내고 감시할 열 범위를 입력합니다(예: 'A1:E1'은 A~E 열에 데이터 입력을 보냅니다.).

1. 한 번의 실행 주기 동안 작업할 결과의 제한을 설정합니다.

1. 완료되면 **확인** 을 클릭하세요.

1. **새 모듈 추가** 버튼을 클릭하고 **HTTP** 모듈을 선택한 다음 **기본 인증 요청 만들기** 작업을 선택합니다.

   ![Select HTTP.](./using-make-to-sync-object-data-with-google-sheets/images/17.png)

   ![Select Make a Basic Auth request.](./using-make-to-sync-object-data-with-google-sheets/images/18.png)

   ```{important}
   기본 인증은 데모 목적으로만 사용됩니다. 비즈니스 사용 사례에는 보다 안전한 인증 방법을 사용하세요(예: *OAuth 2.0 요청*).
   ```

1. 새 모듈을 선택하고 **추가** 를 클릭하여 기본 인증 자격 증명을 추가합니다.

1. 추가한 후에는 'https://<your-domain>/o/c/<objectname>/' 형식을 사용하는 개체의 Headless API URL을 입력합니다. 자세한 내용은 [헤드리스 프레임워크 통합](../../understanding-object-integrations/using-custom-object-apis.md)을 참조하세요.

1. **포스트** 메소드 유형을 선택하세요.

    ![Add credentials, enter the Object's Headless API URL, and select the post method.](./using-make-to-sync-object-data-with-google-sheets/images/19.png)

1. 원하는 본문 유형(예: **RAW**)과 요청 콘텐츠 유형(예: **JSON**)을 선택합니다.

1. 선택한 콘텐츠 유형과 대상 개체에 적합한 형식을 사용하여 요청 본문을 입력합니다.

    ![Select Make a Basic Auth request.](./using-make-to-sync-object-data-with-google-sheets/images/20.png)

1. **확인** 을 클릭하세요.

1. **예약** 을 켜고 시나리오를 **저장** 하세요.

    ![Turn on scheduling and save the scenario.](./using-make-to-sync-object-data-with-google-sheets/images/21.png)

    ```{note}
    기본적으로 이 시나리오는 15분마다 자동으로 트리거됩니다. 
    ```

## 관련 주제

* [객체 개요](../../../objects.md)
* [객체 생성 및 관리](../../creating-and-managing-objects.md)
* [객체 통합 이해](../../understanding-object-integrations.md)
