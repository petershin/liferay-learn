# 워크플로 활성화

DXP 인스턴스 전체 또는 특정 사이트에서만 자산 유형에 대한 워크플로우 프로세스를 활성화할 수 있습니다. 워크플로 프로세스가 _Wiki 페이지_와 같은 특정 자산 유형에 대해 인스턴스 전체에서 활성화되면 게시를 위해 제출된 _Wiki 페이지_ 모두 해당 _Wiki 페이지_ 가 생성된 사이트에 관계없이 검토 프로세스를 거쳐야 합니다.

```{warning}
Liferay 7.3에서는 워크플로우를 [Publications](../../../site-building/publishing-tools/publications.md)과 함께 사용할 수 없습니다.
```

개별 사이트에서 워크플로를 활성화하거나 비활성화할 수 있습니다. 기본적으로 워크플로는 사이트에서 비활성화되어 있습니다.

## DXP 인스턴스 전체에서 워크플로 활성화

1. _제품 메뉴_ (![Product Menu](../../../images/icon-product-menu.png))을 열고 _제어판_를 클릭합니다.
1. _Workflow_ 을 클릭한 다음 _Process Builder_을 클릭합니다.
1. _구성_ 탭을 클릭합니다.

    ![인스턴스 전체 설정은 구성 탭에 있습니다.](./activating-workflow/images/02.png)

1. 워크플로 프로세스를 진행할 자산 유형 옆의 _편집_ 을 클릭합니다(예: _지식 기반 문서_).

    ![기술 자료 문서에 대한 인스턴스 전체에서 워크플로 활성화](./activating-workflow/images/03.png)

1. 이 자산 유형에 대해 원하는 워크플로를 선택합니다(_단일 승인자_ 은 즉시 사용 가능).
1. _저장_을 클릭합니다.
1. 워크플로가 필요한 다른 모든 자산 유형에 대해 반복합니다.

## 사이트에서 워크플로 활성화

워크플로 프로세스가 사이트에서 활성화되면 동일한 인스턴스의 다른 사이트는 비활성화된 상태로 유지됩니다. 사이트별 각 자산 유형에 대해 워크플로우 프로세스를 활성화하려면:

1. _제품 메뉴_ (![Product Menu](../../../images/icon-product-menu.png))을 연 다음 _사이트 관리_ 메뉴에서 나침반 아이콘(![Compass](../../../images/icon-compass.png))을 클릭합니다.
1. 양식이 생성될 사이트를 선택합니다(예: _커뮤니티 사이트_).
1. _사이트 관리_ 메뉴에서 _구성_ &rarr; _워크플로_을 클릭합니다.
1. 워크플로 프로세스를 진행할 Asset Type 옆의 _Edit_ 을 클릭합니다.
1. 이 자산 유형에 대해 원하는 워크플로를 선택합니다.

    ![커뮤니티 사이트에서 블로그 항목 활성화](./activating-workflow/images/01.png)

1. _저장_을 클릭합니다.
1. 워크플로가 필요한 다른 모든 자산 유형에 대해 반복합니다.

활성화되면 선택한 자산 유형은 이 사이트에 게시하기 전에 항상 검토 프로세스가 필요합니다. 특정 자산 유형에 대해 이전에 워크플로를 활성화한 경우 해당 설정이 여기에 반영됩니다.

```{tip}
인스턴스 전체에서 활성화된 경우에도 사이트의 자산 유형에 대한 워크플로를 항상 비활성화할 수 있습니다.
```

## 특정 애플리케이션에 대한 워크플로 활성화

각각의 애플리케이션에서 워크플로가 활성화된 여러 자산 유형이 있습니다.

### 웹 콘텐츠 폴더

_Web Content Folder_에 대한 워크플로우를 활성화하려면 다음을 수행하십시오.

1. 사이트의 _사이트 관리_ 메뉴로 이동합니다.
1. _콘텐츠 & 데이터_ &rarr; _웹 콘텐츠_를 클릭합니다.
1. (![Actions](../../../images/icon-actions.png))을 클릭한 다음 원하는 폴더 옆에 있는 _편집_ 를 클릭합니다.

    ![폴더의 편집 화면에서 Web Content 폴더에 대한 워크플로우 활성화.](./activating-workflow/images/04.png)

1. _구조 제한 및 작업 흐름_ 메뉴를 확장합니다.
1. _이 폴더의 기본 워크플로(Lunar Resort Holiday Getaway 콘텐츠)_라디오 버튼을 클릭합니다.

    ![웹 컨텐츠 폴더에 대한 워크플로우 선택.](./activating-workflow/images/05.png)

