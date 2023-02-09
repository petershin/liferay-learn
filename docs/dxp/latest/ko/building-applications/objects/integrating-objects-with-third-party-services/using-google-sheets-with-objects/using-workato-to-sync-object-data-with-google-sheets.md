# Workato를 사용하여 객체 데이터를 Google 스프레드시트와 동기화

{bdg-secondary}`가능 7.4+`

여기서는 Webhook을 사용하여 [Workato](https://www.workato.com/)을 사용하여 Liferay Objects와 Google Sheets 간에 동기화 작업을 트리거하는 방법을 배웁니다. 이러한 방식으로 데이터를 동기화하려면 Workato 계정, Google 스프레드시트 및 활성 DXP 7.4 인스턴스가 필요합니다. DXP 인스턴스에는 Google 스프레드시트로 데이터를 보내거나 받기 위해 원하는 필드가 있는 게시된 개체도 있어야 합니다.

## 개체 데이터를 Google 시트에 동기화

개체 데이터를 Google 시트에 동기화하려면 다음 단계를 따르세요.

1. [Workato](https://www.workato.com/) 에 로그인하고 *프로젝트* 페이지로 이동합니다.

   ![프로젝트 페이지로 이동합니다.](./using-workato-to-sync-object-data-with-google-sheets/images/01.png)

1. *레시피* 페이지로 이동하고 *레시피 생성*을 클릭합니다.

   ![레시피 페이지로 이동하여 레시피 만들기를 클릭합니다.](./using-workato-to-sync-object-data-with-google-sheets/images/02.png)

1. 레시피 *이름*, *사이트*를 입력하고 *웹후크에서 트리거* 시작점을 선택합니다. 그런 다음 *빌딩 시작*을 클릭합니다.

   ![이름, 사이트를 입력하고 시작점을 선택합니다.](./using-workato-to-sync-object-data-with-google-sheets/images/03.png)

1. 설정 패널에서 *가이드 설정 시작*을 클릭합니다.

   ![안내 설정 시작을 클릭합니다.](./using-workato-to-sync-object-data-with-google-sheets/images/04.png)

1. *이벤트 이름* 을 입력하고 생성된 *웹후크 URL*을 복사합니다.

   ![이벤트 이름을 입력하고 다음을 클릭합니다.](./using-workato-to-sync-object-data-with-google-sheets/images/05.png)

1. Liferay 인스턴스에서 복사된 URL을 사용하여 새 개체 항목이 추가될 때마다 웹후크 엔드포인트에 요청을 보내는 개체 작업 [을 정의](../../creating-and-managing-objects/actions/defining-object-actions.md).

   ![항목이 추가될 때마다 Webhook 끝점에 요청을 보내는 작업을 정의합니다.](./using-workato-to-sync-object-data-with-google-sheets/images/06.png)

1. *다음* 을 클릭하고 테스트 개체 항목을 추가하여 웹후크를 트리거합니다.

   이렇게 하면 webhook 모듈이 개체의 데이터 구조를 자동으로 결정할 수 있습니다.

   ![웹후크를 트리거합니다.](./using-workato-to-sync-object-data-with-google-sheets/images/07.png)

1. 테스트가 개체의 데이터 구조를 성공적으로 결정했는지 확인하고 *Setup Webhook*을 클릭합니다.

   ![테스트가 개체의 데이터 구조를 성공적으로 결정했는지 확인합니다.](./using-workato-to-sync-object-data-with-google-sheets/images/08.png)

1. *Action*에 대해 *Action in an app*을 선택합니다.

   ![작업의 경우 앱에서 작업을 선택합니다.](./using-workato-to-sync-object-data-with-google-sheets/images/09.png)

1. *Google 스프레드시트* 앱을 선택합니다.

   ![Google 스프레드시트 앱을 선택합니다.](./using-workato-to-sync-object-data-with-google-sheets/images/10.png)

1. *행* 추가 조치를 선택하십시오.

   ![행 추가 조치를 선택하십시오.](./using-workato-to-sync-object-data-with-google-sheets/images/11.png)

1. 앱을 Google 계정에 연결합니다.

   ![앱을 Google 계정에 연결합니다.](./using-workato-to-sync-object-data-with-google-sheets/images/12.png)

1. 개체와 동기화할 원하는 *스프레드시트* 및 *워크시트* 을 선택합니다.

   ![원하는 스프레드시트와 워크시트를 선택합니다.](./using-workato-to-sync-object-data-with-google-sheets/images/13.png)

1. 시트의 열을 개체 구조의 데이터 필드에 매핑합니다.

   ![시트의 열을 매핑합니다.](./using-workato-to-sync-object-data-with-google-sheets/images/14.png)

1. *저장*을 클릭합니다.

   ![저장을 클릭합니다.](./using-workato-to-sync-object-data-with-google-sheets/images/15.png)

1. *자산* 페이지로 이동하여 *케밥 버튼* 을 클릭하고 *시작* 를 선택하여 레시피를 활성화합니다.

   ![레시피를 활성화합니다.](./using-workato-to-sync-object-data-with-google-sheets/images/16.png)

## 추가 정보

* [개체 개요](../../../objects.md)
* [객체 생성 및 관리](../../creating-and-managing-objects.md)
* [개체 통합 이해](../../understanding-object-integrations.md)