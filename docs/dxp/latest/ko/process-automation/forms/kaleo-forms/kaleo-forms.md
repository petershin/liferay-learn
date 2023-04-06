
# Kaleo 양식

```{important}
Kaleo Forms는 Liferay 7.4에서 [유지 관리 모드](../../../installation-and-upgrades/upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-4.md)에 있습니다. 가능하면 [객체](../../../building-applications/objects.md) 을 사용하십시오.
```

Liferay의 **Kaleo Forms** 솔루션은 **Workflow Designer** 과 **Dynamic Data Lists** 의 기능을 결합하여 양식 기반 비즈니스 프로세스를 생성합니다. 이를 통해 양식을 워크플로 작업과 통합하여 회의실 체크아웃 양식을 만들고 티켓 프로세스를 지원하는 등의 작업을 수행할 수 있습니다.

* [Kaleo 양식](#kaleo-forms)
  * [Kaleo Forms 프로세스 생성](#creating-a-kaleo-forms-process)
  * [Kaleo 양식 프로세스 사용](#using-a-kaleo-forms-process)
  * [추가 정보](#additional-information)

## Kaleo Forms 프로세스 생성

새로운 Kaleo Forms 프로세스를 생성하려면 다음 단계를 따르십시오.

1. **사이트 메뉴** 을 열고 **콘텐츠 & 데이터** &rarr; **Kaleo Forms Admin** 로 이동합니다.

1. **추가** 버튼 ![Add Button](../../../images/icon-add.png) 를 클릭하여 새 프로세스 마법사를 엽니다.

1. 새 프로세스에 대해 **이름** 및 **설명** 입력하고 **다음** 클릭합니다.

    ![이름과 설명을 입력하고 다음을 클릭합니다.](./kaleo-forms/images/01.png)

1. **필드 세트** 선택하여 프로세스의 양식에 나타날 수 있는 필드를 정의합니다.

   기존 필드 세트에서 선택하거나 새로 만들 수 있습니다. 기존 필드 세트에 포함된 모든 요소를 미리 보려면 **필드 보기** 클릭합니다.

   * 기존 필드 세트를 선택하려면 해당 **작업** 버튼 ![Actions Button](../../../images/icon-add.png)클릭하고 **선택** 선택합니다. 또는 **편집** 선택하여 선택하기 전에 필드 세트를 수정할 수 있습니다.

   * 새 필드 세트를 만들려면 **필드 세트 추가** 클릭하고 원하는 요소를 통합합니다. 완료되면 **저장** 클릭하고 대화창을 닫아 선택할 수 있는 필드 세트 목록을 업데이트합니다. 자세한 내용은 [데이터 정의 만들기](../dynamic-data-lists/creating-data-definitions.md) 참조하십시오.

   필드 세트를 선택했으면 **다음** 클릭합니다.

   ![프로세스 양식에 대한 필드를 정의할 필드 세트를 선택하고 다음을 클릭하십시오.](./kaleo-forms/images/02.png)

1. 새 프로세스의 양식에 사용할 **워크플로** 선택합니다.

   기존에 게시된 워크플로에서 선택하거나 새 워크플로를 생성할 수 있습니다.

   * 게시된 기존 워크플로를 선택하려면 **작업** 버튼 ![Actions Button](../../../images/icon-actions.png)을 클릭하고 **선택** 선택합니다. **편집** 을 선택하여 워크플로를 선택하기 전에 수정할 수도 있습니다.

   * 새 워크플로를 만들려면 **워크플로 추가** 클릭하고 원하는 요소를 통합합니다. 자세한 내용은 [워크플로우 디자이너 개요](../../workflow/designing-and-managing-workflows/workflow-designer/workflow-designer-overview.md) 을 참조하십시오. 완료되면 **게시** 클릭하고 대화 창을 닫아 선택할 수 있는 사용 가능한 워크플로 목록을 업데이트합니다.

   워크플로우를 선택했으면 **다음** 클릭합니다.

   ![새 프로세스의 양식에 사용할 워크플로를 선택하고 다음을 클릭합니다.](./kaleo-forms/images/03.png)

1. 각 워크플로 작업에 사용할 **형식** 을 선택합니다.

   기존 양식에서 선택하거나 새 양식을 만들 수 있습니다.

   * 기존 양식에서 선택하려면 작업의 **작업** 버튼 ![Actions Button](../../../images/icon-actions.png)을 클릭하고 **양식 지정** 선택합니다. 그런 다음 원하는 양식을 클릭하십시오. 할당되면 작업의 **작업** 버튼을 통해 언제든지 선택한 양식을 편집하거나 할당 해제할 수 있습니다.

   * 새 양식을 만들려면 각 작업의 **작업** 버튼 ![Actions Button](../../../images/icon-actions.png)을 클릭하고 **양식 지정** 선택합니다. 그런 다음 **추가** 버튼 ![Add Button](../../../images/icon-add.png)을 클릭하고 사용자 지정 양식을 디자인합니다. 완료되면 **저장** 클릭합니다. 그런 다음 선택한 워크플로 작업에 새 양식을 할당할 수 있습니다.

   ![각 워크플로 작업에 사용할 양식을 선택하고 저장을 클릭합니다.](./kaleo-forms/images/04.png)

1. **저장** 클릭합니다.

## Kaleo 양식 프로세스 사용

Kaleo Forms 프로세스를 시작하려면 다음 단계를 따르십시오.

1. **사이트 메뉴** 을 열고 **콘텐츠 & 데이터** &rarr; **Kaleo Forms Admin** 로 이동합니다.

1. 사용하려는 **Kaleo Forms 프로세스** 클릭한 다음 **추가** 버튼 ![Add Button](../../../images/icon-add.png)을 클릭하십시오. 이렇게 하면 선택한 프로세스의 초기 양식으로 리디렉션됩니다.

1. 초기 양식을 작성하고 **저장** 클릭하여 첫 번째 워크플로 작업을 완료합니다.

![초기 양식을 작성하고 저장을 클릭하여 Kaleo Forms 프로세스를 시작합니다.](./kaleo-forms/images/05.png)

일단 저장되면 워크플로 엔진은 규정된 프로세스를 구현하고 후속 워크플로 작업에 할당된 사용자에게 알립니다. 이러한 작업은 **개인 메뉴** 의 **내 워크플로 작업** 에서 볼 수 있습니다.

![Personal Menu의 My Workflow Tasks 아래에서 귀하 또는 귀하의 역할에 할당된 Kaleo 프로세스 작업을 봅니다.](./kaleo-forms/images/06.png)

여기에서 프로세스를 클릭하여 할당된 작업을 완료하고 지정된 작업 양식을 편집, 거부 또는 승인하여 프로세스를 해결 단계로 이동할 수 있습니다. 사용 가능한 옵션 및 조건은 선택한 Kaleo Forms 프로세스에 의해 정의됩니다.

## 워크플로에서 Kaleo Forms 항목 추적

Liferay 7.4 업데이트 1에서는 Kaleo Form Admin 애플리케이션의 UI에 새로운 기능이 추가되었습니다. 다이어그램 보기에서 워크플로를 통해 제출된 각 양식의 진행 상황을 추적할 수 있습니다.

![워크플로를 통해 각 Kaleo Form을 추적합니다.](./kaleo-forms/images/07.png)

다이어그램 보기에 액세스하려면 항목의 작업 메뉴(![Actions](../../../images/icon-actions.png))에서 워크플로 추적 구성 옵션을 클릭합니다.

## 추가 정보

* [양식 소개](../introduction-to-forms.md)
* [워크플로 소개](../../workflow/introduction-to-workflow.md)
* [데이터 정의 생성](../dynamic-data-lists/creating-data-definitions.md)
