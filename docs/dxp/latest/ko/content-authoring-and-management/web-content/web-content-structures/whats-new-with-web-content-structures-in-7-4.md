# 7.4의 웹 컨텐츠 구조의 새로운 기능은 무엇입니까?

Liferay 7.4부터 웹 콘텐츠 구조는 양식 작성을 위한 백엔드 프레임워크로 DDM(동적 데이터 매핑)에서 DE(데이터 엔진)로 마이그레이션되었습니다.

![Web content structures are built using a form builder backed by the Data Engine framework.](./whats-new-with-web-content-structures-in-7-4/images/01.png)

데이터 엔진 프레임워크는 웹 콘텐츠 구조에 새로운 변경 사항과 향상된 기능을 제공합니다.

## 새롭게 개선된 필드 유형

데이터 엔진으로의 이동의 일부로 필드 유형이 추가되고 개선되었습니다.

- 목록에서 선택 필드의 옵션은 알파벳순으로 정렬될 수 있습니다(목록에서 선택 필드의 고급 설정 사용).
- 숫자 필드를 정수 또는 소수 필드로 구성합니다.
- 그리드 필드는 웹 콘텐츠, 문서 및 미디어의 새로운 필드 유형입니다. 자세한 내용은 [양식 필드 유형 참조](../../../process-automation/forms/creating-and-managing-forms/forms-field-types-reference.md)를 참조하세요.
- HTML 필드는 편리한 도구 모음이 포함된 서식 있는 텍스트 필드로 대체되었습니다.

```{warning}
**부울 필드와 다중 선택 필드 비교:** 데이터 엔진에는 처음에 부울 필드가 포함되지 않았습니다. 대신, 업그레이드된 구조의 부울 필드는 동일한 레이블과 하나의 옵션만 사용하는 데이터 엔진의 다중 선택 필드를 사용하도록 마이그레이션되었습니다. 예를 들어 템플릿이 부울 필드가 있는 구조에 구축된 경우 이로 인해 몇 가지 문제가 발생할 수 있습니다. Liferay 7.4 업데이트/GA 23에서는 부울 필드 유형이 데이터 엔진에 추가되었습니다. 업데이트 23 이후 업그레이드된 구조는 웹 콘텐츠 구조에서 7.3 DDM 부울 필드를 7.4 DE 부울 필드로 성공적으로 변환했습니다. 이 변경 전에 설치가 업그레이드된 경우 영향을 받는 구조를 편집하여 이러한 단일 옵션 다중 선택 필드를 부울 필드로 수동으로 변경해야 합니다.
```

## 하위 구조가 구조 필드 세트로 대체됩니다.

DDM이 지원하는 구조에는 모든 상위 필드와 설정을 상속한 하위 구조가 포함될 수 있습니다. 이제 Liferay 7.4에서는 구조에 대해 재사용 가능한 필드 세트를 생성할 수 있는 필드 세트를 생성할 수 있으므로 이 관계는 더 이상 존재하지 않습니다. 필드세트를 사용하면 편집할 때 구조가 어떻게 보이는지 확인할 수 있으므로 편집 환경이 향상됩니다.

```{warning}
- 필드 세트는 여러 구조에서 재사용 가능합니다. 단일 구조 내에서 편집하면 모든 구조가 동시에 변경됩니다.

- 필드 세트 또는 구조가 웹 콘텐츠에 사용되는 경우 편집 시 사용자에게 경고가 표시됩니다.

    ![컨텐츠 참조가 있는 구조 및 필드 세트를 주의 깊게 편집하세요.](./whats-new-with-web-content-structures-in-7-4/images/02.png)
```

필드세트로 작업하려면,

1. **사이트 메뉴**( ![사이트 메뉴](../../../images/icon-product-menu.png) )로 이동하여 **콘텐츠 및 데이터** &rarr; **웹 콘텐츠** 로 이동합니다.

1. **구조** 탭을 선택합니다.

1. **추가**( ![구조 추가](../../../images/icon-add.png) )를 클릭하여 새 구조를 만듭니다.

1. 웹 콘텐츠 구조 양식 작성기 보기(![양식 작성기 아이콘](../../../images/icon-builder.png))에서 **필드 세트** 탭을 클릭합니다.

1. **새 필드세트 만들기** 를 클릭합니다. 필드세트의 이름을 지정합니다.

1. 해당 필드를 추가하고 구성합니다. **저장** 을 클릭하세요.

![Use structures or dedicated fieldsets in your structure.](./whats-new-with-web-content-structures-in-7-4/images/03.png)

새 구조 생성을 시작하면 필드세트 탭에서 기존 필드세트나 구조를 선택할 수 있습니다. 기본 웹 콘텐츠 구조는 즉시 사용 가능한 필드 세트로 포함됩니다.

## 구조 정의 소스 변경 사항

DE의 구조는 JSON으로 표현됩니다(DDM에서는 XML이었습니다). 웹 콘텐츠 구조 UI에서 코드를 편집하는 대신 이제 구조 정의를 가져오고 내보내 구조의 소스 JSON을 로컬에서 사용할 수 있습니다.

```{warning}
JSON 구조 소스는 언뜻 보이는 것보다 더 복잡할 수 있으므로 주의해서 작업하세요. 예를 들어 구조에 필드를 추가할 때 `dataDefinitionFields` 배열과 `defaultDataLayout` 요소를 모두 업데이트해야 합니다.
```

### 구조의 JSON 내보내기

1. **사이트 메뉴**( ![사이트 메뉴](../../../images/icon-product-menu.png) )로 이동하여 **콘텐츠 및 데이터** &rarr; **웹 콘텐츠** 로 이동합니다.

