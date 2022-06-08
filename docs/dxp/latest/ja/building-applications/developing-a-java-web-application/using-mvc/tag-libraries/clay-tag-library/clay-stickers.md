# Clayステッカー

バッジには数字が表示され、ラベルには短い情報が表示されるのに対し、ステッカーはコンテンツ（通常はコンテンツタイプ）の小さな視覚的なインジケーターです。 小さなラベルやLiferayアイコンを含めることができ、円形と正方形の2つの形状があります。

ラベル付きの正方形のステッカー：

```jsp
<clay:sticker label="JPG" />
```

![アプリにステッカーを含めることができます。](./clay-stickers/images/01.png)

アイコン付きの正方形のステッカー：

```jsp
<clay:sticker icon="picture" />
```

![ステッカーにはアイコンを含めることができます。](./clay-stickers/images/02.png)

円形のステッカー：

```jsp
<clay:sticker label="JPG" shape="circle" />
```

![円形のステッカーもあります。](./clay-stickers/images/03.png)

ステッカーは、divの任意の隅に配置できます。 `position`属性（`top-left`、`bottom-left`、`top-right`、`bottom-right`）で位置を示します。

```jsp
<div class="aspect-ratio">

    <img class="aspect-ratio-item-fluid" src="https://claycss.com/images/thumbnail_hot_air_ballon.jpg" />

    <clay:sticker label="PDF" position="top-left" style="danger" />
</div>
```

![コンテナ内のステッカーの位置を指定できます。](./clay-stickers/images/04.png)

これで、アプリでClayステッカーを使用する方法がわかりました。

## 関連トピック

* [Clay Badges](./clay-badges.md)
* [Clay Cards](./clay-cards.md)
* [Clay Icons](./clay-icons.md)