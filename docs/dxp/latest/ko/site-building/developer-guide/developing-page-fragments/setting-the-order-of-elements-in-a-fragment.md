# 조각의 요소 순서 설정

> 가용성: 라이프레이 7.4+.

[Slider](../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md) 또는 [Tab](../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md) 조각은 일반적으로 다양한 정보 영역을 표시하는 데 사용됩니다. 슬라이더는 슬라이드의 캐러셀에서 이 정보를 제공합니다. 탭에는 각각 다른 정보를 포함하는 여러 탭이 있습니다.

페이지 또는 템플릿에서 슬라이더 또는 탭 조각을 구성할 때 해당 하위 요소가 사이드바 메뉴의 **선택** 패널(![Selection](../../../images/icon-pages-tree.png))에 나열됩니다. Liferay DXP 7.4 이전에는 이러한 요소가 순서대로 표시되지 않았습니다. 이로 인해 특히 요소가 많은 Fragment의 경우 Slider 또는 Tab 요소가 그룹화되는 방식을 식별하기 어려웠습니다.

![Liferay DXP 7.4+는 Fragment의 요소 순서를 순서대로 보여줍니다.](./setting-the-order-of-elements-in-a-fragment/images/01.png)

Liferay DXP 7.4부터 슬라이더 및 탭 조각은 해당 요소를 순서대로 표시합니다. 또한 Liferay DXP 7.4에는 Fragment의 요소 순서를 설정하는 새로운 `data-lfr-priority` HTML 속성이 포함되어 있습니다. `data-lfr-priority` 값이 낮은 요소는 HTML 코드에서의 순서와 관계없이 선택 목록에서 우선 순위를 갖습니다.

## 슬라이더 조각의 요소 순서 사용자 지정

1. **사이트 관리** &rarr; **디자인** &rarr; **단편** 로 이동합니다.

1. **조각 세트** 아래에서 사용자 지정하려는 조각이 있는 세트를 클릭합니다.

1. Slider 또는 Tab Fragment의 **Actions**(![Action](./../../../images/icon-actions.png)) 버튼을 클릭하고 **Edit** 를 선택하여 [Fragments Editor](./using-the-fragments-editor.md)를 엽니다.

    ![가져온 조각을 편집하여 조각 편집기를 엽니다.](./setting-the-order-of-elements-in-a-fragment/images/06.png)

1. HTML 코드 영역에서 슬라이더 조각 코드를 편집할 수 있습니다. `data-lfr-priority` 속성을 Editable 또는 Drop Zone 영역에 추가합니다. 이 예는 이 순서를 사용하도록 캐러셀 요소를 구성합니다.

   1. `First Slide Title`, with `data-lfr-priority="1"`
   1. `First Slide Subtitle`, with `data-lfr-priority="2"`
   1. `First Responsive Image`, with `data-lfr-priority="3"`

    ```html
        <div class="carousel-inner text-break" id="${fragmentEntryLinkNamespace}-carouselInner" role="group">
            <div class="carousel-item active">
                <img
                    alt="First Responsive Image"
                    class="w-100"
                    data-lfr-editable-id="01-01-image"
                    data-lfr-editable-type="image"
                    data-lfr-priority="3"
                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAJCAYAAAA7KqwyAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAkSURBVHgB7cxBEQAACAIwtH8Pzw52kxD8OBZgNXsPQUOUwCIgAz0DHTyygaAAAAAASUVORK5CYII="
                />

                <div class="carousel-caption d-none d-md-block">
                    <h2
                        data-lfr-editable-id="01-02-title"
                        data-lfr-editable-type="rich-text"
                        data-lfr-priority="1"
                    >
                        First Slide Title
                    </h2>

                    <p
                        data-lfr-editable-id="01-03-subtitle"
                        data-lfr-editable-type="rich-text"
                        data-lfr-priority="2"
                    >
                        First Slide Subtitle
                    </p>
                </div>
            </div>
    ```

    **선택**(![Selection](../../../images/icon-pages-tree.png) 버튼:

    ![슬라이더 조각의 요소는 HTML 코드에서 정의한 순서를 사용합니다.](./setting-the-order-of-elements-in-a-fragment/images/07.png)

    ```{note}
    JavaScript, CSS 또는 구성과 같은 Fragment 코드의 다른 부분을 편집할 필요가 없습니다.
    ```

## 콘텐츠 페이지 편집기에서 요소의 새 순서 확인

1. **사이트 관리** &rarr; **사이트 빌더** &rarr; **페이지** 로 이동합니다.

1. 슬라이더 조각 샘플을 추가하려는 콘텐츠 페이지를 편집합니다(또는 [새 페이지 추가](../../creating-pages/adding-pages/adding-a-page-to-a-site.md)).

1. 콘텐츠 페이지 사이드바에서 조각 및 위젯 (** ![Fragments and Widgets](../../../images/icon-add-widget.png)을 클릭합니다.

1. 조각 열에서 표시할 슬라이더 또는 탭 조각을 찾습니다.

1. 조각을 편집 영역으로 끌어다 놓습니다.

1. 콘텐츠 페이지 사이드바에서 **선택**(![선택](../../../images/icon-pages-tree.png)) 버튼을 사용하여 Fragment의 요소 목록을 표시합니다.

    ```{note}
    Liferay DXP 7.4 이전 버전에서 가져온 슬라이더 또는 탭 조각은 콘텐츠 페이지 편집기 사이드바에 순서대로 표시되지만 `data-lfr-priority` HTML 속성은 포함하지 않습니다. 이 속성을 포함하려면 HTML 조각 코드를 편집해야 합니다.
    ```

## 관련 정보

- [조각 툴킷 사용](./using-the-fragments-toolkit.md)
- [조각 편집기 사용](./using-the-fragments-editor.md)
- [조각 개발](./developing-fragments-intro.md)
