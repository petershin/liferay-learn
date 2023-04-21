---
toc:
- ./client-extensions/working-with-client-extensions.md
- ./client-extensions/front-end-client-extensions.md
- ./client-extensions/microservice-client-extensions.md
- ./client-extensions/configuration-client-extensions.md
---
# クライアント拡張

```{toctree}
:maxdepth: 4

client-extensions/working-with-client-extensions.md
client-extensions/front-end-client-extensions.md
client-extensions/microservice-client-extensions.md
client-extensions/configuration-client-extensions.md
```

{bdg-secondary}`利用可能 Liferay 7.4 U45+/GA45+`

クライアントエクステンションは、OSGiモジュールを使用せずにLiferayを拡張します。 クライアント拡張は、自社でホストしているか、Liferay Experience Cloud上にあるかを問わず、あらゆるLiferay環境に導入することができます。 [Liferay objects](./objects.md)のような組み込みの構成とともに、Liferay Experience Cloud で Liferay をカスタマイズする主要な方法でもあります。

[OSGiモジュール](../liferay-internals/fundamentals/module-projects.md) や [テーマ](../site-building/site-appearance/themes/introduction-to-themes.md) のような他のLiferay拡張がLiferayそのものを変更したり機能を追加するのに対し、クライアント拡張はLiferayのAPIのみをインターフェースとします。 この疎結合により、クライアント拡張は、バージョン間でほとんど変わらないAPIにのみ依存するため、より柔軟で、アップグレード後の環境に適用しやすくなります。 また、クライアント拡張はLiferayの外部で実行され、オブジェクトと統合されるため、接続に余分なコードは必要なく、好きなプログラミング言語や技術を使用してクライアント拡張を作成することができます。

![クライアントエクステンションは、Liferay本体を変更することなく、特定のビジネス要件に対応するために必要な主要なカスタマイズ機能を提供します。](./client-extensions/images/01.png)

クライアントエクステンションを使用すると、次のことができます。

* Liferayのコードに依存することなく、 [カスタムJavaScriptやCSS](#front-end-client-extensions) を適用することができます。
* Liferay ページの [カスタム要素](./client-extensions/front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) に、リモートでホストされているアプリケーションを埋め込む。
* [クライアント拡張に変換することで、同じ設定やオブジェクトを複数の環境に適用することができます](#configuration-client-extensions)
* カスタムサービスや [関数を呼び出す](#microservice-client-extensions) Liferayの外部で実行される(例えば、RESTエンドポイント）、お好みのプログラミング言語や技術を使用します。

## クライアントエクステンションの種類

[Liferay Workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md) を使用して Client エクステンションを開発し、デプロイします。 クライアント拡張は [ヘッドレスAPI](../headless-delivery/using-liferay-as-a-headless-platform.md)を介してLiferayと通信します。

以上が、クライアントエクステンションの分類になります：

* [フロントエンドクライアントエクステンション](#front-end-client-extensions)
* [マイクロサービスクライアントの拡張機能](#microservice-client-extensions)
* [コンフィギュレーション・クライアント・エクステンション](#configuration-client-extensions)

### フロントエンドクライアント拡張機能

フロントエンドクライアントエクステンションは、特定のページに表示するためのリソースを提供します。 テーマリソースやカスタムHTML要素をクライアントエクステンションで提供することができるようになりました。 ほとんどのフロントエンドクライアントエクステンションは、Liferayインスタンスに *静的リソース* を提供します。

具体的な種類については、 [フロントエンドクライアント拡張機能](./client-extensions/front-end-client-extensions.md) をご参照ください。

### マイクロサービスクライアント拡張機能

マイクロサービスクライアント拡張は、Liferay内でトリガーするAPIエンドポイント(オブジェクトやワークフローのアクションなど）を提供します。 これらのアクションイベントがAPIを呼び出したら、Liferayの外で好きな機能を別の *マイクロサービス*として実行することができます。

具体的な種類については、 [マイクロサービスクライアント拡張機能](./client-extensions/microservice-client-extensions.md) をご参照ください。

### コンフィギュレーション・クライアント拡張機能

コンフィギュレーションクライアントエクステンションは、Liferayインスタンス内の機能を変更するための特定のコンフィギュレーションを提供します。

これらは、他のクライアント拡張( [マイクロサービスクライアント拡張](#microservice-client-extensions) など）と一緒に使用することができます。 例えば、OAuthユーザーエージェントクライアントエクステンションを使用して、ユーザートリガーアクションイベントで動作するクライアントエクステンションを認証することができます。

具体的な種類については、 [コンフィギュレーション・クライアント拡張機能](./client-extensions/configuration-client-extensions.md) をご参照ください。

## 追加情報

* [クライアントエクステンションの操作](./client-extensions/working-with-client-extensions.md)
* [フロントエンドクライアント拡張機能](./client-extensions/front-end-client-extensions.md)
* [Liferay Workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md)
