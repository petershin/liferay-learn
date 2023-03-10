# 사용자 세그먼트에 역할 할당

> 사용 가능: Liferay DXP 7.2 SP2+, Liferay CE 7.3.1 GA2

사용자 세그먼트는 동적으로 할당된 사용자 컬렉션입니다. [세그먼트가 사용 가능한 기준으로 잘 정의될 수 있는 경우](../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md), 다음의 관리 오버헤드 사용자 관리를 크게 줄일 수 있습니다. 또한 사이트 범위에서 생성된 사용자 세그먼트에 대해 [개인화된 경험](../../site-building/personalizing-site-experience.md)을 정의하여 사용자가 귀하의 사이트에서 가장 관련성 높은 콘텐츠를 볼 수 있도록 할 수 있습니다. 대지.

| 사용자 세그먼트는 어디에서 생성합니까?                      | 무엇을 위한 것입니까?            | 세그먼트에 역할을 할당하는 사이트는 어디입니까?        |
|:------------------------------------------ |:----------------------- |:-------------------------------- |
| 사이트 세그먼트(사이트 메뉴 &rarr; 사람 &rarr; 세그먼트)     | 사이트 사용자를 위한 개인화된 경험 만들기 | 사이트 메뉴 &rarr; 사람 &rarr; 세그먼트(작업) |
| 인스턴스 세그먼트(제어판 &rarr; 사용자 &rarr; 역할(일반 역할)) | 사용자 및 권한을 효율적이고 동적으로 관리 | 제어판 &rarr; 사용자 &rarr; 역할(일반 역할)  |

## 사용자 세그먼트에 일반 역할 할당

> 사용 가능: 라이프레이 DXP 7.2 SP2+

일반 역할은 글로벌 범위에서 생성된 사용자 세그먼트에 할당될 수 있습니다. 사용자 세그먼트에 일반 역할을 할당하려면

1. 제품 메뉴를 열고 **제어판** &rarr; **사용자** &rarr; **역할** 로 이동합니다.

1. 일반 역할 옆에 있는 작업 메뉴(![Actions](../../images/icon-actions.png))를 열고 **편집** 를 선택합니다.
   
   ![역할을 편집하여 사용자 세그먼트를 할당하십시오.](./assigning-roles-to-user-segments/images/01.png)

1. **Assignees** &rarr; **Segments** 탭을 선택하고 (![Add Button](../../images/icon-add.png))를 클릭하여 User Segment를 선택합니다.
   
   ![담당자 아래의 세그먼트 탭으로 이동하여 역할을 할당합니다.](./assigning-roles-to-user-segments/images/02.png)

1. 기존 사용자 세그먼트 옆의 상자를 선택하고 **추가** 을 클릭하여 여기에 역할을 할당합니다. User Segment가 존재하지 않는 경우 (![Add Button](../../images/icon-add.png))을 클릭하여 새 User Segment를 생성합니다.
   
   ![역할을 할당하려는 사용자 세그먼트 옆의 확인란을 선택합니다.](./assigning-roles-to-user-segments/images/03.png)

선택한 사용자 세그먼트가 역할 담당자 목록에 나타납니다.

![사용자 세그먼트는 역할의 담당자 목록 아래에 나타납니다.](./assigning-roles-to-user-segments/images/04.png)

## 사용자 세그먼트에 사이트 역할 할당

> 사용 가능: 라이프레이 DXP 7.2 SP3+

[사이트 역할](./understanding-roles-and-permissions.md) 은 사이트 관리자와 사이트 소유자의 두 가지 예외를 제외하고 세그먼트에 할당될 수 있습니다.

1. 제품 메뉴를 열고 사이트 메뉴에서 **People** &rarr; **Segments** 로 이동합니다.

1. 세그먼트의 작업 메뉴(![Actions](../../images/icon-actions.png))를 열고 **사이트 역할 할당** 을 클릭합니다.

1. 세그먼트에 사이트 역할을 할당한 다음 **추가** 을 클릭합니다.
   
   ![사이트 역할은 세그먼트에 할당될 수 있습니다.](./assigning-roles-to-user-segments/images/05.png)

## 관련 정보

* [사용자 세그먼트 생성](../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md)
