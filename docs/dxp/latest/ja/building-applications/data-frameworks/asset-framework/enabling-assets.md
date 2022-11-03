# アセットの有効化

Liferayの多くのアプリケーション（ブログ、ドキュメントとメディア、掲示板など）は、すぐに使用可能なアセットです。 [アセットパブリッシャーウィジェット](../../../site-building/displaying-content/using-the-asset-publisher-widget/displaying-assets-using-the-asset-publisher-widget.md)でアセットを公開したり、 [アセットライブラリ](../../../content-authoring-and-management/asset-libraries/asset-libraries-overview.md)を作成することも可能です。 [サービスビルダー](../service-builder.md)を使用すると、カスタムアプリケーションをアセット対応にすることができます。 その方法は、以下のサンプルプロジェクトをご覧ください。

## サンプルコードを取得する

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順を実行します。

1. [Enabling Assets](./liferay-s5e6.zip)  をダウンロードし、解凍してください。

   ```bash
   curl https://learn.liferay.com/dxp/latest/ja/building-applications/data-frameworks/asset-framework/liferay-s5e6.zip -O
   ```

   ```bash
   unzip liferay-s5e6.zip
   ```

1. モジュールのルートから、ビルドおよびデプロイします。

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   ```{note}
   このコマンドは、デプロイされたjarをDockerコンテナの`/opt/liferay/osgi/modules`にコピーするのと同じです。
   ```

1. Liferay Dockerコンテナコンソールでデプロイを確認します。

   ```bash
   STARTED com.acme.s5e6.api_1.0.0 [1433]
   STARTED com.acme.s5e6.service_1.0.0 [1434]
   STARTED com.acme.s5e6.web_1.0.0 [1435]
   ```

1. ブラウザで`https://localhost:8080`を開きます。

1. S5E6ポートレットをページに追加します。 サンプルポートレットは、サンプルウィジェットの下にあります。

1. また、同じページにアセットパブリッシャーウィジェットを追加します。 ウィジェットは、コンテンツ管理の下にあります。

1. S5E6 Portletでエントリーを追加し（例： `s5e6_name1` and `s5e6_description1`） `［Submit］`をクリックして下さい。

1. S5E6ポートレットはアセットに対応しているため、追加された項目は自動的にアセットパブリッシャーウィジェットに表示されます。

   ![追加されたエントリは、アセットパブリッシャーウィジェットに自動的に表示されます。](./enabling-assets/images/01.png)

## 検索が有効になる前提条件

このチュートリアルでは、すでに検索が有効になっているサービスビルダーアプリケーションがあることを前提に説明します。 アプリケーションには最低限必要です。

`*SearchRegistrar.java` - アプリケーションのエンティティに対して検索サービスを検索フレームワークに登録します（例： `com.acme.s5e6.search.S5E6SearchRegistrar.java` Javaクラス ）。

`*ModelIndexerWriterContributor.java` - エントリの再インデックスおよびバッチ再インデックスの動作を設定します（例： `com.acme.s5e6.search.S5E6EntryModelIndexerWriterContributor.java` Javaクラス ）。

`*ModelSummaryContributor.java` - エントリーの結果サマリーを構築します（例： `com.acme.s5e6.search.S5E6EntryModelSummaryContributor.java` Javaクラス ）。

検索を有効にする方法については、検索の使用の [開発者ガイド](../../../using-search/developer-guide.md)を参照してください。

## サービスモデルの定義の変更

アセットを有効にするには、次のようにエンティティを変更します。

1. 以下のデータフィールドがまだ定義されていない場合は、追加してください。

   ```xml
   <!-- Group instance -->

   <column name="groupId" type="long" />

   <!-- Audit fields -->

   <column name="companyId" type="long" />
   <column name="userId" type="long" />
   <column name="userName" type="String" />
   <column name="createDate" type="Date" />
   <column name="modifiedDate" type="Date" />
   ```

   アセットフレームワークは、アプリケーションのデータを追跡するために、これらのフィールドを必要とします。

1. `</entity>`タグを閉じる直前に、アセットエントリーエンティティリファレンスを追加します。 後で、新しいアプリケーションのエントリーが追加されたとき、対応するエントリーがLiferayの`AssetEntry`テーブルに追加されるように変更します。

   ```xml
   <reference entity="AssetEntry" package-path="com.liferay.portlet.asset" />
   ```

3. サービスビルダーを再実行します。

   ```bash
   ./gradlew s5e6-service:buildService
   ```

## サービスレイヤーの更新

カスタムエンティティをLiferayアセットとして追加するには、プロジェクトの `assetEntryLocalService`の `updateEntry()` メソッドを `-LocalServiceImpl` Javaクラスで呼び出す必要があります。 `assetEntryLocalService.updateEntry()` を呼び出すと、 `AssetEntry`テーブルに新しい行（アプリケーションのエントリに対応）が追加されます。 `updateEntry()`メソッドは、アセットエントリーが存在するかどうかを確認し、適切な処理を行うため、アセットエントリーの追加と更新の両方が可能です。


サンプルプロジェクトでは、次のようになります。

