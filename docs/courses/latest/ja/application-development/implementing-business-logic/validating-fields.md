# フィールドの検証

これまでのところ、Delectable Bonsaiは、申請者が申請書に有効で一貫性のあるデータを提供していることを確認する方法がありません。 ここでは、Distributor ApplicationのEメール、電話番号、URLフィールドにバリデーションを追加し、データの整合性と一貫性を向上させます。

![Eメール、電話番号、URLフィールドのバリデーションを追加しました。](./validating-fields/images/01.png)

## メールフィールドにバリデーションを追加する

Liferay は `isEmailAddress()` 関数を提供し、フィールドの値が標準的な電子メール要素 (@gmail や .com など) を使用しているかどうかをチェックします。

以下の手順に従って、 `applicantEmail` および `primaryContactEmail` フィールドを検証してください：

1. ［**グローバルメニュー**］（![Global Menu](../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動して、 ［**オブジェクト**］ をクリックします。

1. Distributor Application オブジェクトの編集を開始し、 **Validations** タブを開きます。

1. **Add**( ![Add Button](../../images/icon-add.png) ) をクリックし、これらの詳細を入力し、 **Save** をクリックします。

   | 項目  | 値             |
   |:--- |:------------- |
   | ラベル | Eメール、申請者Eメール  |
   | 種類  | エクスプレッションビルダー |

   ![ラベルを入力し、タイプを選択し、Saveをクリックする。](./validating-fields/images/02.png)

1. 新しく作成したバリデーションの編集を開始します。

1. 基本情報タブで、以下の値を設定する：

   | 項目        | 値    |
   |:--------- |:---- |
   | 有効な検証     | True |
   | イベントのトリガー | 送信時  |

   ![バリデーションを有効にし、On Submissionトリガーを選択する。](./validating-fields/images/03.png)

1. **Conditions** タブに行き、これらの値を入力する：

   | 項目            | 値                                                        |
   |:------------- |:-------------------------------------------------------- |
   | エクスプレッションビルダー | `isEmailAddress(applicantEmail) OR applicantEmail == ""` |
   | エラーメッセージ      | 有効な申請者のメールアドレスを入力してください。                                 |

   このため、フィールドの値は標準的なEメールパターンに従うか、空である必要があります。

   ```{tip}
   バリデーションを使用して、ユーザーがフィールドを空にすることを許可しないようにすることで、オプションのフィールドを必須にすることができます。
   ```

   ![isEmailAddress関数をapplicientEmailフィールドで使用します。](./validating-fields/images/04.png)

   ユーザが無効な値でエントリを送信しようとすると、Liferayは設定されたエラーメッセージを表示します。

   ![エンドユーザーが無効な値を送信しようとしたときに表示されるエラーメッセージを入力します。](./validating-fields/images/05.png)

1. ［**Save**］ をクリックします。

   ![保存をクリックして検証を有効にします。](./validating-fields/images/06.png)

1. `isEmailAddress()` 関数を使用して `primaryContactEmail` フィールドを検証するには、上記の手順を繰り返します。

## 電話番号フィールドにバリデーションを追加する

Liferay は、フィールドの値が指定された RegEx パターンや文字列値にマッチするかどうかをチェックするために `match()` 関数を提供しています。 このシナリオでは、Delectable Bonsaiは電話番号フィールドを検証するために次の式を使いた い： `^(\+d{1,3} ?)?((\d{1,3})|d{1,3})[- .]?\d{3,4}[- .]?\d{4}$`.

`primaryContactPhoneNumber`, `businessPhoneNumber`, `bankPhoneNumber`, `referencePhoneNumber` フィールドを検証するには、以下の手順に従います：

1. 検証]タブで、 [**追加]をクリックし、**( ![Add Button](../../images/icon-add.png) )、これらの詳細を入力し、 [**保存]をクリックする** 。

   | 項目  | 値                              |
   |:--- |:------------------------------ |
   | ラベル | 電話番号、primaryContactPhoneNumber |
   | 種類  | エクスプレッションビルダー                  |

1. 新しく作成したバリデーションの編集を開始します。

