# 객체 모델 작성기 사용

{bdg-secondary}`liferay 7.4 2023.Q4+/GA102+`

Liferay Objects는 복잡한 개체 구조를 설계하기 위한 Model Builder GUI를 제공합니다. 이 그래픽 도구는 각 개체 정의를 카드로 표시하고 개체 정의 간의 관계를 시각화합니다. 이를 통해 개체 애플리케이션에서 데이터 모델을 생성, 관리 및 확장하고 정의, 필드 및 관계를 신속하게 구성할 수 있습니다.

![Use the Model Builder GUI to design complex data structures.](./using-the-objects-model-builder/images/01.png)

!!! note
    Liferay 7.4 2023.Q4+/GA102+의 경우 개체 UI에 액세스하려면 **개체 폴더 > 보기** 권한도 있어야 합니다. 자세한 내용은 [개체 응용 프로그램 권한](../objects-application-permissions.md) 참조하세요.

모델 작성기 보기에 액세스하려면

1. **전역 메뉴**(![전역 메뉴](../../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **개체** 를 클릭합니다.

1. 원하는 [개체 폴더](./organizing-objects-with-folders.md) 로 이동하고 **모델 빌더에서 보기** 를 클릭합니다.

   ![Go to the desired object folder and click View in Model Builder.](./using-the-objects-model-builder/images/02.png)

여기에서 객체 정의를 생성, 편집 및 관리할 수 있습니다.

!!! tip
    Model Builder 보기는 여러 개체 정의와 해당 속성을 빠르게 구성하는 데 유용합니다. 이는 개체 관계를 시각화하고 관리하는 데 특히 유용합니다.

## 객체 생성

1. 원하는 개체 폴더로 이동합니다.

1. **새 개체 만들기** 를 클릭합니다.

   ![Click Create New Object.](using-the-objects-model-builder/images/03.png)

1. 개체 초안에 대한 세부 정보를 제공하세요.

   **레이블** : 개체 관리 및 지원되는 응용 프로그램 컨텍스트(예: 작업 흐름, 표시 페이지 템플릿, 양식)에서 개체를 식별합니다.

   **복수형 레이블** : UI에서 개체 응용 프로그램의 표시 이름을 결정합니다.

   **객체 이름** : 객체의 'definition.name'을 결정하며 게시 후에는 변경할 수 없습니다.

1. **저장** 을 클릭하세요.

저장되면 초안 정의가 중앙 다이어그램 영역에 나타납니다. 이를 클릭하면 오른쪽 패널의 구성 옵션에 액세스할 수 있습니다.

![Click an object card to access configuration options.](./using-the-objects-model-builder/images/04.png)

여기에서 세부 정보를 편집하고, 통합을 활성화하고, 추가 기능(예: 분류, 초안 모드)을 구성할 수 있습니다. <!--TASK: See [Configuring Object Definitions]() for more information on available options.-->

개체 정의에 필드와 관계를 추가할 수도 있습니다. 그러나 [유효성 검사](./validations.md) , [작업](./actions.md) , [보기](./views.md) , [레이아웃](./layouts.md) 및 [상태](./fields/adding-and-managing-custom-states.md) 를 추가하려면 기본 개체 보기를 사용해야 합니다.

### 데이터 필드 추가

1. 개체 정의에 대해 **필드 또는 관계 추가** 를 클릭합니다.

1. **필드 추가** 를 선택합니다.

   ![Select Add Field.](./using-the-objects-model-builder/images/05.png)

1. **레이블** 과 **필드 이름** 을 입력합니다.

   **레이블** : 개체 UI에서 필드를 식별하고 필드가 생성된 후 현지화될 수 있습니다.

   **필드 이름** : 백엔드에서 필드 이름을 결정하고 카멜 표기법을 사용합니다. 필드가 게시되면 이 값을 변경할 수 없습니다.

1. 필드 **유형** 을 선택합니다. 사용 가능한 필드 유형 및 구성 옵션에 대한 자세한 내용은 [필드 유형 참조](./fields/adding-fields-to-objects.md#field-types-ui-reference) 참조하세요.

1. **저장** 을 클릭하세요.

필드가 정의에 즉시 추가됩니다. 기본적으로 개체 카드에는 5개의 필드가 표시되지만 **모든 필드 표시** 를 클릭하여 다른 필드를 볼 수 있습니다. 또한 개체 카드의 필드를 선택하여 오른쪽 패널의 구성 옵션에 액세스할 수 있습니다.

![Select a field to access its configuration options in the right side panel.](./using-the-objects-model-builder/images/06.png)

### 관계 정의

1. 개체 정의에 대해 **필드 또는 관계 추가** 를 클릭합니다.

1. **관계 추가** 를 선택합니다.

   ![Select Add Relationship.](./using-the-objects-model-builder/images/07.png)

1. **라벨** 과 **이름** 을 입력하세요.

   **레이블** : 개체 UI에서 관계를 식별하고 관계가 생성된 후 현지화될 수 있습니다.

   **이름** : 백엔드에서 관계 이름을 결정하고 카멜 표기법을 사용합니다. 관계가 게시되면 이 값을 변경할 수 없습니다.

1. 관계 **유형** 을 선택하고 관계의 반대편에 대한 개체 정의를 선택합니다. 자세한 내용은 [개체 관계 정의](./relationships/defining-object-relationships.md) 참조하세요.

1. **저장** 을 클릭하세요.

일단 저장되면 다이어그램 영역은 객체 정의 간의 논리적 연결을 시각화하고 일대다 관계와 다대다 관계를 구별합니다. 또한 관계를 선택하여 오른쪽 패널에서 구성 옵션에 액세스할 수 있습니다.

![Select a relationship to access its configuration options in the right side panel.](./using-the-objects-model-builder/images/08.png)

다른 폴더에 있는 개체 정의와의 관계를 정의하는 경우 다이어그램 영역에 점선 테두리가 있는 카드가 표시됩니다. 이는 관계를 시각화하기 위한 것일 뿐 사용자에게 개체 정의를 편집할 수 있는 기능을 부여하지 않습니다. 정의를 편집하려면 개체의 소스 폴더로 이동해야 합니다.

![The diagram area displays related object definitions in other folders.](./using-the-objects-model-builder/images/09.png)

## 객체 관리

Model Builder 다이어그램 영역에 개체 카드를 끌어다 놓아 시각적으로 재구성할 수 있습니다. Liferay는 사이트
 업데이트를 자동으로 저장합니다. 또한 폴더 간에 개체 정의를 이동할 수 있습니다.

1. 원하는 대상 폴더로 이동합니다.

1. 왼쪽 사이드바에 있는 다른 폴더의 개체에 대해 **작업**(![작업 버튼](../../../images/icon-actions.png))을 클릭합니다.

1. **현재 폴더로 이동** 을 선택합니다.

   ![Select Move to Current Folder](./using-the-objects-model-builder/images/10.png)

그러면 정의가 현재 폴더로 이동됩니다. 객체 정의 이동은 해당 관계에 영향을 주지 않으며 조직 및 객체 관리 개선을 위해서만 사용됩니다.

![Move object definitions between folders.](./using-the-objects-model-builder/images/11.png)

개체 카드에 대한 작업(![작업 버튼](../../../images/icon-actions.png))을 클릭하면 추가 관리 옵션에 액세스할 수 있습니다. 사용 가능한 옵션은 다음과 같습니다.

* 페이지 보기에서 편집: 기본 개체 UI로 전환합니다.
* ERC 편집: 객체의 외부 참조 코드(ERC)를 업데이트합니다.
* 권한 관리: 객체 [에 대해](../objects-application-permissions.md#actions-on-database-entities) 역할을 수행할 수 있는지 결정합니다.
* 객체 삭제: [객체 정의를 삭제](./deleting-objects.md) 합니다.

![Click the object card's Actions button to access additional management options.](./using-the-objects-model-builder/images/12.png)

### 개체 초안 게시

Model Builder를 사용하는 동안 개별 개체 정의는 물론 여러 개체를 포함하는 복잡한 데이터 모델을 게시할 수 있습니다.

1. 개체 초안이 있는 폴더로 이동합니다.

1. **게시** 를 클릭하세요.

1. 게시할 초안을 선택합니다.

   ![Select which drafts to publish and click Publish Objects.](./using-the-objects-model-builder/images/13.png)

1. **개체 게시** 를 클릭합니다.

선택한 초안이 동시에 게시되기 시작합니다.

## 관련 주제

* [객체 생성](./creating-objects.md)
* [개체에 필드 추가](./fields/adding-fields-to-objects.md)
* [개체 관계 정의](./relationships/defining-object-relationships.md)
