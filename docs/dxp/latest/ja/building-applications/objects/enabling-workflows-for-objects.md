# オブジェクトのワークフローを有効にする

> 対応可能：Liferay DXP/Portal 7.4以降

すべての公開オブジェクトは、ワークフローフレームワークと自動的に統合されているため、定義されたレビューと承認プロセスを通じてオブジェクトエントリの作成を指示することができます。 オブジェクトのワークフローを有効にする方法は、オブジェクトのスコープに依存します。 [Company](#company-scoped-objects) または [Site](#site-scoped-objects) .

一般的なワークフローの機能については、 [ワークフロー](../../process-automation/workflow.md) のドキュメントを参照してください。

## 会社に範囲指定されているオブジェクト

以下の手順で、カンパニー・スコープ・オブジェクトのカスタムワークフローを有効にします。

1. **グローバルメニュー**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **アプリケーション** タブを開き、 **プロセスビルダー** をクリックします。

1. ［**設定**］ タブをクリックします。

   ![Go to Process Builder and click the Configuration tab.](./enabling-workflows-for-objects/images/01.png)

1. 目的のオブジェクトの **Edit** をクリックします。

1. 目的の **ワークフロー** を選択します。

1. ［**Save**］ をクリックします。

## サイトに範囲指定されたオブジェクト

サイトスコープのオブジェクトに対してカスタムワークフローを有効にするには、以下の手順に従います。

1. ［**サイトメニュー**］(![Site Menu](../../images/icon-menu.png)) &rarr; ［**設定**］ &rarr; ［**ワークフロー**］ の順に開きます。

   ![目的のサイトでワークフローアプリケーションを開きます。](./enabling-workflows-for-objects/images/02.png)

1. 目的のオブジェクトの **Edit** をクリックします。

1. 目的の **ワークフロー** を選択します。

1. ［**保存**］ をクリックします。

## 関連トピック

* [オブジェクト](../objects.md)
* [オブジェクトの作成](./creating-and-managing-objects/creating-objects.md)
* [カスタムステーツ](./creating-and-managing-objects/fields/adding-and-managing-custom-states.md)
