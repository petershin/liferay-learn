# カスタム注文ステータスの実装

`CommerceOrderStatus`インターフェイスを実装することにより、カスタム注文ステータスを追加できます。 commerce注文エンジンは、すぐに使用できる標準の注文フローを提供しますが、ニーズに合わせてカスタマイズできます。

カスタム注文ステータスは、既存の注文フローに追加された新しいステージです。 標準の注文フローでは処理されない注文処理プロセスが必要な場合は、カスタム注文ステータスが必要です。 最初に、注文ステータスがどのように機能するかを学び、次に新しい実装例をデプロイします。

## 注文ステータスの概要

Liferay Order Engineには、6つの主要なステータス、1) Open、2) In Progress、3) Pending、4) Processing、5) Shipped、6) Completedがあります。

![Liferay Commerceには、デフォルトで6つの注文ステータスが含まれています。](./implementing-a-custom-order-status/images/01.png)

Order Engineは、各注文ステータスに対してチェックを実行して、正しい注文処理を確認し、注文に適用される次のステータスを決定します。 上記の主なステータスに加えて、注文は3つの代替ステータスに移行できます。

![注文は3つの代替ステータスに移行できます。](./implementing-a-custom-order-status/images/02.png)

1. **On Hold** - 注文が非最終注文ステータス（Pending、Processing、Shipped）のいずれかにある場合、注文を保留にすることができます。

1. **Cancelled** - 注文が最終以外の注文ステータス（Pending、Processing、Shipped）のいずれかにある場合、注文をキャンセルできます。

1. **Partially Shipped** - 注文に複数のアイテムがあり、一部のアイテムが出荷されていない場合、 **Partially Shipped** ステータスに移行します。

![注文フローに新しい注文ステータスを追加できます。](./implementing-a-custom-order-status/images/03.png)

カスタム注文ステータスを追加して、すぐに使用できる注文フローを変更できます。 以下では、 **Scheduling** という注文ステータスを追加し、既存の **Pending** ステータスと **Processing** ステータスの間に配置します。 このカスタムステージは、注文が受け付けられる前にスケジュールされるのを待機している注文を表します。 注文のカスタムフィールドは、Schedulingステータスを追跡します。 各注文ステータスとその移行の詳細については、 [commerce注文エンジンの概要 (近日公開！)](./commerce-order-engine-overview.md) を参照してください。

## 注文ステータスのデプロイ

1. Liferay Commerceを開始します。

    ```bash
    docker run -it -p 8080:8080 liferay/portal:7.4.1-ga2
    ```

1. Acme Commerce Order Status Methodをダウンロードして解凍します。

    ```bash
    curl https://resources.learn.liferay.com/commerce/latest/en/developer-guide/order-management/liferay-m4v7.zip

    unzip liferay-m4v7.zip
    ```

1. サンプルをビルドしてデプロイします。

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    !!! note
        このコマンドは、デプロイされたjarをDockerコンテナの`/opt/liferay/osgi/modules`にコピーするのと同じです。

1. Dockerコンテナコンソールでデプロイを確認します。

    ```bash
    STARTED com.acme.m4v7.impl_1.0.0
    ```

1. 注文のスケジュールを追跡するには、カスタムフィールドを作成する必要があります。 **アプリケーションメニュー**（![Applications Menu](../../images/icon-applications-menu.png)）をクリックし、 ［**コントロールパネル**］ → ［**カスタムフィールド**］ に移動します。

1. アイテムの一覧から［commerce注文］を選択し、 **追加**（![Add](../../images/icon-add.png)）ボタンをクリックして新しいフィールドを追加します。 使用可能なフィールドから ［**ドロップダウン**］ オプションを選択し、以下の情報を入力します。 完了したら、 ［**保存**］ をクリックします。

**項目名** ：m4v7Scheduling

**データ型** : Text

**Values** ：Pending、Confirmed（2つの別々の行に）

 ![注文のスケジュールを追跡するには、カスタムフィールドを追加します。](./implementing-a-custom-order-status/images/04.png)

1. ブラウザを開いて`https://localhost:8080`にアクセスし、アプリケーションメニュー（![Applications Menu](../../images/icon-applications-menu.png)）からサイトに移動して注文することにより、注文ステータスの例が追加されたことを確認します。

