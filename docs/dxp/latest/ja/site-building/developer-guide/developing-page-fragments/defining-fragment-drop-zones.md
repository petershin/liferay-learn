# フラグメントドロップゾーンの定義

ドロップゾーンは、コンテンツページの構築に不可欠です。 それらを使用して、ユーザーが他のフラグメントとウィジェットをドラッグアンドドロップできるフラグメント内の領域を定義することにより、独自のページレイアウトと動的表示を作成できます。

ドロップゾーンを定義するには、次の手順に従います。

1. ［**サイト管理**］ &rarr; ［**デザイン**］ &rarr; ［**Fragments**］ へ移動します。

1. ［Fragment Sets］で、編集したいフラグメントのあるセットを選択します。

1. フラグメントの **アクション**(![Action](./../../../images/icon-actions.png)) ボタンをクリックして ［**編集**］ を選択し、[［フラグメントエディター］](./using-the-fragments-editor.md)を開きます。

1. HTMLコードエリアに、 `<lfr-drop-zone></lfr-drop-zone>` ラベルを追加して、フラグメント内にドロップゾーンを定義することができます。

   ```{important}
   フラグメント内の編集可能な要素にドロップゾーンを追加することはできません。
   ```

次のコードは、このラベルを使用して、タブフラグメント内にドロップゾーンを定義する方法を示しています。

   ```html
      <div class="tab-panel">
         [#list 0..configuration.numberOfTabs-1 as i]
         <div aria-labelledby="tab${i+1}" class="tab-panel-item d-none" data-fragment-namespace="${fragmentEntryLinkNamespace}" id="tabPanel${i+1}" role="tabpanel" tabindex="0">
            <lfr-drop-zone></lfr-drop-zone>
         </div>
         [/#list]
      </div>
   ```

この画像は、コンテントページエディターのサイドバーに結果を示しています。

![タブフラグメントは、コンテンツページエディタに4つの異なるドロップゾーンを表示します。](./defining-fragment-drop-zones/images/04.png)

定義したら、フラグメントまたはウィジェットをドロップゾーンにドラッグアンドドロップできます。

```{tip}
ドロップゾーンにはIDがありません。 指定された順番で描画され、手動で移動することはできません。 ただし、[Fragment内の他の要素](./setting-the-order-of-elements-in-a-fragment.md)の順序を設定することが可能です。
```

## 追加情報

- [フラグメントの開発](./developing-fragments-intro.md)
- [フラグメントエディターの使用](./using-the-fragments-editor.md)
- [フラグメントツールキットの使用](./using-the-fragments-toolkit.md)
- [フラグメント内の要素の順序を設定する](./setting-the-order-of-elements-in-a-fragment.md)