1. **구조** 탭을 클릭하세요.

1. 기존 구조가 없으면 [하나 생성](./creating-structures.md)하고 저장합니다.

1. 기본 구조 목록 보기에서 구조의 **작업** 메뉴( ![작업 메뉴](../../../images/icon-actions.png) )를 열고 **JSON으로 내보내기** 를 클릭합니다.

### 기존 구조를 덮어쓰기 위해 구조의 JSON 가져오기

기존 구조의 JSON을 덮어쓰려면

1. **사이트 메뉴**( ![사이트 메뉴](../../../images/icon-product-menu.png) )로 이동하여 **콘텐츠 및 데이터** &rarr; **웹 콘텐츠** 로 이동합니다.

1. **구조** 탭을 클릭하세요.

1. 기존 구조가 없으면 [하나 생성](./creating-structures.md)하고 저장합니다.

1. 기본 구조 목록 보기에서 구조의 **작업** 메뉴(![작업 메뉴](../../../images/icon-actions.png))를 열고 **가져오기 및 재정의** 를 클릭합니다.

1. JSON 파일을 업로드합니다.

![Export and import the JSON of a web content structure.](./whats-new-with-web-content-structures-in-7-4/images/04.png)

### 구조의 JSON을 가져와서 새 구조 만들기

새 구조를 가져오려면

1. **사이트 메뉴**( ![사이트 메뉴](../../../images/icon-product-menu.png) )로 이동하여 **콘텐츠 및 데이터** &rarr; **웹 콘텐츠** 로 이동합니다.

1. **구조** 탭을 클릭하세요.

1. 화면 오른쪽 상단에서 웹 콘텐츠에 대한 **옵션** 메뉴(![옵션 버튼](../../../images/icon-actions.png))를 엽니다.

1. **구조 가져오기** 를 클릭합니다.

   ![Import JSON structure files.](./whats-new-with-web-content-structures-in-7-4/images/05.png)

## 유연한 구조 레이아웃

이전에는 구조 필드를 양식에서 정렬하고 중첩하여 양식의 계층적 보기를 만들 수 있었습니다. 구조의 데이터 엔진 표현에는 열을 정의하는 기능이 추가됩니다.

![Create a structure with two columns per row.](./whats-new-with-web-content-structures-in-7-4/images/06.png)

구조 작성기에서 두 개의 양식 필드를 나란히 추가하고 필드 가장자리를 끌어 열 크기를 조정합니다.

열 외에도 필드 그룹을 사용하여 구조 필드의 하위 집합을 함께 잠그면 쉽게 관리할 수 있습니다. 다른 필드 위에 필드를 놓아 필드 그룹을 만듭니다.

## 웹 콘텐츠 구조 키 설정

```{warning}
새 구조를 생성할 때(아래 설명 참조) 또는 [JSON을 새 구조로 가져올 때](#importing-a-structures-json-to-create-a-new-structure) 수동으로 구조 키를 설정할 수 있습니다. [기존 구조를 가져와서 덮어쓰는](#importing-a-structures-json-to-overwrite-an-existing-structure) 경우에도 기존 구조의 키를 업데이트할 수 없습니다.
```

1. **전역 메뉴**(![전역 메뉴](../../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동합니다.

1. **구성** &rarr; **시스템 설정** &rarr; **웹 콘텐츠**(콘텐츠 및 데이터 아래)로 이동합니다.

1. **관리** 를 클릭하세요. **구조 키 자동 생성** 을 선택 취소하고 **업데이트** 를 클릭하세요.

1. **사이트 메뉴**( ![사이트 메뉴](../../../images/icon-product-menu.png) )로 이동하여 **콘텐츠 및 데이터** &rarr; **웹 콘텐츠** 로 이동합니다. 구조 탭을 열고 새 구조를 추가합니다.

1. 필드를 추가하고 구조 이름을 지정합니다. 구조 키를 수동으로 설정하려면 구성 아이콘( ![Configuration](../../../images/icon-cog3.png) )을 클릭하여 **속성 사이드바** 를 엽니다.

1. **구조 키** 필드를 편집하여 사용자 정의 값(예: `MY_STRUCTURE_KEY`)을 추가합니다.

1. 구조를 저장합니다.

새로운 데이터 엔진 지원 구조를 사용하면 내보내기 프로세스가 JSON에서 구조 키를 제거합니다. 즉, 정의를 가져오면(예: 새 사이트로) 새 구조 키가 생성됩니다. 내보내기-가져오기 프로세스 전반에 걸쳐 구조 키를 유지하거나 새 사용자 정의 키를 제공하려면 내보낸 JSON을 편집해야 합니다.

[내보낸 JSON](#structure-definition-source-changes) 에 사용자 정의 구조 키를 추가하려면,

1. 내보낸 JSON 파일(예: `Structure_my 구조_42153_20220721144913685.json`)을 엽니다.

1. `"dataDefinitionField"` 요소 앞에 `"dataDefinitionKey"` 요소를 추가합니다.
   ```json
   {
      "availableLanguageIds": ["en_US"],
      "contentType": "journal",
      "dataDefinitionKey": "MY_STRUCTURE_KEY",
      "dataDefinitionFields": [{"..."}]
   }
   ```

1. [Import](#importing-a-structures-json-to-create-a-new-structure) 구조 정의 파일을 다운로드하고 속성 탭을 확인하여 키를 가져왔는지 확인하세요.

   ![The Properties tab shows the structure key, whether it's a custom key or autogenerated by Liferay.](./whats-new-with-web-content-structures-in-7-4/images/07.png)
