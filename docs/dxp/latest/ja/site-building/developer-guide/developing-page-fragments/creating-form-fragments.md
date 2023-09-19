# フォーム・フラグメントの作成

{bdg-secondary}`Liferay 7.4 U45+/GA45+で利用可能`

[フォームコンポーネントの断片](../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md) は、コンテンツページでオブジェクトのフォームを構築するためのものです。 Liferayのフォームフラグメントがあなたのユースケースを満たさない場合は、フォームに必要なデザインと機能を実現するために独自のフォームフラグメントを作成してください。

フォームの断片を作る

1. *Site Menu* ( ![Site Menu](../../../../images/icon-product-menu.png) ) を開き、 *Design* &rarr; *Fragments*へ。

1. *Plus* ( ![Plus Button](../../../images/icon-plus.png) ) をクリックして、フォームのフラグメントを整理するためのフラグメントセットを作成します。

1. *Add* ( ![Add Button](../../../images/icon-add.png) ) をクリックし、 *Form Fragment* タイプを選択し、 *Next*をクリックする。

   ![フォームフラグメントタイプを選択し、Nextをクリックします。](./creating-form-fragments/images/01.png)

1. 名前を入力します。

1. フラグメントで許可するフィールドタイプを選択します。

   CAPTCHAを選択した場合、他のフィールドタイプを選択することはできません。 それ以外の場合は、どのフィールドの組み合わせでも選択できる。

   ![フラグメントがサポートするフィールドタイプを選択する。](./creating-form-fragments/images/02.png)

1. *［追加］*をクリックします。 これにより、ドラフトフラグメントが作成され、フラグメントの編集ページに移動します。

1. コードタブで、フラグメントのHTML、CSS、JavaScriptを追加します。

   ![コードタブで、フラグメントのHTML、CSS、JavaScriptを追加します。](./creating-form-fragments/images/03.png)

