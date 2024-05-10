# ディストリビューター申請用通知テンプレートの追加

現時点では、Delectable Bonsaiのディストリビューターアプリケーションには、エントリーイベントの自動通知はありません。 つまり、管理者は新しい応募を知るためにオブジェクトをチェックし、応募者に応募状況を手動で知らせなければならない。 この戦略は拡張性がなく、人為的ミスの余地を残すため、機会損失やユーザー体験の低下を招く。

ここでは、Distributor Application オブジェクトで使用する通知テンプレートを作成します：

| イベント  | 受信者 | 種類   |
|:----- |:--- |:---- |
| 申請書提出 | 管理者 | ユーザー |
| 申請受理  | 申請者 | メール  |
| 申請承認  | 申請者 | メール  |
| 申請却下  | 申請者 | メール  |

![Distributor Application Object に 4 つの通知テンプレートを作成します。](./adding-notification-templates/images/01.png)

## 申請書提出テンプレート

1. **グローバルメニュー**( ![Global Menu](../../images/icon-applications-menu.png) ) を開き、 **コントロールパネル** タブを開き、 **テンプレート** をクリックする。

1. **Add**( ![Add Button](../../images/icon-add.png) ) をクリックし、 **User Notification** を選択する。

1. Definition of Terms（用語の定義）」までスクロールダウンし、「Entity（エンティティ）」ドロップダウンメニューを使用して、「**Distributor Application（ディストリビューター・アプリケーション**）」 オブジェクトを選択します。

   ![用語の定義」を下にスクロールし、「ディストリビューター申請」を選択してください。](./adding-notification-templates/images/02.png)

   テンプレート内でこれらのフィールド参照を使用して、入力データを動的に通知に入力することができます。 一般条件セクションには、通知アクションのトリガーとなるユーザーのフィールドを参照するための条件があります。

1. 基本情報にはこれらの値を入力する：

   | 項目 | 値                                       |
   |:-- |:--------------------------------------- |
   | 名前 | 申請者, 管理者, ユーザー                          |
   | 説明 | ディストリビューター申請が提出されると、管理ロールにユーザー通知を送信します。 |

   ![基本情報にはこれらの値を入力する。](./adding-notification-templates/images/03.png)

1. Settingsにこれらの値を入力する：

   | 項目  | 値          |
   |:--- |:---------- |
   | 受信者 | ロール        |
   | ロール | 事業開発マネージャー |

   ![Settingsにこれらの値を入力する。](./adding-notification-templates/images/04.png)

1. Contentにはこの値を入力する：

   | 項目 | 値                                                                                                                                          |
   |:-- |:------------------------------------------------------------------------------------------------------------------------------------------ |
   | 件名 | APP-[%DISTRIBUTORAPPLICATION_ID%]: [%DISTRIBUTORAPPLICATION_APPLICANTNAME%] は [%DISTRIBUTORAPPLICATION_BUSINESSNAME%]のディストリビューター申請を提出した。 |

   ![Contentにはこの値を入力する。](./adding-notification-templates/images/05.png)

1. ［**Save**］ をクリックします。

   ```{tip}
   通知テンプレートのERCはランダムに生成されたUUIDを使用しますが、作成後にテンプレートのERCを変更することができます。 一貫性があり、人間が読めるERCを使うことは、テンプレートやオブジェクトを環境間で移動するときに役立ちます（例えば、`APPLICATION_SUBMITTED_ADMIN_USER`）。
   ```

## 申請書受領テンプレート

1. **Add**( ![Add Button](../../images/icon-add.png) ) をクリックし、 **Email** を選択する。

1. 基本情報にはこれらの値を入力する：

   | 項目 | 値                           |
   |:-- |:--------------------------- |
   | 名前 | 申請書受領、申請者、Eメール              |
   | 説明 | 申請が受理されたことを示すEメールを申請者に送信する。 |

   ![基本情報にはこれらの値を入力する。](./adding-notification-templates/images/06.png)

1. Settingsにこれらの値を入力する：

   | 項目         | 値                                         |
   |:---------- |:----------------------------------------- |
   | 終了         | [%DISTRIBUTORAPPLICATION_APPLICANTEMAIL%] |
   | CC         | 該当なし                                      |
   | BCC        | 該当なし                                      |
   | 送信者メールアドレス | `sales@delectable-bonsai.com`             |
   | 送信者名       | おいしい盆栽                                    |

   ![Settingsにこれらの値を入力する。](./adding-notification-templates/images/07.png)

