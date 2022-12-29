# フォームフラグメントの作成

{bdg-secondary}`利用可能な Liferay 7.4 U45+/GA45+`

[Form Components の断片](../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md) は、コンテンツページでオブジェクトのフォームを構築するためのものです。 もしLiferayのフォームフラグメントがあなたのユースケースを満たさない場合、フォームに望ましいデザインと機能を実現するために自分で作成しましょう。

フォームフラグメントを作成するため。

1. *サイトメニュー* ( ![Site Menu](../../../images/icon-product-menu.png) ) を開き、 *デザイン*を展開し、 *フラグメント*へと進んでください。

1. *Plus* (![Plus Button](../../../images/icon-plus.png)) をクリックすると、フォームフラグメントを整理するためのフラグメ ントセットが作成されます。

1. *追加* (![Add Button](../../../images/icon-add.png)) をクリックし、 *Form Fragment* タイプを選択し、 *Next*をクリックします。

   ![Form Fragmentの種類を選択し、Nextをクリックします。](./creating-form-fragments/images/01.png)

1. 名前を入力します。

1. フラグメントで許可するフィールドの種類を選択します。

   CAPTCHAを選択した場合、他のフィールドタイプは選択できません。 それ以外の場合は、任意のフィールドの組み合わせを選択することができます。

   ![フラグメントがサポートするフィールドタイプを選択します。](./creating-form-fragments/images/02.png)

1. *［追加］*をクリックします。 これにより、フラグメントのドラフトが作成され、フラグメントの編集ページに移動します。

1. コード] タブで、フラグメントの HTML、CSS、JavaScript を追加します。

   ![コード] タブで、フラグメントの HTML、CSS、JavaScript を追加します。](./creating-form-fragments/images/03.png)

1. (オプション) Configuration タブで、JSON を使用してフラグメントを構成し、それにオプションを追加します。

   ![Configuration タブで、JSON を使用してフラグメントを設定し、オプションを追加します。](./creating-form-fragments/images/04.png)

1. *［公開］*をクリックします。

次に、フォームフラグメントを使用して、コンテンツページにフォームを作成します。 詳しくは、 [フラグメントを使ってフォームを構築する](../../../building-applications/objects/using-fragments-to-build-forms.md) をご覧ください。

Fragments Toolkit を使用する場合、 `yarn run add-fragment`を実行する際にフラグメントの種類を選択することができます。

![フラグメントツールキットを使用する場合は、フラグメントの種類を選択します。](./creating-form-fragments/images/05.png)

サポートするフィールドタイプを指定するには、 `fragment.json` の `typeOptions` に `fieldTypes` プロパティを追加します。フィールドの種類を配列で入力します。

```json
{
   "cacheable": false,
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

その後は、基本フラグメントを作成するときと同じ手順で行います。 基本的なフラグメントの作成と配置の詳細については、 [フラグメントツールキットの使用](./using-the-fragments-toolkit.md) を参照してください。

## `input` Variable を Form Fragment で使用する。

フォームフラグメントには、各フラグメントのJavaScriptとFreeMarkerのコードで使用するために、 `input` という変数が含まれています。 この変数には、フラグメントを設定するためのプロパティが格納される。

## 入力変数のプロパティ参照

| プロパティ          | 種類        | 説明                                         |
|:-------------- |:--------- |:------------------------------------------ |
| `type`         | `string`  | 入力にマッピングされたフィールドタイプ。                       |
| `name`         | `string`  | 入力の名前                                      |
| `required`     | `boolean` | 入力が必要であるかどうか。                              |
| `value`        | `string`  | フィールドの値です。                                 |
| `label`        | `string`  | 入力のラベルです。                                  |
| `showLabel`    | `boolean` | ラベルがユーザーから見えるかどうか。                         |
| `errorMessage` | `string`  | フォーム送信エラー。                                 |
| `helpText`     | `string`  | フォームフィールドのUIヘルプメッセージ。 未定義の場合、このプロパティは空である。 |
| `showHelpText` | `boolean` | ヘルプテキストをユーザーに表示するかどうか。                     |
| `attributes`   | `object`  | 特定の入力タイプ用にフラグメントに追加されるオプション。               |

### `ファイル` の属性 入力

| プロパティ                          | タイプ                     | 説明                                                                                                                                                    |
|:------------------------------ |:----------------------- |:----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `allowedFileExtensions`        | `string`                | 許可されたファイル拡張子。 Show Supported File Info」を有効にすると、許可された拡張子がフィールドのヘルプテキストに表示されます。                                                                         |
| `maxFileSize`                  | `number`                | 最大アップロードサイズ（単位：メガバイト）。 サポートされているファイル情報を表示する」を有効にすると、フィールドのヘルプテキストに最大許容サイズが表示されます。                                                                     |
| `selectFromDocumentLibrary`    | `boolean`               | ユーザーがドキュメントライブラリからファイルを選択できるかどうか。 これは、オブジェクトの [添付ファイルフィールド](../../../building-applications/objects/creating-and-managing-objects/fields.md)に設定されています。 |
| `selectFromDocumentLibraryURL` | `string` or `undefined` | `selectFromDocumentLibrary` が真の場合、このプロパティは、対応する `ItemSelector`をレンダリングするための URL を含んでいる。                                                                |

### `番号の属性` 入力

| プロパティ      | タイプ                     | 説明                                     |
|:---------- |:----------------------- |:-------------------------------------- |
| `dataType` | `integer` or `decimal`  | 整数と10進数のどちらを許可するか。                     |
| `max`      | `number` or `undefined` | 最大許容数。                                 |
| `min`      | `number` or `undefined` | 最低限許可される数                              |
| `step`     | `string` or `undefined` | HTML入力の "step "属性で使用可能な、最大許容精度を示す文字列値。 |

### `の関係` の属性 入力

| プロパティ                        | 種類       | 説明                                                                                                     |
|:---------------------------- |:-------- |:------------------------------------------------------------------------------------------------------ |
| `relationshipLabelFieldName` | `string` | ラベルとして使用される関連オブジェクトのフィールド名。                                                                            |
| `relationshipValueFieldName` | `string` | 値として使用される関連オブジェクトのフィールド名。                                                                              |
| `relationshipURL`            | `string` | APIからオプションを取得するために使用するURL。 APIレスポンスはLiferayのヘッドレスリスト形式を使用し、ページネーションも含みます。 レスポンスを問い合わせるための追加パラメータを渡します。 |

### Attributes for `select` Input

| プロパティ     | 種類                                            | 説明               |
|:--------- |:--------------------------------------------- |:---------------- |
| `options` | `Array<{label: string, value: string}>` | 利用可能なオプションの一覧です。 |

## 追加情報

* [ページフラグメントの開発](../developing-page-fragments.md)
* [フラグメントを使ったフォームの構築](../../../building-applications/objects/using-fragments-to-build-forms.md)
