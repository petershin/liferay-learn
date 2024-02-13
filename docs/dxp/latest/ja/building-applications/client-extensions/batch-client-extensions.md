---
toc:
  - ./batch-client-extensions/batch-yaml-configuration-reference.md
---
# バッチクライアント拡張機能

{bdg-secondary}`liferay DXP 7.4 (self-hosted)`   {bdg-secondary}`Liferay Experience Cloud (SaaS)`   {bdg-unsupported}`Liferay Cloud：セルフマネージド`

バッチクライアント拡張はLiferayの [バッチエンジンフレームワーク](../../headless-delivery/consuming-apis/batch-engine-api-basics-exporting-data.md) と連携し、Liferayインスタンスにデータエンティティを提供します。 インスタンスのデータをエクスポートする（例：`curl`またはエクスポート/インポート・センター経由）。 そして、それをバッチクライアントエクステンションに追加し、 [deploy](./working-with-client-extensions.md#deploying-to-your-liferay-instance) 、データを別のLiferayインスタンスに取り込みます。

バッチクライアント拡張機能で使用するためにデータをエクスポートするには、アプリケーションメニューからエクスポート/インポートセンターを使用します( ![アプリケーションメニューアイコン](../../images/icon-applications-menu.png) )。 Export/Import センターを有効にするには、Liferay を起動する前にこの [portal プロパティ](../../installation-and-upgrades/reference/portal-properties.md) を追加してください：

```properties
feature.flag.COMMERCE-8087=true
```

```{warning}
バッチフレームワークのエクスポート／インポートセンターは、開発中の [機能である](../../system-administration/configuring-liferay/feature-flags.md#dev-feature-flags) 。 本番環境では、開発機能フラグを決して有効にしないでください。
```

バッチクライアントの拡張子を `client-extension.yaml` ファイルに指定する：

```yaml
type: batch
```

[オブジェクト定義](../objects/creating-and-managing-objects.md) や [ワークフロー定義](../../process-automation/workflow/introduction-to-workflow.md) など、 [バッチエンジンフレームワーク](../../headless-delivery/consuming-apis/batch-engine-api-basics-exporting-data.md) がサポートするあらゆるタイプのデータを Liferay インスタンスからエクスポートできます。

```{important}
エクスポートする場合は、`jsont`ファイル形式を使用する。 バッチクライアント拡張と組み合わせて使用する場合、`*.batch-engine-dat.json` ファイルには `jsont` が必要です。
```

`*.batch-engine-data.json` ファイルを [バッチクライアントエクステンション](./batch-client-extensions/batch-yaml-configuration-reference.md) に追加したら、 [ビルドしたアーカイブ](./packaging-client-extensions.md) を Liferay Experience Cloud またはセルフホスト Liferay インスタンスにデプロイします。

## 関連トピック

* [クライアント拡張機能の紹介](../client-extensions.md)
* [`client-extension.yaml`でクライアント拡張機能を設定する](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
* [データ移行センター](../../headless-delivery/consuming-apis/data-migration-center.md)
