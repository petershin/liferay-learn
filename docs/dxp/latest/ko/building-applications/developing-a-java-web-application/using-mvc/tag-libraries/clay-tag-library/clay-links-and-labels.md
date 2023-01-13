# 점토 라벨 및 링크

Liferay Clay taglibs는 앱에서 레이블 및 링크를 생성하기 위한 태그를 제공합니다. 이 두 요소는 아래에서 다룹니다.

## 라벨

Liferay Clay taglibs는 앱에 대해 몇 가지 다른 레이블을 제공합니다. `clay:label` 태그를 사용하여 앱에 라벨을 추가하세요. 색상으로 구분된 레이블, 제거 가능한 레이블 및 링크가 포함된 레이블을 만들 수 있습니다. 아래 섹션에서는 이러한 옵션을 모두 보여줍니다.

### 색상으로 구분된 레이블

Liferay Clay 라벨은 4가지 색상으로 제공됩니다. 정보는 진한 파란색, 상태는 밝은 회색, 보류는 주황색, 거부는 빨간색, 승인은 녹색입니다.

정보 레이블은 진한 파란색이며 상태 레이블보다 조금 더 눈에 띄기 때문에 일반적인 정보를 전달하는 데 가장 적합합니다. 정보 레이블을 사용하려면 `스타일` 속성을 `정보`으로 설정합니다.

```jsp
<clay:label label="Label text" style="info" />
```

![정보 레이블은 일반 정보를 전달합니다.](./clay-links-and-labels/images/01.png)

상태 레이블은 밝은 회색이며 중립적인 색상으로 인해 기본 정보를 전달하는 데 가장 적합합니다. 상태 레이블은 기본 레이블이므로 `스타일` 속성이 필요하지 않습니다.

```jsp
<clay:label label="Status" />
```

![상태 레이블은 가장 덜 화려하고 기본 정보를 표시하는 데 가장 적합합니다.](./clay-links-and-labels/images/02.png)

경고 라벨은 주황색이며 색상 때문에 경고 메시지를 전달하는 데 가장 적합합니다. 경고 레이블을 사용하려면 `스타일` 속성을 `경고`으로 설정하십시오.

```jsp
<clay:label label="Pending" style="warning" />
```

![경고 레이블은 사용자에게 문제를 알리지만 앱 중단은 없습니다.](./clay-links-and-labels/images/03.png)

위험 레이블은 빨간색이며 무언가 잘못되었거나 실패했음을 나타냅니다. 위험 레이블을 사용하려면 `스타일` 속성을 `위험`으로 설정합니다.

```jsp
<clay:label label="Rejected" style="danger" />
```

![위험 라벨은 해결해야 하는 긴박감을 전달합니다.](./clay-links-and-labels/images/04.png)

성공 레이블은 녹색이며 무언가가 성공적으로 완료되었음을 나타냅니다. 성공 레이블을 사용하려면 `스타일` 속성을 `성공`으로 설정합니다.

```jsp
<clay:label label="Approved" style="success" />
```

![성공 레이블은 성공적인 작업을 나타냅니다.](./clay-links-and-labels/images/05.png)

레이블도 더 클 수 있습니다. 큰 레이블을 표시하려면 `크기` 속성을 `lg` 으로 설정합니다.

```jsp
<clay:label label="Approved" size="lg" style="success" />
```

### 이동식 라벨

사용자가 레이블(예: 임시 알림)을 닫도록 하려면 `closeable` 속성을 `true`으로 설정하여 레이블을 제거할 수 있도록 만들 수 있습니다.

```jsp
<clay:label closeable="<%= true %>" label="Normal Label" />
```

![레이블은 제거할 수 있습니다.](./clay-links-and-labels/images/06.png)

### 링크가 있는 레이블

앵커 태그와 마찬가지로 레이블에 `href` 속성을 추가하여 레이블을 링크로 만들 수 있습니다.

```jsp
<clay:label href="#" label="Label Text" />
```

![레이블은 링크일 수도 있습니다.](./clay-links-and-labels/images/07.png)

## 연결

`<clay:link>` 태그를 사용하여 기존 하이퍼링크를 앱에 추가할 수 있습니다.

```jsp
<clay:link href="#" label="link text" />
```

![Clay taglibs도 링크 요소를 제공합니다.](./clay-links-and-labels/images/08.png)

이제 앱에 링크와 레이블을 추가하는 방법을 알았습니다!

## 관련 항목

* [점토 배지](./clay-badges.md)
* [클레이 카드](./clay-cards.md)
* [점토 양식 요소](./clay-form-elements.md)