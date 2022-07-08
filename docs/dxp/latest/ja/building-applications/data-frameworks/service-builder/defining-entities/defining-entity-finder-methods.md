# エンティティファインダーメソッドの定義

ファインダーメソッドは、指定されたパラメーターに基づいてデータベースからエンティティオブジェクトを取得します。 定義されたファインダーごとに、Service Builderは、ファインダーのパラメーターに基づいてエンティティインスタンスを取得、検索、削除、およびカウントするためのいくつかのメソッドを生成します。

Liferayのマルチテナンシーをサポートする場合、サイトごとにエンティティを見つけることができることが重要です。

## ファインダーの作成

ファインダーは簡単に作成できます。

```xml
<finder name="GroupId" return-type="Collection">
   <finder-column name="groupId" />
</finder> 
```

上記の例は、最も単純なファインダーの1つであり、マルチテナンシーをサポートしている場合は常に追加する必要があります。 このファインダーは、アプリケーションが配置されたサイトに属するオブジェクトのコレクションを返します。 Service Builderは、`*Persistence`クラスと*PersistenceImpl</code>クラスのエンティティに対して、ファインダー関連のメソッド（たとえば、`fetchByGroupId`、`findByGroupId`、`removeByGroupId`、`countByGroupId`）を生成します。 これらのクラスのうち、最初のクラスはインターフェイス、2番目はその実装です。 たとえば、LiferayのBlogsアプリケーションは、[`blogs-api/src/main/java/com/liferay/blogs/service/persistence`](https://github.com/liferay/liferay-portal/tree/master/modules/apps/blogs/blogs-api/src/main/java/com/liferay/blogs/service/persistence)フォルダにある`-Persistence`クラスと[`blogs-service/src/main/java/com/liferay/blogs/service/persistence/impl`](https://github.com/liferay/liferay-portal/tree/master/modules/apps/blogs/blogs-service/src/main/java/com/liferay/blogs/service/persistence/impl)フォルダにある`-PersistenceImpl`クラスにエンティティファインダーメソッドを生成します。

ただし、1列で検索には限定されません。複数列のファインダーを作成できます。

```xml
<finder name="G_UT" return-type="BlogsEntry" unique="true">
    <finder-column name="groupId" />
    <finder-column name="urlTitle" />
</finder>
```

```{important}
エンティティのプライマリーキーをパラメーターとして使用するファインダーは作成しないでください。 Service Builderは、すべてのエンティティのプライマリーキーに対して`findByPrimaryKey`メソッドと`fetchByPrimaryKey`メソッドを自動的に生成するため、そのようなファインダーは不要です。 `*service`モジュールをデプロイすると、Service Builderはすべてのエンティティのプライマリーキー列とファインダー列にインデックスを作成します。 エンティティのプライマリーキーを使用するファインダーを追加すると、同じ列に複数のインデックスを作成しようとすることになります。Oracle DBなどは、これらの試行をエラーとして報告します。
```

このように、Service Builderを使用してエンティティのファインダーメソッドを作成することは複雑ではありません。 
