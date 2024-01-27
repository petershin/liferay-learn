# フォーム・フラグメントの作成

{bdg-secondary}`liferay 7.4 U45+/GA45+`.

[フォームコンポーネントの断片](../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md) は、コンテンツページでオブジェクトのフォームを構築するためのものです。 Liferayのフォームフラグメントがあなたのユースケースを満たさない場合は、フォームに必要なデザインと機能を実現するために独自のフォームフラグメントを作成してください。

フォームの断片を作る

1. サイトメニュー(![サイトメニュー](../../../images/icon-product-menu.png))を開き、_デザイン_ &rarr; _フラグメント_に移動します。

1. *プラス* (![プラスボタン](../../../images/icon-plus.png))をクリックして、フォームのフラグメントを整理するためのフラグメントセットを作成します。

1. *Add* (![Add Button](../../../images/icon-add.png)) をクリックし、_Form Fragment_ タイプを選択し、_Next_ をクリックします。

   ![Select the form fragment type and click Next.](./creating-form-fragments/images/01.png)

1. 名前を入力します。

1. フラグメントで許可するフィールドタイプを選択します。

   CAPTCHAを選択した場合、他のフィールドタイプを選択することはできません。 それ以外の場合は、どのフィールドの組み合わせでも選択できる。

   ![Select the field types the fragment supports.](./creating-form-fragments/images/02.png)

1. *追加*をクリックする。 これにより、ドラフトフラグメントが作成され、フラグメントの編集ページに移動します。

1. コードタブで、フラグメントのHTML、CSS、JavaScriptを追加します。

   ![In the Code tab, add HTML, CSS, and JavaScript for your fragment.](./creating-form-fragments/images/03.png)

   ```{note}
   サブミットボタンのテキストは、 [マッピング設定](../../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#mapping-settings) を使ってマッピングできます。

   リダイレクトのために [リンク設定](../../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#link-settings) を持つボタンを作成するには、`type="button"` をボタンの断片に追加します。
   ```

1. (オプション）Configuration タブで、JSON を使用してフラグメントを構成し、オプションを追加します。 さまざまなフラグメント・コンフィギュレーション・タイプの詳細については、 [Fragment Configuration Types Reference](../reference/fragments/fragment-configuration-types-reference.md) 。

   ![In the Configuration tab, use JSON to configure the fragment and add options to it](./creating-form-fragments/images/04.png)

1. *［公開］*をクリックします。

次に、フォーム・フラグメントを使ってコンテンツ・ページにフォームを作成します。 詳しくは [Using Fragments to Build Forms](../../../building-applications/objects/using-fragments-to-build-forms.md) を参照してください。

フラグメントツールキットを使用する場合は、`yarn run add-fragment`を実行する際にフラグメントの種類を選択することができる。

![Select the fragment type when using the Fragments Toolkit.](./creating-form-fragments/images/05.png)

サポートするフィールドタイプを指定するには、`fragment.json` の `typeOptions` に `fieldTypes` プロパティを追加する。 フィールド・タイプを配列として入力する：

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
| :------------- | :-------------------------------- |
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

## フォーム・フラグメントで `input` 変数を使う

フォームフラグメントには `input` 変数が含まれており、各フラグメントの JavaScript と FreeMarker のコードで使用します。 この変数には、フラグメントを設定するためのプロパティが格納される。

## 入力変数のプロパティのリファレンス

| プロパティ          | 種類        | 説明                                            |
| :------------- | :-------- | :-------------------------------------------- |
| `fieldTypes`   | `string`  | 入力にマッピングされたフィールドタイプ。                          |
| `name`         | `string`  | 入力の名前 フラグメントを作成するには、ユーザーはこのプロパティを定義しなければならない。 |
| `required`     | `boolean` | 入力が必要かどうか。                                    |
| `value`        | `string`  | フィールドの値。                                      |
| `label`        | `string`  | 入力のラベル                                        |
| `showLabel`    | `boolean` | ラベルの視認性。                                      |
| `errorMessage` | `string`  | フォーム送信エラー。                                    |
| `helpText`     | `string`  | フォームフィールドのUIヘルプメッセージ。 未定義の場合、このプロパティは空である。    |
| `showHelpText` | `boolean` | ヘルプテキストの表示。                                   |
| `attributes`   | `object`  | 特定の入力タイプのためにフラグメントに追加されるオプション。                |

### 入力 `file` の属性

| プロパティ                          | 種類                      | 説明                                                                                                                                                       |
| :----------------------------- | :---------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `allowedFileExtensions`        | `string`                | 許可されるファイル拡張子。 Show Supported File Info（サポートされているファイル情報を表示）を有効にすると、フィールドのヘルプテキストに許可されている拡張子が表示されます。                                                       |
| `maxFileSize`                  | `number`                | 最大アップロードサイズ（メガバイト）。 Show Supported File Info（サポートされているファイル情報を表示する）を有効にすると、フィールドのヘルプテキストに最大許容サイズが表示されます。                                                  |
| `selectFromDocumentLibrary`    | `boolean`               | ユーザーがドキュメントライブラリからファイルを選択できるかどうか。 これはオブジェクトの [添付フィールド](../../../building-applications/objects/creating-and-managing-objects/fields.md) で設定される。 |
| `selectFromDocumentLibraryURL` | `string` or `undefined` | `selectFromDocumentLibrary`が true の場合、このプロパティには対応する`ItemSelector` をレンダリングするための URL が格納される。                                                               |

### 入力 `number` の属性

| プロパティ      | 種類                      | 説明                                         |
| :--------- | :---------------------- | :----------------------------------------- |
| `dataType` | `integer` or `decimal`  | 整数か10進数を選ぶ。                                |
| `max`      | `number` or `undefined` | 最大許容数。                                     |
| `min`      | `number` or `undefined` | 最少催行人数。                                    |
| `step`     | `string` or `undefined` | HTML入力の "step "属性で使用できる文字列値で、許容される最大精度を示す。 |

### 入力 `number` の属性

| プロパティ                        | 種類       | 説明                                                                                                  |
| :--------------------------- | :------- | :-------------------------------------------------------------------------------------------------- |
| `relationshipLabelFieldName` | `string` | ラベルとして使用される関連オブジェクトのフィールド名。                                                                         |
| `relationshipValueFieldName` | `string` | 値として使用される関連オブジェクトのフィールド名。                                                                           |
| `relationshipURL`            | `string` | APIからオプションを取得するためのURL。 APIレスポンスはページネーションを含むLiferayのヘッドレスリストフォーマットを使用します。 追加のパラメータを渡して、レスポンスを問い合わせる。 |

### 入力 `select` の属性

| プロパティ     | 種類                                      | 説明              |
| :-------- | :-------------------------------------- | :-------------- |
| `options` | `Array<{label: string, value: string}>` | 利用可能なオプションのリスト。 |

## 関連トピック

[ページ・フラグメントの開発](../developing-page-fragments.md)

[フラグメントを使ってフォームを構築する](../../../building-applications/objects/using-fragments-to-build-forms.md)
