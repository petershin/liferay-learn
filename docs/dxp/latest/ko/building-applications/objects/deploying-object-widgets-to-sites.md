# 사이트에 개체 위젯 배포

> 사용 가능: Liferay DXP 7.4 U1/Liferay Portal 7.4 GA5

개체가 게시되면 Liferay는 사이트 페이지에 배포할 수 있는 전용 위젯을 자동으로 생성합니다. 여기에는 사이트 범위 개체와 회사 범위 개체가 모두 포함되므로 사이트 메뉴(![Site Menu](../../images/icon-menu.png)) 및 전역 메뉴(![Global Menu](../../images/icon-applications-menu.png)) 외부의 개체에 대한 액세스 권한을 부여할 수 있습니다.

```{note}
위젯 데이터는 Object의 범위에 따라 저장 및 표시됩니다.
```

## 개체 위젯 표시 및 숨기기

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png))을 열고 **Control Panel** 탭으로 이동하여 **Objects** 을 클릭합니다.

1. 원하는 **Object** 을 선택합니다.

1. 세부 정보 탭에서 **위젯** 표시/숨기기 스사이트를 토글합니다.

   ![위젯 표시/숨기기 스사이트를 전환합니다.](./deploying-object-widgets-to-sites/images/01.png)

1. **저장** 을 클릭합니다.

스사이트가 **으로 전환되고 위젯 표시** 개체가 게시되면 즉시 [사이트 페이지에 위젯을 추가할 수 있습니다](#adding-the-widget-to-pages) .

그러나 스사이트가 **Hide Widget** 로 토글되면 위젯 메뉴에서 숨겨지며 페이지에 추가할 수 없습니다.

```{note}
개체의 위젯을 숨겨도 이미 배포된 사이트 페이지에서 제거되지 않습니다. 위젯을 숨기면 사용자가 새 페이지에 위젯을 추가할 수 없습니다.
```

## 페이지에 위젯 추가

게시된 객체에 대해 **위젯** 표시가 활성화되면 해당 위젯이 위젯 메뉴의 **객체** 아래에 나타납니다.

다른 페이지 위젯처럼 사이트 페이지에 위젯을 추가할 수 있습니다.

![사이트 페이지에 개체 위젯을 추가합니다.](./deploying-object-widgets-to-sites/images/02.png)

위젯의 **옵션** 버튼(![Options Button](../../images/icon-actions.png))을 클릭하여 추가 기능 및 구성 옵션에 액세스할 수도 있습니다.

![추가 기능 및 구성 옵션에 액세스하려면 옵션 버튼을 클릭합니다.](./deploying-object-widgets-to-sites/images/03.png)

사용 가능한 옵션은 위젯이 [콘텐츠 페이지](../../site-building/creating-pages/using-content-pages/using-widgets-on-a-content-page.md) 또는 [위젯 페이지](../../site-building/creating-pages/using-widget-pages.md)에 배포되었는지 여부에 따라 다릅니다.

## 추가 정보

* [개체 만들기](./creating-and-managing-objects/creating-objects.md)
* [개체 항목 표시](./displaying-object-entries.md)
