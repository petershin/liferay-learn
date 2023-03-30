---
uuid: 13fbac2c-d863-4d3b-b480-e0e09bb7cfe5
---
# 倉庫の設定

倉庫は、商品の在庫が保管されている物理的な場所を表します。 倉庫を有効にするには、位置情報を設定する必要があります。 Fedexの配送方法では、この位置情報を使用して送料を計算します。 詳しくは、[FedEx配送方法の使用](../store-management/configuring-shipping-methods/using-the-fedex-shipping-method.md)を参照してください。

1つの倉庫で複数のチャンネルに対応することも、1つのチャネルに複数の倉庫で対応することも可能です。 **Minium** または **Speedwell** アクセラレータを使用する場合、3つのサンプル倉庫が1つのチャンネルに対応します。

```{note}
倉庫を作成する前に、倉庫の該当する国や地域を有効にしておく必要があります。 詳しくは、 [地域の追加](../store-management/configuring-countries-and-regions.md#adding-regions) を参照してください。
```

## 倉庫の追加

1. **グローバルメニュー**(![Global Menu](../images/icon-applications-menu.png))を開き、 ［**コマース**］ &rarr; ［**Warehouses**］ に移動します。

1. **追加**（![Add Button](../images/icon-add.png)） をクリックします。

   ![追加ボタンをクリックして、新しい倉庫を作成します。](./setting-up-warehouses/images/01.png)

1. 名前を入力します。

1. ［**送信**］ をクリックします 。

   これにより、新しい無効な倉庫が作成されます。 これにより、住所、位置情報を追加し、有効化できるようになりました。

   ![新しい倉庫の詳細を入力し、アクティベートします。](./setting-up-warehouses/images/02.png)

1. （オプション）名前を編集し、説明を追加します。

1. ［Geolocation］セクションに倉庫の緯度と経度の値を入力します。

   また、 [Bing ジオコーダ](#using-bing-geocoder-to-set-a-warehouses-geolocation) を設定して、倉庫の住所に基づいて倉庫の位置情報を自動的に生成することもできます。

1. ［Address］セクションに倉庫の住所を入力します。

1. トグルを ［**Active**］ に切り替えます。

   ```{important}
   倉庫を有効にする前に、位置情報を設定する必要があります。
   ```

1. ［**Eligibility**］ タブをクリックし、倉庫を特定のチャンネルまたは利用可能なすべてのチャンネルに関連付けます。 これは、チャンネルの商品在庫を決定するものです。

   倉庫を特定のチャンネルに関連付ける場合は、 ［**Specific Channels**］ ラジオボタンをクリックし、チャンネル名を入力し、 ［**Select**］ をクリックします。

   ![倉庫を利用可能なすべてのチャンネルまたは特定のチャンネルに関連付けます。](./setting-up-warehouses/images/03.png)

1. ［**Save**］ をクリックします。

## Bingジオコーダを使用して倉庫の位置情報を設定する

LiferayはBing Maps APIと統合し、倉庫の住所から自動的に位置情報を生成します。 この機能を使用するには、 [Bing Maps アカウント](https://docs.microsoft.com/en-us/bingmaps/getting-started/bing-maps-dev-center-help/creating-a-bing-maps-account) と [Bing Maps Key](https://docs.microsoft.com/en-us/bingmaps/getting-started/bing-maps-dev-center-help/getting-a-bing-maps-key) が必要です。

その後、以下の手順に従ってインスタンスにBingジオコーダを設定します：

1. **グローバルメニュー**（![Global Menu](../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ &rarr; ［**システム設定**］ &rarr; ［**コマース**］ &rarr; ［**Shipping**］ &rarr; ［**Bing Geocoder**］ に移動します。

1. ［**API Key**］ を入力します。

   ![Bing Maps APIのAPIキーを入力してください。](./setting-up-warehouses/images/04.png)

1. ［**Save**］ をクリックします。

ジオコーダを設定すると、住所がある倉庫に対して倉庫の位置情報を生成することができます。 倉庫のページに移動し、目的の倉庫の **アクション** ボタン (![Actions Button](../images/icon-actions.png)) をクリックし、 ［**Geolocate**］ を選択します。 ジオコーダは、住所を緯度と経度の座標に変換します。

![目的の倉庫のアクションボタンをクリックし、［Geolocate］を選択します。](./setting-up-warehouses/images/05.png)

## Liferay 7.4 U46/GA46以下

1. **グローバルメニュー**(![Global Menu](../images/icon-applications-menu.png))を開き、 ［**コマース**］ &rarr; ［**Warehouses**］ に移動します。

1. **追加**（![Add Button](../images/icon-add.png)） をクリックします。

   ![追加ボタンをクリックして、新しい倉庫を作成します。](./setting-up-warehouses/images/06.png)

1. ［Details］セクションで、 **名前** 、 **説明**（オプション）を入力します。

   ![新しい倉庫の詳細を入力し、有効化します。](./setting-up-warehouses/images/07.png)

1. 倉庫を有効にするには、トグルを ［**Active**］ に切り替えます。 有効化の前に、その位置情報を入力してください。

1. ［Channels］セクションで、チェックボックスを使用して倉庫をチャンネルに関連付けます。 関連する倉庫によって、チャンネルの商品在庫が決まります。

1. ［**Address**］ セクションに倉庫の住所を入力します。

1. ［**Geolocation**］ セクションに倉庫の緯度と経度の値を入力します。

   または、 [Bingジオコーダを使用して倉庫の位置情報を設定する](#using-bing-geocoder-to-set-a-warehouses-geolocation) を参照して、倉庫の位置情報を自動的に生成する方法を確認してください。

1. ［**Save**］ をクリックします。

## Commerce 2.1以前

新しい倉庫を追加するには：

1. ［**コントロールパネル**］ &rarr; ［**コマース**］ &rarr; ［**設定**］ に移動します。

1. ［**Warehouses**］ タブをクリックします。

1. **追加** ボタン (![Add Icon](../images/icon-add.png)) をクリックし、以下の情報を入力します。

   * **名前：** North Vegas Warehouse
   * **説明：** North Vegas Processing Center

1. トグルを ［**Active**］ に切り替えます。

1. アドレスを入力してください。

1. チャンネルを選択します。 チャンネルの商品在庫は、関連する倉庫に依存します。

1. 倉庫の場所に基づき、必須の位置情報データを入力します。

   * **緯度** ：36.282974
   * **経度** : -115.136

    ![新しく作成された倉庫の設定。](./setting-up-warehouses/images/08.png)

1. 完了したら、 ［**保存**］ をクリックします。

新しい倉庫は、すぐに使えるように有効になっています。

## 追加情報

* [地域の追加](../store-management/configuring-countries-and-regions.md#adding-regions)
* [国や地域を設定する](../store-management/configuring-countries-and-regions.md)
* [チャンネルについて](../store-management/channels/introduction-to-channels.md)
