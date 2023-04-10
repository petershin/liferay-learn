# 위젯 템플릿으로 위젯 스타일 지정

위젯 템플릿을 사용하여 **Asset Publisher** 및 **Media Gallery** 위젯과 같은 기본 위젯의 모양과 기능을 사용자 정의할 수 있습니다.

## 위젯 템플릿 만들기

1. **사이트 메뉴** ![Site Menu](../../../images/icon-product-menu.png)에서 **디자인** &rarr; **템플릿** 클릭합니다.

1. **위젯 템플릿** 탭으로 이동합니다.

   ![템플릿 애플리케이션에서 위젯 템플릿 페이지에 액세스합니다.](./styling-widgets-with-widget-templates/images/01.png)

1. **추가**(![Add Button](../../../images/icon-add.png))을 클릭하고 템플릿에 대한 위젯(예: Asset Publisher)을 선택합니다.

   ![위젯 템플릿 생성 페이지는 사용할 필드 또는 변수를 쉽게 추가할 수 있는 컨트롤을 제공합니다.](./styling-widgets-with-widget-templates/images/02.png)

1. 위젯 템플릿의 이름을 추가합니다.

1. 템플릿 편집기에 FreeMarker 스크립트를 입력합니다. 요소 측면 패널( ![요소](../../../images/icon-list-ul.png) ) 템플릿에 필드, 변수 및 유틸리티를 추가합니다. 또는 `${` 을 입력하여 필드 제안을 볼 수 있습니다.

   ```{note}
   Liferay DXP/Portal 7.4+의 경우 위젯 템플릿은 FreeMarker만 지원합니다. Velocity는 더 이상 지원되지 않습니다.
   ```

1. **저장** 클릭합니다.

이렇게 하면 페이지의 해당 유형의 위젯에 적용할 수 있는 새 위젯 템플릿이 생성됩니다.

## 위젯 템플릿 적용

1. 적절한 위젯에 대해 **작업** 버튼(![Actions Button](../../../images/icon-actions.png))을 클릭한 다음 **구성을 클릭합니다.**

1. 디스플레이 템플릿 드롭다운 메뉴를 찾아 원하는 템플릿을 선택합니다.

   ![해당 위젯 구성의 템플릿 표시 드롭다운 메뉴에서 위젯 템플릿을 선택합니다.](./styling-widgets-with-widget-templates/images/03.png)

   ```{note}
   이 드롭다운 메뉴는 대부분의 위젯에 대한 기본 탭인 설정에 있습니다. 자산 게시자 위젯의 경우 이 설정은 디스플레이 설정 탭 아래에 있습니다.
   ```

1. **저장** 클릭합니다.

   ![위젯 템플릿을 사용하기 위해 위젯 구성을 저장하면 템플릿이 디스플레이에 사용됩니다.](./styling-widgets-with-widget-templates/images/04.png)

위젯은 이제 사용자 정의 템플릿을 사용합니다. 고급 위젯 템플릿 스크립트를 사용하여 위젯의 기능을 더욱 향상시킬 수 있습니다.

## 추가 정보

* [위젯 템플릿 만들기](../../creating-pages/page-fragments-and-widgets/using-widgets/styling-widgets/creating-a-widget-template.md)
* [위젯 모양 및 느낌 구성](../../creating-pages/page-fragments-and-widgets/using-widgets/styling-widgets/configuring-widget-look-and-feel.md)
