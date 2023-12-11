# オブジェクト定義とエントリのローカライズ

{bdg-secondary}`Liferay 7.4 2023.Q3+/GA98+`.

Liferayオブジェクトはローカリゼーションフレームワークと統合されているので、定義ラベルに翻訳を追加したり、ユーザーがテキストフィールドにローカライズされた値を入力することができます。 この統合により、オブジェクトをローカライズして、世界中のユーザーにより良いサービスを提供することができます。

## オブジェクト定義ラベルのローカライズ

オブジェクト定義を構成する際、定義のラベルや、フィールド、リレーションシップ、アクション、ビュー列のラベルをローカライズすることができます。 これにより、これらの要素がオブジェクトのレイアウトやビューでどのように表示されるかが決まります。

![Localize the Object definition's labels, as well as labels for its fields, relationships, actions, and view columns.](./localizing-object-definitions-and-entries/images/01.png)

さらに、 [バリデーション](./validations/adding-custom-validations.md) エラーメッセージをローカライズすることもできます。

![Localize validation error messages.](./localizing-object-definitions-and-entries/images/02.png)

## テキストフィールドのローカライズを有効にする

定義ラベルのローカライズに加え、カスタムテキスト [フィールド](fields.md) の翻訳サポートを有効にすることで、エンドユーザーが入力をローカライズできるようになります：

1. Objectsアプリケーションを開き、目的の定義の編集を始める。

1. Detailsタブで、_Enable Entry Translation_を切り替える。

   ![Enable entry translation.](./localizing-object-definitions-and-entries/images/03.png)

1. ［_Save_］をクリックします。

テキストフィールド、ロングテキストフィールド、リッチテキストフィールドを追加または設定する際に、そのフィールドがローカライズ可能かどうかを判断できるようになりました。

![Determine whether text fields are localizable.](./localizing-object-definitions-and-entries/images/04.png)

```{important}
ローカライズされたフィールドは必須ではありません。 また、ローカライズを使用している場合、フィールドの検証、条件、フィルター、ソートはデフォルトの言語しかサポートしません。
```

有効にすると、エントリーを作成する際に言語選択ボタンを使ってフィールドの値をローカライズすることができます。

![Use the language selector button to localize text field values.](./localizing-object-definitions-and-entries/images/05.png)

## 関連トピック

* [Creating Objects](./creating-objects.md) 
* [Understanding Object Integrations](../understanding-object-integrations.md) 
