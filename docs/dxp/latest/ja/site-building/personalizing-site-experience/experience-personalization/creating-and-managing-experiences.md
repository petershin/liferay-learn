# エクスペリエンスの作成と管理

{bdg-secondary}`liferay 7.4+、7.3 FP1+、7.2 FP11+`。

エクスペリエンス*を使用して、ユーザーグループごとにコンテンツページをカスタマイズできます。 [コンテンツページのパーソナライゼーション](./content-page-personalization.md) を参照し、エクスペリエンスがサイトのパーソナライゼーションにどのように貢献できるかを学んでください。

## エクスペリエンスの作成

1. *サイトメニュー* (![サイトメニュー](../../../images/icon-product-menu.png))を開き、_サイトビルダー_ &rarr; _ページ_に進みます。

1. コンテンツページの_Actions_ (![Actionsボタン](../../../images/icon-actions.png))をクリックし、_Edit_を選択します。 あるいは、 [コンテンツページ](../../creating-pages/using-content-pages.md) を作成する。

1. [経験] ドロップダウン・メニューを開き、[新規経験] をクリックします。

   ![Open the Experience drop-down menu and click New Experience.](./creating-and-managing-experiences/images/01.png)

1. エクスペリエンスの名前を入力し、ターゲットとするオーディエンスセグメントを選択します。 あるいは、 [セグメント](../segmentation/creating-and-managing-user-segments.md) を作成する。

   デフォルトでは、新しい体験は_誰でも_セグメント（つまり、すべてのサイト訪問者）をターゲットにしています。

1. コンテントページを設計し、ターゲットとするセグメントに対して表示される情報やレイアウトを決定します。

1. *Experience*ドロップダウンメニューを開き、_Up_ (![Up](../../../images/icon-angle-up.png)) または _Down_ (![Down](../../../../images/icon-angle-down.png)) ボタンをクリックして、エクスペリエンスの優先順位を設定します。

   サイト訪問者は、そのセグメントで最高ランキングのエクスペリエンスを見ることができます。 詳しくは [Understanding How Experiences Work](./content-page-personalization.md#understanding-how-experiences-work) を参照。

1. *［公開］*をクリックします。

```{tip}
もしユーザーがログインしていて、ページを編集する権限を持っていて、複数のエクスペリエンスがある場合、 [、選択したエクスペリエンスに基づいて、](../../creating-pages/adding-pages/adding-a-page-to-a-site.md#previewing-pages) 、ページを閲覧/プレビューすることができます。
```

## エクスペリエンスの管理

コンテントページを編集するとき、［エクスペリエンス］をクリックして、そのページのオプションを管理できます。

![You can add, edit, delete, or change priority for Experiences.](./creating-and-managing-experiences/images/03.png)

1. *サイトメニュー* (![サイトメニュー](../../../images/icon-product-menu.png))を開き、_サイトビルダー_ &rarr; _ページ_に進みます。

1. コンテンツページの_Actions_ (![Actionsボタン](../../../images/icon-actions.png))をクリックし、_Edit_を選択します。

1. *経験*ドロップダウンメニューを開きます。 次に以下を行います。

   * Up(![Up](../../../images/icon-angle-up.png)コントロールとDown(![Down](../../../../images/icon-angle-down.png)コントロールを使用して、経験の優先順位を設定します。
   * 編集（！[Edit](../../../images/icon-edit.png)）経験の名前または選択されたセグメントを編集します。
   * 経験を複製する(![複製](../../../images/icon-copy.png))。
   * エクスペリエンスを削除します（！[Delete](../../../images/icon-delete.png)）。

   ```{important}
   ドロップダウンメニューのエクスペリエンスの順序は、重要度を決定します。 詳しくは [Understanding How Experiences Work](./content-page-personalization.md#understanding-how-experiences-work) を参照。
   ```

## 関連情報

- [コンテンツページのパーソナライズ](./content-page-personalization.md)
- [パーソナライズ・コレクション](./personalizing-collections.md)
- [ユーザーセグメントの作成と管理](../segmentation/creating-and-managing-user-segments.md)
