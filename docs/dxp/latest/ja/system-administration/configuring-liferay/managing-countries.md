# 国別管理

{bdg-secondary}`利用可能な Liferay DXP 7.4 U36/Liferay Portal 7.4 GA36 以降`

Liferayは、 [ISO 3166 Standard](https://www.iso.org/iso-3166-country-codes.html) で定義された利用可能な国のリストを含んでいますが、Countries Managementアプリを使用して既存のエントリを修正したり、新しいエントリを追加したりすることができます。

```{note}
liferay DXP 7.4 U36 - U40（またはLiferay Portal 7.4 GA36 - GA40）の場合、国別管理アプリはUIから隠されており、機能フラグを使用して有効にする必要があります。 手順は、以下の [国別管理アプリの有効化](#enable-the-countries-management-app) を参照してください。
```

## 既存の国を編集する

1. ［グローバルメニュー］（![Global Menu](../../images/icon-applications-menu.png)）を開きます。 **コントロールパネル** &rarr; **設定** &rarr; **国別管理** に移動します。

1. 国名をクリックして選択するか、国名の上で **オプション**(![Options icon](../../images/icon-actions.png)) をクリックし、 **編集** をクリックします。 特定の国をすばやく探すには、検索バーを使用します。

1. 必要な変更を行い、 **保存** をクリックします。 現在、この国は修正されています。

## 国を無効にする

1. ［グローバルメニュー］（![Global Menu](../../images/icon-applications-menu.png)）を開きます。 **コントロールパネル** &rarr; **設定** &rarr; **国別管理** に移動します。

1. 国のリストをスクロールして、国を探します。 特定の国をすばやく探すには、検索バーを使用します。

1. **オプション**(![Options icon](../../images/icon-options.png)) をクリックし、国の **非アクティブ化** をクリックします。

1. **OK** をクリックして確定すると、その国が解除されます。

## 国の活性化

1. ［グローバルメニュー］（![Global Menu](../../images/icon-applications-menu.png)）を開きます。 **コントロールパネル** &rarr; **設定** &rarr; **国別管理** に移動します。

1. 検索バーの横にある「**Filter and Order**」をクリックし、「**Inactive**」を選択すると、非アクティブな国のリストが表示されます。 特定の国をすばやく探すには、検索バーを使用します。

1. **オプション**(![Options icon](../../images/icon-options.png)) をクリックし、国の **有効化** をクリックします。 この国は今、アクティブです。

## 国を削除する

1. ［グローバルメニュー］（![Global Menu](../../images/icon-applications-menu.png)）を開きます。 **コントロールパネル** &rarr; **設定** &rarr; **国別管理** に移動します。

1. 国のリストをスクロールして、国を探します。 特定の国をすばやく探すには、検索バーを使用します。

1. **オプション**(![Options icon](../../images/icon-options.png)) をクリックし、国名で **削除** をクリックします。

1. **OK** をクリックして確定すると、国が削除されます。

```{warning}
OK_をクリックする前に、エントリーを削除することを確認してください。 一度削除したエントリーは元に戻せません。
```

## 新しい国を追加する

1. ［グローバルメニュー］（![Global Menu](../../images/icon-applications-menu.png)）を開きます。 **コントロールパネル** &rarr; **設定** &rarr; **国別管理** に移動します。

1. 検索バーの横にある **追加**(![Add icon](../../images/icon-add.png)) をクリックします。 国を追加するための新しいページが表示されます。

   ![国を追加するための新しいページが表示されます。](./managing-countries/images/02.png)

1. 新しい国を追加する場合は、フォームに入力してください。 名前」「2文字のISOコード」「3文字のISOコード」「番号」は必須項目です。

1. **保存** をクリックすると、新しい国が追加されます。

## 国別管理アプリを有効化する

デフォルトでは、Countries Management AppはUIから非表示になっています。 UIを有効にするには

1. [`portal-ext.properties`](../../installation-and-upgrades/reference/portal-properties.md) ファイルに以下のプロパティを追加してください。

   `feature.flag.LPS-122223=true`

   Docker を使用する場合は、初回起動時に以下の [`環境変数`](../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/configuring-containers.md#portal-properties) を使用してください。

   `--env LIFERAY_FEATURE_PERIOD_FLAG_PERIOD__UPPERCASEL__UPPERCASEP__UPPERCASES__MINUS__NUMBER1__NUMBER2__NUMBER2__NUMBER2__NUMBER2__NUMBER3_=true`
   
   1 サーバーを再起動します。 アプリが表示されるようになりました。
  
  ![UIの「国別管理」アプリをご覧ください。](./managing-countries/images/01.png)