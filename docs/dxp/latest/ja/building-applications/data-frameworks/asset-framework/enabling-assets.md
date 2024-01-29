# アセットの有効化

Liferayの多くのアプリケーション（例：ブログ、ドキュメントとメディア、メッセージボードなど） はすぐにアセットに対応する。 [Asset Publisher ウィジェット](../../../site-building/displaying-content/using-the-asset-publisher-widget/displaying-assets-using-the-asset-publisher-widget.md) を使ってアセットを公開したり、 [Asset Libraries](../../../content-authoring-and-management/asset-libraries/asset-libraries-overview.md) を作成することもできます。 [サービスビルダー](../service-builder.md) を使用すれば、カスタムアプリケーションを資産化することができます。 その方法は、以下のサンプルプロジェクトをご覧ください。

## サンプルコードを取得する

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順に従います。

1. [Enabling Assets](./liferay-s5e6.zip) をダウンロードして解凍する。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/data-frameworks/asset-framework/liferay-s5e6.zip -O
   ```

   ```bash
   unzip liferay-s5e6.zip
   ```

1. モジュールのルートから、ビルドおよびデプロイします。

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   ```{note}
   このコマンドは Docker コンテナ上の `/opt/liferay/osgi/modules` にデプロイした jar をコピーするのと同じです。
   ```
1. Liferay Dockerコンテナコンソールでデプロイを確認します。

   ```bash
   STARTED com.acme.s5e6.api_1.0.0 [1433]
   STARTED com.acme.s5e6.service_1.0.0 [1434]
   STARTED com.acme.s5e6.web_1.0.0 [1435]
   ```

1. ブラウザを`https://localhost:8080`に開く。

1. S5E6ポートレットをページに追加します。 サンプルポートレットは、サンプルウィジェットの下にあります。

1. また、同じページにアセットパブリッシャーウィジェットを追加します。 ウィジェットは、コンテンツ管理の下にあります。

1. S5E6ポートレットのエントリを追加し（例：`s5e6_name1`と`s5e6_description1`）、`Submit`をクリックします。

1. S5E6ポートレットはアセットに対応しているため、追加された項目は自動的にアセットパブリッシャーウィジェットに表示されます。

   ![The added entry appears automatically in the Asset Publisher widget](./enabling-assets/images/01.png)

## 検索が有効になる前提条件

このチュートリアルでは、すでに検索が有効になっているサービスビルダーアプリケーションがあることを前提に説明します。 アプリケーションには最低限必要です。

`*ModelSearchConfigurator.java` - アプリケーションのエンティティの検索フレームワークに検索サービスを登録する（例：`com.acme.s5e6.search.S5E6EntryModelSearchConfigurator.java`クラス）。

