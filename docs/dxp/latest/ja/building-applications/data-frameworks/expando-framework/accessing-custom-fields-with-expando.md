# Expandosでカスタムフィールドにアクセスする

アプリケーションに追加のフィールドが必要な場合は、いつでも[サービスモデル定義](../service-builder/service-builder-basics/generating-model-persistence-and-service-code.html#examine-the-service-model-definition)に追加して、サービスビルダーを再実行することができます。 これにより、データベースのテーブルに新しいカラムが追加されます。 これは機能しますが、面倒です。ユーザーを新しいスキーマに移行するためのアップグレードプロセスを書かなければならなくなります。 しかし、LiferayのExpando機能を使えば、データベースを修正することなく、フィールドを追加することができます。 Expandosは、Javaでオブジェクトに追加のプロパティを追加することで機能します。 サンプルプロジェクトでは、ユーザーがカスタムフィールドにアクセスするデモを行っています。

## サンプルプロジェクトを参照する

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順を実行します。

1. コントロールパネル* &rarr; *ユーザーと組織* に移動します。管理ユーザーのオプションアイコン（[オプションアイコン](../../../images/icon-actions.png)）をクリックし、*編集*をクリックします。General]タブで[Custom Fields]までスクロールダウンします。*追加*ボタンをクリックします。

1. フィールドタイプとして*Input Field*を選択する。フィールド名として `f5a3Text` を入力する。`test`のように開始値を入力する。*Save* をクリックする。

   ![Create a custom field called f5a3Text for Users.](./accessing-custom-fields-with-expando/images/01.png)

1. [Accessing Expando](./liferay-f5a3.zip)をダウンロードして解凍します。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/data-frameworks/expando-framework/liferay-f5a3.zip -O
   ```

   ```bash
   unzip liferay-f5a3.zip
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
   STARTED com.acme.f5a3.web_1.0.0 [1034]
   ```

1. サンプルのモジュールが機能していることを確認します。 ブラウザで`https://localhost:8080`を開きます。

1. サイトページに移動し、編集アイコン(![Edit icon](../../../images/icon-edit.png))をクリックします。 F5A3ポートレットをページに追加します。 ウィジェットは、サンプルウィジェットの下にあります。

   ![F5A3ポートレットを［サイトページ］に追加します。](./accessing-custom-fields-with-expando/images/02.png)

   ポートレットには、先ほど作成したユーザーのカスタムフィールドが表示されます。

## ポートレットを調べる

サンプルプロジェクトでは、シンプルなMVCポートレットを使用して、カスタムフィールドを表示するJSPファイルをレンダリングしています。 ポートレットには、デフォルトのJSPファイルを表示するだけなので、コードはありません。

詳しくは、 [MVCの使用](../../developing-a-java-web-application/using-mvc.md)をご覧ください。

## JSPファイルを調べる

`<liferay-theme:defineObjects>`タグは、Liferay`User`オブジェクトにアクセスするためにJSPに含まれています。 多くのLiferayオブジェクトと同様に、`User`オブジェクトは`ExpandoBridge`サービスを継承しており、カスタムフィールドの値を作成(つまり`addAttribute()`)、設定(つまり`setAttribute()`)、取得(つまり`getAttribute()`)する方法が含まれています。 すべてのインターフェースのメソッドを見るには、[ExpandoBridge javadocs](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/expando/kernel/model/ExpandoBridge.html)をご覧ください。

```{literalinclude} ./accessing-custom-fields-with-expando/resources/liferay-f5a3.zip/f5a3-web/src/main/resources/META-INF/resources/view.jsp
:language: jsp
```

サンプルプロジェクトでは、ユーザーの`f5a3Text`カスタムフィールドに関連する値を取得する簡単な例を示しています。 アプリケーションでは、カスタムフィールドを作成、設定、取得するための独自のコードを記述してください。
