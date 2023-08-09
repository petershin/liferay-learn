# UADフレームワークの追加

Liferayのユーザー関連データ（UAD）管理ツールで[ユーザーデータを管理・削除](../managing-user-data.md)することができます。 本ツールは、Liferayの多くのアプリケーション（ブログ、ドキュメントとメディア、掲示板など）ですぐに利用できます。 このフレームワークは、お客様のカスタムアプリケーションに適用することも可能です。

この作業は、 [サービスビルダー](../../building-applications/data-frameworks/service-builder.md)を使用することでより簡単に行うことができます。 サービスビルダーがアプリケーションのためにUADを有効にするために必要なコードを自動的に生成する方法については、以下の例を参照してください。

## サンプルコードをダウンロードする

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順を実行します。

1. [UAD Framework](./liferay-h6d2.zip)をダウンロードして解凍します。

    ```bash
    curl https://resources.learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-h6d2.zip -O
    ```

    ```bash
    unzip liferay-h6d2.zip
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
    STARTED com.acme.h6d2.api_1.0.0 [1433]
    STARTED com.acme.h6d2.service_1.0.0 [1434]
    STARTED com.acme.h6d2.uad_1.0.0 [1435]
    STARTED com.acme.h6d2.web_1.0.0 [1436]
    ```

1. ブラウザで`https://localhost:8080`を開きます。

1. H6D2ポートレットをページに追加します。 サンプルポートレットは、サンプルウィジェットの下にあります。

   ![H6D2ポートレットをページに追加します。](./adding-the-uad-framework/images/01.png)

1. テスト用の[新しいユーザーを作成](../users/adding-and-managing-users.md)します。

1. 新規ユーザーとしてログインし、H6D2ポートレットにコンテンツを追加してください。

1. 管理者としてログインし直し、 *［コントロールパネル］* &rarr; *［ユーザー］* &rarr; *［ユーザーと組織］*に移動してください。

1. 新しいユーザーの *アクション* アイコン (![Action](../../images/icon-actions.png)) &rarr; *［個人データの削除］*をクリックしてください。 *［OK］* をクリックして、ユーザーの無効化を確認します。

1. UAD管理ツールが表示されます。 H6D2ポートレットでは、新規ユーザーが追加したデータの表示、匿名化、削除を行うことができます。

   ![H6D2ポートレットに追加されたユーザーのデータを表示、匿名化、削除することができます。](./adding-the-uad-framework/images/02.png)

## サービスモデルの定義の変更

このチュートリアルでは、サービスビルダーを使用して作成したアプリケーションが動作していることを前提としています。 UADを有効にするには、まず、次のようにエンティティを変更します。

1. `-service` フォルダにある`service.xml` ファイルを開いてください。

1. UADを有効にする`entity` パラメータには2つあります。

   | `entity` 属性            | Description                      |
   |:---------------------- |:-------------------------------- |
   | `uad-application-name` | エンティティタイプが所属するアプリケーションの名前を指定します。 |
   | `uad-package-path`     | 生成されたUADクラスのパッケージパスを指定します。       |

   ```{literalinclude} ./adding-the-uad-framework/resources/liferay-h6d2.zip/h6d2-service/service.xml
   :language: xml
   :lines: 6
   ```

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

   UADフレームワークには、ユーザーデータを追跡し、匿名化する上記のフィールドが必要です。

1. 次に、匿名化するデータフィールドを指定します。 これは、2つの属性を用いて行われます。

   * `uad-anonymize-field-name=[fieldName]` 属性は、UAD自動匿名化処理で匿名ユーザーの値で置換されるフィールドを表します。 例えば、 `uad-anonymize-field-name=fullName` と設定すると、そのフィールドの値が匿名ユーザーのフルネームに置換されます。 匿名ユーザーの詳細については、 [匿名ユーザーの構成](../managing-user-data/configuring-the-anonymous-user.md) を参照してください。

   * `uad-nonanonymizable="true"` 属性は、自動的に匿名化されないが管理者によるレビューが必要なデータを示します。

   ```{literalinclude} ./adding-the-uad-framework/resources/liferay-h6d2.zip/h6d2-service/service.xml
   :language: xml
   :lines: 20
   ```
