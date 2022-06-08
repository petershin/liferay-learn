# Liferay Util Whitespace Removerの使用

whitespace removerタグは、タグの開始と終了の間に含まれているコード ブロックから改行とタブを削除します。 以下は、`<liferay-util:whitespace-remover>`タグの構成例です。

removerを使用：

```jsp
<liferay-util:whitespace-remover>
    <p>Here is some text with        tabs.</p>
</liferay-util:whitespace-remover>
```

結果:

```html
Here is some text withtabs.
```
これで、`<liferay-util:whitespace-remover>`タグを使用してコードのフォーマットが一貫していることを確認する方法がわかりました。

## 関連トピック

* [Using the Liferay Util Param Tag](./liferay-util-param.md)
* [Using the Liferay Util Buffer Tag](./liferay-util-buffer.md)
* [Using the AUI Taglib](https://help.liferay.com/hc/ja/articles/360028832812-Using-AUI-Taglibs)