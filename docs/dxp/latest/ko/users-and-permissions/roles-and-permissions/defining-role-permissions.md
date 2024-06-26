# 역할 권한 정의

역할은 권한을 수집하므로 사용자에게 역할이 부여되면 모든 역할의 권한을 상속합니다.

제어판에서 무언가에 액세스할 수 있는 권한이 있는 역할을 만들면 **보기 제어판 메뉴** 권한이 자동으로 부여됩니다.

Liferay DXP 내에서 작업을 수행할 수 있는 권한을 결정하려면 반복이 필요합니다. 하나 또는 두 개의 권한을 추가한 다음 역할을 테스트하여 표시되는 동작이 예상한 동작인지 확인합니다. 더 많은 역할을 만들수록 주어진 작업을 수행하기 위해 권한을 결합하는 방법을 더 잘 이해할 수 있습니다.

```{tip}
역할에 사용자를 할당한 다음 [사용자 가장](./../users/adding-and-managing-users.md#impersonating-users) 은 사용자가 역할에서 상속한 권한을 확인하는 좋은 방법입니다. .
```

Liferay DXP의 모든 역할에 대한 권한을 정의하려면,

1. 제어판으로 이동한 다음 **사용자** &rarr; **역할** 를 클릭합니다.

1. 일반, 사이트, 조직 또는 자산 라이브러리 역할을 클릭하거나 [새로 만듭니다](./creating-and-managing-roles.md).

1. 역할 편집기 화면에서 **권한 정의** 탭을 클릭합니다.

1. 역할에 대한 권한을 모으고 **저장** 을 클릭하십시오.

![사용자가 작업을 수행할 수 있도록 역할의 권한을 정의합니다.](./understanding-roles-and-permissions/images/04.png)

물론 대부분의 작업은 역할에 대한 권한을 선택하는 것입니다. 검색 표시줄을 사용하여 필요한 권한을 찾으십시오.

```{note}
제어판의 역할 응용 프로그램은 기본이지만 권한이 구성되는 유일한 사이트는 아닙니다. 보다 세분화된 수준에서 리소스에 대한 역할의 권한을 구성할 수 있습니다. 예를 들어 권한 메뉴에서 특정 위젯에 대한 권한을 구성할 수 있습니다. 제어판에서 부여되거나 제거된 권한은 보다 세분화된 수준에서 정의된 권한을 재정의합니다.
```

## 예: 사용자 그룹 관리자 정의

가상 인스턴스에서 사용자 그룹을 관리할 수 있는 새 역할을 생성하려면 할당된 [역할 사용자](./assigning-users-to-roles.md) 이 가상 인스턴스의 모든 사용자 그룹에서 작동할 수 있도록 사용자 그룹 관리자 역할에 대한 권한을 정의해야 합니다.

- 사용자 그룹에 사용자를 추가합니다.
- 모든 사용자 그룹에서 사용자를 제거합니다.

제목이 **사용자 그룹 관리자** 인 일반 역할이 생성되면 권한 정의 화면으로 이동한 다음

1. 왼쪽 메뉴에서 **제어판** &rarr; **사용자** &rarr; **사용자 그룹** 로 드릴다운합니다.

   또는 검색 표시줄에 **사용자 그룹** 을 입력하여 권한 메뉴를 필터링합니다.

   ![검색 표시줄을 사용하여 관련 권한에 대한 권한 목록을 필터링합니다.](./defining-role-permissions/images/01.png)

1. **일반 권한** 제목 아래 **제어판의 액세스** 및 **보기** 에 플래그를 지정합니다. 이를 통해 사용자 그룹 관리자는 사용자 그룹 제어판 포틀릿에 액세스하고 기존 사용자 그룹을 볼 수 있습니다.

1. 사용자 그룹 관리자가 사용자 그룹을 보고 구성원을 할당할 수 있도록 하려면 **자원 권한** &rarr; **사용자 그룹** 제목 아래의 **구성원** 및 **보기** 권한도 확인하십시오.

1. **저장** 을 클릭합니다.

![사용자 그룹 관리자 역할에 할당된 사용자는 사용 가능한 사용자를 모든 사용자 그룹에 추가하고 제거할 수 있습니다.](./defining-role-permissions/images/02.png)

이제 사용자 그룹 관리자 역할에는 사용자를 사용자 그룹에 추가하는 데 필요한 모든 권한이 있습니다. 사용자 그룹 관리자는 제어판에서 사용자 그룹을 보고, 구성원을 할당하고, 사용자 그룹에 액세스할 수 있습니다. 역할의 구성원으로 할당하려면 사용자를 확인해야 하므로 제어판에서 사용자를 볼 수 있는 권한이 필요했습니다. 이 권한이 없으면 사용자 그룹 관리자가 사용자를 역할에 추가하려고 하면 빈 목록이 표시됩니다.

## 권한 개요

권한에는 세 가지 범주가 있습니다.

**제어판:** 포털 관리자는 전체 제어판에 액세스할 수 있습니다. 제어판 권한은 다른 역할 사용자에게 제어판이 표시되는지 여부와 표시 방식에 영향을 미칩니다. 예를 들어, 역할이 제어판의 다양한 애플리케이션에 대한 보기 액세스 권한을 부여할지 또는 더 세분화하여 애플리케이션의 구성 작업에 대한 액세스 권한만 부여할지 여부를 미세 조정할 수 있습니다.

