# Liferay DXP 7.4 新機能一覧

Liferay DXP 7.4は、強化された機能と大幅な改良が施されおり、技術者と非技術者の両方にとって、デジタルエクスペリエンスの提供および最適化がさらに容易になります。

## データに基づくインサイトによるデジタルエクスペリエンスの最適化

### A/Bテストで任意の要素をクリックターゲットに設定する

これで、 [ページ上の任意の要素でA/Bテストを実行できるようになりました](../site-building/optimizing-sites/ab-testing/creating-ab-tests.md) 。 Liferay DXP 7.4以前は、［Click Goal］としてボタンやリンクしか選択できませんでした。 Liferay DXP 7.4では、任意のページ要素をその［Element ID］を含めることで選択できるようになりました。

![You can now run AB tests on any element on the page.](./whats-new-74/images/04.png)

### よりインサイトのあるコンテンツ監査ツール

コンテンツダッシュボードの [コンテンツ監査ツール](../content-authoring-and-management/content-dashboard/content-dashboard-interface.md) では、バーをクリックして結果を拡大できるようになり、1つのボキャブラリカテゴリにのみ割り当てられたコンテンツがグラフに表示されるようになりました。 今回の機能強化により、マーケティング担当者は誤って分類されたコンテンツを簡単に発見できるようになりました。

![Zoom in on Content Audit results.](./whats-new-74/images/03.png)

### コンテンツ監査ツールのUXの改善

また、コンテンツダッシュボードの [コンテンツ監査ツール](../content-authoring-and-management/content-dashboard/content-dashboard-interface.md) の使い勝手もいくつか改善されています。 例えば、監査の対象とするボキャブラリの選択がより簡単になり、棒グラフの軸をワンクリックで反転させることができるようになりました。

![Select vocabularies and flip the bar chart axes.](./whats-new-74/images/10.png)

### コンテンツパフォーマンスツールでのトラフィック獲得チャネル

