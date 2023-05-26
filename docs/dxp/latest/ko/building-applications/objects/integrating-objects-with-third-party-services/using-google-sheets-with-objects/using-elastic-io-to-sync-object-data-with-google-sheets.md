# Elastic.io를 사용하여 객체 데이터를 Google 스프레드시트와 동기화

{bdg-secondary}`가능 7.4+`

데이터 통합 도구와 함께 Liferay 객체를 사용하여 객체 데이터를 외부 서비스와 동기화하기 위한 자동화된 작업을 생성할 수 있습니다. 이러한 작업은 웹후크를 사용하여 트리거되며 Google 애플리케이션, Microsoft Office 등에 연결할 수 있습니다.

여기서는 Webhook을 사용하여 [Elastic.io](https://www.elastic.io/) 을 사용하여 Liferay 객체와 Google 스프레드시트 간에 동기화 작업을 트리거하는 방법을 배웁니다. 이러한 방식으로 데이터를 동기화하려면 Elastic.io 계정, Google 스프레드시트 및 활성 DXP 7.4 인스턴스가 필요합니다. DXP 인스턴스에는 Google 스프레드시트로 데이터를 보내거나 받기 위해 원하는 필드가 있는 게시된 개체도 있어야 합니다.

## 개체 데이터를 Google 시트에 동기화

개체 데이터를 Google 시트에 동기화하려면 다음 단계를 따르세요.

1. [Elastic.io](https://www.elastic.io/) 에 로그인하고 **Integrate** 페이지로 이동한 다음 **Flows** 를 클릭합니다.

   ![통합 페이지로 이동하고 흐름을 클릭합니다.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/01.png)

1. **새 흐름 추가** 을 클릭합니다.

   ![새 흐름을 추가합니다.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/02.png)

1. **초기 트리거 추가** 을 클릭합니다.

   ![초기 트리거를 추가합니다.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/03.png)

1. **Trigger** 에 대해 **Webhook** 구성 요소를 선택합니다.

   ![Webhook을 검색하여 선택합니다.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/04.png)

1. 생성된 **Webhook URL** 을 복사합니다.

   ![생성된 Webhook URL을 복사합니다.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/05.png)

1. Liferay 인스턴스에서 복사된 URL을 사용하여 새 개체 항목이 추가될 때마다 웹후크 엔드포인트에 요청을 보내는 개체 작업 [을 정의](../../creating-and-managing-objects/actions/defining-object-actions.md).

   ![항목이 추가될 때마다 Webhook 끝점에 요청을 보내는 작업을 정의합니다.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/06.png)

1. 웹후크를 트리거할 테스트 개체 항목을 추가합니다.

   이렇게 하면 Webhook 구성 요소가 개체의 데이터 구조를 자동으로 결정할 수 있습니다.

1. **샘플 요청 보내기** 버튼을 클릭합니다.

   ![샘플 요청 보내기 버튼을 클릭합니다.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/07.png)

1. 테스트가 개체의 데이터 구조를 성공적으로 결정했는지 확인합니다. 웹후크 URL로 전송된 데이터가 발견되면 단계에 성공했음이 표시됩니다.

   ![테스트가 성공했는지 확인합니다.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/08.png)

1. **새 작업 추가** 을 클릭합니다.

   ![새 작업을 추가합니다.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/09.png)

1. **Action** 에 대해 **Google Sheets** 구성요소를 선택합니다.

   ![Google 스프레드시트 구성요소를 선택합니다.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/10.png)

1. **스프레드시트 행** 추가 기능을 선택합니다.

   ![스프레드시트 행 추가 기능을 선택합니다.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/11.png)

1. 개체와 동기화할 원하는 **스프레드시트** 및 **워크시트** 을 선택합니다.

   ![개체와 동기화할 스프레드시트 및 시트를 선택합니다.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/12.png)

1. 선택한 시트에 헤더가 포함되는지 여부를 나타냅니다.

   ![선택한 시트에 헤더가 포함되는지 여부를 나타냅니다.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/13.png)

1. 시트의 열을 개체 구조의 데이터 필드에 매핑합니다.

   ![시트의 열을 개체 필드에 매핑합니다.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/14.png)

1. **Google 스프레드시트** 에서 샘플 검색 버튼을 클릭합니다.

   ![Google 스프레드시트에서 샘플 검색 버튼을 클릭합니다.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/15.png)

1. 테스트가 성공했는지 확인합니다.

   ![테스트가 성공했는지 확인합니다.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/16.png)

1. **초안 게시** 을 클릭합니다.

   ![초안 게시를 클릭합니다.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/17.png)

1. **흐름 시작** 을 클릭하여 새 흐름을 활성화합니다.

   ![흐름 시작을 클릭합니다.](./using-elastic-io-to-sync-object-data-with-google-sheets/images/18.png)

## 관련 주제

* [개체 개요](../../../objects.md)
* [객체 생성 및 관리](../../creating-and-managing-objects.md)
* [개체 통합 이해](../../understanding-object-integrations.md)