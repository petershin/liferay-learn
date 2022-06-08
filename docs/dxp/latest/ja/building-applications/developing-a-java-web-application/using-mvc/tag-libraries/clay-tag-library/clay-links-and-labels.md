# Clayラベルとリンク

Liferay Clay taglibは、アプリでラベルとリンクを作成するためのタグを提供します。 これらの各要素について、以下で説明します。

## ラベル

Liferay Clay taglibは、アプリにいくつかの異なるラベルを提供します。 `clay:label`タグを使用して、アプリにラベルを追加します。 色分けされたラベル、削除可能なラベル、およびリンクを含むラベルを作成できます。 以下のセクションでは、これらのオプションについて説明します。

### 色分けされたラベル

Liferay Clayのラベルには、情報を表す紺色、ステータスを表す薄い灰色、保留中を表すオレンジ、拒否を表す赤、承認を表す緑の5つの異なる色があります。

情報ラベルは紺色で、ステータスラベルよりも少し目立つため、一般的な情報を伝えるのに最適です。 情報ラベルを使用するには、`style`属性を`info`に設定します。

```jsp
<clay:label label="Label text" style="info" />
```

![情報ラベルは一般的な情報を伝えます。](./clay-links-and-labels/images/01.png)

ステータスラベルは薄い灰色で、中間色であるため、基本的な情報を伝えるのに最適です。 ステータスラベルはデフォルトのラベルであるため、`style`属性は必要ありません。

```jsp
<clay:label label="Status" />
```

![ステータスラベルは、控え目な見た目なので、基本的な情報を表示するのに最適です。](./clay-links-and-labels/images/02.png)

注意ラベルはオレンジ色で、その色合いから、警告メッセージを伝えるのに最適です。 注意ラベルを使用するには、`style`属性を`warning`に設定します。

```jsp
<clay:label label="Pending" style="warning" />
```

![注意ラベルはアプリの破損にはつながらない問題をユーザーに通知します。](./clay-links-and-labels/images/03.png)

危険ラベルは赤色で、何かが間違っているか失敗したことを示します。 危険ラベルを使用するには、`style`属性を`danger`に設定します。

```jsp
<clay:label label="Rejected" style="danger" />
```

![危険ラベルは、対処しなければならない緊急事態を伝えます。](./clay-links-and-labels/images/04.png)

成功ラベルは緑色で、何かが正常に完了したことを示します。 成功ラベルを使用するには、`style`属性を`success`に設定します。

```jsp
<clay:label label="Approved" style="success" />
```

![成功ラベルは、成功したアクションを示します。](./clay-links-and-labels/images/05.png)

ラベルを大きくすることもできます。 大きなラベルを表示するには、`size`属性を`lg`に設定します。

```jsp
<clay:label label="Approved" size="lg" style="success" />
```

### 削除可能なラベル

ユーザーがラベルを閉じられるようにする場合（一時的な通知など）、`closeable`属性を`true`に設定することで、ラベルを削除可能にすることができます。

```jsp
<clay:label closeable="<%= true %>" label="Normal Label" />
```

![ラベルは削除可能にできます。](./clay-links-and-labels/images/06.png)

### リンク付きラベル

アンカータグの場合と同じように、ラベルに`href`属性を追加することで、ラベルをリンクにすることができます。

```jsp
<clay:label href="#" label="Label Text" />
```

![ラベルはリンクにすることもできます。](./clay-links-and-labels/images/07.png)

## リンク

`<clay:link>`タグを使用して、従来のハイパーリンクをアプリに追加できます。

```jsp
<clay:link href="#" label="link text" />
```

![Clay taglibはリンク要素も提供します。](./clay-links-and-labels/images/08.png)

これで、アプリにリンクとラベルを追加する方法がわかりました。

## 関連トピック

* [Clay Badges](./clay-badges.md)
* [Clay Cards](./clay-cards.md)
* [Clay Form Elements](./clay-form-elements.md)