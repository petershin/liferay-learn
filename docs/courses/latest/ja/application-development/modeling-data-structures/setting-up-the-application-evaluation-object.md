# アプリケーション評価オブジェクトの設定

デレクタブルボンサイは、申請書を審査する際、ディストリビューターの申請書ごとに評価メモを保管しなければなりません。 これを実現するために、Delectable Bonsai開発チームはアプリケーション評価オブジェクトを作成し、必要なフィールドを追加した。

![Import the Application Evaluation object](./setting-up-the-application-evaluation-object/images/01.png)

彼らはこのオブジェクト定義を別の環境で作成しましたが、それをJSONとしてエクスポートしたため、Distributor Applicationオブジェクトを使ってあなたの環境にインポートすることができます。

ここでは、このJSONファイルを使ってアプリケーション評価オブジェクトをLiferayインスタンスにインポートします。 その前に、`headless-admin-list-type` REST APIを使ってオブジェクトのピックリストを作成する。 <!--TASK: 代わりにバッチクライアント拡張を使う。 この方法でリストとオブジェクトを追加することができます。-->

## ピックリストの作成

Application Evaluationオブジェクトは以下のピックリストを必要とします：評価スコア、推奨、および決定。

1. [この演習のリソースをダウンロードし、解凍してください](./liferay-w1m9.zip) ：

   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/application-development/modeling-data-structures/liferay-w1m9.zip -O
   ```

   ```bash
   unzip liferay-w1m9.zip
   ```

1. `liferay-w1m9`フォルダ内の`curl` フォルダに移動します：

   ```bash
   cd liferay-w1m9/curl
   ```

1. このコマンドを実行して、アプリケーション評価オブジェクトに3つのピックリストを作成します：

   ```bash
   ./ListTypeDefinition_POST_ToInstance.sh
   ```

1. ピックリストが表示されることを確認する。

   ![Verify the picklists appear.](./setting-up-the-application-evaluation-object/images/02.png)

ピックリストを配置したら、アプリケーション評価オブジェクトをインポートします。

## アプリケーション評価オブジェクトのインポート

1. グローバルメニュー](../../images/icon-applications-menu.png) を開き、[コントロールパネル] タブを開き、[オブジェクト] をクリックします。

1. アプリケーションバーの **Actions**( ![Actions Button](../../images/icon-actions.png) ) をクリックし、 **Import** を選択します。

1. これらの詳細を入力し、 **インポート** をクリックします。

   | 項目        | 値                                   |
   | :-------- | :---------------------------------- |
   | 名前        | `ApplicationEvaluation`             |
   | JSON ファイル | `Object_ApplicationEvaluation.json` |

   アプリケーション評価 JSON ファイルは `liferay-w1m9` フォルダにあります。 このファイルには、一般的な設定やカスタムフィールドを含む、オブジェクトの基本スキーマが含まれています。

   ![Import the Object_ApplicationEvaluation.json file.](./setting-up-the-application-evaluation-object/images/03.png)

1. オブジェクト定義の編集を始める。

   ![Begin editing the object definition.](./setting-up-the-application-evaluation-object/images/04.png)

1. オブジェクトにこれらのカスタムフィールドが含まれていることを確認する：

   * 事業名
   * 評価スコア
   * 添付ファイル
   * 決定
   * 取材メモ
   * 推薦コメント
   * レコメンド

   ![Verify the object includes these custom fields.](./setting-up-the-application-evaluation-object/images/05.png)

1. **詳細** タブに移動します。

1. ［**公開**］ をクリックします。

Delectable Bonsaiは、このオブジェクトを使用して、販売代理店に関するメモを保存することができます。

これで、Distributor Application オブジェクトと Application Evaluation オブジェクトの間にリレーションシップを定義し、それらのエントリーをリンクできるようになりました。

次へ [オブジェクト定義間の関係の追加](./adding-a-relationship-between-the-object-definitions.md) 
