# 클레이 진행률 표시줄

`clay:progressbar` 태그를 사용하여 앱에 진행률 표시줄을 추가할 수 있습니다. 이는 작업의 완료율을 나타내며 세 가지 상태 스타일이 있습니다. `기본값` (파란색), `경고` (빨간색) 및 `완료` (확인 표시가 있는 녹색). 최소값(`minValue`)과 최대값(`maxValue`)을 제공할 수 있습니다.

기본 진행률 표시줄:

```jsp
<clay:progressbar 
    maxValue="<%= 100 %>" 
    minValue="<%= 0 %>" 
    value="<%= 30 %>" 
/>
```

![앱에 진행률 표시줄을 포함할 수 있습니다.](./clay-progress-bars/images/01.png)

경고 진행률 표시줄:

```jsp
<clay:progressbar 
    maxValue="<%= 100 %>" 
    minValue="<%= 0 %>" 
    status="warning" 
    value="<%= 70 %>" 
/>
```

![경고 진행률 표시줄은 오류로 인해 진행률이 완료되지 않았음을 나타냅니다.](./clay-progress-bars/images/02.png)

진행률 표시줄 완료:

```jsp
<clay:progressbar 
    status="complete" 
/>
```

![완료 진행 표시줄은 진행이 완료되었음을 나타냅니다.](./clay-progress-bars/images/03.png)

Clay taglibs를 사용하면 앱의 진행 상황을 쉽게 추적할 수 있습니다.

## 관련 항목

* [Clay 드롭다운 메뉴 및 작업 메뉴](./clay-dropdown-and-action-menus.md)
* [클레이 아이콘](./clay-icons.md)
* [클레이 내비게이션 바](./clay-navigation-bars.md)