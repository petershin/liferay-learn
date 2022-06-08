# Clay進捗バー

`clay:progressbar`タグを使用して、アプリに進捗バーを追加できます。  これらはタスクの完了率を示し、`default`（青）、`warning`（赤）、および`complete`（チェックマーク付きの緑）の3つのステータススタイルがあります。 最小値（`minValue`）と最大値（`maxValue`）を指定できます。

デフォルトの進捗バー：

```jsp
<clay:progressbar 
    maxValue="<%= 100 %>" 
    minValue="<%= 0 %>" 
    value="<%= 30 %>" 
/>
```

![アプリに進捗バーを含めることができます。](./clay-progress-bars/images/01.png)

注意進捗バー：

```jsp
<clay:progressbar 
    maxValue="<%= 100 %>" 
    minValue="<%= 0 %>" 
    status="warning" 
    value="<%= 70 %>" 
/>
```

![注意の進捗バーは、エラーが原因で進行が完了していないことを示します。](./clay-progress-bars/images/02.png)

完了進捗バー：

```jsp
<clay:progressbar 
    status="complete" 
/>
```

![完了の進捗バーは、進行が完了したことを示します。](./clay-progress-bars/images/03.png)

Clay taglibを使用すると、アプリの進行状況を簡単に追跡できます。

## 関連トピック

* [Clayドロップダウンメニューとアクションメニュー](./clay-dropdown-and-action-menus.md)
* [Clayアイコン](./clay-icons.md)
* [Clayナビゲーションバー](./clay-navigation-bars.md)