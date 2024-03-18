# Reactチャートでのオブジェクトデータの使用

ここでは、 [オブジェクト](../objects.md) 、 [ヘッドレスAPI](../objects/understanding-object-integrations/using-custom-object-apis.md) 、 [カスタム要素のリモートアプリケーション](../client-extensions/frontend-client-extensions/tutorials/creating-a-basic-custom-element.md) を使って、データダッシュボード用の動的なグラフを作成する方法を説明します。 まず、オブジェクトAPI 呼び出し用に [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) を有効にして、新しいDXP インスタンスをセットアップします。 次に、データの受信と保存を行うためのオブジェクトを作成します。 REST APIを使ってオブジェクトにデータを追加したら、提供されているReact [FusionCharts](https://www.fusioncharts.com/dev/getting-started/react/your-first-chart-using-react) アプリケーションをダウンロードし、ビルドしてください。 コードがコンパイルされたら、生成された `.js` ファイルを Liferay Document Library にホストし、その WebDAV URL をコピーします。 最後に、このURLを使ってReactチャートのリモートアプリケーションを作成し、ページウィジェットとしてデプロイします。

チャートは5秒ごとにヘッドレスAPI経由でオブジェクトを呼び出し、オブジェクトのデータを返してチャートを動的に更新するように構成されています。

![Use Liferay Objects with React charts to create dynamic visuals for data dashboard.](./using-object-data-with-react-charts/images/01.gif)

## Liferay DXPのセットアップ

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順に従って、`/o/c/*` URLパターンを **Default Portal CORS Configuration** に追加してください：

1. [グローバルメニュー](../../images/icon-applications-menu.png) )を開き、 [コントロールパネル](**Control Panel**) タブに移動し、 [セキュリティツール](**Security Tools**) をクリックします。

1. ［**Portal Cross-Origin Resource Sharing (CORS**)］ タブで、 ［**Default Portal CORS Configuration**］ をクリックしてください。

   ![Click Default Portal CORS Configuration](./using-object-data-with-react-charts/images/02.png)

