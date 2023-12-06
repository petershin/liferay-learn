# 요소 관리

새 요소를 생성하려면 **추가**(![Add](../../../../../images/icon-add.png))을 클릭합니다. 자세한 내용은 [요소 만들기](./creating-elements.md) 참조하십시오.

기존 맞춤 요소를 삭제하려면 체크박스 선택기를 사용하여 요소를 선택하고 삭제(![Delete](../../../../../images/icon-trash.png)) 버튼을 클릭합니다.

![사용자 지정 요소는 보거나, 복사하거나, 내보내거나, 삭제할 수 있습니다.](./managing-elements/images/01.png)

```{note}
시스템 요소(즉, 기본 제공)는 편집하거나 삭제할 수 없습니다. 사용자 정의 요소를 기반으로 하려면 시스템 요소를 복사하십시오.
```

기존 요소를 복제하려면 **작업**(![Actions](../../../../../images/icon-actions.png))을 클릭하고 **복사** 선택합니다. 다른 맞춤 요소와 마찬가지로 복제된 요소를 삭제하거나 편집할 수 있습니다.

요소를 내보내려면 해당 요소에 대해 **작업**(![Actions](../../../../../images/icon-actions.png))을 클릭하고 **내보내기** 선택합니다.

요소를 가져오려면 화면 상단 모서리(전역 메뉴 아이콘 옆)에서 **작업**(![Actions](../../../../../images/icon-actions.png))을 클릭합니다. **가져오기** 클릭하고 요소의 JSON 파일을 찾습니다.

![요소 JSON 파일을 가져옵니다.](./managing-elements/images/02.png)

```{warning}
[요소 스키마](./creating-elements.md#understanding-the-element-schema) 는 변경될 수 있습니다. Liferay 버전 간에 스키마가 변경되면 이전 요소의 JSON 가져오기가 실패할 수 있습니다.
```

## 관련 주제

* [요소 생성](./creating-elements.md)
* [미리 정의된 요소 변수 참조](./predefined-element-variables-reference.md)
* [검색 Blueprint 생성 및 관리](../creating-and-managing-search-blueprints.md)
