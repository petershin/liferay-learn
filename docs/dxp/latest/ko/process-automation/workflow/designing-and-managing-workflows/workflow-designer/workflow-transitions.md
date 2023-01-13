# 워크플로 전환

{bdg-primary}`구독`

전환은 워크플로가 통과할 수 있는 경로를 나타냅니다. 워크플로 디자이너의 팔레트에서 전환은 워크플로 노드를 연결하는 화살표입니다.

![전환은 워크플로의 경로를 안내합니다.](./workflow-transitions/images/01.png)

디자이너에서 전환을 만들려면

1. 원래 노드 측면 중 하나의 중간점 위로 마우스를 가져갑니다.
1. 커서가 더하기 기호(![Plus](../../../../images/icon-plus.png))로 바뀌면 길게 클릭합니다.
1. 전환을 대상 노드로 드래그합니다. 커서가 다시 더하기 기호(![Plus](../../../../images/icon-plus.png))가 되면 마우스 버튼을 놓습니다.

![원래 노드에서 대상으로 전환을 드래그합니다.](./workflow-transitions/images/02.png)

전환의 속성을 편집하려면 디자이너 팔레트에서 해당 레이블을 클릭하면 해당 속성이 사이드바에 표시됩니다.

![전환을 구성합니다.](./workflow-transitions/images/03.png)

**레이블** 은 전환을 나타내는 표시된 텍스트입니다. 사용자가 [작업 노드](../../developer-guide/workflow-task-node-reference.md)에서 작업할 때 검토를 수행할 때 취할 수 있는 작업(예: 거부 또는 승인)으로 전환 레이블이 표시됩니다.

**전환 ID** 은 사용자 지정 코드, 스크립트에서 또는 워크플로 정의의 XML을 편집할 때 전환을 식별하는 데 사용되는 식별자입니다. 이것을 기억하기 쉽게 만들고 라벨에 연결하는 것이 좋습니다. 라벨이 _검토_인 경우 전환 ID _검토_을 만들 수 있습니다. 더 긴 라벨의 경우 카멜 케이스 또는 스네이크 케이스 사용을 고려하십시오. 워크플로가 게시된 후에는 전환 ID를 변경하지 않는 것이 좋습니다.

**기본값** 은 전환이 노드의 기본값인지 여부를 설정합니다. 하나의 나가는 전환만 각 노드의 기본값이 될 수 있습니다. 전환이 하나만 있는 경우 자동으로 기본값이 됩니다. 기본값은 워크플로 작업 할당자에 대한 UI의 첫 번째 옵션으로 표시되므로 기본 전환을 최상의 또는 가장 예상되는 워크플로 경로로 이끄는 전환으로 만드는 것이 좋습니다.

XML에서 각 노드의 전환은 `전환` 요소에 정의됩니다.

```xml
<transitions>
    <transition>
        <labels>
            <label language-id="en_US">
                approve
            </label>
        </labels>
        <id>approve</id>
        <target>approved</target>
        <default>true</default>
    </transition>
    <transition>
        <labels>
            <label language-id="en_US">
                reject
            </label>
        </labels>
        <id>reject</id>
        <target>update</target>
        <default>false</default>
    </transition>
</transitions>
```
