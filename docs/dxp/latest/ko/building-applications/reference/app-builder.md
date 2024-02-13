---
toc:
  - ./app-builder/creating-a-standard-application.md
  - ./app-builder/creating-a-workflow-powered-application.md
  - ./app-builder/creating-the-role-change-request-object.md
  - ./app-builder/creating-the-role-change-request-app.md
---
# 앱 빌더

> 사용 가능: Liferay CE/DXP 7.3( [7.4에서 더 이상 사용되지 않고 제거됨](../../installation-and-upgrades/upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-4.md# 7-4에서 더 이상 사용되지 않는 기능) )

App Builder는 Liferay DXP용 로우코드 애플리케이션 개발 솔루션입니다. 데이터 모델을 구축하고 애플리케이션의 양식(데이터 입력용)과 테이블(데이터 기록 보기 및 관리용)을 정의한 다음 애플리케이션을 사이트에 배포하거나 완전히 독립형 애플리케이션으로 배포합니다. App Builder를 사용하면 단 한 줄의 코드 없이도 전용 사용자 인터페이스와 데이터 분리 기능을 갖춘 기능적인 비즈니스 애플리케이션을 만들 수 있습니다.

![Two separate applications are deployed for this App Builder object.](./app-builder/images/01.png)

[Liferay Forms](../../process-automation/forms/introduction-to-forms.md) 애플리케이션에 유사한 양식 작성 기능이 포함되어 있는데 App Builder를 사용하는 이유는 무엇입니까? 차이점에 대한 개요는 다음과 같습니다.

| 능력                              | 라이프레이 양식 | 앱 빌더 |
| ------------------------------- | :------: | :--: |
| 간단하거나 복잡한 양식 만들기                |     ✔    |   ✔  |
| 위젯이나 전용 URL에 양식 배포              |     ✔    |   ✔  |
| 양식 데이터를 다른 양식의 데이터와 별도로 유지      |          |   ✔  |
| 제품 메뉴에 양식 배포                    |          |   ✔  |
| 수집된 데이터를 여러 곳에 표시               |          |   ✔  |
| 양식 데이터 표시 제어                    |          |   ✔  |
| 하나의 데이터 개체에 대해 여러 양식 배포         |          |   ✔  |
| 하나의 데이터 개체에 대해 여러 데이터 레코드 보기 배포 |          |   ✔  |

App Builder는 단일 데이터 개체로 지원되는 데이터 표시 테이블, 유연한 배포 옵션, 양식 결합 등을 제공하여 양식 이상의 기능을 제공합니다.

## 앱 만들기

App Builder는 Standard와 Workflow Powered의 두 가지 형태로 제공됩니다. App Builder로 만들어진 모든 앱은 App Builder UI에 정의된 세 가지 구성 요소인 개체, 양식 보기 및 테이블 보기로 구성됩니다. 애플리케이션 구축으로 바로 건너뛰려면 [App Builder로 애플리케이션 생성](./app-builder/creating-a-standard-application.md)을 참조하세요.

### 앱 빌더 개체

**Object** 는 모든 App Builder 애플리케이션의 기초입니다. 이는 애플리케이션이 수집하고 관리하는 정보를 정의합니다. 예를 들어 방명록 개체에는 최소한 **Name** 필드와 **Message** 필드가 포함됩니다.

개체를 기반으로 애플리케이션을 생성할 때 하나 이상의 양식 보기와 테이블 보기를 생성하고 애플리케이션을 배포합니다.

기본 개체에는 기본적으로 제공되는 데이터 필드가 포함되어 있습니다. 양식 보기를 생성하는 동시에 사용자 정의 개체의 데이터 필드를 정의할 수 있습니다.

### 양식 보기

양식 보기는 사용자가 작성해야 하는 개체의 데이터 필드를 정의합니다. Liferay Forms 애플리케이션의 양식 작성 도구는 이를 위해 용도가 변경되었습니다. App Builder 개체에는 여러 양식 보기가 있을 수 있습니다.

양식 보기에 필드를 추가하면 자동으로 개체에 추가됩니다. 양식 뷰어의 필드 목록에서 필드를 끌어 이전에 생성된 양식 보기를 통해 개체에 추가된 필드를 재사용할 수 있습니다.

### 테이블 보기

테이블 보기에는 개체에 대해 수집된 데이터 레코드가 표시됩니다. 또한 권한이 있는 사람은 **새 항목 추가** 기능에 액세스하고, 항목의 세부정보를 확인하고, 애플리케이션 항목을 관리할 수 있습니다. 테이블 보기에는 개체 필드 전체 또는 일부가 표시될 수 있습니다. 모든 앱에는 테이블 보기가 하나 이상 있지만 개체에는 필요한 만큼 테이블 보기가 있을 수 있습니다. 끌어서 놓기 인터페이스를 사용하면 기존 필드에서 테이블 보기를 쉽게 만들 수 있습니다.

## 전개

개체가 정의되고 하나 이상의 양식 및 테이블 보기가 생성되면 응용 프로그램을 배포할 수 있습니다. 여러 배포 옵션이 있습니다.

**위젯:** 위젯 메뉴에 애플리케이션을 배포하고 위젯 추가 메뉴를 사용하여 페이지에 추가합니다(Add &rarr; Widgets에서 이름으로 애플리케이션 검색). 위젯으로 배포하면 실제로 애플리케이션의 세 가지 변형이 위젯 추가 메뉴에 배포되며 각각 다른 레이블이 지정됩니다. 각 옵션은 다양한 기능을 제공합니다.

| 위젯 메뉴 라벨       | 양식 항목 제출 | 전망 입장 | 항목 업데이트 및 삭제 |
| -------------- | :------: | :---: | :----------: |
| 앱 이름           |     ✔    |   ✔   |       ✔      |
| 앱 이름 [양식 보기]  |     ✔    |       |              |
| 앱 이름 [테이블 보기] |          |   ✔   |       ✔      |

![App Builder widgets are placed on pages.](./app-builder/images/03.png)

**독립형:** 사이트의 일부가 아니고 탐색 메뉴에 표시되지 않는 전용 페이지에 애플리케이션을 배포합니다. 이는 링크가 있는 사용자만 액세스할 수 있도록 제한합니다.

![Standalone App Builder applications are accessible only by direct link](./app-builder/images/04.png)

**제품 메뉴:** 제어판, 사이트 메뉴 또는 둘 다에 애플리케이션을 배포합니다. 이를 통해 애플리케이션에 액세스할 수 있는 관리 사용자를 유연하게 결정할 수 있습니다.

![App Builder applications can be added to the Product Menu.](./app-builder/images/02.png)

독립형 또는 제품 메뉴 애플리케이션에는 항상 양식과 테이블 보기가 모두 포함됩니다. 테이블 보기는 기본 보기이고, 추가 버튼을 누르면 양식 보기에 액세스할 수 있습니다.

## 다음 단계

* [App Builder로 애플리케이션 생성](./app-builder/creating-a-standard-application.md)
* [워크플로 기반 애플리케이션 생성](./app-builder/creating-a-workflow-powered-application.md)

```{raw} html
:file: ../../landingpage_template.html
```

```{raw} html
:file: app-builder/landing.html
```
