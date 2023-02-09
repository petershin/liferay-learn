# IFTTT를 사용하여 개체 데이터를 Google 스프레드시트와 동기화

{bdg-secondary}`가능 7.4+`

여기서는 Webhook을 사용하여 [IFTTT](https://ifttt.com/)을 사용하여 Liferay 개체와 Google 스프레드시트 간에 동기화 작업을 트리거하는 방법을 배웁니다. 이러한 방식으로 데이터를 동기화하려면 IFTTT 계정, Google 스프레드시트 및 활성 DXP 7.4 인스턴스가 필요합니다. DXP 인스턴스에는 Google 스프레드시트로 데이터를 보내거나 받기 위해 원하는 필드가 있는 게시된 개체도 있어야 합니다.

## 개체 데이터를 Google 시트에 동기화

개체 데이터를 Google 시트에 동기화하려면 다음 단계를 따르세요.

1. [IFTTT](https://ifttt.com/) 에 로그인하고 *만들기*을 클릭합니다.

    ![만들기를 클릭합니다.](./using-ifttt-to-sync-object-data-with-google-sheets/images/01.png)

1. *If This* 단계에 대해 *추가* 을 클릭합니다.

    ![If This 단계에 대해 추가를 클릭합니다.](./using-ifttt-to-sync-object-data-with-google-sheets/images/02.png)

1. *Webhook*을 선택합니다.

    ![웹후크를 선택합니다.](./using-ifttt-to-sync-object-data-with-google-sheets/images/03.png)

1. 트리거 유형에 대해 *웹 요청 수신*을 클릭합니다.

    ![트리거 유형을 선택합니다.](./using-ifttt-to-sync-object-data-with-google-sheets/images/04.png)

1. *이벤트 이름* 을 입력하고 *트리거 생성*을 클릭합니다.

    ![이벤트 이름을 입력하고 트리거 생성을 클릭합니다.](./using-ifttt-to-sync-object-data-with-google-sheets/images/05.png)

1. *Then That* 단계에 대해 *추가* 을 클릭합니다.

    ![Then That 단계에 대해 추가를 클릭합니다.](./using-ifttt-to-sync-object-data-with-google-sheets/images/06.png)

1. *Google 스프레드시트*을 선택합니다.

    ![Google 스프레드시트를 검색하여 선택합니다.](./using-ifttt-to-sync-object-data-with-google-sheets/images/07.png)

1. 작업 유형의 경우 *스프레드시트에 행 추가*을 클릭합니다.

    ![스프레드시트에 행 추가를 클릭합니다.](./using-ifttt-to-sync-object-data-with-google-sheets/images/08.png)

1. 작업을 구성하고 *작업 만들기*을 클릭합니다.

    ![작업을 구성합니다.](./using-ifttt-to-sync-object-data-with-google-sheets/images/09.png)

    ```{note}
    Google 계정을 연결할 때 원하는 Google 계정을 선택하고 계정 파일에 액세스할 수 있는 IFTTT 권한을 부여하는 창이 열립니다.
    ```

1. *계속*을 클릭합니다.

    ![계속을 클릭합니다.](./using-ifttt-to-sync-object-data-with-google-sheets/images/10.png)

1. 검토하고 *마침*을 클릭합니다.

    ![검토하고 마침을 클릭합니다.](./using-ifttt-to-sync-object-data-with-google-sheets/images/11.png)

1. 프로세스를 마치면 *애플릿*이 이미 *연결*된 것입니다.

    ![검토하고 마침을 클릭합니다.](./using-ifttt-to-sync-object-data-with-google-sheets/images/12.png)

1. 생성되면 *Webhook 아이콘* &rarr; *Documentation* 를 클릭하고 생성된 *Webhook URL*을 복사합니다.

    ![웹후크 아이콘을 클릭합니다.](./using-ifttt-to-sync-object-data-with-google-sheets/images/13.png)

    ![생성된 웹훅 URL을 복사합니다.](./using-ifttt-to-sync-object-data-with-google-sheets/images/14.png)

1. Liferay 인스턴스에서 복사된 URL을 사용하여 새 개체 항목이 추가될 때마다 웹후크 엔드포인트에 요청을 보내는 개체 작업 [을 정의](../../creating-and-managing-objects/actions/defining-object-actions.md).

    ![항목이 추가될 때마다 Webhook 끝점에 요청을 보내는 작업을 정의합니다.](./using-ifttt-to-sync-object-data-with-google-sheets/images/15.png)

## 추가 정보

* [개체 개요](../../../objects.md)
* [객체 생성 및 관리](../../creating-and-managing-objects.md)
* [개체 통합 이해](../../understanding-object-integrations.md)