1. Contentにこの値を入力する：

   | 項目      | 値                                                                                                                                                                                                                                                                                                                                                                 |
   |:------- |:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
   | 件名      | ご応募ありがとうございました！                                                                                                                                                                                                                                                                                                                                                   |
   | エディタタイプ | リッチテキスト                                                                                                                                                                                                                                                                                                                                                           |
   | テンプレート  | **Source** ボタン ( ![Source button](../../images/icon-code.png) ) をクリックします。 次に、 [`ApplicationReceived_Applicant_Email.html`](https://resources.learn.liferay.com/w/courses/application-development/implementing-business-logic/automating-notifications/adding-notification-templates/ApplicationReceived_Applicant_Email) の内容をコピーし、Templateフィールドに貼り付ける。 |

<!-- Not sure the above will work; we'll have to see. -Rich --> 

   ![コンテンツ（Content）にはこれらの値を入力する。](./adding-notification-templates/images/08.png)

   レンダリングすると、メッセージ本文は次のようになる：

   ![コンテンツ（Content）にはこれらの値を入力する。](./adding-notification-templates/images/09.png)

1. ［**保存**］ をクリックします。

## 申請承認テンプレート

1. **Add**( ![Add Button](../../images/icon-add.png) ) をクリックし、 **Email** を選択する。

1. 基本情報にはこれらの値を入力する：

   | 項目 | 値                             |
   |:-- |:----------------------------- |
   | 名前 | 申請承認、申請者、Eメール                 |
   | 説明 | 申請が承認されたことを知らせるEメールを申請者に送信する。 |

1. Settingsにこれらの値を入力する：

   | 項目         | 値                                         |
   |:---------- |:----------------------------------------- |
   | 終了         | [%DISTRIBUTORAPPLICATION_APPLICANTEMAIL%] |
   | CC         | 該当なし                                      |
   | BCC        | 該当なし                                      |
   | 送信者メールアドレス | `sales@delectable-bonsai.com`             |
   | 送信者名       | おいしい盆栽                                    |

1. Contentにこの値を入力する：

   | 項目      | 値                                                                                                                                                                                                                                                                                                                                                                  |
   |:------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
   | 件名      | 甘いものが待っている！                                                                                                                                                                                                                                                                                                                                                        |
   | エディタタイプ | リッチテキスト                                                                                                                                                                                                                                                                                                                                                            |
   | テンプレート  | **Source** ボタン ( ![Source button](../../images/icon-code.png) ) をクリックします。 次に、 [`ApplicationApproved_Applicant_Email.html`](https://resources.learn.liferay.com/w/courses/application-development/implementing-business-logic/automating-notifications/adding-notification-templates/ApplicationApproved_Applicant_Email) の内容をコピーし、Templateフィールドに貼り付けます。 |

   レンダリングすると、メッセージ本文は次のようになる：

   ![コンテンツ（Content）にはこれらの値を入力する。](./adding-notification-templates/images/10.png)

1. ［**Save**］ をクリックします。

## 申請却下テンプレート

1. **Add**( ![Add Button](../../images/icon-add.png) ) をクリックし、 **Email** を選択する。

1. 基本情報にはこれらの値を入力する：

   | 項目 | 値                             |
   |:-- |:----------------------------- |
   | 名前 | 申請却下、申請者、Eメール                 |
   | 説明 | 申請が却下されたことを知らせるEメールを申請者に送信する。 |

1. Settingsにこれらの値を入力する：

   | 項目         | 値                                         |
   |:---------- |:----------------------------------------- |
   | 終了         | [%DISTRIBUTORAPPLICATION_APPLICANTEMAIL%] |
   | CC         | 該当なし                                      |
   | BCC        | 該当なし                                      |
   | 送信者メールアドレス | `sales@delectable-bonsai.com`             |
   | 送信者名       | おいしい盆栽                                    |

1. Contentにこの値を入力する：

   | 項目      | 値                                                                                                                                                                                                                                                                                                                                                              |
   |:------- |:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
   | 件名      | 申請決定の最新情報                                                                                                                                                                                                                                                                                                                                                      |
   | エディタタイプ | リッチテキスト                                                                                                                                                                                                                                                                                                                                                        |
   | テンプレート  | **Source** ボタン ( ![Source button](../../images/icon-code.png) ) をクリックします。 次に、 [`ApplicationDenied_Applicant_Email.html`](https://resources.learn.liferay.com/w/courses/application-development/implementing-business-logic/automating-notificiations/adding-notification-templates/ApplicationDenied_Applicant_Email) の内容をコピーし、Templateフィールドに貼り付ける。 |

   レンダリングすると、メッセージ本文は次のようになる：

   ![コンテンツ（Content）にはこれらの値を入力する。](./adding-notification-templates/images/11.png)

1. ［**Save**］ をクリックします。

これらのテンプレートを使って、Distributor Application オブジェクトに通知アクションを定義することができます。

次へ [通知アクションの追加](./adding-notification-actions.md)

## 関連コンセプト

* [通知テンプレートの作成](https://learn.liferay.com/w/dxp/process-automation/notifications/creating-notification-templates)
