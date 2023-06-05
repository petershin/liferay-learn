# 製品のステータス管理

商品を編集する際、有効期限をスケジュールしたり、手動で公開を解除してストアカタログから削除することができます。

## 製品の使用期限を設定する

製品または個々のSKUに有効期限を設定します。 有効期限が切れると、その商品SKUはストアカタログから削除され、購入できなくなり、検索結果にも表示されなくなります。

```{note}
商品レベルで賞味期限を設定すると、その商品のすべてのSKUに適用されます。 
```

次の手順を実行します：

1. **Global Menu**(![Global Menu](../images/icon-applications-menu.png)) メニューを開き、 **Commerce** &rarr; **Products** に移動します。

1. 製品をクリックします。

1. スケジュール］の［**Never Expire**］のチェックボックスをオフにします。 この設定は、製品のすべてのSKUに影響します。

1. 有効期限と時間を入力します。

   ![製品の使用期限を設定する。](./managing-product-status/images/01.png)

   ```{tip}
   有効期限と時間はLiferayインスタンスのタイムゾーンに基づいています。タイムゾーンを表示または変更するには、*グローバルメニュー* (![Global Menu](../images/icon-applications-menu.png)) を開いて*コントロールパネル* &rarr; *Instance Settings* に移動します。 次に、*Localization* &rarr; *Time Zone*に移動します。
   ```

1. ［**公開**］ をクリックします。

一度有効期限に達した製品は、Liferayの次のチェック間隔まで有効なままです。 デフォルトでは15分間隔ですが、システム設定で設定することができます。 **グローバルメニュー**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **コントロールパネル** &rarr; **システム設定** に移動します。 **カタログ** &rarr; **製品** にアクセスします。 **Check Interval** の値を変更し、 **Save** をクリックします。

有効期限を過ぎると、その商品のSKUはストアのカタログに表示されなくなり、購入することができなくなります。 個々のSKUに交換品と一緒に有効期限を設定する方法については、 [交換品](../pricing/promoting-products/replacement-products.md)をご覧ください。

![賞味期限を過ぎた商品は、ステータスが「期限切れ」になっています。](./managing-product-status/images/02.png)

新しい有効期限を入力し、商品を再公開することで、商品の可視性を変更することができます。

## 製品をドラフトに設定する

必要であれば、手動で製品のパブリッシュを解除して、そのステータスを **ドラフト** に設定することができます。 下書き中は、その商品のSKUはストアのカタログに表示されなくなり、購入することはできません。 この機能は、変更した内容をすぐにエンドユーザーに公開せずに、製品を編集したい場合に有効です。 また、Low Stockアクションを使用して、在庫レベルに基づいて商品の公開を解除することができます。 詳しくは [在庫数低下時のアクション](./low-stock-action.md) をご覧ください。

手動で製品の公開を解除するには、次の手順に従います。

1. **グローバルメニュー**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **コマース** &rarr; **製品** に移動します。

1. 製品をクリックします。

1.  ［公開］ボタンの横にある **アクション** ボタン（![Actions Button](../images/icon-actions.png)）をクリックし、 **下書きに変換** を選択します。

   ![Save as Draft を選択すると、製品が下書き状態に変換されます。](./managing-product-status/images/03.png)

1. **OK** をクリックして確認します。

これにより、ストアのカタログページから商品が削除され、お客様はその商品を表示、購入、検索することができなくなります。

![この製品は、変換後のステータスが「Draft」になっています。](./managing-product-status/images/04.png)

商品を公開するための承認ワークフローがある場合、再度商品を公開するためには、そのワークフローを経由する必要があります。 商品をストアフロントから削除し、承認ワークフローを経ずに再び公開したい場合は、 **Publish** のチェックボックスをオフにして、 **Publish** をクリックします。

![公開済みチェックボックスをオフにすると、ストアフロントから製品が削除されます。](./managing-product-status/images/05.png)

## Commerce 2.1以前

### 製品を期限切れに設定する

製品の有効期限を設定する。

1. ［**コントロールパネル**］ &rarr; ［**コマース**］ &rarr; ［**商品**］ に移動します。

1. 商品をクリックします。

1. ［**商品の説明**］ タブで ［**期限を設定しない**］ チェックボックスをオフにします。 この設定は、製品のすべてのSKUに影響します。

1. 将来の有効期限を入力します。 すべての時間はGMTタイムゾーンを使用して設定されます。

    ![製品の有効期限を設定します。](./managing-product-status/images/01.png)

1. ［**Publish**］ をクリックします。

変更後、デフォルトのチェック間隔が15分であるため、カタログからの削除に時間がかかる場合があります。 **グローバルメニュー**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **コントロールパネル** &rarr; **システム設定** に移動することで変更できます。 そこで、 **カタログ** &rarr; **製品** にアクセスしてください。 **Check Interval** の値を変更し、 **Save** をクリックします。

![賞味期限を過ぎた商品は、ステータスが「期限切れ」になっています。](./managing-product-status/images/06.png)

新しい有効期限を入力し、商品を再公開することで、商品の可視性を変更することができます。

### 製品をドラフトに設定する

1. ［**コントロールパネル**］ &rarr; ［**コマース**］ &rarr; ［**商品**］ に移動します。

1. 製品をクリックします。

1. **Save as Draft** をクリックします。

下書き状態にした後は、商品の検索やストアフロントでの表示はできません。

![この製品は、変換後のステータスが「Draft」になっています。](./managing-product-status/images/04.png)

商品を公開するための承認ワークフローがある場合、再度商品を公開するためには、そのワークフローを経由する必要があります。 商品をストアフロントから削除し、承認ワークフローを経ずに再び公開したい場合は、 **Publish** のチェックボックスをオフにして、 **Publish** をクリックします。

![公開済みチェックボックスをオフにすると、ストアフロントから製品が削除されます。](./managing-product-status/images/05.png)

## 関連トピック

* [チャネルを使用した商品の可視性の構成](../store-management/channels/configuring-product-visibility-using-channels.md)
* [シンプル商品の作成](../product-management/creating-and-managing-products/product-types/creating-a-simple-product.md)
* [グループ商品の作成](../product-management/creating-and-managing-products/product-types/creating-a-grouped-product.md)
* [仮想商品の作成](../product-management/creating-and-managing-products/product-types/creating-a-virtual-product.md)
* [在庫数低下時のアクション](./low-stock-action.md)