## UADモジュールを生成する

1. `-service` フォルダから移動して、 `-uad` フォルダを新規に作成します。

1. モジュール用の `bnd.bnd` ファイルを作成します。

```{literalinclude} ./adding-the-uad-framework/resources/liferay-h6d2.zip/h6d2-uad/bnd.bnd
    ```

   Make sure to include the `-dsannotations-options: inherit` annotation. OSGi service component classes inherit [OSGi declarative services](../../liferay-internals/fundamentals/module-projects.md) annotations from their class hierarchy.

1. Create a `build.gradle` file for the module.

    ```{literalinclude} ./adding-the-uad-framework/resources/liferay-h6d2.zip/h6d2-uad/build.gradle
    ```

   プロジェクトの `-api` モジュールを含め、必要な依存関係を追加することを確認してください。

2. モジュールの `-service` フォルダに戻り、Service Builder を実行して UAD モジュールを生成してください。

    ```bash
    ../gradlew buildService
    ```

    出力:

    ```
    > Task :h6d2-service:buildService
    Building H6D2Entry
    Writing ../h6d2-uad/src/main/java/com/acme/h6d2/uad/anonymizer/BaseH6D2EntryUADAnonymizer.java
    Writing ../h6d2-uad/src/main/java/com/acme/h6d2/uad/exporter/BaseH6D2EntryUADExporter.java
    Writing ../h6d2-uad/src/main/java/com/acme/h6d2/uad/anonymizer/H6D2EntryUADAnonymizer.java
    Writing ../h6d2-uad/src/main/java/com/acme/h6d2/uad/exporter/H6D2EntryUADExporter.java
    Writing ../h6d2-uad/src/main/java/com/acme/h6d2/uad/display/BaseH6D2EntryUADDisplay.java
    Writing ../h6d2-uad/src/main/java/com/acme/h6d2/uad/display/H6D2EntryUADDisplay.java
    Writing src/main/resources/service.properties
    Writing ../h6d2-uad/src/main/java/com/acme/h6d2/uad/constants/H6D2UADConstants.java
    ```

## ポートレットを変更する

フォームからアプリケーション固有のデータフィールドを渡す場合、 `service.xml` ファイルで追加したユーザー関連のデータフィールドも渡す必要があります。

```{literalinclude} ./adding-the-uad-framework/resources/liferay-h6d2.zip/h6d2-web/src/main/java/com/acme/h6d2/web/internal/portlet/H6D2Portlet.java
:language: java
:lines: 30-66
```

`H6D2 Portlet`には`_h6d2EntryLocalService`と呼ばれる`H6D2EntryLocalService` フィールドと`addH6D2Entry`と呼ばれるアクション処理メソッドがあります。 `addH6D2Entry`メソッドは `H6D2EntryLocalService`の`addH6D2Entry`メソッドを呼び、 `ActionRequest`から受け取ったデータフィールドを渡しています。

ポートレットの `view.jsp` には、ユーザーが `ActionRequest` から `H6D2 Portlet`に送信できるフォームが含まれています。

```{literalinclude} ./adding-the-uad-framework/resources/liferay-h6d2.zip/h6d2-web/src/main/resources/META-INF/resources/view.jsp
:language: jsp
:lines: 18-26
```

`ActionRequest` を `actionURL` と共に送信すると、ポートレットの `addH6D2Entry` メソッドを呼び出せるようになります。

## 関連トピック

* [ユーザーデータの管理](../managing-user-data.md)
* [サービスビルダー](../../building-applications/data-frameworks/service-builder.md)
* [MVCの使用](../../building-applications/developing-a-java-web-application/using-mvc.md)