1. 워크플로 정의를 선택합니다(예: _단일 승인자_).
1. _저장_ 버튼을 클릭합니다.

### 문서 및 미디어 폴더

_루트_ 폴더 또는 개별 폴더에 있는 전체 _문서 및 미디어_ 응용 프로그램에 대해 워크플로를 활성화할 수 있습니다.

_문서 및 미디어 폴더_에 대한 워크플로우를 활성화하려면:

1. 사이트의 _사이트 관리_ 메뉴로 이동합니다.
1. _콘텐츠 & 데이터_ &rarr; _문서 및 미디어_를 클릭합니다.
1. (![Actions](../../../images/icon-actions.png))을 클릭한 다음 원하는 폴더 옆에 있는 _편집_ 를 클릭합니다.

    ![DM 폴더에 대한 작업 흐름 선택.](./activating-workflow/images/06.png)

1. _문서 유형 제한 및 워크플로_ 메뉴를 확장합니다.
1. _이 폴더의 기본 워크플로(DM 폴더 1)_라디오 버튼을 클릭합니다.

    ![DM 폴더에 대한 작업 흐름 선택.](./activating-workflow/images/07.png)

1. 워크플로 정의를 선택합니다(예: _단일 승인자_).
1. _저장_ 버튼을 클릭합니다.

### 동적 데이터 목록

_DDL 양식_에 대한 워크플로우를 활성화하려면 다음을 수행하십시오.

1. 사이트의 _사이트 관리_ 메뉴로 이동합니다.
1. _콘텐츠 & 데이터_ &rarr; _동적 데이터 목록_을 클릭합니다.
1. 새 양식을 추가하려면 (![Add](../../../images/icon-add.png))을 클릭하십시오.
1. DDL 양식의 이름을 입력합니다.
1. __ 선택을 클릭하여 이 양식과 관련된 데이터 정의를 선택합니다.
1. 데이터 정의(_연락처_)를 선택합니다.
1. _워크플로_아래에서 원하는 워크플로를 선택합니다(_단일 승인자_).

    ![각 개별 동적 데이터 목록에 대한 워크플로를 활성화합니다.](./activating-workflow/images/08.png)

1. _저장_을 클릭합니다.

이 특정 DDL 양식은 이제 제출 프로세스를 거칩니다.

### 양식

각 개별 양식 항목에 대한 워크플로우를 활성화하려면

1. 사이트의 _사이트 관리_ 메뉴로 이동합니다.
1. _콘텐츠 & 데이터_ &rarr; _양식_를 클릭합니다.
1. _양식 작성기_ 보기(새 양식인지 기존 양식인지는 중요하지 않음)에서 _옵션_ (![Options](../../../images/icon-actions.png)) 다음 _설정_을 클릭하십시오.

    ![양식 설정으로 이동](./activating-workflow/images/09.png)

1. _워크플로 선택_아래에서 원하는 워크플로를 선택합니다(_단일 승인자_).

    ![양식 설정 창에서 각 양식의 항목에 대한 워크플로를 활성화합니다.](./activating-workflow/images/10.png)

1. _완료_ 을 클릭한 다음 대화창을 닫습니다.

이제 정보를 제출하기 전에 양식에 승인이 필요합니다.


<!-- Leaving this commented out until Staging materials are pushed up.
## Page Variations

In a [staged environment](https://help.liferay.com/hc/en-us/articles/360029041851-Staging-Content), you can activate workflow for _Page Variations_.

As a prerequisite, [Staging](https://help.liferay.com/hc/articles/360029041811-Enabling-Staging) **and** [Page Versioning](https://help.liferay.com/hc/articles/360028721532-Enabling-Page-Versioning-and-Staged-Content) have been enabled.

When a Page Variation or Site Page Variation is created, its creator must click _Submit for Publication_ at the top of the page, and the variation must be approved in the workflow before it can be published to the live Site.

To enable a workflow for Page Variations:

1. Navigate to the _Site Administration_ menu for your site.
1. Verify that the Staging has been enabled for this site.

    ![Verify that the site is now staged.](./activating-workflow/images/11.png)

1. Click _Configuration_ &rarr; _Workflow_.
1. Select the workflow desired for _Page Revision_.

    ![Verify that the site is now staged.](./activating-workflow/images/12.png)

1. Click _Save_.

Page revisions now have to go through the workflow process.

![With workflow enabled on Page Revisions, the Site administrator must submit their page variation for publication before it can go live.](./activating-workflow/images/13.png)
-->

## 다음

* [자산 검토](./reviewing-assets.md)
