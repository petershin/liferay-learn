# Make를 사용하여 객체 데이터를 Google 스프레드시트와 동기화

{bdg-secondary}`가능 7.4+`

여기서는 Webhook을 사용하여 [Make](https://www.make.com/) (이전의 Integromat)을 사용하여 Liferay Objects와 Google Sheets 간에 동기화 작업을 트리거하는 방법을 알아봅니다. 이러한 방식으로 데이터를 동기화하려면 계정 만들기, Google 스프레드시트 및 활성 DXP 7.4 인스턴스가 필요합니다. DXP 인스턴스에는 Google 스프레드시트로 데이터를 보내거나 받기 위해 원하는 필드가 있는 게시된 개체도 있어야 합니다.

## 개체 데이터를 Google 시트에 동기화

개체 데이터를 Google 시트에 동기화하려면 다음 단계를 따르세요.

1. [Make](https://www.make.com/) 에 로그인하고 **시나리오** 페이지로 이동한 다음 **새 시나리오 만들기** 를 클릭합니다.

   ![새 시나리오 만들기를 클릭합니다.](./using-make-to-sync-object-data-with-google-sheets/images/01.png)

1. **Add** 버튼을 클릭하고 **Webhook** 모듈을 선택한 다음 **Custom webhook** 트리거를 선택합니다.

   이는 웹후크가 데이터를 수신할 때 시나리오를 실행합니다.

   ![웹후크를 선택합니다.](./using-make-to-sync-object-data-with-google-sheets/images/02.png)

   ![사용자 지정 웹후크를 선택합니다.](./using-make-to-sync-object-data-with-google-sheets/images/03.png)

1. 새 모듈을 선택하고 **추가** 을 클릭하여 새 웹후크를 생성합니다.

   ![모듈을 선택하고 추가를 클릭합니다.](./using-make-to-sync-object-data-with-google-sheets/images/04.png)

1. 일단 생성되면 생성된 **webhook URL** 을 복사합니다.

   ![생성된 웹훅 URL을 복사합니다.](./using-make-to-sync-object-data-with-google-sheets/images/05.png)

1. Liferay 인스턴스에서 복사된 URL을 사용하여 새 개체 항목이 추가될 때마다 웹후크 엔드포인트에 요청을 보내는 개체 작업 [을 정의](../../creating-and-managing-objects/actions/defining-object-actions.md).

   ![항목이 추가될 때마다 Webhook 끝점에 요청을 보내는 작업을 정의합니다.](./using-make-to-sync-object-data-with-google-sheets/images/06.png)

1. 웹후크를 트리거할 테스트 개체 항목을 추가합니다.

   이를 통해 Webhooks 모듈은 개체의 데이터 구조를 자동으로 결정할 수 있습니다.

1. 모듈이 개체의 데이터 구조를 성공적으로 결정했는지 확인하고 **확인** 을 클릭합니다.

   ![개체의 데이터 구조가 성공적으로 결정되었는지 확인합니다.](./using-make-to-sync-object-data-with-google-sheets/images/07.png)

   ```{note}
   개체의 구조가 변경되면 Webhooks 모듈 편집으로 돌아가서 *Redetermine data structure*를 클릭합니다.
   ```

1. **새 모듈 추가** 버튼을 클릭하고 **Google 스프레드시트** 모듈을 선택한 다음 **행 추가** 작업을 선택합니다.

   ![Google 스프레드시트를 선택합니다.](./using-make-to-sync-object-data-with-google-sheets/images/08.png)

   ![행 추가를 선택합니다.](./using-make-to-sync-object-data-with-google-sheets/images/09.png)

1. 새 모듈을 선택하고 **추가** 을 클릭하여 Google 계정을 연결합니다.

1. 연결 이름을 입력하고 **저장** 을 클릭합니다.

   그러면 원하는 Google 계정을 선택하고 계정 파일에 액세스할 수 있는 권한을 부여하는 창이 열립니다.

   ![Google 연결을 추가하십시오.](./using-make-to-sync-object-data-with-google-sheets/images/10.png)

   만들기 권한을 부여한 후 Google 스프레드시트 모듈 편집으로 돌아갑니다.

1. 모듈의 모드를 결정한 다음 원하는 **스프레드시트** 및 **시트** 을 선택하여 객체와 동기화하십시오.

1. 선택한 시트에 헤더가 포함되는지 여부를 나타냅니다.

1. 시트의 열을 개체 구조의 데이터 필드에 매핑합니다. 사용 가능한 개체 필드는 **Webhooks** 모듈에서 제공합니다.

   ![시트의 열을 개체 필드에 매핑합니다.](./using-make-to-sync-object-data-with-google-sheets/images/11.png)

1. **스케줄링** 및 **를 켜고** 시나리오를 저장합니다.

   ![예약을 켭니다.](./using-make-to-sync-object-data-with-google-sheets/images/12.png)

일단 저장되면 새 개체 항목 데이터가 선택한 시트에 추가됩니다.

## 시트 데이터를 개체에 동기화

Google 시트 데이터를 개체에 동기화하려면 다음 단계를 따르세요.

1. Make를 열고 시나리오 페이지로 이동한 다음 **새 시나리오 만들기** 을 클릭합니다.

   ![새 시나리오 만들기를 클릭합니다.](./using-make-to-sync-object-data-with-google-sheets/images/13.png)

1. **Add** 버튼을 클릭하고 **Google Sheets** 모듈을 선택한 다음 **Watch rows** 트리거를 선택합니다.

   이렇게 하면 시트에서 새 행을 감시하도록 모듈이 설정됩니다.

   ![Google 스프레드시트를 선택합니다.](./using-make-to-sync-object-data-with-google-sheets/images/14.png)

   ![감시 행을 선택합니다.](./using-make-to-sync-object-data-with-google-sheets/images/15.png)

1. 새 모듈을 선택하고 **추가** 을 클릭하여 Google 계정을 연결합니다.

1. 연결 이름을 입력하고 **저장** 을 클릭합니다.

   그러면 원하는 Google 계정을 선택하고 계정 파일에 액세스할 수 있는 권한을 부여하는 창이 열립니다.

   ![Google 연결을 추가하십시오.](./using-make-to-sync-object-data-with-google-sheets/images/16.png)

1. 원하는 **Spreadsheet** 및 **Sheet** 을 선택합니다.

1. 선택한 시트에 헤더가 포함되어 있는지 여부를 표시하고 감시할 열 범위를 입력합니다(예: `A1:E1` 은 A~E 열에 데이터 입력을 보냅니다.).

1. 한 실행 주기 동안 작업할 결과의 제한을 설정합니다.

1. 완료되면 **확인** 을 클릭합니다.

1. **새 모듈 추가** 버튼을 클릭하고 **HTTP** 모듈을 선택한 다음 **기본 인증 요청 만들기** 작업을 선택합니다.

   ![HTTP를 선택합니다.](./using-make-to-sync-object-data-with-google-sheets/images/17.png)

   ![기본 인증 요청 만들기를 선택합니다.](./using-make-to-sync-object-data-with-google-sheets/images/18.png)

   ```{important}
   기본 인증은 데모용으로만 사용됩니다. 비즈니스 사용 사례에 대해 보다 안전한 인증 방법을 사용합니다(예: *OAuth 2.0 요청하기*).
   ```

1. 새 모듈을 선택하고 **추가** 을 클릭하여 기본 인증 자격 증명을 추가합니다.

1. 추가되면 `https://<your-domain>/o/c/<objectname>/`형식을 사용하는 객체의 헤드리스 API URL을 입력합니다. 자세한 내용은 [헤드리스 프레임워크 통합](../../understanding-object-integrations/headless-framework-integration.md) 을 참조하십시오.

1. **포스트** 방법 유형을 선택합니다.

   ![자격 증명을 추가하고 개체의 헤드리스 API URL을 입력하고 게시 방법을 선택합니다.](./using-make-to-sync-object-data-with-google-sheets/images/19.png)

1. 원하는 본문 유형(예: **RAW**)과 요청에 대한 콘텐츠 유형(예: **JSON**)을 선택합니다.

1. 선택한 콘텐츠 유형 및 대상 개체에 적합한 형식을 사용하여 요청 본문을 입력합니다.

   ![기본 인증 요청 만들기를 선택합니다.](./using-make-to-sync-object-data-with-google-sheets/images/20.png)

1. **확인** 을 클릭합니다.

1. **스케줄링** 및 **를 켜고** 시나리오를 저장합니다.

   ![예약을 켜고 시나리오를 저장합니다.](./using-make-to-sync-object-data-with-google-sheets/images/21.png)

   ```{note}
   기본적으로 이 시나리오는 15분마다 자동으로 트리거됩니다. 
   ```

## 추가 정보

* [개체 개요](../../../objects.md)
* [객체 생성 및 관리](../../creating-and-managing-objects.md)
* [개체 통합 이해](../../understanding-object-integrations.md)