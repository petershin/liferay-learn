# IFTTT를 사용하여 Google 스프레드시트와 개체 데이터 동기화

{bdg-secondary}`라이프레이 7.4+`

여기서는 웹후크를 사용하여 [IFTTT](https://ifttt.com/) 을 사용하여 Liferay 개체와 Google 스프레드시트 간의 동기화 작업을 트리거하는 방법을 알아봅니다. 이러한 방식으로 데이터를 동기화하려면 IFTTT 계정, Google 스프레드시트 및 활성 DXP 7.4 인스턴스가 필요합니다. DXP 인스턴스에는 Google 스프레드시트로 데이터를 보내거나 받기 위해 원하는 필드가 포함된 게시된 개체도 있어야 합니다.

## 개체 데이터를 Google 시트에 동기화하기

개체 데이터를 Google 시트에 동기화하려면 다음 단계를 따르세요.

1. [IFTTT](https://ifttt.com/) 에 로그인하고 **만들기** 를 클릭하세요.

   ![Click Create.](./using-ifttt-to-sync-object-data-with-google-sheets/images/01.png)

1. **If This** 단계에서 **추가** 를 클릭하세요.

   ![Click Add for the If This step.](./using-ifttt-to-sync-object-data-with-google-sheets/images/02.png)

1. **웹훅** 을 선택합니다.

   ![Select Webhooks.](./using-ifttt-to-sync-object-data-with-google-sheets/images/03.png)

1. 트리거 유형의 경우 **웹 요청 받기** 를 클릭하세요.

   ![Select a trigger type.](./using-ifttt-to-sync-object-data-with-google-sheets/images/04.png)

1. **이벤트 이름** 을 입력하고 **트리거 만들기** 를 클릭하세요.

   ![Enter an Event Name and click Create Trigger.](./using-ifttt-to-sync-object-data-with-google-sheets/images/05.png)

1. **Then That** 단계에서 **추가** 를 클릭하세요.

   ![Click add for the Then That step.](./using-ifttt-to-sync-object-data-with-google-sheets/images/06.png)

1. **Google 스프레드시트** 를 선택합니다.

   ![Search for and select Google Sheets.](./using-ifttt-to-sync-object-data-with-google-sheets/images/07.png)

1. 작업 유형의 경우 **스프레드시트에 행 추가** 를 클릭하세요.

   ![Click add row to spreadsheet.](./using-ifttt-to-sync-object-data-with-google-sheets/images/08.png)

1. 작업을 구성하고 **작업 만들기** 를 클릭합니다.

   ![Configure the action.](./using-ifttt-to-sync-object-data-with-google-sheets/images/09.png)

   ```{note}
   Google 계정을 연결하면 원하는 Google 계정을 선택하고 계정 파일에 액세스할 수 있는 IFTTT 권한을 부여하는 창이 열립니다.
   ```

1. **계속** 을 클릭하세요.

    ![Click Continue.](./using-ifttt-to-sync-object-data-with-google-sheets/images/10.png)

1. 검토하고 **마침** 을 클릭하세요.

    ![Review and click Finish.](./using-ifttt-to-sync-object-data-with-google-sheets/images/11.png)

1. 프로세스가 완료되면 **애플릿** 이 이미 **연결** 되어 있습니다.

    ![Review and click Finish.](./using-ifttt-to-sync-object-data-with-google-sheets/images/12.png)

1. 생성되면 **웹훅 아이콘** &rarr; **문서** 를 클릭하고 생성된 **웹훅 URL** 을 복사하세요.

    ![Click the webhook icon.](./using-ifttt-to-sync-object-data-with-google-sheets/images/13.png)

    ![Copy the generated webhook URL.](./using-ifttt-to-sync-object-data-with-google-sheets/images/14.png)

1. Liferay 인스턴스에서 복사된 URL을 사용하여 언제든지 웹훅 엔드포인트에 요청을 보내는 [객체 작업 정의](../../creating-and-managing-objects/actions/defining-object-actions.md) 새로운 개체 항목이 추가됩니다.

    ![Define an action that sends a request to the webhook endpoint whenever an entry is added.](./using-ifttt-to-sync-object-data-with-google-sheets/images/15.png)

## 관련 주제

* [객체 개요](../../../objects.md)
* [객체 생성 및 관리](../../creating-and-managing-objects.md)
* [객체 통합 이해](../../understanding-object-integrations.md)
