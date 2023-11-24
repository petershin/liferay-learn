# グリッドフラグメントを使用したレスポンシブレイアウトの構築
<!--TASK: Reconsider article.-->
> 対応可能：Liferay DXP 7.3以降

Liferay DXPではデフォルトで[レスポンシブデザインが使用](../building-a-responsive-site.md)されますが、コンテンツレイアウトをさらに細かく制御したい場合があります。 コンテントページで[グリッドフラグメント](../../creating-pages/page-fragments-and-widgets/using-fragments/using-layout-elements.md)を使用することにより、デスクトップデバイスとモバイルデバイスのさまざまなスクリーンサイズに対してコンテンツレイアウトを正確に制御できます。 [Content Page](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md)を編集すると、Grid Fragment (1) を使ってコンテンツのアウトラインを描き、Device Display セクション (3) で異なるターゲットデバイス用にカスタマイズしたレイアウトスタイル (2) を定義することができます。 たとえば、1行のモジュール数をカスタマイズしたり、グリッドパッディングオプションをスマートフォンサイズの画面専用にカスタマイズすることが可能です。

![グリッドフラグメントを使用すると、さまざまなスクリーンサイズのレイアウトオプションをカスタマイズできます。](./building-responsive-layouts-with-the-grid-fragment/images/04.png)

次の例を考えてみましょう。 保険会社のWebサイトのサービスセクションに、潜在的な顧客を対象としたサービスの概要を提供します。 ここでは、3つのモジュールのGrid Fragmentの中に、3つの異なるサービスの情報を持つ一連のCard Fragmentを使用します。

![グリッドフラグメントを他のフラグメントと組み合わせて、コンテンツレイアウトをカスタマイズできます。](./building-responsive-layouts-with-the-grid-fragment/images/01.png)

コンピューターからこの 'サービス' コンテントページにアクセスすると、グリッドレイアウトに期待される結果が表示されます。 しかし、スマートフォンからアクセスした場合、文字量や各カードフラグの幅の関係で、最適な結果とは言えません。 グリッドフラグメントスタイルを使用すると、各モジュールに表示するカードの数をカスタマイズしたり、さまざまなスクリーンサイズで最高の表示エクスペリエンスが得られるようにスタイルを変更したりできます。

![デフォルトのグリッドレイアウトスタイルは、スマートフォンのスクリーンサイズに最適化されていません。](./building-responsive-layouts-with-the-grid-fragment/images/02.png)

## グリッドフラグメントのレイアウトの変更

1. コンテントページで[グリッドフラグメントを構成](../../creating-pages/page-fragments-and-widgets/using-fragments/using-layout-elements.md)します。
1. 編集サイドバーで、 **ブラウザ**(![Simulation](../../../images/icon-hierarchy.png)) ボタンをクリックし、カスタマイズしたい Grid Fragment をクリックします。
1. 編集ツールバーの［Device Display］セクションで、最適化するスクリーンサイズを選択します。

    ![［Device Display］セクションで、カスタマイズするスクリーンサイズを選択します。](./building-responsive-layouts-with-the-grid-fragment/images/06.png)

1. 設定サイドバーの「**General**」タブで、画面サイズに応じた優先レイアウトオプションを選択します。 たとえば、 ［**スマホ（縦**）］ レイアウトオプションでは、行ごとに1つのモジュールを設定した方がはるかに効果的です。
1. 画像を選択して、その **解像度** をターゲット画面サイズに合わせて設定するか（Liferay DXP 7.4+ で利用可能）、デフォルトの **自動** オプションのままにして [適応型メディア](../../../content-authoring-and-management/documents-and-media/publishing-and-sharing/serving-device-and-screen-optimized-media/how-adaptive-media-works.md) を使用することができます。

    ![ターゲットスクリーンサイズの画像解像度を選択するか、［Auto］オプションのままにしてアダプティブメディアを使用します。](./building-responsive-layouts-with-the-grid-fragment/images/05.png)

1. ［**Publish**］ をクリックします。
1. 必要に応じて、メインツールバーの **シミュレーション**（![Simulation](../../../images/icon-simulation.png)）ボタンをクリックして、ターゲットデバイスでの変更を確認します。

```{tip}
選択したグリッドフラグメント設定を保存して、他のコンテンツページで再利用できます。 詳細については、 [フラグメント構成の保存](../../creating-pages/page-fragments-and-widgets/using-fragments/saving-fragment-compositions.md) を参照してください。
```

## 関連トピック

- [レスポンシブサイトの構築の概要](../building-a-responsive-site.md)
- [フラグメント構成の保存](../../creating-pages/page-fragments-and-widgets/using-fragments/saving-fragment-compositions.md)
- [レイアウト要素の使用](../../creating-pages/page-fragments-and-widgets/using-fragments/using-layout-elements.md)
