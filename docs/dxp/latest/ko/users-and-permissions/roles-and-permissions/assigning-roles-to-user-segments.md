# 사용자 세그먼트에 역할 할당

> 사용 가능: Liferay DXP 7.2 SP2+, Liferay CE 7.3.1 GA2

사용자 세그먼트는 동적으로 할당된 사용자 컬렉션입니다. 사용 가능한 기준 [사용하여](../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) 세그먼트를 잘 정의할 수 있으면 사용자 관리에 따른 관리 오버헤드를 크게 줄일 수 있습니다. 또한 사이트 범위에서 생성된 사용자 세그먼트에 대해 [개인화된 경험](../../site-building/personalizing-site-experience.md) 정의하여 사용자가 사이트에서 가장 관련성이 높은 콘텐츠를 볼 수 있도록 할 수 있습니다.

| 사용자 세그먼트는 어디서 생성하나요?                                                                       | 그것들은 무엇을 위한 것인가요?             | 세그먼트에 역할을 어디에서 할당합니까?                                         |
| :----------------------------------------------------------------------------------------- | :---------------------------- | :------------------------------------------------------------ |
| 사이트 세그먼트(사이트 메뉴 &rarr; 명 &rarr; 세그먼트)                         | 사이트 사용자를 위한 개인화된 경험을 만드세요.    | 사이트 메뉴 &rarr; 명 &rarr; 세그먼트 (작업) |
| 인스턴스 세그먼트(제어판 &rarr; 사용자 &rarr; 역할(일반 역할)) | 사용자와 해당 권한을 효율적이고 동적으로 관리합니다. | 제어판 &rarr; 사용자 &rarr; 역할(일반 역할)  |

## 사용자 세그먼트에 일반 역할 할당

{bdg-secondary}`liferay DXP 7.2 SP2+`

Analytics 관리자, 포털 콘텐츠 검토자, 고급 사용자, 출판 사용자 및 귀하가 생성하는 기타 일반 역할을 전역 범위에서 생성된 사용자 세그먼트에 할당할 수 있습니다. 사용자 세그먼트에 일반 역할을 할당하려면

1. _제품 메뉴_(![제품 메뉴](../../images/icon-product-menu.png))를 열고 _제어판_ &rarr; _사용자_ &rarr; _역할_로 이동합니다.

1. 일반 역할 옆에 있는 _작업_(![작업](../../images/icon-actions.png))을 클릭하고 _편집_을 선택합니다.

   ![Edit a role to assign the user segment to it.](./assigning-roles-to-user-segments/images/01.png)

1. _담당자_ &rarr; _세그먼트_ 탭을 선택하고 _추가_(![추가 버튼](../../images/icon-add.png))를 클릭하여 사용자 세그먼트를 선택합니다.

   ![Go to the Segments tab under Assignees to assign the role.](./assigning-roles-to-user-segments/images/02.png)

1. 기존 사용자 세그먼트 옆에 있는 확인란을 선택하고 _추가_를 클릭하여 역할을 할당합니다. 사용자 세그먼트가 존재하지 않는 경우 _추가_(![추가 버튼](../../images/icon-add.png))를 클릭하여 새 사용자 세그먼트를 생성합니다.

   ![Check the box next to the user segment you want to assign the role to.](./assigning-roles-to-user-segments/images/03.png)

선택한 사용자 세그먼트가 역할 담당자 목록에 나타납니다.

![The user segment appears under the list of assignees for the role.](./assigning-roles-to-user-segments/images/04.png)

## 사용자 세그먼트에 사이트 역할 할당

{bdg-secondary}`liferay DXP 7.2 SP3+`

[사이트 역할](./understanding-roles-and-permissions.md) 사이트 관리자와 사이트 소유자라는 두 가지 예외를 제외하고 세그먼트에 할당될 수 있습니다.

1. 제품 메뉴(![제품 메뉴](../../images/icon-product-menu.png))를 열고 _사람_ &rarr; _세그먼트_로 이동합니다.

1. 세그먼트의 _작업_(![작업](../../images/icon-actions.png))을 열고 _사이트 역할 할당_을 클릭합니다.

1. 세그먼트에 사이트 역할을 할당한 다음 _추가_를 클릭합니다.

   ![Site roles can be assigned to segments.](./assigning-roles-to-user-segments/images/05.png)

## 관련 정보

* [사용자 세그먼트 생성](../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md)