1. もう一度アプリケーションメニューをクリックし、 ［**commerce**］ → ［**注文**］ に移動して、発注した注文を選択します。 新しいステータス ［**Scheduling**］ と、進行中の新しい注文フローを設定する［Scheduling］というボタンが注文ライフサイクルに表示されます。 新しいカスタムフィールドは、注文の ［**カスタムフィールド**］ セクションの下にあります。

   ![進行中の新しい注文ステータス。](./implementing-a-custom-order-status/images/05.gif)

## カスタム注文ステータスの仕組み

実装例は3つのステップで実装されます。 最初に、OSGi登録用にクラスに注釈を付ける必要があります。 次に、 [`CommerceOrderStatus`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/order/status/CommerceOrderStatus.java) インターフェイスを確認します。 最後に、カスタムの`CommerceOrderStatus`の実装を終了します。

- [OSGi登録用にクラスに注釈を付ける](#annotate-the-class-for-osgi-registration)
- [`CommerceOrderStatus`インターフェイスを確認する](#review-the-commerceorderstatus-interface)
- [注文ステータスを完了する](#complete-the-order-status)

!!! important
    注文ライフサイクルで新しいステータスを配置する段階に応じて、正しい注文処理のために次の段階を微調整する必要があります。 この例では、新しいステータスをPendingステータスとProcessingステータスの間に配置するため、既存のProcessingステータスをオーバーライドして、ロジックで新しいステータスをチェックする必要があります。

### OSGi登録用にクラスに注釈を付ける

```{literalinclude} ./implementing-a-custom-order-status/resources/liferay-m4v7.zip/m4v7-impl/src/main/java/com/acme/m4v7/internal/commerce/order/status/M4V7SchedulingCommerceOrderStatus.java
    :language: java
    :lines: 17-23
```

Liferay Commerceが注文ステータスレジストリ内の他のステータスと新しいステータスを区別できるように、注文ステータスに個別のキーを提供することが重要です。 すでに使用されているキーを指定すると、既存の関連付けられているステータスが上書きされます。 注文ステータスの優先度によって、注文ライフサイクルでの注文が決まります。 この場合、Pendingステータスの優先度は30で、Processingステータスの優先度は50です。 2つの間にステータスを配置するには、優先度がこれら2つの数値の間にある必要があります（この場合は40）。

!!! note
    この実装例では、ランダムな整数がキーとして設定され、40が優先度として設定されていますが、コード内で読みやすくするために変数を使用できます。  [here](https://gist.github.com/aswinrajeevofficial/5d09d76ae11a1dc78c7d1fc388ae0306#file-m4v7schedulingcommerceorderstatus-java) の例を参照してください。

### CommerceOrderStatusインターフェイスを確認する

次のメソッドを実装します。

```java
public String getLabel(Locale locale);
```

このメソッドは、注文ステータスの名前を返します。 この名前は、UIに表示される名前に対応する言語キーの場合があります。 この場合、文字列 **Scheduling** が返されます。

```java
public int getKey();
```

このメソッドは、注文ステータスの一意のキーを返します。 既存のキーを使用すると、そのステータスが上書きされます。

```java
public int getPriority();
```

このメソッドは、注文ステータスの優先度を返します。 これは、このステータスが配置されるステージを決定するために使用されます。

```java
public boolean isTransitionCriteriaMet(CommerceOrder commerceOrder) throws PortalException;
```

このメソッドは、注文が現在の注文ステータスに指定されたすべての移行基準を満たしているかどうかを確認します。

```java
public CommerceOrder doTransition(CommerceOrder commerceOrder, long userId) throws PortalException;
```

このステータスの移行基準が満たされると、`doTransition`メソッドは、注文がこのステータスに移行するために必要なすべてのアクションを実行します。

```java
public boolean isComplete(CommerceOrder commerceOrder);
```

このメソッドは、注文ステータスがアクションを完了し、次のステータスに移行する準備ができているかどうかを確認します。 Schedulingステータスの場合、カスタムフィールド値が［Pending］かどうか、または［Confirmed］で［Processing］ステージに移行する準備ができているかどうかを確認します。

インターフェイスにはさらに2つのメソッドがあります。 最初の`public boolean isValidForOrder(CommerceOrder commerceOrder) throws PortalException`は、ステータスが注文に適用可能かどうかをチェックします。   2番目の`public boolean isWorkflowEnabled(CommerceOrder commerceOrder) throws PortalException`は、ステータスに関連付けられているワークフローがあるかどうかをチェックします。 この例では、これらのメソッドを実装する必要はありません。

### 注文ステータスを完了する

注文ステータスの実装は、Schedulingステータスのメソッドの実装と、Processingステータスに存在する既存のビジネスロジックの微調整で構成されます。

- [`isTransitionCriteriaMet`メソッドを実装する](#implement-the-istransitioncriteriamet-method)
- [`doTransition`メソッドを実装する](#implement-the-dotransition-method)
- [`isComplete`メソッドを実装する](#implement-the-iscomplete-method)
- [既存の **Processing** ステータスをオーバーライドする](#override-the-existing-processing-status)
- [Processingステータスのビジネスロジックを微調整する](#tweak-the-processing-status-business-logic)

#### isTransitionCriteriaMetメソッドを実装する

```{literalinclude} ./implementing-a-custom-order-status/resources/liferay-m4v7.zip/m4v7-impl/src/main/java/com/acme/m4v7/internal/commerce/order/status/M4V7SchedulingCommerceOrderStatus.java
    :dedent: 1
    :language: java
    :lines: 65-76
```

注文を **Scheduling** 注文ステータスに移行するには、注文が **Pending** ステータスである必要があります。 これは、`commerceOrder`オブジェクトの`getOrderStatus()`メソッドを使用してチェックされます。  このメソッドは、注文が保留中の場合は`true`を返し、それ以外の場合は`false`を返します。

#### doTransitionメソッドを実装する

```{literalinclude} ./implementing-a-custom-order-status/resources/liferay-m4v7.zip/m4v7-impl/src/main/java/com/acme/m4v7/internal/commerce/order/status/M4V7SchedulingCommerceOrderStatus.java
    :dedent: 1
    :language: java
    :lines: 26-34
```

注文の移行基準が満たされると、一意のキーを使用して注文ステータスが **Scheduling** として設定されます。 次に、`_commerceOrderService`から`updateCommerceOrder()`メソッドを呼び出し、`commerceOrder`オブジェクトを渡して新しいステータスを更新します。

#### isCompleteメソッドを実装する

```{literalinclude} ./implementing-a-custom-order-status/resources/liferay-m4v7.zip/m4v7-impl/src/main/java/com/acme/m4v7/internal/commerce/order/status/M4V7SchedulingCommerceOrderStatus.java
    :dedent: 1
    :language: java
    :lines: 51-63
```

Schedulingステージを完了するには、カスタムフィールドを ［**Confirmed**］ に設定する必要があります。 このカスタム属性は、キー`m4v7Scheduling`を使用して`ExpandoBridge`を介して取得されます。 これはドロップダウンであるため、戻り値はString配列内にあり、最初の値です。 値が ［**Confirmed**］ の場合、メソッドは`true`を返し、配列が空の場合は`false`を返します。

#### 既存のProcessingステータスをオーバーライドする

```{literalinclude} ./implementing-a-custom-order-status/resources/liferay-m4v7.zip/m4v7-impl/src/main/java/com/acme/m4v7/internal/commerce/order/status/M4V7ProcessingCommerceOrderStatus.java
    :language: java
    :lines: 15-22
```

内部に存在するロジックを微調整するには、既存のProcessingステータスをオーバーライドする必要があります。 これは、OSGi登録用にクラスに注釈を付け、既存のステータスと同じキーと優先度を使用することによって行われます。 `service.ranking`は、オーバーライドされたステータスに対して100に設定されるため、既存のステータスよりも優先されます。

#### Processingステータスのビジネスロジックを微調整する

```{literalinclude} ./implementing-a-custom-order-status/resources/liferay-m4v7.zip/m4v7-impl/src/main/java/com/acme/m4v7/internal/commerce/order/status/M4V7ProcessingCommerceOrderStatus.java
    :dedent: 1
    :language: java
    :lines: 54-74
```

元のProcessingステータスはそのメソッドでPendingステータスをチェックするため、新しく追加されたステータスをチェックするには、それらを少し微調整する必要があります。 これは、新しいステータスの一意のキーを使用して行われます。

## まとめ

　 `CommerceOrderStatus`インターフェイスを実装するための基本を理解し、Liferay Commerceに新しい注文ステータスを追加しました。

## 関連トピック

- [commerce注文エンジンの概要 (近日公開！)](./commerce-order-engine-overview.md)