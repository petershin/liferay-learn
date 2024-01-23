# カスタム通知タイプの実装

Liferay Commerceは、ストアの様々なイベントトリガーに対してメール通知を送信するように設定することができます。 ニーズに合う、すぐに使える通知トリガーがない場合、自分で実装することができます。

新しい通知タイプを追加するには、`CommerceNotificationType`インターフェイスを実装する必要があります。 [メール送信](../../store-management/sending-emails.md) を参照して、通知テンプレートの設定方法と利用可能な OOTB タイプを確認します。

## 通知タイプの概要

通知はチャネルに範囲設定されています。 チャンネル設定の下に新しい通知テンプレートを作成することができ、通知タイプに基づいてトリガーされます。

![通知テンプレートは、イベントのフローを定義します。](./implementing-a-custom-notification-type/images/01.png)

上の図は、 **G2F3 Shipment Created** というタイプの通知テンプレートを示しています。 これは、新しい出荷の作成のためにトリガーされます。 出荷の作成中、通知テンプレートに記載されているように、受信者/受信者に通知が送信されます。 テンプレートの宛先、件名、本文フィールドにワイルドカードを使用することができ、これらは送信前に解決されます。

## 通知タイプのデプロイと言語キーの追加

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順に従います:

1. アクメ商会通知型をダウンロードし、解凍します。

    ```bash
    curl https://resources.learn.liferay.com/commerce/latest/en/developer-guide/order-management/liferay-g2f3.zip

    unzip liferay-g2f3.zip
    ```

1. サンプルをビルドしてデプロイします。

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    !!! note
        このコマンドは、デプロイされたjarをDockerコンテナの`/opt/liferay/osgi/modules`にコピーするのと同じです。

1. Dockerコンテナコンソールでデプロイを確認します。

    ```bash
    STARTED com.acme.g2f3.impl_1.0.0
    ```

2. 管理者としてログインし、 **グローバルメニュー**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 ［**コントロールパネル**］ &rarr; ［**言語オーバーライド**］ をクリックしてください。 **追加** ボタン (![Add icon](../../images/icon-add.png)) をクリックし、以下のキーを追加します。

    | 言語キー                                        | 値               |
    |:------------------------------------------- |:--------------- |
    | g2f3-shipment-created                       | G2F3 作成された出荷    |
    | g2f3-shipment-creator-name-definition-term  | 注文を作成したアカウント名   |
    | g2f3-order-shipping-address-definition-term | 配送先住所           |
    | g2f3-shipment-id-definition-term            | 出荷ID            |
    | g2f3-shipment-creator-email-definition-term | 出荷を作成したユーザーのメール |

    !!! important
        Liferay DXP 7.4 U4以降、またはLiferay Portal 7.4 GA8以降の言語オーバーライド ツールで言語キーを追加することができます。 以前のバージョンでは、ビルドとデプロイの前に、 `/src/main/resources/content/` の下に `Language.properties` ファイルを追加し、キーを指定する必要があります。

3. **グローバルメニュー**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 ［**コマース**］ &rarr; ［**チャネル**］ をクリックし、 ［**通知テンプレート**］ を選択します。

4. **追加** ボタン (![Add icon](../../images/icon-add.png)) を使用して、新しいテンプレートを作成します。

    **名前:** 作成されたG2F3出荷テスト

    **タイプ:** 作成されたG2F3出荷

    **宛先:**[%SHIPMENT_CREATOR_EMAIL%]

    **送信者メールアドレス:** test@liferay.com

    **送信者名:** 管理者

    **件名:** 作成された新しい出荷 - 出荷ID: [%SHIPMENT_ID%]

    **Body:**

    **Hi,**

    [**%SHIPMENT_CREATOR_NAME%**]によって、新しい出荷が作成されました

    **配送先住所:**
    [**%ORDER_SHIPPING_ADDRESS%**]

    **ありがとうございます。**

    **管理者**

5. ［**保存**］をクリックします。

6. **グローバルメニュー**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 ［**コントロールパネル**］ &rarr; ［**サイト**］ をクリックし、新しいMiniumデモサイトを追加してください。

7. 購入者としてログインし、ストアで新しく注文をします。

