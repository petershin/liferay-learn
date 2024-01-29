# ディストリビューター・アプリケーション・オブジェクトへのフィールドの追加

ここでは、ディストリビューター申請オブジェクトに一般フィールドを追加し、申請者と連絡先の追加情報を収集します：

1. ［**グローバルメニュー**］（![Global Menu](../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動して、 ［**オブジェクト**］ をクリックします。

1. Distributor Application オブジェクトの編集を開始し、 **Fields** タブを開きます。

1. **Add**(![Add Button](../../images/icon-add.png)) をクリックし、これらの詳細を入力し、 **Save** をクリックします：

   | 項目              | 値                |
   |:--------------- |:---------------- |
   | ラベル             | 申請者メールアドレス       |
   | 項目名             | `applicantEmail` |
   | 種類              | テキストボックス         |
   | 必須              | False            |
   | 重複しない値のみを受け付けます | True             |

   ![Applicant Email フィールドを追加します。](./adding-fields-to-the-distributor-application-object/images/01.png)

1. 主な連絡先の名前のフィールドを追加します：

   | 項目              | 値                    |
   |:--------------- |:-------------------- |
   | ラベル             | 主な連絡先                |
   | 項目名             | `primaryContactName` |
   | 種類              | テキストボックス             |
   | 必須              | False                |
   | 重複しない値のみを受け付けます | False                |

1. 主要コンタクトの肩書きのフィールドを追加します：

   | 項目              | 値                     |
   |:--------------- |:--------------------- |
   | ラベル             | 主な連絡先役職               |
   | 項目名             | `primaryContactTitle` |
   | 種類              | テキストボックス              |
   | 必須              | False                 |
   | 重複しない値のみを受け付けます | False                 |

1. 主要コンタクトのEメールフィールドを追加します：

   | 項目              | 値                     |
   |:--------------- |:--------------------- |
   | ラベル             | 連絡先メールアドレス            |
   | 項目名             | `primaryContactEmail` |
   | 種類              | テキストボックス              |
   | 必須              | False                 |
   | 重複しない値のみを受け付けます | True                  |

1. 主な連絡先の電話番号のフィールドを追加します：

   | 項目              | 値                           |
   |:--------------- |:--------------------------- |
   | ラベル             | 主な連絡先電話番号                   |
   | 項目名             | `primaryContactPhoneNumber` |
   | 種類              | テキストボックス                    |
   | 必須              | False                       |
   | 重複しない値のみを受け付けます | True                        |

1. コメント欄を追加する：

   | 項目  | 値            |
   |:--- |:------------ |
   | ラベル | 掲示板のディスカッション |
   | 項目名 | `comments`   |
   | 種類  | 長いテキスト       |
   | 必須  | False        |

保存された各フィールドは、ディストリビューター・アプリケーション・オブジェクトに即座に追加され、エントリーを作成する際に自動的にデフォルトのレイアウトで表示されます。

![新しいフィールドを含む新しいエントリーを追加する。](./adding-fields-to-the-distributor-application-object/images/02.png)

新しいフィールドは、オブジェクトのデフォルトのテーブル・ビューにも表示されます。

![デフォルトのテーブル・ビューには、すべてのカスタム・フィールドが含まれています。](./adding-fields-to-the-distributor-application-object/images/03.png)

これらのフィールドは、Delectable Bonsaiが応募希望者をフォローアップするのに役立ちます。

現在、オブジェクト定義には、KYCおよびAMLポリシーに準拠したビジネス情報を収集するための追加フィールドが必要である。 これらのフィールドを手動で追加するのではなく、 `object-admin` REST APIを使ってプログラムで追加します。

次へ [REST APIを使ったフィールドの追加](./adding-fields-using-rest-apis.md)

## 関連コンセプト

* [項目](https://learn.liferay.com/ja/w/dxp/building-applications/objects/creating-and-managing-objects/fields)
* [オブジェクトへのフィールドの追加](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/fields/adding-fields-to-objects)
