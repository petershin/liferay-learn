---
toc:
  - ./batch-client-extensions/batch-yaml-configuration-reference.md
---
# バッチクライアント拡張機能

{bdg-link-primary}` [Dev Feature](../../system-administration/configuring-liferay/feature-flags.md#dev-feature-flags) `

{bdg-secondary}`Liferay Experience Cloud および Liferay DXP 7.4+ (セルフホスト)`

```{toctree}
:maxdepth: 3

batch-client-extensions/batch-yaml-configuration-reference.md
```

バッチクライアント拡張はLiferayの [バッチエンジンフレームワーク](../../headless-delivery/consuming-apis/batch-engine-api-basics-exporting-data.md) と連携し、Liferayインスタンスにデータエンティティを提供します。 Liferayのインポート/エクスポートセンターから、1つのインスタンスのデータをエクスポートします。 そして、それをバッチクライアントエクステンションに追加し、 [deploy](./working-with-client-extensions.md#deploying-to-your-liferay-instance) 、データを別のLiferayインスタンスに取り込みます。

バッチクライアント拡張を有効にするには、Liferay を起動する前にこの [ポータルプロパティ](../../installation-and-upgrades/reference/portal-properties.md) を追加してください：

```properties
feature.flag.COMMERCE-8087=true
```

```{warning}
これは [開発中の機能](../../system-administration/configuring-liferay/feature-flags.md#dev-feature-flags) です。 本番環境では、開発機能フラグを決して有効にしないでください。
```

`client-extension.yaml` ファイルにバッチクライアント拡張子を指定します：

```yaml
type: batch
```

[オブジェクト定義](../objects/creating-and-managing-objects.md) や [ワークフロー定義](../../process-automation/workflow/introduction-to-workflow.md)など、 [バッチエンジンフレームワーク](../../headless-delivery/consuming-apis/batch-engine-api-basics-exporting-data.md) がサポートするあらゆるタイプのデータを Liferay インスタンスからエクスポートできます。 エクスポートする場合は、JSONファイル形式を選択します。 `*.batch-engine-data.json` ファイルが [バッチクライアントエクステンション](./batch-client-extensions/batch-yaml-configuration-reference.md)に追加されたら、 [ビルドされたアーカイブ](./packaging-client-extensions.md) を Liferay Experience Cloud またはセルフホスト Liferay インスタンスにデプロイします。

## 関連トピック

* [クライアント拡張の概要](../client-extensions.md)
* [`client-extension.yaml`でのクライアント拡張の設定](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
