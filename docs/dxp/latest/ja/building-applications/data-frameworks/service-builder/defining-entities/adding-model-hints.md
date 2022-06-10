# モデルヒントの追加

Service Builderを使用してモデルエンティティを定義したら、ユーザーがそのデータを入力する方法を改善したい場合があります。 モデルヒントは、エンティティデータの制限とその他のフォーマットを指定します。 たとえば、モデルヒントでは、将来のみ選択可能な日付を含むカレンダーフィールドを定義できます。

モデルヒントは、`portlet-model-hints.xml`というファイルで定義します。 `portlet-model-hints.xml`ファイルは、サービスモジュールの`src/main/resources/META-INF`フォルダに入ります。

モデルヒントは次の2つのことを定義します。

1. エンティティがユーザーに提示される方法

1. データベース列のサイズ

Liferayはフォーム項目をレンダリングするときに、構成に基づいてフォームの入力フィールドをカスタマイズします。

```{note}
依存性注入としてSpringを選択した場合、Service Builderは、サービスモジュールの `src/main/resources/META-INF` フォルダに多数のXML構成ファイルを生成します。 Service Builderは、これらのファイルのほとんどを使用して、SpringおよびHibernateの構成を管理します。 SpringまたはHibernateの構成ファイルは変更しないでください。それらへの変更は、Service Builderの実行時に上書きされます。 ただし、`portlet-model-hints.xml` ファイルは安全に編集できます。
```

