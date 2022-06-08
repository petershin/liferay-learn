# サービスビルダーを使用したビジネスロジック

サービスビルダーで[モデル、永続化、サービスコードを生成](./service-builder-basics/generating-model-persistence-and-service-code.md)したら、ビジネスロジックを追加し始めることができます。 サービスビルダが生成するエンティティには，モデル実装とローカルサービス実装クラスが含まれます． アプリケーションのビジネスロジックは、これらのクラスで実装することができます。 生成されたサービスは、後で永続レイヤーからCRUD操作を呼び出すデフォルトのメソッドを含んでいます。 ビジネスロジックを作成したら、再びサービスビルダーを実行して、アプリケーションのインターフェースをプロパゲートさせ、新しいロジックを呼び出せるようにします。

# サンプルプロジェクトを参照する

1. Liferay DXPを起動します。 まだDockerコンテナがない場合は、以下を使用します。

    ```bash
    docker run -it -m 8g -p 8080:8080 [$LIFERAY_LEARN_DXP_DOCKER_IMAGE$]
    ```

    別のLiferay PortalバージョンまたはLiferay DXPを実行している場合は、上記のコマンドを適宜調整してください。

1. [サービスビルダーによるビジネスロジック](./liferay-e4g5.zip) をダウンロードして解凍します。

    ```bash
    curl https://learn.liferay.com/dxp/latest/ja/building-applications/data-frameworks/service-builder/liferay-e4g5.zip -O
    ```

    ```bash
    unzip liferay-e4g5.zip
    ```

1. モジュールのルートから、ビルドおよびデプロイします。

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    このコマンドは、デプロイされたjarをDockerコンテナの/opt/liferay/osgi/modulesにコピーするのと同じです。
    ```

1. Liferay Dockerコンテナコンソールでデプロイを確認します。

    ```bash
    STARTED com.acme.e4g5.api_1.0.0 [1034]
    STARTED com.acme.e4g5.service_1.0.0 [1035]
    STARTED com.acme.e4g5.web_1.0.0 [1036]
    ```

1. サンプルのモジュールが機能していることを確認します。 ブラウザで`https://localhost:8080`を開きます。

1. E4G5ポートレットをページに追加します。 サンプルポートレットは、サンプルウィジェットの下にあります。

   ![E4G5ポートレットをページに追加します。](./business-logic-with-service-builder/images/01.png)

1. 名前と説明（例：e4g5 **name1、e4g5** description1）を入力して、エントリーを追加します。 `［Add］`をクリックすると、新しい項目が `［E4G5 Entries］`の下に表示されます。 `e4g5EntryId</0 の番号に注意してください。</p></li>
<li><p spaces-before="0">次に、このエントリを更新しますが、前のステップで入力した <code>e4g5EntryId`と新しい［name］と［description］を入力します。 (e.g. 41804, e4g5_name2, e4g5_description2). `［Update］`をクリックすると、エントリーが更新されます。

1. 最後に、`e4g5EntryId`を入力して、エントリーを削除します。 `［Delete］`をクリックすると、エントリーが削除されます。

## サービスレイヤーの更新

`E4G5Entry`エントリーを追加、更新、削除できるメソッドを追加し、ローカルサービスを拡張します。

### Addメソッドの実装

1. エンティティを作成するためのパラメータを持つ`add*`メソッドを宣言します。

```{literalinclude} ./business-logic-with-service-builder/resources/liferay-e4g5.zip/e4g5-service/src/main/java/com/acme/e4g5/service/impl/E4G5EntryLocalServiceImpl.java
:language: java
:lines: 34-44
```

1. エンティティに関連付けられた`*Persistence`クラスは、与えられたIDのエンティティインスタンスを構築する`create()`メソッドを持っています。 `*BaseLocalServiceImpl`ごとに、エンティティの`counterLocalService`オブジェクトがあります。 カウンターサービスの`increment()`メソッドを呼び出して、エンティティインスタンスのプライマリーキーを生成します。

