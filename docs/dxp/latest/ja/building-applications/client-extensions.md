---
toc:
  - ./client-extensions/working-with-client-extensions.md
  - ./client-extensions/packaging-client-extensions.md
  - ./client-extensions/front-end-client-extensions.md
  - ./client-extensions/microservice-client-extensions.md
  - ./client-extensions/configuration-client-extensions.md
  - ./client-extensions/batch-client-extensions.md
---
# クライアント拡張

{bdg-secondary}`Liferay 7.4 U45+/GA45+で利用可能`

クライアントエクステンションは、OSGiモジュールを使用せずにLiferayを拡張します。 クライアントエクステンションは、自社ホスト、Liferay Cloudを問わず、あらゆるLiferay環境に導入することが可能です。 これらは、 [Liferay objects](./objects.md)のような組み込みの設定とともに、Liferay Cloud で Liferay をカスタマイズする主要な方法でもあります。

[OSGiモジュール](../liferay-internals/fundamentals/module-projects.md) や [テーマ](../site-building/site-appearance/themes/introduction-to-themes.md) のような他のLiferay拡張がLiferayそのものを変更したり機能を追加するのに対し、クライアント拡張はLiferayのAPIのみをインターフェースとします。 この疎結合により、クライアント拡張は、バージョン間でほとんど変わらないAPIにのみ依存するため、より柔軟で、アップグレード後の環境に適用しやすくなります。 また、クライアント拡張はLiferayの外部で実行され、オブジェクトと統合されるため、接続に余分なコードは必要なく、好きなプログラミング言語や技術を使用してクライアント拡張を作成することができます。

![クライアントエクステンションは、Liferay本体を変更することなく、特定のビジネス要件に対応するために必要な主要なカスタマイズ機能を提供します。](./client-extensions/images/01.png)

クライアントエクステンションを使用すると、次のことができます。

* Liferayのコードに依存することなく、 [カスタムJavaScriptやCSS](#front-end-client-extensions) を適用することができます。
* Liferay ページの [カスタム要素](./client-extensions/front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) に、リモートでホストされているアプリケーションを埋め込む。
* [クライアント拡張に変換することで、同じ設定やオブジェクトを複数の環境に適用することができます](#configuration-client-extensions)
* カスタムサービスや [関数を呼び出す](#microservice-client-extensions) Liferay の外部で実行される（例えば、REST エンドポイント）、お好みのプログラミング言語や技術を使用する。

## クライアントエクステンションの種類

[Liferay Workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md) を使用して Client エクステンションを開発し、デプロイします。 クライアント拡張は [ヘッドレスAPI](../headless-delivery/using-liferay-as-a-headless-platform.md)を介してLiferayと通信します。

以上が、クライアントエクステンションの分類になります：

* [バッチクライアント拡張機能](#batch-client-extensions)
* [コンフィギュレーション・クライアント・エクステンション](#configuration-client-extensions)
* [フロントエンドクライアントエクステンション](#front-end-client-extensions)
* [マイクロサービスクライアントの拡張機能](#microservice-client-extensions)

### バッチクライアント拡張機能

{bdg-link-primary}` [Dev Feature](../system-administration/configuring-liferay/feature-flags.md#dev-feature-flags) `

バッチクライアント拡張は、 [オブジェクト定義](./objects/creating-and-managing-objects/exporting-and-importing-object-definitions.md) や [ワークフロー定義](../process-automation/workflow/introduction-to-workflow.md)などのデータエンティティを Liferay インスタンスに提供します。 [バッチエンジンフレームワーク](../headless-delivery/consuming-apis/batch-engine-api-basics-exporting-data.md)を介してデータをエクスポートすることで、バッチクライアント拡張機能を作成します。

この特定のタイプの詳細については、 [バッチクライアント拡張機能](./client-extensions/batch-client-extensions.md) を参照してください。

### コンフィギュレーション・クライアント拡張機能

コンフィギュレーションクライアントエクステンションは、Liferayインスタンス内の機能を変更するための特定のコンフィギュレーションを提供します。

これらは、他のクライアント拡張（ [マイクロサービスクライアント拡張](#microservice-client-extensions) など）と一緒に使用することができます。 例えば、OAuthユーザーエージェントクライアントエクステンションを使用して、ユーザートリガーアクションイベントで動作するクライアントエクステンションを認証することができます。

具体的な種類については、 [コンフィギュレーション・クライアント拡張機能](./client-extensions/configuration-client-extensions.md) をご参照ください。

### フロントエンドクライアント拡張機能

フロントエンドクライアントエクステンションは、特定のページに表示するリソースを提供します。 テーマリソースやカスタムHTML要素をクライアントエクステンションで提供することができるようになりました。 ほとんどのフロントエンドクライアントエクステンションは、Liferayインスタンスに **静的リソース** を提供します。

具体的な種類については、 [フロントエンドクライアント拡張機能](./client-extensions/front-end-client-extensions.md) をご参照ください。

### マイクロサービスクライアント拡張機能

マイクロサービスクライアント拡張は、Liferay内でトリガーするAPIエンドポイント（オブジェクトやワークフローのアクションなど）を提供します。 これらのアクションイベントがAPIを呼び出したら、Liferayの外で好きな機能を別の **マイクロサービス** として実行することができます。

具体的な種類については、 [マイクロサービスクライアント拡張機能](./client-extensions/microservice-client-extensions.md) をご参照ください。

## 関連トピック

* [クライアントエクステンションの操作](./client-extensions/working-with-client-extensions.md)
* [Liferay Workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md)