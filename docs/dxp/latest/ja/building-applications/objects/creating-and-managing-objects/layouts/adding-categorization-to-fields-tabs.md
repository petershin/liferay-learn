# フィールドタブにカテゴリを追加する

{bdg-secondary}`利用可能な Liferay 7.4 U31+ および GA31+`

[フィールドタブ](./designing-object-layouts.md#fields-tabs) にカテゴライズブロックを追加することで、エンドユーザーがオブジェクトエントリにタグやカテゴリーを適用できるようになります。 次の手順を実行します：

1. **グローバルメニュー**（![Global Menu](../../../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動して、 ［**オブジェクト**］ をクリックします。

1. 目的のオブジェクト定義の編集を開始します。

   ```{note}
   システムオブジェクトは、カスタムレイアウトに対応していません。 詳しくは、[システムオブジェクトの拡張](../extending-system-objects.md)を参照してください。
   ```

1. **Layouts** タブを開き、目的のレイアウトを選択します。

   ![Go to the Layouts tab and select the desired layout.](./adding-categorization-to-fields-tabs/images/01.png)

1. **レイアウト** タブを開き、目的の **アクション** ボタン (![Actions Button](../../../../images/icon-actions.png)) をクリックし、 [フィールドタブ](./designing-object-layouts.md#fields-tabs) 、 **カテゴリの追加** を選択します。

   ![Click the Actions button and select Add Categorization.](./adding-categorization-to-fields-tabs/images/02.png)

   これにより、カテゴリ分けツールにアクセスするためのタブに新しいブロックが追加されます。

   ```{important}
   カテゴリ分けブロックは、1レイアウトにつき1つのタブにしか追加できません。
   ```

1. ブロックが **折り畳み式かどうかを判断する** .

   ![ブロックが折りたたみ可能かどうかを判断する。](./adding-categorization-to-fields-tabs/images/03.png)

1. ［**Save**］ をクリックします。

オブジェクトのエントリーを作成または編集する際に、ユーザーはタグやカテゴリーにアクセスし、適用することができるようになりました。

![オブジェクトのエントリにアクセスし、タグやカテゴリを適用します。](./adding-categorization-to-fields-tabs/images/04.png)

```{note}
可視性と権限は、カテゴリ分けブロックの表示方法に影響を与えます。
```

## 追加情報

* [オブジェクトの作成](../creating-objects.md)
* [オブジェクトレイアウトの設計](./designing-object-layouts.md)
* [オブジェクトビューの設計](../views/designing-object-views.md)
