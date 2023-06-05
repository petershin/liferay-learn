# データソースの管理

ワークスペースに[Liferay DXPを接続](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md)した後、設定ページからデータソースを表示し、変更することができます。 ［**設定**］ &rarr; ［**Workspace Data**］ &rarr; ［**Data Sources**］ へ移動します。

![設定で接続されているデータソースのリストを見ることができます。](./managing-data-sources/images/01.png)

Liferay DXPインスタンスをまだ接続していない場合は、[Liferay DXPをAnalytics Cloudに接続する](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md)をご覧ください。

Liferay DXPのデータソースを表示したり変更したりするには、接続されているデータソースの名前をクリックします。

![データソース名をクリックすると、新しいページが表示されます。](./managing-data-sources/images/02.png)

右側の［Current Status］パネルには、データソースのステータスが表示されています。接続されていて同期しているデータソースの場合は ［**Active**］ 、接続されているがサイトと連絡先が構成されていないデータソースの場合は ［**Connected**］ 、接続されていないデータソースの場合は、 ［**Disconnected**］ となっています。

［**Name］：** データソースの名前。 名前を変更するには、編集アイコン（![Edit](../images/icon-edit.png)）をクリックして、新しい名前を入力します。 チェックマークをクリックして保存します。

［**DXP Instance ID］：** DXPインスタンスのユニークIDを表示します。

ワークスペースからDXPインスタンスとのつながりを解除する場合は、 ［**Disconnect**］ ボタンをクリックします。 確認を求められます。 なお、データソースとのつながりを解除すると、アナリティクスデータのすべての同期が停止します。

［**Synced Sites］：** DXPサイトのAnalytics Cloudとの同期状態を表示します。 設定方法は、 [サイトをプロパティに同期する](../workspace-settings/scoping-sites-and-individuals-using-properties.md#syncing-sites-to-a-property) を参照してください。

［**Synced Contacts］：** DXPの連絡先についてAnalytics Cloudとの同期状態を表示します。 設定方法は、 [連絡先をプロパティに同期する](../workspace-settings/scoping-sites-and-individuals-using-properties.md#syncing-contacts-to-a-property) を参照してください。
