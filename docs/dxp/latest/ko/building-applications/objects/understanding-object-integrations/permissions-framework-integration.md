# 권한 프레임워크 통합

{bdg-secondary}`liferay 7.4+`

게시된 개체는 Liferay의 권한 프레임워크와 자동으로 통합됩니다. [애플리케이션](#application-permissions) 및 [리소스](#resource-permissions) 권한을 사용하여 객체 및 해당 항목에 대한 사용자 액세스를 관리할 수 있습니다. 역할 기반 액세스 제어를 사용하면 적절한 사용자만 애플리케이션의 데이터를 보고 사용하도록 할 수 있습니다.

기본적으로 사용자 정의 개체 권한은 사용자 역할에 자동으로 할당되지 않습니다. 이는 객체 데이터가 실수로 노출되는 것을 방지하기 위한 것입니다. 액세스 권한을 부여하려면 원하는 역할에 개체 권한을 수동으로 할당하세요.

역할 권한을 정의할 때 활성 개체는 해당 범위 및 패널 링크에 따라 표시됩니다. 설정된 패널 링크가 없으면 사용자 정의 개체가 역할 UI에 표시되지 않습니다. [계정 제한 개체](../creating-and-managing-objects/using-system-objects-with-custom-objects/restricting-access-to-object-data-by-account.md) 에는 위젯 표시도 활성화되어 있어야 합니다.

```{tip}
사이트 범위 개체의 경우 권한이 모든 사이트에 부여되는지 아니면 특정 사이트에만 부여되는지 결정할 수 있습니다.
```

```{important}
계정 및 조직 역할은 계정 제한이 활성화된 개체에서만 지원됩니다. 그렇지 않으면 개체 권한 할당에 일반 및 사이트 역할만 사용할 수 있습니다. 자세한 내용은 [계정 제한 및 사용자 역할](../creating-and-managing-objects/using-system-objects-with-custom-objects/restricting-access-to-object-data-by-account.md#account-restriction-and-user-roles) 참조하세요.
```

## 애플리케이션 권한

애플리케이션 권한은 게시된 개체 자체에 대한 액세스 권한을 부여하며 [리소스 관련 권한](#resource-permissions) 포함하지 않습니다. 각 개체에는 정의된 범위에 따라 다음과 같은 표준 애플리케이션 권한이 포함됩니다.

| 허가                                                   | 묘사                                                                                                      |
| :--------------------------------------------------- | :------------------------------------------------------------------------------------------------------ |
| 제어판에서 액세스(**회사 범위에만 해당**)           | 전역 메뉴( ![전역 메뉴](../../../images/icon-applications-menu.png) )에서 개체에 액세스합니다.          |
| 사이트 및 자산 라이브러리 관리에 액세스(**사이트 범위만**) | 사이트 메뉴( ![사이트 메뉴](../../../images/icon-product-menu.png) ) 또는 자산 라이브러리에서 개체에 액세스합니다. |
| 설정                                                   | N/A                                                                                                     |
| 권한                                                   | 개체에 대한 응용 프로그램 권한을 보고 수정합니다.                                                                            |
| 환경 설정                                                | N/A                                                                                                     |
| 보기*                                                 | 개체의 응용 프로그램 페이지를 봅니다.                                                                                   |

\* 매핑된 콘텐츠를 보고, 페이지를 편집하는 동안 개체 정의에 매핑된 양식 컨테이너를 추가/수정하고, 사용자에게 추가 필수 권한이 있는 경우 다른 작업(예: 디스플레이 페이지 템플릿, 정보 템플릿 생성, 및 사이트 탐색 메뉴). 이 기능이 없으면 보기 및 미리 보기 모드에서 컬렉션 및 콘텐츠 표시가 표시되지 않습니다.

## 리소스 권한

리소스 권한은 사용자 정의 개체 정의에 대한 항목을 보고, 만들고, 작업할 수 있는 액세스 권한을 부여합니다. 이러한 권한 중 일부는 [객체](#creating-entries) 생성과 관련이 있고 다른 권한은 [기존 항목](#acting-on-existing-entries) (예: 편집, 삭제)에 대한 작업을 수행하는 데 사용됩니다.

### 항목 만들기

| 허가       | 묘사                                                                                     |
| :------- | :------------------------------------------------------------------------------------- |
| 객체 항목 추가 | 항목을 만듭니다. 연결된 개체의 양식 컨테이너를 보려면 이 권한이 필요합니다. 그렇지 않으면 양식 컨테이너가 보기 및 미리 보기 모드에 표시되지 않습니다. |
| 권한       | 항목 생성과 관련된 권한을 보고 관리합니다.                                                               |

### 기존 항목에 대한 작업

| 허가       | 묘사                                                                                                                                                                                                                                                              |
| :------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 삭제       | 항목을 삭제합니다.                                                                                                                                                                                                                                                      |
| 개체 항목 기록 | REST API를 사용하여 [쿼리 항목 기록](./using-custom-object-apis/using-nestedfields-to-audit-entry-history.md) . 이 권한은 개체 정의에 대해 [항목 기록이](../creating-and-managing-objects/auditing-object-events.md#enabling-entry-history) 활성화되어 있는 동안에만 사용할 수 있습니다. |
| 권한       | 개별 항목에 대한 권한을 보고 수정합니다.                                                                                                                                                                                                                                         |
| 수정       | 항목을 업데이트합니다.                                                                                                                                                                                                                                                    |
| 보기       | 항목을 봅니다.                                                                                                                                                                                                                                                        |

```{note}
개체 항목 작성자에게는 자동으로 소유자 역할이 할당되고 위 권한이 부여됩니다.
```

개체에 추가된 각 [실행형 작업](../creating-and-managing-objects/actions/using-manual-actions.md) 에 대해 리소스 권한이 생성됩니다. 작업을 트리거할 수 있는 역할을 관리하는 데 유용하며 `action.[actionName]` 패턴을 사용하여 이름이 지정됩니다.

## 개별 개체 엔터티에 대한 권한 관리

{bdg-secondary}`7.4 U10+/GA14+의 경우`

사용자 정의 개체를 사용하면 개별 데이터베이스 엔터티에 대한 권한을 관리하여 개체 데이터에 대한 액세스를 제어할 수 있습니다.

다음과 같이하세요:

1. 원하는 사용자 정의 개체로 이동합니다.

1. 원하는 엔터티에 대해 **작업** 버튼(![작업 버튼](../../../images/icon-actions.png))을 클릭하고 **권한** 을 선택합니다.

   ![Click the Actions button for the desired entity and select Permissions.](./permissions-framework-integration/images/01.png)

1. 확인란을 [입국에 행동하다](#acting-on-existing-entries) 에 대한 권한을 부여합니다.

   ```{note}
   역할 관리 애플리케이션에 정의된 권한은 엔터티 수준에서 정의된 권한보다 우선합니다.
   ```
   ![Use the checkboxes to assign permissions to the desired roles.](./permissions-framework-integration/images/02.png)

1. **저장** 을 클릭하세요.

## 관련 주제

* [객체 통합 이해](../understanding-object-integrations.md)
* [개체 개요](../../objects.md)
* [객체 생성](../creating-and-managing-objects/creating-objects.md)
* [계정별 객체 데이터 접근 제한](../creating-and-managing-objects/using-system-objects-with-custom-objects/restricting-access-to-object-data-by-account.md)
