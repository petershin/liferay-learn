# Liferay DXP 7.3 新機能一覧

Liferay DXPの最新リリースには、多くの重要な新機能と改善が含まれています。 これらの機能により、サイトの構築、サイトのトラフィックの分析、ドキュメントの管理、必要なアプリケーションの作成がより簡単に行えるようになります。 Liferay DXP 7.3には、アプリビルダー、マスターページ、アセットライブラリなどが含まれています。

## ページ構築

### マスターページ

[マスターページ](../site-building/creating-pages/defining-headers-and-footers/creating-a-master-page-template.md) は、サイト内の複数ページ、あるいはすべてのページにおいて、一貫性のあるページ領域を定義します。 ヘッダーやフッター、サイドバーを定義する際に、最もよく使用します。 本機能が搭載される前は、共通のページ領域はテーマ内でしか定義できませんでした。 これにより、技術者でないユーザーでも、自分のマスターページを作成して、サイト全体で使用でき、さらにいつでも変更することができます。行った変更はすべてのページに自動的に適用されます。

### 「元に戻す」・「やり直し」コマンド

![Undo and redo works for the entire editing session.](./whats-new-73/images/01.gif)

新たに追加したボタンにより、実行したアクションを元に戻したり、やり直したりすることが可能になりました。 キーボードショートカットも利用できます：`CMD + z` / `CMD + shift + z` (MacOS) `Ctrl + z` / `Ctrl + shift + z` (Windows, Linux)

また、編集セッションで任意のページ状態にすばやく移動するために、実行されたすべてのアクションを一覧表示するパネルもあります。

### コレクション表示

![The Collection Display fragment publishes assets using a drag and drop interface.](./whats-new-73/images/02.gif)