1. (オプション）Configuration タブで、JSON を使用してフラグメントを構成し、オプションを追加します。 さまざまなフラグメント・コンフィギュレーション・タイプの詳細については、 [Fragment Configuration Types Reference](../reference/fragments/fragment-configuration-types-reference.md)。

   ![コンフィギュレーションタブで、JSONを使用してフラグメントをコンフィギュレーションし、オプションを追加します。](./creating-form-fragments/images/04.png)

1. *［Publish］*をクリックします。

次に、フォーム・フラグメントを使ってコンテンツ・ページにフォームを作成します。 詳しくは [Using Fragments to Build Forms](../../../building-applications/objects/using-fragments-to-build-forms.md) を参照してください。

フラグメントツールキットを使用している場合は、 `yarn run add-fragment`を実行する際にフラグメントの種類を選択できます。

![フラグメントツールキットを使用する場合は、フラグメントタイプを選択します。](./creating-form-fragments/images/05.png)

サポートされるフィールドタイプを指定するには、 `fragment.json`の `typeOptions` に `fieldTypes` プロパティを追加する。 フィールド・タイプを配列として入力する：

```json
{
   "fragmentEntryKey": "numeric-input",
   "icon": "number",
   "type": "input",
   "typeOptions": {
      "fieldTypes": [
         "number",
         "text"
      ]
   }
}
```

その後は、基本的なフラグメントを作成するときと同じプロセスを踏む。 基本的なフラグメントの作成とデプロイについては、 [Using Fragments Toolkit](./using-the-fragments-toolkit.md) を参照してください。

## サポートされるフィールド・タイプ リファレンス

| 項目タイプ          | 説明                                |
|:-------------- |:--------------------------------- |
| `boolean`      | ブール値フィールド。                        |
| `captcha`      | ユーザーは、投稿前に自分が人間であることを確認する必要があります。 |
| `date`         | 日付フィールド。                          |
| `file`         | ファイル添付のサポートを追加。                   |
| `html`         | リッチテキストを追加するためのCKEditorを追加します。    |
| `multiselect`  | チェックボックスのリストから選択する。               |
| `number`       | 数値フィールド。                          |
| `relationship` | オブジェクトの関係を定義する。                   |
| `select`       | ドロップダウンリストからオプションを選択します。          |
| `text`         | テキストフィールドのサポートを追加。                |

## フォームフラグメントで `input` 変数を使う

フォームフラグメントには、各フラグメントのJavaScriptとFreeMarkerコードで使用する `input` 変数が含まれています。 この変数には、フラグメントを設定するためのプロパティが格納される。

## 入力変数のプロパティのリファレンス

| プロパティ          | 種類        | 説明                                         |
|:-------------- |:--------- |:------------------------------------------ |
| `fieldTypes`   | `string`  | 入力にマッピングされたフィールドタイプ。                       |
| `name`         | `string`  | 入力の名前                                      |
| `required`     | `boolean` | 入力が必要かどうか。                                 |
| `value`        | `string`  | フィールドの値。                                   |
| `label`        | `string`  | 入力のラベル                                     |
| `showLabel`    | `boolean` | ラベルの視認性。                                   |
| `errorMessage` | `string`  | フォーム送信エラー。                                 |
| `helpText`     | `string`  | フォームフィールドのUIヘルプメッセージ。 未定義の場合、このプロパティは空である。 |
| `showHelpText` | `boolean` | ヘルプテキストの表示。                                |
| `attributes`   | `object`  | 特定の入力タイプのためにフラグメントに追加されるオプション。             |

### `ファイルの属性` 入力

| プロパティ                          | 種類                      | 説明                                                                                                                                            |
|:------------------------------ |:----------------------- |:--------------------------------------------------------------------------------------------------------------------------------------------- |
| `allowedFileExtensions`        | `string`                | 許可されるファイル拡張子。 Show Supported File Info（サポートされているファイル情報を表示）を有効にすると、フィールドのヘルプテキストに許可されている拡張子が表示されます。                                            |
| `maxFileSize`                  | `number`                | 最大アップロードサイズ（メガバイト）。 Show Supported File Info（サポートされているファイル情報を表示する）を有効にすると、フィールドのヘルプテキストに最大許容サイズが表示されます。                                       |
| `selectFromDocumentLibrary`    | `boolean`               | ユーザーがドキュメントライブラリからファイルを選択できるかどうか。 これはオブジェクトの [添付フィールド](../../../building-applications/objects/creating-and-managing-objects/fields.md)で設定される。 |
| `selectFromDocumentLibraryURL` | `string` or `undefined` | `selectFromDocumentLibrary` が真の場合、このプロパティは、対応する `ItemSelector`をレンダリングするための URL を含む。                                                           |

### `番号の属性` 入力

| プロパティ      | 種類                      | 説明                                         |
|:---------- |:----------------------- |:------------------------------------------ |
| `dataType` | `integer` or `decimal`  | 整数か10進数を選ぶ。                                |
| `max`      | `number` or `undefined` | 最大許容数。                                     |
| `min`      | `number` or `undefined` | 最少催行人数。                                    |
| `step`     | `string` or `undefined` | HTML入力の "step "属性で使用できる文字列値で、許容される最大精度を示す。 |

### `関係の属性` 入力

| プロパティ                        | 種類       | 説明                                                                                                  |
|:---------------------------- |:-------- |:--------------------------------------------------------------------------------------------------- |
| `relationshipLabelFieldName` | `string` | ラベルとして使用される関連オブジェクトのフィールド名。                                                                         |
| `relationshipValueFieldName` | `string` | 値として使用される関連オブジェクトのフィールド名。                                                                           |
| `relationshipURL`            | `string` | APIからオプションを取得するためのURL。 APIレスポンスはページネーションを含むLiferayのヘッドレスリストフォーマットを使用します。 追加のパラメータを渡して、レスポンスを問い合わせる。 |

### `セレクト用属性` 入力

| プロパティ     | 種類                                            | 説明              |
|:--------- |:--------------------------------------------- |:--------------- |
| `options` | `Array<{label: string, value: string}>` | 利用可能なオプションのリスト。 |

## 関連トピック

* [ページフラグメントの開発](../developing-page-fragments.md)
* [フラグメントでフォームを構築する](../../../building-applications/objects/using-fragments-to-build-forms.md)
