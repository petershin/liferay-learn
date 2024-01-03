# 조각에 스타일 적용

페이지에 조각을 추가할 때 사이드바 메뉴를 사용하여 _스타일_ 구성 탭 [*스타일* 구성 탭](../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md#styles) 포함한 조각을 구성할 수 있습니다.

![The Styles tab in the sidebar menu allows you to configure the styles per fragment on a page.](./applying-styles-to-fragments/images/01.png)

기본적으로 모든 스타일(색상, 간격 등 포함)은 전체 조각에 적용됩니다. CSS가 허용하는 경우 조각에 포함된 요소는 이러한 변경 사항을 상속합니다. 그렇지 않으면 내부 요소가 무시됩니다.

## 스타일 적용 방법 변경

{bdg-secondary}`liferay 7.4 U31+ 및 GA31+`

스타일이 적용되는 방식을 변경하려면 조각의 HTML 구성을 변경해야 합니다. 조각에 포함된 요소에 'data-lfr-styles' 속성을 추가하면 해당 요소에 적용된 스타일이 해당 특정 요소에 대신 적용되도록 할 수 있습니다. _조각당 하나의 `data-lfr-styles` 속성만 허용됩니다._

예를 들어, 이 HTML로 간단한 사용자 정의 조각을 구성하고 스타일 변경을 적용하면 전체 조각에 적용됩니다(렌더링될 때 HTML을 묶기 위해 외부 `<div>` 태그를 추가하여).

```html
<a class="btn btn-nm btn-primary" data-lfr-editable-id="link" data-lfr-editable-type="link">
    Editable link.
</a>
```

이 예제 조각의 배경색을 검은색으로 변경하면 일반적으로 백엔드 스타일에 대해 생성되는 외부 `<div>`에 해당 변경 사항이 적용됩니다. UI에서는 다음과 같습니다.

![Without the data-lfr-styles attribute, the background color applies to the entire fragment, creating an undesirable effect.](./applying-styles-to-fragments/images/02.png)

그러나 프래그먼트 내의 내부 요소 중 하나에 `data-lfr-styles` 속성을 추가하면 대신 해당 특정 요소에 스타일 변경 사항을 적용할 수 있습니다. 이를 사용하여 해당 변경 사항에 가장 적합한 요소를 선택할 수 있습니다.

위의 예에서는 버튼 요소의 HTML 태그에 속성을 추가할 수 있습니다.

```html
<a data-lfr-styles class="btn btn-nm btn-primary" data-lfr-editable-id="link" data-lfr-editable-type="link">
    Editable link.
</a>
```

이렇게 하면 스타일 변경 사항이 조각의 해당 부분에 적용됩니다. 이제 배경색을 검정색으로 변경하면 선택한 요소의 색상이 구체적으로 변경됩니다.

![The data-lfr-styles attribute in this example applies the background color specifically to the button in the fragment.](./applying-styles-to-fragments/images/03.png)

```{note}
`data-lfr-styles` 속성을 조각에 추가하면 이미 페이지에 추가된 조각의 인스턴스에는 영향을 주지 않습니다. 자세한 내용은 [조각 변경 사항 전파](../../creating-pages/page-fragments-and-widgets/using-fragments/propagating-fragment-changes.md) 참조하세요.
```

```{warning}
편집 가능한 요소 내에 포함된 태그에는 `data-lfr-styles` 속성을 사용할 수 없습니다(`data-lfr-editable` 또는 `lfr-editable` 속성 사용). 이러한 편집 가능한 태그 중 하나에 포함된 조각의 일부에 `data-lfr-styles`를 추가하면 해당 태그는 무시됩니다.
```

원하는 조각 편집 방법을 사용하여 `data-lfr-styles` 속성을 추가할 수 있습니다.

* **UI에서 [조각 편집기](./using-the-fragments-editor.md) 사용**: 편집기의 HTML 창에서 변경합니다.
* **[조각 툴킷](./using-the-fragments-toolkit.md)** 사용: 조각의 `index.html` 파일에서 변경합니다.

## 관련 주제

* [조각 개발](./developing-fragments-intro.md)
* [조각 편집기 사용하기](./using-the-fragments-editor.md)
* [Fragments Toolkit 사용하기](./using-the-fragments-toolkit.md)
* [조각에 구성 옵션 추가](./adding-configuration-options-to-fragments.md)
* [조각 구성](../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md)
