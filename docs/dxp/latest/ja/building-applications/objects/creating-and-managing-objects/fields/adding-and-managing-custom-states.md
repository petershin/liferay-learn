# カスタム状態の追加と管理

{bdg-secondary}`Liferay 7.4+`

ユースケースによっては、オブジェクトエントリに複数のステータスを同時に割り当てる必要があるかもしれません。例えば、Orderアプリケーションを構築する場合、同じエントリに対して注文、支払い、配送のステータスを割り当て、管理する必要があるかもしれません。Liferayのピックリストとカスタムオブジェクトを使うことで、この機能を実現できます。

[picklists](../../picklists.md)を使えば、文字列のリストを定義し、それをオブジェクトフィールドとして使ってエントリーのカスタムステータスを定義することができます。オブジェクト定義に追加したら、各状態のフローを設計し、[validation](../validations/adding-field-validations.md)と[actions](../actions/defining-object-actions.md)を使用して、異なる状態のビジネスロジックを追加できます。状態は、[ワークフロー ステータス](../../enabling-workflows-for-objects.md) と共に使用して、より複雑なレビューと承認プロセスを定義することもできます。

![候補リストを使用して、オブジェクト定義にカスタム状態を追加します。](./adding-and-managing-custom-states/images/01.png)

## オブジェクト定義に状態フィールドを追加する

1. **グローバルメニュー**（![Global Menu](../../../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動し、 ［**Picklists**］ をクリックします。

1. 必要な項目で候補リストを作成します。 これらの項目は、オブジェクトのエントリー状態を定義します。 より詳細な手順については、 [ピックリストの作成](../../picklists/creating-picklists.md) を参照してください。

   ```{note}
   下書きと公開されたオブジェクト定義の両方について、いつでも候補リストの項目を追加、削除、編集することができます。
   ```

   ![必要な項目で候補リストを作成します。](./adding-and-managing-custom-states/images/02.png)

1. ［**グローバルメニュー**］（![Global Menu](../../../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動して、 ［**オブジェクト**］ をクリックします。

1. 目的のカスタムオブジェクトの編集を開始します。

1. ［**フィールド**］ タブを開き、 **追加**( ![Add Button](../../../../images/icon-add.png) ) をクリックします。

   ![オブジェクト定義へのフィールドの追加を開始します。](./adding-and-managing-custom-states/images/03.png)

1. ［**Label**］ と ［**Field Name**］ に入力します。

1. **候補リストタイプ** を選択し、必要なリストを選択します。

1. ［**Mark as State**］ を切り替えます。

   ```{note}
   状態フィールドは自動的に*mandatory*に設定され、オプションに変更することはできません。
   ```

1. 状態フィールドの ［**Default Value**］ を選択します。

   ![候補リストを選択し、［Mark as State］に切り替えて、フィールドのデフォルト値を設定します。](./adding-and-managing-custom-states/images/04.png)

1. ［**Save**］ をクリックします。

定義にフィールドを追加した後、 [フロー](#setting-up-a-flow-for-state-fields) を設定し、各状態でどの移行が利用できるかを決定することができます。

## 状態フィールドのフローを設定する

デフォルトでは、各状態は他のすべての状態に移行することができます。 ただし、エントリーが目的のプロセスを通るように移行を制限することは可能です。

以下の手順で、状態フィールドのカスタムフローを設定します。

1. カスタムオブジェクトの編集中に、 ［**State Manager**］ タブを開き、必要な **状態フィールド** を選択します。

   ![［State Manager］タブで、状態フィールドのフローを設定します。](./adding-and-managing-custom-states/images/05.png)

1. ［Next Status］でドロップダウンメニューをクリックし、各状態で利用可能な移行を決定するためのボックスにチェックを入れます。

   状態の移行はいくつでも選択できます。

   ![状態間の利用可能な移行を決定します。](./adding-and-managing-custom-states/images/06.png)

1. ［**Save**］ をクリックします。

一度保存すると、ユーザーは定義したフローに従ってのみ、エントリーの状態を移行させることができます。

![カスタムフローを設定すると、各状態で利用可能な移行が決定されます。](./adding-and-managing-custom-states/images/07.png)

## 関連トピック

* [候補リスト](../../picklists.md)
* [項目](../fields.md)
* [オブジェクトへのフィールドの追加](../fields/adding-fields-to-objects.md)
