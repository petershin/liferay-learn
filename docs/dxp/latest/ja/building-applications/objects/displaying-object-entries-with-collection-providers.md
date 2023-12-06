# コレクション・プロバイダによるオブジェクト・エントリの表示

{bdg-secondary}`Liferay 7.4 U77+/GA77+`

オブジェクト定義をパブリッシュすると、Liferay は [コレクションプロバイダ](../../content-authoring-and-management/collections-and-collection-pages/collection-providers.md) を作成します。 このプロバイダを [コレクション表示フラグメント](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#adding-a-collection-display-fragment-to-a-page) および [コレクション・ページ](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#displaying-collections-on-a-collection-page) とともに使用すると、そのエントリを表示できます。 オブジェクトは、フィルタリング、スタイリング、表示オプションなど、すべてのコレクション表示機能をサポートしています。

## オブジェクトのコレクション・プロバイダの使用

1. 新しい [コンテンツページ](../../site-building/creating-pages/using-content-pages.md) または [表示ページテンプレート](../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md)を作成する。 または、編集を開始する ( ![編集ボタン](../../images/icon-edit-pencil.png) ）することから開始します。

   ```{note}
   コレクション・プロバイダを使用してコレクション・ページを作成することもできます。 詳しくは、[コレクションとコレクションページについて](../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)をご覧ください。
   ```

1. フラグメントとウィジェット (![Fragments and Widgets](../../images/icon-plus.png)) サイドバーから、 **コレクション表示** フラグメントをページまたはテンプレートにドラッグ＆ドロップします。

1. ［**コレクション表示フラグメント**］ を選択して設定オプションにアクセスし、［General］タブの ［**Select Collection**］をクリックします。

   ![フラグメントを選択し、［コレクションを選択］をクリックします。](../objects/displaying-object-entries-with-collection-providers/images/01.png)

1. モーダルウィンドウで、 **Collection Providers** タブをクリックし、 **オブジェクトのプロバイダ** を選択します。

   ![Collection Providers タブで、オブジェクトのプロバイダを選択します。](./displaying-object-entries-with-collection-providers/images/02.png)

1. (オプション) 表示されたオブジェクトエントリをフィルタリングする。 オブジェクト内のピックリストやブーリアンフィールドでフィルタリングすることができます：

   **Collection Options**(![Collection Options Button](../../images/icon-actions.png)) をクリックし、 **Filter Collection** を選択する。

   ![［Collection Options］ボタンをクリックして、［Filter Collection］を選択します。](./displaying-object-entries-with-collection-providers/images/03.png)

   次に、希望する **フィルタ** を選択し、 **適用** をクリックする。

   ![適用するフィルターを選択します。](./displaying-object-entries-with-collection-providers/images/04.png)

希望するプロバイダを選択した後、 **List Style** や **Pagination** などの追加フラグメントオプションを使用して、オブジェクトエントリの表示方法を決定します。

## フラグメントからオブジェクト・フィールドへのマッピング

コレクション表示フラグメントにオブジェクトを選択すると、そのオブジェクトがマッピングソースとして設定されます。 フラグメントを追加し、その [サブ要素](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md) をオブジェクトフィールドにマッピングすることで、個々のオブジェクトエントリに対して柔軟なページ表示を作成できるようになりました。 これはコレクションページにも言えることだ。

例えば、オブジェクトにマッピングされたCollection Displayフラグメントにボタンを埋め込み、コレクションの各アイテムの名前を表示するようにボタンのリンクを設定することができます。

![コレクション表示のフラグメントのサブ要素をオブジェクト・フィールドにマップする。](./displaying-object-entries-with-collection-providers/images/05.png)

## フラグメントを関連オブジェクト・フィールドにマッピングする

```{important}
フラグメント要素を関連するオブジェクト・フィールドにマッピングすることは、リリース機能フラグの背後にある。 詳しくは [Release Feature Flags](../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) を読んでください。
```

マップされたオブジェクトが、 [1対多のリレーション](./creating-and-managing-objects/relationships/defining-object-relationships.md)の子側にある場合、フラグメント要素を親オブジェクトのフィールドにマップすることができます。 埋め込まれたコレクション表示フラグメントは、新しいコレクションを形成するために、ユニークな [関連アイテムコレクションプロバイダ](../../content-authoring-and-management/collections-and-collection-pages/collection-providers.md#related-items-collections-providers) を使用します。

例えば、 `City` オブジェクト（子）が `Country` オブジェクト（親）に関連している場合、 `Country` オブジェクトのフィールドにフラグメントをマッピングすることができます。

フラグメントを関連オブジェクトのフィールドにマッピングする、

1. オブジェクトのコレクション・プロバイダをコレクション表示フラグメントで使用します。

1. 最初のコレクション表示内に別のコレクション表示フラグメントを埋め込みます。

   ```{tip}
   ページ編集メニューの*Browser*タブを使用すると、ページ階層内でフラグメントをより正確に配置することができます。
   ```

   ![コレクション表示フラグメントを適切に埋め込むには、ブラウザタブを使用します。](./displaying-object-entries-with-collection-providers/images/06.png)

1. 新しいコレクション表示フラグメントの構成オプションで、 **Select Collection** をクリックします。

1. **Related Items Collection Providers** タブをクリックします。

1. オブジェクトのリレーションシップ名を持つコレクション・プロバイダを選択します。 関連するオブジェクト・タイプは、リレーションシップ名の下に表示されます。 この例では、 `cities in country`という関係になっている：

   ![表示されているオブジェクトと別のオブジェクトタイプの間に作成したリレーションシップを選択します。](./displaying-object-entries-with-collection-providers/images/07.png)

これで、新しいコレクション表示にフラグメントを埋め込み、関連オブジェクトのフィールドにマッピングできるようになりました。

![フラグメントのサブ要素を親オブジェクトのフィールドにマップする。](./displaying-object-entries-with-collection-providers/images/08.png)

## 関連トピック

* [オブジェクトの作成](./creating-and-managing-objects/creating-objects.md)
* [オブジェクトの入力を表示する](./displaying-object-entries.md)
* [コレクションとコレクションページについて](../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)
* [コレクションプロバイダー](../../content-authoring-and-management/collections-and-collection-pages/collection-providers.md)
* [オブジェクトリレーションシップの定義](./creating-and-managing-objects/relationships/defining-object-relationships.md)
