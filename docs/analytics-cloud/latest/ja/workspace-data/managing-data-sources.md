# データソースの管理

[Liferay DXP](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md) をワークスペースに接続した後、設定ページから閲覧・変更することができます。 ［**設定**］ &rarr; ［**ワークスペースデータ**］ &rarr; ［**データソース**］ へ移動します。

![設定で接続されているデータソースのリストを見ることができます。](./managing-data-sources/images/01.png)

Liferay DXP インスタンスをまだ接続していない場合は、 [Liferay DXPをAnalytics Cloudに接続する](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md) をご覧ください。

Liferay DXPのデータソースを表示したり変更したりするには、接続されているデータソースの名前をクリックします。

![データソース名をクリックすると、新しいページが表示されます。](./managing-data-sources/images/02.png)

右側の[Current Status]パネルには、データソースのステータスが表示されています。  接続されていて同期しているデータソースの場合は **Active** 、接続されているがサイトと連絡先が構成されていないデータソースの場合は **Connected** 、接続されていないデータソースの場合は、 **Disconnected** となっています。

**名前：** データソースの名前。 名前を変更するには、編集アイコン（![Edit](../images/icon-edit.png)）をクリックして、新しい名前を入力します。 ［チェックマーク］をクリックすると保存されます。

**DXP Instance ID:** DXPインスタンスのユニークなIDを表示します。

ワークスペースからDXPインスタンスを切断する場合は、 ［**Disconnect**］ ボタンをクリックします。 確認を求められます。 なお、データソースを切断すると、アナリティクスデータのすべての同期が停止します。

**同期済みのサイト：** DXPサイトのAnalytics Cloudとの同期状態を表示します。 設定方法は、 [syncing sites to a property](../workspace-settings/scoping-sites-and-individuals-using-properties.md#syncing-sites-to-a-property) を参照してください。

**同期済みの連絡先：** DXP連絡先のAnalytics Cloudとの同期状態を表示します。 設定方法は、 [syncing sites to a property](../workspace-settings/scoping-sites-and-individuals-using-properties.md#syncing-contacts-to-a-property) を参照してください。

## データソースの削除

データソースを削除するには、ページの右上にある ［**Delete Data Source**］ ボタンをクリックします。 確認を求められます。 なお、データソースを削除すると、接続が解除され、同期されたデータがすべて削除されます。
