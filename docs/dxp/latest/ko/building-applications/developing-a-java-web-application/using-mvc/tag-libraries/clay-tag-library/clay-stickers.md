---
uuid: d66ecb33-bb56-4acd-bc05-465cbc8e4179
---

# 점토 스티커

배지는 숫자를 표시하고 레이블은 짧은 정보를 표시하는 반면 스티커는 콘텐츠(일반적으로 콘텐츠 유형)의 작은 시각적 지표입니다. 작은 레이블이나 Liferay 아이콘을 포함할 수 있으며 원형과 사각형의 두 가지 모양으로 제공됩니다.

레이블이 있는 정사각형 스티커:

```jsp
<clay:sticker label="JPG" />
```

![앱에 스티커를 포함할 수 있습니다.](./clay-stickers/images/01.png)

아이콘이 있는 정사각형 스티커:

```jsp
<clay:sticker icon="picture" />
```

![스티커에는 아이콘이 포함될 수 있습니다.](./clay-stickers/images/02.png)

원형 스티커:

```jsp
<clay:sticker label="JPG" shape="circle" />
```

![원 스티커를 가질 수도 있습니다.](./clay-stickers/images/03.png)

스티커는 div의 모든 모서리에 배치할 수 있습니다. `사이트` 속성으로 사이트를 나타냅니다: `top-left`, `bottom-left`, `top-right`, or `bottom-right`:

```jsp
<div class="aspect-ratio">

    <img class="aspect-ratio-item-fluid" src="/images/thumbnail_hot_air_ballon.jpg" />

    <clay:sticker displayType="danger" label="PDF" position="top-left" />
</div>
```

![컨테이너 내에서 스티커의 사이트를 지정할 수 있습니다.](./clay-stickers/images/04.png)

이제 앱에서 Clay 스티커를 사용하는 방법을 알았습니다!

## 관련 항목

* [점토 배지](./clay-badges.md)
* [클레이 카드](./clay-cards.md)
* [클레이 아이콘](./clay-icons.md)
