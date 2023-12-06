# 사이트에 개체 위젯 배포

{bdg-secondary}`라이프레이 7.4+`

개체가 게시되면 Liferay는 사이트 페이지에 배포할 수 있는 전용 위젯을 자동으로 생성합니다. 여기에는 사이트 범위 개체와 회사 범위 개체가 모두 포함되므로 사이트 메뉴(![사이트 메뉴](../../images/icon-menu.png)) 및 전역 메뉴 외부 개체에 대한 액세스 권한을 부여할 수 있습니다. (![글로벌 메뉴](../../images/icon-applications-menu.png)).

```{note}
위젯 데이터는 Object의 범위에 따라 저장되고 표시됩니다.
```

## 객체 위젯 표시 및 숨기기

1. **전역 메뉴**(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **개체** 를 클릭합니다.

1. 원하는 **개체** 를 선택합니다.

1. 세부정보 탭에서 **위젯 표시/숨기기** 스사이트를 전환하세요.

   ![Toggle the Show/Hide Widget switch.](./deploying-object-widgets-to-sites/images/01.png)

1. **저장** 을 클릭하세요.

스사이트가 **위젯 표시** 로 전환되고 개체가 게시되면 즉시 [사이트 페이지에 위젯을 추가](#adding-the-widget-to-pages) 할 수 있습니다.

그러나 스사이트를 **Hide Widget** 으로 전환하면 위젯 메뉴에 숨겨지고 페이지에 추가할 수 없습니다.

```{note}
개체의 위젯을 숨겨도 해당 위젯이 이미 배포된 사이트 페이지에서는 제거되지 않습니다. 위젯을 숨기면 사용자가 위젯을 새 페이지에 추가할 수 없습니다.
```

## 페이지에 위젯 추가

게시된 개체에 대해 **위젯 표시** 가 활성화되면 해당 위젯이 위젯 메뉴의 **개체** 아래에 나타납니다.

다른 페이지 위젯과 마찬가지로 사이트 페이지에 위젯을 추가할 수 있습니다.

![Add Object widgets to Site Pages.](./deploying-object-widgets-to-sites/images/02.png)

또한 위젯의 **옵션** 버튼(![옵션 버튼](../../images/icon-actions.png))을 클릭하여 추가 기능 및 구성 옵션에 액세스할 수도 있습니다.

![Click the Options button to access additional functions and configuration options.](./deploying-object-widgets-to-sites/images/03.png)

사용 가능한 옵션은 위젯이 [콘텐츠 페이지](../../site-building/creating-pages/using-content-pages/using-widgets-on-a-content-page.md)에 배포되었는지 여부에 따라 다릅니다. 또는 [위젯 페이지](../../site-building/creating-pages/using-widget-pages.md).

## 관련 주제

* [객체 생성](./creating-and-managing-objects/creating-objects.md)
* [개체 항목 표시](./displaying-object-entries.md)
