# フラグメント・コンフィギュレーションを使用する際のベストプラクティス

独自の [構成でサイトのページフラグメントを作成する場合](./adding-configuration-options-to-fragments.md)、それらを安全かつ効果的にHTML表示で使用するのはあなたの責任です。 ここでは、フラグメントをより効果的かつ強固にするためのテクニックを紹介します。

* [構成テキスト値のエスケープ](#escape-configuration-text-values)
* [繰り返されるHTML要素にリストを使用する](#use-lists-for-repeated-html-elements)

## 構成テキスト値のエスケープ

悪意のあるコードが [テキストフィールドの構成](../reference/fragments/fragment-configuration-types-reference.md#text-configuration) に挿入され、他のフラグメントユーザーに大混乱を引き起こす可能性があります。 クロスサイトスクリプティング（XSS）攻撃から守るために、フラグメントテキスト値をエスケープする必要があります。

一般的なケースでは、HTML `escape()`メソッドを使用できます。 詳細は、 [`HtmlUtil`](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/HtmlUtil.html) クラスを参照してください。

```html
<div class="fragment_38816">
    "${htmlUtil.escape(configuration.text)}"
</div>
```

属性の設定やHTMLの子要素の追加など、JavaScript攻撃を防ぐには、`Liferay.Util.escapeHTML()` 関数を使用します。

```javascript
function (fragmentElement, configuration) {
    const escapedValue = Liferay.Util.escapeHTML(configuration.text)
}
```

## 繰り返されるHTML要素にリストを使用する

FreeMarkerのリストを使用することで、フラグメントに同じHTML要素を繰り返し記述することを避けることができます。 実装した設定オプションの値を使って、リストのロジックを実装することができます。

例えば、設定で定義された行数を反復処理し（この例では [select configuration](../reference/fragments/fragment-configuration-types-reference.md#select-configuration) ）、このHTMLで設定された行数を一覧表示することができます。

```html
<div class="fragment_1">
    [#list 1..configuration.numberOfLines as index]
        <li>Line number: ${index}</li>
    [/#list]
</div>
```

[コレクションセレクタ設定](../reference/fragments/fragment-configuration-types-reference.md#collection-selector) を実装している場合、この例のように、設定されたコレクション内のすべてのタイトルをリストアップすることもできます。

```html
<div class="fragment_310">
    <h1>
        List of Items:
    </h1>
    <ul>
        [#if collectionObjectList??]
            [#list collectionObjectList as item]
                <li>${item.title}</li>
            [/#list]
        [/#if]
    </ul>
</div>
```

詳しくは、 [FreeMarker 公式ドキュメント](https://freemarker.apache.org/docs/ref_directive_list.html) をご覧ください。

## 関連トピック

* [フラグメントへの構成オプションの追加](./adding-configuration-options-to-fragments.md)
* [フラグメンテーションの構成タイプ](../reference/fragments/fragment-configuration-types-reference.md)
