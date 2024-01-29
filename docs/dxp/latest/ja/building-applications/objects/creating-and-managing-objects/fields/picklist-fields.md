# ピックリストフィールド

{bdg-secondary}`Liferay 7.4 U72+/GA72+`

ピックリストは、オブジェクト定義の単一選択フィールドまたは複数選択フィールドとして使用可能なテキスト値のリストを定義します。 デフォルトでは、単一選択フィールドはドロップダウンメニューとして表示され、複数選択フィールドはチェックボックスとして表示されます。

静的または動的なデフォルト値を使用するように、単一のセレクト・フィールドを設定することができます。 さらに、単一の選択フィールドを使用して、オブジェクトエントリのカスタム状態を定義し、 [バリデーション](../validations/adding-field-validations.md) 、 [アクション](../actions/defining-object-actions.md) 、 [ワークフロープロセス](../../enabling-workflows-for-objects.md) をオブジェクト定義と統合して、複雑なビジネスロジックを実装することができます。

## デフォルト値の設定

1. 目的のピックリストフィールドの編集を開始します。

1. Advanced "タブで "Use Default Value "を切り替えてください。

   ![Toggle Use Default Value and select either Input as Value or Expression Builder.](./picklist-fields/images/01.png)

1. デフォルト値の設定方法を決定する。

   **Input as Value** ：ピックリストから値を選択します。

   **式ビルダー**: 動的に値を設定する式を作成します。

1. ［**保存**］をクリックします。

これで、ユーザーがエントリーを作成すると、ピックリストフィールドのデフォルトは設定された値になります。

```{important}
オブジェクトフィールドで使用されているリストは削除できませんが、リスト項目はいつでも編集、削除できます。

選択リストのアイテムを更新または削除すると、アイテム値を使用してすべてのオブジェクトエントリーが自動的に更新されます。
```

## APIでピックリストフィールドを使う

候補リストフィールドを含むオブジェクトに対してPOST、PATCH、および PUT API呼び出しを行う場合、候補リストおよび複数選択の候補リストフィールドに対して、それぞれ以下のリクエストペイロード形式を使用する必要があります。

### 候補リスト項目タイプ

```json
{ 
      "picklistExample": {
        "key": "firstOption",
        "name": "First Option"
      }
}
```

### 複数選択の候補リスト項目タイプ

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

## 関連トピック

* [ピックリスト](../../picklists.md)
* [カスタム・ステートの追加と管理](./adding-and-managing-custom-states.md)
