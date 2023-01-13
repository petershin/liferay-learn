# 경험 생성 및 관리

> 일부 경험 기능은 Liferay 7.4+, 7.3 수정팩 1+ 및 7.2 수정팩 11+에서만 사용할 수 있습니다.

*경험*을 사용하여 다양한 사용자 그룹에 맞게 콘텐츠 페이지를 사용자 지정할 수 있습니다. Liferay DXP 경험에 대해 알아보려면 [콘텐츠 페이지 개인화](./content-page-personalization.md)을 참조하십시오.

## 새로운 콘텐츠 페이지 경험 만들기

1. *사이트 관리* &rarr; *사이트 빌더* &rarr; *페이지*로 이동합니다.
1. 작업(![Actions](../../../images/icon-actions.png)) 메뉴를 클릭하고 *편집*또는 [새 콘텐츠 페이지](../../creating-pages/using-content-pages.md)를 선택합니다.
1. 페이지 상단에서 *경험* 의 경우 *기본값* 을 클릭하여 경험 선택 대화 상자를 엽니다.

1. 작업(![Actions](../../../images/icon-actions.png)) 메뉴를 클릭하고 *편집*또는 [새 콘텐츠 페이지](../../creating-pages/adding-pages/adding-a-page-to-a-site.md)를 선택합니다.

1. 페이지 상단에서 경험에 대해 *기본값* 을 클릭하여 경험 선택 대화 상자를 엽니다.

    ![경험을 클릭하여 경험을 선택하거나 새 경험을 클릭하여 새 경험을 만드십시오.](./creating-and-managing-experiences/images/01.png)
1. *새 경험*을 클릭합니다.

1. 경험의 이름을 입력하고 타겟팅할 청중의 세그먼트를 선택하거나 새 세그먼트 [을 생성합니다(Liferay DXP 7.2 수정 팩](../segmentation/creating-and-managing-user-segments.md) 및 Liferay Portal 7.2 CE GA2+에서 사용 가능).

    ```{note}
    새 경험은 기본적으로 *Anyone* 세그먼트에 할당되며 모든 웹사이트 방문자를 대상으로 합니다.
    ```

1. 선택한 세그먼트에 표시할 정보 및 레이아웃으로 콘텐츠 페이지를 편집합니다.

1. 위로(![Up](../../../images/icon-angle-up.png)) 및 아래로(![Down](../../../images/icon-angle-down.png)) 컨트롤을 사용하여 목록에서 경험을 이동하여 우선 순위를 설정합니다(자세한 내용은 [경험 작동 방식 이해](./content-page-personalization.md#understanding-how-experiences-work) 참조).
1. *게시*을 클릭합니다.

페이지의 기본 버전은 정의된 세그먼트에 대한 사이트 버전을 보는 선택한 세그먼트의 구성원을 제외한 모든 사람에게 나타납니다.

## 콘텐츠 페이지 경험 관리

콘텐츠 페이지를 편집할 때 경험을 클릭하여 해당 페이지에 대한 옵션을 관리할 수 있습니다.

![경험에 대한 우선 순위를 추가, 편집, 삭제 또는 변경할 수 있습니다.](./creating-and-managing-experiences/images/04.png)

1. *사이트 관리* &rarr; *사이트 빌더* &rarr; *페이지*로 이동합니다.
2. 동작(![Actions](../../../images/icon-actions.png)) 메뉴를 클릭하고 *편집*를 선택합니다.
3. 관리하려는 경험을 클릭합니다. 여기에서 할 수 있습니다

   - 위로(![Up](../../../images/icon-angle-up.png)) 및 아래로(![Down](../../../images/icon-angle-down.png)) 컨트롤을 사용하여 경험 우선 순위를 설정합니다.
   - 경험의 이름 또는 선택한 세그먼트를 편집(![Edit](../../../images/icon-edit.png))합니다.
   - 경험을 복제(![Duplicate](../../../images/icon-copy.png))합니다(Liferay DXP 7.4+, 7.3 수정팩 1+ 및 7.2 수정팩 11+에서 사용 가능).
   - 삭제 (![삭제](../../../images/icon-delete.png)) 경험.

    ```{important}
    경험 선택기의 경험 순서에 따라 경험 우선 순위가 결정됩니다. 자세한 내용은 [콘텐츠 페이지 개인화](./content-page-personalization.md)에서 *경험 작동 방식 이해*를 참조하십시오.
    ```

## 관련 정보

- [컨텐츠 페이지 개인화](./content-page-personalization.md)
- [컬렉션 개인화](./personalizing-collections.md)
- [사용자 세그먼트 생성 및 관리](../segmentation/creating-and-managing-user-segments.md)
