# カスタム状態の追加と管理

{bdg-secondary}`liferay 7.4+`

ユースケースによっては、1つのオブジェクトエントリーに複数の状態を同時に割り当てる必要がある場合があります。 例えば、注文アプリケーションを構築する場合、同じエントリーに対して、注文、支払い、配送の各状態を割り当て、管理する必要があり、それぞれに独自のフローと関連するビジネスロジックがあります。 Liferayの候補リストとカスタムオブジェクトを使うことで、この機能を実現できます。

[候補リスト](../../picklists.md) では、文字列のリストを定義し、それをオブジェクトフィールドとして使用して、エントリーのカスタム状態を定義できます。 オブジェクト定義に追加したら、各状態のフローを設計し、 [バリデーション](../validations/adding-field-validations.md) と [アクション](../actions/defining-object-actions.md) を使って、異なる状態のビジネスロジックを追加することができます。 ステートは、 [ワークフローステータス](../../enabling-workflows-for-objects.md) と共に使用し、より複雑なレビューおよび承認プロセスを定義することもできます。

![Use picklists to add custom states to object definitions.](./adding-and-managing-custom-states/images/01.png)

## オブジェクト定義に状態フィールドを追加する

1. *グローバルメニュー* (![グローバルメニュー](../../../../images/icon-applications-menu.png))を開き、_コントロールパネル_タブに移動し、_ピックリスト_をクリックします。

1. 必要な項目で候補リストを作成します。 これらの項目は、オブジェクトのエントリー状態を定義します。 より詳細な手順については、 [ピックリストの作成](../../picklists/creating-picklists.md) を参照してください。

   ```{note}
   ドラフトとパブリッシュされたオブジェクト定義の両方で、いつでもピックリスト項目を追加、削除、編集できます。
   ```
   ![Create a picklist with the desired items.](./adding-and-managing-custom-states/images/02.png)

1. _グローバルメニュー_ (![グローバルメニュー](../../../../images/icon-applications-menu.png))を開き、*［コントロールパネル］_タブで_［オブジェクト］*をクリックします。

1. 目的のカスタムオブジェクトの編集を開始します。

1. *Fields*タブに移動し、_Add_ (![Add Button](../../../../images/icon-add.png)) をクリックします。

   ![Begin adding a field to the object definition.](./adding-and-managing-custom-states/images/03.png)

1. ラベル_とフィールド名_を入力します。

1. *ピックリストのタイプ*を選択し、必要なリストを選択します。

1. *州としてマーク*を切り替える。

   ```{note}
   状態フィールドは自動的に*必須*に設定され、オプションに変更することはできません。
   ```

1. 状態フィールドの_デフォルト値_を選択します。

   ![Select a picklist, toggle Mark as State, and set a default value for the field.](./adding-and-managing-custom-states/images/04.png)

1. ［_保存_］をクリックします。

定義にフィールドを追加した後、 [、各状態で利用可能な遷移を決定するために、](#setting-up-a-flow-for-state-fields) 、フローを設定することができます。

## 状態フィールドのフローを設定する

デフォルトでは、各状態は他のすべての状態に移行することができます。 ただし、エントリーが目的のプロセスを通るように移行を制限することは可能です。

以下の手順で、状態フィールドのカスタムフローを設定します。

1. カスタム・オブジェクトの編集中に、_State Manager_ タブを開き、必要な _state フィールド_ を選択します。

   ![Go to the State Manager tab to set up a flow for state fields.](./adding-and-managing-custom-states/images/05.png)

1. ［Next Status］でドロップダウンメニューをクリックし、各状態で利用可能な移行を決定するためのボックスにチェックを入れます。

   状態の移行はいくつでも選択できます。

   ![Determine the available transitions between states.](./adding-and-managing-custom-states/images/06.png)

1. ［_保存_］をクリックします。

一度保存すると、ユーザーは定義したフローに従ってのみ、エントリーの状態を移行させることができます。

![Set up a custom flow determines available transitions for each state.](./adding-and-managing-custom-states/images/07.png)

## 関連トピック

* [ピックリスト](../../picklists.md)
* [フィールド](../fields.md)
* [オブジェクトへのフィールドの追加](../fields/adding-fields-to-objects.md)
