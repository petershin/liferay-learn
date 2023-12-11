---
toc:
  - ./setting-up-and-creating-products/creating-and-configuring-channels.md
  - ./setting-up-and-creating-products/configuring-workflows-and-notifications.md
  - ./setting-up-and-creating-products/creating-and-configuring-warehouses.md
  - ./setting-up-and-creating-products/creating-and-configuring-catalogs.md
  - ./setting-up-and-creating-products/creating-products.md
---
# 製品の設定と作成

カイルとダミアンは、B2BとB2Cの店舗に必要なチャネル、カタログ、商品を作るためにあなたの助けを必要としている。 管理者のカイルはチャンネルの作成を担当し、カテゴリーマネージャーのダミアンはカタログの作成、商品の作成、価格の設定、在庫の追加を担当する。

![The relation between channels, catalogs, products, and warehouses.](./setting-up-and-creating-products/images/01.png)

_チャンネル_はLiferayインスタンスにスコープされます。 チャネルとは、顧客ポータル、B2Bマーケットプレイス、バックオフィスの電話販売など、製品を販売するための手段を指す。 Liferayサイトで商品を販売するには、まずチャンネルにリンクする必要があります。 クラリティには、消費者向けの店舗と法人向けの店舗がある。 これをサポートするために、2つのチャンネルを作成し、対応するサイトにリンクします。 その後、2つのサプライヤー・チャネルも作成する。 これにより、クラリティのサプライヤーは自分の注文を簡単に表示・管理できるようになります。

*カタログ*はLiferayインスタンスにスコープされ、製品情報を格納します。 カタログの名前、デフォルト通貨、基本価格リスト、基本プロモーションリストのような基本的なパラメータを設定し、必要に応じてサプライヤーアカウントにリンクすることもできます。 クラリティが提供するすべての製品を収納するカタログを1つ作成します。 後で、2つの異なるサプライヤーの製品を含む2つのサプライヤー・カタログを作成します。 複数のカタログの商品を含む注文をすると、自動的に分割されます。 これによって、サプライヤーは自分たちの注文をこなし、クラリティは自分たちの注文をこなすことができる。

_製品_はカタログにスコープされます。 カタログとチャネルには直接的な関係はないため、製品を適切なチャネルに表示するように設定する必要があります。 複数のカタログの商品を同じチャンネルに表示することができます。 複数の商品、SKUを作成し、それらを設定し、在庫、価格、およびその他の必要な情報を追加します。

_倉庫_は、製品在庫を保管する物理的な場所を表す。 1つは業務用と消費者用の両方の注文に対応する倉庫、もう1つは業務用の注文のみに対応する倉庫です。 そのためには、メインの倉庫をB2BとB2Cの両方のチャネルにリンクさせ、2つ目の倉庫はB2Bチャネルのみにリンクさせる。

このモジュールを修了すると

* さまざまな製品を含む製品カタログ
* チャンネルを設定し、両サイトにリンク
* 支払い方法と配送方法の設定
* オンライン・ストアにサービスを提供する倉庫

準備完了?

[行こう！](./setting-up-and-creating-products/creating-and-configuring-channels.md) 
