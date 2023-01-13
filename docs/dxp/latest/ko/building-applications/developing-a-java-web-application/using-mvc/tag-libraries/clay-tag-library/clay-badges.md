# 점토 배지

배지는 알림 또는 읽지 않은 새 메시지와 같은 중요한 정보를 강조 표시하는 데 도움이 됩니다. 배지에는 원형 테두리가 있으며 숫자를 지정하는 데만 사용됩니다. 여기에는 앱에 추가할 수 있는 다양한 유형의 Clay 배지가 포함됩니다.

## 배지 유형

다음 배지 스타일을 사용할 수 있습니다.

기본 배지:

```jsp
<div class="col-md-1">
    <clay:badge label="8" />

    <div>Primary</div>
</div>
```

![기본 배지는 양식의 기본 버튼처럼 주의를 끄는 밝은 파란색입니다.](./clay-badges/images/01.png)

보조 배지:

```jsp
<div class="col-md-1">
    <clay:badge label="87" style="secondary" />

    <div>Secondary</div>
</div>
```

![보조 배지는 밝은 회색이며 기본 버튼보다 덜 집중됩니다.](./clay-badges/images/02.png)

정보 배지:

```jsp
<div class="col-md-1">
    <clay:badge label="91" style="info" />

    <div>Info</div>
</div>
```

![정보 배지는 진한 파란색이며 일반 정보와 관련된 숫자를 나타냅니다.](./clay-badges/images/03.png)

오류 배지:

```jsp
<div class="col-md-1">
    <clay:badge label="130" style="danger" />

    <div>Error</div>
</div>
```

![오류 배지는 오류와 관련된 숫자를 표시합니다.](./clay-badges/images/04.png)

성공 배지:

```jsp
<div class="col-md-1">
    <clay:badge label="1111" style="success" />

    <div>Success</div>
</div>
```

![성공 배지에는 성공적인 작업과 관련된 숫자가 표시됩니다.](./clay-badges/images/05.png)

경고 배지:

```jsp
<div class="col-md-1">
    <clay:badge label="21" style="warning" />

    <div>Warning</div>
</div>
```

![경고 배지는 해결해야 할 경고와 관련된 번호를 표시합니다.](./clay-badges/images/06.png)

이제 배지를 사용하여 앱의 값을 추적하는 방법을 알았습니다.

## 관련 항목

* [점토 라벨 및 링크](./clay-links-and-labels.md)
* [클레이 카드](./clay-cards.md)
* [점토 스티커](./clay-stickers.md)