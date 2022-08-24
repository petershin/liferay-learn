# Headless APIによるリモートアプリケーション

{bdg-secondary}`7.4以降で利用可能`

[オブジェクトを作成・公開すると](../objects/creating-and-managing-objects/creating-objects.md)、Headless REST APIが自動的に生成されます。 ここでは、これらのエンドポイントを統合して、シンプルなCRUD（作成、読み取り、更新、削除）リモートアプリケーションを作成する方法について説明します。

## Liferay DXPのセットアップ
```{include} /_snippets/run-liferay-dxp.md
```

Then, follow these steps to add the `/o/c/*` URL pattern to the **Default Portal CORS Configuration** :

1. Open the **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png)), click the **Control Panel** tab, and go to **System Settings** &rarr; **Security Tools** .

1. Go to the **Portal Cross-Origin Resource Sharing (CORS**) tab and click **Default Portal CORS Configuration** .

1. Add a **URL Pattern** with the `/o/c/*` value and click **Save** . This enables CORS for all Object APIs.

   ![Add the /o/c/* URL Pattern for Object APIs.](./remote-apps-with-headless-apis/images/01.png)

## Creating an Object for the CRUD app

1. Open the **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png)), click the **Control Panel** tab, and go to **Objects** .

1. Click the **Add** button (![Add Button](../../../images/icon-add.png)) and enter these values:

   | Field | Value |
   | :--- | :--- |
   | Label | J4X7-Object |
   | Plural Label | J4X7-Objects |
   | Name | J4X7Object |

   ```{note}
   The provided React app uses these values.
   ```

1. 新しい **オブジェクト** ドラフトを選択し、 ［**フィールド**］ タブをクリックして、これらの **フィールド** を追加します。

   | ラベル | 項目名 | 種類   |
   |:--- |:--- |:---- |
   | 名前  | 名前  | テキスト |
   | 説明  | 説明  | テキスト |

1. ［**詳細**］ タブをクリックし、 ［**公開**］ をクリックします。

## CRUDアプリをセットアップする

1. [CRUDアプリ](./liferay-j4x7.zip) をダウンロードし、解凍してください。

   ```bash
   curl https://learn.liferay.com/dxp/latest/ja/building-applications/remote-apps/remote-apps-tutorials/liferay-j4x7.zip -O
   ```

   ```bash
   unzip liferay-j4x7.zip
   ```

   ```bash
   cd liferay-j4x7
   ```

1. `node>と`yarn`がインストールされていることを確認します。 そうでない場合は、以下のコマンドを実行し、プロンプトに従います。

   ```bash
   ./setup_tutorial.sh
   ```

1. CRUDアプリケーションのフォルダに移動し、Reactサーバーを起動します。

   ```bash
   cd j4x7-remote-app
   ```

   ```bash
   yarn start
   ```

   起動したら、`localhost:3000`にアクセスし、CRUDアプリを表示します。

1. 名前と説明を入力し、 **追加** をクリックして、J4X7オブジェクトを追加します。 新しい項目が追加されました。

   ![名前と説明を入力して、追加をクリックします。](./remote-apps-with-headless-apis/images/02.png)

1. 先ほど作成したJ4X7オブジェクトのID番号をメモしておいてください。 ID番号と新しい名前および説明を入力します。 ［**パッチ**］ をクリックします。 項目は新しい名前と説明で更新されました。

1. ID番号を入力し、 ［**削除**］ をクリックします。 項目が削除されました。

## コードを調べる

サンプルのCRUDアプリは、APIリクエストを含むファイルと、CRUD操作を処理するフォームを含むファイルの2つに分けられています。

### リクエストの処理

`Requests.js`ファイルは、JavaScriptの組み込みの `fetch()`メソッドを使用しています。

`getObjects()` すべてのオブジェクトに対してGETリクエストを行います。

```{literalinclude} ./remote-apps-with-headless-apis/resources/liferay-j4x7-overlay/src/utils/Requests.js
:language: javascript
:lines: 25-33
```

`addObject()`は、新しいオブジェクトの名前と説明を使用してPOSTリクエストを行います。

```{literalinclude} ./remote-apps-with-headless-apis/resources/liferay-j4x7-overlay/src/utils/Requests.js
:language: javascript
:lines: 1-13
```

`patchObject()`は、特定のオブジェクトIDと新しい名前および説明を使用したPATCHリクエストを行います。

```{literalinclude} ./remote-apps-with-headless-apis/resources/liferay-j4x7-overlay/src/utils/Requests.js
:language: javascript
:lines: 35-47
```

`deleteObject()`は、特定のオブジェクトIDを使用してDELETEリクエストを行います。

```{literalinclude} ./remote-apps-with-headless-apis/resources/liferay-j4x7-overlay/src/utils/Requests.js
:language: javascript
:lines: 15-23
```

```{note}
ここでは、デモのために基本認証を使用しています。 本番環境の場合は、 [OAuth 2.0](../../headless-delivery/using-oauth2.md)経由でユーザーを認証する必要があります。
```

### フォームの実装

[`GetForm.js`](./remote-apps-with-headless-apis/resources/liferay-j4x7-overlay/src/components/GetForm.js) は、`getObjects`メソッドを呼び出し、レスポンスをJSONとしてパースします。 J4X7の各エントリーは、フォームごとに一覧表示されます。

[`AddForm.js`](./remote-apps-with-headless-apis/resources/liferay-j4x7-overlay/src/components/AddForm.js) は、入力を受信し、ユーザーが **Add** をクリックすると、`addObject`メソッドを呼び出します。

[`PatchForm.js`](./remote-apps-with-headless-apis/resources/liferay-j4x7-overlay/src/components/PatchForm.js) は、入力を受信し、ユーザーが **Patch** をクリックすると、`patchObject`メソッドを呼び出します。

[`DeleteForm.js`](./remote-apps-with-headless-apis/resources/liferay-j4x7-overlay/src/components/DeleteForm.js) は、入力を受信し、ユーザーが **Delete** をクリックすると、`deleteObject`メソッドを呼び出します。

[`App.js`](./remote-apps-with-headless-apis/resources/liferay-j4x7-overlay/src/App.js) ファイルでフォームを集め、1つのページに表示します。

## 追加情報

[Liferayリモートアプリケーションの作成](../remote-apps/creating-a-liferay-remote-app.md) [ヘッドレスフレームワークの統合](../objects/understanding-object-integrations/headless-framework-integration.md)
