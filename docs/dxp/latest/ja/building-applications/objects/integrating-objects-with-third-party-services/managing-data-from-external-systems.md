# 外部システムからのデータ管理

{bdg-link-primary}` [ベータ機能](../../../システム管理/configuring-liferay/feature-flags.md#beta-feature-flags) `

Liferay Objectsは、データ構造をモデリングし、Liferay DXPと統合されたビジネスロジックを実装するためのローコード機能を提供します。 このフレームワークを使用すると、カスタムワークフロー、バリデーション、通知などのユーザーエクスペリエンスを作成できます。

デフォルトでは、オブジェクト定義はLiferayのデータベースにエントリーデータを格納するためのテーブルを作成します。 ただし、Salesforce などの外部データソースからデータを保存および取得するために、プロキシとして機能するようにオブジェクトを構成することもできます。

システム間でデータを複製・同期するのではなく、プロキシストレージタイプはLiferayの外部にある単一のデータソースを使用します。 これにより、システム間のデータの不整合や競合を減らすことができる。 この問題に対する別のアプローチは、高価で複雑なカスタムソリューションを伴う可能性がある。 プロキシオブジェクトを使用することで、Liferayのローコード機能を活用し、タッチポイントを合理化し、データ管理を簡素化しながら、一貫したユーザーエクスペリエンスをより簡単に提供することができます。

プロキシオブジェクトでは、フィールドは外部システムのデータベースの既存の列にマッピングされるため、データ操作は直接外部システムで資産を作成または更新します。 例えば、ユーザがオブジェクトエントリを作成すると、Liferayは外部システムのAPIエンドポイントへのPOSTリクエストを実行し、そのシステムのデータベースにデータを追加します。

```{important}
このデータはLiferayのデータベースで永続化されないので、プロキシオブジェクトにはいくつかの制限があります。 ユーザーは 

* フィールドの追加 [検証](../creating-and-managing-objects/validations.md)

* オブジェクトの追加 [関連](../creating-and-managing-objects/relationships.md)

* [Index](../../..../using-search/search-administration-and-tuning/search-administration.md#index-actions) のデータをLiferayを通して

これらの制限に加え、プロキシオブジェクトは標準オブジェクトと同じプラットフォーム統合を共有します。 詳しくは[Understanding Object Integrations](../understanding-object-integrations.md)を参照。
```

## Liferay でプロキシオブジェクトデータを扱う

標準のオブジェクト定義と同様に、Liferay DXPでプロキシオブジェクトデータを使用して、ダイナミックなユーザーエクスペリエンスを作成することができます。 一度定義すると、Liferay のページビルダー機能や [クライアント拡張](../../client-extensions.md)などを使用して、プロキシオブジェクトデータにアクセスして表示することができます。

例えば、オブジェクトデータの表示ページの作成、コレクション表示でのデータ表示、エントリー値のフラグメント要素へのマッピングなどがあります。

## プロキシ・オブジェクトでサポートされているコネクター

現在、Liferay にはプロキシオブジェクト用の Salesforce への [beta](../../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags) コネクタが含まれています。 これを使用すると、プロキシオブジェクトを [カスタム Salesforce オブジェクト](https://help.salesforce.com/s/) と統合し、Salesforce を外部ストレージシステムとして使用できます。

この機能を使用するには、Proxy Object (LPS-135430) [機能フラグ](../../../system-administration/configuring-liferay/feature-flags.md)を有効にします。

## 関連トピック

* [オブジェクト統合を理解する](../understanding-object-integrations.md)
* [ベータ機能フラグ](../../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)
