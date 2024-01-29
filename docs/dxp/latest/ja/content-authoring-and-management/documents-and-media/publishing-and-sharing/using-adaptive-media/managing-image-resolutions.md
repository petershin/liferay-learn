# 画像解像度の管理

アダプティブ・メディア・アプリケーションを使って、適応された画像解像度を管理できます。 これには、適合画像の手動生成、解像度の無効化/有効化、画像付き解像度の削除が含まれます。

## 画像解像度の編集

アダプティブメディアがアダプテッドイメージの生成に解像度を使用している場合、解像度のサイズと識別子を編集することはできません。 これにより、生成された画像の不整合が防止されます。 適応した画像で解像度の値を変更する必要がある場合は、 [削除](#deleting-image-resolutions) その解像度を削除し、 [作成](./adding-image-resolutions.md) 新しい解像度を作成する必要があります。

## 手動で適応画像を生成する

解像度を追加または有効にする前に画像をアップロードした場合は、それぞれに適合する画像を手動で生成する必要があります。 適応された画像のパーセンテージは、アプリケーションテーブルに表示されます。

![The percentage of adapted images appears in the application table.](./managing-image-resolutions/images/01.png)

解像度の画像を手動で生成する、

1. グローバルメニュー( ![グローバルメニュー](../../../../images/icon-applications-menu.png))を開き、 **コントロールパネル** タブに移動し、 **適応メディア** をクリックします。

1. 希望する解像度の **Actions** ボタン( ![Actions Button](../../../../images/icon-actions.png) )をクリックし、 **Adapt Remaining** を選択します。

   ![Select Adapt Remaining.](./managing-image-resolutions/images/02.png)

   または、アプリケーションバーの **Actions** ボタン (![Actions Button](../../../../images/icon-actions.png) ) をクリックし、 **Adapt All Images** を選択すると、有効なすべての解像度に対応した画像の生成が開始されます。

   ![Select Adapt All Images.](./managing-image-resolutions/images/03.png)

アダプティブ・メディアは、 [の処理設定](./adaptive-media-configuration-reference.md#processes) に従って、各解像度の画像の生成を非同期で開始します。

## 画像解像度の無効化と有効化

画像解像度はデフォルトで有効になっていますが、いつでも無効にすることができます。 解像度を無効にすると、アダプティブメディアはその解像度を使用して画像を生成できなくなりますが、その解像度で以前に生成された画像は引き続き使用できます。

解像度を無効化/有効化する、

1. 希望する解像度の **Actions** ボタン( ![Actions Button](../../../../images/icon-actions.png) )をクリックします。

1. **Disable**/**Enable** を選択する。

   ![Select Disable/Enable.](./managing-image-resolutions/images/04.png)

無効になっている間は、アダプティブ・メディアは、適応された画像を生成するために解像度を使用しません。

画像をアップロードし、後で解像度を再有効化する場合は、 [手動で生成する](#manually-generating-adapted-images) 対応画像を生成する必要があります。

## 画像解像度の削除

画像解像度を削除する必要がある場合は、最初に無効にする必要があります。 有効化された解像度を削除することはできません。 これにより、画像解像度が誤って削除されるのを防ぎます。

```{warning}
画像の解像度を削除するときは注意してください。 一度削除されると、その解像度に適応された画像は回復不可能に失われ、新しく作成した画像解像度に自動的に置き換えられることはありません。
```

画像解像度を削除するには

1. 無効化するには、 **Actions** ボタン( ![Actions Button](../../../../images/icon-actions.png) )をクリックします。

1. **削除** を選択する。

   ![Select Delete.](./managing-image-resolutions/images/05.png)

この決議は、適応された画像とともに永久に削除された。

## ごみ箱と適用された画像

適用された画像を [ごみ箱](../../../recycle-bin/recycle-bin-overview.md) に直接移動することはできません。 ただし、元の画像がごみ箱にある場合、対応する適用された画像はごみ箱にあるかのように動作し、ユーザーはそれらを表示できません。 これらの変換された画像を指すURLは `404` エラーコードを返します。

元の画像がごみ箱から復元された場合、適用された画像に再びアクセスできます。

## 関連トピック

* [画像解像度の追加](./adding-image-resolutions.md) 
* [アダプティブ・メディア・コンフィギュレーション・リファレンス](./adaptive-media-configuration-reference.md) 
* [ドキュメントとメディアのサムネイルの移行](./migrating-documents-and-media-thumbnails.md) 
