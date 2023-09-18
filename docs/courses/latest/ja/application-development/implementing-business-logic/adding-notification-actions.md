# 通知アクションの追加

デレクタブル・ボンサイは、新しいアプリケーションの認知度を向上させたいと考えている。 また、申請者の更新を自動化し、申請が受理、承認、拒否されたときに通知することも望んでいる。 ここでは、これらの通知アクションをDistributor Applicationオブジェクトに追加します。

![ディストリビューター・アプリケーション・オブジェクトに通知アクションを追加します。](./adding-notification-actions/images/01.png)

## 申請に対する措置

1. **Distributer Application** オブジェクトの編集を開始します。

1. ［**Actions**］ タブを開き、 **追加**( ![Add Button](../../images/icon-add.png) ) をクリックします。

1. 基本情報タブにこれらの値を入力する：

   | 項目        | 値                  |
   |:--------- |:------------------ |
   | アクションのラベル | 申請書提出              |
   | アクション名    | 申請                 |
   | 説明        | 追加後、管理者ユーザーに通知を送る。 |
   | 有効        | True               |

   ![基本情報タブにこれらの値を入力する。](./adding-notification-actions/images/02.png)

1. **アクションビルダー** タブに行き、これらの値を設定する：

   | 項目       | 値              |
   |:-------- |:-------------- |
   | トリガー     | 追加後            |
   | 条件       | 該当なし           |
   | 操作       | 通知             |
   | 通知テンプレート | 申請者, 管理者, ユーザー |

   ![アクションビルダータブにこれらの値を入力する。](./adding-notification-actions/images/03.png)

1. ［**保存**］ をクリックします。

## 申請に対する措置

1. Actions タブで、 **Add**( ![Add Button](../../images/icon-add.png) ) をクリックする。

1. 基本情報にはこれらの値を入力する：

   | 項目        | 値                     |
   |:--------- |:--------------------- |
   | アクションのラベル | 申請受理                  |
   | アクション名    | `applicationReceived` |
   | 説明        | 追加後、応募者に通知を送る。        |
   | 有効        | True                  |

1. **アクションビルダー** タブに行き、これらの値を設定する：

   | 項目       | 値              |
   |:-------- |:-------------- |
   | トリガー     | 追加後            |
   | 条件       | 該当なし           |
   | 操作       | 通知             |
   | 通知テンプレート | 申請書受領、申請者、Eメール |

1. ［**Save**］ をクリックします。

## 申請が承認された場合の措置

1. Actions タブで、 **Add**( ![Add Button](../../images/icon-add.png) ) をクリックする。

1. 基本情報にはこれらの値を入力する：

   | 項目        | 値                              |
   |:--------- |:------------------------------ |
   | アクションのラベル | 申請承認                           |
   | アクション名    | `applicationApproved`          |
   | 説明        | 更新後、状態が「承認」されたときに申請者に通知を送信します。 |
   | 有効        | True                           |

1. **アクションビルダー** タブに行き、これらの値を設定する：

   | 項目       | 値                                                |
   |:-------- |:------------------------------------------------ |
   | トリガー     | 更新後                                              |
   | 条件       | `applicationState == "approved" AND status == 0` |
   | 操作       | 通知                                               |
   | 通知テンプレート | 申請承認、申請者、Eメール                                    |

1. ［**保存**］ をクリックします。

## 申請却下の措置

1. Actions タブで、 **Add**( ![Add Button](../../images/icon-add.png) ) をクリックする。

1. 基本情報にはこれらの値を入力する：

   | 項目        | 値                              |
   |:--------- |:------------------------------ |
   | アクションのラベル | 申請却下                           |
   | アクション名    | `applicationDenied`            |
   | 説明        | 更新後、状態が「拒否」された場合、申請者に通知を送信します。 |
   | 有効        | True                           |

1. **アクションビルダー** タブに行き、これらの値を設定する：

   | 項目       | 値                                              |
   |:-------- |:---------------------------------------------- |
   | トリガー     | 更新後                                            |
   | 条件       | `applicationState == "denied" AND status == 0` |
   | 操作       | 通知                                             |
   | 通知テンプレート | 申請却下、申請者、Eメール                                  |

1. ［**Save**］ をクリックします。

## 通知アクションのトリガー

通知アクションを追加し、アクティブ化したので、オブジェクトエントリーを追加・更新することで通知アクションをトリガーすることができます：

1. ディストリビューター・アプリケーションページに移動し、新規エントリーを作成します。

1. Application SubmittedとApplication Receivedのアクションが実行されたことを確認する。

   ![Application SubmittedとApplication Receivedのアクションが実行されたことを確認する。](./adding-notification-actions/images/04.png)

1. アプリケーションの状態を **Approved** に更新する。

1. Application Approvedアクションが実行されることを確認する。

   ![Application Approvedアクションが実行されることを確認する。](./adding-notification-actions/images/05.png)

1. アプリケーションの状態を **Denied** に更新する。

1. Application Deniedアクションが実行されることを確認する。

   ![Application Deniedアクションが実行されることを確認する。](./adding-notification-actions/images/06.png)

これらの通知は、新規申請の可視性を向上させ、申請者の申請状況を常に最新の状態に保つのに役立ちます。

今、Delectable Bonsaiは、ビジネス開発マネージャーに、承認された申請者のビジネスアカウントを簡単に作成する方法を提供したいと考えています。

次へ [アカウント作成の自動化](./automating-account-creation.md)

## 関連コンセプト

* [オブジェクトアクションの定義](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/actions/defining-object-actions)
* [通知アクション](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/actions/understanding-action-types#notification)
