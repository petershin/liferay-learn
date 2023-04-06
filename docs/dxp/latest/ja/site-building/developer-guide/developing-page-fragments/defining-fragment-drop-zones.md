# フラグメントドロップゾーンの定義

ドロップゾーンは、コンテンツページの構築に不可欠です。 フラグメントの中に、ユーザーが他のフラグメントやウィジェットをドラッグ＆ドロップできる領域を定義することで、ユニークなページレイアウトや動的な表示を実現することができます。

ドロップゾーンを定義するには、次の手順に従います。

1. ［**サイト管理**］ &rarr; ［**デザイン**］ &rarr; ［**Fragments**］ へ移動します。

1. Fragment Sets」で、編集したいフラグメントがあるセットを選択します。

1. フラグメントの **アクション**(![Action](./../../../images/icon-actions.png)) ボタンをクリックし、 **編集** を選択すると、 [フラグメントエディタ](./using-the-fragments-editor.md)が開きます。

1. HTMLコードエリアに、 `<lfr-drop-zone></lfr-drop-zone>` ラベルを追加して、フラグメント内のドロップゾーンを定義します。

   ```{important}
   フラグメント内の編集可能な要素にドロップゾーンを追加することはできません。
   ```

次のコードは、このラベルを使用して、Tabs フラグメント内でドロップゾーンを定義する方法を示しています。

   ```html
      <div class="tab-panel">
         [#list 0..configuration.numberOfTabs-1 as i]
         <div aria-labelledby="tab${i+1}-${fragmentEntryLinkNamespace}" class="d-none tab-panel-item" data-fragment-namespace="${fragmentEntryLinkNamespace}" id="tabPanel${i+1}-${fragmentEntryLinkNamespace}" role="tabpanel" tabindex="0">
            <lfr-drop-zone data-lfr-drop-zone-id="${i+1}" data-lfr-priority="${i+1}"></lfr-drop-zone>
         </div>
         [/#list]
      </div>
   ```

この画像は、コンテントページエディターのサイドバーに結果を示しています。

![Tabフラグメントは、コンテンツページエディタの4つの異なるドロップゾーンを示しています。](./defining-fragment-drop-zones/images/04.png)

一度定義すれば、任意のフラグメントやウィジェットをドロップゾーンにドラッグ＆ドロップすることができます。

## フラグメントドロップゾーンID

フラグメントが指定されたドロップゾーンに留まるようにするには、 `data-lfr-drop-zone-id` 属性でドロップゾーンIDを追加することができます。 ドロップゾーンの並び替えや、既存のドロップゾーンの間に新しいドロップゾーンを挿入する際、ドロップゾーンIDによって、フラグメントが元のドロップゾーンに留まるようにします。

ユニークなIDを持つドロップゾーンを削除して伝播させると、ドロップゾーンとそのコンテンツはページから削除されます。 同じIDのドロップゾーンをフラグメントに追加し直すと、最初の伝播の後に公開されていないドラフトからしかコンテンツが取得されなくなります。 公開されたドラフトでは、ドロップゾーンは新しいドロップゾーンとされています。

ドロップゾーンIDは必須ではありません。 IDのないドロップゾーンも同様に機能し、指定された順番で表示されます。 既存のフラグメントにドロップゾーンIDを追加し、保存して伝播させた場合、最初の伝播から、IDが追加されます。

## 追加情報

- [フラグメントの開発](./developing-fragments-intro.md)
- [フラグメントエディターの使用](./using-the-fragments-editor.md)
- [フラグメントツールキットの使用](./using-the-fragments-toolkit.md)
- [フラグメント内の要素の順序を設定する](./setting-the-order-of-elements-in-a-fragment.md)
