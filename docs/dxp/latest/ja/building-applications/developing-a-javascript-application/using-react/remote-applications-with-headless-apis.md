# Headless APIによるリモートアプリケーション

{bdg-secondary}`7.4+で利用可能`

[オブジェクトを作成・公開すると](../../objects/creating-and-managing-objects/creating-objects.md) 、Headless REST APIが自動的に生成されます。 ここでは、これらのエンドポイントを統合して、シンプルなCRUD（作成、読み取り、更新、削除）リモートアプリケーションを作成する方法について説明します。

## Liferay DXPのセットアップ

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順に従って、`/o/c/*` URLパターンを **Default Portal CORS Configuration** に追加してください：

1. **グローバルメニュー**(![グローバルメニュー](../../../images/icon-applications-menu.png))を開き、 ［**コントロールパネル**］ タブをクリックして、 ［**システム設定**］ &rarr; ［**セキュリティツール**］ に移動します。

1. ［**Portal Cross-Origin Resource Sharing (CORS**)］ タブで、 ［**Default Portal CORS Configuration**］ をクリックしてください。

1. ［**URL Pattern**］**に`/o/c/** `の値を追加し、［**保存**］をクリックします。 これにより、すべてのオブジェクトAPI に対してCORSが有効になります。

   ![Add the /o/c/* URL Pattern for Object APIs.](./remote-applications-with-headless-apis/images/01.png)

## CRUDアプリケーション用オブジェクトの作成

1. **グローバルメニュー**(![グローバルメニュー](../../../images/icon-applications-menu.png))を開き、 ［**コントロールパネル**］**タブをクリックして、**［**オブジェクト**］ に移動します。

1. **追加** ボタン(![追加ボタン](../../../images/icon-add.png))をクリックし、以下の値を入力する：

   | 項目      | 値           |
   | :------ | :---------- |
   | ラベル     | J4X7-オブジェクト |
   | 複数形のラベル | J4X7-オブジェクト |
   | 名前      | J4X7オブジェクト  |

   ```{note}
   提供されたReactアプリケーションは、これらの値を使用する。
   ```

1. 新しい **オブジェクト** ドラフトを選択し、 **フィールド** タブをクリックし、以下の **フィールド** を追加する：

   | ラベル | 項目名 | 種類       |
   | :-- | :-- | :------- |
   | 名前  | 名前  | テキストボックス |
   | 説明  | 説明  | テキストボックス |

1. **Details** タブをクリックし、 **Publish** をクリックします。

## CRUDアプリケーションのセットアップ

1. [CRUDアプリケーション](./liferay-j4x7.zip) をダウンロードし、解凍してください。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/developing-a-javascript-application/using-react/liferay-j4x7.zip -O
   ```

   ```bash
   unzip liferay-j4x7.zip
   ```

   ```bash
   cd liferay-j4x7
   ```

1. `node`と`yarn`がインストールされていることを確認する。 そうでない場合は、以下のコマンドを実行し、プロンプトに従います。

   ```bash
   ./setup_tutorial.sh
   ```

1. CRUDアプリケーションのフォルダに移動し、Reactサーバーを起動します。

   ```bash
   cd j4x7-custom-element
   ```

   ```bash
   yarn start
   ```

   起動したら、`localhost:3000`にアクセスしてCRUDアプリケーションを表示する。

1. 名前と説明を入力し、 **Add** をクリックしてJ4X7オブジェクトを追加します。 新しい項目が追加されました。

   ![Input a name and description and click Add.](./remote-applications-with-headless-apis/images/02.png)

1. 先ほど作成したJ4X7オブジェクトのID番号をメモしておいてください。 ID番号と新しい名前および説明を入力します。 **Patch** をクリックする。 項目は新しい名前と説明で更新されました。

1. ID番号を入力し、 **削除** をクリックします。 項目が削除されました。

## コードを調べる

サンプルのCRUDアプリケーションは、APIリクエストを含むファイルと、CRUD操作を処理するフォームを含むファイルの2つに分かれています。

### リクエストの処理

`Requests.js`ファイルはJavaScriptの組み込みの `fetch()` メソッドを使う。

`getObjects()`はすべてのオブジェクトに対してGETリクエストを行う。

```{literalinclude} ./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/utils/Requests.js
:language: javascript
:lines: 25-33
```

`addObject()` は、新しいオブジェクトの名前と説明を POST リクエストに渡します。

```{literalinclude} ./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/utils/Requests.js
:language: javascript
:lines: 1-13
```

`patchObject()`は、特定のオブジェクトIDと新しい名前と説明でPATCHリクエストを行う。

```{literalinclude} ./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/utils/Requests.js
:language: javascript
:lines: 35-47
```

`deleteObject()`は、特定のオブジェクトIDでDELETEリクエストを行う。

```{literalinclude} ./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/utils/Requests.js
:language: javascript
:lines: 15-23
```

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth 2.0](../../../headless-delivery/using-oauth2.md) を介してユーザーを認証する必要があります。 OAuth2 を使用する React アプリケーションのサンプルについては、 [OAuth2によるユーザーの認証](../../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) を参照してください。
```

### フォームの実装

[`GetForm.js`](./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/components/GetForm.js) `getObjects` メソッドを呼び出し、レスポンスを JSON として解析する。 J4X7の各エントリーは、フォームごとに一覧表示されます。

[`AddForm.js`](./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/components/AddForm.js) は入力を受け取り、ユーザーが **Add** をクリックすると `addObject` メソッドを呼び出す。

[`PatchForm.js`](./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/components/PatchForm.js) 入力を受け取り、ユーザーが **Patch** をクリックすると、`patchObject`メソッドを呼び出す。

[`DeleteForm.js`](./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/components/DeleteForm.js) は入力を受け取り、ユーザーが **Delete** をクリックすると `deleteObject` メソッドを呼び出す。

フォームは [`App.js`](./remote-apps-with-headless-apis/resources/liferay-j4x7-overlay/src/App.js) ファイルにまとめられ、1つのページに表示される。

## 関連トピック

[基本的なカスタム要素の作成](../../client-extensions/frontend-client-extensions/tutorials/creating-a-basic-custom-element.md)
[ヘッドレスフレームワークの統合](../../objects/understanding-object-integrations/using-custom-object-apis.md)
