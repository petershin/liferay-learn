# カスタムレイアウトにリレーションシップを追加する

リレーションシップ・フィールドはオブジェクトのデフォルト・レイアウトに自動的に表示されますが、リレーションシップ・テーブルは表示されません。 リレーションシップをテストするには、Distributor Applicationのカスタムレイアウトを更新し、リレーションシップテーブルを含めます。

ここでは、リレーションシップ・テーブルを含むようにDistributor Applicationのカスタムレイアウトを更新します。 次に、関係フィールドを含むアプリケーション評価のカスタムレイアウトを作成します。

## リレーションシップ・テーブルをディストリビューター・アプリケーションのレイアウトに追加する

1. ディストリビューター・アプリケーション・オブジェクトを編集している間に、 **Layouts** タブに移動し、レイアウトの編集を開始します。

1. 情報]タブで、レイアウトの名前を **関係テーブル付きレイアウト** に変更します。

   ![Rename the layout to Layout with Relationship Table.](./adding-the-relationship-to-custom-layouts/images/01.png)

1. **レイアウト** タブに移動します。

1. **Add Tab** をクリックし、これらの詳細を入力し、 **Save** をクリックします。

   | 項目  | 値      |
   | :-- | :----- |
   | ラベル | 評価ノート  |
   | 種類  | 関連     |
   | 関連  | 評価への応用 |

   ![Add the relationship tab.](./adding-the-relationship-to-custom-layouts/images/02.png)

1. レイアウトの一番下にリレーションシップ・タブが表示されていることを確認する。

   ![Verify the relationship tab appears in the layout.](./adding-the-relationship-to-custom-layouts/images/03.png)

## アプリケーション評価のレイアウトとビューに関係フィールドを追加する

1. [この演習のリソースをダウンロードし、解凍してください](./liferay-h2x9.zip) ：

   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/application-development/modeling-data-structures/liferay-h2x9.zip -O
   ```

   ```bash
   unzip liferay-h2x9.zip
   ```

1. `liferay-h2x9`フォルダ内の`curl` フォルダに移動します：

   ```bash
   cd liferay-h2x9/curl
   ```

1. このスクリプトを実行して、アプリケーション評価用の新しいデフォルトレイアウトを作成します：

   ```bash
   ./ObjectLayout_POST_LayoutWithRelationship_ByExternalReferenceCode.sh
   ```

1. 新しいレイアウトが表示され、リレーションシップ・フィールドが含まれていることを確認する。

   ![Verify the new layout includes the relationship field.](./adding-the-relationship-to-custom-layouts/images/04.png)

1. **Views** タブに移動する。

1. このスクリプトを実行して、アプリケーション評価の新しいデフォルトビューを作成します：

   ```bash
   ./ObjectView_POST_ViewWithRelationship_ByExternalReferenceCode.sh
   ```

1. 新しいビューが表示され、リレーションシップ・フィールドが含まれていることを確認する。

   ![Verify the new view includes the relationship field.](./adding-the-relationship-to-custom-layouts/images/05.png)

これで、オブジェクトのエントリーを関連付ける練習ができる！

次へ [オブジェクトエントリーの関係](./relating-object-entries.md) 
