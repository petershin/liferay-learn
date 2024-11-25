# フィールド検証の追加

{bdg-secondary}`Liferay 7.4 2023.Q3+/GA98+`

検証は、有効なフィールドエントリーを決定するためのルールを設定します。 それぞれのバリデーションには、独自のトリガー、条件、エラーメッセージがあり、オブジェクトUIから設定できる。 [Groovy スクリプト](#using-groovy-validations) または [Liferay 式](#using-expression-builder-validations) を使ってバリデーションを定義できます。

![Create validations for custom and system object fields.](./adding-field-validations/images/01.png)

!!! note
    既成のバリデーションではニーズに合わない場合は、`objectValidationRule` クライアント拡張機能を使用してカスタムバリデーションを作成することができます。 詳細は [マイクロサービスのクライアント拡張](../../../client-extensions/microservice-client-extensions.md) を参照。

バリデーションを追加するには

1. グローバルメニュー( ![グローバルメニュー](../../../../images/icon-applications-menu.png))を開き、 **コントロールパネル** タブを開き、 **オブジェクト** をクリックします。

1. オブジェクト定義の編集を開始します。

1. **Validations** タブに移動し、**Add**( ![Add Button](../../../../images/icon-add.png) ) をクリックします。

1. **ラベル** を入力し、検証タイプを選択します： **Groovy** または **Expression Builder** 。

   オブジェクト検証ルールのクライアント拡張をインスタンスにデプロイしている場合、それらもオプションとして表示されます。

   ![Enter a label and select a validation type.](./adding-field-validations/images/02.png)

1. ［**保存**］をクリックします。

1. バリデーションの編集を開始する。

1. 基本情報タブで、バリデーションを有効にする。

   ![Activate the validation.](./adding-field-validations/images/03.png)

1. 検証を実行するタイミングを決定する **トリガーイベント** を選択します。

   各検証は、1つのトリガーイベントしか持つことができません。

1. **条件** タブに移動し、バリデーションに条件を追加します。

   条件には、複雑なロジックを実行するための複数のフィールドや関数を含めることができます。

   ![Add conditions to the validation.](./adding-field-validations/images/04.png)

   Groovyを使用する場合、サイドパネルから利用可能なデータフィールドを参照し、条件に追加することができます。 詳細は [Using Groovy Validations](#using-groovy-validations) を参照。

   エクスプレッションビルダーを使用する場合、サイドパネルからフィールド、演算子、関数を参照し、条件に追加できます。 詳細は [Using Expression Builder Validations](#using-expression-builder-validations) を参照してください。

   !!! important
       Groovy スクリプトの検証は、Liferay Experience Cloud Self-Managed と Liferay DXP Self-Hosted でのみ利用できます。

1. ローカライズ可能な **エラーメッセージ** を入力してください。 このメッセージは、バリデーションがトリガーされ、フィールド入力が定義された条件の1つ以上を満たさない場合に表示されます。

1. 出力検証タイプを選択して、エラーメッセージが表示される場所を決定する。

    **完全検証（フォーム要約**） ：フォームの上部にエラーメッセージを表示します。

    **部分検証（インライン・フィールド**） ：指定したフィールドの横にエラーメッセージを表示します。

    ![Enter an error message and select an output validation type.](./adding-field-validations/images/05.png)

1. ［**保存**］をクリックします。

有効化されている間、バリデーションはすべての新規オブジェクトエントリに対して実行され、 [レイアウト](../layouts.md) と [フォームコンテナ](../../using-fragments-to-build-forms.md) に表示されます。

![Validations are displayed in form containers.](./adding-field-validations/images/06.png)

## Groovy検証の使用

{bdg-primary}`Liferay Experience CloudセルフマネージドおよびLiferay DXPセルフホスティング`

Groovyのバリデーションは、 [Groovy Script](https://groovy-lang.org/) の標準的な機能をすべてサポートしています。 条件を定義する際には、 `invalidFields` 変数を使用しなければならない。 Liferay は `invalidFields` が `true` を返したときのみバリデーションエラーメッセージを表示します。

![Use the side panel to add field elements to your Groovy validations.](./adding-field-validations/images/07.png)

Liferay は [GroovyShell クラス](https://docs.groovy-lang.org/latest/html/api/groovy/lang/GroovyShell.html) を使って、 **Save** をクリックしたときに Groovy スクリプトの構文が有効かどうかをチェックします。 スクリプトが無効な場合、Liferayはエラーメッセージを表示します。

## エクスプレッションビルダー検証の使用

エクスプレッションビルダーには、定義済みのフィールド、演算子、関数が用意されており、要素サイドパネルからアクセスすることができます。 要素をクリックすると、その要素が条件エディタに追加されます。 これらの関数は、ブール値を返します。 提供される演算子と関数の完全なリストについては、 [エクスプレッションビルダー検証のリファレンス](./expression-builder-validations-reference.md) を参照してください。

!!! important
    式ビルダーのバリデーションは、text、numeric、date、boolean フィールドタイプでのみ使用できます。

![Use the side panel to add field, operator, and function elements to your validation.](./adding-field-validations/images/08.png)

LiferayはSaveをクリックしたときに、式が有効な構文かどうかをチェックします。 式が無効な場合、Liferayはエラーメッセージを表示します。

### エクスプレッションビルダーの演算子

この表は、エクスプレッションビルダーの検証で利用できる演算子の一覧です。

| 演算子                              | 説明                    |
| :------------------------------- | :-------------------- |
| そして ( `AND` ) | 依存した関係を表すのに使用される等位接続詞 |
| で割った ( `/` )  | 除算の数学演算子              |
| マイナス ( `-` )  | 除算の数学演算子              |
| または ( `OR` )  | 独立した関連を表すのに使用される等位接続詞 |
| プラス ( `+` )   | 加算の数学演算子              |
| 乗算 ( `*` )    | 乗算の数学演算子              |

### エクスプレッションビルダーの関数

この表は、利用可能なエクスプレッションビルダー関数とその互換性のあるフィールドタイプの一覧です。

| 演算子        | テキストフィールド | 数値フィールド  | 日付フィールド  | 説明                                                  |
| :--------- | :-------- | :------- | :------- | :-------------------------------------------------- |
| 日付を比較      |           |          | &#10004; | 日付フィールドの値が設定された値と同じかどうかを確認します。                      |
| 連結         | &#10004;  |          |          | 複数の文字列またはテキストフィールドを結合し、単一の文字列を返します。                 |
| 条件         | &#10004;  | &#10004; | &#10004; | ユーザー入力が1つ以上の条件を満たすかどうかをチェックし、ブール値を返す。               |
| が以下を含む     | &#10004;  | &#10004; |          | フィールドに指定した値が含まれているかどうかを調べ、ブール値を返します。                |
| 含まない       | &#10004;  | &#10004; |          | フィールドに指定した値が含まれていないかどうかを調べ、ブール値を返します。               |
| 未来の日付      |           |          | &#10004; | 日付フィールドの値が将来かどうかを確認し、ブール値をします。                      |
| URL である    | &#10004;  |          |          | テキストフィールドがURLであるかどうかを確認し、ブール値を返します。                 |
| メールアドレスである | &#10004;  |          |          | テキストフィールドがメールアドレスであるかどうかを確認し、ブール値を返します。             |
| 小数である      |           | &#10004; |          | 数値フィールドが小数であるかどうかを確認し、ブール値を返します。                    |
| が空の場合      | &#10004;  |          |          | テキストフィールドが空であるかどうかを確認し、ブール値を返します。                   |
| が以下と等しい    | &#10004;  | &#10004; |          | フィールドの値が指定した値と等しいかどうかを調べ、ブール値を返します。                 |
| 以上         |           | &#10004; |          | 数値フィールドが特定の数値より大きいかどうかを確認し、ブール値を返します。               |
| 以上もしくは等しい  |           | &#10004; |          | 数値フィールドが特定の数値以上もしくは等しいかどうかを確認し、ブール値を返します。           |
| 整数である      |           | &#10004; |          | 数値フィールドが整数であるかどうかを確認し、ブール値を返します。                    |
| 以下         |           | &#10004; |          | 数値フィールドが特定の数値以下かどうかを確認し、ブール値を返します。                  |
| 以下もしくは等しい  |           | &#10004; |          | 数値フィールドが特定の数値以下もしくは等しいかどうかを確認し、ブール値を返します。           |
| 等しくない      | &#10004;  | &#10004; |          | フィールドの値が指定された値と異なるかどうかを調べ、ブール値を返します。                |
| 一致         | &#10004;  |          |          | テキストフィールドが特定のString値または正規表現と一致するかどうかを確認し、ブール値を返します。 |
| 古い値        | &#10004;  | &#10004; | &#10004; | 指定したフィールドの事前値を取得します。                                |
| 過去の日付      |           |          | &#10004; | 日付フィールドの値が過去かどうかを確認し、ブール値をします。                      |
| 範囲         |           |          | &#10004; | 日付範囲が過去の日付で始まり、未来の日付で終わるかどうかを調べ、ブール値を返す。            |
| 合計         |           | &#10004; |          | 複数の数値フィールドを足し合わせ、単一の数値を返します。                        |

詳細と例については、 [エクスプレッションビルダー検証のリファレンス](./expression-builder-validations-reference.md) を参照してください。

## 利用可能なフィールドのリファレンス

条件を作成する際、オブジェクトのカスタムフィールドやシステムフィールドのいずれかを使用できます。 また、1対多の関連の子側の関連フィールドから選択することも可能です。

以下は、カスタムオブジェクトで利用可能なすべてのデフォルトフィールドです。

| 項目                      | 説明                     |
| :---------------------- | :--------------------- |
| `companyId`             | エントリーが作成されたポータルインスタンス  |
| `createDate`            | エントリーが作成された日時          |
| `currentDate`           | エントリー提出日               |
| `currentUserId`         | エントリーを提出したユーザーのID      |
| `externalReferenceCode` | エントリーの外部参照コード          |
| `groupId`               | エントリーが作成されたサイトID       |
| `lastPublishDate`       | エントリーが最後に公開された日付       |
| `modifiedDate`          | エントリーが最後に更新された日付       |
| `mvccVersion`           | エントリーのMVCCバージョン        |
| `objectDefinitionId`    | エントリーのオブジェクトのID        |
| `objectEntryId`         | エントリーのID               |
| `status`                | エントリーのワークフローステータス      |
| `statusByUserId`        | ワークフローで割り当てられたユーザーのID  |
| `statusByUserName`      | ワークフローで割り当てられたユーザーの名前  |
| `statusDate`            | ワークフローステータスが最後に更新された日付 |
| `userId`                | エントリー作成者のID            |
| `userName`              | エントリー作成者のユーザー名         |
| `uuid`                  | エントリーの重複しないユニバーサルID    |

システムオブジェクトは、上記の表と重複する部分もありますが、独自のデフォルトフィールドを持っています。

## 関連トピック

* [オブジェクトの作成](../creating-objects.md)
* [オブジェクトへのフィールドの追加](../fields/adding-fields-to-objects.md)
* [式ビルダー検証リファレンス](./expression-builder-validations-reference.md)
