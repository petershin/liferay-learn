# オブジェクトのワークフローを有効にする

{bdg-secondary}`Liferay 7.4+`

公開されたすべてのオブジェクトは、ワークフローフレームワークと自動的に統合されるため、定義されたレビューと承認のプロセスを通じてオブジェクトエントリーの作成を指示できます。 オブジェクトのワークフローを有効にする方法は、オブジェクトのスコープ（ [会社](#company-scoped-objects) または [サイト](#site-scoped-objects) ）によって異なります。

一般的なワークフローの機能については、 [ワークフロー](../../process-automation/workflow.md) のドキュメントを参照してください。

## 会社に範囲指定されているオブジェクト

以下の手順で、会社に範囲指定されているオブジェクトのカスタムワークフローを有効にします。

1. **グローバルメニュー**（![Global Menu](../../images/icon-applications-menu.png)）を開き、 ［**アプリケーション**］ タブをクリックして、 ［**Process Builder**］ をクリックします。

1. ［**Configuration**］ タブをクリックします。

   ![［Process Builder］に移動し、［設定］タブをクリックします。](./enabling-workflows-for-objects/images/01.png)

1. 目的のオブジェクトの ［**Edit**］ をクリックします。

1. 目的の **ワークフロー** を選択します。

1. ［**保存**］ をクリックします。

## サイトに範囲指定されたオブジェクト

サイトに範囲指定されたオブジェクトに対してカスタムワークフローを有効にするには、以下の手順に従います。

1. ［**サイトメニュー**］(![Site Menu](../../images/icon-menu.png)) &rarr; ［**Configuration**］ &rarr; ［**Workflow**］ の順に開きます。

   ![目的のサイトでワークフローアプリケーションを開きます。](./enabling-workflows-for-objects/images/02.png)

1. 目的のオブジェクトの ［**Edit**］ をクリックします。

1. 目的の **ワークフロー** を選択します。

1. ［**Save**］ をクリックします。

## 関連トピック

* [オブジェクト](../objects.md)
* [オブジェクトの作成](./creating-and-managing-objects/creating-objects.md)
* [カスタム状態の追加と管理](./creating-and-managing-objects/fields/adding-and-managing-custom-states.md)
