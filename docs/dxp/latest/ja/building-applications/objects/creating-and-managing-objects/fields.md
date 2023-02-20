---
toc:
- ./fields/adding-fields-to-objects.md
- ./fields/adding-and-managing-custom-states.md
- ./fields/aggregation-fields.md
- ./fields/attachment-fields.md
---
# フィールド

```{toctree}
:maxdepth: 3

fields/adding-fields-to-objects.md
fields/adding-and-managing-custom-states.md
fields/aggregation-fields.md
fields/attachment-fields.md
```

{bdg-secondary}`利用可能な Liferay 7.4 U56+/GA56+`

オブジェクトフィールドは、データベースのカラムを表すデータ定義で、さまざまなタイプの値を格納します。 すべてのオブジェクトにはデフォルトのシステムフィールドが含まれていますが、[カスタムフィールド](./fields/adding-fields-to-objects.md)をドラフトと公開されたオブジェクト両方に追加することができます。

オブジェクトドラフトを[公開](./creating-objects.md#publishing-object-drafts)すると、Liferayは公開時にドラフトのすべてのフィールドとリレーションシップを含む初期データベーステーブルを作成します。 公開後に追加されたフィールドとリレーションシップは、サイドテーブルに追加されます（つまり、 `[Initial_Table_Name]_x`）。

![すべてのオブジェクトには、デフォルトのシステムフィールドが含まれていますが、カスタムフィールドを追加することができます。](./fields/images/01.png)

Liferayは、バックエンドの特定のデータ型に対応するこれらのフィールドタイプを提供します。

| 項目タイプ（UI）                               | データ型（HEADLESS）  | 説明                                                                                                                                                                    |
|:--------------------------------------- |:--------------- |:--------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [集約](./fields/aggregation-fields.md)    | 文字列             | リレーションシップテーブルの値を用いて計算された読み取り専用の値を格納します。 利用可能な関数には、`count`、`sum`、`average`、`min`および`max`を含みます。                                                                         |
| [添付ファイル](./fields/attachment-fields.md) | リレーションシップ> Long | ファイルを格納します。デフォルトでは、アップロードされるファイルのサイズは100MB以下です。このフィールドは、[ドキュメントとメディア](../../../content-authoring-and-management/documents-and-media.md)で受け入れられるすべてのファイルタイプに対応しています。   |
| ブール値                                    | ブール値            | trueまたはfalseの値を格納します。                                                                                                                                                 |
| 日付                                      | 日付              | 日付の値を格納します。                                                                                                                                                           |
| 小数（_以前はDouble_)                         | 二重線             | 16 桁を上限とする10進数値を格納します。 <br><br> 例） `999.9999999999` （合計16桁）                                                                                               |
| 整数                                      | 整数              | 9桁までの整数を格納します。 <br><br> 最大値： `2147483647` <br><br> 最小値： `-2147483648`                                                                         |
| 長い整数 (_以前はLong_)                        | Long            | 16桁までの大きな整数を格納します。 <br><br> 最大値： `9007199254740991` <br><br> 最小値： `-9007199254740991`                                                         |
| 長いテキスト（_以前はClob_)                       | Clob            | 最大65,000文字をサポートするテキストボックスの値を格納します。長いテキストフィールドを作成した後、許容される文字数を制限するように設定できます。                                                                                           |
| 複数選択の候補リスト                              | 文字列             | [ピックリスト](../picklists.md)の中から1つ以上の文字列値を格納する。                                                                                                                          |
| 候補リスト                                   | 文字列             | [ピックリストから1つの文字列値を格納する](../picklists.md).                                                                                                                              |
| 小数の精度 (_以前はBigDecimal_)                 | BigDecimal      | 高精度の10進数を丸めずに格納し、最大16桁の10進数までサポートします。 <br><br> 最大値： `99999999999999.9999999999999999` <br><br> 最小値： `-99999999999999.9999999999999999`        |
| 関連                                      | Long            | 関連するすべてのオブジェクトエントリーの数値IDを格納します。 オブジェクトは、一対多の関連の子側のオブジェクトに、自動的に関連フィールドを追加します。 詳細については、[オブジェクトリレーションシップの定義](./relationships/defining-object-relationships.md)を参照してください。 |
| リッチテキスト                                 | Clob            | 高度な書式設定ツールやメディア要素（画像、動画、音声など）でテキストを格納します。                                                                                                                             |
| Text (_以前はString_)                      | 文字列             | 最大280文字までの単純なテキスト値を格納します。テキストフィールドを作成した後、許容文字数を制限するように設定することができます。                                                                                                    |

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} オブジェクトにフィールドを追加する
:link: ./fields/adding-fields-to-objects.md
:::

:::{grid-item-card} カスタムステータスの追加と管理
:link: ./fields/adding-and-managing-custom-states.md
:::

:::{grid-item-card} 集約フィールド
:link: ./fields/aggregation-fields.md
:::

:::{grid-item-card} 添付ファイルフィールド
:link: ./fields/attachment-fields.md
:::
::::
