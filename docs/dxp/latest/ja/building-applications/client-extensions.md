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

{bdg-secondary}`利用可能な Liferay 7.4`

クライアント拡張はOSGiモジュールを使わずにLiferayを拡張します。 クライアント拡張機能は、Liferay環境であれば、自社ホストでもLiferayクラウド上でもデプロイできます。 また、 [Liferay objects](./objects.md)のようなビルトインコンフィギュレーションとともに、Liferay CloudでLiferayをカスタマイズする主な方法でもあります。

[OSGiモジュール](../liferay-internals/fundamentals/module-projects.md) や [テーマ](../site-building/site-appearance/themes/introduction-to-themes.md) のような他のLiferayエクステンションがLiferayそのものを変更したり機能を追加したりするのに対して、クライアントエクステンションはLiferayのAPIだけをインターフェイスにします。 この疎結合により、クライアント拡張はより柔軟になり、バージョン間でほとんど変更されないAPIにのみ依存するため、アップグレード後の環境に適用しやすくなります。 また、クライアント拡張はLiferayの外部で実行され、オブジェクトと統合されるため、接続に余分なコードは必要ありません。

![クライアントエクステンションは、Liferay自体を変更することなく、特定のビジネス要件に対応するために必要な主要なカスタマイズ機能を提供します。](./client-extensions/images/01.png)

クライアント・エクステンションを使用すると、次のことが可能になります。

* [カスタムJavaScriptまたはCSS](#front-end-client-extensions)を適用し、Liferayのコードに依存しないようにする。
* リモートでホストされているアプリケーションを Liferay ページの [カスタムエレメント](./client-extensions/front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) に埋め込む
* 同じコンフィギュレーションやオブジェクトを、 [クライアント拡張に変換することで、複数の環境に適用](#configuration-client-extensions)
* カスタムサービスや [関数を呼び出す](#microservice-client-extensions) Liferayの外部（例：RESTエンドポイント）で、お好みのプログラミング言語やテクノロジーを使って実行する。

## クライアント拡張機能の種類

[Liferay Workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md) を使用して、クライアント拡張機能を開発・配備します。 クライアント拡張は [ヘッドレス API](../headless-delivery/using-liferay-as-a-headless-platform.md)を介して Liferay と通信します。

これらはクライアント・エクステンションの分類である：

* [バッチクライアント拡張機能](#batch-client-extensions)
* [設定クライアントの拡張](#configuration-client-extensions)
* [フロントエンドクライアントの拡張](#front-end-client-extensions)
* [マイクロサービスクライアントの拡張](#microservice-client-extensions)

### バッチクライアント拡張機能

{bdg-link-primary}`[Dev Feature](../system-administration/configuring-liferay/feature-flags.md#dev-feature-flags)`

バッチクライアント拡張は、 [オブジェクト定義](./objects/creating-and-managing-objects/exporting-and-importing-object-definitions.md) や [ワークフロー定義](../process-automation/workflow/introduction-to-workflow.md)のようなデータエンティティを Liferay インスタンスに提供します。 [バッチエンジンフレームワーク](../headless-delivery/consuming-apis/batch-engine-api-basics-exporting-data.md)を介してデータをエクスポートすることで、バッチクライアントの拡張機能を作成します。

このタイプの詳細については [Batch Client Extensions](./client-extensions/batch-client-extensions.md) を参照のこと。

### クライアント拡張の設定

コンフィギュレーションクライアントエクステンションは、Liferayインスタンス内の機能を変更するための特定のコンフィギュレーションを提供します。

これらは、 [マイクロサービスクライアント拡張](#microservice-client-extensions)のような他のクライアント拡張と一緒に使用することができます。 たとえば、OAuth ユーザーエージェントクライアント拡張を使用して、ユーザートリガーのアクションイベントで動作するクライアント拡張を認証することができます。

特定のタイプの詳細については、 [Configuration Client Extensions](./client-extensions/configuration-client-extensions.md)。

### フロントエンドのクライアント拡張

フロントエンドクライアントエクステンションは、特定のページに表示するリソースを提供します。 テーマリソースまたはカスタム HTML 要素をクライアント拡張機能で提供できるようになりました。 ほとんどのフロントエンドクライアントエクステンションは *静的リソース* を Liferay インスタンスに提供します。

特定のタイプの詳細については、 [Front-end Client Extensions](./client-extensions/front-end-client-extensions.md) を参照のこと。

### マイクロサービスのクライアント拡張

マイクロサービスクライアント拡張は、Liferay内でトリガーするAPIエンドポイントを提供します（オブジェクトやワークフローのアクションなど）。 これらのアクションイベントがAPIを呼び出すと、Liferayの外部で、 *マイクロサービス*として好きな機能を実行できます。

特定のタイプの詳細については、 [Microservice Client Extensions](./client-extensions/microservice-client-extensions.md) を参照してください。

## 関連トピック

* [クライアント拡張との連携](./client-extensions/working-with-client-extensions.md)
* [Liferay Workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md)