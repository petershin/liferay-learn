# Time Off Requestの構築

> 対応可能：Liferay DXP/Portal 7.4以降

Liferay Objectでは、コードを書いたりモジュールをデプロイすることなく、アプリケーション全体を構築することができます。 ここでは、Liferayの[オブジェクト](../../objects.md)と[選択リスト](../picklists/using-picklists.md)を使用して、Time Off Requestアプリケーションを作成します。

まず、部門の値を定義するための [選択リストを追加](#adding-a-department-picklist) します。 そして、 [Time Off Requests](#adding-a-time-off-request-object) 用と [Employees](#adding-an-employee-object) 用の2つのオブジェクトを作成します。 このプロセスでは、これらのオブジェクトを相互に関連付け、Time Off RequestオブジェクトにWebhookを追加します。 最後に、リレーションシップフィールドを表示するための [カスタムレイアウトを設計します](#designing-custom-object-layouts) 。

```{note}
システムオブジェクトの拡張には制限があるため、リクエストとユーザープロファイルを関連付けるには、Employeeオブジェクトを作成する必要があります。 
```

![Time Off Requestアプリケーションを構築します。](./building-a-time-off-requester/images/01.png)
```{include} /_snippets/run-liferay-dxp.md
```

## 部門選択リストの追加

選択リストに会社の部門を表示します：

1. **グローバルメニュー**(![グローバルメニュー](../../../images/icon-applications-menu.png))を開き、 ［**コントロールパネル**］ タブをクリックして、 ［**Picklists**］ 移動します。

1. **追加** ボタン (![追加ボタン](../../../images/icon-add.png))をクリックして、名前に ［**Department**］ と入力し、 ［**保存**］ をクリックします。

1. 新しい ［**Picklist**］ を選択し、 **追加** ボタン(![追加ボタン](../../../images/icon-add.png))を使用して、項目を追加します（例：マーケティング、人事、営業など）。

   ![部門選択リストに項目を追加する。](./building-a-time-off-requester/images/02.png)

これで、選択リストをTime Off Requestオブジェクトのフィールドとして使用できます。

## Time Off Requestオブジェクトの追加

1. **グローバルメニュー**(![グローバルメニュー](../../../images/icon-applications-menu.png))を開き、 ［**コントロールパネル**］ タブをクリックして、 ［**オブジェクト**］ 移動します。

1. **追加** ボタン( ![追加ボタン](../../../images/icon-actions.png) ) をクリックし、下記の値を入力します。

   | フィールド | 値 |
   | :--- | :--- |
   | ラベル | Time Off Request |
   | 複数形のラベル | Time Off Requests |
   | オブジェクト名 | TimeOffRequest |

1. **オブジェクト** を選択し、 ［**Fields**］ タブをクリックして、下記4つの **フィールド** を追加します。

   | ラベル | フィールド名 | タイプ | 選択リスト | 要否 |
   | :--- | :--- | :--- | :--- | :--- |
   | ［Start Date］ | `startDate` | ［Date］ | n/a | &#10004; |
   | ［End Date］ | `endDate` | ［Date］ | n/a |  |
   | ［Department］ | `department` | ［選択リスト］ | 部門 | &#10004; |
   | ［Comments］ | `comments` | ［Text］ | n/a |  |

   ![開始日、終了日、部門、コメントフィールドをオブジェクトに追加する。](./building-a-time-off-requester/images/03.png)

1. ［**Actions**］ タブをクリックし、このアクションを追加します。

   | フィールド | 値 |
   | :--- | :--- |
   | ［Action Name］ | ［Creation Sync］ |
   | ［When］ | ［On After Add］ |
   | ［Then］ | ［Webhook］ |
   | ［URL］ | アプリまたは次のようなサイト（https://webhook.siteなど）から、テスト用のWebhookのURLを入力します。 |

   このアクションは、Time Off Requestエントリが追加されるたびに、外部システムにデータを送信します。 詳しくは、[オブジェクトアクションの定義](../creating and-managing-objects/defining-object-actions.md) をご覧ください。

   ![リクエストが追加された後にトリガーされるWebhookアクションを作成する](./building-a-time-off-requester/images/04.png)

1. ［**Details**］ タブをクリックし、 次のエントリディスプレイとスコープ設定を設定します。

   | フィールド｜値｜
   ｜ :---｜
   ｜ タイトルフィールド｜開始日｜
   ｜ スコープ｜会社｜
   ｜ パネルカテゴリキー｜アプリケーション > コミュニケーション｜

1. ［**公開**］ をクリックします。 これにより、オブジェクトが起動します。

次に、Employeeオブジェクトを作成し、それをTime Off Requestオブジェクトに関連付けることで、リクエストエントリーを個々のユーザに関連付けることができます。

## Employeeオブジェクトの追加 **グローバルメニュー**(![グローバルメニュー](../../../images/icon-applications-menu.png))を開き、 ［**コントロールパネル**］ タブをクリックして、 ［**オブジェクト**］ 移動します。

1. **追加** ボタン( ![追加ボタン](../../../images/icon-actions.png) ) をクリックし、下記の値を入力します。

   | フィールド | 値 |
   | :--- | :--- |
   | ラベル | Employee |
   | 複数形のラベル | Employees |
   | オブジェクト名 | Employee |

1. **オブジェクト** を選択し、 ［**Fields**］ タブをクリックして、下記の **フィールド** を追加します。

   | ラベル | フィールド名 | タイプ | 要否 |
   | :--- | :--- | :--- | :--- |
   | 名前 | `name` | Text | &#10004; |
   | Eメール | `email` | Text | &#10004; |

   ![名前フィールドとEメールフィールドをオブジェクトに追加する。](./building-a-time-off-requester/images/05.png)

1. ［**Relationships**］ タブをクリックし、このリレーションシップを追加します。

   | フィールド | 値 |
   | :--- | :--- |
   | ［Label］ | Requester |
   | ［Relationship Name］ | requester |
   | ［タイプ］ | One to Many |
   | ［オブジェクト］ | TimeOffRequest |

   ```{note}
   このリレーションシップを作成する場合、外部キーフィールドが自動的にTime Off Requestオブジェクトに追加されます。
   ```

   ![Time Off Requestオブジェクトに一対多の関係を追加します。](./building-a-time-off-requester/images/06.png)

1. ［**Details**］ タブをクリックし、 次のエントリディスプレイとスコープ設定を設定します。

   | フィールド      | 値                |
   |:---------- |:---------------- |
   | タイトルフィールド  | 名前               |
   | スコープ       | 会社               |
   | パネルのカテゴリキー | コントロールパネル > ユーザー |

1. ［**公開**］ をクリックします。

公開されると、Liferay UIやHeadless APIを使ってエントリーを作成することができます。 しかし、これらのエントリをリクエストエントリに関連付けるためには、まず [カスタムレイアウト](#designing-custom-object-layouts) を作成する必要があります。

## カスタムオブジェクトレイアウトの設計

オブジェクトのレイアウトは、オブジェクトエントリを作成や編集をする際にフィールドの構成を決定します。 リレーションシップはデフォルトのオブジェクトレイアウトには表示されないので、リレーションシップフィールドを表示するには、両方のオブジェクトにカスタムレイアウトを設計する必要があります。

### Time Off Requestsの場合

1. ［**オブジェクト**］ アプリケーションに移動し、 ［**Time Off Request**］ オブジェクトを選択します。

1. ［**Layout**］ タブをクリックし、 **追加** ボタン（ ![Add Button](../../../images/icon-actions.png) ）をクリックし、名前に ［**Request**］ を入力し、 ［**Save**］ をクリックします。

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

1. ［**Layouts**］ タブをクリックし、 **追加** ボタン（ ![Add Button](../../../images/icon-actions.png) ）をクリックし、Nameに ［**Employee Info**］ を入力し、 ［**保存**］ をクリックします。

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

1. **グローバルメニュー**（![Global Menu](../../../images/icon-applications-menu.png)）を開き、 ［**アプリケーション**］ タブをクリックして、 ［**Time Off Requests**］ を選択します。

1. **追加** ボタン(![Add Button](../../../images/icon-actions.png))をクリックして、フォームに入力してください。

1. ［**保存**］ をクリックします。

エントリーを保存すると、そのエントリーの編集画面が表示されます。 さらにエントリーを追加するには、Time Off Requestsのメインページに戻ります。 時間のリクエストが追加されると、ObjectのWebhookがトリガーされ、設定されたURLにエントリーのデータが投稿されます。

リクエストが追加され、employeeエントリーに関連られると、Employeesアプリケーションでそれらを表示することができます。 ［**グローバルメニュー**］（![Global Menu](../../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブをクリックして、 ［**Employees**］ を選択します。 関連する **エントリ** を選択し、 ［**Time Off Requests**］ タブをクリックします。

![［Time Off Requests］タブで、employeeの関連するリクエストを表示します。](./building-a-time-off-requester/images/12.png)

## 追加情報

* [オブジェクト](../../objects.md)
* [オブジェクトの作成](../creating-and-managing-objects/creating-objects.md)
* [選択リストの使用](../picklists/using-picklists.md)
