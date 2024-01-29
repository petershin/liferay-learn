# オブジェクト・モデル・ビルダーを使う

{bdg-secondary}`liferay 7.4 2023.Q4+/GA102+`.

Liferay Objectsは、複雑なオブジェクト構造を設計するためのModel Builder GUIを提供します。 このグラフィカルなツールは、各オブジェクト定義をカードとして表示し、オブジェクト定義間の関係を視覚化します。 これを使用すると、Objects アプリケーションでデータモデルを作成、管理、拡張し、定義、フィールド、リレーションシップを迅速に構成できます。

![Use the Model Builder GUI to design complex data structures.](./using-the-objects-model-builder/images/01.png)

!!! note
Liferay 7.4 2023.Q4+/GA102+ では、Objects UI にアクセスするには **Object Folder > View** 権限も必要です。 詳細は [オブジェクトアプリケーションの権限](../objects-application-permissions.md) を参照。

モデル・ビルダー・ビューにアクセスするには

1. **グローバルメニュー**(![グローバルメニュー](../../../images/icon-applications-menu.png))を開き、 ［**コントロールパネル**］**タブで**［**オブジェクト**］ をクリックします。

1. 目的の [オブジェクトフォルダ](./organizing-objects-with-folders.md) に移動し、 **View in Model Builder** をクリックします。

   ![Go to the desired object folder and click View in Model Builder.](./using-the-objects-model-builder/images/02.png)

ここからオブジェクト定義の作成、編集、管理ができます。

!!! tip
モデルビルダービューは、複数のオブジェクト定義とその属性を素早く設定するのに適しています。 特に、オブジェクトの関係を視覚化し、管理するのに役立つ。

## オブジェクトの作成

1. 目的のオブジェクトフォルダに移動する。

1. **Create New Object** をクリックする。

   ![Click Create New Object.](using-the-objects-model-builder/images/03.png)

1. オブジェクトドラフトのこれらの詳細を提供します。

   **ラベル** :Objects admin およびサポートされているアプリケーションコンテキスト（ワークフロー、表示ページテンプレート、フォームなど）でオブジェクトを識別します。

   **Plural Label** ：UIにおけるオブジェクト・アプリケーションの表示名を決定します。

   **オブジェクト名** ：オブジェクトの `definition.name` を決定し、公開後に変更することはできません。

1. ［**保存**］をクリックします。

保存されると、ドラフト定義が中央のダイアグラム・エリアに表示されます。 これをクリックすると、右サイドパネルの設定オプションにアクセスできます。

![Click an object card to access configuration options.](./using-the-objects-model-builder/images/04.png)

ここでは、その詳細を編集したり、統合を有効にしたり、追加機能（カテゴリ分けや下書きモードなど）を設定することができます。 <!--TASK: See [Configuring Object Definitions]() for more information on available options.-->

オブジェクト定義にフィールドやリレーションシップを追加することもできます。 ただし、 [バリデーション](./validations.md) 、 [アクション](./actions.md) 、 [ビュー](./views.md) 、 [レイアウト](./layouts.md) 、 [ステート](./fields/adding-and-managing-custom-states.md) を追加するには、デフォルトのオブジェクトビューを使用する必要があります。

### データフィールドの追加

1. オブジェクト定義の **Add Field or Relationship** をクリックします。

1. **Add Field** を選択する。

   ![Select Add Field.](./using-the-objects-model-builder/images/05.png)

1. **ラベル** とフィールド名_を入力します。

   **ラベル** ：Objects UIでフィールドを識別し、フィールド作成後にローカライズできます。

   **フィールド名** ：バックエンドでのフィールド名を決定し、キャメルケースを使用します。 フィールドが公開されると、この値は変更できません。

