# 객체 뷰 디자인

{bdg-secondary}`라이프레이 7.4+`

보기는 개체의 응용 프로그램 페이지에 항목이 표시되는 방식을 정의합니다. 게시된 각 개체에는 자동 생성된 보기가 있지만 직접 만들 수도 있습니다.

![Design custom views for displaying object entries.](./designing-object-views/images/01.png)

다음과 같이하세요:

1. **전역 메뉴**( ![전역 메뉴](../../../../images/icon-applications-menu.png) )를 열고 **제어판** 탭으로 이동한 후 **개체를 클릭합니다.** .

1. 사용자 정의 개체 정의 편집을 시작하고 **보기** 탭으로 이동한 다음 **추가**( ![추가 버튼](../../../../images/icon-add.png) )를 클릭합니다.

   ```{note}
   시스템 개체는 사용자 정의 보기를 지원하지 않습니다. 자세한 내용은 [시스템 개체 확장](../extending-system-objects.md)을 참조하세요.
   ```

1. **이름** 을 입력하고 **저장** 을 클릭하세요.

   ![Enter a name and click Save.](./designing-object-views/images/02.png)

1. 편집을 시작하려면 새 보기를 클릭하세요.

1. 기본 정보 탭에서 **기본값으로 표시** 를 선택하여 객체 정의에 대한 기본 보기로 설정합니다.

   이렇게 하면 개체의 응용 프로그램 페이지에 보기가 사용됩니다. 사용자 정의 레이아웃이 기본값으로 설정되지 않은 경우 개체는 자동 생성된 레이아웃을 사용합니다.

   ![Set the view as default.](./designing-object-views/images/03.png)

1. **뷰 작성기** 탭으로 이동하여 **추가** 버튼(![추가 버튼](../../../../images/icon-add.png))을 클릭합니다.

1. 보기 테이블에 포함하려는 **필드** 를 선택하고 **저장** 을 클릭하세요.

   선택한 각 필드는 보기 테이블의 열이 됩니다. 사용 가능한 옵션에는 [사용자 정의 필드](../fields/adding-fields-to-objects.md)와 기본 시스템 필드(예: ID, 작성자, 생성 날짜, 수정 날짜 및 워크플로 상태)가 모두 포함됩니다. 그러나 사용자 정의 보기는 여러 항목(예: 일대다 또는 다대다 관계의 관계 테이블)이 포함된 열을 지원하지 않습니다.

1. 필드를 끌어서 놓아 보기 테이블에서 순서를 결정합니다.

   ![Arrange the fields in any order.](./designing-object-views/images/04.png)

1. **저장** 을 클릭하세요.

저장되면 보기 테이블에 선택한 필드가 표시됩니다. 원하는 경우 [열 표시 이름](./renaming-table-columns.md)의 이름을 바꾸고 현지화하고, [기본 정렬](./setting-a-default-sorting.md)을 추가하고, 원하는 필드를 선택할 수도 있습니다. [테이블 필터](./adding-filters-to-views.md)로 사용합니다.

![The view table only displays the selected fields.](./designing-object-views/images/05.png)

```{tip}
7.4 U21+의 경우 작업 버튼( ![작업 버튼](../../../../images/icon-actions.png) )을 클릭하고 *복제*를 선택하여 뷰를 복제할 수 있습니다. 이렇게 하면 이름에 "(복사)"가 추가된 원본 보기의 전체 복사본이 생성됩니다.
```

## 관련 주제

* [오브젝트 생성](../creating-objects.md)
* [객체에 필드 추가](../fields/adding-fields-to-objects.md)
* [객체 레이아웃 디자인](../layouts/designing-object-layouts.md)
