# データ・エンティティの決定

ここでは、4つのステップでDistributor Applicationオブジェクトを作成します：

1. [ディストリビューター・アプリケーション・オブジェクトを追加する](#adding-the-distributor-application-object)
1. [オブジェクトを設定する](#configuring-the-object)
1. [カスタムフィールドの追加](#adding-a-custom-field)
1. [オブジェクトを公開する](#publishing-the-distributor-application-object)

![ディストリビューター・アプリケーション・オブジェクトを作成します。](./determining-data-entities/images/01.png)

オブジェクト定義を公開した後、 [ディストリビューターアプリケーションオブジェクトを使用する](#using-distributor-applications) ことでエントリーを作成する練習ができます。

## ディストリビューター・アプリケーション・オブジェクトの追加

1. ［**グローバルメニュー**］（![Global Menu](../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動して、 ［**オブジェクト**］ をクリックします。

1. **Add**( ![Add Button](../../images/icon-add.png) ) をクリックする。

1. 下記の内容を入力してください。

   | 項目       | 値                        |
   |:-------- |:------------------------ |
   | ラベル      | ディストリビューター申請             |
   | 複数形のラベル  | ディストリビューター               |
   | オブジェクト名  | `DistributorApplication` |
   | ストレージタイプ | デフォルト                    |

   ![ラベル、複数のラベル、オブジェクト名、ストレージタイプを入力する。](./determining-data-entities/images/02.png)

1. ［**Save**］ をクリックします。

   これにより、これらのシステム・フィールドを持つドラフト・オブジェクト定義が作成される：

      * `createDate`
      * `creator`
      * `externalReferenceCode`
      * `id`
      * `modifiedDate`
      * `status`
![Liferay はオブジェクトドラフトを作成します。](./determining-data-entities/images/03.png)

## オブジェクトの設定

オブジェクト定義には、その一般的な詳細、動作、利用可能な機能を変更するための設定オプションが含まれています。 例えば、各オブジェクトのデータがどのようにスコープされるか、ユーザーがUIのどこにアクセスできるか、エントリーイベントの履歴を保持するかどうかなどを決めることができます。

以下のようにDistributor Applicationを設定する：

1. オブジェクト定義ドラフトの編集を開始する。

1. 定義のERC（外部参照コード）を変更する。 一貫性があり、人間が読めるERCは、インスタンス間でオブジェクト定義を移動したり、API経由で参照したりするのに役立ちます。

   * **Edit**(![Edit Button](../../images/icon-edit.png)) をクリックします。
   * UUID を `C_DISTRIBUTOR_APPLICATION`で置き換える。
   * ［**Save**］ をクリックします。

     ![定義のERCをC **DISTRIBUTOR** APPLICATIONに更新する。](./determining-data-entities/images/04.png)

1. Detailsタブでこれらの設定を行う：

   | 項目                   | 値                  |
   |:-------------------- |:------------------ |
   | エントリー表示 > タイトル・フィールド | ID                 |
   | スコープ > スコープ          | 会社名                |
   | スコープ > パネル・カテゴリー・キー  | コントロールパネル > オブジェクト |
   | アカウント制限 > アクティブ      | False              |
   | 口座制限 > 口座制限フィールド     | 該当なし               |
   | 設定 > ウィジェットを表示       | True               |
   | 設定 > カテゴリー化を有効にする    | True               |
   | 設定 > 有効 コメント         | False              |
   | 設定 > 入力履歴を有効にする      | False              |

   この設定により、ディストリビューター・アプリケーションは、インスタンスごとにデータを保存し、 パネルカテゴリーキー（例：コントロールパネル &rarr; オブジェクト）に従ってグローバルメニュー( ![Global Menu](../../images/icon-applications-menu.png) )に表示されます。 さらに、ユーザーはこのオブジェクトをウィジェットとしてサイトページに追加したり、ディストリビューター・アプリケーションのエントリーにタグやカテゴリーを割り当てることができます。

1. ［**Save**］ をクリックします。

## カスタムフィールドの追加

オブジェクト定義を公開するには、少なくとも1つのフィールドが必要です。

1. **Fields** タブを開く。

1. **Add**( ![Add Button](../../images/icon-add.png) ) をクリックする。

1. 次の値を入力します。

   | 項目              | 値               |
   |:--------------- |:--------------- |
   | ラベル             | 申請者名            |
   | 項目名             | `applicantName` |
   | 種類              | テキストボックス        |
   | 必須              | True            |
   | 重複しない値のみを受け付けます | False           |

   ![フィールドにこれらの値を追加する。](./determining-data-entities/images/05.png)

1. ［**Save**］ をクリックします。

   新しいフィールドは、 `Custom` バッジとともにFieldsタブに表示されます。

   ![フィールド」タブにカスタムフィールドが表示されることを確認します。](./determining-data-entities/images/06.png)

## ディストリビューター・アプリケーション・オブジェクトの発行

カスタムオブジェクトを公開すると、Liferayはデータエントリを格納するためのデータベーステーブルを作成します。 Publishはまた、オブジェクトをOSGiフレームワークに登録し、 [Liferayのコア機能](https://learn.liferay.com/w/dxp/building-applications/objects/understanding-object-integrations) （パーミッション、ワークフロー、ヘッドレスなど）と統合し、基本的なユーザーインターフェイスを提供します。

1. オブジェクトのDetailsタブに移動する。

1. ［**Publish**］ をクリックします。

   ![Details]タブで [Publish]をクリックします。](./determining-data-entities/images/07.png)

これにより、Distributor Application が有効になり、 `applicantName` フィールドとデフォルトのシステムフィールドを持つデータベーステーブルが作成されます。 パブリッシュ中に何が起こるかについては、 [Publishing Object Drafts](https://learn.liferay.com/en/w/dxp/building-applications/objects/creating-and-managing-objects/creating-objects#publishing-object-drafts) を参照してください。

## ディストリビューター・アプリケーションの使用

ディストリビューター・アプリケーションが公開されました：

1. **Global Menu**( ![Global Menu](../../images/icon-applications-menu.png) ) を開き、 **Control Panel** タブを開き、 **Distributor Applications** をクリックします。

   ![グローバルメニューの「コントロールパネル」>「オブジェクト」からアプリケーションにアクセスします。](./determining-data-entities/images/08.png)

1. **Add**( ![Add Button](../../images/icon-add.png) ) をクリックする。

1. 申請者名を入力し、 **Save** をクリックします。

1. ディストリビューター申請」ページに戻り、エントリー作成が成功したことを確認します。

   `id`, `status`, `author` システム・フィールドとともに、オブジェクトのカスタム・フィールドを含むテーブルにエントリーが表示されます。

   ![ディストリビューター・アプリケーションのアプリケーション・ページでは、デフォルトのテーブル・ビューが使用されます。](./determining-data-entities/images/09.png)

1. **アクション**(![Actions Button](../../images/icon-actions.png)) をクリックし、 **削除** を選択します。

1. 先に進む前に、エントリーの作成、更新、削除を練習する。

また、パブリッシング中にディストリビューター・アプリケーション用に生成されたREST APIを使用して、エントリーの作成、編集、クエリ、および削除を行うこともできます。 これらのAPIは、 `c/distributorapplications` パスで利用できる。 利用可能な API の完全なリストは [Headless Framework Integration](https://learn.liferay.com/en/w/dxp/building-applications/objects/understanding-object-integrations/using-custom-object-apis) を、入門チュートリアルは [Custom Object API Basics](https://learn.liferay.com/en/w/dxp/building-applications/objects/objects-tutorials/using-apis/object-api-basics) を参照してください。

![LiferayはDistributor ApplicationのREST APIを生成します。](./determining-data-entities/images/10.png)

これでオブジェクトが定義されたので、さらにフィールドを追加して、必要な申請者情報を収集することができます。

次へ [ディストリビューター・アプリケーション・オブジェクトへのフィールドの追加](./adding-fields-to-the-distributor-application-object.md)

## 関連コンセプト

* [オブジェクト](https://learn.liferay.com/en/w/dxp/building-applications/objects)
* [オブジェクトの作成](https://learn.liferay.com/en/w/dxp/building-applications/objects/creating-and-managing-objects/creating-objects)
* [オブジェクト統合を理解する](https://learn.liferay.com/w/dxp/building-applications/objects/understanding-object-integrations)
