# Liferay Util Bufferの使用

bufferタグは自己終了タグではありません。 このタグの開始と終了の間に配置されたコンテンツはバッファに保存され、その出力はタグの`var`属性で宣言されたJava変数に割り当てられます。 出力は文字列として返され、後処理できます。 たとえば、このタグを使用して、 [JSPの既存のコンテンツをオーバーライド](https://help.liferay.com/hc/ja/articles/360029122451-JSP-Overrides-Using-OSGi-Fragments) できます 。

以下の例では、リンクの生成されたマークアップをバッファに保存し、返された文字列を`liferay-ui:message`キーの引数として使用します。

```jsp
<liferay-util:buffer
        var="linkContent"
>
        <aui:a 
            href="https://www.liferay.com/" 
            target="_blank">Liferay
        </aui:a>
</liferay-util:buffer>

<liferay-ui:message 
        arguments="<%= linkContent %>" 
        key="see-x-for-more-information" 
        translateArguments="<%= false %>" 
/>
```

これで、`<liferay-util:buffer>`タグを使用してコンテンツをバッファに保存する方法がわかりました。

![Liferay Util Bufferタグを使用して、JSPで再利用するマークアップの一部を保存できます。](./liferay-util-buffer/images/01.png)

## 関連トピック

* [JSP Overrides Using OSGi Fragments](https://help.liferay.com/hc/ja/articles/360029122451-JSP-Overrides-Using-OSGi-Fragments)
* [Using the Liferay Util Param Tag](./liferay-util-param.md)
* [Using the Liferay Frontend Taglibs](../liferay-frontend-tag-library.md)