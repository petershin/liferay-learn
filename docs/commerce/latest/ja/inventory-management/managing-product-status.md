# 製品ステータスの管理

商品を編集する際、公開終了をスケジュールしたり、手動で未公開にしてストアカタログから削除することができます。

## 商品の有効期限の設定

商品または個々のSKUに有効期限を設定します。 期限が切れると、その商品SKUはストアカタログから削除され、購入できなくなり、検索結果にも表示されなくなります。

```{note}
製品レベルで有効期限を設定すると、その製品のすべてのSKUに適用されます。
```

次の手順を実行します：

1. **グローバルメニュー**(![グローバルメニュー](../images/icon-applications-menu.png))メニューを開き、 **Commerce** &rarr; **Products** に移動します。

1. 商品をクリックします。

1. Schedule]で、[**Never Expire**]のチェックを外す。 この設定は、商品のすべてのSKUに影響します。

1. 有効期限の日時を入力します。

   ![Set the product's expiration date.](./managing-product-status/images/01.png)

   ```{tip}
   有効期限と時間はLiferayインスタンスのタイムゾーンに基づきます。 タイムゾーンを表示または変更するには、*Global Menu* (![Global Menu](../images/icon-applications-menu.png)) を開き、*Control Panel* &rarr; *Instance Settings* に進みます。 次に、*［ローカライズ］* &rarr; *［標準時］*に移動します。
   ```
1. ［**公開**］ をクリックします。

一度有効期限に達した商品は、Liferayの次のチェック間隔まで有効なままです。 デフォルトでは15分間隔ですが、システム設定で設定することができます。 ![グローバルメニュー](../images/icon-applications-menu.png)を開き、[コントロールパネル] &rarr; **システム設定** に移動します。 そこで、 **カタログ** &rarr; **製品** に移動します。 チェック間隔 **の値を変更し、** **保存** をクリックします。

```{warning}
この機能を無効にする必要がある場合は、 [OSGiコンポーネントのブラックリスト登録](https://learn.liferay.com/web/guest/w/dxp/system-administration/installing-and-managing-apps/managing-apps/blacklisting-osgi-components.md) コンポーネント。 インターバルにゼロや負の数を入力しないでください。
```

有効期限を過ぎると、その商品のSKUはストアのカタログに表示されなくなり、購入することができなくなります。 個々のSKUに代替品と一緒に有効期限を設定する方法については、 [代替製品](../pricing/promoting-products/replacement-products.md) をご覧ください。

![The product has a status of Expired after passing the expiration date.](./managing-product-status/images/02.png)

新しい有効期限を入力し、商品を再公開することで、商品の可視性を変更することができます。

## 商品をドラフトとして設定する

必要であれば、手動で製品の公開を解除し、ステータスを **draft** に設定することができます。 ドラフト中は、その商品のSKUはストアのカタログに表示されなくなり、購入することはできません。 この機能は、変更した内容をすぐにエンドユーザーに公開せずに、商品を編集したい場合に有効です。 また、在庫数低下時のアクションを使用して、在庫レベルに基づいて商品を未公開にすることができます。 詳しくは [在庫数低下時のアクション](./low-stock-action.md) をご覧ください。

手動で商品を未公開にするには、次の手順に従います。

1. **グローバルメニュー** (![グローバルメニュー](../images/icon-applications-menu.png))を開き、 **Commerce**&rarr; **Products** に移動します。

1. 商品をクリックします。

1. Publishボタンの隣にある **Actions** ボタン（ [Actions Button](../images/icon-actions.png) ）をクリックし、 **Convert to Draft** を選択します。

   ![Select Save as Draft to convert the product into draft status.](./managing-product-status/images/03.png)

1. **OK** をクリックして確定します。

これにより、ストアのカタログページから商品が削除され、お客様はその商品を表示、購入、検索することができなくなります。

![The product has a status of Draft after converting it.](./managing-product-status/images/04.png)

商品を公開するための許可ワークフローがある場合、再度商品を公開するためには、そのワークフローを経由する必要があります。 商品をストアフロントから削除し、承認ワークフローを経ずに再び公開したい場合は、 **公開** チェックボックスのチェックを外し、 **公開** をクリックします。

![Unchecking the published checkbox to remove the product from the storefront.](./managing-product-status/images/05.png)

## Commerce 2.1以前

### 商品を期限切れに設定する

商品の有効期限を設定するには、

1. **コントロールパネル** &rarr; **Commerce** &rarr; **Products** に移動します。

1. 商品をクリックします。

1. 製品の詳細]タブの[**有効期限なし**]チェックボックスをオフにします。 この設定は、商品のすべてのSKUに影響します。

1. 将来の有効期限を入力します。 すべての時間はGMTタイムゾーンを使用して設定されます。

   ![Set the Product's Expiration Date.](./managing-product-status/images/01.png)

1. ［**公開**］ をクリックします。

変更後、デフォルトのチェック間隔が15分であるため、カタログからの削除に時間がかかる場合があります。 これを変更するには、 **グローバルメニュー**( [グローバルメニュー](../images/icon-applications-menu.png) )を開き、 **コントロールパネル** &rarr; **システム設定** に移動します。 そこで、 **カタログ** &rarr; **製品** にアクセスしてください。 チェック間隔 **の値を変更し、**保存** をクリックします。

![The product has a status of Expired after passing the expiration date.](./managing-product-status/images/06.png)

新しい有効期限を入力し、商品を再公開することで、商品の可視性を変更することができます。

### 商品をドラフトとして設定する

1. **コントロールパネル** &rarr; **Commerce** &rarr; **Products** に移動します。

1. 商品をクリックします。

1. **下書きとして保存**をクリックする。

ドラフト状態にした後は、商品の検索やストアフロントでの表示はできません。

![The product has a status of Draft after converting it.](./managing-product-status/images/04.png)

商品を公開するための許可ワークフローがある場合、再度商品を公開するためには、そのワークフローを経由する必要があります。 商品をストアフロントから削除し、承認ワークフローを経ずに再び公開したい場合は、 **公開** チェックボックスのチェックを外し、 **公開** をクリックします。

![Unchecking the published checkbox to remove the product from the storefront.](./managing-product-status/images/05.png)

## 関連トピック

* [チャネルを使用した商品の可視性の設定](../store-management/channels/configuring-product-visibility-using-channels.md)
* [シンプルな製品の作成](../product-management/creating-and-managing-products/product-types/creating-a-simple-product.md)
* [グループ化された商品の作成](../product-management/creating-and-managing-products/product-types/creating-a-grouped-product.md)
* [バーチャル製品の作成](../product-management/creating-and-managing-products/product-types/creating-a-virtual-product.md)
* [ローストックアクション](./low-stock-action.md)
