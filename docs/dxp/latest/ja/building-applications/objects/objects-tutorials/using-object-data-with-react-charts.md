# Reactチャートでのオブジェクトデータの使用

ここでは、 [オブジェクト](../../objects.md)、 [ヘッドレスAPI](../understanding-object-integrations/headless-framework-integration.md)、 [カスタム要素リモートアプリケーション](../../client-extensions/front-end-client-extensions/tutorials/creating-a-basic-custom-element.md) を使って、データダッシュボード用のダイナミックチャートを作成することにしましょう。 まず、オブジェクトAPI 呼び出し用に [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) を有効にして、新しいDXP インスタンスをセットアップします。 次に、データの受信と保存を行うためのオブジェクトを作成します。 REST APIを使ってオブジェクトにデータを追加したら、提供されているReact [FusionCharts](https://www.fusioncharts.com/dev/getting-started/react/your-first-chart-using-react) アプリケーションをダウンロードし、ビルドしてください。 コードがコンパイルされたら、生成された`.js`ファイルをLiferayドキュメントライブラリーでホストし、そのWebDAV URLをコピーします。 最後に、このURLを使ってReactチャートのリモートアプリケーションを作成し、ページウィジェットとしてデプロイします。

チャートは5秒ごとにヘッドレスAPI経由でオブジェクトを呼び出し、オブジェクトのデータを返してチャートを動的に更新するように構成されています。

![Liferay ObjectsとReactチャートを使って、データダッシュボードの動的なビジュアルを作成します。](./using-object-data-with-react-charts/images/01.gif)

## Liferay DXPのセットアップ

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順に従って、`/o/c/*` URLパターンを **Default Portal CORS Configuration** に追加してください：

1. グローバルメニュー (**![グローバルメニュー](../../../images/icon-applications-menu.png)) を開き、** コントロールパネル **タブに移動して、** セキュリティツール*をクリックします。

1. Portalクロスオリジンリソース共有(CORS）」**タブを開き、「Default Portal CORS Configuration**」をクリックします。

   [デフォルトのポータルCORS設定](./using-object-data-with-react-charts/images/02.png) をクリックします。

1. URL Pattern **を `/o/c/** ` の値で追加し、 **Save** をクリックします。これにより、すべてのObject APIに対してCORSが有効になります。

   ![オブジェクトAPI用の/o/c/* URLパターンを追加する](./using-object-data-with-react-charts/images/03.png)

## React Chart用のオブジェクトを作成する

1. グローバルメニュー」(！ [グローバルメニュー](.../.../.../images/icon-applications-menu.png) ）を開き、「コントロールパネル」タブを開いて、「オブジェクト」をクリックします。

1. 追加*ボタン(！ [ボタン追加](../../../images/icon-add.png) ）をクリックし、以下の値を入力してください：

   | フィールド | 値 |
   | :--- | :--- |
   | ラベル | X3J8-Object |
   | 複数形ラベル | X3J8-Objects |
   | 名前 | X3J8Object | 

   ```{note}
   提供されたReactアプリは、これらの値を使用しています。
   ```

1. 新しい **オブジェクト** ドラフトを選択し、 ［**フィールド**］ タブをクリックして、これらの **フィールド** を追加します。

   | ラベル | 項目名   | 種類      | 必須       |
   |:--- |:----- |:------- |:-------- |
   | ラベル | label | Text    | &#10004; |
   | 値   | 値     | Integer | &#10004; |

1. ［**詳細**］ タブをクリックし、 ［**公開**］ をクリックします。

[オブジェクトの公開](../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) は、データの受信と保存のための新規アプリケーションを作成し、有効にします。 Liferay UIやヘッドレスAPIでアクセスできるようになりました。

## ヘッドレスAPIを使ったオブジェクトへのデータ追加

1. Liferayの ［**APIエクスプローラー**］(すなわち `localhost:8080/o/api`）を開き、 ［**RESTアプリケーション**］ ドロップダウンメニューをクリックして、 ［**c/x3j8objects**］ をクリックしてください。

1. このデータをバッチ`POST`APIのリクエストボディに入力してください。

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

1. ［**実行**］ をクリックして、データエントリーをオブジェクトに追加します。

データの追加が終わったら、提供されたReactサーバーを設定します。 これには、X3J8-ObjectにAPI呼び出しを行い、そのデータを表示するFusionChartの実装が含まれます。

## Reactチャートの設定

以下の手順で、Reactアプリケーションをダウンロードし、ビルドします。

1. [Reactプロジェクト](./liferay-x3j8.zip) をダウンロードし、解凍してください。

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/building-applications/objects/objects-tutorials/liferay-x3j8.zip -O
   ```

   ```bash
   unzip liferay-x3j8.zip
   ```

   ```bash
   cd liferay-x3j8
   ```

1. `node`と`yarn` がインストールされていることを確認します。 そうでない場合は、以下のコマンドを実行し、プロンプトに従います。

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

   起動したら、`localhost:3000`にアクセスし、Reactチャートを表示します。 `c/x3j8objects`サービスを基本認証で呼び出し、5秒ごとにオブジェクトのデータを取得します。

   ![localhost:3000にあるReactチャートを表示します。](./using-object-data-with-react-charts/images/04.png)

1. Reactプロジェクトをビルドします。

   ```bash
   yarn build
   ```

   このコマンドは、リモートアプリケーションとしてアプリケーションを実行するために必要なファイルを含む、最適化された本番環境用ビルドを作成します。

1. ビルドが成功したことを確認し、アプリケーションの`.js`ファイルをメモしておきます。

   ```bash
   Creating an optimized production build...
   Compiled successfully.

   File sizes after gzip:

     523.77 kB  build/static/js/main.5a6819d5.js
     20 B       build/static/css/main.31d6cfe0.css
   ```

   ```{note}
   このチュートリアルでは、`.css` ファイルは不要です。
   ```

コードがコンパイルされたら、アプリケーションの`.js`ファイルをLiferay ドキュメントライブラリでホストし、そのWebDAV URLをコピーします。

## アプリケーションの`.js`ファイルをホストする

1. **サイトメニュー**(![Site Menu](../../../images/icon-product-menu.png)) を開き、 ［**コンテンツ & データ**］ と展開して ［**Documents and Media**］ とクリックします。

1. `.js`ファイルをアップロードエリアにドラッグ＆ドロップしてください。

   ドキュメントライブラリにアップロードされると、そのファイルには固有のWebDAV URLが割り当てられ、それを使ってリモートアプリケーションを作成することになります。

1. **Info** アイコン (![Info Icon](../../../images/icon-information.png)) をクリックし、 **アップロードしたファイル** を選択します。

1. ファイルの ［**WebDAV URL**］ をコピーし、次のステップで使用するために保存してください。

   例えば、 `http://localhost:8080/webdav/guest/document_library/main.5a6819d5.js`です。

   ![.jsファイルのWebDAV URLをコピーします。](./using-object-data-with-react-charts/images/05.png)

## Reactチャートのリモートアプリケーションを作成する

1. **グローバルメニュー**(![Global Menu](../../../images/icon-applications-menu.png)) を開き、 ［**アプリケーション**］ タブをクリックし、 ［**Remote Apps**］ を選択します。

1. **追加** ボタン(![Add Button](../../../images/icon-add.png)）をクリックします。

1. 次の値を入力します。

   | 項目           | 値                     |
   |:------------ |:--------------------- |
   | 名前           | X3J8-カスタムエレメント        |
   | 種類           | カスタム要素                |
   | HTML 要素名     | `x3j8-custom-element` |
   | URL          | `.js`ファイルのWebDAV URL  |
   | ポートレットのカテゴリ名 | リモートアプリケーション          |

1. ［**保存**］ をクリックします。

保存されると、Liferayはリモートアプリケーションのウィジェットを作成し、サイトページにデプロイすることができます。 このウィジェットは、アプリケーションのポートレットカテゴリ名(つまり、このチュートリアルでは、 **リモートアプリケーション**）の下に表示されます。

![リモートアプリケーションウィジェットをサイトページにデプロイすることができます。](./using-object-data-with-react-charts/images/06.png)

## 関連トピック

* [オブジェクト概要](../../objects.md)
* [ヘッドレスフレームワークの統合](../understanding-object-integrations/headless-framework-integration.md)
* [CORSの設定](../../../installation-and-upgrades/securing-liferay/securing-web-services/setting-up-cors.md)
