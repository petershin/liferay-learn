# 조각 드롭 영역 정의

드롭 영역은 콘텐츠 페이지를 구축하는 데 필수적입니다. 이를 통해 사용자가 다른 조각 및 위젯을 끌어다 놓을 수 있는 조각 내 영역을 정의하여 고유한 페이지 레이아웃 및 동적 디스플레이를 생성할 수 있습니다.

놓기 영역을 정의하려면 다음 단계를 따르세요.

1. *사이트 관리* &rarr; *디자인* &rarr; *단편*로 이동합니다.

1. 조각 세트에서 편집하려는 조각이 있는 세트를 선택합니다.

1. Fragment의 *Actions* (![Action](./../../../images/icon-actions.png)) 버튼을 클릭하고 *Edit* 를 선택하여 [Fragments Editor](./using-the-fragments-editor.md)를 엽니다.

1. HTML 코드 영역에서 `<lfr-drop-zone></lfr-drop-zone>` 레이블을 추가하여 Fragment 내 드롭 영역을 정의합니다.

   ```{important}
   프래그먼트 내의 편집 가능한 요소에는 드롭 영역을 추가할 수 없습니다.
   ```

다음 코드 발췌는 이 레이블을 사용하여 탭 조각 내에서 놓기 영역을 정의하는 방법을 보여줍니다.

   ```html
      <div class="tab-panel">
         [#list 0..configuration.numberOfTabs-1 as i]
         <div aria-labelledby="tab${i+1}" class="tab-panel-item d-none" data-fragment-namespace="${fragmentEntryLinkNamespace}" id="tabPanel${i+1}" role="tabpanel" tabindex="0">
            <lfr-drop-zone></lfr-drop-zone>
         </div>
         [/#list]
      </div>
   ```

이 이미지는 콘텐츠 페이지 편집기 사이드바의 결과를 보여줍니다.

![탭 조각은 콘텐츠 페이지 편집기에서 4개의 다른 놓기 영역을 보여줍니다.](./defining-fragment-drop-zones/images/04.png)

일단 정의되면 Fragment 또는 위젯을 드롭 영역으로 끌어다 놓을 수 있습니다.

```{tip}
낙하 구역에는 ID가 없습니다. 지정된 순서대로 렌더링되며 수동으로 이동할 수 없습니다. 그러나 [Fragment의 다른 요소](./setting-the-order-of-elements-in-a-fragment.md)의 순서를 구성할 수 있습니다.
```

## 추가 정보

- [조각 개발](./developing-fragments-intro.md)
- [조각 편집기 사용](./using-the-fragments-editor.md)
- [조각 툴킷 사용](./using-the-fragments-toolkit.md)
- [조각의 요소 순서 설정](./setting-the-order-of-elements-in-a-fragment.md)
