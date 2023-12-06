# 객체 삭제

{bdg-secondary}`라이프레이 7.4 U26+/GA26+`

초안 및 게시된 개체 정의를 삭제할 수 있습니다. 정의를 삭제하면 게시된 정의에 대해 저장된 항목을 포함하여 관련 데이터가 제거됩니다.

```{important}
Liferay 7.4 U26/GA26 이전 버전의 경우 사용자는 [게시된 개체 정의](./creating-objects.md#publishing-object-drafts) 를 삭제할 수 없습니다.
```

정의에 활성 관계가 있는 경우 정의를 삭제하기 전에 해당 관계를 제거해야 합니다. 자세한 내용은 [관계 제거](./relationships/removing-relationships.md)를 참조하세요.

![You must remove all active relationships before deleting an object definition.](./deleting-objects/images/01.png)

정의를 삭제하려면

1. 전역 메뉴(![전역 메뉴](../../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **개체** 를 클릭합니다.

1. 원하는 정의에 대해 **작업** 버튼(![작업 버튼](../../../images/icon-actions.png))을 클릭하고 **삭제** 를 선택합니다.

1. 대화 상자 창에서 정의 이름을 입력하고 **완료** 를 클릭하여 확인합니다.

   ![Enter the name of the object definition and click Done.](./deleting-objects/images/02.png)

## 관련 주제

* [오브젝트 생성](./creating-objects.md)
* [개체 활성화 및 비활성화](./aactivate-and-deaminating-objects.md)
* [객체 정의 내보내기 및 가져오기](./exporting-and-importing-object-definitions.md)
