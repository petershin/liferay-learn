# 各国の経営

{bdg-secondary}`liferay DXP 7.4 U36/Liferay Portal 7.4 GA36 以上`。

Liferay には [ISO 3166 Standard](https://www.iso.org/iso-3166-country-codes.html) で定義された利用可能な国のリストが含まれていますが、Countries Management アプリを使って既存のエントリーを修正したり、新しいエントリーを追加したりすることができます。

```{note}
liferay DXP 7.4 U36 - U40（またはLiferay Portal 7.4 GA36 - GA40）では、国管理アプリはUIから隠されており、機能フラグを使用して有効にする必要があります。 [Enable Countries Management App](#enable-the-countries-management-app) をご参照ください。
```

## 既存の国を編集する

1. グローバルメニュー(![グローバルメニュー](../../images/icon-applications-menu.png))を開きます。 コントロールパネル* &rarr; _設定_ &rarr; _国管理_ に移動する。

1. 国名をクリックして国を選択するか、国の_Options_ (![Options icon](../../images/icon-actions.png)) をクリックして_Edit_をクリックします。 特定の国をすばやく検索するには、検索バーを使用します。

1. 必要な変更を行い、_Save_をクリックします。 この国は現在、修正されている。

## 国を無効にする

1. グローバルメニュー(![グローバルメニュー](../../images/icon-applications-menu.png))を開きます。 コントロールパネル* &rarr; _設定_ &rarr; _国管理_ に移動します。

1. 国のリストをスクロールして国を探します。 特定の国をすばやく検索するには、検索バーを使用します。

1. カントリーの_Options_（！[オプションアイコン](../../images/icon-options.png)）をクリックし、_Deactivate_をクリックします。

1. _OK_をクリックして確定すると、その国は非アクティブになります。

## 国をアクティブにする

1. グローバルメニュー(![グローバルメニュー](../../images/icon-applications-menu.png))を開きます。 コントロールパネル* &rarr; _設定_ &rarr; _国管理_ に移動する。

1. 検索バーの隣にある_Filter and Order_をクリックし、_Inactive_を選択すると、無効になっている国のリストが表示されます。 特定の国をすばやく検索するには、検索バーを使用します。

1. カントリーの_Options_（！[オプションアイコン](../../images/icon-options.png)）をクリックし、_Activate_をクリックします。 この国は今、活動している。

## 国の削除

1. グローバルメニュー(![グローバルメニュー](../../images/icon-applications-menu.png))を開きます。 コントロールパネル* &rarr; _設定_ &rarr; _国管理_ に移動します。

1. 国のリストをスクロールして国を探します。 特定の国をすばやく検索するには、検索バーを使用します。

1. カントリーの_Options_（！[オプションアイコン](../../images/icon-options.png)）をクリックし、_Delete_をクリックします。

1. OK_をクリックして確定すると、その国が削除されます。

```{warning}
OK_をクリックする前に、エントリーを削除するつもりであることを確認してください。 一度削除されたエントリーは復元できない。
```

## 新しい国を追加する

1. グローバルメニュー(![グローバルメニュー](../../images/icon-applications-menu.png))を開きます。 コントロールパネル* &rarr; _設定_ &rarr; _国管理_ に移動する。

1. 検索バーの横にある_Add_ (![Add icon](../../images/icon-add.png)) をクリックする。 国を追加するための新しいページが表示されます。

   ![A new page appears for adding a country.](./managing-countries/images/02.png)

1. 新しい国を追加するには、フォームに記入してください。 氏名、ISOコード2桁、ISOコード3桁、番号は必須項目です。

1. _Save_ をクリックすると、新しい国が追加されます。

## 国別管理アプリを有効にする

デフォルトでは、国管理アプリはUIから隠されている。 UIを有効にする、

1. [`portal-ext.properties`](../../installation-and-upgrades/reference/portal-properties.md) ファイルに以下のプロパティを追加する：

   `feature.flag.LPS-122223=true`

   Dockerを使用する場合は、初回起動時に以下の [`環境変数`](../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/configuring-containers.md#portal-properties) を使用する：

   `--env LIFERAY_FEATURE_PERIOD_FLAG_PERIOD__UPPERCASEL__UPPERCASEP__UPPERCASES__MINUS__NUMBER1__NUMBER2__NUMBER2__NUMBER2__NUMBER2__NUMBER3_=true`

1. サーバーを再起動してください。 アプリが表示されました。

   ![See the Countries Management app in the UI.](./managing-countries/images/01.png)
