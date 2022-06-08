# Clayボタン

ボタンにはいくつかの種類とバリエーションがあります。 このチュートリアルでは、Clay taglibで作成できるボタンのさまざまなスタイルとバリエーションについて説明します。

## 種類

**プライマリボタン**：最も重要なアクションに使用されます。 2つのプライマリボタンを一緒にしたり、互いに近くに配置することはできません。

ラベル付きのプライマリボタン：

```jsp
<clay:button label="Primary" />
```

![プライマリボタンは明るい青色で、ユーザーの注意を引きます。](./clay-buttons/images/01.png)

**セカンダリボタン**：セカンダリアクションに使用されます。 複数のセカンダリボタンを一緒に、または互いに近くに配置できます。

```jsp
<div class="col">
    <clay:button label="Secondary" style="secondary" />
</div>
<div class="col">
    <clay:button ariaLabel="Wiki" icon="wiki" style="secondary" />
</div>
```

![セカンダリボタンは、プライマリボタンよりも注意を引くものではなく、セカンダリアクションを目的としています。](./clay-buttons/images/02.png)

**ボーダレスボタン**：ツールバーなど、セカンダリボタンがデザインに対して重すぎる場合に使用されます。 これにより、デザインがクリーンになります。

```jsp
<div class="col">
    <clay:button label="Borderless" style="borderless" />
</div>
<div class="col">
    <clay:button ariaLabel="Page Template" icon="page-template" style="borderless" />
</div>
```

![ボーダーレスボタンは、ボタンから暗いアウトラインを削除します。](./clay-buttons/images/03.png)

**リンクボタン：**キャンセル操作に使用します。

```jsp
<div class="col">
    <clay:button label="Link" style="link" />
</div>
<div class="col">
    <clay:button ariaLabel="Add Role" icon="add-role" style="link" />
</div>
```

![ボタンをリンクに変えることもできます。](./clay-buttons/images/04.png)

ボタンにラベルまたはアイコンを使用できます。 以下はアイコン付きのプライマリボタンの例です。

```jsp
<clay:button ariaLabel="Workflow" icon="workflow" />
```

![ボタンにはアイコンも表示できます。](./clay-buttons/images/05.png)

`disabled`属性を追加して、ボタンを無効にできます。

```jsp
<div class="col">
    <clay:button disabled="<%= true %>" label="Primary" />
</div>
<div class="col">
    <clay:button ariaLabel="Workflow" disabled="<%= true %>" icon="workflow" />
</div>
```

![ユーザーにボタンを操作させたくない場合は、ボタンを無効にすることができます。](./clay-buttons/images/06.png)

## バリエーション

アイコンとテキストの付いたボタン：

```jsp
<clay:button icon="share" label="Share" />
```

![ボタンはアイコンとテキストの両方を表示できます。](./clay-buttons/images/07.png)

等幅テキストのボタン：

```jsp
<clay:button icon="indent-less" monospaced="<%= true %>" style="secondary" />
```

![ボタンは等幅テキストを表示できます。](./clay-buttons/images/08.png)

ブロックレベルボタン：

```jsp
<clay:button block="<%= true %>" label="Button" />
 ```

![ブロックレベルのボタンは、コンテナの幅全体に広がります。](./clay-buttons/images/09.png)

プラスボタン：

```jsp
<clay:button icon="plus" monospaced="<%= true %>" style="secondary" />
```

![アプリでアクションを追加するには、プラスボタンを使用します。](./clay-buttons/images/10.png)

アクションボタン：

```jsp
<clay:button icon="ellipsis-v" monospaced="<%= true %>" style="borderless" />
 ```

![アクションボタンは、アクションメニューを表示するために使用されます。](./clay-buttons/images/11.png)

## 関連トピック

* [Clay Alerts](./clay-alerts.md)
* [Clay Buttons](./clay-buttons.md)
* [Clay Labels and Links](./clay-links-and-labels.md)