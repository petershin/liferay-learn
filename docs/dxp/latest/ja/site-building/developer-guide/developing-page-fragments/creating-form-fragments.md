# フォームフラグメントを作成する

{bdg-secondary}`Liferay 7.4 U45+/GA45+で利用可能`

[フォームコンポーネントの断片](../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md) は、コンテンツページでオブジェクトのフォームを構築するためのものです。 Liferayのフォームフラグメントがユースケースを満たさない場合、フォームに必要なデザインと機能を実現するために独自のフォームを作成します。

フォームフラグメントを作成すること、

1. **サイトメニュー**( ![Site Menu](../../../images/icon-product-menu.png) ) を開き、 **デザイン** を展開し、 **フラグメント** へと進みます。

1. **プラス**(![Plus Button](../../../images/icon-plus.png)) をクリックすると、フォームフラグメントを整理するためのフラグメ ントセットが作成されます。

1. **追加**(![Add Button](../../../images/icon-add.png)) をクリックし、 **フォームフラグメント** タイプを選択し、 **次へ** をクリックします。

   ![フォームフラグメントの種類を選択し、［次へ］をクリックします。](./creating-form-fragments/images/01.png)

1. 名前を入力します。

1. フラグメントで許可するフィールドの種類を選択します。

   CAPTCHAを選択した場合、他のフィールドタイプは選択できません。 それ以外の場合は、フィールドを自由に組み合わせて選択することができます。

   ![フラグメントがサポートするフィールドタイプを選択します。](./creating-form-fragments/images/02.png)

1. ［**追加**］ をクリックします。 これにより、ドラフトフラグメントが作成され、フラグメント編集ページに誘導されます。

1. コードタブで、フラグメントのHTML、CSS、JavaScriptを追加します。

   ![コードタブで、フラグメントのHTML、CSS、JavaScriptを追加します。](./creating-form-fragments/images/03.png)

