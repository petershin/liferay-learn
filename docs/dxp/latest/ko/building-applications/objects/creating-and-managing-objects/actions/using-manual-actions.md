# 수동 조치 사용

{bdg-secondary}`liferay 7.4 U60+/GA60+`

개체 작업에 독립 실행형 트리거를 사용하면 작업이 자동이 아닌 수동이 됩니다. 다음 방법을 사용하여 이러한 작업을 트리거합니다.

* [객체의 UI](#trigger-actions-via-the-object-entry-ui)
* [전용 작업 API](#trigger-actions-via-apis)
* [페이지의 버튼](#trigger-actions-via-pages)

이 예에서는 알림을 보내기 위한 독립형 작업을 만듭니다.

![You can use the standalone trigger to run any type of object action manually.](./using-manual-actions/images/01.png)

자세한 내용은 [개체 작업 정의](./defining-object-actions.md) 참조하세요.

## 개체 항목 UI를 통해 작업 트리거

활성 독립 실행형 작업은 개체 항목의 작업 메뉴에 나타납니다. UI를 통해 이러한 작업을 실행하려면

1. 객체 정의의 애플리케이션 페이지로 이동합니다.

1. 원하는 항목에 대해 **작업** 버튼(![작업 버튼](../../../../images/icon-actions.png))을 클릭하고 독립 실행형 작업을 선택합니다.

   이 예에서 작업은 알림 보내기입니다.

   ![Click the Actions button for the desired entry and select the standalone action.](./using-manual-actions/images/02.png)

## API를 통해 작업 트리거

Liferay는 게시된 개체 정의에 대한 REST API를 자동으로 생성합니다. 여기에는 활성 독립 실행형 작업을 위한 API가 포함됩니다.

이러한 API를 보려면

1. `[서버]:[포트]/o/api`(예: `localhost:8080/o/api`)에서 Liferay의 API 탐색기를 엽니다.

1. **REST 애플리케이션** 을 클릭하고 원하는 개체 정의를 선택합니다. 사용자 정의 개체는 `c/[pluralobjectlabel]` 명명 패턴(예: `c/tickets`)을 사용합니다.

각 독립 실행형 작업에 대해 Liferay는 두 개의 PUT API를 생성합니다. 하나는 항목 ID를 사용하고 다른 하나는 항목의 외부 참조 코드(ERC)를 사용합니다.

![Liferay generates two PUT APIs: one that uses the entry's ID and another that uses the entry's ERC.](./using-manual-actions/images/03.png)

두 API 중 하나를 호출하면 지정된 항목에 대한 작업이 트리거됩니다.

![Calling the API triggers the action for the specified entry.](./using-manual-actions/images/04.png)

## 페이지를 통해 작업 트리거

페이지의 버튼에 독립 실행형 작업을 매핑할 수 있습니다( [콘텐츠 페이지](#mapping-buttons-to-object-actions-in-content-pages) 또는 [표시 페이지 템플릿](#mapping-buttons-to-object-actions-in-display-page-templates)).

Liferay의 기본 버튼 조각이 사용 사례를 만족시키지 못하는 경우, 해당 HTML 태그에 `data-lfr-editable-id="action"` 및 `data-lfr-editable-type="action"` 속성을 추가하여 사용자 정의 버튼에 액션을 매핑할 수 있습니다. 조각에 속성을 추가하는 방법에 대해 자세히 알아보려면 [조각별 태그 및 속성 참조](../../../../site-building/developer-guide/reference/fragments/fragment-specific-tags-reference.md)를 참조하세요.

다음은 작업 가능한 맞춤 버튼의 예입니다.

```html
<button class="btn btn-${configuration.buttonSize} btn-${configuration.buttonType}" 
        data-lfr-editable-id="action" data-lfr-editable-type="action">
    Go Somewhere
</button>
```

### 콘텐츠 페이지의 개체 작업에 버튼 매핑

1. [페이지 만들기](../../../../site-building/creating-pages.md).

1. 레이아웃에 **버튼** 조각을 추가하세요. 콘텐츠 페이지를 편집하는 방법을 알아보려면 [콘텐츠 페이지에 요소 추가](../../../../site-building/creating-pages/using-content-pages/adding-elements-to-content-pages.md) 참조하세요.

1. 버튼을 한 번 클릭해 보세요. 버튼 옵션에서 유형으로 **작업** 을 선택하세요. 이제 버튼에 작업을 매핑할 수 있습니다.

1. 버튼을 두 번째로 클릭하세요. 오른쪽에 작업 메뉴가 열립니다.

1. 매핑 탭에서 **항목** 필드 또는 옆에 있는 **항목 선택** 아이콘(![항목 선택](../../../../images/icon-add-app.png))을 클릭합니다. 필드.

1. 상단 목록에서 개체를 선택합니다.

   사용 가능한 개체 항목이 하단에 나타납니다.

1. 특정 개체 항목을 선택합니다.

   ![Select a specific object entry](./using-manual-actions/images/05.png)

1. 버튼 라벨에 매핑할 **필드** 를 선택하세요.

1. 작업 탭에서 특정 개체 항목을 선택합니다.

1. 작업을 선택하세요.

1. 선택적으로 성공 및 오류 상호 작용을 설정합니다. 자세한 내용은 [성공 및 오류 상호 작용 관리](#managing-success-and-error-interactions) 참조하세요.

```{tip}
작업에 매핑된 구성 요소가 있는 컬렉션 표시 조각이나 양식 조각을 사용할 수 있습니다. 자세한 내용은 [컬렉션](../../../../site-building/displaying-content/collections-and-collection-pages/displaying-collections.md) 및 [표시 조각을 사용하여 양식 작성](../../using-fragments-to-build-forms.md)참조하세요.
```

이제 버튼을 클릭하면 선택한 작업이 실행됩니다.

### 표시 페이지 템플릿의 개체 작업에 버튼 매핑

1. [표시 페이지 템플릿을 생성하고](../../../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md) 개체를 콘텐츠 유형으로 선택합니다.

   이렇게 하면 버튼이나 작업을 매핑할 때 개체가 기본 소스가 됩니다.

   ![Chose your object as the content type when creating a display page template.](./using-manual-actions/images/06.png)

1. 레이아웃에 **버튼** 조각을 추가하세요.

1. 버튼을 한 번 클릭해 보세요. 버튼 옵션에서 유형으로 **작업** 을 선택하세요.

   이 구성을 사용하면 작업을 버튼에 매핑할 수 있습니다.

1. 버튼을 두 번째로 클릭하세요.

   오른쪽에 작업 메뉴가 열립니다. 매핑 및 작업 탭에서 개체가 이미 기본 소스로 설정되어 있습니다.

   ```{note}
   특정 콘텐츠를 선택해야 하는 경우 *소스* 필드를 클릭하고 *특정 콘텐츠*를 선택한 다음 특정 *항목*을 선택합니다.
   ```

1. 버튼 라벨에 매핑할 **필드** 를 선택하세요.

1. 작업 탭에서 사용자가 버튼을 클릭하면 트리거할 작업을 선택합니다.

1. 선택적으로 성공 및 오류 상호 작용을 설정합니다. 자세한 내용은 [성공 및 오류 상호 작용 관리](#managing-success-and-error-interactions) 참조하세요.

이제 버튼을 클릭하면 선택한 작업이 실행됩니다.

### 성공 및 오류 상호 작용 관리

사용자가 작업에 매핑된 구성 요소를 클릭하면 해당 작업이 성공하거나 실패할 때 어떤 일이 발생하는지 선택할 수 있습니다.

두 결과 모두에 대해 네 가지 옵션을 사용할 수 있습니다.

1. **없음** : 작업이 수행된 후 아무 일도 일어나지 않습니다.

1. **알림 표시** : 사용자에게 알립니다. 사용자 정의 성공/오류 메시지를 작성하고, 알림을 미리 보고, 작업이 트리거된 후 페이지를 다시 로드하도록 구성할 수 있습니다.

1. **페이지로 이동** : 사이트의 성공/오류 페이지로 이동합니다.

1. **외부 URL로 이동** : 외부 URL로 이동합니다.

![You can choose what happens after an action is performed when the user clicks on a button or fragment mapped to an action: nothing, the user receives a notification, the user is redirected to a page, or the user is redirected to an external URL.](./using-manual-actions/images/07.png)

사용자가 작업을 트리거한 후에 선택한 옵션이 실행됩니다.

## 작업 권한

Liferay는 독립 실행형 작업을 트리거할 수 있는 역할을 관리하기 위한 권한을 자동으로 생성합니다. 각 권한은 `action. [actionName]` 명명 패턴(예: `action.sendReminder`). 개체 권한에 대한 자세한 내용은 [권한 프레임워크 통합](../../understanding-object-integrations/permissions-framework-integration.md) 을 참조하세요.

![Standalone permissions use the action. [actionName] naming pattern.](./using-manual-actions/images/08.png)

## 관련 주제

* [개체 작업 정의](./defining-object-actions.md)
* [액션 유형 이해](./understanding-action-types.md)
* [헤드리스 프레임워크 통합](../../understanding-object-integrations/using-custom-object-apis.md)
