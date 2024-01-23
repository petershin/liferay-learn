# カスタム注文ルールの実装

Liferayでは、特定の条件を満たした注文に対して注文ルールを設定することができます。 最少注文金額のルールは、すぐに利用可能です。 特定の値以下の注文のチェックアウトを防ぐことができます。 新しい注文ルールを追加するには、 [`COREntryType`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-order-rule-api/src/main/java/com/liferay/commerce/order/rule/entry/type/COREntryType.java) インターフェースを実装する必要があります。 詳しくは、 [コマースの注文ルール](https://learn.liferay.com/commerce/latest/ja/order-management/order-rules.html) をご覧ください。

## カスタム注文ルールのデプロイと言語キーの追加

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順に従います。

1. Acme Commerce Order Ruleをダウンロードし、解凍します。

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/developer-guide/order-management/liferay-x9k1.zip

   unzip liferay-x9k1.zip
   ```

1. サンプルをビルドしてデプロイします。

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   ```{note}
   このコマンドは、デプロイされたjarをDockerコンテナの`/opt/liferay/osgi/modules`にコピーするのと同じです。
   ```

1. Dockerコンテナコンソールでデプロイを確認します。

   ```bash
   STARTED com.acme.x9k1.impl_1.0.0
   ```

1. 管理者としてログインし、 **グローバルメニュー**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 ［**コントロールパネル**］ &rarr; ［**言語オーバーライド**］ をクリックしてください。 **追加** ボタン(![Add icon](../../images/icon-add.png))をクリックし、以下のキーを追加します。

   | 言語キー                        | 値          |
   |:--------------------------- |:---------- |
   | x9k1-minimum-order-quantity | X9K1 最小注文数 |
   | minimum-quantity            | 最小数        |

   ```{important}
   Liferay DXP 7.4 U4以降、またはLiferay Portal 7.4 GA8以降の言語オーバーライドツールで言語キーを追加することができます。 以前のバージョンでは、ビルドとデプロイの前に、 `/src/main/resources/content/`の下に`Language.properties`ファイルを追加し、キーを指定する必要があります。
   ```

1. **グローバルメニュー**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 ［**commerce**］ &rarr; ［**注文ルール**］ をクリックしてください。

1. **追加** ボタン(![Add icon](../../images/icon-add.png))をクリックし、以下の情報を入力します。

   **名前：** Minimum Order Quantity - 3

   ［**Description］：** Testing minimum order quantity of 3 items

   ［**Type］：** X9K1 Minimum Order Quantity

   ![カスタム注文ルールの名前、説明、タイプを入力します。](./implementing-a-custom-order-rule/images/01.png)

1. ［**Submit**］ をクリックします 。

1. ［**Configuration**］ セクションで、 ［**Minimum Quantity**］ を **3** に設定します。

1. 新しい注文ルールを有効にするには、［アクティブ］トグルをクリックします。

   ![最小数を3に設定し、有効トグルを使用して新しい注文ルールを有効にします。](./implementing-a-custom-order-rule/images/02.png)

1. ［**Publish**］ をクリックします。

1. **グローバルメニュー**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 ［**コントロールパネル**］ &rarr; ［**サイト**］ をクリックし、新しいMiniumデモサイトを追加してください。

1. バイヤーとしてログインし、商品をカートに追加します。 **Submit** をクリックしてチェックアウトします。

注文数が3個以下の場合、警告メッセージが表示されます。 この条件を満たすまで、チェックアウトはできません。

![注文数が3個以下の場合、警告メッセージが表示されます。](./implementing-a-custom-order-rule/images/03.png)

```{important}
注文ルールを有効にすると、すべてのアカウント、アカウントグループ、注文タイプ、チャネルに適用されます。 適合性をコントロールするには、注文ルールの*［適合性］*タブをクリックし、適切なオプションを選択します。 
```

## カスタム注文ルールの仕組み

この例では、主に9つの手順を示します。

1. [OSGi登録用に注文ルールに注釈を付ける](#annotate-the-order-rule-for-osgi-registration)
1. [`COREntryType`インターフェイスを確認する](#review-the-corentrytype-interface)
1. [`COREntryType`の実装を完了する](#complete-the-corentrytype-implementation)
1. [ディスプレイコンテキストを追加する](#add-a-display-context)
1. [最小数値を取得するユーティリティクラスを追加する](#add-a-utility-class-to-retrieve-the-minimum-quantity-value)
1. [OSGi登録用のJSPコントリビュータに注釈を付ける](#annotate-the-jsp-contributor-for-osgi-registration)
1. [`COREntryTypeJSPContributor`インターフェイスを確認する](#review-the-corentrytypejspcontributor-interface)
1. [JSPコントリビューターの実装を完了する](#complete-the-jsp-contributor-implementation)
1. [注文ルールの設定をレンダリングするJSPを追加する](#add-a-jsp-to-render-the-configuration-of-the-order-rule)

### OSGi登録用に注文ルールに注釈を付ける

```{literalinclude} ./implementing-a-custom-order-rule/resources/liferay-x9k1.zip/x9k1-impl/src/main/java/com/acme/x9k1/internal/commerce/order/rule/entry/type/X9K1MinimumQuantityCOREntryTypeImpl.java
    :language: java
    :lines: 18-26
```

Liferay Commerceが注文ルールレジストリの他のものと区別できるように、注文ルールに個別のキーを指定する必要があります。 すでに使用されているキーを指定すると、既存の関連付けられているタイプが上書きされます。 順番は、ドロップダウンでのソート順で決まります。 この場合、順序は1であり、ドロップダウンの2番目の項目として表示されます。

### `COREntryType`インターフェイスを確認する

以下のメソッドを実装します。

```java
public boolean evaluate(COREntry corEntry, CommerceOrder commerceOrder) throws PortalException;
```

このメソッドは、注文ルールを評価し、条件が満たされるかどうかによって、trueまたはfalseを返します。

```java
public String getErrorMessage(COREntry corEntry, CommerceOrder commerceOrder, Locale locale)  throws PortalException;
```

評価されたメソッドがfalseを返した場合、このメソッドはユーザーに警告を表示するエラーメッセージを含む文字列を返します。

```java
public String getKey();
```

このメソッドは、注文ルールの一意のキーを返します。 既存のキーを使用すると、その注文ルールが上書きされます。

```java
public String getLabel(Locale locale);
```

このメソッドは、UIに表示される注文ルールの名前を返します。 これは、言語キーまたは文字列です。

### `COREntryType`の実装を完了する

```{literalinclude} ./implementing-a-custom-order-rule/resources/liferay-x9k1.zip/x9k1-impl/src/main/java/com/acme/x9k1/internal/commerce/order/rule/entry/type/X9K1MinimumQuantityCOREntryTypeImpl.java
    :language: java
    :lines: 28-94
    :dedent: 1
```

オーダールールを完了するには、上記のメソッドを実装する必要があります。 注文ルールで設定された注文数と最小数を取得するための2つのユーティリティメソッドが追加されました。 最初に上書きされるメソッドは `evaluate()`で、現在の注文が注文ルールをパスするかどうかをチェックします。 そうであればtrueを、そうでなければfalseを返します。

2番目のメソッドは、注文ルールを満たさない注文のエラーメッセージを取得します。 すべての用語を含む`StringBuilder`から変換された Stringを返します。 3番目のメソッドはユニークキーを返し、最後のメソッドはUIに表示されるラベルを返します。

注文ルールの最小数と合計注文数を取得するための2つのメソッドが追加されています。 最初のメソッドは、ユーティリティクラス `X9K1MinimumQuantityUtil`にあります。 2 つ目のメソッドは `_getOrderQuantity(CommerceOrder commerceOrder)`です。 注文に含まれる個々の商品の数量の合計として、合計注文数を返します。

### ディスプレイコンテキストを追加する

```{literalinclude} ./implementing-a-custom-order-rule/resources/liferay-x9k1.zip/x9k1-impl/src/main/java/com/acme/x9k1/internal/commerce/order/rule/web/display/context/X9K1MinimumQuantityDisplayContext.java
    :language: java
    :lines: 7-19
```

このコードは、 `COREntry` というタイプの単一のフィールドを含む表示コンテキストから、注文ルール用に設定された最小数の値を取得し、作成された注文ルールを使って設定されます。 表示コンテキストには、オーダールールに設定された最小数を取得するためのメソッドが1つあり、以下の詳細なユーティリティクラスを使用します。

### 最小数値を取得するユーティリティクラスを追加する

```{literalinclude} ./implementing-a-custom-order-rule/resources/liferay-x9k1.zip/x9k1-impl/src/main/java/com/acme/x9k1/internal/commerce/order/rule/entry/util/X9K1MinimumQuantityUtil.java
    :language: java
    :lines: 8-20
```

`X9K1MinimumQuantityUtil`クラスは、注文ルールに設定された最小量を取得します。 JSPkeyで設定されたプロパティ名で値を取得します。

### OSGi登録用のJSPコントリビュータに注釈を付ける

```{literalinclude} ./implementing-a-custom-order-rule/resources/liferay-x9k1.zip/x9k1-impl/src/main/java/com/acme/x9k1/internal/commerce/order/rule/web/entry/type/X9K1MinimumQuantityCOREntryTypeJSPContributor.java
    :language: java
    :lines: 18-24
```

`commerce.order.rule.entry.type.jsp.contributor.key` プロパティは、JSPコントリビュータが実装される注文ルールを決定します。

### `COREntryTypeJSPContributor`インターフェイスを確認する

```java
public void render(long corEntryId, HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse) throws Exception;
```

`COREntryTypeJSPContributor`インターフェースは、JSPをレンダリングするメソッドを1つ含んでいます。 このメソッドは、引数として注文ルールのIDと、 `HTTPServletRequest`および`HTTPServletResponse`型のオブジェクトを要求します。

### JSPコントリビューターの実装を完了する

```{literalinclude} ./implementing-a-custom-order-rule/resources/liferay-x9k1.zip/x9k1-impl/src/main/java/com/acme/x9k1/internal/commerce/order/rule/web/entry/type/X9K1MinimumQuantityCOREntryTypeJSPContributor.java
    :language: java
    :lines: 26-52
    :dedent: 1
```

JSPコントリビューターを完了させるには、`render()` メソッドを実装する必要があります。 `_corEntryLocalService`と`corEntryId`を用いて、 `COREntry`を取得します。 次に、取得した`corEntry`を使用して、 `X9K1MinimumQuantityDisplayContext`型の新しい表示コンテキストを作成します。 このコンテキストには、`httpServletRequest`が設定されます。 `servletContext`は、`bnd.bnd`ファイルから Bundle-Symbolic-Nameを参照します。 `JSPRenderer`は`renderJSP()`メソッドでJSPファイルをレンダリングします。 引数として、JSPの相対パス、`servletContext`、 `httpServletRequest`、`httpServletResponse`を許可します。

### 注文ルールの設定をレンダリングするJSPを追加する

```{literalinclude} ./implementing-a-custom-order-rule/resources/liferay-x9k1.zip/x9k1-impl/src/main/resources/META-INF/resources/minimum_quantity.jsp
    :language: jsp
    :lines: 1-27
```

JSPには、注文ルールの最小数を許可する入力フィールドが1つあります。 これは、表示コンテキストを通じて取得され、カスタム注文ルール内で評価されます。 表示コンテキストはユーティリティクラスを使用し、タイプ設定コンフィギュレーションから`最小量`の名前を使用してフィールドを取得します。 `getMinimumQuantity()`メソッドは、既存の値がある場合はそれを取得します。

## まとめ

　 これで`COREntryType`インターフェースの実装の基本がわかり、Liferay Commerceに新しい注文ルールが追加されました。
