# 倉庫の設置

倉庫とは、商品の在庫を保管する物理的な場所のことである。 ウェアハウスをアクティブにするには、そのジオロケーションを設定する必要があります。 Fedexの配送方法は、このジオロケーションを使用して配送料を計算します。 詳しくは、 [Fedexの配送方法を使用する](../store-management/configuring-shipping-methods/using-the-fedex-shipping-method.md) をお読みください。

1つの倉庫で複数のチャネルに対応することも、1つのチャネルに複数の倉庫で対応することも可能です。 **Minium** または **Speedwell** 加速器を使用する場合、3つのサンプル倉庫が1つのチャンネルに対応します。

```{note}
ウェアハウスを作成する前に、ウェアハウスの該当する国や地域を有効にしておく必要があります。 詳しくは、[リージョンの追加](../store-management/adding-regions.md)を参照してください。
```

## 倉庫の追加

1. **Global Menu**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Warehouses** に移動します。

1. **追加**（![Add Button](../images/icon-add.png)） をクリックします。

   ![追加]ボタンをクリックして、新しい倉庫を作成します。](./setting-up-warehouses/images/01.png)

1. 名前を入力します。

1. ［**Submit**］ をクリックします 。

   これにより、新しい非アクティブなウェアハウスが作成されます。 これで、そのアドレス、ジオロケーションを追加し、アクティベートすることができます。

   ![新しいウェアハウスの詳細を入力し、アクティベートする。](./setting-up-warehouses/images/02.png)

1. (オプション) 名前を編集し、説明を追加します。

1. Geolocationセクションに倉庫の緯度と経度の値を入力します。

   また、 [Bing Geocoder](#using-bing-geocoder-to-set-a-warehouses-geolocation) を設定して、倉庫の住所に基づいて倉庫のジオロケーションを自動的に生成することもできます。

1. 住所欄に倉庫の住所を入力します。

1. トグルを ［**有効**］ に切り替えます。

   ```{important}
   ウェアハウスを起動する前に、ジオロケーションを設定する必要があります。
   ```

1. **Eligibility** タブをクリックし、倉庫を特定のチャネルまたは利用可能なすべてのチャネルに関連付けます。 これは、チャネルの商品在庫を決定するものです。

   倉庫を特定のチャンネルに関連付ける場合は、 **Specific Channels** ラジオボタンをクリックし、チャンネル名を入力し、 **Select** をクリックします。

   ![倉庫を利用可能なすべてのチャンネルまたは特定のチャンネルに関連付けます。](./setting-up-warehouses/images/03.png)

1. ［**Save**］ をクリックします。

## Bingジオコーダを使用して倉庫の位置情報を設定する

LiferayはBing Maps APIと統合し、倉庫の住所から自動的にジオロケーションを生成します。 この機能を使用するには、 [Bing Maps アカウント](https://docs.microsoft.com/en-us/bingmaps/getting-started/bing-maps-dev-center-help/creating-a-bing-maps-account) と [Bing Maps Key](https://docs.microsoft.com/en-us/bingmaps/getting-started/bing-maps-dev-center-help/getting-a-bing-maps-key) が必要です。

その後、以下の手順に従ってインスタンスにBingジオコーダを設定します:

1. **Global Menu**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **Control Panel** &rarr; **System Settings** &rarr; **Commerce** &rarr; **Shipping** &rarr; **Bing Geocoder** .

1. ［**API Key**］ を入力します。

   ![Bing Maps APIのAPIキーを入力してください。](./setting-up-warehouses/images/04.png)

1. ［**Save**］ をクリックします。

ジオコーダーの設定が完了すると、住所のあるあらゆる倉庫のジオロケーションを生成することができます。 倉庫のページに移動し、目的の倉庫の **Actions** ボタン (![Actions Button](../images/icon-actions.png)) をクリックし、 **Geolocate** を選択します。 ジオコーダーは、住所を緯度・経度の座標に変換する。

![目的の倉庫のActionsボタンをクリックし、Geolocateを選択します。](./setting-up-warehouses/images/05.png)

## Liferay 7.4 U46/GA46以下

1. **Global Menu**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Warehouses** に移動します。

1. **追加**（![Add Button](../images/icon-add.png)） をクリックします。

   ![追加ボタンをクリックして、新しい倉庫を作成します。](./setting-up-warehouses/images/06.png)

1. 詳細」セクションに、 **名前** 、 **説明**（オプション）を入力します。

   ![新しいウェアハウスの詳細を入力し、アクティベートする。](./setting-up-warehouses/images/07.png)

1. ウェアハウスをアクティブにするには、トグルを **アクティブ** に切り替えます。 アクティベーションの前に、そのジオロケーションを入力することを確認してください。

1. Channelsセクションで、チェックボックスを使用して倉庫をチャンネルに関連付けます。 関連する倉庫は、チャネルの商品在庫を決定します。

1. **Address**」に倉庫の住所を入力します。

1. **Geolocation** セクションに倉庫の緯度と経度の値を入力します。

   または、 [Using Bing Geocoder to Set Warehouse's Geolocation](#using-bing-geocoder-to-set-a-warehouses-geolocation) を参照して、倉庫のジオロケーションを自動的に生成する方法を学んでください。

1. ［**Save**］ をクリックします。

## Commerce 2.1以前

新しい倉庫を追加する場合。

1. **コントロールパネル** &rarr; **コマース** &rarr; **設定** にアクセスしてください。

1. ［**Warehouses**］ タブをクリックします。

1. **追加** ボタン (![Add Icon](../images/icon-add.png)) をクリックし、以下の情報を入力します。

   * **名称** ノースベガスウェアハウス
   * **説明** ノースベガスプロセシングセンター

1. トグルを ［**有効**］ に切り替えます。

1. アドレスを入力してください。

1. チャネルを選択します。 チャネルの商品在庫は、関連する倉庫に依存します。

1. 倉庫の所在地に基づき、必須のジオロケーションデータを入力します。

   * **緯度** ：36.282974
   * **経度** : -115.136

    ![新しく作成されたウェアハウスの設定。](./setting-up-warehouses/images/08.png)

1. 完了したら、 ［**Save**］ をクリックします。

新しい倉庫は、すぐに使えるようにアクティブになっています。

## 追加情報

* [リージョンの追加](../store-management/adding-regions.md)
* [請求先または出荷先として国を無効にする](../store-management/deactivating-a-country-for-billing-or-shipping.md)
* [チャネルについて](../store-management/channels/introduction-to-channels.md)
