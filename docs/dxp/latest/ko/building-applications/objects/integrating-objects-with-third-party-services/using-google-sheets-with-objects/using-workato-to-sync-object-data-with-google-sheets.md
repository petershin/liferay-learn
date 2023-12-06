# Workato를 사용하여 Google 스프레드시트와 개체 데이터 동기화

{bdg-secondary}`라이프레이 7.4+`

여기서는 웹후크를 사용하여 [Workato](https://www.workato.com/) 을 사용하여 Liferay 개체와 Google 스프레드시트 간의 동기화 작업을 트리거하는 방법을 알아봅니다. 이러한 방식으로 데이터를 동기화하려면 Workato 계정, Google 스프레드시트 및 활성 DXP 7.4 인스턴스가 필요합니다. DXP 인스턴스에는 Google 스프레드시트로 데이터를 보내거나 받기 위해 원하는 필드가 포함된 게시된 개체도 있어야 합니다.

## 개체 데이터를 Google 시트에 동기화하기

개체 데이터를 Google 시트에 동기화하려면 다음 단계를 따르세요.

1. [Workato](https://www.workato.com/) 에 로그인하고 **프로젝트** 페이지로 이동합니다.

   ![Navigate to the Projects page.](./using-workato-to-sync-object-data-with-google-sheets/images/01.png)

1. **레시피** 페이지로 이동하여 **레시피 만들기** 를 클릭하세요.

   ![Navigate to the Recipes page and click Create Recipe.](./using-workato-to-sync-object-data-with-google-sheets/images/02.png)

1. 레시피 **이름** , **사이트** 를 입력하고 웹훅 **시작점에서** 트리거를 선택합니다. 그런 다음 **빌딩 시작** 을 클릭하세요.

   ![Enter a Name, Location and pick the starting point.](./using-workato-to-sync-object-data-with-google-sheets/images/03.png)

1. 설정 패널에서 **안내 설정 시작** 을 클릭합니다.

   ![Click Start guided setup.](./using-workato-to-sync-object-data-with-google-sheets/images/04.png)

1. **이벤트 이름** 을 입력하고 생성된 **웹훅 URL** 을 복사하세요.

   ![Enter an Event Name and click Next.](./using-workato-to-sync-object-data-with-google-sheets/images/05.png)

1. Liferay 인스턴스에서 복사된 URL을 사용하여 언제든지 웹훅 엔드포인트에 요청을 보내는 [객체 작업 정의](../../creating-and-managing-objects/actions/defining-object-actions.md) 새로운 개체 항목이 추가됩니다.

   ![Define an action that sends a request to the webhook endpoint whenever an entry is added.](./using-workato-to-sync-object-data-with-google-sheets/images/06.png)

1. **다음** 을 클릭하고 테스트 개체 항목을 추가하여 웹훅을 트리거합니다.

   이를 통해 웹훅 모듈은 객체의 데이터 구조를 자동으로 결정할 수 있습니다.

   ![Trigger the webhook.](./using-workato-to-sync-object-data-with-google-sheets/images/07.png)

1. 테스트를 통해 개체의 데이터 구조가 성공적으로 결정되었는지 확인하고 **웹훅 설정** 을 클릭하세요.

   ![Verify if the test successfully determined the object's data structure.](./using-workato-to-sync-object-data-with-google-sheets/images/08.png)

1. **작업** 의 경우 **앱에서의 작업** 을 선택하세요.

   ![For the Action, select Action in an app.](./using-workato-to-sync-object-data-with-google-sheets/images/09.png)

1. **Google 스프레드시트** 앱을 선택하세요.

    ![Select the Google Sheets app.](./using-workato-to-sync-object-data-with-google-sheets/images/10.png)

1. **행 추가** 작업을 선택합니다.

    ![Select the Add Row action.](./using-workato-to-sync-object-data-with-google-sheets/images/11.png)

1. 앱을 Google 계정에 연결하세요.

    ![Connect the app to a Google account.](./using-workato-to-sync-object-data-with-google-sheets/images/12.png)

1. 원하는 **스프레드시트** 와 **워크시트** 를 선택하여 개체와 동기화하세요.

    ![Select the desired Spreadsheet and Worksheet.](./using-workato-to-sync-object-data-with-google-sheets/images/13.png)

1. 시트의 열을 개체 구조의 데이터 필드에 매핑합니다.

    ![Map the Sheet's columns.](./using-workato-to-sync-object-data-with-google-sheets/images/14.png)

1. **저장** 을 클릭하세요.

    ![Click Save.](./using-workato-to-sync-object-data-with-google-sheets/images/15.png)

1. **자산** 페이지로 이동하여 **케밥 버튼** 을 클릭하고 **시작** 을 선택하여 레시피를 활성화하세요.

    ![Activate the recipe.](./using-workato-to-sync-object-data-with-google-sheets/images/16.png)

## 관련 주제

* [객체 개요](../../../objects.md)
* [객체 생성 및 관리](../../creating-and-managing-objects.md)
* [객체 통합 이해](../../understanding-object-integrations.md)
