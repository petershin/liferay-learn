# 状態フィールドの定義

Delectable Bonsaiは、アプリケーションの進行状況を追跡し、追加のビジネス・ロジックをトリガーするためのカスタム・ステート・フィールドを定義したいと考えています。 ここでは、これらの状態を定義するピックリストを追加し、それをディストリビューター・アプリケーション・オブジェクトの状態フィールドに使用し、状態フィールドのフローを管理します。

## アプリケーション状態のピックリストの追加

<!--TASK: Use client extensions or use the Export/Import center when ready. -->

1. **Global Menu**( ![Global Menu](../../images/icon-applications-menu.png) ) を開き、 **Control Panel** タブを開き、 **Picklists** をクリックする。

1. **Add**( ![Add Button](../../images/icon-add.png) ) をクリックする。

1. Name に Application States と入力し、 **Save** をクリックする。

1. ピックリストの編集を始める。

   ![Application Statesピックリストを作成し、編集します。](./defining-a-state-field/images/01.png)

1. **Add**( ![Add Button](../../images/icon-add.png) ) をクリックして、これらの項目をピックリストに追加します：

   | 名前    | キー            |
   |:----- |:------------- |
   | 公開    | `open`        |
   | レビュー中 | `underReview` |
   | 承認済み  | `approved`    |
   | 拒否    | `denied`      |
   | 撤退    | `withdrawn`   |
   | 申請済み  | `onHold`      |

1. 各項目を編集し、ERCをこれらの値に設定する：

   | 外部参照コード                          |
   |:-------------------------------- |
   | `APPLICATION_STATE_OPEN`         |
   | `APPLICATION_STATE_UNDER_REVIEW` |
   | `APPLICATION_STATE_APPROVED`     |
   | `APPLICATION_STATE_DENIED`       |
   | `APPLICATION_STATE_WITHDRAWN`    |
   | `APPLICATION_STATE_ON_HOLD`      |

   ![ピックリストにアイテムを追加し、そのERCを更新する。](./defining-a-state-field/images/02.png)

1. ピックリストのERCを `LIST_APPLICATION_STATES`に変更する。

   ![ピックリストのERCを更新する。](./defining-a-state-field/images/03.png)

1. ［**Save**］ をクリックします。

ピックリストを使用して、Distributor Application オブジェクトに状態フィールドを作成することができます。

## アプリケーション状態フィールドの追加

1. ［**グローバルメニュー**］（![Global Menu](../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動して、 ［**オブジェクト**］ をクリックします。

1. Distributor Application オブジェクトの編集を開始し、 **Fields** タブを開きます。

1. **Add**(![Add Button](../../images/icon-add.png)) をクリックし、これらの詳細を入力し、 **Save** をクリックします：

   | 項目     | 値                  |
   |:------ |:------------------ |
   | ラベル    | アプリケーションの状態        |
   | 項目名    | `applicationState` |
   | 種類     | 候補リスト              |
   | 候補リスト  | 適用国                |
   | 必須     | True               |
   | 状態にする  | True               |
   | デフォルト値 | 公開                 |

   ![Distributor Application オブジェクトに Application State フィールドを追加します。](./defining-a-state-field/images/04.png)

## ステート・フローの管理

1. ディストリビューター・アプリケーション・オブジェクトを編集中に、 **State Manager** 。

1. **Application State** をクリックする。

1. これらのフロー値を設定する：

   | 項目    | 値             |
   |:----- |:------------- |
   | 公開    | 検討中, 取り下げ     |
   | レビュー中 | 承認、拒否、取り下げ、保留 |
   | 承認済み  | レビュー中         |
   | 拒否    | レビュー中         |
   | 撤退    | 公開            |
   | 申請済み  | オープン、検討中      |

   ![これらを設定する ](./defining-a-state-field/images/05.png)

1. ［**Save**］ をクリックします。

Application Stateフィールドを更新するとき、ユーザーオプションはステートフローによって決定される。

## アプリケーション状態フィールドの使用

アプリケーション・ステートの使い方を練習するには、まずオブジェクトのレイアウトとビューにフィールドを追加しなければなりません。

### カスタムレイアウトにフィールドを追加する

1. ディストリビューター・アプリケーション・オブジェクトの編集中に、 **Layouts** タブを開き、レイアウトの編集を開始します。

1. Info］タブで、レイアウト名を［Layout with State Field］に変更する。

   ![レイアウト名をLayout with State Fieldに変更する。](./defining-a-state-field/images/06.png)

1. **レイアウト** タブに移動する。

1. **Add Field** for General Details ブロックをクリックする。

1. Application Stateフィールドを選択し、 **Save** をクリックする。

   ![General DetailsブロックにApplication Stateフィールドを追加する。](./defining-a-state-field/images/07.png)

1. **レイアウトの保存** をクリックします。

### カスタムビューにフィールドを追加する

1. **Views** タブを開き、ビューの編集を開始する。

1. 情報]タブで、ビューの名前を[状態フィールド付きビュー]に変更する。

   ![ビューの名前を「状態フィールド付きビュー」に変更する。](./defining-a-state-field/images/08.png)

1. **ビュービルダー** タブにアクセスする。

1. **Add** をクリックし、 **Application State** フィールドを選択し、 **Save** をクリックする。

   ![アプリケーション状態フィールドをビューに追加する。](./defining-a-state-field/images/09.png)

1. フィールドをドラッグ・アンド・ドロップして並び替える：

   * ID
   * 申請者名
   * 事業名
   * 作成日時
   * アプリケーションの状態
   * ステータス

1. **ビューの保存** をクリックする。

### フィールドの利用

1. ディストリビューター・アプリケーション」に進み、既存のアプリケーションの編集を開始します。 ステート・フィールドが追加される前にエントリーが作成されたにもかかわらず、デフォルト値が設定されています。

1. stateフィールドの値を更新し、 **Save** をクリックする。 利用可能なオプションは、フィールドの現在の値に依存することに注意。

   ![利用可能なオプションは状態の流れによって異なる。](./defining-a-state-field/images/10.png)

1. 同じアプリケーションの編集を始める。

1. 状態フィールドを再度更新する。 オプションが異なることに注目してほしい。

   ![州フィールドのオプションは異なる。](./defining-a-state-field/images/11.png)

状態フィールドが追加されたので、Delectable Bonsaiは、ユーザーがそれを'承認'または'拒否'に更新したときにレビューが必要なワークフロープロセスを追加したい。

次へ [承認ワークフローの追加](./adding-an-approval-workflow.md)

## 関連コンセプト
