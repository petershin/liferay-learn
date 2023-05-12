---
toc:
  - ./batch-client-extensions/batch-yaml-configuration-reference.md
---
# バッチクライアント拡張機能

{bdg-link-primary}` [Dev Feature](../../system-administration/configuring-liferay/feature-flags.md#dev-feature-flags) `

{bdg-secondary}`Liferay Experience CloudおよびLiferay DXP 7.4+（セルフホスティング）`

```{toctree}
:maxdepth: 3

batch-client-extensions/batch-yaml-configuration-reference.md
```

バッチクライアント拡張は、Liferayの [バッチエンジンフレームワーク](../../headless-delivery/consuming-apis/batch-engine-api-basics-exporting-data.md) と連携して、Liferayインスタンスにデータエンティティを提供します。 LiferayのImport/Export Centerから、1インスタンスのデータをエクスポートします。 そして、それをバッチクライアントエクステンションに追加し、 [deploy](./working-with-client-extensions.md#deploying-to-your-liferay-instance) 、データを別のLiferayインスタンスに取り込むようにします。

バッチクライアント拡張を有効にするには、Liferay を起動する前に、この [ポータルプロパティ](../../installation-and-upgrades/reference/portal-properties.md) を追加してください：

```properties
feature.flag.COMMERCE-8087=true
```

```{warning}
これは [開発中の機能](../../system-administration/configuring-liferay/feature-flags.md#dev-feature-flags) となります。 本番では絶対に開発用機能フラグを有効にしないでください。
```

`client-extension.yaml` ファイルに、バッチクライアント拡張子を指定します：

```yaml
type: batch
```

[オブジェクト定義](../objects/creating-and-managing-objects.md) や [ワークフロー定義](../../process-automation/workflow/introduction-to-workflow.md)など、 [バッチエンジンフレームワーク](../../headless-delivery/consuming-apis/batch-engine-api-basics-exporting-data.md) がサポートするあらゆるタイプのデータを Liferay インスタンスからエクスポートすることができます。 書き出しの際は、JSONTファイル形式を選択してください。 `*.batch-engine-data.json` ファイルを [バッチクライアント拡張](./batch-client-extensions/batch-yaml-configuration-reference.md)に追加したら、 [ビルドしたアーカイブ](./packaging-client-extensions.md) を Liferay Experience Cloud またはセルフホスティングの Liferay インスタンスにデプロイしてください。

## 追加情報

* [クライアントエクステンションの紹介](../client-extensions.md)
* [`client-extension.yaml`でクライアント拡張機能を設定する。](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