```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-service/src/main/java/com/acme/s5e6/service/impl/S5E6EntryLocalServiceImpl.java
:dedent: 1
:language: java
:lines: 64-73
```

[`AssetEntryLocalServiceImpl`クラス](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-impl/com/liferay/portlet/asset/service/impl/AssetEntryLocalServiceImpl.html#updateEntry-long-long-java.util.Date-java.util.Date-java.lang.String-long-java.lang.String-long-long:A-java.lang.String:A-boolean-boolean-java.util.Date-java.util.Date-java.util.Date-java.util.Date-java.lang.String-java.lang.String-java.lang.String-java.lang.String-java.lang.String-java.lang.String-int-int-java.lang.Double-) のJavadocsを確認すると、このメソッドはオーバーロードされていることが分かります。 `updateEntry()`のバージョンで、`title`パラメータを受け取り、アセットエントリーのタイトルを設定できるようにします。

変更後、サービスビルダーを再実行します。

## アセットレンダラの作成

アセットとはエンティティの表示版なので、 `title`, `description`, `summary`といったフィールドが含まれます。 Liferayはこれらのフィールドを使用して、アセットを表示します。 アセットレンダラは、これらのフィールドを介してエンティティをアセットに変換します。

1. アプリケーションで、Liferayの`BaseJSPAssetRenderer`クラスを拡張する`-AssetRender`クラスを作成します。 例:

   ```java
   public class S5E6EntryAssetRenderer extends BaseJSPAssetRenderer<S5E6Entry> {

   }
   ```

2. アセットレンダラクラスのコンストラクタを定義します。

   ```java
    public S5E6EntryAssetRenderer(S5E6Entry s5e6Entry) {
        _s5e6Entry = s5e6Entry;
    }
   ```

3. 異なるゲッターメソッドを使用して、アセットレンダラをアセットに接続します。

   ```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-web/src/main/java/com/acme/s5e6/web/internal/asset/model/S5E6EntryAssetRenderer.java
   :dedent: 1
   :language: java
   :lines: 20-72
   ```

   この例では、`getTitle()`メソッドに`name`属性、`getSummary()`メソッドにアプリケーションの`description`属性が設定されていることに注意してください。

## アセットレンダラファクトリーの作成

アセットレンダラを作成したら、各アセットインスタンスにアセットレンダラを生成するファクトリークラスを作成する必要があります。

1. 上記と同じフォルダに、Liferayの`BaseAssetRendererFactory`クラスを拡張する`-AssetRendererFactory`クラスを作成します。 例:

   ```java
   public class S5E6EntryAssetRendererFactory extends BaseAssetRendererFactory<S5E6Entry> {

   }
   ```

1. クラス宣言の上に`@Component`アノテーションを作成します。 このアノテーションは、アセットのファクトリーインスタンスを登録します。 `service`要素は、`AssetRenderFactory.class`インターフェイスを指す必要があります。

   ```java
   @Component(service = AssetRendererFactory.class)
   ```

1. ファクトリーの属性をプリセットするファクトリークラスのコンストラクタを作成します。

   ```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-web/src/main/java/com/acme/s5e6/web/internal/asset/model/S5E6EntryAssetRendererFactory.java
   :dedent: 1
   :language: java
   :lines: 24-29
   ```

   `setLinkable`を`true`に設定して、他のアセットはアセットを関連アセットとして選択できるようにします。 `setSearchable`を`true`に設定すると、検索時にアセットを見つけることができるようになります。

1. `getAssetRenderer`メソッドを実装し、新しい `S5E6AssetRenderer`インスタンスを構築します。

   ```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-web/src/main/java/com/acme/s5e6/web/internal/asset/model/S5E6EntryAssetRendererFactory.java
   :dedent: 1
   :language: java
   :lines: 31-43
   ```

1. 必ず`@Reference`アノテーションを使用して、モジュールのシンボル名を定義してください。

   ```java
   @Reference(
    target = "(osgi.web.symbolicname=com.acme.s5e6.web)"
   )
   ```

## ポートレットを変更する

`S5E6Portlet`の`addS5E6Entry`メソッドは、`S5E6Entry`インスタンスを追加する要求を処理します。

```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-web/src/main/java/com/acme/s5e6/web/internal/portlet/S5E6Portlet.java
:dedent: 1
:language: java
:lines: 32-46
```

`addS5E6Entry`は、ポートレットのアクションメソッドなので、 `ActionRequest`と`ActionResponse`のパラメータを受け取ります。 新しいエントリーを追加するサービス呼び出しを行うには、 `title`と`description`をリクエストから取得する必要があります。 `serviceContext`もリクエストから取得し、サービス呼び出しの引数として渡す必要があります。

ポートレットの`view.jsp`には、ポートレットの`actionURL`メソッドを呼び出す`addS5E6Entry`フォームが含まれています。

```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-web/src/main/resources/META-INF/resources/view.jsp
:language: jsp
:lines: 18-28
```
ポートレットはアセットが有効です。 アプリケーションのエントリーを検索し、アセットとして表示することができるようになりました。
