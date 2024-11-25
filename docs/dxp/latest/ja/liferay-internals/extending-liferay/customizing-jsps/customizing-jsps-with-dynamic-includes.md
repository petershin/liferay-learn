# Dynamic Includesを用いたJSPのカスタマイズ

[`liferay-util:dynamic-include`タグ](https://resources.learn.liferay.com/reference/latest/en/dxp/taglibs/util-taglib/liferay-util/dynamic-include.html) は、コンテンツを挿入できるプレースホルダーです（JavaScriptコード、HTMLなど）。 サンプルプロジェクトでは、dynamic includeでコンテンツを挿入する方法を示しています。

## サンプルプロジェクトをデプロイする

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順を実行します。

1. [動的インクルードによるJSPのカスタマイズ](./liferay-n3q9.zip) をダウンロードして解凍します。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/liferay-internals/extending-liferay/customizing-jsps/liferay-n3q9.zip -O
   ```

   ```bash
   unzip liferay-n3q9.zip
   ```

1. モジュールのルートから、ビルドおよびデプロイします。

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   !!! note
      このコマンドは、デプロイされたjarをDockerコンテナの/opt/liferay/osgi/modulesにコピーするのと同じです。

1. Liferay Dockerコンテナコンソールでデプロイを確認します。

   ```bash
   STARTED com.acme.n3q9.able.web_1.0.0 [1459]
   STARTED com.acme.n3q9.baker.web_1.0.0 [1460]
   ```

1. サンプルのモジュールが機能していることを確認します。 ブラウザで`https://localhost:8080`を開きます。

1. サイトページに移動し、編集アイコン(![Edit icon](../../../images/icon-edit.png))をクリックします。 N3Q9 Bakerポートレットをページに追加します。 ウィジェットは、サンプルウィジェットの下にあります。

   ![N3Q9 Bakerポートレットをサイトページに追加します。](./customizing-jsps-with-dynamic-includes/images/01.png)

   最初の2行はN3Q9 Baker Portletから、3行目はN3Q9 Ableモジュールのdynamic includeから挿入されていることに注意してください。

## Dynamic Includeを実装する

1. `@Component`アノテーションを使用して、`DynamicInclude`の実装としてクラスを宣言します。

   ```java
   @Component(service = DynamicInclude.class)
   ```

1. `include`メソッドで、カスタムコンテンツを追加します。 サンプルプロジェクトでは、シンプルな`PrintWriter`のサンプルを使用しています。

   ```{literalinclude} ./customizing-jsps-with-dynamic-includes/resources/liferay-n3q9.zip/n3q9-able-web/src/main/java/com/acme/n3q9/able/web/internal/servlet/taglib/N3Q9AbleDynamicInclude.java
      :dedent: 1
      :language: java
      :lines: 16-25
   ```

2. `register`メソッドで、使用するdynamic includeタグを指定します。 サンプルでは、registerメソッドは、Bakerモジュールの `view.jsp`のdynamic includeを対象としています。

   ```{literalinclude} ./customizing-jsps-with-dynamic-includes/resources/liferay-n3q9.zip/n3q9-able-web/src/main/java/com/acme/n3q9/able/web/internal/servlet/taglib/N3Q9AbleDynamicInclude.java
      :dedent: 1
      :language: java
      :lines: 27-30
   ```

## Dynamic Includeを挿入する

`liferay-util:dynamic-include`タグをdynamic includeを挿入したい場所に追加します。 サンプルでは、N3Q9 Baker Portletの `view.jsp`の一番下にタグを追加しています。

```{literalinclude} ./customizing-jsps-with-dynamic-includes/resources/liferay-n3q9.zip/n3q9-baker-web/src/main/resources/META-INF/resources/view.jsp
   :language: jsp
```

dynamic include`キー`が、上記の `register()`メソッドで設定したターゲット属性と一致することを確認してください。

JSPやポートレットについては、[JSPとMVCポートレットの使用](../../../building-applications/developing-a-java-web-application/using-mvc/using-a-jsp-and-mvc-portlet.md)を参照してください。