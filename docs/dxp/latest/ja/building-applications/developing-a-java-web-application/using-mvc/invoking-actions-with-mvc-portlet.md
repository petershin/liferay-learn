# MVCポートレットを使用したアクションの呼び出し

ポートレットの [**アクションフェーズ**](../reference/portlets.md#portlet-phases) は、状態の変更を適用します。 ポートレットのアクション処理メソッドを、 **ポートレット・アクションURL** を使ってUIコンポーネントにバインドすることができます。 これらは `portlet:actionURL` JSPタグであり、ユーザーのリクエストをアクションを実行するポートレットメソッドにマップします。

ここでは、アクションURLを3つの異なる方法で使用するサンプルポートレットを呼び出して調べる方法を学習します。

## アクションを処理するMVCポートレットをデプロイする

サンプルのMVCポートレットには、個別のポートレットメソッドにマッピングする3つのポートレットアクションURLがあります。

```{include} /_snippets/run-liferay-portal.md
```

次に、以下の手順に従ってポートレットを配置し、そのアクションをトリガーしてください：

1. サンプルをダウンロードして解凍します。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/developing-a-java-web-application/using-mvc/liferay-t9u3.zip -O
   ```

   ```bash
   unzip liferay-t9u3.zip
   ```

1. サンプルをビルドしてデプロイします。

   ```bash
   cd liferay-t9u3
   ```

   ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

    ```{note}
    このコマンドはDockerコンテナ上の `/opt/liferay/osgi/modules` にモジュールJARをコピーするのと同じです。
    ```

1. Dockerコンテナコンソールでデプロイを確認します。

   ```bash
   STARTED com.acme.t9u3.web_1.0.0
   ```

1. **Samples** カテゴリの **T9U3 Portlet** ウィジェットをウィジェット・ページに追加します。 T9U3ポートレットが表示されます。

   ![You've added the T9U3 Portlet to a page.](./invoking-actions-with-mvc-portlet/images/01.png)

   ポートレットには3つのリンクがあります。

   * **Do Something**
   * **Do Something Else**
   * **Do Something More**

   各リンクをクリックすると、異なるアクション処理メソッドが呼び出されます。 学習の目的で、各メソッドはそれ自体を識別するメッセージをログに記録します。

1. **Do Something** をクリックする。 ポートレットは `doSomething` メソッドの呼び出しをログに記録します。

   ```bash
   [T9U3Portlet:28] Invoke #doSomething(ActionRequest, ActionResponse)
   ```

1. **Do Something Else** をクリックする。 ポートレットは `doSomethingElse` メソッドの呼び出しをログに記録します。

   ```bash
   [T9U3Portlet:36] Invoke #doSomethingElse(ActionRequest, ActionResponse)
   ```

1. もっと何かをする」をクリックする。 ポートレットは `doSomethingMore` メソッドの呼び出しをログに記録します。

   ```bash
   [T9U3Portlet:45] Invoke #doSomethingMore(ActionRequest, ActionResponse)
   ```

これらのアクションは簡単ですが、UIコンポーネントをポートレットのアクション処理メソッドにマッピングするさまざまな方法を示しています。 次に、それらがどのように機能するかを学びます。

## ポートレットのアクション処理メソッドを調べる

`T9U3Portlet` クラスは標準の [`MVCPortlet`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/portlet/bridges/mvc/MVCPortlet.java) で、3つのアクション処理メソッドを持つ。

```{literalinclude} ./invoking-actions-with-mvc-portlet/resources/liferay-t9u3.zip/t9u3-web/src/main/java/com/acme/t9u3/web/internal/portlet/T9U3Portlet.java
:language: java
:lines: 14-53
```

[`@Component`](https://osgi.org/javadoc/r6/residential/org/osgi/service/component/annotations/Component.html) アノテーションは、 [`Portlet`](https://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/Portlet.html) サービスを提供する OSGi Declarative Services Component としてクラスをマークします。 プロパティは、ポートレットを **Sample** ウィジェット・カテゴリで利用可能にし、ポートレットに **T9U3 Portlet** という名前を付け、ポートレットのデフォルト・ビュー・テンプレートを `/view.jsp` に設定します。

各メソッドは [`ActionRequest`](https://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/ActionRequest.html) と [`ActionResponse`](https://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/ActionResponse.html) のパラメータを受け取る。 `ActionRequest`はメソッドの情報を提供し、`ActionResponse`はメソッドが情報を渡す手段を提供する。 各サンプルメソッドは、ログメッセージで自身を識別します。

JSP（以下で説明）は、ポートレットアクションURLを使用してサンプルメソッドにマッピングします。 最初の2つのメソッドは、名前を除いて同じです。 最後のメソッドは、`@ProcessAction(name = "nameForTheDoSomethingMoreMethod")`アノテーションのおかげで際立っている。 ポートレットのアクションURLは、メソッド名の代わりに [`@ProcessAction`](https://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/ProcessAction.html) アノテーション名を使ってメソッドにマッピングできます。 例えば `ProcessAction` という名前を使うことで、ポートレットのアクション URL を壊すことなく、メソッド名を変更したり、アノテーションを別のメソッドに割り当てることができます。 JSPのポートレットアクションURLを調べることで理解しやすくなります。

## JSPを調べる

`view.jsp`はポートレットのアクションURLを使用して、UIコンポーネントをポートレットのアクション処理メソッドにバインドします。 以下は `view.jsp` のコードである：

```{literalinclude} ./invoking-actions-with-mvc-portlet/resources/liferay-t9u3.zip/t9u3-web/src/main/resources/META-INF/resources/view.jsp
:language: javascript
```

最初の行は、接頭辞 `portlet` を使って Portlet 2.0 タグライブラリを利用できるようにしています。 このJSPはタグライブラリの`portlet:actionURL`タグを使ってUIコンポーネントにアクションをバインドします。 各アクションURLを調べます。

## 例1：変数によるアクションURLの参照

`view.jsp`は次のポートレット・アクションのURLを宣言します。

```{literalinclude} ./invoking-actions-with-mvc-portlet/resources/liferay-t9u3.zip/t9u3-web/src/main/resources/META-INF/resources/view.jsp
:language: javascript
:lines: 3
```

`portlet:actionURL`の`name`属性は`doSomething` ポートレットメソッドにマッピングされます。 `var`属性はポートレットのアクションURLを任意の変数に代入します。 このJSPは`actionURL`変数を参照することで、`Do Something`と書かれたハイパーリンクにアクションのURLをバインドします。

```{literalinclude} ./invoking-actions-with-mvc-portlet/resources/liferay-t9u3.zip/t9u3-web/src/main/resources/META-INF/resources/view.jsp
:dedent: 1
:language: javascript
:lines: 8
```

このリンクをクリックすると、ポートレットの `doSomething` メソッドが呼び出されます。 アクションURLの変数を参照することにより、アクションURLを複数のUIコンポーネントにバインドできます。

## 例2：UIコンポーネントでアクションURLを宣言する

JSPは、アンカーコンポーネントで別のアクションURLを直接宣言します。

```{literalinclude} ./invoking-actions-with-mvc-portlet/resources/liferay-t9u3.zip/t9u3-web/src/main/resources/META-INF/resources/view.jsp
:dedent: 1
:language: javascript
:lines: 12
```

コンポーネントはポートレットの `doSomethingElse` メソッドにアクションをバインドするアクション URL を宣言します。 これは、アクションURLをマッピングするためのよりコンパクトな方法です。

## 例3：ポートレットアクション名の参照

最後のアンカーでは、JSPは `nameForTheDoSomethingMoreMethod` ポートレットアクション名に関連付けられたアクション処理メソッドにマップするアクションURLを宣言しています。

JSPアクションURL：

```{literalinclude} ./invoking-actions-with-mvc-portlet/resources/liferay-t9u3.zip/t9u3-web/src/main/resources/META-INF/resources/view.jsp
:dedent: 1
:language: javascript
:lines: 16
```

ポートレットメソッド：

```{literalinclude} ./invoking-actions-with-mvc-portlet/resources/liferay-t9u3.zip/t9u3-web/src/main/java/com/acme/t9u3/web/internal/portlet/T9U3Portlet.java
:dedent: 1
:language: java
:lines: 41-49
```

`nameForTheDoSomethingMoreMethod`と呼ばれるポートレットパラメータは、アクションURLとメソッドの間の緩い結合を提供します。 例えば、メソッド名を変更したり、`@ProcessAction(name = "nameForTheDoSomethingMoreMethod")`アノテーションを別のメソッドに割り当てることができる。

## 次のステップ

アクションURLの使用方法がわかったので、アクションメソッドの作成に集中できます。 あるいは、 [MVCActionCommand クラス](./mvc-action-command.md) を使って調べることもできる。 あるいは、他のポートレットのフェーズを処理する準備ができたら、 [MVCRenderCommand](./mvc-render-command.md) と [MVCResourceCommand](./mvc-resource-command.md) クラスを使用してください。

## 関連トピック

* [MVCActionCommand classes](./mvc-action-command.md)
* [MVCRenderCommand](./mvc-render-command.md)
* [MVCResourceCommand](./mvc-resource-command.md)
* [MVCポートレットでのローカライズされたメッセージの使用](./using-localized-messages-in-an-mvc-portlet.md)
