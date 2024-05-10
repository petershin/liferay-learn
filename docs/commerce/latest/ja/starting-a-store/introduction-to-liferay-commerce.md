# Liferay Commerceの概要

Liferay Commerce へようこそ！  Liferay Commerceは、あらゆるB2B組織の困難で複雑なニーズを満たすためにゼロから構築されたデジタルコマースプラットフォームです。 Liferay DXPのエンタープライズ基盤を使用して、Liferay Commerceは、完全に統合されたWebコンテンツ管理と業界をリードするポータル機能の能力と柔軟性を備えています。 Liferay DXPの詳細については、 [はじめに](https://learn.liferay.com/w/dxp/getting-started) をクリックしてください。

## 概要

* [最新のストアフロントページとコンテンツ管理](#modern-storefront-pages-and-content-management)
* [マルチチャネルカタログと商品情報管理](#multi-channel-catalog-and-product-information-management)
* [B2Bに焦点を当てたアカウント管理と購入ワークフロー](#b2b-focused-account-management-and-purchasing-workflow)
* [注文管理と販売](#order-management-and-sales)
* [MLを利用した推奨事項とアラート](#ml-powered-recommendations-and-alerts)
* [APIと統合](#apis-and-integrations)
* [次のステップ](#next-steps)

開始する準備は整いましたか？ [ Liferay Commerce Dockerイメージの使用](../installation-and-upgrades/installing-commerce-2-1-and-below/using-the-liferay-commerce-docker-image.md) してLiferay Commerce **を迅速に起動します** 。

## 最新のストアフロントページとコンテンツ管理

Liferay Commerceには、ストアフロントをセットアップするための幅広いツールが含まれています。 たとえば、新しい検索ツールは商品カタログ専用に設計されていますが、カスタマイズ可能なウィジェットを使用すると、CheckoutやView Cartなどの一般的なUI要素をページに簡単に追加できます。 詳しくは、[Building a Storefront](../creating-store-content/creating-your-storefront.md)をご覧ください。

![Liferay Commerceダッシュボード](./introduction-to-liferay-commerce/images/01.png)

## マルチチャネルカタログと商品情報管理

Liferay Commerceには、さまざまな商品タイプをサポートし、さまざまな商品データを保存するカタログ管理システムが含まれています。 [商品オプション](../product-management/creating-and-managing-products/products/using-product-options.md)、 [価格](../pricing/introduction-to-pricing.md)、 [画像](../product-management/creating-and-managing-products/products/product-images.md)、及び [仕様](../product-management/creating-and-managing-products/products/specifications.md) がいくつかの例です。 商品は、選択した流通チャネルですぐに利用できます。

![商品カタログ](./introduction-to-liferay-commerce/images/02.png)

[チャネル](../store-management/channels/introduction-to-channels.md) は、カタログおよび商品を、商品が販売される任意の場所に接続します。Liferay Commerceベースのストアフロント、サードパーティのマーケットプレイス、またはバックオフィスの電話販売です。

![商品に対して有効なチャネル](./introduction-to-liferay-commerce/images/03.png)

[カテゴリー](../product-management/creating-and-managing-products/products/organizing-your-catalog-with-product-categories.md)と[商品の関係](../product-management/creating-and-managing-products/products/related-products-up-sells-and-cross-sells.md)により、店舗のナビゲーションが簡素化され、収益を生み出す機会が増えます。

![商品詳細と関連商品](./introduction-to-liferay-commerce/images/04.png)

[価格表](../pricing/creating-a-price-list.md) と [段階的価格設定](../pricing/using-price-tiers.md) を使用することにより、商品の価格設定を柔軟に管理できます。これらはすべて、固有の顧客のニーズに合わせて調整できます。

## B2Bに焦点を当てたアカウント管理と購入ワークフロー

Liferay Commerceは、B2Bニーズに対応するように設計された機能により、企業間取引向けに最適化されています。 [アカウント](../users-and-accounts/account-management.md)、 [アカウントグループ](../users-and-accounts/account-management/creating-a-new-account-group.md)、および [アカウントロール](../users-and-accounts/account-management/account-roles.md)が連携し、顧客のニーズに合ったエクスペリエンス、セルフサービス、および購入ワークフローを提供します。

![ユーザーロールの選択](./introduction-to-liferay-commerce/images/05.png)

## 注文管理と販売

Liferay Commerceは、買い手と売り手が注文の準備、発注、承認、送信、および実行を可能にする注文管理を提供します。

注文の支払いは、デフォルトで利用可能ないくつかの異なる [支払方法](../store-management/configuring-payment-methods/managing-payment-methods.md)で完了できます。 追加のカスタマイズにより、より多くの決済処理業者との統合を実現できます。

![支払方法ページ](./introduction-to-liferay-commerce/images/06.png)

注文は、いくつかの異なる[配送方法](../store-management/configuring-shipping-methods/shipping-method-reference.md)を使用することができます： 売り手は[一律料金を課す](../store-management/configuring-shipping-methods/using-the-flat-rate-shipping-method.md)ことができ、[配送方法の制限](../store-management/configuring-shipping-methods/applying-shipping-method-restrictions.md)を適用でき、また[FedExのような配送業者](../store-management/configuring-shipping-methods/using-the-fedex-shipping-method.md)と統合することができます。

## MLを利用した推奨事項とアラート

Liferay Commerceは、機械学習と予測分析を適用して、提案された商品グループ、商品レベルまでの注文予測、スマートロイヤルティスコアアラート、パーソナライズされた商品推奨を可能にします。

## APIと統合

Mulesoftコネクタ、Talendコンポーネント、またはSalesforce、SAP ERP（**Coming Soon**）、またはMS Dynamics NAV（**Coming Soon**）のビルド済みコネクタを使用して、他のビジネスシステムと統合します。

## 次のステップ

* [インストールの概要](../installation-and-upgrades/installation-overview.md)
* [Liferay Commerce Dockerイメージの使用](../installation-and-upgrades/installing-commerce-2-1-and-below/using-the-liferay-commerce-docker-image.md)
* [Minium Acceleratorを使用して完全なB2Bサイトをセットアップ](../starting-a-store/using-the-minium-accelerator-to-jump-start-your-b2b-store.md)
