# Wiki 범위 지정

[위키 노드](./creating-a-node.md) 를 사용하여 콘텐츠를 구성하는 것 외에도 위키 범위를 [전역, 사이트 또는 페이지 범위](https://help.liferay.com/hc/articles/360028819992-Widget-Scope)로 지정할 수 있습니다.

## 세계

전역 사이트 범위 수준에서 생성된 Wiki 페이지는 다른 모든 사이트에서 사용할 수 있습니다. 그러나 콘텐츠는 자동으로 게시되지 않습니다. 관리자는 _Wiki_ 위젯의 범위를 _Global_으로 구성해야 합니다.

### 전역적으로 범위가 지정된 Wiki 페이지 만들기

1. _Wiki_ 위젯이 배포된 사이트 페이지로 이동합니다.
1. _Wiki_ 위젯의 이름 위로 마우스를 이동하고 _Options_ ![Icon Options](../../images/icon-widget-options.png) 를 클릭한 다음 _Configuration_을 클릭합니다.

    ![위키 옵션](./scoping-your-wikis/images/10.png)

1. _범위_을 클릭하십시오.
1. _범위_ 드롭다운 메뉴에서 **전역** 을 선택합니다.

   ![전역 범위 선택](./scoping-your-wikis/images/01.png)

1. _저장_ 을 클릭하고 창을 닫습니다.

_Wiki_ 위젯이 _Global_ 범위에 대한 콘텐츠를 표시하도록 구성되었습니다.

![전역 범위 보기](./scoping-your-wikis/images/02.png)

### 전역 범위 _Wiki_ 페이지 관리

1. _제품 메뉴_ (![Product Menu](../../images/icon-product-menu.png))을 연 다음 사이트 관리 메뉴에서 나침반 아이콘(![Compass](../../images/icon-compass.png))을 클릭합니다. 사이트 선택 대화 상자가 열립니다.
1. _My Sites_ 탭을 선택한 다음 _Global_을 선택합니다.

    ![글로벌 사이트 선택](./scoping-your-wikis/images/06.png)

1. _콘텐츠 & 데이터_ &rarr; _위키_를 클릭합니다.

![전역 범위 위키](./scoping-your-wikis/images/07.png)

여기서 변경한 사항은 전역 범위에 적용됩니다.

## 사이트

기본적으로 _Wiki_ 앱은 현재 선택된 사이트로 범위가 지정됩니다. 특정 사이트로 범위가 지정된 Wiki는 동일한 인스턴스의 다른 사이트에서 생성될 수 있는 Wiki를 볼 때 표시되지 않습니다.

## 페이지

페이지 범위 게시판을 만들면 포럼 회원이 같은 사이트에 있는 다른 페이지에서 다른 Wiki를 볼 수 있습니다.

### 페이지 범위 위키 만들기

1. 범위가 지정될 페이지로 이동합니다(_Second Wiki_).

    ![범위 지정 전 두 페이지](./scoping-your-wikis/images/03.png)

1. 위젯의 제목 표시줄에서 _옵션_ 아이콘(![Options](../../images/icon-widget-options.png))을 클릭하고 _구성_을 선택합니다.
1. _범위_ 탭을 클릭합니다.
1. 페이지 범위가 아직 존재하지 않는 경우 페이지 이름 또는 _\[YOUR-PAGE\] (새로 만들기)_ 를 선택합니다.

    ![페이지 범위 선택](./scoping-your-wikis/images/04.png)

1. _저장_ 을 클릭한 다음 대화창을 닫습니다.

두 번째 페이지는 페이지 범위에 대해 구성되었습니다.

![새 페이지 범위 위키 보기](./scoping-your-wikis/images/05.png)

### 페이지 범위 위키 관리

관리자는 여전히 _사이트 관리_ 메뉴를 사용하여 _사이트 관리 메뉴_의 활성 범위를 설정하여 페이지 범위 Wiki 위젯을 관리해야 합니다. 다음과 같이하세요:

1. _제품 메뉴_ (![Product Menu](../../images/icon-product-menu.png))을 열고 사이트 메뉴를 확장한 다음 _콘텐츠 & 데이터_를 클릭합니다.
1. 현재 범위는 Content & Data 표제 바로 아래에 나타납니다. 기본 범위는 현재 사이트입니다. 이를 변경하려면 기어 아이콘(![Gear](../../images/icon-control-menu-gear.png))을 클릭한 다음 원하는 범위를 선택합니다. 선택한 범위를 반영하도록 사이트 관리 메뉴가 변경됩니다. 예를 들어 페이지 범위에서 작업하려면 기어 아이콘에서 해당 페이지를 선택합니다. 그러면 해당 페이지의 이름이 사이트 관리 메뉴의 제목이 됩니다.

    ![새 페이지 범위 위키 선택](./scoping-your-wikis/images/08.png)

1. _위키_을 클릭합니다.

여기서 변경한 내용은 이전 단계에서 선택한 범위에 적용됩니다.

![새 페이지 범위 위키 선택](./scoping-your-wikis/images/09.png)

## 추가 정보

* [위젯 범위](https://help.liferay.com/hc/articles/360028819992-Widget-Scope)
