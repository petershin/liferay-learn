# 構成の設定とアクセス

Liferayの構成フレームワークを使用して、MVCポートレットの設定UIを追加できます。

## サンプルポートレットを参照する

```{include} /_snippets/run-liferay-portal.md
```

次に、以下の手順に従います。

1. [コンフィギュレーションの設定とアクセス](./liferay-n2f3.zip) をダウンロードして解凍する。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/core-frameworks/configuration-framework/liferay-n2f3.zip -O
   ```

   ```bash
   unzip liferay-n2f3.zip
   ```

1. モジュールのルートから、ビルドおよびデプロイします。

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

    ```{note}
    このコマンドは Docker コンテナ上の `/opt/liferay/osgi/modules` にデプロイした jar をコピーするのと同じです。
    ```
1. Liferay Dockerコンテナコンソールでデプロイを確認します。

   ```
   STARTED com.acme.n2f3.web.0.0 [1650]
   ```

1. サンプルのモジュールが機能していることを確認します。 ブラウザを`https://localhost:8080`に開く。

1. N2F3ポートレットをページに追加します。 サンプルポートレットは、サンプルウィジェットの下にあります。

   ![Add the N2F3 Portlet to a page.](./setting-and-accessing-configurations/images/01.png)

   UIには、フォントの色、フォントファミリー、フォントサイズの3つの設定可能な属性とともにウェルカムメッセージが表示されます。

1. 設定を変更するには、_コントロールパネル_ &rarr; _設定_ &rarr; _システム設定_ に移動します。 その他」の下にある「_category.n2f3_」をクリックする。

   ![Click category.n2f3 under the Other category.](./setting-and-accessing-configurations/images/02.png)

   別のフォントの色、フォントファミリー、およびフォントサイズを入力してみてください。 更新*ボタンをクリックして、公開されたウィジェットのあるページに戻ってください。 属性が変更されたことを確認します。

構成フレームワークの仕組みは次のとおりです。

## 構成インターフェイスを作成する

[システム設定](../../../system-administration/configuring-liferay/system-settings.md) でコンフィギュレーションUIを生成するには、コンフィギュレーション・インターフェースでコンフィギュレーション可能な属性を定義するだけで十分です。

サンプルプロジェクトでは、`N2F3WebConfiguration.java`ファイルが設定インターフェースである。

```{literalinclude} ./scoping-configurations/resources/liferay-n2f3.zip/n2f3-web/src/main/java/com/acme/n2f3/web/internal/configuration/N2F3WebConfiguration.java
:language: java
:lines: 7-25
```

この例のインターフェイスでは、スコープは`Scope.COMPANY`に設定されています。 詳しくは、 [Scoping Configurations](./scoping-configurations.md) を参照のこと。

インターフェースには、フォントの色、フォントファミリー、フォントサイズの3つの設定可能な属性があります。 color と family は `string` 型、size は `int` 型であることに注意。

`Meta.OCD`は、このクラスを特定のIDを持つコンフィギュレーションとして登録する。

```{important}
IDは構成インタフェースの完全修飾クラス名（FQCN）でなければならないことに注意。
```

`Meta.AD`は、デフォルト値や属性が必須フィールドであるかどうかなど、属性に関する [オプションのメタデータ](http://bnd.bndtools.org/chapters/210-metatype.html) 。 属性値が必要であるがデフォルトが設定されていない場合、管理者はアプリケーションが正しく機能するように設定で値を設定する必要があることに注意してください。

次に、MVCポートレットによって構成がどのように読み取られるかを確認します。

## アプリケーションから構成を読み取る

1. アノテーション `@Component` では、コンフィギュレーション・インターフェース・クラスを `configurationPid` で指定する：

   ```java
   configurationPid = "com.acme.n2f3.web.internal.configuration.N2F3WebConfiguration"
   ```

1. 設定にアクセスするために、`render()` メソッドは `ConfigurationProvider` を利用する。 構成プロバイダーAPIは、さまざまなレベルのスコープで構成を取得するためのメソッドを提供します。 サンプルプロジェクトのコンフィギュレーションはインスタンススコープ付きで、コンフィギュレーションを取得するには `getCompanyConfiguration()` メソッドを使用します。

   ```{literalinclude} ./scoping-configurations/resources/liferay-n2f3.zip/n2f3-web/src/main/java/com/acme/n2f3/web/internal/portlet/N2F3Portlet.java
   :dedent: 1
   :language: java
   :lines: 37-43
   ```

   構成オブジェクトがリクエストオブジェクトに追加され、アプリケーションのJSPのリクエストから読み取ることができるようになりました。

## JSPから構成にアクセスする

1. 次のimportステートメントは、構成インターフェイスをJSPに追加します。

   ```markup
   <%@ page import="com.acme.n2f3.web.internal.configuration.N2F3WebConfiguration" %>
   ```

1. リクエストオブジェクトから構成オブジェクトが取得され、構成値が読み取られます。

   ```markup
   <%
   N2F3WebConfiguration n2f3WebConfiguration = (N2F3WebConfiguration)request.getAttribute(N2F3WebConfiguration.class.getName());
   %>
   ```

1. 属性 `fontColor()`、`fontFamily()`、`fontSize()` が JSP で使えるようになりました。

## ドロップダウン選択UIを実装する

サンプルプロジェクトには、構成可能な3つの属性があります。 現在、属性はテキスト入力フィールドに手動で入力する必要がありますが、これはさらにカスタマイズできます。

たとえば、入力フィールドの代わりに、フォントファミリー属性のドロップダウンリストを使用できます。 プロジェクトのコンフィギュレーション・インターフェイスで、`@Meta.AD`アノテーションを次のように置き換える：

```java
@Meta.AD(
	optionLabels = {"Arial", "Georgia", "Helvetica", "Tahoma", "Verdana"},
	optionValues = {"arial", "georgia", "helvetica", "tahoma", "verdana"},
required = false)
```

サンプルモジュールを再デプロイします。

![The font family is now a dropdown selection.](./setting-and-accessing-configurations/images/03.png)

これで、フォントファミリー属性はドロップダウン選択になります。

## Liferayの以前のバージョンでのConfigurationBeanDeclaration

```{important}
Liferay DXP 7.4 U51+とLiferay Portal 7.4 GA51+では、`ConfigurationBeanDeclaration`クラスは必要ありません。 構成インターフェースは、構成プロバイダーAPIに自動的に登録されます。
```

Liferay 7.4 Update/GA 51 より前のバージョンでは、Configuration Provider API で使用するために、Configuration クラスを `ConfigurationBeanDeclaration` で登録する必要があります。 ConfigurationBeanDeclaration`クラスには、設定インターフェースクラスを返すメソッドが1つある。 これにより、システムは構成の変更が生じたときにそれを追跡できるようになります。 例えば、N2F3ポートレットの場合、以下のようなクラスを作成します。

```java
@Component(service = ConfigurationBeanDeclaration.class)
public class N2F3WebConfigurationBeanDeclaration
	implements ConfigurationBeanDeclaration {

	@Override
	public Class<?> getConfigurationBeanClass() {
		return N2F3WebConfiguration.class;
	}

}
```

この例では、`com.acme.n2f3.web.internal.settings.definition` パッケージにクラスを配置します。

## さらなるカスタマイゼーション

* [コンフィギュレーションの分類](./categorizing-a-configuration.md)
* [スコーピング・コンフィギュレーション](./scoping-configurations)
* [フィールド・オプション プロバイダー](./field-options-provider.md)
