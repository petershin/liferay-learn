# Search Experiences

```{toctree}
:maxdepth: 1

search-experiences/understanding-search-blueprints.md
search-experiences/creating-and-managing-search-blueprints.md
search-experiences/using-a-search-blueprint-on-a-search-page.md
search-experiences/personalizing-the-search-experience.md
search-experiences/search-blueprints-elements-reference.md
search-experiences/search-blueprints-configuration-reference.md
search-experiences/creating-and-managing-elements.md
```

> **Liferay Enterprise Search（LES）サブスクライバー**

Liferay Enterprise Search Experiencesアプリには、エンドユーザーの検索体験をきめ細かくコントロールするための機能群が含まれています。 検索管理者は、Search Experiencesを使用して、さまざまな複雑な検索カスタマイズを行うことができます。

- Liferayのデフォルトの検索ページの動作を微調整します
- 検索ページの動作を完全にオーバーライドします
- 検索ユーザーの属性に応じたコンテキストアウェアな検索結果の構成

## ブループリントの検索

検索ブループリントは、Search Experiencesアプリケーションの最初の機能です。 その機能と基本的な構成要素については、以下を参照してください。

- [検索ブループリントの理解](./search-experiences/understanding-search-blueprints.md)
- [検索ブループリントの作成と管理](./search-experiences/creating-and-managing-search-blueprints.md)
- [検索ブループリントを検索ページで使用する](./search-experiences/using-a-search-blueprint-on-a-search-page.md)
- [Search Experiencesのパーソナライズ](./search-experiences/personalizing-the-search-experience.md)
- [検索ブループリント要素のリファレンス](./search-experiences/search-blueprints-elements-reference.md)
- [検索ブループリント 構成リファレンス](./search-experiences/search-blueprints-configuration-reference.md)
- [エレメントの作成](./search-experiences/creating-and-managing-elements.md)

## Liferay Search Experiencesの取得

Liferay Search Experiences は、Liferay DXP 7.3 および 7.4 で [Liferay Enterprise Search](../liferay-enterprise-search.md) サブスクリプションを持つ Liferay DXPのお客様に提供される予定です。

* Liferay DPX 7.4 Update 5（アップデートの詳細は[こちら](../../../installation-and-upgrades/maintaining-a-liferay-installation/updating-liferay.md)）から、Search Experiencesは他のLESアプリと同様にバンドルアプリケーションとして提供されるようになりました。
* Liferay DXP 7.3では、Search Experiencesはアドオンアプリケーションとしてカスタマーポータルを通じてLESサブスクライバーに提供されます。 [ Liferay DXP 7.3のLiferay Enterprise Search](https://customer.liferay.com/downloads/-/download/liferay-enterprise-search-for-liferay-dxp-7-3) で利用可能かをご確認ください。

## Search Experiences REST API

Search Experiencesアプリケーションは、Liferayの他のネイティブアプリケーションと一貫性を保つために、REST APIエンドポイント（パス `search-experiences-rest`以下）を公開、消費しています。

```{warning}
サードパーティのコードは不安定な為、Search Experiences APIを使用することは推奨しません。これには `/search` エンドポイントも含まれ、これは [Blueprints preview feature] (./search-experiences/creating and-managing-search-blueprints.md#testing-a-blueprint-with-the-preview-sidebar) によってのみ使用することを想定しています。 スキーマの変更は機能の進化に伴って起こることが予想され、LiferayはSearch Experiences APIを使用するカスタムコードをサポートしません。 この判断は、将来的にAPIが安定するにつれて変わる可能性があります。
```
