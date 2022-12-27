---
toc:
- ./fields/adding-fields-to-objects.md
- ./fields/adding-and-managing-custom-states.md
- ./fields/aggregation-fields.md
- ./fields/attachment-fields.md
---
# 項目

```{toctree}
:maxdepth: 3

fields/adding-fields-to-objects.md
fields/adding-and-managing-custom-states.md
fields/aggregation-fields.md
fields/attachment-fields.md
```

{bdg-secondary}`Liferay 7.4以降で利用可能`

オブジェクトフィールドは、データベースのカラムを表すデータ定義で、さまざまなタイプの値を格納します。 すべてのオブジェクトにはデフォルトのシステムフィールドが含まれていますが、 [カスタムフィールドを追加することができます。](./fields/adding-fields-to-objects.md) ドラフトとパブリッシュの両方のオブジェクトに追加することができます。

[](./creating-objects.md#publishing-object-drafts) オブジェクトドラフトを公開すると、Liferayは公開時にドラフトのすべてのフィールドとリレーションシップを含む初期データベーステーブルを作成します。 パブリッシング後に追加されたフィールドやリレーションは、サイドテーブルに追加されます（例： `[Initial_Table_Name]_x`）。

![すべてのオブジェクトには、デフォルトのシステムフィールドが含まれていますが、カスタムフィールドを追加することができます。](./fields/images/01.png)

Liferayは、バックエンドの特定のデータ型に対応するこれらのフィールドタイプを提供します。

| 項目タイプ（UI）                               | データ型（HEADLESS） | 説明                                                                                                                                                                              |
|:--------------------------------------- |:-------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [集約](./fields/aggregation-fields.md)    | 文字列            | リレーションシップテーブルの値を用いて計算された読み取り専用の値を格納する。 利用可能な関数は、 `count`, `sum`, `average`, `min`, and `max`。                                                                                   |
| [添付ファイル](./fields/attachment-fields.md) | リレーション> Long   | デフォルトでは、アップロードできるファイルのサイズは100MB以下です。このフィールドは、 [ドキュメントとメディア](../../../content-authoring-and-management/documents-and-media.md) で受け入れられるすべてのファイルタイプに対応しています。               |
| ブール値                                    | ブール値           | 真偽値を格納                                                                                                                                                                          |
| 日付                                      | 日付             | 日付の値を格納                                                                                                                                                                         |
| 小数（_previously Double_)                         | 二重線            | 16 桁を上限とする 10 進数値の値を格納する。 <br><br> 例） `999.9999999999` （合計16桁                                                                                                       |
| 整数                                      | 整数             | 長さ9桁までの整数を格納する。 <br><br> 最大値： `2147483647` <br><br> 最小値： `-2147483648`                                                                                  |
| 長い整数 (_previously Long_)                        | Long           | 16桁までの大きな整数を格納. <br><br> 最大値： `9007199254740991` <br><br> 最小値： `-9007199254740991`                                                                      |
| 長いテキスト（_previously Clob_)                       | Clob           | 最大65,000文字をサポートするテキストボックスの値を格納します。ロングテキストフィールドを作成した後、許容される文字数を制限するように設定することができます。                                                                                               |
| 候補リスト                                   | 文字列            | [選択リスト](../picklists.md)のString値を格納.                                                                                                                                            |
| 小数の精度 (_previously BigDecimal_)                 | BigDecimal     | 丸めずに高精度の10進数を格納し、最大16桁の10進数までサポートします。 <br><br> 最大値： `999999999.9999999999` <br><br> 最小値： `-99999999.9999999999`                                         |
| 関連                                      | Long           | すべての関連するオブジェクトエントリーの数値IDを格納する。 オブジェクトは、一対多のリレーションの子側のオブジェクトに、自動的にリレーションシップフィールドを追加します。 詳細については、[オブジェクトリレーションシップの定義](./relationships/defining-object-relationships.md)を参照してください。 |
| リッチテキスト                                 | Clob           | 高度な書式設定ツールやメディア要素（画像、動画、音声など）を備えたテキストを保存できます。                                                                                                                                   |
| Text (_previously String_)                      | 文字列            | 最大280文字までの単純なテキスト値を格納します。テキストフィールドを作成した後、許容文字数を制限するように設定することができます。                                                                                                              |

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} オブジェクトにフィールドを追加する
:link: ./fields/adding-fields-to-objects.md
:::

:::{grid-item-card} カスタムステートの追加と管理
:link: ./fields/adding-and-managing-custom-states.md
:::

:::{grid-item-card} 集計フィールド
:link: ./fields/aggregation-fields.md
:::

:::{grid-item-card} 添付ファイルフィールド
:link: ./fields/attachment-fields.md
:::  
::::
