# 国や地域を設定する

Liferayにはデフォルトで240以上の国が含まれていますが、必要に応じて国を追加することができます。 国を追加・編集する際に、配送先住所に使用する州や県などの行政区を追加することができます。 また、各チャンネルで利用可能な国を決定したり、国を完全に無効にすることもできます。

## 国を追加する

1. **Global Menu**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **Commerce** タブを開き、 **Countries** をクリックします。

1. **追加**（![Add Button](../images/icon-add.png)） をクリックします。

1. 国について、これらの詳細を入力します。

   | 項目            | 説明                                                                        |
   |:------------- |:------------------------------------------------------------------------- |
   | 名前            | 国名                                                                        |
   | 請求可能          | 請求先住所の国名 ** のドロップダウンで、国を有効／無効にする。                                         |
   | 出荷可能          | 配送先住所の国名 ** のドロップダウンで、国を有効／無効にする。                                         |
   | 2文字のISOコード    | [ISO-3166-2](https://www.iso.org/obp/ui/#search/code/) 規格に準拠した2文字のISOコード。 |
   | 3文字のISOコード    | [ISO-3166-2](https://www.iso.org/obp/ui/#search/code/) 規格に準拠した3文字のISOコード。 |
   | 数字            | [ISO-3166-2](https://www.iso.org/obp/ui/#search/code/) 規格に準拠した数値コード。      |
   | 付加価値税の対象となります | VAT対象国かどうかの判断                                                             |
   | 配置            | 国名」ドロップダウンで国のソート順を決める                                                     |
   | 有効            | 国の有効化／無効化                                                                 |

   ![必要な情報を入力し、Liferayインスタンスに国を追加します。](./configuring-countries-and-regions/images/01.png)

1. ［**保存**］ をクリックします。

## 地域の追加

Liferayで国に詳細を追加することができます。 これを行うには

1. **Global Menu**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **Commerce** タブを開き、 **Countries** をクリックします。

1. 国の編集を開始し、 **Regions** タブに移動します。

1. **追加** ボタン (![Add Button](../images/icon-add.png)) をクリックします。

1. これらの内容を入力してください。

   | 項目  | 説明                                                                   |
   |:--- |:-------------------------------------------------------------------- |
   | 名前  | 地域名                                                                  |
   | コード | [ISO-3166-2](https://www.iso.org/obp/ui/#search/code/) 地域を識別するためのコード |
   | 配置  | 配送先」ページの「地域」ドロップダウンメニューで、地域の優先順位を決定します。                              |

   この例では、アイルランドにレンスター地方を追加しています。

   ![地域の名称、コード、位置を入力します。](./configuring-countries-and-regions/images/02.png)

1. Toggle **Active** .

1. ［**Save**］ をクリックします。

配送先住所の入力時に、地域が国名になるようにしました。

この例では、「配送先住所」ページのアイルランドの地域リストに、「レンスター」が表示されます。

![チェックアウトの際、ドロップダウンにリージョンとして表示されるのは、レンスターです。](./configuring-countries-and-regions/images/03.png)

## 国別のチャンネルを絞り込む

一部の国を別のチャンネルで制限したい場合があります。 これを行うには

1. **Global Menu**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **Commerce** タブを開き、 **Countries** をクリックします。

1. 国を編集し、 **チャンネル** タブに移動します。

1. トグル **フィルタチャンネルを有効にする** .

   ![Enable filter channelsを切り替えて、国を無効にしたいチャンネルを選択します。](./configuring-countries-and-regions/images/04.png)

1. チェックアウトの際に、国が利用できないチャンネルを選択します。

1. ［**Save**］ をクリックします。

チェックアウト時に、選択したチャンネルの「国」ドロップダウンに国が表示されない。

## 請求先または出荷先として国を無効にする

一部の店舗では、配送や請求のために国を無効にする必要がある場合があります。 これを行うには

1. **Global Menu**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **Commerce** タブを開き、 **Countries** をクリックします。

1. 国を編集する。

1. **Billing Allowed** を切り替えて、課金に使用できないようにします。

1. **Shipping Allowed** を切り替えると、発送時に無効化されます。

   ![Billing AllowedとShipping Allowedを切り替えます。](./configuring-countries-and-regions/images/05.png)

1. ［**Save**］ をクリックします。

その国は請求や発送に利用できなくなりました。 オプションとして国を完全に削除するには、 **Active** を切り替えて無効化します。
