# 클레이 버튼

버튼은 여러 가지 유형과 변형이 있습니다. 이 튜토리얼은 Clay taglibs로 생성할 수 있는 버튼의 다양한 스타일과 변형을 다룹니다.

## 유형

**기본 버튼:** 가장 중요한 작업에 사용됩니다. 두 개의 기본 버튼이 함께 있거나 서로 가까이 있어서는 안 됩니다.

레이블이 있는 기본 버튼:

```jsp
<clay:button label="Primary" />
```

![기본 버튼은 밝은 파란색으로 사용자의 시선을 사로잡습니다.](./clay-buttons/images/01.png)

**보조 버튼:** 보조 작업에 사용됩니다. 여러 개의 보조 버튼이 함께 있거나 서로 가까이 있을 수 있습니다.

```jsp
<div class="col">
    <clay:button label="Secondary" style="secondary" />
</div>
<div class="col">
    <clay:button ariaLabel="Wiki" icon="wiki" style="secondary" />
</div>
```

![보조 버튼은 기본 버튼보다 주의를 덜 끌며 보조 작업을 위한 것입니다.](./clay-buttons/images/02.png)

**경계선 없는 버튼:** 보조 버튼이 디자인에 비해 너무 무거울 수 있는 도구 모음과 같은 경우에 사용됩니다. 이렇게 하면 디자인이 깔끔해집니다.

```jsp
<div class="col">
    <clay:button label="Borderless" style="borderless" />
</div>
<div class="col">
    <clay:button ariaLabel="Page Template" icon="page-template" style="borderless" />
</div>
```

![테두리 없는 버튼은 버튼에서 어두운 윤곽선을 제거합니다.](./clay-buttons/images/03.png)

**링크 버튼:** 취소 작업에 사용됩니다.

```jsp
<div class="col">
    <clay:button label="Link" style="link" />
</div>
<div class="col">
    <clay:button ariaLabel="Add Role" icon="add-role" style="link" />
</div>
```

![버튼을 링크로 전환할 수도 있습니다.](./clay-buttons/images/04.png)

단추에 레이블이나 아이콘을 사용할 수 있습니다. 다음은 아이콘이 있는 기본 버튼의 예입니다.

```jsp
<clay:button ariaLabel="Workflow" icon="workflow" />
```

![단추는 아이콘을 표시할 수도 있습니다.](./clay-buttons/images/05.png)

`disabled` 속성을 추가하여 버튼을 비활성화할 수 있습니다.

```jsp
<div class="col">
    <clay:button disabled="<%= true %>" label="Primary" />
</div>
<div class="col">
    <clay:button ariaLabel="Workflow" disabled="<%= true %>" icon="workflow" />
</div>
```

![사용자가 버튼과 상호작용하는 것을 원하지 않으면 버튼을 비활성화할 수 있습니다.](./clay-buttons/images/06.png)

## 변형

아이콘과 텍스트가 있는 버튼:

```jsp
<clay:button icon="share" label="Share" />
```

![버튼은 아이콘과 텍스트를 모두 표시할 수 있습니다.](./clay-buttons/images/07.png)

고정폭 텍스트가 있는 버튼:

```jsp
<clay:button icon="indent-less" monospaced="<%= true %>" style="secondary" />
```

![버튼은 모노스페이스 텍스트를 표시할 수 있습니다.](./clay-buttons/images/08.png)

블록 레벨 버튼:

```jsp
<clay:button block="<%= true %>" label="Button" />
 ```

![블록 레벨 버튼은 컨테이너의 전체 너비에 걸쳐 있습니다.](./clay-buttons/images/09.png)

더하기 버튼:

```jsp
<clay:button icon="plus" monospaced="<%= true %>" style="secondary" />
```

![더하기 버튼은 앱에서 작업을 추가하는 데 사용됩니다.](./clay-buttons/images/10.png)

작업 버튼:

```jsp
<clay:button icon="ellipsis-v" monospaced="<%= true %>" style="borderless" />
 ```

![작업 버튼은 작업 메뉴를 표시하는 데 사용됩니다.](./clay-buttons/images/11.png)

## 관련 항목

* [클레이 알림](./clay-alerts.md)
* [클레이 버튼](./clay-buttons.md)
* [점토 라벨 및 링크](./clay-links-and-labels.md)