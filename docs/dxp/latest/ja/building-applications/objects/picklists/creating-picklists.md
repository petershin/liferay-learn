# ピックリストの作成

{bdg-secondary}`Liferay 7.4 U72+/GA72+`

候補リストは、String値として保存された名前とキーのペアの一覧です。 定義した後は、オブジェクト定義を持つ一覧を使用して、単一または複数の選択フィールドに入力することができます。 候補リストの使用例については、 [候補リスト](../picklists.md) を参照してください。

ピックリストを作成するには

1. **グローバルメニュー**（![Global Menu](../../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動し、 ［**Picklists**］ をクリックします。

1. **追加**（![Add Button](../../../images/icon-add.png)） をクリックします。

   ![追加をクリックして、新しい候補リストを作成します。](./creating-picklists/images/01.png)

1. UIで一覧を識別するために、候補リストに名前を付けます。 作成後に名前をローカライズすることができます。

1. ［**Save**］ をクリックすると、空の候補リスト定義が作成され、外部参照コード（ERC）が生成されます。 作成後にERCを編集できます。

1. 新規候補リストをクリックして、編集を開始します。

1. ［Items］の下にある、 **追加**（![Add](../../../images/icon-add.png)）をクリックします。

   ![追加をクリックして、新しいアイテムを候補リストに追加します。](./creating-picklists/images/02.png)

1. モーダルウィンドウで、アイテムの［Name］と［Key］を入力します。

   **Name** ：アイテムの表示名を決定するもので、作成後にローカライズできます。

   **Key** ：バックエンドのアプリケーションが理解できる標準値を決定するもので、キャメルケースを使用します。

   ![名前とキーを入力し、［保存］をクリックします。](./creating-picklists/images/03.png)

1. ［**Save**］ をクリックします。 候補リストは新規項目で直ちに更新され、そのアイテムの外部参照コード（ERC）を生成します。

   一覧の項目をクリックすると、その名前をローカライズしたり、ERCを編集することができますが、キーを変更することはできません。 項目はいつでも削除できます。

1. 上記の手順を繰り返して、一覧にアイテムを追加します。

   ![候補リストに複数のアイテムを追加します。](./creating-picklists/images/04.png)

作成後は、オブジェクトフィールドを作成する際に、候補リストを選択できます。 **Picklist**(single select) または **Multiselect Picklist** フィールドタイプを選択し、リストを選択します。 詳しくは [オブジェクトへのフィールドの追加](../creating-and-managing-objects/fields/adding-fields-to-objects.md) および [ピックリストフィールド](../creating-and-managing-objects/fields/picklist-fields.md) を参照。

![ユーザーは、新しいオブジェクトフィールドを作成するときに候補リストを選択できます。](./creating-picklists/images/05.png)

## 関連トピック

* [オブジェクトへのフィールドの追加](../creating-and-managing-objects/fields/adding-fields-to-objects.md)
* [候補リスト権限の管理](./managing-picklist-permissions.md)
* [候補リストAPIの基本](./picklists-api-basics.md)
