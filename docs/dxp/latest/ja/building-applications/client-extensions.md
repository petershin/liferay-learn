---
toc:
- ./client-extensions/browser-based-client-extensions.md
---
# クライアント拡張機能

```{toctree}
:maxdepth: 4

client-extensions/browser-based-client-extensions.md
```

{bdg-secondary}`利用可能な Liferay 7.4 U45+/GA45+`

クライアントエクステンションは、OSGiモジュールを使用せずにLiferayを拡張する方法です。 クライアントエクステンションは、自社ホスティング、Liferay Experience Cloudを問わず、あらゆるLiferay環境にデプロイすることができます。 これらは、 [Liferay objects](./objects.md)のような組み込み設定と共に、Liferay Experience CloudでLiferayをカスタマイズする主要な方法でもあります。

[OSGiモジュール](../liferay-internals/fundamentals/module-projects.md) または [テーマ](../site-building/site-appearance/themes/introduction-to-themes.md)のような他のタイプのLiferay拡張は、Liferay自体をカスタマイズする強力なツールですが、クライアント拡張はLiferayコードを直接使用したりカスタマイズしたりすることを避けています。 これにより、クライアント拡張は、特定のLiferayのバージョンに依存しないため、より堅牢で、アップグレード後の環境に適用することが容易になります。 また、クライアント拡張はLiferayの外部で実行され、オブジェクトと統合されるため、それらを接続するための余分なコードは必要なく、最も慣れ親しんだプログラミング言語や技術を使用して開発することができます。

![クライアントエクステンションは、Liferay自体を変更することなく、特定のビジネス要件に対応するために必要な主要なカスタマイズ機能を提供します。](./client-extensions/images/01.png)

クライアントエクステンションを使用すると、以下のことが可能になります。

