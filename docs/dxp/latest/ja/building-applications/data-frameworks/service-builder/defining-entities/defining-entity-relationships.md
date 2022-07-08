# エンティティ関連の定義

ほとんどのアプリケーションでは、データベースエンティティまたはJavaオブジェクト間の関連が必要です。 例として、Liferayの掲示板アプリケーションを取り上げます。 各掲示板のメッセージは、特定の掲示板スレッドに属しています。 掲示板スレッドは、特定の掲示板カテゴリに属している場合もあります。

アプリケーションの[`service.xml`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/message-boards/message-boards-service/service.xml)ファイルで関連がどのように定義されているかを確認できます。

```xml
<entity external-reference-code="group" human-name="message-boards message" local-service="true" name="MBMessage" remote-service="true" trash-enabled="true" uuid="true">

    <!-- PK fields -->

    <column name="messageId" primary="true" type="long" />

    <!-- Group instance -->

    <column name="groupId" type="long" />

    <!-- Audit fields -->

    <column name="companyId" type="long" />
    <column name="userId" type="long" />
    <column name="userName" type="String" uad-anonymize-field-name="fullName" />
    <column name="createDate" type="Date" />
    <column name="modifiedDate" type="Date" />

    <!-- Other fields -->

    <column name="classNameId" type="long" />
    <column name="classPK" type="long" />
    <column name="categoryId" type="long" />
    <column name="threadId" type="long" />
    ...
```

この`MBMessage`オブジェクトで参照される`threadId`フィールドは、`MBThread`オブジェクトのプライマリーキーと同じ名前です（上記には示されていません）。 これにより、2つのオブジェクト間の関連が作成されます。 `categoryId`と`MBCategory`オブジェクトでも同様の関連が見られます。

これで、2つのエンティティを関連付ける方法がわかりました。 
