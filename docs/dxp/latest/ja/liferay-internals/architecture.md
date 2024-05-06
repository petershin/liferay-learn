---
toc:
  - ./architecture/liferay-classloader-hierarchy.md
  - ./architecture/the-benefits-of-modularity.md
  - ./architecture/osgi-and-modularity.md
  - ./architecture/module-lifecycle.md
  - ./architecture/bundle-classloading-flow.md
  - ./architecture/ui-architecture.md
---
# アーキテクチャ

Liferay DXP/Portalのアーキテクチャには、次の3つの部分があります。

1. **コア：** DXPとその[フレームワーク](../building-applications/core-frameworks.md)をブートストラップします。 コアは、サービス、UIコンポーネント、およびカスタマイゼーションを管理するためのランタイム環境を提供します。

1. **サービス：** Java APIおよびWeb APIを介してDXP機能とカスタム機能を公開します。

1. **UI：** ポータル、サイト、ページ、ウィジェット、およびコンテンツを追加するためのオプションのWebアプリケーションUI。

UIとサービスを一緒に使用することも、[REST API](../headless-delivery/consuming-apis/consuming-rest-services.md)もしくは[GraphQL API](../headless-delivery/consuming-apis/consuming-graphql-apis.md)を介したサービスの利用のみに集中することもできます。

![サイトには、コンテンツとウィジェットが含まれています。 DXPは、"ヘッドレス"（UIなし）でも使用できます。](./architecture/images/01.png)

アーキテクチャは次の要件を満たしています。

* 一般的な開発技術の使用をサポート
* 開発基準を活用する
* コンポーネントの交換を容易にする
* 起動が速く、パフォーマンスも優れている
* ランタイムの構成と検査が容易

コアは、UIとサービスの展開をサポートし、それらを相互に接続するように調整します。

## コア

DXPは、アプリケーションサーバー上で実行されるWebアプリケーションです。 コアは、アプリケーションとその[フレームワーク](../building-applications/core-frameworks.md)をブートストラップします。

次のようなフレームワークがあります。

* アダプティブメディア
* アプリケーション設定
* アプリケーションのセキュリティ
* アセット
* キャッシュ
* データスコープ
* 依存性注入
* Expando/カスタム属性
* ファイル管理
* ローカライズ
* ロギング
* メッセージバス
* スケジューラー
* 検索
* セグメンテーションとパーソナライゼーション
* サービスビルダー
* テスト
* アップグレードのプロセス
* ウイルス対策
* ワークフロー

コアは、フレームワーク、サービス、およびUIのコンポーネントランタイム環境を提供します。 コンポーネントの例を次に示します。

* [サービス](./fundamentals/apis-as-osgi-services.md)
* [サービスのカスタマイゼーション](./extending-liferay/overriding-osgi-services.md)
* [言語キー\（ローカライズされたメッセージ\）](../building-applications/developing-a-java-web-application/using-mvc/sharing-localized-messages.md)
* [JavaScriptアプリケーション\（テンプレート、ルーター、およびリソース\）](../building-applications/developing-a-javascript-application/using-react.md)
* [JSPのカスタマイゼーション](./extending-liferay/customizing-jsps.md)
* [ポートレット\（テンプレート、コントローラー、およびリソース\）](../building-applications/developing-a-java-web-application/reference/portlets.md)
* [ポートレットフィルター](./extending-liferay/auditing-portlet-activity-with-a-portlet-filter.md)
* [テーマ](../site-building/site-appearance/themes/introduction-to-themes.md)

次の図は、ランタイム環境でのこれらのコンポーネントタイプを示しています。

![コアは、ここで紹介したようなコンポーネントのランタイム環境を提供します。 新しいコンポーネントの実装は、既存の実装を動的に拡張または置き換えることができます。](./architecture/images/02.png)

ランタイム環境は、コンポーネントのオンザフライでの追加、置換、およびカスタマイズをサポートしています。 これにより、次のシナリオが可能になります。

**置換：** `ServiceC Impl 2`コンポーネントのランクが既存のコンポーネント`ServiceC Impl 1`よりも高い場合、`ServiceC Impl 2`が使用されます。

