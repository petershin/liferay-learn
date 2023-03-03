# Wyzebulb를 사용하여 개체 데이터를 Google 스프레드시트와 동기화

{bdg-secondary}`가능 7.4+`

여기서는 Webhook을 사용하여 [Wyzebulb](https://www.wyzebulb.com/) 을 사용하여 Liferay Objects와 Google Sheets 간의 동기화 작업을 트리거하는 방법을 배웁니다. 이러한 방식으로 데이터를 동기화하려면 Wyzebulb 계정, Google 스프레드시트 및 활성 DXP 7.4 인스턴스가 필요합니다. DXP 인스턴스에는 Google 스프레드시트로 데이터를 보내거나 받기 위해 원하는 필드가 있는 게시된 개체도 있어야 합니다.

## 개체 데이터를 Google 시트에 동기화

개체 데이터를 Google 시트에 동기화하려면 다음 단계를 따르세요.

1. [Wyzebulb](https://www.wyzebulb.com/) 에 로그인하고 흐름을 만듭니다.

1. 트리거의 경우 *Webhooks* 앱을 선택합니다.

    ![트리거할 앱을 선택합니다.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/01.png)

    ![웹후크를 선택합니다.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/02.png)

1. *Catch Hook* 트리거를 선택하고 *저장 + 계속을 클릭합니다.*

    ![Catch Hook 트리거를 선택합니다.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/03.png)

    ![저장하고 계속하기를 클릭합니다.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/04.png)

1. *Webhooks URL* 을 클릭하고 생성된 URL을 복사합니다.

    ![Webhook URL을 선택합니다.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/05.png)

    ![웹후크 URL을 복사합니다.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/06.png)

1. Liferay 인스턴스에서 복사된 URL을 사용하여 새 개체 항목이 추가될 때마다 웹후크 엔드포인트에 요청을 보내는 개체 작업 [을 정의](../../creating-and-managing-objects/actions/defining-object-actions.md).

    ![항목이 추가될 때마다 Webhook 끝점에 요청을 보내는 작업을 정의합니다.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/07.png)

1. 웹후크를 트리거할 테스트 개체 항목을 추가합니다.

   이를 통해 Webhooks 모듈은 개체의 데이터 구조를 자동으로 결정할 수 있습니다.

1. 테스트가 성공했는지 확인하고 *저장 + 계속*을 클릭합니다.

    ![성공적인 테스트.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/08.png)

1. *작업*에 대해 *Google 스프레드시트* 앱을 선택합니다.

    ![앱을 클릭하여 앱을 선택합니다.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/09.png)

    ![Google 스프레드시트를 선택합니다.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/10.png)

1. *Google 스프레드시트에서 새 행 만들기* 작업을 선택하고 *저장 + 계속*을 클릭합니다.

    ![조치를 선택하려면 조치를 클릭하십시오.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/11.png)

    ![Google 스프레드시트에서 새 행 만들기를 선택합니다.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/12.png)

1. Google 스프레드시트 앱을 Google 계정에 연결합니다.

    ![Google 시트 앱을 Google 계정에 연결합니다.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/13.png)

1. 원하는 *스프레드시트* 및 *워크시트*을 선택합니다.

    ![원하는 스프레드시트와 워크시트를 선택합니다.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/14.png)

1. 시트의 열을 개체 구조의 데이터 필드에 매핑합니다.

    ![시트의 열을 개체 필드에 매핑합니다.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/15.png)

1. *Test Action* 버튼을 클릭하고 테스트가 성공했는지 확인합니다.

    ![성공적인 테스트.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/16.png)

1. *My Flows* 페이지로 이동하여 흐름이 실행 중인지 확인합니다.

    ![흐름이 실행 중인지 확인합니다.](./using-wyzebulb-to-sync-object-data-with-google-sheets/images/17.png)

## 추가 정보

* [개체 개요](../../../objects.md)
* [객체 생성 및 관리](../../creating-and-managing-objects.md)
* [개체 통합 이해](../../understanding-object-integrations.md)