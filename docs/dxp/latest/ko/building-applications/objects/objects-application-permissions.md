# 개체 응용 프로그램 권한

{bdg-secondary}`라이프레이 7.4+`

다른 Liferay 애플리케이션과 마찬가지로 개체 포틀릿은 권한 프레임워크와 통합됩니다. 이는 사용자 역할에 [application](#application-permissions) 및 [resource](#resource-permissions) 권한을 할당하여 객체 포틀릿 및 해당 데이터에 액세스할 수 있는 사용자를 결정할 수 있음을 의미합니다.

![Assign Objects permissions when defining role permissions.](./objects-application-permissions/images/01.png)

사용자 역할에 권한을 할당하는 방법에 대한 자세한 내용은 [역할 권한 정의](../../users-and-permissions/roles-and-permissions/defining-role-permissions.md)를 참조하세요.

## 애플리케이션 권한

애플리케이션 권한은 일반적인 애플리케이션 관련 작업을 수행할 수 있는 권한을 부여하며 [리소스 관련 권한](#resource-permissions) 을 포함하지 않습니다.

개체에는 다음과 같은 애플리케이션 권한이 있습니다.

| 허가        | 묘사                          |
| :-------- | :-------------------------- |
| 컨트롤 패널 접근 | 글로벌 메뉴에서 객체에 접근하세요.         |
| 설정        | 객체 포틀릿에 대한 구성 옵션을 보고 수정합니다. |
| 권한        | 개체 권한을 보고 수정합니다.            |
| 환경 설정     | 객체 포틀릿에 대한 환경 설정을 보고 수정합니다. |
| 보기        | 개체 포틀릿을 봅니다.                |

## 리소스 권한

리소스 권한은 개체 애플리케이션의 리소스를 보고 작업할 수 있는 액세스 권한을 부여합니다. 이러한 권한 중 일부는 [객체 정의 생성과 관련](#resource-관련-actions) 하고, 다른 권한은 [기존 정의에 대한 작업 수행](#actions-on-database-entities) (예: 편집, 삭제)을 위한 것입니다.

개체에는 다음과 같은 리소스 권한이 있습니다.

### 자원 관련 작업

| 허가           | 묘사                                  |
| :----------- | :---------------------------------- |
| 오브젝트 정의 추가   | 객체 정의 초안을 만듭니다.                     |
| 확장 시스템 객체 정의 | 시스템 개체에 필드, 관계, 작업 및 유효성 검사를 추가합니다. |
| 권한           | 개체와 관련된 권한을 보고 관리합니다.               |
| 객체 정의 공개     | 객체 정의 초안을 게시합니다.                    |

### 데이터베이스 엔터티에 대한 작업

| 허가 | 묘사                      |
| :- | :---------------------- |
| 삭제 | 객체 정의를 삭제합니다.           |
| 권한 | 개체 정의에 대한 권한을 보고 수정합니다. |
| 수정 | 객체 정의를 업데이트합니다.         |
| 보기 | 객체 정의를 봅니다.             |

## 개별 개체 정의에 대한 권한 관리

개별 개체 정의에 대한 권한을 관리하려면 다음 단계를 따르세요.

1. **전역 메뉴**(![전역 메뉴](../../images/icon-applications-menu.png))를 통해 **개체** 애플리케이션을 엽니다.

1. 원하는 개체 정의에 대해 **작업** 버튼(![작업 버튼](../../images/icon-actions.png))을 클릭하고 **권한** 을 선택합니다.

   ![Click the Actions button for the desired object definition and select Permissions.](./objects-application-permissions/images/02.png)

1. 확인란을 사용하여 원하는 역할에 [객체 정의](#actions-on-database-entities) 권한을 부여합니다.

   ```{note}
   역할 관리자 수준에서 정의된 권한은 개인 수준에서 정의된 권한보다 우선 적용됩니다.
   ```

   ![Use the checkboxes to assign permissions to the desired roles.](./objects-application-permissions/images/03.png)

1. **저장** 을 클릭하세요.

## 관련 주제

* [객체](../objects.md)
* [객체 생성 및 관리](./creating-and-managing-objects.md)
