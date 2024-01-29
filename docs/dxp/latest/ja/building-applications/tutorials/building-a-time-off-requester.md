# Time Off Requestの構築

{bdg-secondary}`Liferay 7.4+`

Liferay Objectsを使えば、コードを書いたりモジュールをデプロイすることなく、アプリケーション全体を構築することができます。 ここでは、Liferayの [オブジェクト](../objects.md) と [選択リスト](../objects/picklists/creating-picklists.md) を使用して、Time Off Requestアプリケーションを作成します。

まず、部門の値を定義するための [選択リストを追加](#adding-a-department-picklist) します。 そして、 [Time Off Requests](#adding-a-time-off-request-object) 用と [Employees](#adding-an-employee-object) 用の2つのオブジェクトを作成します。 このプロセスでは、これらのオブジェクトを相互に関連付け、Time Off RequestオブジェクトにWebhookを追加します。 最後に、リレーションシップフィールドを表示するための [カスタムレイアウトを設計します](#designing-custom-object-layouts) 。

```{note}
システム オブジェクトの拡張には制限があるため、要求をユーザ プロファイルと関連付けるには Employee オブジェクトを作成する必要があります。 
```

![Build a Time Off Request application.](./building-a-time-off-requester/images/01.png)

```{include} /_snippets/run-liferay-dxp.md
```

## 部門選択リストの追加

ピックリストは会社の部門を表しています。

1. グローバルメニュー(![グローバルメニュー](../../images/icon-applications-menu.png))を開き、 **コントロールパネル** タブに移動し、 **ピックリスト** をクリックします。

1. **追加** ボタン(![追加ボタン](../../images/icon-add.png))をクリックし、名前に **部署*を入力し、** 保存_をクリックします。

1. 新しい **ピックリスト** を選択し、 **追加** ボタン(![追加ボタン](../../images/icon-add.png))を使用して項目を追加します(例：マーケティング、人事、営業)。

   ![Add items to the Department Picklist.](./building-a-time-off-requester/images/02.png)

これで、Time Off Requestオブジェクトのフィールドとして選択リストを使用できるようになりました。

## Time Off Requestオブジェクトの追加

1. グローバルメニュー(![グローバルメニュー](../../images/icon-applications-menu.png))を開き、 **コントロールパネル** タブに移動し、 **オブジェクト** をクリックします。

1. **追加** ボタン ( ![追加ボタン](../../images/icon-actions.png))をクリックし、以下の値を入力します。

   | 項目      | 値                 |
   | :------ | :---------------- |
   | ラベル     | Time Off Request  |
   | 複数形のラベル | Time Off Requests |
   | オブジェクト名 | TimeOffRequest    |

1. **オブジェクト** を選択し、 ［**フィールド**］ タブをクリックして、下記4つの **フィールド** を追加します。

   | ラベル          | 項目名          | 種類       | 候補リスト | 必須       |
   | :----------- | :----------- | :------- | :---- | :------- |
   | 開始日          | `startDate`  | 日付       | n/a   | &#10004;; |
   | 終了日          | `endDate`    | 日付       | n/a   |          |
   | 部門           | `department` | 候補リスト    | 部門    | &#10004;; |
   | 掲示板のディスカッション | `comments`   | テキストボックス | n/a   |          |

   ![Add the Start Date, End Date, Department, and Comments fields to the Object.](./building-a-time-off-requester/images/03.png)

1. ［**Actions**］ タブをクリックし、このアクションを追加します。

   | 項目     | 値                                                            |
   | :----- | :----------------------------------------------------------- |
   | アクション名 | 作成の同期                                                        |
   | 日時     | 追加後                                                          |
   | 次を実行   | Webhook                                                      |
   | URL    | 自分のアプリやサイトからhttps://webhook.site のようなテスト用のwebhook URLを入力します。 |

   このアクションは、Time Off Requestエントリーが追加されるたびに、外部システムにデータを送信します。 詳しくは、 [Defining Actions](../objects/creating-and-managing-objects/actions/defining-object-actions.md) をご覧ください。

   ![Create a webhook action that's triggered after requests are added.](./building-a-time-off-requester/images/04.png)

1. ［**Details**］ タブをクリックし、 次のエントリディスプレイとスコープ設定を設定します。

   | 項目        | 値                    |
   | :-------- | :------------------- |
   | タイトルフィールド | 開始日                  |
   | 範囲        | 会社名                  |
   | パネルリンク    | アプリケーション > コミュニケーション |

1. ［**公開**］ をクリックします。 これにより、オブジェクトが起動します。

次に、Employeeオブジェクトを作成し、それをTime Off Requestオブジェクトに関連付けることで、リクエストエントリーを個々のユーザに関連付けることができます。

## Employeeオブジェクトの追加

1. グローバルメニュー(![グローバルメニュー](../../images/icon-applications-menu.png))を開き、 **コントロールパネル** タブに移動し、 **オブジェクト** をクリックします。

1. **追加** ボタン ( ![追加ボタン](../../images/icon-actions.png))をクリックし、以下の値を入力します。

   | 項目      | 値        |
   | :------ | :------- |
   | ラベル     | Employee |
   | 複数形のラベル | 従業員      |
   | オブジェクト名 | Employee |

1. **オブジェクト** を選択し、 ［**フィールド**］ タブをクリックして、下記の **フィールド** を追加します。

   | ラベル | 項目名     | 種類       | 必須       |
   | :-- | :------ | :------- | :------- |
   | 名前  | `name`  | テキストボックス | &#10004; |
   | メール | `email` | テキストボックス | &#10004; |

   ![Add the Name and Email fields to the Object.](./building-a-time-off-requester/images/05.png)

1. ［**Relationships**］ タブをクリックし、このリレーションシップを追加します。

   | 項目      | 値              |
   | :------ | :------------- |
   | ラベル     | Requester      |
   | リレーション名 | requester      |
   | 種類      | 1 対多           |
   | オブジェクト  | TimeOffRequest |

   ```{note}
   このリレーションシップを作成すると、Time Off Request オブジェクトに外部キーフィールドが自動的に追加されます。
   ```

   ![Add a One to Many Relationship with the Time Off Request Object.](./building-a-time-off-requester/images/06.png)

1. ［**Details**］ タブをクリックし、 次のエントリディスプレイとスコープ設定を設定します。

   | 項目        | 値                |
   | :-------- | :--------------- |
   | タイトルフィールド | 名前               |
   | 範囲        | 会社名              |
   | パネルリンク    | コントロールパネル > ユーザー |

1. ［**公開**］ をクリックします。

公開されると、Liferay UIやHeadless APIを使ってエントリーを作成することができます。 しかし、これらのエントリをリクエストエントリに関連付けるためには、まず [カスタムレイアウト](#designing-custom-object-layouts) を作成する必要があります。

## カスタムオブジェクトレイアウトの設計

オブジェクトのレイアウトは、オブジェクトエントリを作成や編集をする際にフィールドの構成を決定します。 リレーションシップはデフォルトのオブジェクトレイアウトには表示されないので、リレーションシップフィールドを表示するには、両方のオブジェクトにカスタムレイアウトを設計する必要があります。

### Time Off Requestsの場合

1. **Objects** アプリケーションに移動し、 **Time Off Request** オブジェクトを選択します。

1. **Layouts** タブをクリックし、 **Add** ボタン( ![Add Button](../../images/icon-actions.png) )をクリックし、名前に **Request** を入力し、 **Save** をクリックします。

1. 新しいレイアウトを選択し、 **Mark as Default** ボックスをチェックします。

   ![Add a new Layout and mark it as the Object's default layout.](./building-a-time-off-requester/images/07.png)

1. レイアウト **タブをクリックし、2つの** ブロックを持つ **タブ** を追加します。

   | 要素   | ラベル          | 種類  |
   | :--- | :----------- | :-- |
   | タブ   | Request Info | 項目  |
   | ブロック | 日付           | n/a |
   | ブロック | 詳細           | n/a |

1. ブロックにフィールドを追加します。

   | ブロック | 項目                           |
   | :--- | :--------------------------- |
   | 日付   | Start Date、End Date          |
   | 詳細   | Department、Employee、Comments |

   ![Add the Start Date, End Date, Department, Employee, and Comments fields to the layout blocks.](./building-a-time-off-requester/images/08.png)

1. ［**Save**］をクリックします。

保存されると、新しいレイアウトは、LiferayのUIでTime Off Requestのエントリーを作成や編集をする際に使用されます。 employeeエントリーが存在する場合、それを個々のリクエストに関連付けることができます。

![The layout is used for creating and editing Time Off Request entries.](./building-a-time-off-requester/images/09.png)

### Employeesの場合

1. **Objects** アプリケーションに移動し、 **Employee** オブジェクトを選択します。

1. **Layouts** タブをクリックし、 **Add** ボタン( ![Add Button](../../images/icon-actions.png) )をクリックし、名前に **Employee Info*を入力し、** Save_をクリックします。

1. 新しいレイアウトを選択し、 **Mark as Default** ボックスをチェックします。

1. 「レイアウト」タブをクリックし、ブロックを1つ持つ「フィールド」タブを追加する。

   | 要素   | ラベル   | 種類  |
   | :--- | :---- | :-- |
   | タブ   | 基本の詳細 | 項目  |
   | ブロック | 従業員情報 | n/a |

1. ブロックに **Name** と **Email** フィールドを追加します。

1. Employeeオブジェクトの Requesterリレーションシップの［リレーションシップ］タブを追加します。

   | 要素 | ラベル               | 種類 | 関連        |
   | :- | :---------------- | :- | :-------- |
   | タブ | Time Off Requests | 関連 | Requester |

   ![Add a Relationships tab for the Object's Requester relationship.](./building-a-time-off-requester/images/10.png)

1. ［**Save**］をクリックします。

保存されると、新しいレイアウトは、LiferayのUIでemployeeのエントリーを作成や編集をする際に使用されます。 申請エントリが存在する場合は、[**Time Off Requests**]タブで従業員エントリと関連付けることができます。 ここでは、選択したemployeeエントリーに関連するすべてのリクエストを表示することもできます。

![The layout is used to create and edit employee entries.](./building-a-time-off-requester/images/11.png)

## オブジェクトエントリーの追加

これでアプリが完成したので、Liferay UIとHeadless APIを使って、Time Off RequestとEmployeeオブジェクトにデータを追加することができます。

### Employeesの追加

以下の手順で、Headless APIを使ってemployeeエントリーを追加します。

1. Liferay の **API Explorer**(つまり `localhost:8080/o/api`) を開き、 **REST Applications** ドロップダウンメニューをクリックし、 **c/employees** をクリックします。

1. このスクリプトをバッチ `POST` API のリクエスト本文に入力する。

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

1. **実行** をクリックしてください。

これにより、Employeeオブジェクトに 3 つのエントリが追加されます。

### Time Off Requestの追加

以下の手順で、Liferay UIを使ってリクエストエントリを追加します。

1. [グローバルメニュー](../../images/icon-applications-menu.png) )を開き、 [アプリケーション](**Applications**) タブをクリックし、 [タイムオフリクエスト](**Time Off Requests**) を選択します。

1. **追加** ボタン(![追加ボタン](../../images/icon-actions.png))をクリックし、フォームに記入する。

1. ［**Save**］をクリックします。

エントリーを保存すると、そのエントリーの編集画面が表示されます。 さらにエントリーを追加するには、Time Off Requestsのメインページに戻ります。 時間のリクエストが追加されると、ObjectのWebhookがトリガーされ、設定されたURLにエントリーのデータが投稿されます。

リクエストが追加され、employeeエントリーに関連られると、Employeesアプリケーションでそれらを表示することができます。 (![グローバルメニュー](../../images/icon-applications-menu.png))を開き、[コントロールパネル]タブに移動し、[従業員]をクリックします。 関連する **項目** を選択し、 **Time Off Requests** タブをクリックします。

![View an employee's related requests in the Time Off Requests tab.](./building-a-time-off-requester/images/12.png)

## 関連トピック

* [オブジェクトの概要](../objects.md)
* [オブジェクトの作成](../objects/creating-and-managing-objects/creating-objects.md)
* [ピックリストの作成](../objects/picklists/creating-picklists.md)
