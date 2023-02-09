# 조각 편집기 사용

Liferay DXP에는 콘텐츠 페이지 조각 개발을 위한 내장 [편집기](../reference/fragments/page-fragment-editor-interface-reference.md) 이 포함되어 있습니다. 편집기에 액세스하려면 *사이트 메뉴* (![Site Menu](../../../images/icon-product-menu.png))을 열고 *Design* &rarr; *Fragments*로 이동합니다. 여기에서 단편 및 단편 세트를 보고 관리하고 생성할 수 있습니다.

* [단편 세트 생성](#creating-a-fragment-set)
* [새 조각 만들기](#creating-a-new-fragment)

```{note}
Liferay DXP 7.4+의 경우 조각 컬렉션은 Liferay UI에서 조각 세트라고 합니다.
```

## 단편 세트 생성

새 프래그먼트를 생성하기 전에 먼저 새 프래그먼트 세트를 생성하여 배치해야 합니다.

1. *사이트 메뉴*을 열고 *디자인* &rarr; *조각*으로 이동합니다.

    ```{note}
    Liferay DXP 7.1 및 7.2에서 *제품 메뉴*를 열고 *사이트* → *사이트 빌더* → *페이지 조각*으로 이동합니다.
    ```

1. Fragment Sets 옆에 있는 *더하기* 버튼(![Add Button](../../../images/icon-plus.png))을 클릭합니다.

   ![Fragment Sets에 더하기 버튼 중첩을 클릭합니다.](./using-the-fragments-editor/images/01.png)

1. 새 세트에 대해 *이름* 및 *설명* 을 입력합니다.

    ```{tip}
    기능 또는 팀 및 부서별로 조각을 그룹화하는 집합을 만듭니다.
    ```

1. *저장*을 클릭합니다.

일단 저장되면 조각을 세트에 추가할 수 있습니다.

## 새 조각 만들기

프래그먼트를 생성하려면 다음 단계를 따르십시오.

1. 원하는 Fragment Set으로 이동하고 *Add* 버튼(![Add Button](../../../images/icon-add.png))을 클릭하여 새 Fragment를 생성합니다.

   ![원하는 조각 세트로 이동하고 추가 버튼을 클릭합니다.](./using-the-fragments-editor/images/02.png)

   ```{note}
   Liferay DXP 7.3 이전에는 조각이 섹션 또는 구성 요소일 수 있었습니다. Liferay DXP 7.3+에서 모든 페이지 조각은 구성 요소입니다.
   ```

1. 조각에 대해 *이름* 을 입력하고 *저장*을 클릭합니다.

    ![새 조각의 이름을 입력합니다.](./using-the-fragments-editor/images/03.png)

1. 코드 탭에서 CSS, HTML 및 JavaScript 필드를 사용하여 조각의 리소스를 추가합니다. 여기에서 다양한 장치 컨텍스트에서 Fragment 모양의 실시간 미리보기를 볼 수도 있습니다.

    다음은 몇 가지 HTML 편집 단축키입니다.

    * 표준 HTML 태그 및 Liferay의 Fragment 관련 태그에 액세스하려면 여는 꺾쇠 괄호(`<`)를 입력하십시오.

    * `데이터` 로 요소 속성을 시작하여 Liferay의 [편집 가능한 Fragment 속성](../reference/fragments/fragment-specific-tags-reference.md) 에 액세스합니다.

    ![Liferay의 편집 가능한 Fragment 속성은 편집기에서 사용할 수 있습니다.](./using-the-fragments-editor/images/04.png)

    아래 예에서는 편집 가능한 텍스트가 있는 카드 구성 요소를 추가합니다.

    ```html
    <div class="marketing-card-fragment-01">
      <div class="card">
        <lfr-editable id="01-card-image" type="image">
          <img src="https://cdn.dribbble.com/users/1408464/screenshots/9323535/media/a5b9a76256562e878ecc6dc5cd0fadf0.png" class="card-img-top" alt="2020 - Try New Things">
        </lfr-editable>
        <div class="card-body">
          <lfr-editable id="02-card-title" type="rich-text">
            <h5 class="card-title">Editable Card title</h5>
          </lfr-editable>
          <lfr-editable id="03-card-text" type="rich-text">
            <p class="card-text">Here is some editable text.</p>
          </lfr-editable>
          <lfr-editable id="04-card-link" type="link">
            <a href="#" class="btn btn-primary">Editable link</a>
          </lfr-editable>
        </div>
      </div>
    </div>
    ```

    ```css
    .marketing-card-fragment-01 .card img {
      max-width: 100%;
    }
    ```


    ![Add CSS, HTML, and Javascript resources to the Fragment and see a live preview.](./using-the-fragments-editor/images/05.png)

1. 구성 탭에서 `JSON` 필드를 사용하여 [구성 옵션](./adding-configuration-options-to-fragments.md) 을 페이지 조각에 추가합니다.

   ![페이지 조각에 구성 옵션을 추가합니다.](./using-the-fragments-editor/images/06.png)

    ```{tip}
    JSON의 'fields' 객체와 함께 모든 필드 세트에 'configurationRole' 값을 추가하여 연결된 필드가 표시되는 탭을 지정할 수 있습니다. 값을 '스타일'로 설정하여 스타일 탭에 필드를 표시하거나 '고급'으로 설정하여 고급 탭에 표시합니다(*Liferay DXP 버전 U23+ 또는 GA23+*에서만). `configurationRole`이 설정되지 않은 경우 기본적으로 일반 탭에 나타납니다.
    ```

1. *게시* 를 클릭하여 조각을 저장하고 [콘텐츠 페이지](../../creating-pages/understanding-pages/understanding-pages.md#content-pages)에서 사용할 수 있도록 합니다.

    ![조각은 콘텐츠 페이지에서 사용할 수 있습니다.](./using-the-fragments-editor/images/07.png)

Fragment를 개발하는 동안 변경 사항은 Fragment가 게시될 때까지 자동으로 초안으로 저장됩니다. 세트에 추가되면 조각 편집기에서 언제든지 조각을 복사, 내보내기, 편집 및 제거할 수 있습니다. 페이지 조각에 사용할 수 있는 작업에 대한 자세한 내용은 [조각 관리](../../creating-pages/page-fragments-and-widgets/using-fragments/managing-fragments.md) 을 참조하십시오.

```{note}
Liferay DXP 7.2 SP1+ 및 Liferay Portal 7.2 GA2+부터 *글로벌* 사이트에서 페이지 조각을 생성하여 모든 사이트에서 사용할 수 있도록 할 수 있습니다. 이 버전의 초기 릴리스에서 이 기능을 노출하려면 `com.liferay.fragment.web.internal.configuration.FragmentGlobalPanelAppConfiguration.config`라는 `.config` 파일을 만들고 `enabled=B"true"`를 추가해야 합니다. 속성. 그런 다음 Liferay DXP 인스턴스의 `osgi/configs` 폴더에 복사합니다. 글로벌 페이지 조각은 하위 사이트에서 상속되며 글로벌 사이트에서만 편집할 수 있습니다. 글로벌 사이트에서 글로벌 페이지 조각이 참조하는 모든 리소스는 페이지 조각을 활용하는 사이트로 복사됩니다.
```

## 추가 정보

* [조각 툴킷 사용](./using-the-fragments-toolkit.md)
* [조각에 구성 옵션 추가](./adding-configuration-options-to-fragments.md)