1. エンティティのセッターメソッドを使用して、エンティティの属性を入力します。 サンプルでは2つの属性を設定しています。 `name`と`description`です。

1. `*Persistence`クラスの`update()`メソッドを呼び出し、エンティティオブジェクトを渡します。

### Updateメソッドの実装

1. エンティティを更新するためのパラメータを持つ`update*`メソッドを宣言します。 このサンプルでは、`e4g5EntryId`とともに、`name`と`description`属性を受け取ります。

```{literalinclude} ./business-logic-with-service-builder/resources/liferay-e4g5.zip/e4g5-service/src/main/java/com/acme/e4g5/service/impl/E4G5EntryLocalServiceImpl.java
:language: java
:lines: 54-65
```

1. `*Persistence`クラスの`findByPrimaryKey()`メソッドを使用して、エントリーIDによるエンティティインスタンスを取得します。

1. エンティティのセッターメソッドを使用して、エンティティの属性を入力します。

1. `*Persistence`クラスの`update()`メソッドを呼び出し、エンティティオブジェクトを渡します。

### Deleteメソッドの実装

1. エンティティのエントリIDを受け取る`delete*`メソッドを宣言します。

```{literalinclude} ./business-logic-with-service-builder/resources/liferay-e4g5.zip/e4g5-service/src/main/java/com/acme/e4g5/service/impl/E4G5EntryLocalServiceImpl.java
:language: java
:lines: 46-52
```

1. `*Persistence` クラスの `delete()` メソッドを呼び出し、エンティティオブジェクトを渡します。

`add*`, `update*`, `delete*` メソッドを実装した後、サービスビルダーを実行して、新しいサービスメソッドを `*LocalService `インターフェースにプロパゲートさせます。

## バックエンドの統合

ここで、作成したサービスメソッドを[ポートレットアクション](../../developing-a-java-web-application/using-mvc/invoking-actions-with-mvc-portlet.md)でWebモジュールに実装します。

### ポートレットアクション

Webモジュールには、[MVC Portlet](../../developing-a-java-web-application/using-mvc.md)を使用することができます。 サンプルプロジェクトのポートレットは、 `add`, `update`, `delete`のエントリアクションを持ちます。

```{literalinclude} ./business-logic-with-service-builder/resources/liferay-e4g5.zip/e4g5-web/src/main/java/com/acme/e4g5/web/internal/portlet/E4G5Portlet.java
:language: java
:lines: 26-51
```

各メソッドは、`ActionRequest`と`ActionResponse`のパラメータを受け取ります。 `ActionRequest`はビューレイヤーから情報を受け取り、 `ActionResponse`はビューレイヤーに情報を戻すのに使用することができます。

`addE4G5Entry()`メソッドは、名前と説明を受け取り、サービスを呼び出してエントリーを追加します。 `updateE4G5Entry()`メソッドは、エントリID、名前、説明を受け取り、特定のエントリを更新するためにサービスを呼び出します。 `deleteE4G5Entry()`メソッドは、エントリIDを受け取り、サービスを呼び出してエントリを削除します。

### JSPのアクションをマッピングする

ここで、作成したアクションメソッドをJSPにマッピングします。

```{literalinclude} ./business-logic-with-service-builder/resources/liferay-e4g5.zip/e4g5-web/src/main/resources/META-INF/resources/view.jsp
:language: jsp
:lines: 43-77
```

JSPでは、タグライブラリの`portlet:actionURL`タグを使ってアクションをUIコンポーネントにバインドします。 `portlet:actionURL`の`name`属性はポートレットで作成した各アクションメソッドと一致しなければならないことに注意してください。 `var`属性は、ポートレットアクションURLを任意の変数に割り当てます。 `<aui:form>`はユーザー入力用のテキストフィールドを描画します。 フォームを送信すると、その値が`ActionRequest`とともにポートレットメソッドに渡されます。
