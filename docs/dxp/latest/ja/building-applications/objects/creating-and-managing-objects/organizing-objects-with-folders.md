# フォルダによるオブジェクトの整理

デフォルトでは、オブジェクト定義は Uncategorized フォルダーにグループ化されますが、オブジェクトフォルダーを追加してデータモデルを整理し、定義へのアクセスを管理することができます。

## フォルダの作成

1. _グローバルメニュー_ (![グローバルメニュー](../../../images/icon-applications-menu.png))を開き、*［コントロールパネル］_タブで_［オブジェクト］*をクリックします。

1. フォルダの追加* ([フォルダの追加ボタン](../../../images/icon-plus.png))をクリックします。

1. _Label_と_Name_を入力してください。

   **ラベル**：Objects UI でリレーションシップを識別し、リレーションシップ作成後にローカライズできます。

   **Name**：バックエンドでのリレーションシップ名を決定し、キャメルケースを使用します。 関連が公開されると、この値は変更できません。

   ![Enter a folder Label and Name.](./organizing-objects-with-folders/images/01.png)

1. フォルダの作成*をクリックします。

   ![Create the object folder.](./organizing-objects-with-folders/images/02.png)

これにより、自動生成されたERCを持つ空のフォルダが作成される。 必要であれば、フォルダの_Actions_ (![Actions Button](../../../images/icon-actions.png)) をクリックし、_Edit Label and ERC_を選択することでERCを更新することができます。

## フォルダに定義を追加する

フォルダ内で、_追加_ (![Add](../../../images/icon-add.png)) をクリックすると、その中にオブジェクト定義を作成することができます。 既存の定義をフォルダに移動する、

1. 目的の保存先フォルダに移動する。

1. *View in Model Builder*をクリックします。

1. 左サイドバーの別のフォルダからオブジェクトの_アクション_ (![アクションボタン](../../../images/icon-actions.png))をクリックします。

1. *現在のフォルダに移動*を選択します。

   ![Select Move to Current Folder](./organizing-objects-with-folders/images/03.png)

これにより、定義は現在のフォルダに移動する。 オブジェクト定義を移動しても、そのリレーションシップには影響しない。

## フォルダの削除

1. 目的のフォルダに移動する。

1. *Actions*（[Actionsボタン](../../../images/icon-actions.png)）をクリックし、_Delete_を選択します。

   ![Click the Actions button and select Delete.](./organizing-objects-with-folders/images/04.png)

1. フォルダ名を入力して確認し、_削除_をクリックします。

   ![Enter the folder's name to confirm and click Delete](./organizing-objects-with-folders/images/05.png)

削除されると、フォルダ内のすべてのオブジェクトは、デフォルトのUncategorizedフォルダに再配置されます。 この操作は元に戻せません。

## 関連トピック

* [Creating Objects](./creating-objects.md) 
* [オブジェクト・モデル・ビルダーを使う](./using-the-objects-model-builder.md) 
