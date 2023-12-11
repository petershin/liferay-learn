---
toc:
  - ./fields/adding-fields-to-objects.md
  - ./fields/using-read-only-fields.md
  - ./fields/adding-and-managing-custom-states.md
  - ./fields/aggregation-fields.md
  - ./fields/attachment-fields.md
  - ./fields/encrypted-fields.md
  - ./fields/picklist-fields.md
---
# 項目

```{toctree}
:maxdepth: 3

fields/adding-fields-to-objects.md
fields/using-read-only-fields.md
fields/adding-and-managing-custom-states.md
fields/aggregation-fields.md
fields/attachment-fields.md
fields/encrypted-fields.md
fields/picklist-fields.md
```

{bdg-secondary}`Liferay 7.4 U78+/GA78+`.

オブジェクトフィールドは、データベースのカラムを表すデータ定義で、さまざまなタイプの値を格納します。 すべてのオブジェクトにはデフォルトのシステムフィールドが含まれていますが、 [カスタムフィールド](./fields/adding-fields-to-objects.md) をドラフトと公開されたオブジェクト両方に追加することができます。

オブジェクトドラフトを [公開](./creating-objects.md#publishing-object-drafts) すると、Liferayは公開時にドラフトのすべてのフィールドとリレーションシップを含む初期データベーステーブルを作成します。 パブリッシュ後に追加されたフィールドとリレーションシップは、サイドテーブルに追加されます（例：`[Initial_Table_Name]_x`）。

![All objects include default system fields, but you can add custom fields.](./fields/images/01.png)

Liferayは、バックエンドの特定のデータ型に対応するこれらのフィールドタイプを提供します。

| 項目タイプ（UI）                                             | データ型（HEADLESS） | 説明                                                                                                                                                                                             |
| :---------------------------------------------------- | :------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [アグリゲーション](./fields/aggregation-fields.md) | 文字列            | リレーションシップテーブルの値を用いて計算された読み取り専用の値を格納します。 使用可能な関数は `count`、`sum`、`average`、`min`、`max` である。                                                                                                      |
| [添付ファイル](./fields/attachment-fields.md)    | 関係 > 長い        | ファイルを格納します。デフォルトでは、アップロードされるファイルのサイズは100MB以下です。このフィールドは、 [ドキュメントとメディア](../../../content-authoring-and-management/documents-and-media.md) で受け入れられるすべてのファイルタイプに対応しています。                 |
| ブール値                                                  | ブール値           | trueまたはfalseの値を格納します。 必須のブール値フィールドは常に真の値を必要とします。                                                                                                                                               |
| 日付                                                    | 日付             | 日付の値を格納します。                                                                                                                                                                                    |
| 日時                                                    | 日時             | 日付と時刻の値を保存する。 入力された時間値をそのまま保存したり、UTCに変換することができます。 <br><br> UTCに変換：時間をUTCで保存し、ユーザーのタイムゾーンで表示します。 <br><br> 入力されたままの入力を使用：タイムゾーンに関係なく、入力されたままの時刻を保存・表示する。                                         |
| 10進数 (_旧ダブル_)                                         | 二重線            | 16 桁を上限とする10進数値を格納します。 <br><br> 例：`999.999999999`（合計16桁）                                                                                                                                       |
| [暗号化](./fields/encrypted-fields.md)        | 文字列            | 暗号化された文字列値を格納する。                                                                                                                                                                               |
| 整数                                                    | 整数             | 9桁までの整数を格納します。 一意な値のみを許可することもできます。 <br><br> 最大値: `2147483647` <br><br> 最小値: `-2147483648`                                                                                                      |
| Long 整数 (_以前は Long_)                                  | Long           | 16桁までの大きな整数を格納します。 <br><br> 最大値： `9007199254740991` <br><br> 最小値： `-9007199254740991`                                                                                                          |
| ロングテキスト (_以前はClob_)                                   | Clob           | 最大65,000文字をサポートするテキストボックスの値を格納します。長いテキストフィールドを作成した後、許可される文字数を制限するように設定できます。                                                                                                                    |
| 複数選択の候補リスト                                            | 文字列            | [候補リスト](../picklists.md) の中から1つ以上のString値を格納します。                                                                                                                                     |
| 候補リスト                                                 | 文字列            | [候補リスト](../picklists.md) から1つのString値を格納します。 フィールドを追加したら、Advancedタブでデフォルト値を設定します。 この値は、特定のピックリストオプションを選択して手動で設定することも、式ビルダーを使って動的に設定することもできる。                                         |
| 高精度10進数 (_以前のBigDecimal_)                             | BigDecimal     | 高精度の10進数を丸めずに格納し、最大16桁の10進数までサポートします。 <br><br> 最大値： `999999999999.9999999999999` <br><br> 最小値： `-999999999999.9999999999999`                                                                   |
| 関連                                                    | Long           | 関連するすべてのオブジェクトエントリーの数値IDを格納します。 Objectsは、1対多のリレーションシップの子側のオブジェクトにリレーションシップ・フィールドを自動的に追加する。 詳細については、 [オブジェクトリレーションシップの定義](./relationships/defining-object-relationships.md) を参照してください。 |
| リッチテキスト                                               | Clob           | 高度な書式設定ツールやメディア要素（画像、動画、音声など）でテキストを格納します。                                                                                                                                                      |
| テキスト (_以前は文字列_)                                       | 文字列            | 280文字までのシンプルなテキスト値を保存。 一意な値のみを許可することもできます。 フィールドを作成した後、許可される文字数を制限することができます。                                                                                                                   |

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} オブジェクトへのフィールドの追加
:link: ./fields/adding-fields-to-object.md
:::

:::{grid-item-card} 読み取り専用フィールドの使用
:link: ./fields/using-read-only-fields.md
:::

:::{grid-item-card} カスタム状態の追加と管理
:link: ./fields/adding-and-managing-custom-states.md
:::

:::{grid-item-card} 集約フィールド
:link: ./fields/aggregation-fields.md
:::

:::{grid-item-card} 添付ファイルフィールド
:link: ./fields/attachment-fields.md
:::

:::{grid-item-card} 暗号化されたフィールド
:link: ./fields/encrypted-fields.md
:::

:::{grid-item-card} ピックリストフィールド
:link: ./fields/picklist-fields.md
:::
::::