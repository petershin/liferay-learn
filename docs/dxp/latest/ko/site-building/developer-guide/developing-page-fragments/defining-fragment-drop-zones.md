# 조각 드롭 영역 정의

드롭 영역은 콘텐츠 페이지를 구축하는 데 필수적입니다. 이를 통해 사용자가 다른 조각과 위젯을 끌어다 놓을 수 있는 조각 내 영역을 정의하여 고유한 페이지 레이아웃과 동적 디스플레이를 생성할 수 있습니다.

놓기 영역을 정의하려면 다음 단계를 따르세요.

1. **사이트 관리** &rarr; **디자인** &rarr; **단편** 로 이동합니다.

1. Fragment Sets에서 편집하려는 조각이 있는 세트를 선택합니다.

1. 프래그먼트의 **Actions**(![Action](./../../../images/icon-actions.png)) 버튼을 클릭하고 **Edit** 선택하여 [Fragments Editor](./using-the-fragments-editor.md)엽니다.

1. HTML 코드 영역에서 `<lfr-drop-zone></lfr-drop-zone>` 레이블을 추가하여 조각 내 드롭 영역을 정의합니다.

   ```{important}
   프래그먼트 내의 편집 가능한 요소에는 드롭 영역을 추가할 수 없습니다.
   ```

다음 코드 발췌는 이 레이블을 사용하여 탭 조각 내에서 놓기 영역을 정의하는 방법을 보여줍니다.

   ```html
      <div class="tab-panel">
         [#list 0..configuration.numberOfTabs-1 as i]
         <div aria-labelledby="tab${i+1}-${fragmentEntryLinkNamespace}" class="d-none tab-panel-item" data-fragment-namespace="${fragmentEntryLinkNamespace}" id="tabPanel${i+1}-${fragmentEntryLinkNamespace}" role="tabpanel" tabindex="0">
            <lfr-drop-zone data-lfr-drop-zone-id="${i+1}" data-lfr-priority="${i+1}"></lfr-drop-zone>
         </div>
         [/#list]
      </div>
   ```

이 이미지는 콘텐츠 페이지 편집기 사이드바의 결과를 보여줍니다.

![탭 부분은 콘텐츠 페이지 편집기에서 4개의 다른 놓기 영역을 보여줍니다.](./defining-fragment-drop-zones/images/04.png)

일단 정의되면 조각이나 위젯을 드롭 영역으로 끌어다 놓을 수 있습니다.

## Fragment Drop Zone ID

프래그먼트가 지정된 드롭 영역에 남아 있도록 하려면 `data-lfr-drop-zone-id` 속성을 사용하여 드롭 영역 ID를 추가할 수 있습니다. 드롭 영역을 재정렬하거나 기존 드롭 영역 사이에 새 드롭 영역을 삽입할 때 드롭 영역 ID는 조각이 원래 드롭 영역에 유지되도록 합니다.

고유 ID가 있는 드롭 영역을 삭제하고 전파하면 드롭 영역과 해당 콘텐츠가 페이지에서 제거됩니다. 동일한 ID를 가진 드롭 영역을 조각에 다시 추가하면 초기 전파 후에 게시되지 않은 초안의 콘텐츠만 검색됩니다. 게시된 초안에서 놓기 영역은 새 놓기 영역으로 간주됩니다.

낙하 구역 ID는 필수가 아닙니다. ID가 없는 드롭 영역은 동일하게 작동하며 지정된 순서대로 나타납니다. 드롭 영역 ID를 기존 조각에 추가한 다음 저장하고 전파하면 초기 전파부터 시작하여 ID가 추가됩니다.

## 추가 정보

- [조각 개발](./developing-fragments-intro.md)
- [조각 편집기 사용](./using-the-fragments-editor.md)
- [조각 툴킷 사용](./using-the-fragments-toolkit.md)
- [조각의 요소 순서 설정](./setting-the-order-of-elements-in-a-fragment.md)
