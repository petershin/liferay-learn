# 페이지 템플릿 만들기

{bdg-secondary}`사용 가능: Liferay DXP/Portal 7.3+`

**페이지 템플릿** 을 사용하면 사전 정의된 레이아웃과 콘텐츠를 기반으로 페이지를 만들 수 있습니다. 기본적으로 사용할 수 있는 몇 가지 기본 페이지 템플릿이 있습니다.

![Basic page templates are available.](./creating-a-page-template/images/01.png)

자신만의 [콘텐츠 페이지](../using-content-pages.md) 템플릿과 [위젯 페이지](../understanding-pages/understanding-pages.md#widget-pages) 템플릿을 만들 수도 있습니다.

```{note}
Liferay DXP 7.4+의 경우 Liferay UI에서는 페이지 템플릿 컬렉션을 페이지 템플릿 세트라고 합니다.
```

## 새 페이지 템플릿 만들기

아래 단계에서는 위젯 및 콘텐츠 페이지 템플릿을 만들고 사용하는 방법을 보여줍니다.

1. **사이트 메뉴**( ![사이트 메뉴](../../../images/icon-product-menu.png) )를 열고 **디자인** &rarr; **페이지 템플릿** 으로 이동합니다.

1. **페이지 템플릿** 탭을 선택합니다.

1. **새로 만들기** 를 클릭하고 페이지 템플릿을 구성하기 위한 새 페이지 템플릿 세트를 만듭니다.

   ![Use the Page Templates tab to create a page template set.](./creating-a-page-template/images/02.png)

1. **추가**( ![페이지 템플릿 아이콘 추가](../../../images/icon-add.png) )를 클릭하고 **콘텐츠 페이지 템플릿** 또는 **위젯 페이지 템플릿** 을 선택합니다.

1. 이름을 입력하세요.

1. **저장** 을 클릭하세요.

새 페이지 템플릿이 나타납니다. [콘텐츠 페이지 구축](../using-content-pages/adding-elements-to-content-pages.md)의 지침에 따라 콘텐츠 페이지 템플릿을 구성하세요. 마찬가지로 [위젯 페이지](../understanding-pages/understanding-pages.md#widget-pages) 를 참조하여 위젯 페이지 템플릿을 만드세요.

**작업**(![작업 아이콘](../../../images/icon-actions.png)) &rarr; **편집** 을 클릭하여 언제든지 페이지 템플릿을 편집할 수 있습니다. 세트.

```{tip}
새로 생성된 페이지 템플릿을 미리 볼 수 있습니다. 페이지 템플릿 페이지에서 *작업* (![작업 아이콘](../../../images/icon-actions.png)) &amp;rarr; 미리 보려는 템플릿의 *미리보기*입니다.
```

## 기존 페이지에서 페이지 템플릿 만들기

페이지를 편집하는 동안 페이지에서 페이지 템플릿을 만들 수도 있습니다. 새 페이지 템플릿은 생성 시 조각과 위젯에 대한 모든 구성을 유지합니다. 이렇게 하면 사이트를 확장하는 동안 시간이 절약됩니다.

페이지에서 페이지 템플릿을 만들려면 다음 단계를 따르세요.

1. [페이지 편집](../using-content-pages/adding-elements-to-content-pages.md) 중에 **옵션**( ![Options](../../../images/icon- options.png) ) 페이지 오른쪽 상단에서 **페이지 템플릿으로 변환** 을 선택하세요.

   ![Click convert to page template in the options menu to turn the page you are editing into a new page template.](./creating-a-page-template/images/03.png)

1. 화면에 나타나는 모달에서 기존 페이지 세트를 선택하거나 **새 세트에 저장** 을 선택하여 페이지 템플릿에 대한 새 페이지 템플릿 세트를 만듭니다.

   ![Here, you can set the basic information for your new page template.](./creating-a-page-template/images/04.png)

   페이지 템플릿 세트가 없는 경우 **이름** 을 선택하고 선택적으로 새 페이지 템플릿 세트에 대한 **설명** 을 선택합니다. 새로 생성된 템플릿 세트의 템플릿으로 페이지를 저장하려면 **저장** 을 클릭하세요.

1. **저장** 을 클릭하세요.

이제 선택한 페이지 템플릿 세트에는 현재 편집 중인 페이지를 기반으로 하는 새 페이지 템플릿이 초안으로 포함됩니다.

```{important}
새 페이지에 사용하려면 이 페이지 템플릿 초안을 게시해야 합니다.
```

## 새 페이지 템플릿 공유

기본적으로 페이지 템플릿 작성자만 사용할 수 있습니다.

새로 생성된 페이지 템플릿에 대한 액세스 권한을 다른 사용자에게 부여하려면 다음 단계를 따르세요.

1. 페이지 템플릿의 작업 메뉴( ![작업 아이콘](../../../images/icon-actions.png) )에서 **권한** 을 선택합니다.

   ![Allow other users to access newly created page templates while configuring permissions.](./creating-a-page-template/images/05.png)

1. 페이지 템플릿에 액세스하려는 역할에 대한 **보기** 권한을 확인하세요. 페이지를 생성할 수 있는 모든 사용자가 페이지 템플릿을 사용할 수 있도록 하려면 사용자 역할에 대한 **보기** 권한을 확인하세요.

1. **저장** 을 클릭하세요.

이제 지정된 역할을 가진 사용자는 페이지 템플릿에 액세스할 수 있습니다.

## 위젯 페이지에 대한 변경 사항 전파

위젯 페이지 템플릿에서 페이지를 생성할 때 변경 사항은 기본적으로 페이지 템플릿에서 상속되므로 향후 변경 사항은 페이지 템플릿을 사용하는 페이지에 **자동으로** 전파됩니다. 사이트 관리자는 [개별 페이지에 대한 설정](../page-settings/configuring-individual-pages.md#general) 을 통해 이 동작을 비활성화할 수 있습니다.

## 콘텐츠 페이지에 대한 변경 사항 전파

콘텐츠 페이지 템플릿을 사용하여 생성된 콘텐츠 페이지의 변경 사항은 **자동으로 전파되지 않습니다** . 그러나 콘텐츠 페이지에 사용되는 조각에 변경 사항을 전파할 수 있습니다. 자세한 내용은 [조각 변경 사항 전파](../page-fragments-and-widgets/using-fragments/propagating-fragment-changes.md)를 참조하세요.

## 다른 사이트와 페이지 템플릿 공유

페이지에서와 동일한 프로세스를 사용하여 페이지 템플릿을 다른 사이트와 공유할 수 있습니다. 방법을 알아보려면 [사이트 페이지 및 콘텐츠 내보내기/가져오기](../../sites/exporting-importing-site-pages-and-content.md)의 지침을 따르세요.

## 준비 및 페이지 템플릿

```{important}
스테이징 기능은 7.3 GA1+부터 [유지 관리 모드](../../../installation-and-upgrades/upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-3.md)에 있습니다.
```

스테이징이 활성화된 경우 위젯 페이지 템플릿에 대한 변경 사항이 스테이징된 페이지에 자동으로 전파됩니다. 이러한 변경 사항은 페이지가 실제 사이트에 게시되기 전에 승인을 받아야 합니다. 이러한 이유로 위젯 페이지 템플릿 변경 사항이 준비된 페이지에 자동으로 전파되는 기능을 끌 수 없으며 **변경 사항 상속** 선택기가 나타나지 않습니다.

## 관련 주제

* [사이트에 페이지 추가](./adding-a-page-to-a-site.md)
* [페이지 템플릿 내보내기 및 가져오기](./exporting-and-importing-page-templates.md)
* [전체 페이지 응용 프로그램 페이지 유형 사용](./using-the-full-page-application-page-type.md)