1. フィールド **タイプ** を選択します。 利用可能なフィールド・タイプと構成オプションの詳細については、 [Field Types Reference](./fields/adding-fields-to-objects.md#field-types-ui-reference) 。

1. ［**保存**］をクリックします。

フィールドはすぐに定義に追加される。 デフォルトでは、オブジェクトカードには5つのフィールドが表示されますが、 **Show All Fields** をクリックすると他のフィールドを表示することができます。 さらに、オブジェクトカードのフィールドを選択すると、右側のパネルでその設定オプションにアクセスできます。

![Select a field to access its configuration options in the right side panel.](./using-the-objects-model-builder/images/06.png)

### 人間関係の定義

1. オブジェクト定義の **Add Field or Relationship** をクリックします。

1. **リレーションシップの追加** を選択します。

   ![Select Add Relationship.](./using-the-objects-model-builder/images/07.png)

1. **Label** と **Name** を入力してください。

   **ラベル** ：Objects UI でリレーションシップを識別し、リレーションシップ作成後にローカライズできます。

   **Name** ：バックエンドでのリレーションシップ名を決定し、キャメルケースを使用します。 関連が公開されると、この値は変更できません。

1. リレーションシップの **タイプ** と、リレーションシップの相手側のオブジェクト定義を選択します。 詳細については、 [オブジェクトリレーションシップの定義](./relationships/defining-object-relationships.md) を参照してください。

1. ［**保存**］をクリックします。

保存されると、ダイアグラム・エリアはオブジェクト定義間の論理的なつながりを視覚化し、1 対多と多対多のリレーションシップを区別します。 さらに、リレーションシップを選択すると、右側のサイドパネルにある設定オプションにアクセスできる。

![Select a relationship to access its configuration options in the right side panel.](./using-the-objects-model-builder/images/08.png)

他のフォルダーにあるオブジェクト定義とのリレーションシップを定義すると、ダイアグラム・エリアにはそのカードが破線の枠で表示されます。 これはリレーションシップを視覚化するためだけのものであり、ユーザーにオブジェクト定義を編集する能力を与えるものではない。 定義を編集するには、オブジェクトのソースフォルダに移動する必要があります。

![The diagram area displays related object definitions in other folders.](./using-the-objects-model-builder/images/09.png)

## オブジェクトの管理

モデル・ビルダー・ダイアグラム・エリアでは、オブジェクト・カードをドラッグ・アンド・ドロップして、視覚的に再編成することができます。 Liferayは位置の更新を自動的に保存します。 さらに、フォルダ間でオブジェクト定義を移動することもできます。

1. 目的の保存先フォルダに移動する。

1. 左サイドバーの別のフォルダからオブジェクトの **アクション**(![アクションボタン](../../../images/icon-actions.png))をクリックします。

1. **現在のフォルダに移動** を選択します。

   ![Select Move to Current Folder](./using-the-objects-model-builder/images/10.png)

これにより、定義は現在のフォルダに移動する。 オブジェクト定義を移動しても、そのリレーションシップには影響しない。

![Move object definitions between folders.](./using-the-objects-model-builder/images/11.png)

オブジェクトカードのアクション（ [アクションボタン](../../../images/icon-actions.png) ）をクリックすると、追加の管理オプションにアクセスできます。 利用可能なオプションは以下の通り。

* ページビューで編集する：デフォルトのオブジェクトUIに切り替えます。
* Edit ERC：オブジェクトの外部参照コード（ERC）を更新する。
* 権限を管理する：どのロールが [オブジェクト上で活動できるかを決定する](../objects-application-permissions.md#actions-on-database-entities) 。
* オブジェクトの削除： [Delete](./deleting-objects.md) オブジェクト定義。

![Click the object card's Actions button to access additional management options.](./using-the-objects-model-builder/images/12.png)

### オブジェクトドラフトの公開

モデルビルダーを使用すると、個々のオブジェクト定義だけでなく、複数のオブジェクトを含む複雑なデータモデルも公開できます。

1. オブジェクトの下書きがあるフォルダに行く。

1. ［**公開**］ をクリックします。

1. 公開する原稿を選択する。

   ![Select which drafts to publish and click Publish Objects.](./using-the-objects-model-builder/images/13.png)

1. **オブジェクトの公開** をクリックします。

選ばれた原稿は同時に公開され始める。

## 関連トピック

* [オブジェクトの作成](./creating-objects.md)
* [オブジェクトへのフィールドの追加](./fields/adding-fields-to-objects.md) 
* [オブジェクトの関係の定義](./relationships/defining-object-relationships.md) 
