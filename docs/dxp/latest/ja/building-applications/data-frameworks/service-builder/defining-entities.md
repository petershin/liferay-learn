---
toc:
- ./defining-entities/configuring-global-service-options.md
- ./defining-entities/defining-entity-columns.md
- ./defining-entities/modifying-database-fields-in-development.md
- ./defining-entities/defining-entity-relationships.md
- ./defining-entities/sorting-entity-instances.md
- ./defining-entities/defining-entity-finder-methods.md
- ./defining-entities/adding-model-hints.md
---
# エンティティの定義

エンティティはサービスの最も重要な部分です。 エンティティは、Javaのモデルオブジェクトとデータベースフィールドおよびテーブルの間のマップを表します。 [サービスビルダー](../service-builder.md) は、Javaモデルを定義したエンティティに自動的にマップし、Javaオブジェクトを永続化する機能を提供します。 [モデルコード、永続性コード、およびサービスコードの生成](./service-builder-basics/generating-model-persistence-and-service-code.md) にあるY7G4サンプルプロジェクトについて検討します。 エンティティの概要は次のとおりです。

* **名前** : `Y7G4Entry`
* **ローカルサービス：** **yes**
* **リモートサービス：** **no**

エンティティを定義する方法は次のとおりです。

```xml
<entity local-service="true" name="Y7G4Entry" remote-service="false">
</entity>
```

エンティティのデータベーステーブル名には、名前空間のプレフィックスが付いたエンティティ名が含まれます。 Y7G4の例では、`Y7G4_Y7G4Entry`という名前のデータベーステーブルが1つ作成されます。

ローカルサービス（`local-service`属性）を`true`に設定すると、エンティティのサービスのローカルインターフェイスが生成されます。 ローカルサービスは、それらがデプロイされているLiferayサーバーからのみ呼び出すことができます。

リモートサービス（`remote-service`属性）を`true`に設定すると、サービスのJSONベースのリモートインターフェイスが生成されます。 これらはRESTサービスではありません。 そのためには、[REST Builder](../../../headless-delivery/apis-with-rest-builder/producing-and-implementing-apis-with-rest-builder.md)を使用する必要があります。 エンティティのローカルサービスを`true`に設定し、リモートサービスを`false`に設定することで、リモートサービスを生成せずに完全に機能するアプリケーションを構築できます。 ただし、アプリケーションのサービスへのリモートアクセスを有効にする場合は、ローカルサービスとリモートサービスの両方を`true`に設定します。

```{tip}
JPAなどの他のフレームワークを使用して構築されたエンティティの既存のデータアクセスオブジェクト（DAO）サービスがある場合は、ローカルサービスを``false``に設定し、リモートサービスを``true``に設定して、リモートの``-Impl``クラスのメソッドが既存のDAOのメソッドを呼び出すようにできます。 これにより、Liferayの権限チェックシステムとの統合が容易になり、Service Builderによって生成されたWebサービスAPIにアクセスできるようになります。 これは、Liferayの非常に便利で強力な、よく使用される機能です。
```
