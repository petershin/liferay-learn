# オブジェクトアクションの定義

{bdg-secondary}`利用可能な Liferay 7.4 U33+/GA33+`

アクションは、オブジェクトの入力イベントをトリガーとするカスタムオペレーションを定義します。 Liferayはイベント-add, delete, or update-をリッスンし、操作を実行します。

アクションを追加するには

1. グローバルメニュー ( ![Global Menu](../../../../images/icon-applications-menu.png) ) を開き、 **コントロールパネル** タブを選択し、 **オブジェクト** をクリックします。

1. オブジェクト定義の編集を開始します。

   ```{note}
   Liferay 7.4 U22+とGA22+では、システムオブジェクトにアクションを追加することができます。
   ```

1. **Actions** タブを開き、 **Add**( ![Add Button](../../../../images/icon-add.png) ) をクリックします。

1. 基本情報]タブで、アクションの **名前** と **説明** を入力します。

   ![［基本情報］タブにアクション名と説明を入力します。](./defining-object-actions/images/01.png)

1. **Action Builder** タブを開き、カスタムトリガー、コンディション、アクションを定義します。

   ![［Action Builder］タブを開き、カスタムトリガー、条件、アクションを定義します。](./defining-object-actions/images/02.png)

1. アクションを実行するタイミングを決定するトリガーイベントを指定します。

   | トリガー            | Description   |
   |:--------------- |:------------- |
   | On After Add    | エントリーを追加した場合  |
   | On After Delete | エントリーを削除した場合  |
   | On After Update | エントリーが更新されたとき |

   ![アクションが実行されるタイミングを決定します。](./defining-object-actions/images/03.png)

1. (オプション) アクションのトリガーとなるコンディションを有効にします。 **コード** ボタン ( ![Code](../../../../images/icon-code.png) )をクリックすると、利用可能な式が表示されます。

   Liferay 7.4 U33+ と GA33+ では、 **Done** をクリックすると、Liferay は式のシンタックスを検証します。 式が無効な場合、Liferayはエラーメッセージを表示します。

   ![トリガーの追加条件を設定するには、式を使用します。](./defining-object-actions/images/04.png)

1. アクションでは、実行されたアクションのタイプを選択し、すべての追加フィールドを入力します。 詳細は、 [Understanding Action Types](./understanding-action-types.md#understanding-action-types) を参照してください。

1. ［**Save**］ をクリックします。

作成されると、アクションは有効になり、構成に応じてトリガーされます。

アクションの基本情報タブで、アクションを無効にすることができます。 **アクティブ** スイッチをトグルし、 **保存** をクリックします。

![Activeスイッチを切り替えて、アクションを無効にします。](./defining-object-actions/images/05.png)

## 追加情報

* [オブジェクトの作成](../creating-objects.md)
* [アクションの種類について](./understanding-action-types.md)