**カスタマイゼーション：** `PortletAフィルター`は、`PortletA`で行われる要求と応答をインターセプトして変更し、`PortletA`が表示するコンテンツに影響を与えます。

コンポーネントWARおよび[モジュールJARプロジェクト](./fundamentals/module-projects.md)は、 [OSGiバンドル](https://www.osgi.org/) (モジュール)としてインストールされます。 LiferayのOSGiフレームワークは、モジュールのライフサイクルを定義し、依存関係を適用し、クラスの読み込み構造を定義し、モジュールとコンポーネントを管理するためのAPIとCLI（[Felix Gogo シェル](./fundamentals/using-an-osgi-service.md)）を提供します。 コアは、[ポータルプロパティファイル](../installation-and-upgrades/reference/portal-properties.md)と[システム設定](../system-administration/configuring-liferay/system-settings.md)を介して構成されます。

サービスコンポーネントはビジネス機能を提供します。

## サービス

ビジネスロジックは、コンポーネントランタイム環境にデプロイされたサービスに実装されます。 組み込みのコアサービスとフレームワークサービスは、[ユーザー](../users-and-permissions/users/understanding-users.md)、[ロール](../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md)、[Webコンテンツ](../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md)、[ドキュメントとメディア](../content-authoring-and-management/documents-and-media.md)などのモデルで動作します。 カスタムサービスを通じて新しいモデルと機能を導入できます。 サービスコンポーネントは、依存性注入を介して相互にアクセスできます。

フロントエンドアプリケーションは、サービスを呼び出して作業を行います。 Java APIを使用してサービスを直接呼び出すJavaベースのアプリケーションをデプロイすることができます。 DXPにデプロイされているかに関係なく、Webベース（Javaおよび非Java）のアプリケーションであれば、 [OpenAPI](https://swagger.io/docs/specification/about/) 標準に準拠した[REST API](../headless-delivery/consuming-apis/consuming-rest-services.md)、[GraphQL API](../headless-delivery/consuming-apis/consuming-graphql-apis.md)、シンプルなWeb/RESTサービスを含むWeb APIを利用できます。 次の図は、Liferayサービスを呼び出すアプリケーションと外部クライアントを示しています。

![ローカルアプリケーションおよびリモートアプリケーションは、REST Web APIを介してサービスを呼び出すことができます。 Javaベースのポートレットは、Java APIを介してサービスを呼び出すこともできます。](./architecture/images/03.png)

Liferayサービスは、 [サービスビルダー](../building-applications/data-frameworks/service-builder.md) を使用して構築され、[REST Builder](../headless-delivery/apis-with-rest-builder.md)を使用してREST-fulになります。 サービスは簡単に[オーバーライドしたり拡張する](./extending-liferay/overriding-osgi-services.md)こともできます。

WebベースのUIにより、コンテンツとサービスの機能がブラウザで利用できるようになります。

## UI

UIは、ユーザーが仕事をしたり、[コラボレーション](../collaboration-and-social/collaboration-and-social-overview.md)したり、コンテンツを楽しんだりするのに役立ちます。 UIの構成は以下の通りです。

* [DXPアプリケーション](../site-building/getting-started-with-site-building.md)：ポータル、サイト、ユーザー、ページ、ウィジェットなどを管理するためのWebアプリケーション。

* [アプリケーション](../building-applications/developing-a-java-web-application.md)：すでにデプロイされているサービスのユーザーインターフェイスを提供するウィジェット。

* [テーマ](../site-building/site-appearance/themes/introduction-to-themes.md)：サイトを独自のルック＆フィールでスタイリングするためのプラグイン。

[UIアーキテクチャ](./architecture/ui-architecture.md)の記事では、UIコンポーネントの開発とカスタマイズについて詳しく説明しています。

ご覧のとおり、このアーキテクチャは、サービス、UIコンポーネント、およびカスタマイゼーションの開発をサポートしています。 アーキテクチャのセクションでは、コア、サービス、およびUIのトピックについて説明します。 次に、クラスローディングやモジュール性など、コアについて詳しく説明します。 必要に応じて、サービスや [UIアーキテクチャ](./architecture/ui-architecture.md) のトピックにジャンプして進むことができます。 アーキテクチャについてさらに探究してください。