[Content Performance Tool](../content-authoring-and-management/page-performance-and-accessibility/analyze-content-metrics-using-content-performance-tool.md) のトラフィック獲得チャネルは、 [Analytics Cloud](https://learn.liferay.com/w/analytics-cloud/index) のデータを使用しており、オーガニック検索、有料検索、ソーシャル・トラフィック、およびリファラルの測定値が含まれています。 チャンネルの詳細表示では、すべての参照元URLとドメインが表示されます。

![Traffic acquisition channels include search, social and referral data.](./whats-new-74/images/09.png)

### あらゆるタイプのページのコンテンツパフォーマンス解析

コンテンツパフォーマンスパネルは、すべてのページで利用できるようになりました。すべてのアセット、コンテンツ、およびウィジェットページのページテンプレートを表示します。 Liferay DXP 7.4以前では、コンテンツパフォーマンスツールは、ディスプレイページテンプレートを介してレンダリングされたWebコンテンツでのみ利用可能でした。

![The Content Performance Panel can be used for all page types.](./whats-new-74/images/06.png)

## 優れたDXの構築

### ページ監査

Liferay DXP 7.4からは、ページのSEOやアクセシビリティを監査するために、 [ページ監査ツール](../content-authoring-and-management/page-performance-and-accessibility/analyze-seo-and-accessibility-on-pages.md) を使用することができます。 ページ監査ツールは [Google PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights) サービスを使用して、Liferay DXPに特定の推奨事項を提供します。  新しいページ監査ツールでは、ページが最高のパフォーマンス、アクセシビリティ、検索エンジンのメタデータ、およびSEOのプラクティスに準拠しているかどうかをチェックできます。

![Google PageSpeed Insights integration provides recommendations.](./whats-new-74/images/02.png)

### エクスペリエンスの複製や下書きがより柔軟に

[Liferay DXP Experiences](../site-building/personalizing-site-experience/experience-personalization/content-page-personalization.md) を下書きや複製して、デフォルトのエクスペリエンスを別のものに置き換えることができます。 これらの機能強化により、エクスペリエンスの作成と管理がより柔軟に行えるようになりました。

![Replicate and Draft Experiences easily.](./whats-new-74/images/07.png)

### コンテンツダッシュボードで新たにドキュメントの表示

ドキュメントは [コンテンツダッシュボード](../content-authoring-and-management/content-dashboard/about-the-content-dashboard.md) に表示されるようになり、アセットタイプやMIMEタイプに基づいた新しいフィルタが追加されました。 これらのフィルターは、コンテンツダッシュボードのフィルターと並び替えドロップダウンメニューからアクセスできます。

![There are new filters in the Content Dashboard.](./whats-new-74/images/01.png)

### アカウント管理ウィジェット

アカウントユーザーは、自社のWebサイトにいながら、自社の詳細情報、住所、割り当てられたユーザー、関連する組織、グループ、ロールを閲覧・管理することができ、また、ポータル管理者によるアカウント管理のサポートを最小限に抑えることができます。

## シームレスなB2B購買体験を実現。Commerce 4.0による安定性の向上と改善

### 特定のデバイスに最適化された製品画像

ページの読み込み速度は、レンダリングされるデバイスに応じて画像の品質を変更することで最適化されます。

### 注文タイプに応じて異なる価格と割引

売り手は、緊急の注文と在庫のある注文など、注文状況に応じて価格や割引を変更することができます。

### 改善された組織管理ウィジェット

組織図ウィジェットが組織管理ウィジェットになり、購入者にサービスを提供するのと同じプラットフォーム内で、販売ネットワークを簡単に管理できるようになりました。

## ビジネスユーザーはコードを書かずにアプリケーションを構築できる

[Liferay Objects](../building-applications/objects.md) を使用すると、コードを記述したりモジュールをデプロイしたりすることなくアプリケーションを構築および配信できますが、これらのアプリケーションはLiferayのコアフレームワーク上に構築され、統合されています。 シームレスなユーザーエクスペリエンスを維持しながら、Liferay DXPをビジネスニーズに適応させる柔軟なソリューションを迅速に開発および管理します。

### UIによるカスタムオブジェクトの管理

オブジェクトを定義し、フィールドやオブジェクトのレイアウトを追加したり、UIを介してエントリーの表示方法を選択したりできます。 また、各カスタムオブジェクトの範囲を定義することもできます。

### エクスペリエンス管理でオブジェクト統合

オブジェクトは、Infoフレームワークを通じて表示ページと統合されます。 オブジェクトを作成すると、コレクションプロバイダーが自動的に生成され、コレクション表示フラグメントを介してオブジェクトエントリーのエクスペリエンスを作成できます。

### フォームとオブジェクトの統合

フォームの保存タイプをオブジェクトに変更することで、フォームのすべての機能を利用して、特定のオブジェクトにデータを挿入できます。

### オブジェクトリレーション

複雑なユースケースを [オブジェクトリレーション](../building-applications/objects/creating-and-managing-objects/relationships/defining-object-relationships.md) で解決することができます。カスタムオブジェクトだけでなく、ブログエントリーやWebコンテンツのようなLiferayに同梱されているネイティブオブジェクトとオブジェクトを関連付ける簡単な方法です。

### DXPフレームワークとのオブジェクト統合

Liferay Objectsは、アセット、ワークフロー、権限など、既存のLiferay DXPフレームワークと完全に統合されています。 オブジェクトが作成されると、そのオブジェクト固有のHeadless APIが自動的に作成され、Liferay APIエクスプローラーからアクセスすることができます。

### 検索ウィジェットのオブジェクトのサポート

タイプファセットウィジェットは、検索可能なLiferay Objectタイプをサポートしており、検索結果ウィジェットはオブジェクトエントリを表示することができます。

### コレクション表示フラグメントでのぺージネーションのサポート

コレクション表示フラグメントでコレクションアイテムをページ分割できるようになりました。 この新機能は、多数のアイテムを含むコレクションに特に有効です。 大規模なコレクションがより読みやすくなり、ユーザビリティと全体的なエクスペリエンスが向上します。

![You can now paginate collections in Collection Display Fragments.](./whats-new-74/images/11.png)

### コレクション表示のフラグメントの検索とフィルタリング

Liferay DXP 7.4には2つの新しいフラグメントが含まれています。［Collection Filter］と［Applied Filter］です。

これらのフィルターをコレクション表示フラグメントとともにページで使用すると、さまざまな基準に基づいてコレクションをフィルタリングし、コレクションにどのようなフィルターが適用されたかを表示することができます。

![New filters help users find data in collections.](./whats-new-74/images/05.png)

### 関連アイテムコレクションで、ある特定のアイテムに関連するアイテムを表示

コレクション表示フラグメントを使用する際に、新しい［Related Items Collection Providers ］タブを使用して、関連するコレクションからアイテムを選択して表示できるようになりました。

![Now it's easy to choose related items.](./whats-new-74/images/14.png)

### コレクションプロバイダのプレフィルタリングオプションの定義

開発者は、特定の構成フィールドを使用してコレクションプロバイダーをカスタマイズできるようになりました。 これにより、ユーザーはコレクションプロバイダーを事前にフィルタリングし、コレクション表示フラグメントのアイテムをより柔軟に選択できます。 ユーザーは、コレクション表示フラグメントの［Actions］メニューからフィルターにアクセスできます。

![Now you can pre-filter Collection providers.](./whats-new-74/images/12.png)

### マッピング要素としてコレクションプロバイダーのサブタイプフィールドの指定

Infoフレームワークでコレクションプロバイダーを構築する際に、開発者はサブタイプフィールドを含めることができます。 これにより、エンドユーザーは、コレクション表示フラグメントでコレクションプロバイダーを使用する際に、ページ上のフィールドをサブタイプにマッピングできます。

### ビューポートに基づいたフラグメントの表示/非表示

あるビューポートではフラグメントを非表示にし、別のビューポートでは表示したままにすることができます。 この新機能により、特定のユーザープラットフォーム向けにコンテンツの応答性をさらにカスタマイズすることができます。

![You can hide a Fragment on one Viewport while keeping it visible on another.](./whats-new-74/images/08.png)

### コンテンツページおよび表示ページテンプレートのアダプティブメディアのネイティブサポート

[コンテントページの画像にアダプティブメディア](../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#image-source-settings) を使用し、ターゲットの画面サイズに基づいて画像の解像度を動的に調整することが可能になりました。 [アダプティブメディアに画像解像度を追加](../content-authoring-and-management/documents-and-media/publishing-and-sharing/using-adaptive-media/adding-image-resolutions.md) した後、コンテントページの画像の［Resolution］のドロップダウンメニューに解像度が表示されます。

![Adaptive Media can now adjust image resolutions dynamically based on screen size.](./whats-new-74/images/13.gif)

## デジタルエクスペリエンスの立ち上げと維持のためのコストと労力の削減

### Webコンテンツの自動翻訳

この機能は、 [Webコンテンツの記事を翻訳する](../content-authoring-and-management/translating-pages-and-content/using-third-parties-for-translation.md) プロセスを加速するのに役立ちます。 これは、7.3で行われたコンテンツの翻訳プロセスを効率化するための取り組みを引き継いだものです。 この機能があれば、翻訳者は最初から翻訳を始めるのではなく、翻訳の質の向上に集中できます。

### ドキュメントの有効期限

この機能は、コンテンツ管理者が [古いドキュメントをコントロール](../content-authoring-and-management/documents-and-media/uploading-and-managing/using-file-expiration-and-review-dates.md) し、一時的なライセンスなどが原因でドキュメントが公開されるのを防ぐのに役立ちます。

### 改良されたWYSIWYGエディター

ネイティブCKEditorの機能を活用した新しいバルーンエディターが誕生しました。 これは、前身であるAlloy Editorに比べて軽量化されており、複雑さとメンテナンスが軽減されています。 また、ユーザー向けの機能を維持しつつ、いくつかのUXの改善も行っています。

### アセットライブラリとステージング可能なサイトとの連携が可能に

この機能により、データの分離が重要となる規制の厳しい分野のお客様のコンテンツの整理と再利用が向上します。

アセットライブラリにステージングサポートを導入することで、データの分離をしたまま、複数のサイトで同じコンテンツを使用する際に、コンテンツを整理するための労力とコストを削減することができます。 これは、7.3にもバックポートされています。

### ドキュメントやメディアをアップロードする際の高度ファイルアップローダーオプション

顧客は、後にコンテンツ作成に使用される要素を格納するためにドキュメントとメディアをメディアリポジトリとして利用します。 しかし、ブログ記事などの非公式なもので、コンテンツ作成時に使用したアセットをコンテンツ作成のプロセス中にアップロードされる場合があります。

このプロセスを加速するために、コンテンツ制作者はフォルダを作成したり、アイテムセレクターから必要なメタデータをすべて含んだファイルをアップロードしたりすることができるようになり、コンテンツ作成のプロセスの時間と労力を削減することができます。

### 公開でのコラボレーション

公開には、多くの場合、1つのプロジェクトに複数のコンテンツ編集者が関与します。 チームメンバーを公開に招待し、閲覧、編集、公開を行えるようにできます。 また、新しいコメントシステムで変更点を議論することもできます。 ワークフローを通過中のアイテムは、公開前に承認が必要です。

### ステージング性能の向上

ステージングでのページの公開は、ページの親や子を参照せずに必要なページだけを公開することで、効率化できるようになりました。 また、アセットリンクをページと一緒に公開するかどうかも選択できます。

### Elasticsearch 7.15.xとの互換性を即座に実現

Liferay DXP 7.4はElasticsearch 7.15.xをサポートしています。 [Elasticsearch Sidecar](../using-search/installing-and-upgrading-a-search-engine/elasticsearch/using-the-sidecar-or-embedded-elasticsearch.md) （開発およびテスト用で、サポートされていません）サーバーは、オープンソースのElasticserchディストリビューションのバージョン7.10.2です。

### Liferay Enterprise Search（LES）アプリケーションのバンドル

Liferay DXP 7.4より、 [Liferay Enterprise Search (LES)アプリケーション](../using-search/liferay-enterprise-search/activating-liferay-enterprise-search.md) は、すべてのLiferay DXPバンドルとDockerコンテナに含まれています。 LESはデフォルトで有効になっており、追加のインストール手順は必要ありません。 ただし、Liferayの公式サポートや追加特典を受けるためには、LESのアドオンサブスクリプションを購入する必要があります。 LESアプリケーションのメンテナンスとアップデートは、フィックスパックとサービスパックのリリースを通じて行われます。

## 相互接続された社内システムとしてのLiferay DXPの活用

### DXPアカウント

DXPアカウントでは、それぞれのエンティティ（企業、従業員、その職務に関する責任）をモデル化し、これらのエンティティ間の連携（商品やサービスの購入など）を促し、連携をサポートするための関連情報（Tax ID、請求先住所、発送先住所、人員構成など）を文書化することができます。

### どこにでもAPIを

Liferay DXPには、ユーザー管理、サイトページとエクスペリエンス、言語、権限、構造化コンテンツなどのためのRESTおよびGraphQL APIが含まれています。

### OAuth2の機能強化

登録したOAuth 2アプリケーションを信頼できるアプリケーションとして設定することで、トークン取得時の手動認証を回避することができます。

また、OAuth 2アプリケーションを登録することで、ユーザーが手動で行った認証をデバイスに記憶させることができます（例：「remember me」）。

登録したOAuth 2アプリケーションの既存の認証を、OAuth 2アプリケーションの一覧画面でワンクリックで取り消すことができます。

### 多要素認証におけるFIDO2ベースのハードウェアキーファクターサポート

ユーザーは、内蔵された多要素認証を利用して、 [一般的なデバイス（指紋リーダー、USBキー）を活用し](../installation-and-upgrades/securing-liferay/multi-factor-authentication/fast-identity-online-2.md) 、モバイル環境とデスクトップ環境の両方でオンラインサービスの認証を行うことができます。

### SAMLのデータ管理とメンテナンスの向上

属性マッピングのユーザーエクスペリエンスが向上したことで、SPユーザーの照合に利用される識別子の範囲や追跡のモデル化のコントロールができるようになりました。 IDP側でユーザーの`emailAddress`を変更することはもう問題ではない。 また、カスタムフィールドマッピングもオプションになりました。

また、完全な後方互換性もあります。SAMLインテグレーションを再設定するまでは、既存の動作が維持され、SPユーザーのUUIDフィールドをユーザーの目的以外に使用することはありません。

### チャット機能との統合

すぐに使える [数多くのチャットプラットフォーム](../site-building/personalizing-site-experience/enabling-automated-live-chat-systems.md) との統合が可能です。  インスタンスの設定で統合を有効にすると、ユーザーは自分の都合に合わせて担当者とチャットできるようになります。  別途、チャットプロバイダーの契約が必要となりますのでご注意ください。 OOTB統合できるチャットプロバイダーは以下の通りです。

* Chatwoot
* Crisp
* Hubspot
* JivoChat
* LiveChat
* Liveperson
* Smartsupp
* Tawk.to
* Tidio
* Zendesk

### DocuSignの統合

すぐに使える [DocuSignとの統合](../content-authoring-and-management/documents-and-media/uploading-and-managing/enabling-docusign-digital-signatures.md) が利用可能です。 インスタンス設定で統合を有効にすると、コントロールパネルのドキュメントとメディアと電子署名モジュールから、ユーザーはドキュメントを添付した電子署名用エンベロープをDocuSignに送信できるようになります。  ユーザーは、過去に送信した電子署名エンベロープのステータスを確認したり、署名済みのドキュメントをダウンロードしたりできます。 本機能のご利用には、別途DocuSigntとの契約が必要となります。
