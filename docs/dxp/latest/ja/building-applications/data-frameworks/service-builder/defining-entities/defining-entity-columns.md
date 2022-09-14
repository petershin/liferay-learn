# エンティティ列の定義

エンティティの列はその属性を表します。 これらの属性は、テーブルフィールドをJavaオブジェクトフィールドにマップします。

ここでは、[Understanding Service Builder Generated Classes](../service-builder-basics/understanding-service-builder-generated-classes.md)にあるサンプルプロジェクトを検討し、列の詳細を学習します。

サンプルをダウンロードして解凍することから始めます。

   ```bash
   curl https://learn.liferay.com/dxp/latest/ja/building-applications/data-frameworks/service-builder/service-builder-basics/liferay-w9b7.zip -O
   ```

   ```bash
   unzip liferay-w9b7.zip
   ```

`w9b7-service/service.xml`ファイルを調べます：

```{literalinclude} ../service-builder-basics/understanding-service-builder-generated-classes/resources/liferay-w9b7.zip/w9b7-service/service.xml
:language: xml
```

エンティティの属性を追加するには、エンティティ定義に`<column />`タグを追加します。

```xml
<column name="w9b7EntryId" primary="true" type="long" />
```

Service Builderを実行すると、オブジェクトリレーショナルマッピングを処理するHibernate構成が生成されます。 Service Builderは、`service.xml`ファイルに追加する列ごとにデータベースフィールドを作成します。 各列に指定されたJavaタイプに適したデータベースフィールド型をマップし、Liferayがサポートするすべてのデータベースにわたってマッピングを行います。  Service Builderは、これらの属性のモデルクラスにgetter/setterメソッドも生成します。 列の`primary`（つまりプライマリーキー）属性が`true`に設定されている場合、その列はエンティティのプライマリーキーになります。 これは、[生成されたクラスの理解と拡張](../service-builder-basics/understanding-service-builder-generated-classes.md)にあるW9B7アプリケーションの場合です。 `primary`属性をtrueに設定して複数の列を定義する場合、列を組み合わせることでエンティティの複合プライマリーキーが構成されます。

```{note}
[Implementing an Add Method](../service-builder-basics/understanding-service-builder-generated-classes.md#adding-a-local-service-method) では、エンティティインスタンスの一意のプライマリーキーを生成する方法を示しています。
```

## エンティティの列を作成する

最初のエンティティに必要な列を定義します。 W9B7エンティティには、プライマリーキー、説明、および名前の3つの属性しかありません。

```xml
<column name="w9b7EntryId" primary="true" type="long" />

<column name="description" type="String" />
<column name="name" type="String" />
```

```{note}
`*service`モジュールをデプロイすると、Service Builderはすべてのエンティティのプライマリーキーのインデックスを自動的に生成します。
```

アプリケーションで使用するJavaタイプを使用して、1つまたは複数のエンティティの属性ごとに列を作成します。 Service BuilderがSQLへのマッピングを処理します。

## マルチテナンシーをサポートする

エンティティのプライマリーキーと属性の列に加えて、ポータルインスタンスIDとサイトIDの列を追加します。 次に、Liferayのマルチテナンシー機能をサポートすることで、各ポータルインスタンスとポータルインスタンス内の各サイトが、アプリケーションのデータの独立したセットを持つことができるようになります。 サイトのIDを保持するには、`long`型の`groupId`という列を追加します。 ポータルインスタンスのIDを保持するには、`long`型の`companyId`という列を追加します。

```xml
<!-- Group instance -->

<column name="groupId" type="long" />
<column name="companyId" type="long" />
```

## ワークフローフィールド

エンティティの進行状況を追跡するために必要なフィールドを追加することで、Liferayの [ワークフローシステム](https://learn.liferay.com/dxp/latest/en/process-automation/workflow/introduction-to-workflow.md) をサポートできます。

```xml
<!-- Status fields -->

<column name="status" type="int" />
<column name="statusByUserId" type="long" />
<column name="statusByUserName" type="String" />
<column name="statusDate" type="Date" />
```

## 監査エンティティ

最後に、エンティティの監査に役立つ列を追加できます。 各エンティティインスタンスの所有者を追跡するために、`long`型の`userId`という列を追加します。 エンティティインスタンスの作成日を記録するために、`Date`型の`createDate`という名前の列を作成します。 エンティティインスタンスが最後に変更された時刻を追跡するために、`Date`型の`modifiedDate`という名前の列を追加します。

```xml
<!-- Audit fields -->

<column name="userId" type="long" />
<column name="userName" type="String" />
<column name="createDate" type="Date" />
<column name="modifiedDate" type="Date" />
```

エンティティには、属性を表す列だけでなく、マルチテナンシー、ワークフロー、および監査をサポートする列もあります。
