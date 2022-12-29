# ウィジェットテンプレートを使用したウィジェットのスタイル設定

ウィジェットテンプレートを使用すると、 **Asset Publisher** や **Media Gallery** などのすぐに使えるウィジェットの外観や機能をカスタマイズすることができます。

## ウィジェットテンプレートの作成

1. **サイトメニュー** ![Site Menu](../../../images/icon-product-menu.png)から、 **デザイン** &rarr; **テンプレート** をクリックします。

1. **Widget Templates** タブに移動します。

   ![テンプレート]アプリケーションから [ウィジェットテンプレート]ページにアクセスします。](./styling-widgets-with-widget-templates/images/01.png)

1. **Add**(![Add Button](../../../images/icon-add.png)) をクリックし、テンプレートのウィジェット（例：Asset Publisher）を選択します。

   ![Widget Templateの作成画面では、使用するフィールドや変数を簡単に追加するためのコントロールが用意されています。](./styling-widgets-with-widget-templates/images/02.png)

1. ウィジェットテンプレートの名前を追加します。

1. テンプレートエディタにFreeMarkerのスクリプトを入力します。 Elementsのサイドパネル( ![要素](../../../images/icon-list-ul.png) ) を使って、フィールド、変数、ユーティリティをテンプレートに追加します。 また、 `${` と入力しても、フィールドの候補を見ることができます。

   ```{note}
   Liferay DXP/Portal 7.4+ では、Widget テンプレートは FreeMarker のみをサポートしています。 Velocityはサポートを終了しました。
   ```

1. ［**Save**］ をクリックします。

これにより、新しいウィジェットテンプレートが作成され、ページ上の対応するタイプのウィジェットに適用することができます。

## ウィジェットテンプレートの適用

1. 該当するウィジェットの「**アクション**」 ボタン(![Actions Button](../../../images/icon-actions.png))をクリックし、「**設定」をクリックします。**

1. 表示テンプレート]ドロップダウンメニューを探し、必要なテンプレートを選択します。

   ![対応するウィジェットの設定にある「表示テンプレート」ドロップダウンメニューから、ウィジェットテンプレートを選択します。](./styling-widgets-with-widget-templates/images/03.png)

   ```{note}
   このドロップダウンメニューは、ほとんどのウィジェットのデフォルトタブ、セットアップにあります。 Asset Publisherウィジェットの場合、この設定はDisplay Settingsタブにあります。
   ```

1. ［**Save**］ をクリックします。

   ![ウィジェットの設定を保存してウィジェットテンプレートを使用するようにした後、ウィジェットはその表示にテンプレートを使用します。](./styling-widgets-with-widget-templates/images/04.png)

ウィジェットはカスタムテンプレートを使用するようになりました。 より高度なウィジェットテンプレートスクリプトを使用することにより、ウィジェットの機能をさらに強化できます。

## 追加情報

* [ウィジェットテンプレートの作成](../../creating-pages/using-widget-pages/styling-widgets/creating-a-widget-template.md)
* [ウィジェットのルック＆フィールの設定](../../creating-pages/using-widget-pages/styling-widgets/configuring-widget-look-and-feel.md)