[コレクション表示](../site-building/displaying-content/collections-and-collection-pages/displaying-collections.md#adding-a-collection-display-fragment-to-a-page) フラグメントでは、ドラッグアンドドロップ編集で一連のアセットを表示します。 フラグメントがページに追加されたら、コレクションにリンク付けします。 その後、コレクション内の各アセットのスペースを定義します。 スペースの調整は、残りのスペースにも反映されます。 編集可能なフィールドをコレクションの共通フィールドにマッピングすることができます。 例えば、見出しフラグメントが追加されると、Webコンテンツストラクチャーのタイトルフィールドにマッピングされます。このマッピングは各項目にプロパゲートします。

### ビジュアル・レスポンシブ・レイアウト・エディター

レスポンシブエディターは、デフォルトのレスポンシブ動作を微調整するのに役立ちます。 ページの内容を各デバイスに最適な方法で表示します。

![The Visual Responsive Layout Editor shows previews for various screen widths.](./whats-new-73/images/03.gif)

### 一般的なパフォーマンスの向上

Liferay DXP 7.3でReactを使用するためにページエディターを全面的にオーバーホールしました。 これにより、特に大きなページを扱う際のエディターのパフォーマンスが大幅に向上しました。

### ビジュアルフラグメントの構成

![Visual Fragment Composition makes it easy to save and share Fragment compositions across pages.](./whats-new-73/images/04.gif)

ページの作成者は、コラムの構成を再利用および共有可能なフラグメントとして保存でき、他のページでも使用できるようになりました。

## デザインとテーマエディター

マスターページ、テンプレート、フラグメント、スタイルブック（下記参照）の機能により、テーマを改良し、デフォルトのテーマのルックアンドフィールを部分的または完全にオーバーライドします。 これで、標準のLiferayテーマをベースに使用することができるようになります。

![Themes, Style Books, Fragments, Master Pages, Page Templates: they're now all integrated to help you provide great UIs for your content.](./whats-new-73/images/05.png)

### スタイルブック

[スタイルブック](../site-building/site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) は、スタイルエディターのUIで作成できるスタイルを集めたものです（CSSルールセット）。 スタイルブックでは、UXデザイナーが、再利用かつ共有可能なスタイルやスタイルルールを用いて、ページ間で一貫したユーザーエクスペリエンスを作成できるよう、「デザインシステム」を提供しています。 テーマ作成者は同じサイトに複数のスタイルブックを作成することができ、ページ作成者は特定のページのスタイルブックを選択することができます。 スタイルブックを使えば、複数のコンテンツ制作者Webデザイナーが並行して新しいエクスペリエンスを作成する際に、不整合を減らすことができます。

## コンテンツのオーサリングと管理

### アセットライブラリ

アセットライブラリにより、 [専用のライブラリ](../content-authoring-and-management/asset-libraries/asset-libraries-overview.md) を作成して、コンテンツの整理や再利用ができるようになりました。 異なるサイト間でリソースを簡単に再利用できます。

アセットライブラリはWebコンテンツに限らず、あらゆるタイプのアセットを共有し、必要なサイトに接続することができます。コンテンツ作成者は、ページやブログ記事作成の際に、接続されたアセットライブラリにアクセスして、そこに保存されている画像やドキュメント、コンテンツを使用することができます。

![Asset Libraries are sharable across Sites and include any asset type.](./whats-new-73/images/06.png)

### コンテンツダッシュボード

使用していない可能性のある大規模データベースに大量のコンテンツを保有している企業向けに、Liferayは [コンテンツダッシュボード](../content-authoring-and-management/content-dashboard/about-the-content-dashboard.md) を作成しました。 コンテンツダッシュボードでは、コンテンツ作成者が、特定のサイトだけでなく、Liferayインスタンス内にあるすべてのサイトやアセットライブラリの全コンテンツにワンストップでアクセスできます。 こうした大量のコンテンツを容易に把握できるよう、包括的なフィルターセットが搭載されています。これを使えば、コンテンツリストのフィルタリングと並び替えができ、必要なコンテンツの監査がしやすくなる監査グラフも入手できます。

コンテンツダッシュボードには、グローバルメニュー &rarr; ［アプリケーション］タブからアクセスできます。

![The Content Dashboard helps you find hidden gems in your data that may be going unused.](./whats-new-73/images/07.gif)

### コンテンツ監査ツール

この新しいコンテンツダッシュボードには、 [種類別にコンテンツを簡単に監査](../content-authoring-and-management/content-dashboard/content-dashboard-interface.md#content-audit-tool) できるツールが含まれています。 ボキャブラリーを選択し、コンテンツ監査のグラフで、ボキャブラリーの各カテゴリにおける既存のアセット数を計算します。 カテゴリ、タグ、作成者、アセットのサブタイプ、サイトなどでフィルタリングし、グラフに表示されるアセットを調整することができます。

![The Content Audit tool helps you see the kinds of content you have.](./whats-new-73/images/08.gif)

### カテゴリー設定の拡張機能

Liferay DXP 7.3では、 [閲覧に関して、サイトメンバーのみとするか一般公開とするか](../content-authoring-and-management/tags-and-categories/organizing-content-with-categories-and-tags.md#vocabulary-visibility) 設定できるよう、ボキャブラリーに新しい設定を追加しました。 すぐに利用可能なオーディエンス、ステージ、およびトピックのグローバルボキャブラリーを使えば、サイト全体で体系的な分類がしやすくなります。

## 公開管理

[公開](../site-building/publishing-tools/publications.md) は、コンテンツ作成者が変更点に対応し、スケジュールに合わせて公開できる新機能です。 画像やコピーの更新、新しいページの追加など、季節ごとの特別なプロモーションを展開しなければならない場合は、公開を作成し、必要なユーザーを招待して変更を行ってから公開することができます。 複数の公開を一度に作成できるため、一度に多くのアップデートを一括作成し、スケジュールに合わせて展開することが可能です。

![Publications provide a way to update your Site on a schedule of your choosing.](./whats-new-73/images/09.gif)

### Webコンテンツに特化した翻訳エクスペリエンス

[新しい翻訳UI](../content-authoring-and-management/translating-pages-and-content/translating-web-content.md#manually-translating-content) では、並べて表示するUIでプロセスを最適化し、コンテンツの翻訳がしやすくなります。 翻訳者は、許可された言語にのみ翻訳し、Liferayのワークフロープロセスにより、その翻訳を簡単にレビューすることができます。

![The new translation UI makes the entire translation process painless.](./whats-new-73/images/10.png)

### 翻訳対象のWebコンテンツのインポート/エクスポート

翻訳会社やフリーランスの翻訳者を利用している場合は、翻訳するコンテンツを選択し、 [翻訳の標準フォーマット](../content-authoring-and-management/translating-pages-and-content/translating-web-content.md#exporting-and-importing-translations) （XLIFF 1.2または2.0バージョンのいずれか）で必要な言語をエクスポートし、翻訳会社に送信することができます。 翻訳が終了したら、翻訳内容をインポートして、原文と共に保持できます。

![Translations can now be exported for translation and imported when finished.](./whats-new-73/images/11.gif)

## SEO設定

### Open Graph

![Open Graph support means you can configure and preview links for social media and search engines.](./whats-new-73/images/12.gif)

[Open Graph](../site-building/site-settings/configuring-open-graph.md) のサポートにより、ソーシャルメディア上でのページのプレビューを設定できるようになりました。 また、検索エンジンやソーシャルネットワーク上で自社ページがどのように表示されるかをリアルタイムでプレビューすることができます。

### リダイレクト管理

![You can create redirects and even set the type.](./whats-new-73/images/13.png)

サイトのURLを任意の有効なURLに [リダイレクト](../site-building/site-settings/managing-site-urls/setting-up-redirects-and-404-tracking.md) できるようになりました。 これにより、古いリンクで404エラーを気にする必要がなくなります。 一時的・恒久的なリダイレクトや、リダイレクトの有効期限の設定にも対応しています。

リンク切れに関しては、404エラーがすべて記録されます。 このエラー表示のリストを利用して新しいリダイレクトを作成し、ユーザーが目的のページを見つけられるようサポートします。

![404 reports help you find possible broken links.](./whats-new-73/images/14.png)

### フレンドリーURLの履歴

![Friendly URL History shows all URLs ever used for any page.](./whats-new-73/images/15.png)

この履歴により、 [あらゆるページで使用されているフレンドリURL](../site-building/creating-pages/page-settings/configuring-your-pages-friendly-url.md#managing-a-page-s-url-history) をすべて、言語ごとに</0>簡単に確認でき、視覚的に管理できます。 URLを覚える必要はなく、他のページで再利用したり、古いフレンドリURLを復元したりすることができます。

## コンテンツパフォーマンス

> 変更通知を受け取り（購読）が必要

ここでは、何人の訪問者がコンテンツをすべて読んでいるかがわかります。 [コンテンツパフォーマンス解析](../content-authoring-and-management/content-dashboard/content-dashboard-interface.md#content-performance-sidebar) は、コンテンツ作成者やマーケティング担当者が成功するコンテンツ戦略を立て、評価できるよう、関連するコンテンツを考慮して表示されます。

![Content Performance shows views versus reads, search engines' incoming traffic volume, and keyword reports by region.](./whats-new-73/images/16.gif)

## 質問アプリ

サイトで製品をサポートしている場合、新機能である [質問アプリ](../collaboration-and-social/questions-application/using-the-questions-app.md) により、ユーザーが製品に関する質問の回答を検索できるようにします。 LiferayのGraphQL APIと掲示板のインフラストラクチャーを活用して、質問アプリは、回答への投票や最も役立つ回答をマーキングすることで、ユーザーにベストな回答を提供します。

![Users can post a question and get answers quickly.](./whats-new-73/images/17.gif)

![The best answer can be chosen and voted up.](./whats-new-73/images/18.gif)

## アプリビルダー

![App Builder provides an in-browser development environment for low-code applications.](./whats-new-73/images/19.png)

[アプリビルダー](../building-applications/reference/app-builder.md) は、データエンジンに裏打ちされたLiferay DXP用の新しいローコードアプリケーション開発ソリューションです。 本アプリケーションは、直感的なGUIでフォームやテーブルビューを定義し、ワークフローを活用してビジネスプロセスのデジタル化と自動化を目的としたアプリケーションを構築します。 アプリケーションは、スタンドアロンでデプロイしたり、ウィジェットとして、またはプロダクトメニューからページに追加したりすることが可能です。

### フォームビュールールとフィールドセット

アプリビルダーにはルールビルダーが用意されており、フィールドの可視性を設定したり、フィールドを有効または無効にするために事前に定義された条件を使用するなど、動的なフォームの動作を定義できます。

![Form View Rules make it easy to control presentation of a form.](./whats-new-73/images/20.png)

フィールドセットとは、グループ化されたフィールドを指します。アプリビルダーのフィールドセット機能により、異なるオブジェクトやフォームビューでフィールドを簡単に作成、更新、再利用しやすくなります。 こうしておけば、アプリケーションごとにアドレスなどの同じグループのフィールドを何度も作り直す必要がありません。

![Fieldsets group fields so they can be shared across forms.](./whats-new-73/images/21.png)

### プロセス主導型アプリ

> 変更通知を受け取り（購読）が必要

アプリビルダーには、 [承認のためのワークフロープロセス](../building-applications/reference/app-builder/creating-a-workflow-powered-application.md) が含まれています。 プロセスの段階を定義し、アプリケーションの各段階でどの情報を要求、表示させるべきか指定します。 アプリのプロセスのパフォーマンスと健全性を把握できるよう、 [ワークフロー統計情報](#workflow-metrics-improvements) を活用することもできます。

![Process-Driven Apps](./whats-new-73/images/22.png)

### ローカライズされたアプリケーション

アプリビルダーアプリケーションは、複数の異なる言語にローカライズすることもできます。 フォームビュービルダーには、フィールドを選択し、希望する言語に翻訳するためのインターフェイスがあります。

### データエンジンの改良

アプリビルダーにおいて、アプリケーションを構築するデータエンジン使用時に、開発者のエクスペリエンスを強化するようデータエンジンを改良しました。

* フィールドセットの作成と再利用
* データレコードコレクションの検索
* データ定義キーによるレイアウトのレンダリング
* データ定義とレイアウトのバージョン属性の作成
* 名前でのデータレイアウトの検索
* `ClassNameId`を使用してデータ定義をスコープする。
* ビルダータグライブラリを使用したデータ定義の保存
* データレコードのローカライズ
* フィールドのネスト
* 以下の新しいフィールドタイプとビジュアル要素
* 区切り文字
* リッチテキストフィールド
* 画像フィールド
* 位置情報フィールド
* カラーフィールド

## フォーム

ユーザーが提供したデータは、 [Webフォーム](../process-automation/forms/introduction-to-forms.md) を使用して収集されることが多いため、Liferayでは、GDPRの要件に準拠したフォームを設計するためのGUIと開発ツールを提供しています。

### データ消去（またはGDPRの「忘れられる権利」）

「忘れられる権利」（いわゆる「消去権」）では、企業が個人データを本人の要求に応じて削除することを求めています。 個人データは、特定可能な個人に合理的に関連する可能性がなくなった場合に消去されるものとします。 シンプルなインターフェースにより、フォームエントリーを確認し、必要に応じて個人情報を編集、匿名化、削除することができるようになりました。

### データエクスポート（または、GDPR データポータビリティの権利）

「データポータビリティの権利」では、要請に応じてユーザーの個人データを機械で読み取れる形式でエクスポートすることを企業に求めています。 フォームから送信されたユーザーの個人データを、消去する前にエクスポートできるようになりました。

### フォームレポート

フォームには、受信した回答のサマリーレポートが組み込まれており、収集したデータを確認するだけでなく、回答について全体的な分析をすることができます。

![Forms Reports now have a default, easy-to-read summary of answers.](./whats-new-73/images/23.png)

### ページの並び替え

複数ページのフォームの作成や管理だけでなく、フォームのページの並べ替えも容易になりました。

![Page Reordering, an oft-requested feature, is now provided in Forms.](./whats-new-73/images/24.png)

### ワークフロー統計情報の改善

### 担当者ごとの作業量

[ワークフロー統計情報](../process-automation/workflow/using-workflows/using-workflow-metrics.md) に、プロセスの担当者の作業量の内訳を表示するカードが追加されました。 この新しいチャートから、過剰な負荷がかかっている担当者を特定し、ボトルネックを取り除くため、タスクを再割り当てするなどの意思決定をより効果的に行うための有益なヒントを得ることができます。

![Workload by Assignee shows you at a glance the workflow queues of various users.](./whats-new-73/images/25.png)

### 担当者ごとのパフォーマンス

パフォーマンスタブの下にある新しいカードに、各担当者の平均完了時間と完了タスクの合計が表示され、優れたパフォーマーが誰であるか把握できます。

![You can now view assignees' average performance at a glance.](./whats-new-73/images/26.png)

### ステップごとのパフォーマンス

各ステップで発生したSLA違反の数とステップの平均完了時間を確認することで、プロセスのボトルネックがどこにあるかを特定します。

![Performance by Step shows you where the bottlenecks are.](./whats-new-73/images/27.png)

### 一括アクション

ワークフロー統計情報レポートでプロセスの健全性とパフォーマンスを分析しつつ、インスタンスの一括移行や再割り当てができるようになりました。

![Select multiple items to perform bulk actions on them.](./whats-new-73/images/28.png)

## グローバルメニュー

新しいアプリケーションドロワーには、ワークフロー、フォーム、および [Commerce](https://learn.liferay.com/w/commerce/index) などのクロスサイトアプリケーションが格納されています。

![The Global Menu provides convenient access to cross-site applications.](./whats-new-73/images/29.png)

## アプリケーションのセキュリティ

### 多要素認証

> 変更通知を受け取り（購読）が必要

[多要素認証（Multi-Factor Authentication）](../installation-and-upgrades/securing-liferay/multi-factor-authentication/using-multi-factor-authentication.md) （MFA）は、ユーザーに複数の方法、すなわち「要素」で自分の身元を証明することを要求することによって、より優れたセキュリティを提供する。 基本的なユーザー名とパスワードの組み合わせに、さらに1つまたは複数の設定可能な要素を追加します。 これには、デフォルトのワンタイムパスワード（OTP）とカスタマイズ可能なIPアドレス、時間ベースのOTPが含まれています。また、システムに拡張性があるため、ユーザーが書きたい要素も使用できます。

### インスタンスレベルでのSAMLの設定

今回の変更により、証明書の取り扱いを含むインスタンスレベルで [SAML](../installation-and-upgrades/securing-liferay/configuring-sso/authenticating-with-saml.md) を設定できるようになりました。

新しい SAML プロパティが導入された： **不明なユーザは見知らぬユーザである。** このプロパティにより、エンドユーザーがゲストである場合のSAML IdP接続の動作が決まります。 このプロパティは、ポータルデータベースに既に存在しないユーザーをゲストとして分類するかどうかを定義します。 分類後、ポータルインスタンスの既存のゲスト処理ポリシーにより、IdPのSAMLアサーションから得られる情報を使用して、ユーザーを自動的にプロビジョニングするかどうかを決定します。

### インスタンスレベルでのOAuth 2の設定

[OAuth 2](../headless-delivery/using-oauth2.md) アプリケーションスコープの画面が簡素化されたため、アプリケーションの認証要求中にスコープの表示をより制御できるようになりました。 たとえば、2つのAPIアプリケーションに関連する2つのスコープを、1つのスコープであるかのように表示することができます。

有効期限切れの認証情報を削除する設定も可能です。 有効期限切れの認証情報の猶予期間後、バックグラウンドで実行されている予定されたプロセスにより、認証データが自動的に削除されます。

### インスタンスレベルでのOpenId Connectの設定

各インスタンスでは、異なる [OpenId Connect](../installation-and-upgrades/securing-liferay/configuring-sso/using-openid-connect.md) プロバイダへの接続を設定できます。

システムレベルのOpenId Connectプロバイダーは、すべてのインスタンスに表示され、デフォルトのOpenId Connectプロバイダーと同じように動作します。

### インスタンスレベルでのCORSの設定

[CORS](../installation-and-upgrades/securing-liferay/securing-web-services/setting-up-cors.md) は、インスタンスレベルで設定できます。 インスタンスレベルでの設定方法はシステムレベルと同様です。

URLパターンは、始めにインスタンスレベルで、次にシステムレベルで一致します。 インスタンスレベルのパターンが優先されます。

## 検索

[ElasticsearchとのLiferay DXP 7.3の検索エンジンコネクター](../using-search/installing-and-upgrading-a-search-engine/elasticsearch.md) の改良、変更をいくつか行いました。

### Elasticsearch 7のサポート

Liferay DXPのデフォルトの検索エンジンがElasticsearch 7にアップグレードされました。

### 複数の接続

Liferay DXPは、複数のElasticsearchクラスターに接続できます。 これにより、低レベル検索オプションおよび検索結果ウィジェットと組み合わせて使用することで、Elasticsearchクラスターを使用しているサードパーティシステムからの結果を表示することができます。

### RESTクライアント

Elasticsearchとの通信にはTransportクライアントではなくRESTクライアントを使用します。

### ウィジェットテンプレートのサポート

検索ウィジェットで、ウィジェットテンプレートをサポートします。

## 開発者向けエクスペリエンス

### APIエクスプローラー

![The API Explorer shows all available APIs in a Liferay DXP installation.](./whats-new-73/images/30.png)

[APIエクスプローラー](../headless-delivery/consuming-apis/consuming-rest-services.md) には、Liferay DXPの利用可能なAPIを閲覧したり、クエリを実行したりするためのインターフェイスがあります。 すべてのRESTアプリケーションとそのエンドポイントを探索することができます。

![You can query any of the APIs from the API Explorer.](./whats-new-73/images/31.png)

[GraphQLクライアント](../headless-delivery/consuming-apis/consuming-graphql-apis.md) により、クエリの定義とテストが簡単に行えます。

### OpenAPIバリデーター

OpenAPIバリデーターにより、設定ファイルにエラーがあるかどうか、標準のLiferayがまだサポートしていない機能があるかどうかがわかります。

### バッチ処理

ヘッドレスAPIでバッチ処理をサポートします。

### ローカライズされたコンテンツのすべての翻訳を単一のリクエストで管理します。

ヘッドレスAPIでは、翻訳の追加、更新、取得を同時に行うことができます。

### ヘッドレスAPIでアクションを公開します。

権限に基づいて許可されたユーザーアクションをクエリで取得できます。 動的アクションメニューがあるアプリを作成し、ユーザーが実行可能なアクションのみを表示できるようにしました。

### ドキュメントとメディアAPIでメタデータを公開する

ドキュメントとメディアAPIでは、ドキュメントタイプに含まれるメタデータの全セットを公開できます。

### コンテンツテンプレートAPI

APIを通してコンテンツテンプレートを取得すれば、必要に応じてLiferay以外でコンテンツをレンダリングすることができます。

### アセットライブラリ配信API

アセットライブラリに保存されているコンテンツやドキュメントにヘッドレスRESTやGraphQL APIからアクセスできるため、Liferay DXPを他のアプリケーションのコンテンツリポジトリとして利用することができます。

### ヘッドレスAPIの拡張性

ヘッドレスAPIには拡張性があり、OOTBアプリケーションでの新しいプロパティや新しいコンポーネントの公開、エンドポイントの非アクティブ化、GraphQLでのコントリビューションの追加などを簡単に行うことができます。

### コレクションにおけるファセットの返却

ヘッドレスAPIを使用する際に、要素のコレクション（ドキュメント、構造化コンテンツなど）を検索する際に検索ファセットを要求できます。 これにより、エンドユーザーを表示するための動的フィルターを構築することができます。

### React.js機能

Liferayでは、内部UIの大部分をReactに移行することを開始しています。 この移行の副次的な影響として、新しいユーティリティが追加され、以下のことが可能になりました。

**ReactRenderer** :Reactコンポーネントをレンダリングするための低レベルJavaプリミティブで、Reactコンポーネントのブートストラップを簡素化し、初期化に必要なJavaScriptコードを生成する。

**React:component** :従来のJSPから複雑なReactアプリケーションをレンダリングして初期化するために、従来の`MVCPortlet`アプローチと組み合わせることができる高レベルのJSPタグです。 これにより、複雑なJSアプリケーションをスムーズに移行し、より近代的なフロントエンドのワークフローを適用できます。

### アップグレードの向上

[アップグレードプロセス](../installation-and-upgrades/upgrading-liferay/upgrade-basics.md) の信頼性が大幅に向上しました。アップグレードプロセスは、コアとモジュール間で統一されています。 自動アップグレードの動作は、新しいポータル・プロパティで制御できます：`upgrade.database.auto.run`。