1. (オプション）「構成」タブで、JSONを使用してフラグメントを構成し、オプションを追加します。

   ![Configurationタブで、JSONを使ってフラグメントを構成し、オプションを追加する](./creating-form-fragments/images/04.png)

1. ［**Publish**］ をクリックします。

次に、フォームフラグメントを使用して、コンテンツページ内にフォームを構築します。 詳しくは [フラグメントを使ってフォームを作る](../../../building-applications/objects/using-fragments-to-build-forms.md) をご覧ください。

Fragments Toolkit を使用する場合は、 `yarn run add-fragment`を実行する際に、フラグメントの種類を選択することができます。

![Fragments Toolkitを使用する場合は、フラグメントタイプを選択します。](./creating-form-fragments/images/05.png)

対応するフィールドタイプを指定するには、 `fragment.json` の `typeOptions` プロパティに `fieldTypes`を追加します。 フィールドの種類を配列で入力します：

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

その後は、基本フラグメントを作成するときと同じ手順で作成します。 基本的なフラグメントの作成と展開については、 [Fragments Toolkitの使用](./using-the-fragments-toolkit.md) を参照してください。

## サポートされるフィールドタイプ リファレンス

| 項目タイプ          | 説明                                  |
|:-------------- |:----------------------------------- |
| `boolean`      | ブール値フィールド。                          |
| `captcha`      | ユーザーは、投稿する前に自分が人間であることを確認する必要があります。 |
| `date`         | 日付欄です。                              |
| `file`         | ファイルの添付をサポートするようになりました。             |
| `html`         | リッチテキストを追加するためのCKEditorを追加します。      |
| `multiselect`  | チェックボックスの一覧から選択します。                 |
| `number`       | 数値のフィールド。                           |
| `relationship` | オブジェクトの関係を定義する。                     |
| `select`       | ドロップダウン・リストからオプションを選択します。           |
| `text`         | テキストフィールドのサポートを追加しました。              |

## フォームフラグメントで `入力` 変数を使う

フォームフラグメントには、各フラグメントのJavaScriptとFreeMarkerのコードで使用するための変数 `input`。 この変数には、フラグメントを構成するためのプロパティが格納される。

## 入力変数のプロパティの参照

| プロパティ          | 種類        | 説明                                         |
|:-------------- |:--------- |:------------------------------------------ |
| `fieldTypes`   | `string`  | 入力にマッピングされたフィールドタイプ。                       |
| `name`         | `string`  | 入力の名前です。                                   |
| `required`     | `boolean` | 入力が必要なのかどうか。                               |
| `value`        | `string`  | フィールドの値です。                                 |
| `label`        | `string`  | 入力のラベルです。                                  |
| `showLabel`    | `boolean` | ラベルの視認性。                                   |
| `errorMessage` | `string`  | フォーム送信エラー。                                 |
| `helpText`     | `string`  | フォームフィールドのUIヘルプメッセージ。 未定義の場合、このプロパティは空である。 |
| `showHelpText` | `boolean` | ヘルプテキストの視認性。                               |
| `attributes`   | `object`  | 特定の入力タイプのためにフラグメントに追加されるオプション。             |

### `ファイル` の属性 入力

| プロパティ                          | 種類                      | 説明                                                                                                                                                    |
|:------------------------------ |:----------------------- |:----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `allowedFileExtensions`        | `string`                | 許可されたファイル拡張子。 Show Supported File Infoが有効な場合、フィールドのヘルプテキストに許可された拡張子が表示されます。                                                                           |
| `maxFileSize`                  | `number`                | 最大アップロードサイズ（メガバイト単位）。 Show Supported File Infoが有効な場合、フィールドのヘルプテキストに最大許容サイズが表示されます。                                                                    |
| `selectFromDocumentLibrary`    | `boolean`               | ユーザーがドキュメントライブラリからファイルを選択できるかどうか。 これは、オブジェクトの [添付ファイルフィールド](../../../building-applications/objects/creating-and-managing-objects/fields.md)に設定されています。 |
| `selectFromDocumentLibraryURL` | `string` or `undefined` | `selectFromDocumentLibrary` が true の場合、このプロパティは対応する `ItemSelector`のレンダリング用 URL を含む。                                                                   |

### `番号` 入力に関する属性

| プロパティ      | 種類                      | 説明                                     |
|:---------- |:----------------------- |:-------------------------------------- |
| `dataType` | `integer` or `decimal`  | 整数または10進数を選択します。                       |
| `max`      | `number` or `undefined` | 最大許容数です。                               |
| `min`      | `number` or `undefined` | 最低限許される数。                              |
| `step`     | `string` or `undefined` | HTML入力の "step "属性で使用可能な、最大許容精度を示す文字列値。 |

### `の関係` の属性 入力

| プロパティ                        | 種類       | 説明                                                                                                             |
|:---------------------------- |:-------- |:-------------------------------------------------------------------------------------------------------------- |
| `relationshipLabelFieldName` | `string` | ラベルとして使用される関連オブジェクトのフィールド名。                                                                                    |
| `relationshipValueFieldName` | `string` | 値として使用される関連オブジェクトのフィールド名。                                                                                      |
| `relationshipURL`            | `string` | APIからオプションをフェッチするために使用されるURL。 APIレスポンスは、ページネーションを含むLiferayのヘッドレスリストフォーマットを使用します。 レスポンスを問い合わせるための追加パラメーターを渡します。 |

### `select` 入力時の属性について

| プロパティ     | 種類                                            | 説明               |
|:--------- |:--------------------------------------------- |:---------------- |
| `options` | `Array<{label: string, value: string}>` | 使用可能なオプションの一覧です。 |

## 追加情報

* [ページフラグメントの開発](../developing-page-fragments.md)
* [フラグメントを使用してフォームを構築する](../../../building-applications/objects/using-fragments-to-build-forms.md)
