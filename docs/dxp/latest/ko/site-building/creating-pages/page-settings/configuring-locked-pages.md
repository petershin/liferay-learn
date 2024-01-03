# 잠긴 페이지 구성

{bdg-secondary}`liferay DXP 2023.Q3+/포탈 7.4 GA98+`

<!-- The feature flag had been removed, but the commit was reverted: https://github.com/liferay/liferay-portal/commit/6313e4d18f4610d6c45009b33932d666113adfd7 - Eric -->

!!! important
이 기능은 현재 릴리스 기능 플래그 뒤에 있습니다. 자세한 내용은 [릴리스 기능 플래그](../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) 을 읽어보세요.

Liferay는 여러 사용자가 동일한 페이지를 편집하려고 할 때 충돌을 피하기 위해 편집 중에 페이지를 잠급니다.

이 기능은 [콘텐츠](../using-content-pages.md), [마스터](../defining-headers-and-footers/master-page-templates.md), [유틸리티](../adding-pages/using-utility-pages.md) 및 [컬렉션 페이지](../adding-pages/using-utility-pages.md), [페이지](../../../content-authoring-and-management/collections-and-collection-pages.md) 및 [디스플레이 페이지](../../displaying-content/using-display-page-templates.md) 템플릿과 함께 사용할 수 있습니다.

## 페이지 잠금

사용자가 페이지 편집을 시작하고 페이지에 새 콘텐츠를 추가할 때마다 페이지가 잠기고 다른 사용자가 해당 페이지에 액세스할 수 없습니다.

사용자가 잠긴 페이지에 액세스하려고 하면 대신 사용 중인 페이지 메시지가 나타납니다. 이 페이지에는 이전 페이지의 존재 여부에 따라 뒤로 가기 또는 [이전 페이지 이름]으로 가기가 표시됩니다.

!!! note
    사용자는 잠금 해제된 페이지의 초안만 삭제할 수 있습니다.

![Trying to access locked pages redirects the user to a generic error page](./configuring-locked-pages/images/01.png)

모든 이벤트가 페이지를 잠그는 것은 아닙니다.

- 페이지를 잠그지 않고도 페이지의 [마스터 페이지](../defining-headers-and-footers/managing-master-page-templates.md) 또는 [스타일북](../../site-appearance/style-books.md) 수정할 수 있습니다.
- 페이지가 잠겨 있어도 [Fragments](../page-fragments-and-widgets/using-fragments.md) 을 전파할 수 있습니다.
- 페이지가 잠겨 있는 경우에도 페이지 템플릿을 [수 있습니다](../adding-pages/exporting-and-importing-page-templates.md) .

!!! tip
    [출판물](../../publishing-tools/publications.md) 로 작업하는 경우 페이지와 해당 출판물이 함께 잠기고 잠금 해제됩니다.

## 페이지 잠금 해제

대부분의 경우 시스템이 자동으로 페이지 잠금을 해제하므로 페이지 잠금 해제에 대해 걱정할 필요가 없습니다.

예를 들어, 사용자가 페이지를 편집 모드에서 보기 모드로 변경하거나, 로그아웃하거나, 사용자가 페이지가 있는 탭을 닫을 때 Liferay는 페이지의 잠금을 해제합니다.

사용자가 편집 모드에서 페이지를 변경하지 않고 오랫동안 열어 두면 시스템이 자동으로 페이지의 잠금을 해제합니다. 시간은 다음과 같이 구성할 수 있습니다.

1. _전역 메뉴_(![전역 메뉴](../../../images/icon-applications-menu.png))를 열고 구성 아래의 _제어판_ &rarr; _인스턴스 설정_으로 이동합니다.

1. 콘텐츠 및 데이터에서 _페이지_를 선택합니다.

1. 가상 인스턴스 범위에서 _잠긴 페이지_를 선택합니다.

1. _자동 잠금 해제 프로세스 허용_을 전환합니다.

   기능을 비활성화하려면 해당 기능을 끄십시오.

1. _자동 저장을 사용하지 않는 시간_을 분 단위로 설정하세요.

```{warning}
자동 저장을 하지 않은 시간은 시스템이 15분마다 잠긴 페이지를 확인하므로 정확하지 않을 수 있습니다.
```

![Set the automatic unlocking time in Instance Settings](./configuring-locked-pages/images/02.png)

사이트 관리자 또는 최고 관리자는 수동으로 페이지 잠금을 해제할 수 있습니다.

1. _사이트 메뉴_(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 _구성_ &rarr; _잠긴 페이지_로 이동합니다.

1. 잠금을 해제하려는 잠긴 페이지 옆에 있는 _작업_(![작업 버튼](../../../images/icon-actions.png))을 클릭합니다 &rarr; _잠금 해제_.

   여러 페이지를 선택하고 잠금(![잠금 아이콘](../../../images/icon-lock.png)) 아이콘이나 옆에 있는 작업 버튼을 클릭하여 &rarr; 잠금을 해제할 수 있습니다.

페이지가 잠금 해제되었습니다. 자동 저장된 모든 변경 사항은 유지되며 이제 페이지를 편집할 수 있습니다.

```{tip}
이 목록에서는 페이지 유형, 현재 페이지를 편집 중인 사용자, 마지막 자동 저장 이후의 시간도 볼 수 있습니다.
```

![If you are a Site Administrator or a Super Administrator, you can unlock any page manually](./configuring-locked-pages/images/03.png)

## 관련 주제

[콘텐츠 페이지에 요소 추가하기](../using-content-pages/adding-elements-to-content-pages.md)

[페이지에 위젯 추가하기](../using-widget-pages/adding-widgets-to-a-page.md)
