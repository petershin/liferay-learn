# 선택 목록 권한 관리

{bdg-secondary}`라이프레이 7.4+`

Picklist는 Liferay의 권한 프레임워크와 통합되어 있습니다. 이는 사용자 역할에 [application](#application-permissions) 및 [resource](#resource-permissions) 권한을 할당하여 Picklists 애플리케이션 및 해당 데이터에 액세스할 수 있는 사용자를 결정할 수 있음을 의미합니다.

![Assign Picklist permissions when defining Role permissions.](./managing-picklist-permissions/images/01.png)

사용자 역할에 권한을 할당하는 방법에 대한 자세한 내용은 [역할 권한 정의](../../../users-and-permissions/roles-and-permissions/defining-role-permissions.md)를 참조하세요.

## 애플리케이션 권한

애플리케이션 권한은 일반적인 애플리케이션 관련 작업을 수행할 수 있는 권한을 부여하며 [리소스 관련 권한](#resource-permissions) 을 포함하지 않습니다.

선택 목록에는 다음과 같은 애플리케이션 권한이 있습니다.

| 허가        | 묘사                                 |
| :-------- | :--------------------------------- |
| 컨트롤 패널 접근 | 글로벌 메뉴에서 선택 목록에 액세스                |
| 설정        | Picklists 애플리케이션에 대한 구성 옵션 보기 및 수정 |
| 권한        | 선택 목록 권한 보기 및 수정                   |
| 환경 설정     | Picklists 애플리케이션에 대한 기본 설정 보기 및 수정 |
| 보기        | 선택 목록 애플리케이션 보기                    |

## 리소스 권한

리소스 권한은 특정 애플리케이션 리소스에 대한 권한을 부여합니다. 이러한 권한 중 일부는 [데이터베이스 엔터티에 대한 작업](#resource-관련-작업) (즉, 모델 리소스)을 수행할 수 있도록 해줍니다. 다른 것들은 애플리케이션 컨텍스트에서 [리소스 관련 작업](#actions-on-database-entities) 을 수행할 수 있는 권한을 부여합니다(예: 새 리소스 엔터티 생성).

Picklists 애플리케이션에는 다음과 같은 리소스 권한이 있습니다.

### 자원 관련 작업

| 허가          | 묘사                    |
| :---------- | :-------------------- |
| 목록 유형 정의 추가 | 선택 목록 유형 정의 만들기       |
| 권한          | 선택 목록과 관련된 권한 보기 및 관리 |

### 데이터베이스 엔터티에 대한 작업

| 허가 | 묘사                   |
| :- | :------------------- |
| 삭제 | 선택 목록 삭제             |
| 권한 | 선택 목록에 대한 권한 보기 및 수정 |
| 수정 | 선택 목록 업데이트           |
| 보기 | 선택 목록 보기             |

## 개별 선택 목록에 대한 권한 관리

개별 선택 목록에 대한 권한을 관리하려면 다음 단계를 따르십시오.

1. **전역 메뉴**(![전역 메뉴](../../../images/icon-applications-menu.png))를 통해 **선택 목록** 애플리케이션을 엽니다.

1. 원하는 선택 목록에 대해 **작업** 버튼(![작업 버튼](../../../images/icon-actions.png))을 클릭하고 **권한** 을 선택합니다.

   ![Click the Actions button for the desired Picklist and select Permissions.](./managing-picklist-permissions/images/02.png)

1. 확인란을 사용하여 원하는 역할에 [데이터베이스 엔터티](#actions-on-database-entities) 권한을 부여합니다.

   ```{note}
   역할 관리자 수준에서 정의된 권한은 개인 수준에서 정의된 권한보다 우선 적용됩니다.
   ```

   ![Use the checkboxes to assign permissions to the desired roles.](./managing-picklist-permissions/images/03.png)

1. **저장** 을 클릭하세요.

## 관련 주제

* [선택 목록 생성](./creating-picklists.md)
* [역할 권한 정의](../../../users-and-permissions/roles-and-permissions/defining-role-permissions.md)
