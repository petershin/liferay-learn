# 개체 보기 디자인

{bdg-secondary}`사용 가능한 Liferay 7.4+`

보기는 개체의 응용 프로그램 페이지에 항목이 표시되는 방식을 정의합니다. 게시된 각 개체에는 자동 생성된 보기가 있지만 직접 만들 수 있습니다.

![개체 항목을 표시하기 위한 사용자 지정 보기를 디자인합니다.](./designing-object-views/images/01.png)

다음과 같이하세요:

1. **Global Menu**( ![Global Menu](../../../../images/icon-applications-menu.png) )을 열고 **Control Panel** 탭으로 이동하여 **Objects** 을 클릭합니다.

1. 사용자 객체 정의 편집을 시작하고 **보기** 탭으로 이동한 다음 **추가**( ![추가 버튼](../../../../images/icon-add.png) ).

   ```{note}
   시스템 개체는 사용자 지정 보기를 지원하지 않습니다. 자세한 내용은 [시스템 개체 확장](../extending-system-objects.md)을 참조하십시오.
   ```

1. **이름** 을 입력하고 **저장** 을 클릭합니다.

   ![이름을 입력하고 저장을 클릭합니다.](./designing-object-views/images/02.png)

1. 편집을 시작하려면 새 보기를 클릭하십시오.

1. 기본 정보 탭에서 **기본으로 표시** 을 선택하여 개체 정의에 대한 기본 보기로 설정합니다.

   이렇게 하면 보기가 개체의 응용 프로그램 페이지에 사용됩니다. 사용자 지정 레이아웃이 기본값으로 설정되지 않은 경우 객체는 자동 생성된 레이아웃을 사용합니다.

   ![보기를 기본값으로 설정합니다.](./designing-object-views/images/03.png)

1. **View Builder** 탭으로 이동하여 **추가** 버튼(![Add Button](../../../../images/icon-add.png))을 클릭합니다.

1. 보기 테이블에 포함할 **필드** 를 확인하고 **저장** 을 클릭합니다.

   선택한 각 필드는 뷰 테이블의 열이 됩니다. 사용 가능한 옵션에는 [사용자 정의 필드](../fields/adding-fields-to-objects.md) 및 기본 시스템 필드(예: ID, 작성자, 생성 날짜, 수정 날짜 및 워크플로 상태)가 모두 포함됩니다. 그러나 사용자 정의 보기는 여러 항목(예: 일대다 또는 다대다 관계의 관계 테이블)을 포함하는 열을 지원하지 않습니다.

1. 필드를 드래그 앤 드롭하여 보기 테이블에서 순서를 결정합니다.

   ![임의의 순서로 필드를 정렬합니다.](./designing-object-views/images/04.png)

1. **저장** 을 클릭합니다.

저장되면 뷰 테이블에 선택한 필드가 표시됩니다. 원하는 경우 [열 표시 이름](./renaming-table-columns.md)의 이름을 바꾸고 지역화하고 [기본 정렬](./setting-a-default-sorting.md)을 추가하고 [테이블 필터](./adding-filters-to-views.md)로 사용할 필드를 선택할 수 있습니다.

![보기 테이블에는 선택한 필드만 표시됩니다.](./designing-object-views/images/05.png)

```{tip}
7.4 U21+의 경우 작업 버튼( ![작업 버튼](../../../../images/icon-actions.png) )을 클릭하고 *Duplicate*를 선택하여 보기를 복제할 수 있습니다. 이렇게 하면 이름에 "(복사)"가 추가된 원본 보기의 완전한 복사본이 생성됩니다. 
```

## 추가 정보

* [개체 만들기](../creating-objects.md)
* [개체에 필드 추가](../fields/adding-fields-to-objects.md)
* [개체 레이아웃 디자인](../layouts/designing-object-layouts.md)
