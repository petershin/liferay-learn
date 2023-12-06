# 조각 편집기 사용

Liferay DXP에는 콘텐츠 페이지 조각 개발을 위한 내장 [editor](../reference/fragments/page-fragment-editor-interface-reference.md)이 포함되어 있습니다. 편집기에 액세스하려면 **사이트 메뉴**( ![사이트 메뉴](../../../images/icon-product-menu.png) )를 열고 **Design** &rarr; **Fragments** 로 이동합니다. 여기에서 조각과 조각 세트를 보고, 관리하고, 만들 수 있습니다.

* [조각 세트 생성](#creating-a-fragment-set)
* [새 조각 만들기](#creating-a-new-fragment)

```{note}
Liferay DXP 7.4+의 경우 조각 컬렉션은 Liferay UI에서 조각 세트라고 합니다.
```

## 조각 세트 만들기

새 조각을 만들기 전에 해당 조각을 포함할 새 조각 세트를 만들어야 합니다.

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 **디자인** &rarr; **조각** 으로 이동합니다.

   Liferay DXP 7.1 및 7.2에서 **제품 메뉴** 를 열고 **사이트** &rarr; **사이트 빌더** &rarr; **페이지 조각** 으로 이동합니다.

1. 조각 세트 옆에 있는 **추가**( ![추가 버튼](../../../images/icon-plus.png) )를 클릭합니다.

   ![Click the add button next to Fragment Sets.](./using-the-fragments-editor/images/01.png)

1. 새 세트의 **이름** 과 **설명** 을 입력하세요.

   예를 들어 기능별로 또는 팀과 부서별로 조각을 그룹화하는 세트를 만들 수 있습니다.

1. **저장** 을 클릭하세요.

저장한 후에는 세트에 조각을 추가할 수 있습니다.

## 새 조각 만들기

```{important}
React 프래그먼트를 생성하려면 [Fragments Toolkit](./using-the-fragments-toolkit.md)을 사용하세요.
```

조각을 만들려면 다음 단계를 따르세요.

1. 원하는 조각 세트로 이동하여 **추가**(![추가 버튼](../../../images/icon-add.png))를 클릭하여 새 조각을 만듭니다.

   ```{note}
   Liferay DXP 7.3 이전에는 조각이 섹션 또는 구성 요소일 수 있었습니다. Liferay DXP 7.3+에서는 모든 페이지 조각이 구성 요소입니다.
   ```

1. 기본 또는 [Form](../developing-page-fragments/creating-form-fragments.md) 중에서 조각 유형을 선택하고 **다음** 을 클릭합니다.

1. 조각의 이름을 입력하고 **추가** 를 클릭합니다.

1. 코드 탭에서 HTML, CSS 및 JavaScript 필드를 사용하여 조각의 리소스를 추가합니다. 여기에서는 다양한 장치 컨텍스트에서 조각 모양의 실시간 미리 보기도 볼 수 있습니다.

   다음은 몇 가지 HTML 편집 단축키입니다.

   - 표준 HTML 태그와 Liferay의 조각별 태그에 액세스하려면 여는 꺾쇠 괄호(`<`)를 입력하세요.

   - Liferay의 [편집 가능한 조각 속성](../reference/fragments/fragment-specific-tags-reference.md)에 액세스하려면 `data`로 요소 속성을 시작하세요.

   아래 예에서는 편집 가능한 텍스트가 있는 카드 구성 요소를 추가합니다.

   ```html
   <div class="marketing-card-fragment-01">
     <div class="card">
       <data-lfr-editable id="01-card-image" type="image">
         <img src="https://cdn.dribbble.com/users/1408464/screenshots/9323535/media/a5b9a76256562e878ecc6dc5cd0fadf0.png" class="card-img-top" alt="2020 - Try New Things">
       </data-lfr-editable>
       <div class="card-body">
         <data-lfr-editable id="02-card-title" type="rich-text">
           <h5 class="card-title">Editable Card title</h5>
         </data-lfr-editable>
         <data-lfr-editable id="03-card-text" type="rich-text">
           <p class="card-text">Here is some editable text.</p>
         </data-lfr-editable>
         <data-lfr-editable id="04-card-link" type="link">
           <a href="#" class="btn btn-primary">Editable link</a>
         </data-lfr-editable>
       </div>
     </div>
   </div>
   ```

   ```css
   .marketing-card-fragment-01 .card img {
     max-width: 100%;
   }
   ```

   ![Add HTML, CSS, and Javascript resources to the fragment and see a live preview.](./using-the-fragments-editor/images/02.png)

1. 구성 탭에서 `JSON` 필드를 사용하여 페이지 조각에 [구성 옵션](./adding-configuration-options-to-fragments.md)을 추가합니다.

   ![Add configuration options to a page fragment.](./using-the-fragments-editor/images/03.png)

   ```{tip}
   JSON의 'fields' 객체와 함께 모든 필드 세트에 'configurationRole' 값을 추가하여 관련 필드가 표시되는 탭을 지정할 수 있습니다. 필드가 스타일 탭에 표시되도록 하려면 값을 'styles'로 설정하세요. 또는 '고급'으로 설정하여 고급 탭에 표시되도록 합니다(*Liferay DXP 버전 U23+ 또는 GA23+에만 해당*). `configurationRole`이 설정되지 않은 경우 기본적으로 일반 탭에 표시됩니다.
   ```

1. 조각을 저장하고 [콘텐츠 페이지](../../creating-pages/understanding-pages/understanding-pages.md#content-pages) 에서 사용할 수 있도록 하려면 **게시** 를 클릭하세요.

   ![The fragment can be used in content pages.](./using-the-fragments-editor/images/04.png)

조각을 개발하는 동안 변경 사항은 조각이 게시될 때까지 자동으로 초안으로 저장됩니다. 세트에 추가되면 조각 편집기에서 언제든지 조각을 복사, 내보내기, 편집 및 제거할 수 있습니다. 페이지 조각에 사용 가능한 작업에 대한 자세한 내용은 [조각 관리](../../creating-pages/page-fragments-and-widgets/using-fragments/managing-fragments.md)를 참조하세요.

```{note}
Liferay DXP 7.2 SP1+ 및 Liferay Portal 7.2 GA2+부터 *글로벌* 사이트에서 페이지 조각을 생성하여 모든 사이트에서 사용할 수 있도록 할 수 있습니다. 이러한 버전의 초기 릴리스에서 이 기능을 노출하려면 `com.liferay.fragment.web.internal.configuration.FragmentGlobalPanelAppConfiguration.config`라는 `.config` 파일을 생성하고 `enabled=B"true"`를 추가해야 합니다. 재산. 그런 다음 Liferay DXP 인스턴스의 `osgi/configs` 폴더에 복사하세요. 글로벌 페이지 조각은 하위 사이트에 상속되며 글로벌 사이트에서만 편집할 수 있습니다. 글로벌 사이트에서 글로벌 페이지 조각이 참조하는 모든 리소스는 페이지 조각을 활용하는 사이트에 복사됩니다.
```

## 관련 주제

[Fragments Toolkit 사용](./using-the-fragments-toolkit.md)

[조각에 구성 옵션 추가](./adding-configuration-options-to-fragments.md)