* [カスタム JavaScript または CSS](#browser-based-client-extensions) を Liferay の特定のコードに依存することなくページに適用する
* Liferay のページで [カスタム要素](./client-extensions/browser-based-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) にリモートでホストされているアプリケーションを埋め込む。
* [クライアント拡張に変換することで、同じ設定やオブジェクトを複数の環境にプログラム的に適用するプロセスを簡素化します](#configuration-as-code)
* [カスタムサービス](#custom-service-client-extensions) または [関数](#lambda-client-extensions) 外部フィードやカスタム認証サーバーなど、Liferay の外部で動作するものを、好みのプログラミング言語やテクノロジーを使って呼び出すことができます。

## クライアント拡張機能の種類

クライアント拡張は、 [Liferay Workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md)と統合されているので、そこで利用可能なツールを使って迅速に開発・配備することができます。 クライアントエクステンションは [ヘッドレスAPIを介してLiferayと通信します](../headless-delivery/using-liferay-as-a-headless-platform.md).

Liferayの外観や機能を拡張するために、このようなクライアントエクステンションが用意されています。

* [ブラウザベースのクライアント拡張機能](#browser-based-client-extensions)
* [コードとしてのコンフィギュレーション](#configuration-as-code)
* [スケジューラークライアント拡張機能](#scheduler-client-extensions)
* [データコネクタクライアント拡張機能](#data-connector-client-extensions)
* [Lambdaクライアントエクステンション](#lambda-client-extensions)
* [カスタムサービスクライアント拡張機能](#custom-service-client-extensions)

### ブラウザベースのクライアント拡張機能

ブラウザベースのクライアント拡張は、デプロイ時にCDN上でホストされます。 ブラウザベースのクライアント拡張機能の例としては、特定のCSSレイアウト、クリックトゥチャット機能、カスタムショッピングカート表示などがあります。

* **JavaScript**: JavaScriptクライアント拡張機能は、グローバルまたは特定のテーマ内で適用することができます。

* **CSS**: CSSクライアント拡張機能は、グローバルまたは特定のテーマ内で適用することができます。

* **Favicon**: クライアントエクステンションは、特定のテーマのファビコンを配置することができます。

* **Custom Element**: Custom Element Client Extensionsは、アプリケーションをページに統合することができます。

* **IFrame**: IFrameクライアント拡張はカスタム要素と同様に機能しますが、別の `<iframe>` HTML要素を使用してリモートアプリケーションとの限定的なインタラクションを可能にします。

詳しくは、 [ブラウザベースのクライアント拡張機能](./client-extensions/browser-based-client-extensions.md) をご覧ください。

### コードとしてのコンフィギュレーション

```{warning}
コンフィギュレーションクライアントの拡張機能は、現在Liferay 7.4の**ベータ版機能**となっています。 利用できる機能は一時的に制限されます。
```

Liferay 7.4 では、コンフィギュレーションはクライアント拡張の一種として使用することもできます。 設定（およびカスタムオブジェクトとデータモデル）は、クライアントエクステンションとして他の環境に簡単にエクスポートおよびインポートすることができます。 これにより、変更をプッシュするためのスクリプトやカスタムコードを必要とせず、複数の環境を一度に設定し、クライアント拡張として実装し、該当する環境にデプロイするというプロセスを簡略化したワークフローで行うことができます。

### スケジューラークライアント拡張機能

```{warning}
スケジューラークライアント拡張機能は、現在Liferay 7.4の**ベータ版機能**です。 利用できる機能は一時的に制限されます。
```

Schedulerクライアント拡張は、スケジュールされた間隔で実行するジョブを作成するためのもので、よく知られているCron式で設定することができます。 これらのインターバルで実行するために、それらを使ってコードをデプロイしたり、 [データコネクタクライアント拡張](#data-connector-client-extensions) または [Salesforce](https://www.salesforce.com) などの外部APIを使ってLiferayとデータを同期させることができます。

### データコネクタクライアント拡張機能

```{warning}
データコネクタのクライアント拡張は、現在 Liferay 7.4 の **ベータ版機能** です。 利用できる機能は一時的に制限されます。
```

データコネクタクライアント拡張を使用して、 [Liferayオブジェクトの形でLiferayにデータをインポートします](./objects.md). これらは、 [スケジューラークライアント拡張機能](#scheduler-client-extensions) と組み合わせて、定期的にスケジュールされた間隔でデータを同期するために使用されます。

### Lambdaクライアントエクステンション

```{warning}
Lambdaクライアント拡張は、現在Liferay 7.4の**ベータ版機能**です。 利用できる機能は一時的に制限されます。
```

これらのクライアント拡張は、Liferayの外の別のコンテナであなたのコードを実行します。 OSGiモジュールやモデルリスナーを実装することなく、特殊な機能に対するカスタムソリューションを実装することができます。

Liferay は [オブジェクト](./objects.md)を介してこのコードの実行をトリガーします。 lambdaクライアント拡張が導入されていれば、クライアント拡張の関数を利用可能なアクションとして呼び出すオブジェクトを作成し、必要に応じてトリガーをカスタマイズすることが可能です。 Liferay Experience Cloudでは、コードはLiferayの外部で実行されますが、同じ環境でLiferayと一緒に実行されるため、コードをホストするための自社サーバーが不要になります。

### カスタムサービスクライアント拡張機能

```{warning}
カスタムサービスクライアント拡張は、現在Liferay 7.4の**ベータ版機能**です。 利用できる機能は一時的に制限されます。
```

より複雑なユースケースには、Liferay Experience Cloud で独自のサービスとして動作するクライアント拡張を使用できます。 自分のコードを提供し、それをクラウドのネットワーク内で機能するサービスとして展開し、自分専用の仮想サーバーを割り当てるのです。 同じクラウドネットワークでホストされることで、自社のサービスに他のサービスがアクセスできるようになり、またクラウドに組み込まれたセキュリティ機能の恩恵も受けられます。

カスタムサービスをデプロイすることで、独立したサービスとして動作することで恩恵を受けるカスタマイズを実装するためのパワーが大幅に向上します。 例えば、独自の認証サーバーや、Liferayの [ヘッドレスAPI](../headless-delivery/using-liferay-as-a-headless-platform.md)を使ってLiferayとインターフェースするアプリケーションを実装することができます。 カスタムサービスは、ユーザーとのインターフェイスを持つ別々のアプリケーションを統合する場合にも便利です。

## 追加情報

* [最初のクライアントエクステンションを作成する](./client-extensions/browser-based-client-extensions/tutorials/creating-your-first-javascript-client-extension.md)
* [ブラウザベースのクライアント拡張機能](./client-extensions/browser-based-client-extensions.md)
* [Liferay Workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md)
