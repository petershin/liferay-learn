# コレクション・プロバイダによるオブジェクト・エントリの表示

{bdg-secondary}`liferay 7.4 U77+/GA77+`.

オブジェクト定義をパブリッシュすると、Liferay は [コレクションプロバイダ](../../site-building/displaying-content/collections-and-collection-pages/collection-providers.md) を作成します。 このプロバイダを [コレクション表示フラグメント](../../site-building/displaying-content/collections-and-collection-pages/displaying-collections.md#adding-a-collection-display-fragment-to-a-page) および [コレクション・ページ](../../site-building/displaying-content/collections-and-collection-pages/displaying-collections.md#displaying-collections-on-a-collection-page) とともに使用すると、そのエントリを表示できます。 オブジェクトは、フィルタリング、スタイリング、表示オプションなど、すべてのコレクション表示機能をサポートしています。

## オブジェクトのコレクション・プロバイダの使用

1. 新しい [コンテンツページ](../../site-building/creating-pages/using-content-pages.md) または [表示ページテンプレート](../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md) を作成する。 または、既存のものを編集する ( ![編集ボタン](../../images/icon-edit-pencil.png))。

   ```{note}
   コレクション・プロバイダを使用してコレクション・ページを作成することもできます。 詳しくは [コレクションとコレクションページ](../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md) をご覧ください。
   ```

1. フラグメントとウィジェット(![フラグメントとウィジェット](../../images/icon-plus.png))のサイドバーから、 **コレクション表示** フラグメントをページまたはテンプレートにドラッグ＆ドロップします。

1. **Collection Display Fragment** を選択して構成オプションにアクセスし、General タブで **Select Collection** をクリックします。

   ![Select the fragment and click Select Collection.](../objects/displaying-object-entries-with-collection-providers/images/01.png)

1. モーダルウィンドウで、 **Collection Providers** タブをクリックし、 **Object's provider** を選択します。

   ![In the Collection Providers tab, select the object's provider.](./displaying-object-entries-with-collection-providers/images/02.png)

1. (オプション) 表示されたオブジェクトエントリをフィルタリングする。 オブジェクト内のピックリストやブーリアンフィールドでフィルタリングすることができます：

   **コレクションオプション** ( [コレクションオプションボタン](../../images/icon-actions.png) )をクリックし、*フィルタコレクション*を選択します。

   ![Click the Collection Options button and select Filter Collection.](./displaying-object-entries-with-collection-providers/images/03.png)

   次に、必要な **フィルター** を選択し、 **適用** をクリックします。

   ![Select the Filters to apply.](./displaying-object-entries-with-collection-providers/images/04.png)

希望するプロバイダを選択した後、追加のフラグメントオプションを使用して、 **List Style** や **Pagination** など、オブジェクトエントリの表示方法を決定します。

## フラグメントからオブジェクト・フィールドへのマッピング

コレクション表示フラグメントにオブジェクトを選択すると、そのオブジェクトがマッピングソースとして設定されます。 フラグメントを追加し、その [サブ要素](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md) をオブジェクトフィールドにマッピングすることで、個々のオブジェクトエントリに対して柔軟なページ表示を作成できるようになりました。 これはコレクションページにも言えることだ。

例えば、オブジェクトにマッピングされたCollection Displayフラグメントにボタンを埋め込み、コレクションの各アイテムの名前を表示するようにボタンのリンクを設定することができます。

![Map fragment sub-elements in Collection Display fragments to object fields.](./displaying-object-entries-with-collection-providers/images/05.png)

## フラグメントを関連オブジェクト・フィールドにマッピングする

```{important}
フラグメント要素を関連するオブジェクト・フィールドにマッピングすることは、リリース機能フラグの背後にある。 詳しくは [Release Feature Flags](../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) をお読みください。
```

マップされたオブジェクトが、 [1対多のリレーション](./creating-and-managing-objects/relationships/defining-object-relationships.md) の子側にある場合、フラグメント要素を親オブジェクトのフィールドにマップすることができます。 埋め込まれたコレクション表示フラグメントは、新しいコレクションを形成するために、ユニークな [関連アイテムコレクションプロバイダ](../../site-building/displaying-content/collections-and-collection-pages/collection-providers.md#related-items-collections-providers) を使用します。

例えば、`City`オブジェクト（子）が`Country`オブジェクト（親）に関連している場合、`Country`オブジェクトのフィールドにフラグメントをマッピングすることができます。

フラグメントを関連オブジェクトのフィールドにマッピングする、

1. オブジェクトのコレクション・プロバイダをコレクション表示フラグメントで使用します。

1. 最初のコレクション表示内に別のコレクション表示フラグメントを埋め込みます。

   ```{tip}
   ページ編集メニューの*Browser*タブを使用すると、ページ階層内でフラグメントをより正確に配置することができます。
   ```
   ![Use the Browser tab to help properly embed the Collection Display fragment.](./displaying-object-entries-with-collection-providers/images/06.png)

1. 新しいコレクション表示フラグメントの設定オプションで **Select Collection** をクリックします。

1. **関連アイテムコレクションプロバイダ**タブをクリックします。

1. オブジェクトのリレーションシップ名を持つコレクション・プロバイダを選択します。 関連するオブジェクト・タイプは、リレーションシップ名の下に表示されます。 この例では、この関係を「国の中の都市」と呼ぶ：

   ![Select the relationship that you created with between the displayed object and another object type.](./displaying-object-entries-with-collection-providers/images/07.png)

これで、新しいコレクション表示にフラグメントを埋め込み、関連オブジェクトのフィールドにマッピングできるようになりました。

![Map fragment sub-elements to fields in parent objects.](./displaying-object-entries-with-collection-providers/images/08.png)

## 関連トピック

* [オブジェクトの作成](./creating-and-managing-objects/creating-objects.md)
* [オブジェクトエントリの表示](./displaying-object-entries.md)
* [コレクションとコレクション・ページについて](../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md)
* [コレクション・プロバイダー](../../site-building/displaying-content/collections-and-collection-pages/collection-providers.md)
* [オブジェクトの関係の定義](./creating-and-managing-objects/relationships/defining-object-relationships.md)
