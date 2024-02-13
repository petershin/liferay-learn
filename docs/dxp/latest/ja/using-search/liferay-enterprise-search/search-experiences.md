---
toc:
- ./search-experiences/search-blueprints.md
- ./search-experiences/semantic-search.md
---
# 検索エクスペリエンス

{bdg-primary}`[LES Subscription](./activating-liferay-enterprise-search.md)`
{bdg-secondary}`DXP 7.4 U5+; 7.3 U6+`

Liferay Enterprise Search Experiencesアプリには、エンドユーザーの検索体験をきめ細かくコントロールするための機能群が含まれています。

## ブループリントの検索

[ブループリントの検索](./search-experiences/search-blueprints.md) は、Search Experiences アプリケーションの最初の機能です。 これを使えば、以下のことができます。

- Liferayのデフォルトの検索ページの動作を微調整します
- 検索ページの動作を完全にオーバーライドします
- 検索ユーザーの属性に応じたコンテキストアウェアな検索結果の構成

## セマンティック検索

{bdg-link-primary}`[ベータ版機能](../../system-administration/configuring-liferay/feature-flags.md)`

[セマンティックサーチ](./search-experiences/semantic-search.md) インデックスコンテンツとユーザーの自然言語検索フレーズを機械学習モデルで解析することで、検索意図をより反映した結果を得られるようにします。

## Liferay Search Experiencesの取得

Liferay Search Experiences は、Liferay DXP 7.3 では [Liferay Enterprise Search](../liferay-enterprise-search.md) のサブスクリプションで、Liferay 7.4 では [Liferay DXP にバンドルされている Liferay DXP のお客様にご利用いただけます](./activating-liferay-enterprise-search.md). 詳しくは、 [LES Compatibility Matrix](https://help.liferay.com/hc/ja/articles/360016511651#DXP-7.3-LES) をご確認ください：

| バージョンアップの可否       | インストール方法                                                                                                                    | フィックス配信方法                                                                                          |
|:----------------- |:--------------------------------------------------------------------------------------------------------------------------- |:-------------------------------------------------------------------------------------------------- |
| DXP 7.4 Update 5+ | [バンドルされ、活性化される](activating-liferay-enterprise-search.md)                                                                    | [DXPの最新情報](../../installation-and-upgrades/maintaining-a-liferay-installation/updating-liferay.md) |
| DXP 7.3 Update 6+ | [](https://customer.liferay.com/downloads/-/download/liferay-enterprise-search-for-liferay-dxp-7-3) をダウンロードし、インストール(以下の手順）。 | アプリのリリース                                                                                           |


Liferay DXP 7.3では、Search ExperiencesはLES契約者のアドオンアプリケーションとして利用できます：
1. [カスタマーポータル](https://customer.liferay.com/downloads/-/download/liferay-enterprise-search-for-liferay-dxp-7-3) からアプリをダウンロードします。
1. Liferay DXPにアプリケーションをインストールする。
   * Liferayバンドルを実行している場合、LPKGを `[Liferay Home]/deploy` フォルダにコピーします。 Liferay が起動していない場合は、Liferay を起動する前に `[Liferay Home]/osgi/marketplace` に直接コピーすることができます。
   * Liferay Dockerコンテナを実行している場合、 [サポートされている方法のいずれかでLPKGをインストールしてください](../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/installing-apps-and-other-artifacts-to-containers.md).

## Search Experiences REST API

Search Experiencesアプリケーションは、Liferayの他のネイティブアプリケーションと一貫性を保つために、REST APIエンドポイント(パス `search-experiences-rest`以下）を公開、消費しています。

```{warning}
これには、 [Blueprints プレビュー機能](./search-experiences/search-blueprints/creating-and-managing-search-blueprints.md#testing-a-blueprint-with-the-preview-sidebar) でしか使用しないことを意図した `/search` エンドポイントも含まれています。 スキーマの変更は機能の進化に伴って起こることが予想され、LiferayはSearch Experiences APIを使用するカスタムコードをサポートしません。 この判断は、将来的にAPIが安定するにつれて変わる可能性があります。
```
