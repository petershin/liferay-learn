# エレメントの管理

新しいElementsを作成するには、 **Add**(![Add](../../../../images/icon-add.png)) をクリックします。 詳しくは [要素の作成](./creating-elements.md) をご覧ください。

既存のカスタムエレメントを削除するには、チェックボックスセレクタでエレメントを選択し、「削除」(![Delete](../../../../images/icon-trash.png))）ボタンをクリックします。

![カスタムエレメントは、ビュワー、コピー、エクスポート、削除が可能です。](./managing-elements/images/01.png)

```{note}
システム要素(＝アウトオブボックス）は、編集や削除ができません。 カスタムエレメントをベースとする場合は、システムエレメントをコピーします。
```

既存のElementを複製するには、 **Actions**(![Actions](../../../../images/icon-actions.png)) をクリックし、 **Copy** を選択します。 複製された「要素」は、他のカスタム「要素」と同様に削除・編集することができます。

要素をエクスポートするには、要素の **アクション**(![Actions](../../../../images/icon-actions.png)) をクリックし、 **エクスポート** を選択します。

要素をインポートするには、画面上部(グローバルメニューアイコンの横）の **アクション**(![Actions](../../../../images/icon-actions.png)) をクリックします。 **Import** をクリックし、Element の JSON ファイルを参照する。

![要素のJSONファイルをインポートする。](./managing-elements/images/02.png)

```{warning}
[要素スキーマ](./creating-elements.md#understanding-the-element-schema) は変更することができます。 Liferayのバージョン間でスキーマが変更された場合、古いエレメントのJSONをインポートすると失敗することがあります。
```

## 追加情報

- [エレメントを作る](./creating-elements.md)
- [定義済み要素変数リファレンス](./predefined-element-variables-reference.md)
- [検索ブループリントの作成と管理](../creating-and-managing-search-blueprints.md)