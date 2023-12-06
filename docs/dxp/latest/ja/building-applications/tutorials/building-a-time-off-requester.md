# Time Off Requestの構築

{bdg-secondary}`Liferay 7.4+`

Liferay Objectsを使えば、コードを書いたりモジュールをデプロイすることなく、アプリケーション全体を構築することができます。 ここでは、Liferayの[オブジェクト](../../objects.md)と[選択リスト](../picklists/creating-picklists.md)を使用して、Time Off Requestアプリケーションを作成します。

まず、部門の値を定義するための [選択リストを追加](#adding-a-department-picklist) します。 そして、 [Time Off Requests](#adding-a-time-off-request-object) 用と [Employees](#adding-an-employee-object) 用の2つのオブジェクトを作成します。 このプロセスでは、これらのオブジェクトを相互に関連付け、Time Off RequestオブジェクトにWebhookを追加します。 最後に、リレーションシップフィールドを表示するための [カスタムレイアウトを設計します](#designing-custom-object-layouts) 。

```{note}
システムオブジェクトの拡張には制限があるため、リクエストとユーザープロファイルを関連付けるには、Employeeオブジェクトを作成する必要があります。 
```

![Time Off Requestアプリケーションを構築します。](./building-a-time-off-requester/images/01.png)

```{include} /_snippets/run-liferay-dxp.md
```

## 部門ピックリストの追加

ピックリストは会社の部署を表します：

1. **グローバルメニュー** (![グローバルメニュー](../../images/icon-applications-menu.png))を開き、**コントロールパネル**タブに移動し、**ピックリスト**をクリックします。

1. **Add** ボタン(![Add Button](../../images/icon-add.png))をクリックし、名前に **Department** と入力し、 **Save** をクリックする。

1. 新しい **ピックリスト** を選択し、 **追加** ボタン(![追加ボタン](../../images/icon-add.png))を使用して項目を追加します(例: マーケティング、人事、営業)。

   ![部署ピックリストに項目を追加](./building-a-time-off-requester/images/02.png)

ピックリストをタイムオフリクエストオブジェクトのフィールドとして使用できます。

## タイムオフリクエストオブジェクトの追加

1. 1. グローバルメニュー(![グローバルメニュー](../../images/icon-applications-menu.png))を開き、**Control Panel** タブを開き、**Objects** をクリックします。

1. **Add** ボタン( ![Add Button](../../images/icon-actions.png) )をクリックし、以下の値を入力します。

    | フィールド | 値 |
    | :--- | :--- |
    | ラベル | 休暇申請 |
    | 複数のラベル | 休暇申請 |
    | オブジェクト名 | TimeOffRequest |

1. **Object** を選択し、 **Fields** タブをクリックし、以下の4つのフィールドを追加します。

    | ラベル | フィールド名 | タイプ | 候補リスト | 必須 |
    | :--- | :--- | :--- | :--- | :--- |
    | 開始日 | `startDate` | 日付 | 該当なし | &#10004; |
    | 終了日 | `endDate` | 日付 | 該当なし | |
    | 部門 | `department` | 候補リスト | 部門 | &#10004; |
    | コメント | `comments` | テキスト | 該当なし | |

   ![開始日、終了日、部署、コメントフィールドをオブジェクトに追加する。](./building-a-time-off-requester/images/03.png)

1. [**アクション**] タブをクリックし、このアクションを追加します。

    | フィールド | 値 |
    | :--- | :--- |
    | アクション名 | 作成同期 |
    | いつ | 追加後 |
    | 次に | ウェブフック |
    | URL | アプリまたは https://webhook.site などのサイトからテスト Webhook URL を入力します。 |

   このアクションは、休暇要求エントリが追加されるたびに、外部システムにデータを送信します。 詳細については、[アクションの定義](../creating-and-managing-objects/actions/defining-object-actions.md) を参照してください。

   ![リクエストの追加後にトリガーされる Webhook アクションを作成します。](./building-a-time-off-requester/images/04.png)

1. [**詳細**] タブをクリックし、次のエントリの表示と範囲を設定します。

    | フィールド | 値 |
    | :--- | :--- |
    | タイトルフィールド | 開始日 |
    | 範囲 | 会社概要 |
    | パネルリンク | アプリケーション > 通信 |

1. [**公開**] をクリックします。 これによりオブジェクトがアクティブ化されます。

次に、従業員オブジェクトを作成し、それを休暇申請オブジェクトに関連付けることで、申請エントリを個々のユーザーに関連付けることができます。

## 従業員オブジェクトの追加

1. **グローバル メニュー**(![グローバル メニュー](../../images/icon-applications-menu.png)) を開き、 **コントロール パネル** タブに移動して、 **オブジェクト** をクリックします 。

1. **追加** ボタン ( ![ボタンの追加](../../images/icon-actions.png) ) をクリックし、これらの値を入力します。

   | フィールド | 値 |
   | :--- | :--- |
   | ラベル | 従業員 |
   | 複数のラベル | 従業員 |
   | オブジェクト名 | 従業員 |

1. **オブジェクト** を選択し、 **フィールド** タブをクリックして、これらの **フィールド** を追加します。

   | ラベル | フィールド名 | タイプ | 必須 |
   | :--- | :--- | :--- | :--- |
   | 名前 | `名前` | テキスト | &#10004; |
   | 電子メール | `電子メール` | テキスト | &#10004; |

   ![「名前」フィールドと「電子メール」フィールドをオブジェクトに追加します。](./building-a-time-off-requester/images/05.png)

1. [**関係**] タブをクリックし、この関係を追加します。

   | フィールド | 値 |
   | :--- | :--- |
   | ラベル | 依頼者 |
   | 関係名 | 依頼者 |
   | タイプ | 1 対多 |
   | オブジェクト | タイムオフリクエスト |

   ```{note}
   この関係を作成すると、外部キー フィールドが休暇要求オブジェクトに自動的に追加されます。
   ```

   ![Time Off Requestオブジェクトに一対多の関係を追加します。](./building-a-time-off-requester/images/06.png)

1. ［**Details**］ タブをクリックし、 次のエントリディスプレイとスコープ設定を設定します。

   | 項目        | 値                |
   |:--------- |:---------------- |
   | タイトルフィールド | 名前               |
   | スコープ      | 会社               |
   | パネルリンク    | コントロールパネル > ユーザー |

1. ［**公開**］ をクリックします。

公開されると、Liferay UIやHeadless APIを使ってエントリーを作成することができます。 しかし、これらのエントリをリクエストエントリに関連付けるためには、まず [カスタムレイアウト](#designing-custom-object-layouts) を作成する必要があります。

## カスタムオブジェクトレイアウトの設計

オブジェクトのレイアウトは、オブジェクトエントリを作成や編集をする際にフィールドの構成を決定します。 リレーションシップはデフォルトのオブジェクトレイアウトには表示されないので、リレーションシップフィールドを表示するには、両方のオブジェクトにカスタムレイアウトを設計する必要があります。

### Time Off Requestsの場合

1. ［**オブジェクト**］ アプリケーションに移動し、 ［**Time Off Request**］ オブジェクトを選択します。

1. ［**Layout**］ タブをクリックし、 **追加** ボタン（ ![Add Button](../../images/icon-actions.png) ）をクリックし、名前に ［**Request**］ を入力し、 ［**Save**］ をクリックします。

1. 新しいレイアウトを選択し、 ［**Mark as Default**］ のボックスをチェックします。

   ![新しいレイアウトを追加し、それをオブジェクトのデフォルトレイアウトとしてマークします。](./building-a-time-off-requester/images/07.png)

1. ［**Layout**］ タブをクリックし、 **タブ** に2つの **ブロック** を追加します。

   | 要素   | ラベル          | タイプ   |
   |:---- |:------------ |:----- |
   | タブ   | Request Info | フィールド |
   | ブロック | Dates        | n/a   |
   | ブロック | Details      | n/a   |

1. ブロックにフィールドを追加します。

   | ブロック    | フィールド                        |
   |:------- |:---------------------------- |
   | Dates   | Start Date、End Date          |
   | Details | Department、Employee、Comments |

   ![レイアウトブロックに、開始日、終了日、部門、コメントの各フィールドを追加します。](./building-a-time-off-requester/images/08.png)

1. ［**保存**］ をクリックします。

保存されると、新しいレイアウトは、LiferayのUIでTime Off Requestのエントリーを作成や編集をする際に使用されます。 employeeエントリーが存在する場合、それを個々のリクエストに関連付けることができます。

![このレイアウトは、Time Off Requestのエントリーを作成・編集するために使用します。](./building-a-time-off-requester/images/09.png)

### Employeesの場合

1. ［**オブジェクト**］ アプリケーションに移動し、 ［**Employee**］ オブジェクトを選択します。

1. ［**Layouts**］ タブをクリックし、 **追加** ボタン（ ![Add Button](../../images/icon-actions.png) ）をクリックし、Nameに ［**Employee Info**］ を入力し、 ［**保存**］ をクリックします。

1. 新しいレイアウトを選択し、 ［**Mark as Default**］ のボックスをチェックします。

1. ［**Layout**］ タブをクリックし、1つのブロックを持つ［フィールド］タブを追加します。

   | 要素   | ラベル   | タイプ   |
   |:---- |:----- |:----- |
   | タブ   | 基本情報  | フィールド |
   | ブロック | 従業員情報 | なし    |

1. ブロックに ［**Name**］ と ［**Email**］ フィールドを追加します。

1. Employeeオブジェクトの Requesterリレーションシップの［リレーションシップ］タブを追加します。

   | 要素 | ラベル               | タイプ       | リレーションシップ |
   |:-- |:----------------- |:--------- |:--------- |
   | タブ | Time Off Requests | リレーションシップ | Requester |

   ![オブジェクトのRequester関係の［リレーションシップ］タブを追加します。](./building-a-time-off-requester/images/10.png)

1. ［**保存**］ をクリックします。

保存されると、新しいレイアウトは、LiferayのUIでemployeeのエントリーを作成や編集をする際に使用されます。 リクエストエントリーが存在する場合は、 ［**Time Off Requests**］ タブでemployeeエントリーと関連付けることができます。 ここでは、選択したemployeeエントリーに関連するすべてのリクエストを表示することもできます。

![このレイアウトは、employeeエントリーの作成と編集に使用されます。](./building-a-time-off-requester/images/11.png)

## オブジェクトエントリーの追加

これでアプリが完成したので、Liferay UIとHeadless APIを使って、Time Off RequestとEmployeeオブジェクトにデータを追加することができます。

### Employeesの追加

以下の手順で、Headless APIを使ってemployeeエントリーを追加します。

1. Liferayの **APIエクスプローラー**（すなわち `localhost:8080/o/api`）を開き、 **REST Applications** ドロップダウンメニューをクリックし、 ［**c/employees**］ をクリックしてください。

1. このスクリプトを、バッチ`POST` APIのリクエストボディに入力します。

   ```json
   [
     {
       "email": "foo@liferay.com",
       "name": "Able"
     },
     {
       "email": "bar@liferay.com",
       "name": "Baker"
     },
     {
       "email": "goo@liferay.com",
       "name": "Charlie"
     }
   ]
   ```

1. ［**実行**］ をクリックします。

これにより、Employeeオブジェクトに 3 つのエントリが追加されます。

### Time Off Requestの追加

以下の手順で、Liferay UIを使ってリクエストエントリを追加します。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **Applications** タブをクリックし、 **Time Off Requests** を選択する。

1. **追加** ボタン(![Add Button](../../images/icon-actions.png))をクリックして、フォームに入力してください。

1. ［**保存**］ をクリックします。

エントリーを保存すると、そのエントリーの編集画面が表示されます。 さらにエントリーを追加するには、Time Off Requestsのメインページに戻ります。 時間のリクエストが追加されると、ObjectのWebhookがトリガーされ、設定されたURLにエントリーのデータが投稿されます。

リクエストが追加され、employeeエントリーに関連られると、Employeesアプリケーションでそれらを表示することができます。 **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **Control Panel** タブを開き、 **Employees** をクリックします。 関連する **エントリ** を選択し、 ［**Time Off Requests**］ タブをクリックします。

![［Time Off Requests］タブで、employeeの関連するリクエストを表示します。](./building-a-time-off-requester/images/12.png)

## 関連トピック

* [オブジェクト概要](../objects.md)
* [オブジェクトの作成](../objects/creating-and-managing-objects/creating-objects.md)
* [ピックリストの作成](../objects/picklists/creating-picklists.md)
