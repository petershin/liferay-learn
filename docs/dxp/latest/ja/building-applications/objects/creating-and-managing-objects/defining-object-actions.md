# オブジェクトアクションの定義

{bdg-secondary}`Liferay 7.4 U33以降およびGA33以降で利用可能`

Liferay Objectでは、特定の条件でトリガーされるアクションを定義することができます。 アクションが有効になると、Liferayはオブジェクトのデータが追加、削除、または更新された時にリッスンし、設定されたアクションを実行します。

現在、Liferayは4つのアクションの種類をサポートしています。

* [Webhookアクション](#webhook-actions) では、ペイロードをURLに配信します。

* [Groovyスクリプトアクション](#groovy-script-actions) では、カスタムの [Groovy](https://groovy-lang.org/) スクリプトを実行します。

* [通知アクション](#notification-actions) では、定義済みのテンプレートを使って、電子メールによる通知を送信します。

* [オブジェクトエントリーを追加アクション](#add-an-object-entry-actions) では、アクティブなオブジェクトにエントリーを作成します。

次の手順に従って、オブジェクトにアクションを定義します。

1. **グローバルメニュー**（![Global Menu](../../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブをクリックして、 ［**オブジェクト**］ に進みます。

1. 既存のオブジェクトを選択するか、 [新しいオブジェクトを作成](./creating-objects.md)します。

   ```{note}
   Liferay DXP 7.4 U22からは、システムオブジェクトにアクションを追加することができます。
   ```

1. オブジェクトを表示した状態で、 ［**Actions**］ タブを選択し、 **追加** ボタン（![Add Button](../../../images/icon-add.png)）をクリックします。

1. ［Basic Info］タブで、アクションの **名前** 、 **説明** を入力します。

   ![［基本情報］タブにアクション名と説明を入力します。](./defining-object-actions/images/01.png)

1. ［**Action Builder**］ タブを開き、カスタムトリガー、条件、アクションを定義します。

   ![［Action Builder］タブを開き、カスタムトリガー、条件、アクションを定義します。](./defining-object-actions/images/02.png)

1. ［Trigger］は、アクションが実行される **タイミング** を決定します。

   | トリガー            | 説明                 |
   |:--------------- |:------------------ |
   | On After Add    | オブジェクトエントリが追加されたとき |
   | On After Delete | オブジェクトエントリが削除されたとき |
   | On After Update | オブジェクトエントリが更新されたとき |

   ![アクションが実行されるタイミングを決定します。](./defining-object-actions/images/03.png)

1. (オプション) トリガーを選択した後、式を使用してトリガーの追加条件を設定することができます。 **コード** ボタン ( ![Code](../../../images/icon-code.png) )をクリックすると、利用可能な式が表示されます。 <!--U30+/GA30+-->

   ![トリガーの追加条件を設定するには、式を使用します。](./defining-object-actions/images/04.png)

   Liferay 7.4 U33+とGA33+では、 ［**完了**］ をクリックすると、Liferayは式が有効な構文であるかどうかをチェックします。 式が無効な場合、Liferayはエラーメッセージを表示します。

1. アクションでは、実行されたアクションのタイプを選択し、すべての追加フィールドを入力します。 詳細は、 [Understanding Action Types](#understanding-action-types) を参照してください。

1. ［**保存**］ をクリックします。

作成されると、アクションは有効になり、構成に応じてトリガーされます。

必要であれば、そのアクションの ［**Basic Info**］ タブを開き、 ［**Active**］ スイッチを切り替え、 ［**Save**］ をクリックして、アクションを無効にすることができます。

![Activeスイッチを切り替えて、アクションを無効にします。](./defining-object-actions/images/05.png)

## アクションの種類について

### Webhookアクション

{bdg-secondary}`Liferay 7.4以降で利用可能`

**Webhookアクション** では、データペイロードを設定されたURLに配信します。 このアクションの種類を選択した場合、ターゲットURLを入力する必要があります。 該当する場合は、シークレットの入力も可能です。

![WebhookのURLとシークレットを入力します。](./defining-object-actions/images/06.png)

### Groovyスクリプトアクション

{bdg-secondary}`Liferay 7.4 U27以降とGA27以降で利用可能`

［**Groovy Script**］ アクションは、カスタムのGroovyスクリプトを実行します。 このアクションの種類を選択した場合、提供されるコードウィンドウにスクリプトを入力します。 Liferay 7.4 U33+とGA33+では、Liferayは [GroovyShellクラス](https://docs.groovy-lang.org/latest/html/api/groovy/lang/GroovyShell.html) を使って、 ［**保存**］ をクリックしたときにGroovy スクリプトの構文が有効であるかどうかをチェックします。 スクリプトが無効な場合、Liferayはエラーメッセージを表示します。

![Groovyスクリプトを入力します。](./defining-object-actions/images/07.png)

### 通知アクション

{bdg-secondary}`Liferay 7.4 U32以降およびGA32以降で利用可能`

［**Notification**］ アクションを使用して、オブジェクトイベントのメール通知設定を自動化します。 このアクションの種類を使用するには、インスタンスに[構成されたメールサーバー](../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)と、少なくとも 1 つの[通知テンプレート](../../../process-automation/notifications/creating-notification-templates.md)が必要です。

このアクションの種類を選択する場合、通知テンプレートを選択する必要があります。 このテンプレートは、各メールの送信者、受信者、コンテンツを決定します。

![通知テンプレートの選択](./defining-object-actions/images/08.png)

### オブジェクトエントリアクションの追加

{bdg-secondary}`Liferay 7.4 U33以降およびGA33以降で利用可能`

［**Add an Object Entry**］ アクションでは、指定されたオブジェクトにエントリを作成します。 このアクションの種類を選択する場合、有効なオブジェクトを選択する必要があります。 オブジェクトに必須項目が含まれている場合、新しいエントリに規定値を設定する必要があります。 これらの値は、直接入力することも、式ビルダーを使用して動的に設定することもできます。 必要に応じて、必須項目以外の値を設定することもできます。

![有効なオブジェクトを選択し、作成されたエントリに初期値を入力します。](./defining-object-actions/images/09.png)

## 追加情報

* [オブジェクトの作成](./creating-objects.md)
* [オブジェクトへのフィールドの追加](../creating-and-managing-objects/adding-fields-to-objects.md)
* [オブジェクトリレーションの定義](../creating-and-managing-objects/defining-object-relationships.md)