例として、 [ブログアプリサービスモジュールの](https://github.com/liferay/liferay-portal/blob/master/modules/apps/blogs/blogs-service/src/main/resources/META-INF/portlet-model-hints.xml) モデルヒントファイルを考えてみましょう。

```xml
<?xml version="1.0"?>

<model-hints>
    <model name="com.liferay.blogs.model.BlogsEntry">
        <field name="mvccVersion" type="long" />
        <field name="ctCollectionId" type="long" />
        <field name="uuid" type="String" />
        <field name="externalReferenceCode" type="String" />
        <field name="entryId" type="long" />
        <field name="groupId" type="long" />
        <field name="companyId" type="long" />
        <field name="userId" type="long" />
        <field name="userName" type="String" />
        <field name="createDate" type="Date" />
        <field name="modifiedDate" type="Date" />
        <field name="title" type="String">
            <hint name="max-length">255</hint>
            <sanitize content-type="text/plain" modes="ALL" />
            <validator name="required" />
        </field>
        <field name="subtitle" type="String">
            <hint-collection name="TEXTAREA" />
        </field>
        <field name="urlTitle" type="String">
            <hint name="max-length">255</hint>
        </field>
        <field name="description" type="String">
            <hint-collection name="TEXTAREA" />
            <hint name="display-width">350</hint>
        </field>
        <field name="content" type="String">
            <hint-collection name="CLOB" />
            <sanitize content-type="text/html" modes="ALL" />
        </field>
        <field name="displayDate" type="Date" />
        <field name="allowPingbacks" type="boolean" />
        <field name="allowTrackbacks" type="boolean" />
        <field name="trackbacks" type="String">
            <hint-collection name="CLOB" />
        </field>
        <field name="coverImageCaption" type="String">
            <hint-collection name="TEXTAREA" />
            <sanitize content-type="text/html" modes="ALL" />
        </field>
        <field name="coverImageFileEntryId" type="long" />
        <field name="coverImageURL" type="String">
            <hint-collection name="URL" />
        </field>
        <field name="smallImage" type="boolean" />
        <field name="smallImageFileEntryId" type="long" />
        <field name="smallImageId" type="long" />
        <field name="smallImageURL" type="String">
            <hint-collection name="URL" />
            <hint name="display-width">210</hint>
        </field>
        <field name="lastPublishDate" type="Date" />
        <field name="status" type="int" />
        <field name="statusByUserId" type="long" />
        <field name="statusByUserName" type="String" />
        <field name="statusDate" type="Date" />
    </model>
</model-hints>
```

ルートレベルの要素は`model-hints`です。 モデルエンティティは、`model-hints`要素の`model`サブ要素によって表されます。 各`model`要素には、完全修飾クラス名を指定する`name`属性が必要です。 モデルには、エンティティの列を表す `field`要素があります。 最後に、`field`要素には名前とタイプが必要です。 各`field`要素の名前とタイプは、サービスモジュールの`service.xml`ファイルのエンティティの列に指定された名前とタイプにマップされます。 Service Builderは、`service.xml`に基づいて、これらすべての要素を生成します。

フィールドにヒントを追加するには、`hint`子要素を追加します。 たとえば、`display-width hint`を追加して、フィールドの表示に使用するピクセル幅を指定できます。 デフォルトのピクセル幅は`350`です。 50ピクセルの`String`フィールドを表示するには、`display-width`という名前の`hint`要素をネストして値`50`を指定します。

フィールドに対するヒントの効果を確認するには、 [Service Builderを再度実行](../service-builder-basics/generating-model-persistence-and-service-code.md#generate-the-persistence-code) して、

モジュールを再デプロイします。 `display-width`を変更しても、ユーザーが`name`フィールドに入力できる文字数は制限されないことに注意してください。入力フォームのフィールドの幅のみが制御されます。</p> 

モデルフィールドのデータベース列の最大サイズ（つまり、フィールドに保存できる最大文字数）を構成するには、`max-length`ヒントを使用します。 デフォルトの`max-length`値は、`75`文字です。 `name`フィールドを最大100文字まで保持する場合は、そのフィールドに`max-length`ヒントを追加します。



```xml
<field name="name" type="String">
    <hint name="display-width">50</hint>
    <hint name="max-length">100</hint>
</field>
```


`portlet-model-hints.xml`ファイルを更新した後にService Builderを実行してプロジェクトを再デプロイすることを忘れないでください。



## モデルヒントのタイプ

次の表に、使用可能なポートレットモデルのヒントを示します。

**モデルヒントの値と説明**

| 名称                  | 値のタイプ | 説明                                                     | デフォルト      |
| ------------------- |:----- |:------------------------------------------------------ |:---------- |
| `auto-escape`       | ブール値  | `HtmlUtil.escape`を介してテキスト値をエスケープするかどうかを設定します           | true       |
| `autoSize`          | ブール値  | スクロール可能なテキストエリアにフィールドを表示します                            | false      |
| `day-nullable`      | ブール値  | 日付フィールドで日をnullにすることができます                               | false      |
| `default-value`     | 文字列   | aui taglibを使用してレンダリングされたフォーム項目のデフォルト値を設定します            | （空のString） |
| `display-height`    | 整数    | aui taglibを使用してレンダリングされたフォーム項目の表示高さを設定します              | 15         |
| `display-width`     | 整数    | aui taglibを使用してレンダリングされたフォーム項目の表示幅を設定します               | 350        |
| `editor`            | ブール値  | 入力用のエディターを提供するかどうかを設定します                               | false      |
| `max-length`        | 整数    | SQLファイル生成の最大列サイズを設定します                                 | 75         |
| `month-nullable`    | ブール値  | 日付フィールドで月をnullにすることができます                               | false      |
| `secret`            | ブール値  | ユーザーが入力した文字を非表示にするかどうかを設定します                           | false      |
| `show-time`         | ブール値  | 日付とともに時刻を表示するかどうかを設定します                                | true       |
| `upper-case`        | ブール値  | すべての文字を大文字に変換します                                       | false      |
| `year-nullable`     | ブール値  | 日付フィールドの年をnullにすることができます                               | false      |
| `year-range-delta`  | 整数    | aui taglibでレンダリングされた日付フィールドに今日の日付から何年後まで表示するかを年数で指定します | 5          |
| `year-range-future` | ブール値  | 将来の日付を含めるかどうかを設定します                                    | true       |
| `year-range-past`   | ブール値  | 過去の日付を含めるかどうかを設定します                                    | true       |




```{note}
aui taglibは完全にサポートされており、廃止予定のAlloyUI（JavaScriptライブラリ）とは関係ありません。
```




```{note}
1つのフォームでClayタグとauiタグを組み合わせて使用できます。 ただし、モデルヒントはauiタグにのみ影響します。
```


LiferayDXP/Portalには独自のモデルヒントのファイル [`portal-model-hints.xml`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/META-INF/portal-model-hints.xml) があることに注意してください。 これは、`portal-impl.jar`の`META-INF`フォルダにあります。 このファイルには多くのヒントの例が含まれているため、`portlet-model-hints.xml`ファイルを作成するときに参照できます。



## デフォルトのヒント

`default-hints`要素を使用して、モデルのすべてのフィールドに適用するヒントのリストを定義できます。 たとえば、モデル要素内に次の要素を追加すると、各フィールドに300ピクセルの`display-width`が適用されます。



```xml
<default-hints>
    <hint name="display-width">300</hint>
</default-hints>
```




## ヒントコレクション

`model-hints`のルートレベル要素内に`hint-collection`要素を定義して、一緒に適用するヒントのリストを定義できます。 ヒントコレクションには名前が必要です。 たとえば、Liferayの`portal-model-hints.xml`は、次のヒントコレクションを定義しています。



```xml
<hint-collection name="CLOB">
    <hint name="max-length">2000000</hint>
</hint-collection>
<hint-collection name="EDITOR">
    <hint name="editor">true</hint>
    <hint name="max-length">2000000</hint>
</hint-collection>
<hint-collection name="EMAIL-ADDRESS">
    <hint name="max-length">254</hint>
</hint-collection>
<hint-collection name="HOSTNAME">
    <hint name="max-length">200</hint>
</hint-collection>
<hint-collection name="SEARCHABLE-DATE">
    <hint name="month-nullable">true</hint>
    <hint name="day-nullable">true</hint>
    <hint name="year-nullable">true</hint>
    <hint name="show-time">false</hint>
</hint-collection>
<hint-collection name="TEXTAREA">
    <hint name="display-height">105</hint>
    <hint name="display-width">500</hint>
    <hint name="max-length">4000</hint>
</hint-collection>
<hint-collection name="URL">
    <hint name="max-length">4000</hint>
</hint-collection>
```


ヒントコレクションの名前を参照することにより、モデルフィールドにヒントコレクションを適用できます。 たとえば、`model-hints`要素で上記のような`SEARCHABLE-DATE`コレクションを定義する場合、コレクションをその名前で参照する`hint-collection`要素を使用して、モデルの日付フィールドに適用できます。



```xml
<field name="date" type="Date">
    <hint-collection name="SEARCHABLE-DATE" />
</field>
```


プロジェクトでいくつかのモデルヒントを使用するとします。 まずは、コメントフィールドに入力するためのエディターをユーザーに提供することから始めます。 同じヒントを複数のエンティティに適用するには、それをヒントコレクションとして定義します。 次に、各エンティティのヒントコレクションを参照します。

ヒントコレクションを定義するには、`portlet-model-hints.xml`ファイルの`model-hints`ルート要素内に`hint-collection`要素を追加します。 以下に例を示します。



```xml
<hint-collection name="COMMENT-TEXTAREA">
    <hint name="display-height">105</hint>
    <hint name="display-width">500</hint>
    <hint name="max-length">4000</hint>
</hint-collection>
```


特定のフィールドのヒントコレクションを参照するには、フィールドの`field`要素内に`hint-collection`要素を追加します。



```xml
<field name="comment" type="String">
    <hint-collection name="COMMENT-TEXTAREA" />
</field>
```


ヒントコレクションを定義し、ヒントコレクションの参照を追加したら、サービスを再構築し、プロジェクトを再デプロイして、ヒントコレクションで定義されたヒントが有効になっていることを確認します。

これで、モデルの入力フィールドの表示方法だけでなく、データベーステーブルの列サイズを設定することもできるようになりました。 ヒントを整理したり、個々のヒントをフィールドに直接挿入したり、モデルのすべてのフィールドにデフォルトのヒントのセットを適用したり、これらのスコープのいずれかに適用するヒントのコレクションを定義したりできます。
