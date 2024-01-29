# オブジェクト定義間にリレーションシップを追加する

デレクタブル・ボンサイは、複数の審査に申請書を関連付けなければならない。 これには、Distributor Applicationオブジェクトに1対多のリレーションシップを追加する必要があります。

1. Distributor Applicationオブジェクトの編集を開始します。

1. **Relationships** タブに移動します。

1. **追加**(![追加ボタン](../../images/icon-add.png))をクリックし、これらの詳細を入力します：

   | 項目     | 値                          |
   | :----- | :------------------------- |
   | ラベル    | 評価への応用                     |
   | 名前     | `applicationToEvaluations` |
   | 種類     | 1 対多                       |
   | オブジェクト | アプリケーション評価                 |

1. ［**Save**］をクリックします。

   これは、Distributor Applicationにリレーションシップテーブルを追加するもので、定義のレイアウトの別のタブに追加できます。

   ![Add the applicationToEvaluations relationship to the Distributor Application object.](./adding-a-relationship-between-the-object-definitions/images/01.png)

   このリレーションシップは、アプリケーション評価オブジェクト定義にもフィールドを追加する。

   ![For the Application Evaluation object, the relationship appears in the Fields tab.](./adding-a-relationship-between-the-object-definitions/images/02.png)

   Liferayはまた、REST APIを使用してエントリを関連付けたり関連付けなかったりするために、専用のリレーションシップRESTエンドポイントを両方のオブジェクト定義に追加します。

   ![Liferay adds dedicated relationship REST endpoints to both object definitions.](./adding-a-relationship-between-the-object-definitions/images/03.png)

オブジェクト・エントリーのリレーションを練習する前に、各オブジェクトのカスタム・レイアウトにリレーションを追加する必要があります。

次へ [カスタムレイアウトにリレーションシップを追加する](./adding-the-relationship-to-custom-layouts.md) 

## 関連コンセプト

* [関連](https://learn.liferay.com/ja/w/dxp/building-applications/objects/creating-and-managing-objects/relationships)
* [カスタムオブジェクトAPIの使用](https://learn.liferay.com/ja/w/dxp/building-applications/objects/understanding-object-integrations/using-custom-object-apis#relationship-rest-apis)