1. 基本情報タブで、以下の値を設定する：

   | 項目        | 値    |
   |:--------- |:---- |
   | 有効な検証     | True |
   | イベントのトリガー | 送信時  |

1. **Conditions** タブに行き、これらの値を入力する：

   | 項目            | 値                                                                                                                                                |
   |:------------- |:------------------------------------------------------------------------------------------------------------------------------------------------ |
   | エクスプレッションビルダー | `match(primaryContactPhoneNumber, "^(\+\d{1,3} ?)?((\(\d{1,3}\))|\d{1,3})[- .]?\d{3,4}[- .]?\d{4}$") OR primaryContactPhoneNumber == ""` |
   | エラーメッセージ      | 連絡先の電話番号を入力してください。                                                                                                                               |

   <!--FINISH: Confirm the above regex pattern renders correctly in the site. In my preview, the | character breaks the table. -->

   このバリデーションでは、国際電話番号の国番号、市外局番、セパレータを使用することができ、幅広い国際電話番号をサポートしています。 また、フォーマットのバリエーション（スペース、ダッシュ、ドットなど）も許容するが、最低7桁、最高11桁を強制する。 このフィールドはオプションなので、このバリデーションでは空の値も許容します。

1. ［**Save**］ をクリックします。

1. `businessPhoneNumber`, `bankPhoneNumber`, `referencePhoneNumber` フィールドについて、これらの手順を繰り返す。

## ビジネスウェブサイトのフィールドにバリデーションを追加する

Liferayは、フィールドの値が標準的なURL要素（例えば、 `http`, `://`, `.com`）を使用しているかどうかをチェックするための `isURL()` 関数を提供します。

<!--FINISH: Confirm :// renders correctly in the site. My preview renders :/ as an emoji. -->

以下の手順に従って、 `businessWebsite` フィールドを検証してください：

1. 検証]タブで、 [**追加]をクリックし、**( ![Add Button](../../images/icon-add.png) )、これらの詳細を入力し、 [**保存]をクリックする** 。

   | 項目  | 値              |
   |:--- |:-------------- |
   | ラベル | URL、ビジネスウェブサイト |
   | 種類  | エクスプレッションビルダー  |

1. 新しく作成したバリデーションの編集を開始します。

1. 基本情報タブで、以下の値を設定する：

   | 項目        | 値    |
   |:--------- |:---- |
   | 有効な検証     | True |
   | イベントのトリガー | 送信時  |

1. **Conditions** タブに行き、これらの値を入力する：

   | 項目            | 値                                                 |
   |:------------- |:------------------------------------------------- |
   | エクスプレッションビルダー | `isURL(businessWebsite) OR businessWebsite == ""` |
   | エラーメッセージ      | 有効なウェブサイトのURLを入力してください。                           |

1. ［**Save**］ をクリックします。

完了したら、7つのバリデーションがあるはずだ。

![7つのバリデーションがあるはずだ。](./validating-fields/images/07.png)

## バリデーションのテスト

これらがアクティブになったので、バリデーションのテストを始めることができます：

1. Distributor Applicationsを開き、エントリーの編集を開始します。

1. 電子メール・フィールドを無効な値に更新し、 **保存** 。 バリデーションのエラーメッセージが表示されます。

   ![Liferay はバリデーションのエラーメッセージを表示します。](./validating-fields/images/08.png)

1. フィールドに有効なEメールを入力し、 **Save** をクリックします。 保存に成功した。

1. このプロセスを繰り返して、電話番号とウェブサイトのバリデーションをテストする。

   <!-- ![Liferay displays the validation's error message.](./validating-fields/images/09.png) -->

   <!-- ![Liferay displays the validation's error message.](./validating-fields/images/10.png) -->

申請書を提出するディストリビューターは、有効なフィールド値を入力しなければなりません。

現在、Delectable Bonsaiは、意図されたユーザのみがDistributor ApplicationとApplication Evaluationオブジェクトのデータにアクセスできるようにしたいと考えています。

次へ [データへのアクセス管理](./managing-access-to-data.md)

## 関連コンセプト

* [検証](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects/creating-and-managing-objects/validations)
* [エクスプレッションビルダー検証のリファレンス](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects/creating-and-managing-objects/validations/expression-builder-validations-reference)
