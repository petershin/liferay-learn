# エレメントの管理

新しいエレメントを作成するには、「追加」(![Add](../../../../images/icon-add.png))ボタンをクリックします。 詳しくは、 [要素の作成](./creating-elements.md) をご覧ください。

既存のカスタム要素を削除するには、チェックボックスセレクターで要素を選択し、「削除」(![Delete](../../../../images/icon-trash.png))ボタンをクリックします。

![カスタムエレメントは、表示、コピー、エクスポート、削除が可能です。](./managing-elements/images/01.png)

```{note}
システム（つまり、すぐに使える）要素は、編集や削除ができません。 システム要素をベースにカスタム要素を作成する場合は、その要素をコピーします。
```

既存の「要素」を複製するには、「アクション」(![Actions](../../../../images/icon-actions.png))ボタンをクリックし、「**コピー**」()を選択します。 複製された「要素」は、他のカスタム「要素」と同様に削除や編集が可能です。

Element をエクスポートするには、Element の Actions (![Actions](../../../../images/icon-actions.png)) ボタンをクリックし、 **Export** を選択します。

要素をインポートするには、画面上部の角（グローバルメニューアイコンの隣）にあるアクション(![Actions](../../../../images/icon-actions.png))ボタンをクリックします。 **Import** をクリックし、Element の JSON ファイルを参照します。

![要素のJSONファイルをインポートする。](./managing-elements/images/02.png)

```{warning}
[要素スキーマ](./creating-elements.md#understanding-the-element-schema) は変更することができます。 Liferayのバージョン間でスキーマが変更された場合、古いエレメントのJSONのインポートに失敗することがあります。
```

## 追加情報

- [エレメントの作成](./creating-elements.md)
- [定義済み要素変数リファレンス](./predefined-element-variables-reference.md)
- [検索ブループリントの作成と管理](../creating-and-managing-search-blueprints.md)