```{note}
ModelSearchConfigurator` パターンは Liferay 2023.Q4+ と GA/Update 100+ に適用されます。 以前のバージョンでは `SearchRegistrar` を使用していた。 [Liferay 7.2 documentation](https://help.liferay.com/hc/ja/articles/360032611231-Search-Service-Registration) を参照して `SearchRegistrar` を実装してください。
```
`*ModelIndexerWriterContributor.java` - エントリーの再インデックス付けとバッチ再インデックス付けの動作を設定する (例: `com.acme.s5e6.search.S5E6EntryModelIndexerWriterContributor.java` クラス)。

`*ModelSummaryContributor.java` - エントリーの結果サマリーを構築する（例：`com.acme.s5e6.search.S5E6EntryModelSummaryContributor.java`クラス）。

検索の有効化については、 [開発者ガイド](../../../using-search/developer-guide.md) の Using Search を参照してください。

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

1. `</entity>`タグを閉じる直前に、アセット・エントリー・エンティティの参照を追加する。 後で、新しいアプリケーションエントリが追加されたときに、対応するエントリが Liferay の `AssetEntry` テーブルに追加されるように変更します。

   ```xml
   <reference entity="AssetEntry" package-path="com.liferay.portlet.asset" />
   ```

1. サービスビルダーを再実行します。

   ```bash
   ./gradlew s5e6-service:buildService
   ```

## サービスレイヤーの更新

カスタムエンティティを Liferay のアセットとして追加するには、プロジェクトの `-LocalServiceImpl` Java クラスで `assetEntryLocalService` の `updateEntry()` メソッドを呼び出す必要があります。 assetEntryLocalService.updateEntry()`を呼び出すと、`AssetEntry` テーブルに（アプリケーションのエントリに対応する）新しい行が追加される。 updateEntry()`メソッドは、アセットエントリが存在するかどうかをチェックし、適切な処理を行うため、アセットエントリの追加と更新の両方を行います。

サンプルプロジェクトでは、次のようになります。

```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-service/src/main/java/com/acme/s5e6/service/impl/S5E6EntryLocalServiceImpl.java
:dedent: 1
:language: java
:lines: 64-73
```

[`AssetEntryLocalServiceImpl` クラスの Javadocs](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-impl/com/liferay/portlet/asset/service/impl/AssetEntryLocalServiceImpl.html) をチェックすると、このメソッドがオーバーロードされていることがわかる。 アセットエントリーのタイトルを設定できるように、`updateEntry()` の `title` パラメータを取るバージョンを使用します。

変更後、サービスビルダーを再実行します。

## アセットレンダラの作成

アセットはエンティティの表示バージョンなので、`title`、`description`、`summary`などのフィールドを含む。 Liferayはこれらのフィールドを使用して、アセットを表示します。 アセットレンダラは、これらのフィールドを介してエンティティをアセットに変換します。

1. アプリケーションで、Liferay の `BaseJSPAssetRenderer` クラスを継承した `-AssetRender` クラスを作成します。 例えば、

   ```java
   public class S5E6EntryAssetRenderer extends BaseJSPAssetRenderer<S5E6Entry> {

   }
   ```

1. アセットレンダラクラスのコンストラクタを定義します。

   ```java
   	public S5E6EntryAssetRenderer(S5E6Entry s5e6Entry) {
    	_s5e6Entry = s5e6Entry;
    }
   ```

1. 異なるゲッターメソッドを使用して、アセットレンダラをアセットに接続します。

   ```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-web/src/main/java/com/acme/s5e6/web/internal/asset/model/S5E6EntryAssetRenderer.java
   :dedent: 1
   :language: java
   :lines: 20-72
   ```

   この例では、`getTitle()` メソッドにはアプリケーションの `name` 属性が、`getSummary()` メソッドにはアプリケーションの `description` 属性が設定されていることに注意してください。

## アセットレンダラファクトリーの作成

アセットレンダラを作成したら、各アセットインスタンスにアセットレンダラを生成するファクトリークラスを作成する必要があります。

1. 上記と同じフォルダに、Liferay の `BaseAssetRendererFactory` クラスを継承した `-AssetRendererFactory` クラスを作成します。 例えば、

   ```java
   public class S5E6EntryAssetRendererFactory extends BaseAssetRendererFactory<S5E6Entry> {

   }
   ```

1. クラス宣言の上に `@Component` アノテーションを作成する。 このアノテーションは、アセットのファクトリーインスタンスを登録します。 service`要素は`AssetRenderFactory.class\` インターフェースを指すべきである。

   ```java
   @Component(service = AssetRendererFactory.class)
   ```

1. ファクトリーの属性をプリセットするファクトリークラスのコンストラクタを作成します。

   ```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-web/src/main/java/com/acme/s5e6/web/internal/asset/model/S5E6EntryAssetRendererFactory.java
   :dedent: 1
   :language: java
   :lines: 24-29
   ```

   他のアセットがあなたのアセットを関連アセットとして選択できるように `setLinkable` を `true` に設定します。 setSearchable`を`true\` に設定して、検索時にアセットが見つかるようにします。

1. 新しい `S5E6AssetRenderer` インスタンスを作成する `getAssetRenderer` メソッドを実装します。

   ```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-web/src/main/java/com/acme/s5e6/web/internal/asset/model/S5E6EntryAssetRendererFactory.java
   :dedent: 1
   :language: java
   :lines: 31-43
   ```

1. 必ず `@Reference` アノテーションを使ってモジュールのシンボル名を定義してください。

   ```java
   @Reference(
   	target = "(osgi.web.symbolicname=com.acme.s5e6.web)"
   )
   ```

## ポートレットを変更する

S5E6Portlet`の`addS5E6Entry`メソッドは`S5E6Entry\` インスタンスを追加するリクエストを処理する。

```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-web/src/main/java/com/acme/s5e6/web/internal/portlet/S5E6Portlet.java
:dedent: 1
:language: java
:lines: 32-46
```

addS5E6Entry`はポートレットのアクションメソッドなので、`ActionRequest`と`ActionResponse`パラメータを受け取ります。 新しいエントリーを追加するサービスコールを行うには、リクエストから`title`と`description` を取得しなければならない。 serviceContext`もリクエストから取得して、サービス呼び出しの引数として渡さなければならない。

ポートレットの `view.jsp` には、ポートレットの `addS5E6Entry` メソッドを呼び出す `actionURL` フォームが含まれています。

```{literalinclude} ./enabling-assets/resources/liferay-s5e6.zip/s5e6-web/src/main/resources/META-INF/resources/view.jsp
:language: jsp
:lines: 18-28
```

ポートレットはアセットが有効です。 アプリケーションのエントリーを検索し、アセットとして表示することができるようになりました。
