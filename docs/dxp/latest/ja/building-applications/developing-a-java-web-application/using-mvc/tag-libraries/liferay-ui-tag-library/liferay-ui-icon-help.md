# Liferay UIアイコンヘルプ

アイコンヘルプタグを使用すると、目立たない方法でユーザーに追加情報を伝えることができます。 マウスオーバーのポップアップツールチップを介して詳細情報を提供するアイコンの疑問符としてレンダリングされます。 この例は、コントロールパネルで確認できます。

![アイコンヘルプタグの例です。](./liferay-ui-icon-help/images/01.png)

```{note}
カスタムテーマをインストールした場合は、iferay-ui:icon-help` タグを動作させるために`view.jsp`に次のインポートを追加する必要がある場合があります。

<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme"%> <liferay-theme:defineObjects />
```

ツールチップ情報が必要なUIの横に`<liferay-ui:icon-help/>`タグを追加します。 必要な`message`属性を使用して情報テキストを定義します。 以下は、サーバ管理のクリーンアップ動作のスニペットの一例です。

```jsp
<h5>
    <liferay-ui:message key="clean-up-permissions" />
    <liferay-ui:icon-help message="clean-up-permissions-help" />
</h5>
```

![ヘルプアイコンは、コントロールパネル全体で使用されています。](./liferay-ui-icon-help/images/02.png)

メッセージは [言語キー](https://help.liferay.com/hc/ja/articles/360028746692-Localizing-Your-Application) を介して提供されることに注意してください。 テスト目的ではツールチップのメッセージに文字列を使用できますが、言語キーはベストプラクティスと見なされており、本番環境で使用する必要があります。

## 関連トピック

* [Clayバッジ](../clay-tag-library/clay-badges.md)
* [Clayステッカー](../clay-tag-library/clay-stickers.md)
* [Liferay UIアイコンメニュー](./liferay-ui-icon-menus.md)