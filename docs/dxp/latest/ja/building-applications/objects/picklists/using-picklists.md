# 選択リストの使用

{bdg-secondary}`Liferay 7.4以降で利用可能`

選択リストは、Liferay Portal全体で理解される値の標準リストを作成するためのアプリケーションです。 選択リストを作成するプロセスには、初期リストの作成とリストへのアイテムの追加が含まれます。 これらの値を定義すると、サポートされているアプリケーションで使用できるようになります。

## 選択リストの作成

以下の手順に従って、選択リストを作成します。

1. **グローバルメニュー**（![Global Menu](../../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動し、 ［**Picklists**］ をクリックします。

1. **追加** ボタン（![Add Button](../../../images/icon-add.png)）をクリックします。

   ![追加ボタンをクリックして、新しい選択リストを作成します。](./using-picklists/images/01.png)

1. ピックリストの **名前** を入力し、 **保存** をクリックします。 この値は、Liferay UIでリストを識別し、作成後にローカライズできます。

1. 新しいピックリストをクリックして、編集します。

1. ［Items］の下にある、 ［**追加**］ ボタン（![Add Button](../../../images/icon-add.png)）をクリックします。

   ![追加] ボタンをクリックすると、ピックリストに新しい項目が追加されます。](./using-picklists/images/02.png)

1. モーダルウィンドウで、アイテムの ［**Name**］ と ［**Key**］ を入力します。

   **Name** ：アイテムの表示名を決定するもので、作成後にローカライズできます。

   **Key** ：バックエンドのアプリケーションが理解できる標準値を決定するもので、キャメルケースを使用します。

   ```{note}
   作成したアイテムのキーは変更できませんが、名前の編集や削除はいつでもできます。
   ```

   ![名前とキーを入力し、 [保存]をクリックします。](./using-picklists/images/03.png)

1. ［**Save**］ をクリックします。 これにより、新しいアイテムで選択リストがすぐに更新されます。

1. 上記の手順を繰り返して、リストにアイテムを追加します。

   ![選択リストに複数のアイテムを追加します。](./using-picklists/images/04.png)

## オブジェクトへの選択リストフィールドの追加

{bdg-secondary}`7.4 U56+/GA56+ 用`

リストを作成した後、オブジェクトフィールドを作成する際に選択することができます。 **Picklist** または **Multiselect Picklist** フィールドタイプを選択し、リストを選択します。 詳細については、[オブジェクトへのフィールドの追加](../creating-and-managing-objects/fields/adding-fields-to-objects.md)を参照してください。

![ユーザーは、新しいオブジェクトフィールドを作成するときに選択リストを選択できます。](./using-picklists/images/05.png)

ユーザーがオブジェクトのレイアウトでこのフィールドにアクセスすると、選択リストのアイテムを一覧表示するドロップダウンメニューとして表示されます。

![選択リストは、オブジェクトのレイアウトにドロップダウンメニューとして表示されます。](./using-picklists/images/06.png)

```{important}
リストはオブジェクトフィールドで使用されている場合は削除できませんが、リストのアイテムはいつでも編集および削除できます。

選択リストのアイテムを更新または削除すると、アイテム値を使用してすべてのオブジェクトエントリーが自動的に更新されます。
```

## 選択リストAPI

Liferayは選択リストを作成・管理するためのヘッドレスAPIを提供します。 `headless-admin-list-type`の`localhost:8080/o/api`にあるLiferayのAPIエクスプローラーで利用可能な選択リストAPIを確認できます。

![headless-admin-list-typeで選択リストAPIにアクセスします。](./using-picklists/images/07.png)

Picklist API を使用すると、Picklist Definition (`ListTypeDefinition`) と Picklist Entry (`ListTypeEntry`) の両方に対して CRUD 操作を実行することができます。 詳しくは、 [Picklist API Basics](./picklists-api-basics.md) をご覧ください。

## オブジェクトAPI呼び出しの選択リストフィールド

{bdg-secondary}`7.4 U56+/GA56+ 用`

ピックリストフィールドを含む Object に対して POST、PATCH、および PUT API 呼び出しを行う場合、ピックリストおよび多選択ピックリストに対して、それぞれ以下のリクエストペイロード形式を使用する必要があります。

### ピックリストフィールドタイプ

```json
{ 
      "picklistExample": {
        "key": "firstOption",
        "name": "First Option"
      }
}
```

### マルチセレクトピッキングリストフィールドタイプ

```json
{ 
      "picklistExample": [
        {
          "key": "firstOption",
          "name": "First Option"
        },
        {
          "key": "secondOption",
          "name": "Second Option"
        }
      ]
}
```

## 追加情報

* [オブジェクトへのフィールドの追加](../creating-and-managing-objects/fields/adding-fields-to-objects.md)
* [選択リスト権限の管理](./managing-picklist-permissions.md)
* [ピックリストAPIの基本](./picklists-api-basics.md)
