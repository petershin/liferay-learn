---
toc:
  - ./modeling-data-structures/determining-data-entities.md
  - ./modeling-data-structures/adding-fields-to-the-distributor-application-object.md
  - ./modeling-data-structures/adding-fields-using-rest-apis.md
  - ./modeling-data-structures/creating-picklists-for-distributor-applications.md
  - ./modeling-data-structures/creating-picklists-using-rest-apis.md
  - ./modeling-data-structures/adding-picklist-fields-to-the-object.md
  - ./modeling-data-structures/adding-a-custom-layout-and-view-to-distributor-application.md
  - ./modeling-data-structures/setting-up-the-application-evaluation-object.md
  - ./modeling-data-structures/adding-a-relationship-between-the-object-definitions.md
  - ./modeling-data-structures/adding-the-relationship-to-custom-layouts.md
  - ./modeling-data-structures/relating-object-entries.md
---
# データ構造のモデリング

アプリケーションを書く最初のステップは、そのデータ構造をモデル化することだ。 そのためには、書きたいアプリケーションについてブレインストーミングをする必要がある：

* 保存し、操作したいデータ・エンティティの種類を特定する。

* エンティティの各タイプに属性を追加する

* エンティティ・タイプ間の関係の定義

## データ・エンティティの特定

アプリケーションのデータ・エンティティを表す [オブジェクト定義](https://learn.liferay.com/en/w/dxp/building-applications/objects) を作成できます。 保険金請求、サポートチケット、商材など、さまざまなものがある。 カスタムオブジェクトを公開すると、Liferayはデータエントリを格納するためのデータベーステーブルを作成します。 また、CRUD操作を実行するためのヘッドレスAPIを生成し、基本的なフロントエンドを提供する。 Liferayオブジェクトを使用することで、堅牢かつ柔軟なソリューション基盤を構築し、組織固有のニーズをサポートすることができます。

## 属性の追加

属性は、テキストや数値など、アプリケーションの特定のタイプの情報を格納するデータベースのカラムを表します。 データモデルの属性を定義するには、 [フィールド](https://learn.liferay.com/en/w/dxp/building-applications/objects/creating-and-managing-objects/fields) をユーザー入力を受け取るためのオブジェクト定義に追加します。 さらに、 [ピックリスト](https://learn.liferay.com/en/w/dxp/building-applications/objects/picklists) を作成し、オブジェクトと共に使用することで、ユーザーに定義済みの単一選択フィールドと複数選択フィールドを提供することができます。

## 人間関係の定義

関係を定義することは、実世界のエンティティやその相互作用を正確に表現するデータモデルを作成するための鍵である。 リレーションシップを使用することで、開発者は、データがシステム内でどのように編成され、どのように接続されているかを判断し、エンティティの関連性や依存関係をより適切に把握することができる。 オブジェクト定義間には、1対多、多対多のリレーションシップを定義できます。 これらのリレーションシップは、各オブジェクトにエントリーを関連付けるためのフィールドやテーブルを追加し、異なるオブジェクトコンテキストでエントリーデータにアクセスできるようにします。

## ディストリビューターアプリケーションフローのモデリングオブジェクト

Delectable Bonsaiは、オンボーディング・フローのために2種類のデータ・エンティティを保存・管理しなければならない：

* ディストリビューター
* アプリケーション評価

<!--FINISH: ![](./modeling-data-structures/images/01.png) -->

各ディストリビューター・アプリケーションは、KYC（Know Your Customer）のベストプラクティスとAML（Anti-Money Laundering）法の遵守のために、各申請者の身元と信用を確認するために必要なビジネス情報を保存する必要があります。 さらに、各ディストリビューター候補の相対的な価値を評価するのに役立つ情報を収集しなければならない。

申請書の評価には、審査過程で作成されたメモや推奨事項を保存しておく必要がある。 また、ユーザーは各評価をアプリケーションに、各アプリケーションを複数の評価に関連付けることができなければならない。

このソリューションを実装するための最初のステップは、潜在的なディストリビューターからの申請を受け取り、管理するためのディストリビューター・アプリケーション・オブジェクトを作成することです。

準備完了?

[[続きはこちら](./modeling-data-structures/determining-data-entities.md)
