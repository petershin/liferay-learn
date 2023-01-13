# Automate.io를 사용하여 개체 데이터를 Google 스프레드시트와 동기화

{bdg-secondary}`가능 7.4+`

여기에서는 Webhook을 사용하여 [Automate.io](https://automate.io/)을 사용하여 Liferay Objects와 Google Sheets 간에 동기화 작업을 트리거하는 방법을 배웁니다. 이러한 방식으로 데이터를 동기화하려면 프리미엄 Automate.io 계정, Google 스프레드시트 및 활성 DXP 7.4 인스턴스가 필요합니다. DXP 인스턴스에는 Google 스프레드시트로 데이터를 보내거나 받기 위해 원하는 필드가 있는 게시된 개체도 있어야 합니다.

## 개체 데이터를 Google 시트에 동기화

개체 데이터를 Google 시트에 동기화하려면 다음 단계를 따르세요.

1. [Automate.io](https://automate.io/) 에 로그인하고 *Create a Bot*을 클릭합니다.

   ![Automate.io를 열고 봇 만들기를 클릭합니다.](./using-automate-io-to-sync-object-data-with-google-sheets/images/01.png)

1. *Trigger* 단계에서 *Webhooks* 앱을 선택합니다.

   ![웹후크를 선택합니다.](./using-automate-io-to-sync-object-data-with-google-sheets/images/02.png)

   ```{note}
   웹후크는 프리미엄 Automate.io 기능입니다.
   ```

1. *Trigger Event*에 대해 *Incoming Hook*을 선택합니다.

   ![수신 후크를 선택합니다.](./using-automate-io-to-sync-object-data-with-google-sheets/images/03.png)

1. 생성된 *webhook URL*을 복사합니다.

   ![Webhook URL을 복사합니다.](./using-automate-io-to-sync-object-data-with-google-sheets/images/04.png)

1. Liferay 인스턴스에서 복사된 URL을 사용하여 새 개체 항목이 추가될 때마다 웹후크 엔드포인트에 요청을 보내는 개체 작업 [을 정의](../../creating-and-managing-objects/actions/defining-object-actions.md).

   ![항목이 추가될 때마다 Webhook 끝점에 요청을 보내는 작업을 정의합니다.](./using-automate-io-to-sync-object-data-with-google-sheets/images/05.png)

1. 웹후크를 트리거할 테스트 개체 항목을 추가합니다.

   이렇게 하면 Automate.io 봇의 Webhooks 앱이 개체의 데이터 구조를 자동으로 결정할 수 있습니다.

1. *작업* 단계의 경우 *Google 스프레드시트* 앱을 선택합니다.

   ![Google 스프레드시트를 선택합니다.](./using-automate-io-to-sync-object-data-with-google-sheets/images/06.png)

1. *승인* 을 클릭하여 앱을 Google 계정과 연결합니다.

   ![연결할 Google 계정을 선택하세요.](./using-automate-io-to-sync-object-data-with-google-sheets/images/07.png)

1. 조치 필드에 대해 *행 추가*을 선택하십시오.

   ![행 추가를 선택합니다.](./using-automate-io-to-sync-object-data-with-google-sheets/images/08.png)

1. 개체와 동기화할 원하는 *스프레드시트* 및 *워크시트* 을 선택하고 *저장*을 클릭합니다.

   ![원하는 스프레드시트와 워크시트를 선택합니다.](./using-automate-io-to-sync-object-data-with-google-sheets/images/09.png)

1. *귀하의 봇을* 켜십시오.

   ![봇을 켭니다.](./using-automate-io-to-sync-object-data-with-google-sheets/images/10.png)

1. 봇을 테스트하기 위해 개체 항목을 추가합니다.

   ![라이브 데이터를 사용하여 봇을 테스트합니다.](./using-automate-io-to-sync-object-data-with-google-sheets/images/11.png)

1. 봇이 개체 데이터를 성공적으로 수신하고 Google 스프레드시트 작업을 트리거했는지 확인합니다.

   ![테스트가 성공했는지 확인합니다.](./using-automate-io-to-sync-object-data-with-google-sheets/images/12.png)

## 추가 정보

* [개체 개요](../../../objects.md)
* [객체 생성 및 관리](../../creating-and-managing-objects.md)
* [개체 통합 이해](../../understanding-object-integrations.md)