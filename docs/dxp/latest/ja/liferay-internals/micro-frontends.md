# マイクロ・フロントエンド

マイクロフロントエンドは、マイクロサービスの概念を開発のフロントエンド側に拡張する。 マイクロサービス・アーキテクチャを使用してアプリケーションを小さなパーツに分解し、完全な機能を備えた強力なブラウザ・アプリケーションを構築することができます。 その後、別々のチームが、異なるフレームワークを使ってでも、より小さなパーツを提供することに集中することができる。 完成すると、パーツはシームレスにつなぎ合わされ、素晴らしいユーザー体験を生み出す。

![Using Liferay to build a fully-featured and powerful browser application applying Micro Frontends](micro-frontends/images/01.png)

マイクロフロントエンドを実装するために、 [フラグメント](../site-building/creating-pages/page-fragments-and-widgets/using-fragments.md) や [ウィジェット](../site-building/creating-pages/page-fragments-and-widgets/using-widgets.md) のような、すぐに使えるソリューションと相まって、 [フロントエンドクライアント拡張](../building-applications/client-extensions/frontend-client-extensions.md) を使用します。 開発者はさまざまなフレームワークを使用してアプリケーションを作成または拡張し、クライアント拡張機能を使用してそれらをLiferayに接続することができます。

利用可能なフロントエンドクライアント拡張機能のひとつに、 [基本カスタムエレメント](../building-applications/client-extensions/frontend-client-extensions/tutorials/creating-a-basic-custom-element.md) があります。 基本的なカスタム要素はLiferayのフロントエンドインフラストラクチャを使用して、外部のリモートアプリケーションをLiferayプラットフォームに登録し、ウィジェットとしてレンダリングします。 こうすることで、ユーザーはアプリケーションを個別に開発し、クライアント・エクステンションを使って基本的なカスタム要素を作成し、ページに追加することができる。

```{note}
カスタムエレメントクライアントのエクステンションは、そのビルド、パッケージ、ホスティングの方法に関係なく、どのようなテクノロジーでも使用することができます。
```
以下のケースはそのコンセプトを示している。

### ケース1：レイライフ

[Raylife](https://marketplace.liferay.com/p/liferay-insurance-agent-portal-accelerator#solutions-details-video) は、Liferay 上に構築されたエージェントポータルソリューションです。 カスタマイズ可能なアクセラレーターとして機能する。

Raylifeは4つの独立したアプリケーションを必要とする： [Reactベースのクライアント拡張](../building-applications/developing-a-javascript-application/using-react.md) 、異なるフィールドを持つ保険請求のリストを表示する、情報を視覚化するフラグメントブロック（他のブロックに置き換えて異なる視覚化を表示することができる）、ヘッダー、サイドメニューバー。

ページ上の要素は、DOMによってトリガーされるイベントを通じて通信し、同期通信を維持し、リソースを共有することができる。

画面上のデータはすべて、 [ヘッドレスAPI](../building-applications/objects/creating-and-managing-objects/managing-objects-with-headless-apis.md) と [データ永続化のためのオブジェクト](../building-applications/objects.md) を通じて取得される。

異なるチームが同時にプロジェクトに取り組んだ。 各チームがアプリケーションを担当した。 クライアント・エクステンションを使用したため、各チームのコードは分離されていた。 あるアプリケーションはReactをメインフレームワークとして使用したが、他のアプリケーションはHTML、CSS、JavaScriptを使用したカスタムフラグメントで作成された。

![Raylife is an agent portal solution built on Liferay using a Micro Frontend concept.](micro-frontends/images/02.png)

### ケース2：コマース・アプリケーション

Eストアのウェブサイトを作る必要があるとしよう。 ウェブサイトにはヘッダー、フッター、そして4つのアプリケーションが必要です。ユーザーが商品に関する情報（商品名、写真、説明文）を見つけるメインディスプレイアプリケーション、カート/レジアプリケーション（カートに入れるボタンを含む）、メインディスプレイの商品に関連する商品を表示する関連商品アプリケーション、そして商品に関する顧客のコメントと商品を評価する星評価システムを含むコメント/評価セクションです。

[レイアウト要素](../site-building/creating-pages/page-fragments-and-widgets/using-fragments/using-layout-elements.md) を使ってページのレイアウトをカスタマイズしたり、カスタマイズ可能なOOTBフラグメントやウィジェットをページ内で使ったり（ヘッダーやフッターフラグメントなど）、クライアント拡張機能を使って他のアプリケーションを追加したりできます。

さまざまなチームが、好きなフレームワークを使って、それぞれ異なるアプリケーションに取り組むことができる。 すべてのアプリケーションはLiferayのネイティブAPI（ヘッドレスAPIまたはグローバルJavaScript API）の恩恵を受けています。

![A draft that defines the layout of the page with the position of each application/component in the page.](micro-frontends/images/03.png)