**사이트 및 자산 라이브러리 관리:** 사이트 관리자는 사이트 관리 범주에 속하는 사이트 관리 도구에 액세스할 수 있습니다. 사이트 및 자산 라이브러리 관리 &rarr; 응용 프로그램 범주의 권한은 Wiki 및 게시판과 같은 응용 프로그램에서 생성할 수 있는 콘텐츠를 제어합니다. 이 목록에서 애플리케이션 중 하나를 선택하면 콘텐츠에 대한 권한을 정의하는 옵션이 표시됩니다. 예를 들어 게시판을 선택하면 카테고리 및 스레드 생성 또는 주제 삭제 및 이동에 대한 권한이 표시됩니다.

사이트 응용 프로그램 권한은 역할 범위(예: 일반 역할에 대한 가상 인스턴스의 모든 사이트) 전체에서 응용 프로그램 전체에 영향을 미칩니다. 예를 들어 조직 역할의 페이지에 메시지 보드 위젯을 추가할 수 있는 메시지 보드 응용 프로그램 권한을 부여하면 이 역할을 가진 조직 사용자가 [조직](../organizations/understanding-organizations.md)이 소유한 사이트의 모든 페이지에서 작업을 수행할 수 있습니다.

**사용자:** 기본적으로 사용자는 사용자 역할을 상속하며 사용자 범주에 속하는 권한을 통해 자신의 사용자 계정을 관리할 수 있습니다. 이러한 권한은 기본 사용자 역할보다 사용자 계정에 더 적은 권한을 제공하기 위해 사용자에 대한 새 역할을 정의하는 데 사용할 수 있습니다. 그런 다음 [기본 연결](./assigning-users-to-roles.md#default-user-associations) 구성을 사용하여 원래 사용자 역할을 보다 제한적인 역할(아마도 구별하기 위해 **제한된 사용자** 또는 **사용자 정의 사용자** 로 이름 지정)로 바꿀 수 있습니다.

자신을 하나의 범주로 제한하지 마십시오. 사용자 지정 역할을 정의할 때 이러한 모든 범주의 권한을 혼합하고 일치시킬 수 있습니다.

```{tip}
권한 범위를 변경할 수 있습니다. 권한 표의 *범위* 열에서 *변경* 링크를 클릭한 다음 새 범위를 선택합니다. *저장*을 클릭하면 해당 범위와 함께 현재 역할에 부여된 모든 권한 목록을 볼 수 있습니다. 요약 보기에서 더 많은 권한을 추가하거나 *뒤로*(<) 아이콘을 클릭하여 역할 애플리케이션 기본 보기로 돌아갈 수 있습니다.
```

![권한 범위를 변경하여 역할 권한을 미세 조정할 수 있습니다.](./defining-role-permissions/images/03.png)

특정 권한이 예상보다 많거나 적은 액세스 권한을 부여한다는 것을 알 수 있습니다. 항상 권한 구성을 테스트하십시오!

## 문제 해결: 사이트 역할에 전역 보기 권한이 필요할 수 있음

사이트 역할은 정의상 사이트 범위 외부의 엔터티에 대해 작동하는 권한을 정의할 수 없습니다. 이는 사용자 지정 역할에서 관리 유형 권한을 정의할 때 문제가 될 수 있습니다. 예를 들어, 사용자 지정 사이트 관리자 역할에서 기본 사이트 관리자 역할을 복제하려고 하면 **사이트 및 자산 라이브러리 권한** &rarr; **사람** &rarr; **구성원** 권한을 모두 추가하는 것만으로는 할당하기에 충분하지 않음을 알게 됩니다. 사이트의 신규 회원. 아직 사이트 구성원이 아닌 사용자는 사용자 지정 사이트 관리자에게 표시되지 않습니다. 적절한 권한을 부여하려면 사이트 역할 외에 일반 역할이 필요합니다. 사용자 자원에 대한 일반 역할 보기 권한을 부여하려면 역할 애플리케이션의 **권한 정의** 섹션으로 이동한 다음 **제어판** &rarr; **사용자** &rarr; **사용자 및 조직**)으로 이동하십시오. 사이트 역할 및 일반 역할을 가진 사용자는 이제 시스템에서 사용자를 보고 사이트에 추가할 수 있습니다.

```{note}
내장된 사이트 관리자 역할은 사용자를 볼 수 있는 권한을 자동으로 부여합니다.
```

## 소셜 활동 구성 위임

사이트 관리자가 소셜 활동 구성에 대한 책임을 다른 사용자에게 위임할 수 있는 권한이 있습니다. 이 권한을 역할에 추가하려면 원하는 역할 옆에 있는 **작업** 을 클릭하고 **권한 정의** 를 선택하십시오. **사이트 관리** &rarr; **구성** &rarr; **소셜 활동** 권한 범주를 찾습니다. 모든 권한에 플래그를 지정한 다음 **저장** 을 클릭합니다.

- 사이트 및 애셋 라이브러리 관리에서 액세스
- 설정
- 권한
- 환경 설정
- 보기

이러한 권한이 부여되면 역할 할당자는 사이트의 소셜 활동을 관리할 수 있습니다.

역할은 원하는 조합으로 다양한 권한을 그룹화합니다. 이렇게 하면 설계한 사이트를 최대한 유연하게 구축할 수 있습니다.
