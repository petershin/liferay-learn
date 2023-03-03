# 콘텐츠 페이지에서 위젯 사용
<!--TASK: Reconsider-->
위젯 섹션은 [위젯 페이지의 *추가* 메뉴](../using-widget-pages/adding-widgets-to-a-page.md)와 같은 기능을 합니다. 사용 가능한 위젯의 전체 목록이 나타나고 페이지에 추가할 수 있습니다. 주요 차이점은 위젯의 기본 구성 옵션만 콘텐츠 페이지에서 사용할 수 있다는 것입니다.

```{note}
위젯은 위젯 페이지에서 [render-weight](https://learn.liferay.com/reference/latest/en/dxp/definitions/liferay-portlet-app_7_3_0.dtd.html#render-weight) 에 따라 렌더링되지만 이는 사실이 아닙니다. 콘텐츠 페이지의 경우. 대신 페이지에 나타나는 순서대로 렌더링됩니다(예: 왼쪽에서 오른쪽, 위에서 아래로).
```

## 콘텐츠 페이지에 위젯 추가

콘텐츠 페이지에 위젯을 추가하려면 다음 단계를 따르세요.

1. [콘텐츠 페이지에 요소를 추가](./adding-elements-to-content-pages.md)하는 동안 [위젯 패널](./content-page-editor-ui-reference.md)을 열고 찾아보기 사용 가능한 위젯을 선택하거나 이름으로 위젯을 검색합니다.
1. 배치할 레이아웃의 열과 행으로 위젯을 드래그합니다.

위젯은 위키 디스플레이 또는 Asset Publisher와 같은 동적 게시 도구일 수 있습니다. 위젯으로 표시하는 콘텐츠는 긴 형식의 텍스트, 이미지 갤러리 또는 그 사이의 모든 것이 될 수 있습니다.

## 콘텐츠 페이지에서 위젯 구성

콘텐츠 페이지에서 위젯을 구성하려면 다음 단계를 따르세요.

1. 위젯 위로 마우스를 가져갑니다.
1. 옵션 메뉴(![Options Menu](../../../images/icon-app-options.png))를 열고 *구성*를 선택합니다. 여기에서 위젯에 따라 몇 가지 옵션이 있습니다.
   
   ![옵션 메뉴를 통해 콘텐츠 페이지에서 위젯을 구성할 수 있습니다.](./using-widgets-on-a-content-page/images/01.png)

1. *저장* 을 클릭하여 변경 사항을 적용합니다.

```{note}
Liferay Portal 7.3 GA2부터는 위젯의 옵션 메뉴에서 *권한*을 선택하여 위젯에 대한 권한도 구성합니다.
```

## 콘텐츠 페이지에 대한 위젯 권한 구성

Liferay Portal 7.3 GA2부터 콘텐츠 페이지에서 위젯에 대한 권한을 구성할 수 있습니다. 콘텐츠 페이지에서 위젯 권한을 구성하려면 다음 단계를 따르세요.

1. 위젯 위로 마우스를 가져갑니다.
1. 옵션 메뉴(![Options Menu](../../../images/icon-app-options.png))를 열고 *권한*를 선택합니다.
1. 표시되는 새 창에서 역할에 대한 권한을 선택/선택 취소합니다.
1. *저장* 을 클릭하여 변경 사항을 적용합니다.

![옵션 메뉴를 통해 콘텐츠 페이지에 대한 위젯 권한을 구성할 수 있습니다.](./using-widgets-on-a-content-page/images/02.png)

```{note}
[페이지 템플릿](../adding-pages/creating-a-page-template.md)을 기반으로 페이지를 만들면 권한도 복사됩니다. 마스터 페이지에 대한 권한은 페이지가 아닌 [마스터 페이지](../defining-headers-and-footers/managing-master-page-templates.md)에서 설정합니다.
```

## 위젯에 대한 콘텐츠 페이지 제한 사항

여전히 콘텐츠 페이지의 위젯에 대한 기본 구성 옵션 및 권한에 액세스할 수 있지만 위젯 페이지에서만 사용할 수 있는 몇 가지 옵션이 여전히 있습니다.

* *중첩된 애플리케이션*: 위젯 내의 위젯은 위젯 페이지에서만 지원됩니다.
* *Widget Look & Feel*: Widget Pages에서 위젯의 구성 메뉴를 통해 Look and Feel 메뉴에 액세스하여 CSS를 세밀하게 제어할 수 있습니다. 콘텐츠의 모양과 느낌은 테마에서 또는 조각을 사용하여 정의되므로 콘텐츠 페이지의 위젯에는 사용할 수 없습니다.
* *구성 템플릿*: 위젯의 구성 설정을 템플릿에 저장하는 구성 템플릿은 위젯 페이지에서만 사용할 수 있습니다.
* *내보내기/가져오기*: 위젯 페이지의 위젯에 대한 애플리케이션 데이터만 내보내고 가져올 수 있습니다.

## 추가 정보

- [콘텐츠 페이지 사용](../using-content-pages.md)
- [콘텐츠 페이지에 요소 추가](./adding-elements-to-content-pages.md)
- [콘텐츠 페이지 편집기 UI 참조](./content-page-editor-ui-reference.md)
