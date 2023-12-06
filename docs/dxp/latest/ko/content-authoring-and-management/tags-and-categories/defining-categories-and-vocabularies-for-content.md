# 콘텐츠의 범주 및 어휘 정의

범주를 사용하여 유사한 자산을 그룹화하고 콘텐츠를 구성할 수 있습니다. [태그](./tagging-content-and-managing-tags.md)과 함께 카테고리는 사람들이 검색 또는 탐색을 통해 관련 정보를 찾는 데 도움이 됩니다. Liferay DXP의 범주 및 다양한 사용 시나리오에 대한 자세한 내용은 [범주 및 태그로 콘텐츠 구성](organizing-content-with-categories-and-tags.md)을 참조하십시오.

[개의 어휘](#defining-vocabularies) 을 사용하여 범주를 그룹화하고 [하위 범주](#creating-subcategories) 을 사용하여 범주 계층을 만듭니다. 다른 사이트의 글로벌 사이트에서 어휘 및 카테고리를 사용할 수 있지만 글로벌 사이트에서만 글로벌 어휘를 생성하거나 편집할 수 있습니다.

```{note}
사이트 관리자만 카테고리 패널에서 카테고리 및 어휘를 관리할 수 있습니다.
```

## 어휘 정의

1. 어휘를 생성하려는 사이트로 이동합니다.
1. 제품 메뉴를 열고 사이트 메뉴에서 **카테고리** &rarr; **카테고리** 로 이동합니다.
1. **새 어휘**(![New Vocabulary](../../images/icon-plus.png))을 클릭합니다.
1. 어휘에 대해 **이름** 을 입력하고 선택적으로 **설명** 을 입력합니다.
1. 나머지 범주 옵션을 완료합니다.

   **다중 범주 허용:** 자산을 분류하기 위해 어휘에서 둘 이상의 범주를 사용하려면 이 옵션을 활성화합니다. 비활성화되면 어휘에서 하나의 범주만 사용할 수 있습니다.

   **가시성:** 자세한 내용은 [어휘 가시성](./organizing-content-with-categories-and-tags.md#vocabulary-visibility) 을 참조하십시오.

   ```{important}
   어휘를 저장한 후에는 가시성을 변경할 수 없습니다.
   ```

   **연결된 자산 유형:** 이 어휘에서 범주를 적용하기 위해 허용된 자산 유형을 선택합니다. 이 유형의 자산이 항상 범주를 갖도록 하려면 **필수** 을 **예** 으로 설정하십시오.

   ```{tip}
   하나 이상의 자산 유형을 포함하려면 *연결된 자산 유형* 섹션 아래의 *추가* 버튼을 클릭하십시오.
   ```

   ![여러 자산 유형에 대한 범주 옵션을 정의합니다.](./defining-categories-and-vocabularies-for-content/images/02.png)

1. **저장** 을 클릭합니다.
1. 기존 어휘를 편집하려면 어휘 이름 옆에 있는 **작업**(![Actions](../../images/icon-actions.png)) 메뉴를 클릭하고 **편집** 을 선택합니다.

    ![작업 메뉴를 사용하여 기존 어휘를 편집합니다.](./defining-categories-and-vocabularies-for-content/images/08.png)

## 범주 정의

사이트 메뉴 &rarr; **분류** &rarr; **카테고리** 패널에서 카테고리를 만들고 관리합니다. 각 어휘에 대한 선택 버튼을 사용하여 콘텐츠 편집기의 범주화 섹션에서 새 범주를 생성할 수도 있습니다.

```{important}
하나의 어휘에 최대 150개의 범주를 만들 수 있습니다.
```

![콘텐츠 편집기의 분류 섹션에서 새 범주를 추가합니다.](./defining-categories-and-vocabularies-for-content/images/04.png)

### 카테고리 만들기

1. 제품 메뉴를 열고 사이트 메뉴에서 **카테고리** &rarr; **카테고리** 로 이동합니다.
1. **Vocabularies** 목록에서 Vocabulary를 클릭하여 새 카테고리를 추가합니다.
1. **카테고리** 추가(![Add Category](../../images/icon-add.png))를 클릭합니다.
1. 범주에 **이름** 을 입력하고 선택적으로 **설명** 을 입력합니다.
1. 디스플레이 페이지 섹션에서 범주에 대한 특정 디스플레이 페이지를 선택하거나 기본 페이지를 사용합니다.

   ```{note}
   범주에 대한 페이지 표시는 Liferay DXP 7.4부터 사용할 수 있습니다. 자세한 내용은 [디스플레이 페이지를 사용한 카테고리 표시](../../site-building/displaying-content/using-display-page-templates/displaying-categories-using-display-pages.md)를 참조하세요.
   ```

1. **저장** 또는 **저장 및 새 항목 추가** 을 클릭하여 더 많은 범주를 추가합니다.
1. 기존 범주를 편집하려면 범주 이름 옆에 있는 **작업**(![Actions](../../images/icon-actions.png)) 메뉴를 클릭하십시오.

### 하위 범주 만들기

범주 및 하위 범주의 중첩된 계층 구조를 만들 수 있습니다.

1. 제품 메뉴를 열고 사이트 메뉴에서 **카테고리** &rarr; **카테고리** 로 이동합니다.
1. **Vocabularies** 목록에서 수정하려는 어휘를 클릭합니다.
1. 새 하위 범주를 만들려는 범주 이름을 클릭합니다.
1. **새 하위 범주 추가** 화면에서 하위 범주의 **이름** 및 선택적으로 **설명** 를 입력합니다.
1. **저장** 또는 **저장 및 새 항목 추가** 을 클릭하여 더 많은 하위 범주를 추가합니다.

### 범주 이동

범주를 다른 어휘로 이동하거나 동일한 어휘의 하위 범주로 이동할 수 있습니다.

1. 제품 메뉴를 열고 사이트 메뉴에서 **카테고리** &rarr; **카테고리** 로 이동합니다.
1. 이동하려는 카테고리 옆에 있는 **동작**(![Actions](../../images/icon-actions.png)) 메뉴를 클릭하고 **이동** 를 선택합니다.

    ![이동 옵션을 사용하여 범주를 구성합니다.](./defining-categories-and-vocabularies-for-content/images/03.png)

1. Category를 옮기고자 하는 **Vocabulary** 과 **Category** 을 선택합니다.

    ```{note}
    동일한 [가시성 유형](./organizing-content-with-categories-and-tags.md#vocabulary-visibility) 의 어휘로만 범주를 이동할 수 있습니다.
    ```

### 추가 범주 속성 편집

범주를 생성한 후 다음과 같은 추가 옵션을 정의할 수 있습니다.

- 세부사항
- 이미지
- 친절한URL
- 재산

이러한 옵션에 액세스하려면 수정하려는 범주 옆에 있는 **작업**(![Actions](../../images/icon-actions.png)) 메뉴를 클릭하고 **편집** 을 선택합니다.

![범주를 편집하여 추가 옵션을 정의하십시오.](./defining-categories-and-vocabularies-for-content/images/10.png)

### 어휘당 최대 범주 수 변경

각 어휘에 대해 최대 150개의 카테고리를 생성할 수 있습니다. 그러나 카테고리가 매우 많으면 성능과 로드 시간에 영향을 줄 수 있습니다. 더 낮은 최대 수를 설정하려면,

1. 전역 메뉴(![Global Menu](../../images/icon-applications-menu.png))를 엽니다. **제어판** &rarr; **인스턴스 설정** &rarr; **자산** 로 이동합니다.

1. 왼쪽 내비게이션에서 **분류** 을 클릭합니다. 새로운 최대값(예: `2`)을 입력하고 **저장** 을 클릭합니다.

    ![범주의 새로운 최대값을 설정합니다.](./defining-categories-and-vocabularies-for-content/images/11.png)

1.  이제 최대값에 도달하면 메시지가 표시되며 사용자는 추가 범주를 만들 수 없습니다.

    ![최대값에 도달하면 메시지가 나타납니다.](./defining-categories-and-vocabularies-for-content/images/12.png)

## 관련 정보

* [범주 및 태그로 콘텐츠 구성](./organizing-content-with-categories-and-tags.md)
* [콘텐츠 태깅 및 태그 관리](./tagging-content-and-managing-tags.md)
* [컨텐츠 대시보드](../content-dashboard/about-the-content-dashboard.md)
* [표시 페이지를 사용하여 범주 표시](../../site-building/displaying-content/using-display-page-templates/displaying-categories-using-display-pages.md)
