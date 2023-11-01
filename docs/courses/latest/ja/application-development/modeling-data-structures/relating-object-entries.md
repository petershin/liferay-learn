# オブジェクト・エントリーの関係

オブジェクトのリレーションシップを定義した後、Liferay UIとリレーションシップREST APIの2つの方法でエントリをリレーションすることができます。 ここでは、UIを介して評価とアプリケーションを関連付ける練習をする。

## テストデータの追加

1. [この演習のリソースをダウンロードし、解凍してください](./liferay-g2n9.zip) ：

   ```bash
   curl https://learn.liferay.com/courses/latest/en/application-development/modeling-data-structures/relating-object-entries/liferay-g2n9.zip -O
   ```

   ```bash
   unzip liferay-g2n9.zip
   ```

   これには、アプリケーションと評価エントリーを作成するための2つのスクリプトが含まれています。

1. `liferay-g2n9` フォルダ内の `curl` フォルダに移動します：

   ```bash
   cd liferay-g2n9/curl
   ```

1. このコマンドを実行し、Distributor Applicationオブジェクトに3つのエントリーを作成します：

   ```bash
   ./DistributorApplication_POST_Batch.sh
   ```

1. Distributor Applications」にエントリーが表示されていることを確認します：

   ![Distributor Applications」にエントリーが表示されていることを確認します。](./relating-object-entries/images/01.png)

1. このコマンドを実行して、アプリケーション評価オブジェクトに3つのエントリーを作成する：

   ```bash
   ./ApplicationEvaluation_POST_Batch.sh
   ```

1. Application Evaluationsにエントリーが表示されることを確認する：

   ![Application Evaluationsにエントリーが表示されることを確認する。](./relating-object-entries/images/02.png)

では、これらのエントリーを関連付けてみよう。

## 関連項目

1. アプリケーション評価エントリの編集を開始します。

1. Application to Evaluationsフィールドの値を選択します。 関係フィールドで使用可能なオプションには、表示する権限を持っているすべてのアプリケーションが含まれます。

   ![デフォルトでは、アプリケーションエントリーはIDで識別される。](./relating-object-entries/images/03.png)

   デフォルトでは、アプリケーションエントリーはIDで識別される。

1. Objects を開き、Distributor Application 定義の編集を開始します。

1. タイトル・フィールドを **ビジネス名** に設定し、 **保存** をクリックする。 これは、リレーションシップ・フィールドでオブジェクト・エントリを識別するために使用されるフィールドを決定します。

   ![タイトルフィールドを「ビジネス名」に設定し、「保存」をクリックします。](./relating-object-entries/images/04.png)

1. アプリケーション評価に戻り、エントリーの編集を開始する。

1. Application to Evaluationsフィールドの値を選択します。 アプリケーションがビジネス名フィールドを使用して識別されるようになったことに注意してください。

   ![アプリケーションは、ビジネス名フィールドを使用して識別されるようになりました。](./relating-object-entries/images/05.png)

1. Distributor Applicationsを開き、エントリーの編集を開始します。

1. **評価ノート** タブにアクセスする。

1. **Add**(![Add Button](../../images/icon-add.png)) をクリックし、既存のアプリケーション評価から選択します。

   ![既存のアプリケーション評価から選択する。](./relating-object-entries/images/06.png)

   リレーションシップテーブルは、IDとタイトルフィールドを使用して、関連する各評価を識別します。

   ![リレーションシップテーブルは、IDとタイトルフィールドを使用して、関連する各評価を識別します。](./relating-object-entries/images/07.png)

1. アプリケーション評価定義のタイトルフィールドを **Author** に更新する。

1. ディストリビューター・アプリケーションに戻り、リレーションシップテーブルがIDフィールドと著者フィールドを使用して、関連する評価を識別していることに注目してください。

   ![リレーションシップテーブルは、関連する評価を識別するために、IDフィールドと著者フィールドを使用するようになりました。](./relating-object-entries/images/08.png)

## まとめ

　 あなたは、Delectable Bonsaiのディストリビューターのオンボーディングフローに必要なデータ構造のモデリングに成功しました。 これで、ワークフロー、バリデーション、通知など、アプリケーションに命を吹き込むために必要なビジネス・ロジックを組み込み始めることができる。 これは次のモジュールで行う。

モジュール 2: [ビジネスロジックの実装](../implementing-business-logic.md)

## 関連コンセプト

* [リレーションシップREST API](https://learn.liferay.com/en/w/dxp/building-applications/objects/understanding-object-integrations/using-custom-object-apis#relationship-rest-apis)
* [関連REST APIの利用](https://learn.liferay.com/en/w/dxp/building-applications/objects/objects-tutorials/using-apis/using-relationship-rest-apis)
