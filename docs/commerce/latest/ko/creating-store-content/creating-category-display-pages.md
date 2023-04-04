---
uuid: 0bb26a1d-668e-4d08-b3ac-8d5adbb59b81
---

# 카테고리 표시 페이지 만들기

범주를 위젯 페이지에 연결하여 Liferay Commerce에서 규모에 맞게 페이지를 만들고 관리할 수 있습니다. 모든 범주에 대해 하나의 페이지를 관리하는 대신 범주 표시 페이지를 사용하여 모든 범주에서 사용할 단일 템플릿을 정의할 수 있습니다. 페이지가 생성되면 사용자는 내장형 또는 사용자 정의 위젯 및 조각을 사용하여 특정 범주와 관련된 세부 정보를 표시할 수 있습니다. 이는 상점에 많은 카테고리가 있고 이를 효율적으로 관리하려는 경우에 유용합니다.

## 기본 범주 표시 페이지 만들기

![채널 설정에서 범주 표시 페이지 탭을 선택합니다.](./creating-category-display-pages/images/01.png)

스토어의 기본 카테고리 페이지를 만들려면 다음 단계를 따르세요.

1. 스토어에서 새 _위젯 페이지_ 을 만들고 원하는 다른 페이지 요소와 함께 _카테고리 콘텐츠_ 위젯을 여기에 추가합니다.

1. _글로벌 메뉴_ (![Global Menu](../images/icon-applications-menu.png)), &rarr; 커머스 탭 &rarr; _매장 관리_ &rarr; _채널_을 클릭합니다.

1. 원하는 _채널_ 선택하고 _범주 디스플레이 페이지_ 탭을 클릭합니다. 기본 범주 표시 페이지 섹션에서 _클릭하고_ 선택하고 생성한 페이지를 선택합니다.

이 페이지는 상점의 모든 범주에 대한 기본 페이지로 사용됩니다.

![다양한 위젯을 보여주는 샘플 카테고리 표시 페이지.](./creating-category-display-pages/images/02.png)

```{note}
Liferay DXP 7.3 및 이전 버전의 경우 채널 설정에서 기본 범주 표시 페이지 선택을 사용할 수 없습니다. 범주 표시 페이지를 설정하려면 사용자는 위젯 페이지를 만들고 원하는 다른 페이지 요소와 함께 범주 콘텐츠 위젯을 추가해야 합니다. 그러면 기본 범주 표시 페이지로 인식됩니다.
```

## 특정 범주에 대한 범주 표시 페이지 만들기

경우에 따라 특정 제품 범주를 페이지에 표시해야 할 수 있습니다. 이것은 판촉이나 제안이 있는 제품을 표시하는 데 유용할 수 있습니다. 특정 카테고리를 페이지에 매핑하려면 다음 단계를 따르십시오.

1. 스토어에서 새 [_위젯 페이지_](https://learn.liferay.com/dxp/latest/en/site-building/creating-pages/understanding-pages/understanding-pages.html#widget-pages) 생성하고 원하는 다른 페이지 요소와 함께 _카테고리 콘텐츠_ 위젯을 추가합니다.

1. _글로벌 메뉴 열기_ (![Global Menu](../images/icon-applications-menu.png)) &rarr; 상거래 탭 &rarr; _매장 관리_ &rarr; _채널_.

1. 원하는 _채널_선택하고 _Category Display Pages 탭_을 클릭한 다음 _Add_ 버튼(![Add Button](../images/icon-add.png))을 클릭합니다.

   ![카테고리와 연결할 새 페이지를 선택합니다.](./creating-category-display-pages/images/03.png)

1. _ _카테고리 선택_ 아래에서* 선택을 클릭하고 새 사이트 페이지에 연결할 카테고리를 선택하십시오.

   ![생성된 페이지의 카테고리를 선택합니다.](./creating-category-display-pages/images/04.png)

1. _Category Display Page_에서 _Choose_를 클릭하고 새 사이트 페이지를 선택한 다음 _Save_를 클릭합니다.

1. 완료되면 _저장_ 클릭합니다.

```{note}
각 범주를 다르게 표시하려면 기본 범주 표시 페이지에 범주 콘텐츠 위젯이 있어야 합니다. 범주 콘텐츠 위젯이 있는 페이지가 여러 개 있는 경우 Liferay는 기본적으로 레이아웃 목록의 첫 번째 페이지로 설정됩니다. 
```

이렇게 하면 범주와 선택한 페이지 간의 관계가 설정됩니다. 사용자가 특정 카테고리를 클릭할 때마다 새 카테고리 표시 페이지로 리디렉션됩니다. 카테고리 표시 페이지를 보고 관리하려면 채널 설정 아래의 카테고리 표시 페이지 탭을 사용하십시오.

## 추가 정보

- [표시 페이지를 사용하여 범주 표시](https://learn.liferay.com/dxp/latest/en/site-building/displaying-content/using-display-page-templates/displaying-categories-using-display-pages.html)
