# 객체 생성

{bdg-secondary}`liferay 7.4 2023.Q4+/GA102+`

Liferay 개체는 Liferay UI에서 개발 기능을 제공합니다. 개체를 사용하면 코드를 작성하거나 수동으로 모듈을 배포하지 않고도 완전히 통합된 Liferay 애플리케이션을 구축할 수 있습니다. 이 프로세스에는 개체 초안 만들기 [창조](#creating-object-drafts), [ 편집](#editing-object-drafts) 개, 마지막으로 게시 [출판](#publishing-object-drafts) 를 포함하여 새 응용 프로그램을 만듭니다.

여기에서는 기본 개체 UI를 사용하여 개체 정의를 생성하는 방법을 배우지만, Model Builder GUI를 사용하여 개체 정의를 생성, 관리 및 확장할 수도 있습니다. 자세한 내용은 [개체 모델 작성기 사용](./using-the-objects-model-builder.md) 참조하세요.

!!! important
Liferay는 객체 정의를 게시할 때 데이터베이스 테이블을 생성하므로 [데이터베이스 구성](../../../installation-and-upgrades/reference/database-configurations.md#high-security-database-user-practices) 에 설명된 높은 보안 데이터베이스 방식으로 객체를 사용할 수 없습니다.

## 개체 초안 만들기

개체 초안은 개체 응용 프로그램을 만드는 데 필요한 데이터를 저장하는 응용 프로그램 템플릿입니다. 초안 개체를 만들려면

1. _전역 메뉴_(![전역 메뉴](../../../images/icon-applications-menu.png))를 열고 _제어판_ 탭으로 이동한 다음 _개체_를 클릭합니다.

   !!! note
   Liferay 7.4 2023.Q4+/GA102+의 경우 개체 UI에 액세스하려면 _개체 폴더 > 보기_ 권한도 있어야 합니다. 자세한 내용은 [개체 응용 프로그램 권한](../objects-application-permissions.md) 참조하세요.

1. 원하는 [개체 폴더](./organizing-objects-with-folders.md) 로 이동하여 _추가_ 버튼(![추가 버튼](../../../images/icon-add.png))을 클릭합니다.

1. 초안에 대한 세부정보를 제공하세요.

   **레이블**: 개체 관리 및 지원되는 응용 프로그램 컨텍스트(예: 작업 흐름, 표시 페이지 템플릿, 양식)에서 개체를 식별합니다.

   **복수형 레이블**: UI에서 개체 응용 프로그램의 표시 이름을 결정합니다.

   **객체 이름**: 객체의 'definition.name'을 결정하며 게시 후에는 변경할 수 없습니다.

   ![Enter a Label, Plural Label, and Name for the object draft.](./creating-objects/images/01.png)

1. _저장_을 클릭하세요.

저장하고 나면 구성이나 데이터 요소 없이 빈 개체 초안이 생성됩니다. 시스템 개체와 함께 개체 관리에서 초안을 볼 수 있습니다. 생성 프로세스 [완료하려면 초안을](#editing-object-drafts) 편집 [한 다음 Liferay 인스턴스에 게시](#publishing-object-drafts) 해야 합니다.

![You can view the new object draft in the Objects admin.](./creating-objects/images/02.png)

## 개체 초안 편집

{bdg-secondary}`liferay 7.4 2023.Q3+/GA98+`

개체를 게시하기 전에 요소를 추가하고 해당 설정을 구성할 수 있습니다. 여기에는 필드 추가, 유효성 검사 정의, 데이터 범위 설정 등이 포함됩니다.

```{note}
필드, 관계 또는 레이아웃을 추가할 때마다 개체 초안이 자동으로 저장됩니다. 그러나 다른 탭으로 이동하면 세부정보 탭에서 저장되지 않은 변경 사항이 손실됩니다.
```

개체 초안을 편집하려면 다음 단계를 따르십시오.

1. 개체 관리 페이지에서 새로 생성된 개체 초안을 클릭하여 편집을 시작합니다.

   개체 기능 및 구성 옵션은 세부 정보, 필드, 관계, 레이아웃, 작업, 보기, 유효성 검사 및 상태 관리자 탭으로 구성됩니다.

   ![Object features and configuration options are organized into eight tabs.](./creating-objects/images/03.png)

1. 사용자 정의 필드를 추가하려면 _필드_ 탭을 클릭하세요. 각 필드는 특정 유형의 값을 저장하기 위한 데이터베이스 열을 나타냅니다. [객체에 필드 추가](./fields/adding-fields-to-objects.md) 참조하십시오.

   기본적으로 모든 개체에는 작성자, 생성 날짜, 외부 참조 코드, ID, 수정 날짜 및 상태와 같은 시스템 필드가 포함됩니다.

   ![Add fields to the object from the Fields tab.](./creating-objects/images/04.png)

1. (선택 사항) _관계_ 탭을 클릭하여 관계를 추가합니다. 관계는 해당 항목을 연결하는 데 사용할 수 있는 개체 정의 간의 연결입니다. [개체 관계 정의](./relationships/defining-object-relationships.md) 참조하십시오.

   ![Add relationships to the object from the Relationships tab.](./creating-objects/images/05.png)

1. (선택사항) _레이아웃_ 탭을 클릭하여 레이아웃을 추가합니다. 개체 레이아웃은 개체 항목을 만들고 볼 때 필드와 관계가 나타나는 방식을 결정합니다. [개체 레이아웃 디자인](./layouts/designing-object-layouts.md) 을 참조하십시오.

   ```{note}
   사용자 정의 레이아웃을 추가하지 않고 기본값으로 설정하면 개체는 해당 항목에 대해 자동으로 생성된 레이아웃을 사용합니다. 이 레이아웃에는 모든 개체 필드를 알파벳 순서로 표시하고 관계는 표시하지 않는 단일 탭이 있습니다. 관계를 표시하려면 전용 관계 탭이 있는 사용자 정의 레이아웃을 만들어야 합니다.
   ```

   ![Add custom layouts to the object from the Layouts tab.](./creating-objects/images/06.png)

1. (선택 사항) 사용자 정의 작업을 추가하려면 작업 탭을 클릭합니다. 각 작업은 설정된 트리거에 따라 자동으로 실행되는 작업을 정의합니다. [개체 작업 정의](./actions/defining-object-actions.md) 참조하십시오.

   ![Add custom actions to the object from the Actions tab.](./creating-objects/images/07.png)

1. (선택 사항) 보기 탭을 클릭하여 사용자 정의 보기를 추가합니다. 개체 보기는 개체의 응용 프로그램 페이지에 항목이 표시되는 방식을 결정합니다. [객체 뷰 디자인](./views/designing-object-views.md) 참조하십시오.

   ![Add custom views to the object from the Views tab.](./creating-objects/images/08.png)

1. (선택 사항) 유효성 검사 탭을 클릭하여 유효성 검사를 추가합니다. 각 유효성 검사는 유효한 필드 항목을 결정하기 위한 규칙을 설정합니다. [필드 유효성 검사 추가](./validations/adding-field-validations.md) 참조하십시오.

   ![Add custom validations to the object from the Validations tab.](./creating-objects/images/09.png)

1. (선택 사항) 초안에 상태 필드를 추가한 경우 상태 관리자 탭을 클릭하여 해당 흐름을 정의합니다. [사용자 정의 상태 추가 및 관리](./fields/adding-and-managing-custom-states.md) 참조하십시오.

   ![Define flows for state fields in the State Manager tab.](./creating-objects/images/10.png)

1. 개체 초안을 구성하려면 세부 정보 탭을 클릭합니다.

1. (선택 사항) 개체의 이름, 레이블 또는 복수형 레이블을 변경합니다.

    ![Change the name, label and plural label for the object.](./creating-objects/images/11.png)

1. 항목 제목을 선택합니다. 이는 UI에서 개체 항목(예: 관계 필드)을 식별하는 데 사용되는 필드를 결정합니다. 기본적으로 개체는 ID 필드를 사용합니다.

    ![Once a field is added to an object, you can select it as the Entry Title.](./creating-objects/images/12.png)

1. 개체 _범위_를 선택합니다. 이는 객체의 데이터가 저장되는 방법을 결정합니다.

    **회사**(기본값): 회사로 범위를 지정하면 개체의 데이터가 Liferay 인스턴스별로 저장됩니다.

    **사이트**: 사이트별로 범위를 지정하면 개체의 데이터가 사이트별로 저장됩니다.

1. Liferay에서 정의가 나타나는 사이트
를 결정하려면 패널 링크를 선택하십시오.

    회사 범위 개체의 경우 글로벌 메뉴(![글로벌 메뉴](../../../images/icon-applications-menu.png))에서 탭과 카테고리를 선택합니다.

    사이트 범위 개체의 경우 사이트 메뉴(![사이트 메뉴](../../../images/icon-menu.png))에서 섹션을 선택합니다.

    UI 메뉴에 애플리케이션을 표시하지 않으려면 이 값을 비워 둘 수 있습니다.

    ![Select a scope and panel link for the object.](./creating-objects/images/13.png)

1. 계정별로 개체 항목에 대한 액세스를 제한하도록 계정 제한을 구성합니다. 게시하기 전에만 이 설정을 구성할 수 있습니다.

    이 옵션은 개체가 계정 시스템 개체와 일대다 관계의 하위 쪽에 있는 경우에만 나타납니다. [계정별로 개체 데이터에 대한 액세스 제한](./using-system-objects-with-custom-objects/restricting-access-to-object-data-by-account.md) 을 참조하십시오.

    ![Determine whether to limit restrict access to object entries by account.](./creating-objects/images/14.png)

1. 개체의 페이지 위젯을 표시하거나 숨깁니다.

    활성화된 동안 사이트 페이지에 개체의 위젯을 추가할 수 있습니다. [사이트에 개체 위젯 배포](../deploying-object-widgets-to-sites.md) 참조하십시오.

1. 개체 항목에 대한 분류를 활성화하거나 비활성화합니다.

    활성화된 동안 사용자 정의 레이아웃의 필드 탭에 분류 블록을 추가할 수 있습니다. [필드 탭에 분류 추가](./layouts/adding-categorization-to-fields-tabs.md) 참조하십시오. 또한 양식 컨테이너에 태그 및 범주 조각을 추가하여 개체 항목에 메타데이터를 첨부할 수 있습니다.

1. 개체 표시 페이지에 대한 설명을 활성화하거나 비활성화합니다.

    활성화된 동안 항목 표시 페이지에서 페이지 댓글 위젯을 사용할 수 있습니다. [개체에 대한 표시 페이지 템플릿 만들기](../displaying-object-entries.md#creating-display-page-templates-for-objects) 을 참조하십시오.

1. 개체 항목에 대한 기록을 활성화하거나 비활성화합니다.

    활성화된 동안 Liferay는 감사 애플리케이션이나 REST API 호출을 통해 볼 수 있는 입력 이벤트 기록을 유지합니다. [객체 이벤트 감사](./auditing-object-events.md) 참조하십시오.

1. {bdg-link-primary}`[베타 기능](../../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)` 개체 항목에 대한 초안 모드를 활성화 또는 비활성화합니다.

    활성화된 동안 사용자는 항목을 초안으로 저장하고 나중에 마무리할 수 있습니다. 초안을 저장해도 사용자 정의 검증, 워크플로 프로세스 또는 항목 생성에 의해 트리거되는 작업이 트리거되지 않습니다.

    ```{note}
    이 설정은 언제든지 구성할 수 있습니다. 초안 모드를 비활성화해도 기존 항목의 상태는 변경되지 않습니다.
    ```

1. 사용자 정의 텍스트 [필드](./fields.md) 에 대한 번역 지원을 활성화 또는 비활성화합니다.

    활성화된 동안 사용자 정의 텍스트 필드에 대한 번역을 활성화하여 최종 사용자가 입력을 현지화할 수 있습니다. 자세한 내용은 [개체 정의 및 항목 지역화](./localizing-object-definitions-and-entries.md) 참조하세요.

1. _저장_을 클릭하세요.

초안 구성 및 편집을 마친 후에는 [을](#publishing-object-drafts) 할 수 있습니다.

## 개체 초안 게시

개체를 게시하면 새 응용 프로그램이 생성되고 활성화됩니다. 활성화되면 사용자는 범위 및 패널 링크에 따라 Liferay UI에서 액세스할 수 있습니다. 개체를 게시하기 전에 다음 정보를 검토하여 초안 게시의 결과를 이해하세요.

### 게시 중에 일어나는 일

게시 프로세스에는 다음 작업이 포함됩니다.

* 초안의 데이터 정의가 포함된 객체에 대한 데이터베이스 테이블이 생성됩니다.

* CRUD 작업을 위해 새로운 Headless API가 자동으로 생성됩니다.

* 개체 항목을 표시하기 위해 컬렉션 공급자가 생성됩니다.

* 개체에 대한 페이지 위젯이 생성됩니다.

* 개체는 Info 프레임워크와 통합되어 있으므로 개체를 표시 페이지 템플릿 [의 콘텐츠 유형으로 선택할 수 있습니다](../../../site-building/displaying-content/using-display-page-templates.md) 

* 객체는 [권한 프레임워크](../understanding-object-integrations/permissions-framework-integration.md) 과 통합되므로 새 애플리케이션과 해당 리소스에 대한 권한을 관리할 수 있습니다.

* 개체는 워크플로 프레임워크와 통합되므로 개체에 대한 사용자 정의 워크플로를 구성할 수 있습니다.

* 개체는 Forms와 통합되므로 개체를 데이터 저장 옵션으로 선택할 수 있습니다.

### 게시된 개체에 대한 구성 제한 사항

{bdg-secondary}`liferay 7.4 U86+/GA86+`

데이터 손실 및 시스템 충돌을 방지하기 위해 Liferay는 게시 후 객체 정의에 대한 이러한 구성 옵션을 제한합니다.

* 이름
* 범위
* 계정 제한(활성화된 경우)
* 항목 번역

Liferay는 또한 일부 사용자 정의 필드 옵션(예: 필수, 고유 값)을 제한합니다.

```{note}
Liferay 7.4 U85/GA85 및 이전 버전의 경우 사용자는 게시 시 객체 정의에 포함된 필드를 삭제할 수 없습니다.
```

## 관련 주제

* [개체 개요](../../objects.md)
* [개체에 필드 추가](./fields/adding-fields-to-objects.md)
* [개체 관계 정의](./relationships/defining-object-relationships.md)
* [개체 레이아웃 디자인](./layouts/designing-object-layouts.md)
