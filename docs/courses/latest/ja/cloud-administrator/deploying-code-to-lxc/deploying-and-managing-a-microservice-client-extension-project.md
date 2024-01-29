# マイクロサービスクライアント拡張プロジェクトの展開と管理

Kyleは、 [マイクロサービスのクライアント拡張](https://learn.liferay.com/w/dxp/building-applications/client-extensions/microservice-client-extensions#object-action-client-extensions) を使用して、ユーザーから提出されたフィードバックを追跡するためのカスタムアプリケーションの開発を始めたいと考えている。

[Liferayのサンプルワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace) から [Spring Boot](https://spring.io/projects/spring-boot) を使ってマイクロサービスクライアント拡張のサンプルを試すことから始めます。

## サンプルワークスペースのダウンロード

クライアント拡張用のサンプル・ワークスペースをお使いのマシンにダウンロードし、解凍します：

```bash
curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
```

```bash
unzip com.liferay.sample.workspace-latest.zip
```

ワークスペースを解凍したら、 `client-extensions/liferay-sample-etc-spring-boot/` フォルダを開いて先に進みます。

## サンプルのSpring Bootプロジェクトを設定する

サンプルのSpring Bootプロジェクトでは、 `application.properties` ファイルを使って、対象のLiferayインスタンスのドメインなど重要な値を登録しています。 デプロイする前にSpring Bootプロジェクトを設定する。

1. ダウンロードしたサンプルのSpring Bootプロジェクトで、 `src/main/resources/application.properties` ファイルを開く。

1. `com.liferay.lxc.dxp.domains` と `com.liferay.lxc.dxp.mainDomain` のプロパティを、UATサイトのドメインを使って追加する（例： `uat.delectablebonsai.com`）：

   ```properties
   com.liferay.lxc.dxp.domains=YOUR DOMAIN
   com.liferay.lxc.dxp.mainDomain=YOUR DOMAIN
   ```

1. `https` プロトコル用のプロパティを追加する：

   ```properties
   com.liferay.lxc.dxp.server.protocol=https
   ```

これでプロジェクトはLXCインスタンス用に正しく設定され、デプロイする準備ができた。

## プロジェクトのビルドとデプロイ

サンプルのSpring Bootプロジェクトのフォルダからプロジェクトをビルドし、LXCインスタンスにデプロイする。

1. このコマンドを実行すると、プロジェクトがデプロイ可能な [クライアント拡張機能のパッケージ化](https://learn.liferay.com/w/dxp/building-applications/client-extensions/packaging-client-extensions) にビルドされます：

   ```bash
   ../../gradlew clean build
   ```

   [クライアント拡張との連携](https://learn.liferay.com/w/dxp/building-applications/client-extensions/working-with-client-extensions#assembling-client-extensions) で定義されているため）、デプロイに必要なすべてのコンポーネントを含むLUFFAを `dist/` フォルダに生成します。

1. CLIツールを使用して、ビルドされたLUFFAをデプロイします：

   ```bash
   lcp deploy --extension dist/liferay-sample-etc-spring-boot.zip
   ```

   プロンプトが表示されたら、UATクライアントの拡張環境に対応する番号を選択します。

![プロジェクトをデプロイするUATクライアント拡張環境の番号を入力します。](./deploying-and-managing-a-microservice-client-extension-project/images/01.png)

クライアントエクステンションはUAT環境にデプロイされ、遅延後にクラウドコンソールに表示されます。 Readyステータスは、サービスコンテナが実行され、Spring Bootアプリケーションが起動すると表示される。

![Spring Bootサーバーが起動したことをコンソールで確認する。](./deploying-and-managing-a-microservice-client-extension-project/images/02.png)

## オブジェクトデータの追加

[オブジェクト](https://learn.liferay.com/w/dxp/building-applications/objects) はLiferayのデータをクライアント拡張機能で永続化し、操作するための理想的な方法です。

デプロイしたプロジェクトの [マイクロサービスのクライアント拡張](https://learn.liferay.com/w/dxp/building-applications/client-extensions/microservice-client-extensions#object-action-client-extensions) のいずれかを呼び出す [アクション](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/actions) を持つオブジェクト定義を作成します。

### オブジェクト定義の作成

1. UATのLiferayインスタンスにログインします。

1. アプリケーションメニュー ( ![Applications menu](../../images/icon-applications-menu.png) ) &rarr; **コントロールパネル** &rarr; **オブジェクト** を開きます。

1. Objects（オブジェクト）ページで、 **Add**（ ![Add icon](../../images/icon-actions.png) ）をクリックし、New Custom Object（新規カスタムオブジェクト）フォームに必要事項を記入する：

   * **ラベル** : フィードバック入力

   * **Plural Label** : フィードバック入力

   * **オブジェクト名** : `FeedbackInput`

   ![フィードバック入力オブジェクト定義の基本情報を入力します。](./deploying-and-managing-a-microservice-client-extension-project/images/03.png)

1. ［**Save**］ をクリックします。

   オブジェクト定義はドラフトとして作成されるが、オブジェクト・アクション・クライアント拡張を使用するには、フィールドとアクションが必要である。

### ブール値フィールドの追加

1. Objects List の **Feedback Input オブジェクト定義** をクリックして編集します。

1. **Fields** タブをクリックする。

1. **Add**( ![Add icon](../../images/icon-add.png) ) をクリックし、New Field フォームに記入する：

   * **ラベル** : 参考になりましたか？

   * **フィールド名** : `役に立つ`

   * **タイプ** : ブーリアン

1. ［**Save**］ をクリックします。

### クライアント拡張機能を呼び出すアクションを追加し、公開する

1. **Actions** タブをクリックする。

1. **Add**( ![Add icon](../../images/icon-add.png) ) をクリックする。

1. アクションの基本情報フォームに記入する：

   * **アクション・ラベル** : 新しいフィードバック

   * **アクション名** : `NewFeedback`

1. **アクションビルダー** タブをクリックします。

1. Trigger ドロップダウンメニューで、 **On After Add** を選択する。

1. Actionドロップダウンメニューで、 `object-action-executor[function#liferay-sample-etc-spring-boot-object-action-1]`を選択します。

   ![最初のSpring Bootオブジェクトアクションクライアント拡張のオブジェクトアクション実行者エントリを選択します。](./deploying-and-managing-a-microservice-client-extension-project/images/04.png)

1. ［**Save**］ をクリックします。

1. オブジェクト定義の Details タブに戻り、 **Publish** をクリックします。

これでオブジェクト定義がパブリッシュされ、それを使ってオブジェクト・データを送信できるようになった。

### オブジェクト・データの提出

新しいオブジェクト定義を使ってフォームを追加し、オブジェクトのアクションをテストできるようにしましょう。

1. サイトのホームページに戻る。

1. ページ上部の **Edit**( ![Edit icon](../../images/icon-edit.png) ) をクリックします。

1. 画面左側のフラグメントのリストで、 **Form Container** フラグメントをページにドラッグします。

   ![フォームコンテナのフラグメントをページにドラッグして、オブジェクト定義にマッピングできるフォームを作成します。](./deploying-and-managing-a-microservice-client-extension-project/images/05.png)

1. Form Container のドロップダウンメニューで、新しい **Feedback Input オブジェクト定義** を選択します。

1. ページ上部の **Publish** をクリックします。

  ![オブジェクトの "役に立つ" 入力が、シンプルなフォームのチェックボックスになりました。](./deploying-and-managing-a-microservice-client-extension-project/images/06.png)

  このフォームは、"役に立ちましたか？"のチェックボックス1つとともにページに表示される。

1. **Submit** ボタンをクリックしてください。

フォームを送信するとオブジェクトエントリーが作成され、デプロイしたオブジェクトアクションクライアントエクステンションが呼び出されます。

## クラウド・コンソールで結果を調べる

オブジェクトアクションをトリガーしたので、Spring Bootアプリケーションのロギングをチェックして、呼び出しが成功したことを確認します。

1. クラウド・コンソールにログインし、UAT環境に移動します。

1. **Services** をクリックすると、デプロイされたマイクロサービスの全リストが表示されます。

1. `liferaysampleetcspringboot` サービスを選択する。

サービスのページにはデフォルトでLogsタブが表示され、Spring BootアプリケーションのログがLiferayから送られてきたオブジェクトデータを出力しているのを見ることができます。

![Liferayがオブジェクトアクションクライアントエクステンションをトリガーした結果をログで確認してください。](./deploying-and-managing-a-microservice-client-extension-project/images/07.png)

これで、オブジェクト・アクションが正常に動作しているのがわかるだろう。

## マイクロサービスを削除する

カイルはこのオブジェクトアクションをカスタマイズしてみるつもりだが、何を追加するか考える間、このバージョンをUAT環境にデプロイする必要はない。

サンプルのマイクロサービスを使い終わったら、コンソールからサービスを削除してください。

1. サービスのページで、右上の **Actions**( ![Actions menu](../../images/icon-actions.png) ) をクリックし、 **Delete Service** をクリックします。

1. `liferaysampleetcspringboot` と入力し、削除の影響を確認する。

   ![サービス名を入力すると、削除ボタンが有効になります。](./deploying-and-managing-a-microservice-client-extension-project/images/08.png)

1. **Delete Service** をクリックする。

   クライアント拡張サービスを削除すると、オブジェクト定義のアクションへのリンクも切断されます。 通常は、現在使用していないオブジェクトアクションも削除しますが、今回は、次の練習のために再作成するステップを省くために、そのままにしておきます。

遅延の後、サービスは削除され、クラウド・コンソールから消えます。

これでサンプルのSpring BootアプリケーションのUATテストは成功です。

次ページ： [コンソールでのトラブルシューティング](./troubleshooting-a-microservice-in-the-cloud-console.md).

## 関連コンセプト

* [クライアント拡張との連携](https://learn.liferay.com/w/dxp/building-applications/client-extensions/working-with-client-extensions)
* [マイクロサービスのクライアント拡張](https://learn.liferay.com/w/dxp/building-applications/client-extensions/microservice-client-extensions)
