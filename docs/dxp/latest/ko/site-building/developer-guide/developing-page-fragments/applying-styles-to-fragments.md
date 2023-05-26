# 조각에 스타일 적용

페이지에 프래그먼트를 추가할 때 사이드바 메뉴를 사용하여 [**스타일** 구성 탭](../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md#styles) 을 포함하여 프래그먼트를 구성할 수 있습니다.

![사이드바 메뉴의 스타일 탭을 사용하면 페이지의 조각별로 스타일을 구성할 수 있습니다.](./applying-styles-to-fragments/images/01.png)

기본적으로 모든 스타일(색상, 간격 등 포함)은 전체 조각에 적용됩니다. 프래그먼트에 포함된 요소는 CSS가 허용하는 경우 이러한 변경 사항을 상속합니다. 그렇지 않으면 내부 요소가 무시됩니다.

## 스타일 적용 방법 변경

{bdg-secondary}`사용 가능한 Liferay 7.4 U31+ 및 GA31+`

스타일이 적용되는 방식을 변경하려면 조각의 HTML 구성을 변경해야 합니다. `data-lfr-styles` 속성을 프래그먼트에 포함된 요소에 추가하여 적용된 스타일을 해당 특정 요소에 적용하는 대신 적용합니다. **조각당 하나의 `data-lfr-styles` 속성만 허용됩니다.**

예를 들어, 이 HTML로 간단한 사용자 정의 조각을 구성하고 여기에 스타일 변경을 적용하면 전체 조각에 적용됩니다(외부 `<div>` 태그를 추가하여 HTML이 렌더링될 때 둘러싸도록 함).

```html
<a class="btn btn-nm btn-primary" data-lfr-editable-id="link" data-lfr-editable-type="link">
    Editable link.
</a>
```

이 예제 조각의 배경색을 검은색으로 변경하면 일반적으로 백엔드의 스타일에 대해 생성되는 외부 `<div>` 에 변경 사항이 적용됩니다. UI에서 다음과 같이 표시됩니다.

![data-lfr-styles 속성이 없으면 배경색이 전체 조각에 적용되어 바람직하지 않은 효과를 생성합니다.](./applying-styles-to-fragments/images/02.png)

그러나 `data-lfr-styles` 속성을 프래그먼트 내의 내부 요소 중 하나에 추가하면 대신 해당 특정 요소에 스타일을 변경하여 적용할 수 있습니다. 이를 사용하여 해당 변경 사항에 가장 적합한 요소를 선택할 수 있습니다.

위의 예에서 버튼 요소의 HTML 태그에 속성을 추가할 수 있습니다.

```html
<a data-lfr-styles class="btn btn-nm btn-primary" data-lfr-editable-id="link" data-lfr-editable-type="link">
    Editable link.
</a>
```

이렇게 하면 스타일에 대한 모든 변경 사항이 조각의 해당 부분에 적용됩니다. 이제 배경색을 검은색으로 변경하면 선택한 요소의 색상이 구체적으로 변경됩니다.

![이 예제의 data-lfr-styles 속성은 프래그먼트의 버튼에 특별히 배경색을 적용합니다.](./applying-styles-to-fragments/images/03.png)

```{note}
조각에 `data-lfr-styles` 속성을 추가하면 페이지에 이미 추가된 조각의 인스턴스에는 영향을 미치지 않습니다. 자세한 내용은 [프래그먼트 변경 사항 전파](../../creating-pages/page-fragments-and-widgets/using-fragments/propagating-fragment-changes.md)를 참조하세요.
```

```{warning}
편집 가능한 요소에 포함된 태그에는 `data-lfr-styles` 속성을 사용할 수 없습니다(`data-lfr-editable` 또는 `lfr-editable` 속성 사용). 이러한 편집 가능한 태그 중 하나에 포함된 조각의 일부에 `data-lfr-styles`를 추가하면 무시됩니다.
```

프래그먼트 편집에 선호하는 방법을 사용하여 `data-lfr-styles` 속성을 추가할 수 있습니다.

* **UI에서 [Fragments Editor 사용](./using-the-fragments-editor.md)** : 편집기의 HTML 창에서 변경
* **[Fragments Toolkit 사용](./using-the-fragments-toolkit.md)** : 프래그먼트의 `index.html` 파일을 변경합니다.

## 관련 주제

* [조각 개발](./developing-fragments-intro.md)
* [조각 편집기 사용](./using-the-fragments-editor.md)
* [조각 툴킷 사용](./using-the-fragments-toolkit.md)
* [조각에 구성 옵션 추가](./adding-configuration-options-to-fragments.md)
* [조각 구성](../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md)
