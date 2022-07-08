# Configuration Form Renderer

[構成インターフェイスを作成](./setting-and-accessing-configurations.html#creating-the-configuration-interface) すると、構成UIが自動的に生成されます。  ただし、UIのルックアンドフィールをカスタマイズしたい場合もあります。 たとえば、会社のデザインの美的感覚に一致するようにUIを変更するとします。 ` ConfigurationFormRenderer`の実装でこれを行う方法は次のとおりです。

## サンプルプロジェクトを参照する
```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順に従います。

1. [Configuration Form Renderer](./liferay-b7r2.zip) をダウンロードし、解凍します。

   ```bash
   curl https://learn.liferay.com/dxp/latest/ja/building-applications/core-frameworks/configuration-framework/liferay-b7r2.zip -O
   ```

   ```bash
   unzip liferay-b7r2.zip
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
   STARTED com.acme.b7r2.web_1.0.0 [1034]
   ```

1. サンプルのモジュールが機能していることを確認します。 ブラウザで`https://localhost:8080`を開きます。

1. ［**コントロールパネル**］ &rarr; ［**設定**］ &rarr; ［**System Settings**］ &rarr; ［**Third Party**］ に移動します。 ［**B7R2 Configuration**］ をクリックします。

   ![システム設定でU2G5構成に移動します。](./configuration-form-renderer/images/01.png)

   このビューはカスタムJSPファイルによって提供されることに注意してください。

## 構成インターフェースを作成する

構成インターフェイスで構成可能な属性を定義します。 サンプルプロジェクトには、`b7r2Color`という1つの構成可能な属性があります。

```{literalinclude} ./configuration-form-renderer/resources/liferay-b7r2.zip/b7r2-web/src/main/java/com/acme/b7r2/web/internal/configuration/B7R2WebConfiguration.java
:language: java
:lines: 9-14
```

`ConfigurationFormRenderer`を使用する場合、[生成されたUIを非表示にする](./hiding-the-configuration-ui.md)ために`generateUI`アノテーションは必要ないことに注意してください。

## 構成Bean宣言を追加する

構成クラスを`ConfigurationBeanDeclaration`クラスに登録します。 これにより、システムは構成の変更が発生したときにそれを追跡できます。

```{literalinclude} ./configuration-form-renderer/resources/liferay-b7r2.zip/b7r2-web/src/main/java/com/acme/b7r2/web/internal/settings/definition/B7R2WebConfigurationBeanDeclaration.java
:language: java
:lines: 10-18
```

## Configuration Form Rendererを実装する

1. `ConfigurationFormRenderer`の実装を作成します。 `@Component`アノテーションで、サービスを`ConfigurationScreen.class`として宣言します。

   ```java
   @Component(service = ConfigurationScreen.class)
   ```

1. `getPid()`メソッドをオーバーライドします。 構成クラスの`@Meta.OCD`アノテーションで指定されている完全な構成IDを必ず返すようにしてください。

   ```{literalinclude} ./configuration-form-renderer/resources/liferay-b7r2.zip/b7r2-web/src/main/java/com/acme/b7r2/web/internal/configuration/admin/display/B7R2ConfigurationFormRenderer.java
   :dedent: 1
   :language: java
   :lines: 26-29
   ```

1. `getRequestParameters()`メソッドをオーバーライドします。 このメソッドでは、カスタムUIによって送信されたパラメーターを読み取り、それらをマップに配置します。ここで、キーは構成インターフェースにあるフィールドと一致します。

   ```{literalinclude} ./configuration-form-renderer/resources/liferay-b7r2.zip/b7r2-web/src/main/java/com/acme/b7r2/web/internal/configuration/admin/display/B7R2ConfigurationFormRenderer.java
   :dedent: 1
   :language: java
   :lines: 31-42
   ```

1. `render()`メソッドをオーバーライドします。 この例では、 `ConfigurationProvider`が構成オブジェクトにアクセスします。 サーブレットコンテキストは、リクエストディスパッチャへのアクセスを提供します。これにより、カスタムJSPが構成を読み取ることができます。

1. 必ず`@Reference`アノテーションを使用して、モジュールのシンボリック名を定義してください。

   ```java
   @Reference(
    target = "(osgi.web.symbolicname=com.acme.b7r2.web)"
   )
   ```

## Web-ContextPathを追加する

`bnd.bnd`ファイルでバンドルの`Web-ContextPath`を指定します。 たとえば、サンプルプロジェクトのBndファイルには`Web-ContextPath: /b7r2-web`があります。 これは、configuration form rendererファイルに`ServletContext`オブジェクトを登録するものです。  サーブレットコンテキストはポートレット用に自動的に作成されますが、このサンプルにはポートレットがないため、サーブレットコンテキストを`bnd.bnd`ファイルに追加する必要があることに注意してください。

## カスタムJSPを作成する

1. 構成インターフェイスをJSPにインポートします。

   ```markup
   <%@ page import="com.acme.u2g5.web.internal.configuration.B7R2WebConfiguration" %>
   ```

1. リクエストオブジェクトから構成値にアクセスします。

   ```jsp
   <%
   B7R2WebConfiguration b7r2WebConfiguration = (B7R2WebConfiguration)request.getAttribute(B7R2WebConfiguration.class.getName());
   %>
   ```

1. `<aui:input>` タグを使用して、ユーザーがJSPファイルに送信する新しい構成入力を読み取ります。

   ```jsp
   <aui:input name="b7r2Color" value="<%= b7r2WebConfiguration.b7r2Color() %>" />
   ```

このサンプルプロジェクトは、`ConfigurationFormRenderer`を使用してカスタマイズされた基本的な構成UIを示しています。 アプリケーションでは、独自のコードを記述して、構成UIのルックアンドフィールをさらにカスタマイズしてください。