1. ［**URL Pattern**］に`/o/c/*`の値を追加し、［**保存**］をクリックします。 これにより、すべてのオブジェクトAPI に対してCORSが有効になります。

   ![Add the /o/c/* URL Pattern for Object APIs.](./using-object-data-with-react-charts/images/03.png)

## React チャート用のオブジェクトを作成する

1. グローバルメニュー(![グローバルメニュー](../../images/icon-applications-menu.png))を開き、 **コントロールパネル** タブに移動し、 **オブジェクト** をクリックします。

1. **追加** ボタン(![追加ボタン](../../images/icon-add.png))をクリックし、以下の値を入力する：

   | 項目      | 値            |
   | :------ | :----------- |
   | ラベル     | X3J8-Object  |
   | 複数形のラベル | X3J8-Objects |
   | 名前      | X3J8Object   |

   ```{note}
   提供されたReactアプリはこれらの値を使用する。
   ```
1. 新しい **オブジェクト** ドラフトを選択し、 **フィールド** タブをクリックし、以下の **フィールド** を追加する：

   | ラベル | 項目名   | 種類       | 必須       |
   | :-- | :---- | :------- | :------- |
   | ラベル | label | テキストボックス | &#10004; |
   | 値   | 値     | 整数       | &#10004; |

1. **Details** タブをクリックし、 **Publish** をクリックします。

[オブジェクトの公開](../objects/creating-and-managing-objects/creating-objects.md#publishing-object-drafts) は、データの受信と保存のための新規アプリケーションを作成し、有効にします。 Liferay UIやヘッドレスAPIでアクセスできるようになりました。

## ヘッドレスAPIを使ったオブジェクトへのデータ追加

1. Liferayの **API Explorer**(つまり、`localhost:8080/o/api`)を開き、 **REST Applications** ドロップダウンメニューをクリックし、 **c/x3j8objects** をクリックします。

1. このデータをバッチ `POST` API のリクエストボディに入力する：

   ```json
   [
     {
       "label": "FOO",
       "value": "250"
     },
     {
       "label": "BAR",
       "value": "200"
     },
     {
       "label": "GOO",
       "value": "150"
     },
     {
       "label": "BAZ",
       "value": "100"
     },
     {
       "label": "QUX",
       "value": "50"
     }
   ]
   ```

1. [**実行**]をクリックして、データエントリをオブジェクトに追加します。

データの追加が終わったら、提供されたReactサーバーを設定します。 これには、X3J8-ObjectにAPI呼び出しを行い、そのデータを表示するFusionChartの実装が含まれます。

## Reactチャートの設定

以下の手順で、Reactアプリケーションをダウンロードし、ビルドします。

1. [Reactプロジェクト](./liferay-x3j8.zip) をダウンロードし、解凍してください。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/tutorials/liferay-x3j8.zip -O
   ```

   ```bash
   unzip liferay-x3j8.zip
   ```

   ```bash
   cd liferay-x3j8
   ```

1. `node`と`yarn`がインストールされていることを確認する。 そうでない場合は、以下のコマンドを実行し、プロンプトに従います。

   ```bash
   ./setup_tutorial.sh
   ```

1. Reactアプリケーションのフォルダに移動し、Reactサーバーを起動します。

   ```bash
   cd x3j8-custom-element
   ```

   ```bash
   yarn start
   ```

   起動したら、`localhost:3000`にアクセスしてReactチャートを表示する。 基本認証を使って `c/x3j8objects` サービスを呼び出し、5秒ごとにオブジェクトのデータを取得する。

   ![View the React chart at localhost:3000.](./using-object-data-with-react-charts/images/04.png)

1. Reactプロジェクトをビルドします。

   ```bash
   yarn build
   ```

   このコマンドは、リモートアプリケーションとしてアプリケーションを実行するために必要なファイルを含む、最適化された本番環境用ビルドを作成します。

1. ビルドが成功したことを確認し、アプリケーションの `.js` ファイルに注目してください。

   ```bash
   Creating an optimized production build...
   Compiled successfully.

   File sizes after gzip:

     523.77 kB  build/static/js/main.5a6819d5.js
     20 B       build/static/css/main.31d6cfe0.css
   ```

   ```{note}
   このチュートリアルでは、`.css`ファイルは不要です。
   ```
コードがコンパイルされたら、アプリケーションの `.js` ファイルを Liferay Document Library にホストし、その WebDAV URL をコピーします。

## アプリケーションの `.js` ファイルをホストする

1. ![サイトメニュー](../../images/icon-product-menu.png))を開き、[コンテンツとデータ]を展開し、[ドキュメントとメディア]をクリックします。

1. `.js`ファイルをアップロードエリアにドラッグ＆ドロップします。

   ドキュメントライブラリにアップロードされると、そのファイルには固有のWebDAV URLが割り当てられ、それを使ってリモートアプリケーションを作成することになります。

1. **情報** アイコン(![情報アイコン](../../images/icon-information.png))をクリックし、 **アップロードされたファイル** を選択します。

1. ファイルの **WebDAV URL** をコピーし、次のステップで使用するために保存します。

   例えば、`http://localhost:8080/webdav/guest/document_library/main.5a6819d5.js`である。

   ![Copy the .js file's WebDAV URL.](./using-object-data-with-react-charts/images/05.png)

## Reactチャートのリモートアプリケーションを作成する

1. ![グローバルメニュー](../../images/icon-applications-menu.png)を開き、[アプリケーション]タブをクリックし、[リモートアプリケーション]を選択します。

1. **追加** ボタン(![追加ボタン](../../images/icon-add.png))をクリックします。

1. 次の値を入力します。

   | 項目           | 値                     |
   | :----------- | :-------------------- |
   | 名前           | X3J8-Custom-Element   |
   | 種類           | カスタム要素                |
   | HTML 要素名     | `x3j8-custom-element` |
   | URL          | .js`ファイルのWebDAV URL  |
   | ポートレットのカテゴリ名 | リモートアプリケーション          |

1. ［**Save**］をクリックします。

保存されると、Liferayはリモートアプリケーションのウィジェットを作成し、サイトページにデプロイすることができます。 このウィジェットは、アプリケーションのポートレット・カテゴリ名（つまり、このチュートリアルでは「**Remote Apps**」）の下に表示されます。

![You can deploy the remote app widget to Site Pages.](./using-object-data-with-react-charts/images/06.png)

## 関連トピック

* [オブジェクトの概要](../objects.md)
* [ヘッドレス・フレームワークの統合](../objects/understanding-object-integrations/using-custom-object-apis.md)
* [CORSの設定](../../installation-and-upgrades/securing-liferay/securing-web-services/setting-up-cors.md)
