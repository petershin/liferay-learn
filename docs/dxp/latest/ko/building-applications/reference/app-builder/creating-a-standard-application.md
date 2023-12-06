# 표준 애플리케이션 생성

사용자 정의 개체를 기반으로 응용 프로그램을 만들려면 개체 만들기, 최소한 하나의 양식 보기 만들기, 최소한 하나의 테이블 보기 만들기 및 응용 프로그램 배포의 네 단계를 거쳐야 합니다.

* [사용자 정의 개체 만들기](#creating-a-custom-object)
* [양식 보기 만들기](#creating-form-views)
* [테이블 보기 만들기](#creating-table-views)
* [애플리케이션 배포](#deploying-the-application)

여기에서는 휴가 요청이라는 사용자 정의 개체를 지원하는 App Builder를 사용하여 두 가지 간단한 휴가 관리 애플리케이션을 만듭니다. 첫 번째 애플리케이션은 추가 요청 양식을 표시하는 휴가 요청자 위젯입니다. 사용자가 휴가를 요청하려는 경우 이 양식을 작성합니다. 두 번째 응용 프로그램은 관리 사용자가 휴가 요청을 보고 관리할 수 있는 제품 메뉴에 배포된 휴가 관리 응용 프로그램입니다.

## 사용자 정의 개체 만들기

1. 애플리케이션 메뉴(![애플리케이션 메뉴](../../../images/icon-applications-menu.png))를 열고 제어판 &rarr; 앱 빌더 &rarr; 사용자 정의 개체로 이동합니다.

1. 추가 버튼(![Add](../../../images/icon-add.png))을 클릭하세요.

1. 이름을 입력하세요: **Time Off Request** .

1. 개체에 대한 양식 보기를 만들고 개체에 있는 데이터 필드를 정의하려면 **계속 및 양식 보기 만들기** 설정을 선택한 상태로 두고 **계속** 을 클릭하세요.

   ![Creating a custom object is the first step to writing an App Builder application.](./creating-a-standard-application/images/01.png)

양식 보기를 생성하여 휴가 요청 개체에 포함할 데이터 필드를 정의합니다.

## 양식 보기 만들기

양식 보기는 사용자 정의 개체에 정의된 데이터를 입력하는 데 사용되는 시각적 인터페이스를 정의합니다. 애플리케이션에 필요한 만큼 양식 보기를 만들 수 있습니다. 휴가 요청자 및 관리자 애플리케이션에는 둘 사이에 하나의 양식 보기만 필요합니다.

1. 사용자 정의 개체를 엽니다(제어판 &rarr; 앱 빌더 &rarr; 사용자 정의 개체).

1. **양식 보기** 탭에서 추가 버튼을 클릭하세요. 양식 작성기가 나타납니다.

1. 양식 보기의 이름을 **Add Request** 로 지정합니다.

1. 스크린샷의 레이아웃을 사용하여 추가하세요.

   - **Name** 이라는 필수 텍스트 필드
   - **From** 이라는 필수 날짜 필드
   - **To** 라고 표시된 필수 날짜 필드
   - 여러 줄을 허용하는 **Comment** 라는 선택적 텍스트 필드

1. 양식 보기를 저장합니다.

   ![Use the form builder embedded inside the App Builder to create form views.](./creating-a-standard-application/images/02.png)

포함된 양식 작성기 외에도 사용자 정의 개체에 포함된 모든 필드(다른 양식 보기의 존재를 통해)를 왼쪽 사이드바의 양식 보기에 추가할 수 있습니다.

사용자가 애플리케이션의 데이터를 보고 상호 작용하는 방법을 정의하려면 테이블 뷰를 생성하세요.

## 테이블 보기 만들기

테이블 보기는 애플리케이션에 제출된 항목을 표시하고 관리(삭제, 편집)합니다. 양식 보기와 마찬가지로 개체에는 하나 이상의 테이블 보기가 있을 수 있습니다. 휴가 요청자 및 관리자 애플리케이션에는 둘 사이에 하나의 테이블 보기만 필요합니다.

1. 휴가 요청 개체(제어판 &rarr; 앱 빌더 &rarr; 사용자 정의 개체)를 엽니다.

1. 테이블 보기 탭에서 **추가** 버튼을 클릭하세요. 테이블 빌더가 나타납니다.

   ![Use the table builder embedded inside the App Builder to create table views.](./creating-a-standard-application/images/03.png)

1. 테이블 뷰 이름을 **Time Off Requests** 로 지정합니다.

1. 설명 필드를 제외하고 사용 가능한 모든 필드를 테이블 캔버스로 끌어 놓습니다.

1. 테이블 보기를 저장합니다.

```{note}
테이블 보기에 없더라도 설명 필드는 개별 레코드의 세부 정보 보기에 계속 나타납니다. 배포된 애플리케이션의 테이블 보기에서 특정 레코드를 클릭하면 세부 정보 보기가 표시됩니다.
```

## 애플리케이션 배포

애플리케이션을 배포하면 사용자가 애플리케이션에 액세스할 수 있습니다. 몇 가지 배포 옵션이 있습니다. 이에 대해 알아보려면 [App Builder](../app-builder.md#deployment) 개요를 참조하세요.

휴가 요청에는 페이지에 추가하기 위한 위젯 애플리케이션과 [제품 메뉴](../../../getting-started/navigating-dxp.md#product의 관리 애플리케이션) 라는 두 가지 앱을 배포해야 합니다. -메뉴), 추가 권한이 있는 사용자가 요청을 관리할 수 있습니다.

1. 휴가 요청을 엽니다(제어판 &rarr; 앱 빌더 &rarr; 사용자 정의 개체).

1. **Apps** 탭에서 추가 버튼(![Add](../../../images/icon-add.png))을 클릭하세요.

   ```{note}
   개체에 대한 'Workflow Powered' 앱을 생성하려면(DXP 구독자에게 제공) 애플리케이션 메뉴의 앱 항목에서 앱을 생성하고 배포해야 합니다. 자세한 내용은 [워크플로 기반 애플리케이션 만들기](./creating-a-workflow-powered-application.md)를 참조하세요.
   ```

1. 앱 이름을 **Time Off Requester** 로 지정합니다.

1. 양식 보기, 테이블 보기를 선택하고 앱에 대한 [배포 옵션](../app-builder.md#deployment) 을 구성합니다.

   휴가 요청자 애플리케이션의 경우 **Widget** 을 선택하고 **배포** 를 클릭합니다. 이제 휴가 요청자 위젯 애플리케이션을 페이지에 배포하고 사이트 사용자가 즉시 활용할 수 있습니다.

1. 동일한 절차에 따라 **Time Off Request Manager** 라는 두 번째 앱을 만듭니다. 이번에는 제품 메뉴에서 앱을 배포하도록 선택합니다(애플리케이션 메뉴에 추가하려면 기본 선택을 그대로 둡니다).

   ![Here's the Time Off Request Manage entry in the Applications Menu.](./creating-a-standard-application/images/04.png)

이제 관리자는 제품 메뉴의 휴가 관리자 애플리케이션에 액세스하여 사이트 사용자의 휴가 요청 모니터링을 시작할 수 있습니다.

## 애플리케이션 배포 취소

언제든지 App Builder 애플리케이션을 배포 취소하고 재배포할 수 있습니다(예: 새로운 휴가 관리 애플리케이션 세트가 생성된 경우). 애플리케이션 배포를 취소하면 이미 제출된 항목은 유지되지만 새 항목을 추가할 수는 없습니다.

1. 사용자 정의 개체를 엽니다(제어판 &rarr; 앱 빌더 &rarr; 사용자 정의 개체).

1. **Apps** 탭에서 배포 취소하려는 앱의 케밥 메뉴를 클릭하세요.

1. **배포 취소** 를 선택하세요.

## 데이터 레코드가 있는 개체 편집

데이터 레코드가 추가된 후에도 필드를 삭제, 추가 또는 편집할 수 있으며 App Builder는 데이터 손상이나 손실을 방지합니다.

### 필드 삭제

기존 데이터 레코드가 있는 개체에서 필드를 삭제하면 해당 필드가 UI에 표시되지 않지만 데이터는 삭제되지 않습니다. 삭제된 필드와 이름 및 유형이 동일한 필드를 생성하는 경우 해당 데이터를 이미 보유하고 있는 레코드에 대해 필드의 데이터가 복원됩니다.

기존 개체에서 필드를 제거하려면 개체 보기에서 해당 필드 위에 마우스를 놓고 **x** 를 클릭하세요. 확인 메시지가 표시되고 데이터 손실에 대한 경고가 표시됩니다.

![Deleting a field causes data loss for existing records.](./creating-a-standard-application/images/06.png)

### 필드 추가 및 편집

기존 필드를 추가하거나 편집하면 변경 사항은 추가 또는 편집 후에 추가된 레코드에만 영향을 미칩니다. 기존 레코드는 변경의 영향을 받지 않습니다.

기존 개체에 필드를 추가하려면 해당 양식 보기를 열고 양식 작성기의 왼쪽 창에 있는 **추가** 버튼을 클릭하세요.

![You can add a field directly to an existing object.](./creating-a-standard-application/images/05.png)

필드를 편집하려면 해당 양식 보기로 이동하고 양식 작성기에서 필드를 클릭하여 해당 속성을 표시합니다.

![You can edit a field from its form view.](./creating-a-standard-application/images/07.png)

## 관련 정보

* [앱 빌더 개요](../app-builder.md)
* [워크플로 기반 앱 만들기](./creating-a-workflow-powered-application.md)