8. 管理者としてログアウトしてログインし直し、 **グローバルメニュー** を開いて、 ［**コマース**］ &rarr; ［**注文**］ をクリックします。

9. 注文を選択し、 ［**受注**］ をクリックします。 次に、 ［**出荷を作成**］ をクリックします。

10. 受信通知を受信トレイで確認してください。

!!! important
    [MockMock](https://github.com/tweakers/MockMock) などの偽のSMTPサーバを使って、ローカル開発環境下でこれらの通知をテストすることができます。 `Portal-ext.properties` ファイルに以下の行を追加します。`mail.send.blacklist=noreply@liferay.com, noreply@domain.invalid, test@domain.invalid`. `java -jar MockMock.jar`でjarを実行し、受信したメールを `localhost:8282` でチェックします。

## カスタム通知タイプの仕組み

この例は、主に7つのステップで構成されています。 最初に、OSGi登録用にクラスに注釈を付ける必要があります。 次に、 [CommerceNotificationType](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-notification-api/src/main/java/com/liferay/commerce/notification/type/CommerceNotificationType.java) のインターフェイスを確認します。 次に、カスタムの`CommerceNotificationType`の実装を終了します。

その後、`ModelListener`を`CommerceShipment`クラスに対して作成します。 次に、`CommerceDefinitionTermContributor`インターフェイスを確認します。 最後に、新しい通知のワイルドカードを解決するために、用語コントリビューターを実装します。

- [OSGi登録用にクラスに注釈を付ける](#annotate-the-class-for-osgi-registration)
- [CommerceNotificationTypeインターフェースの確認](#review-the-commercenotificationtype-interface)
- [通知タイプの完了](#complete-the-notification-type)
- [CommerceShipmentのModelListenerを作成します。](#create-a-modellistener-for-commerceshipment)
- [CommerceDefinitionTermContributorインターフェースの確認](#review-the-commercedefinitiontermcontributor-interface)
- [用語コントリビューターを完成する](#complete-the-term-contributors)

### OSGi登録用にクラスに注釈を付ける

Liferay Commerceが通知ステータスレジストリ内の他のものと区別できるように、通知タイプに個別のキーを指定する必要があります。 すでに使用されているキーを指定すると、既存の関連付けられているタイプが上書きされます。 順番は、ドロップダウンでのソート順で決まります。 この場合、 **注文は出荷待ち** 通知タイプは50、 **一部発送済み** 通知タイプは60として注文を持ちます。 2つの間にステータスを配置するには、注文がこれら2つの数値の間にある必要があります（この場合は51）。

### CommerceNotificationTypeインターフェースの確認

次のメソッドを実装します。

```java
public String getClassName(Object object);
```

このメソッドは、通知タイプが実装されているクラスの名前を返します。

```java
public long getClassPK(Object object);
```

このメソッドは、オブジェクトのプライマリーキーを返します。

```java
public String getKey();
```

このメソッドは、通知タイプのユニークキーを返します。 既存のキーを使用すると、その通知タイプが上書きされます。

```java
public String getLabel(Locale locale);
```

このメソッドは、UIに表示される通知タイプの名前を返します。 この名前は、言語キーまたは文字列である。

### 通知タイプを完了する

```{literalinclude} ./implementing-a-custom-notification-type/resources/liferay-g2f3.zip/g2f3-impl/src/main/java/com/acme/g2f3/internal/commerce/notification/type/G2F3ShipmentCreatedNotificationTypeImpl.java
    :dedent: 1
    :language: java
    :lines: 21-49
```

通知タイプの実装を完了するには、上記のメソッドを実装する必要があります。 最初のメソッドでは、オブジェクトが`CommerceShipment`のタイプであるかどうかをチェックし、それが真であればそのクラス名を返すようになっています。 2番目のメソッドでは、これを再度確認し、それが真であれば、出荷のプライマリーキーを返します。 3番目のメソッドはユニークキーを返し、最後のメソッドはUIに表示されるラベルを返します。

### CommerceShipmentのModelListenerの作成

```{literalinclude} ./implementing-a-custom-notification-type/resources/liferay-g2f3.zip/g2f3-impl/src/main/java/com/acme/g2f3/internal/commerce/notification/model/listener/G2F3CommerceShipmentModelListener.java
    :language: java
    :lines: 15-41
```

出荷が作成される度に通知をトリガーするためには、 [`ModelListener`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/model/BaseModelListener.java) インターフェースを実装する [`BaseModelListener`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/model/ModelListener.java) クラスを拡張する必要があります。 このインタフェースは、作成、アップデート、削除などのイベントをトリガーとするエンティティのメソッドを持ちます。 `onAfterCreate(T model)`メソッドを使用すると、出荷の作成時に通知をトリガーすることができます。

### CommerceDefinitionTermContributorインターフェースの確認

次のメソッドを実装します。

```java
public String getFilledTerm(String term, Object object, Locale locale) throws PortalException;
```

このメソッドは、ワイルドカードを適切な値に置き換え、それを文字列として返す。

```java
public String getLabel(String term, Locale locale);
```

このメソッドは、UIに表示される用語コントリビューターの名前を返します。 この名前は、言語キーまたは文字列です。

```java
public List<String> getTerms();
```

このメソッドは、通知タイプで利用可能なすべての用語コントリビュータを返します。

### 用語コントリビューターを完成する

用語コントリビューターは、宛先、件名、本文フィールドに存在するワイルドカードを解決します。 この例では、件名と本文フィールド、および宛先フィールドの2つの用語コントリビューターが実装されています。

#### 本文と件名にgetFilledTermメソッドを実装する

```{literalinclude} ./implementing-a-custom-notification-type/resources/liferay-g2f3.zip/g2f3-impl/src/main/java/com/acme/g2f3/internal/commerce/order/term/contributor/G2F3CommerceShipmentCommerceDefinitionTermContributor.java
    :dedent: 1
    :language: java
    :lines: 32-71
```

ワイルドカードを解決する前に、オブジェクトがヌルであるか、または`CommerceShipment`型であるかを確認するためのチェックがあります。 そして、その用語にワイルドカードが含まれている場合、ワイルドカードは出荷者の名前、配送先住所、または出荷IDに置き換えられます。 出荷者の名前には、出荷のアカウントの名前が返されます。 配送先住所は、住所(丁目、番地など)、市町村、郵便番号を連結した文字列として返されます。 出荷IDは、出荷オブジェクトから直接返されます。

#### 受信者のgetFilledTermメソッドを実装する

```{literalinclude} ./implementing-a-custom-notification-type/resources/liferay-g2f3.zip/g2f3-impl/src/main/java/com/acme/g2f3/internal/commerce/order/term/contributor/G2F3CommerceShipmentRecipientCommerceDefinitionTermContributor.java
    :dedent: 1
    :language: java
    :lines: 31-58
```

ワイルドカードを解決する前に、オブジェクトがヌルであるか、または`CommerceShipment`型であるかを確認するためのチェックがあります。 そして、その用語にワイルドカードが含まれている場合、ワイルドカードはアカウントのユーザーIDに置き換えられます。 通知が送信されるとき、このIDを使ってユーザーのメールを探します。

#### getLabel メソッドと getTerms メソッドを実装する

`getLabel`メソッドは、UIに表示される用語の名前を返します。 言語キーを使ってこれを行うか、直接文字列を返すことができます。

```{literalinclude} ./implementing-a-custom-notification-type/resources/liferay-g2f3.zip/g2f3-impl/src/main/java/com/acme/g2f3/internal/commerce/order/term/contributor/G2F3CommerceShipmentCommerceDefinitionTermContributor.java
    :dedent: 1
    :language: java
    :lines: 73-76
```

このメソッドは、通知タイプで利用可能なすべての用語コントリビュータを返します。 言語キーを使ってこれを行うか、UIに用語を表示するハードコードされた文字列を直接返すことができます。

```{literalinclude} ./implementing-a-custom-notification-type/resources/liferay-g2f3.zip/g2f3-impl/src/main/java/com/acme/g2f3/internal/commerce/order/term/contributor/G2F3CommerceShipmentCommerceDefinitionTermContributor.java
    :dedent: 1
    :language: java
    :lines: 78-81
```

## まとめ

`CommerceNotificationType`インターフェイスを実装するための基本がわかりましたね。 また、通知の仕組みの基本や、独自の通知タイプを送信するための `MessageListener`の使い方もおわかりだと思います。