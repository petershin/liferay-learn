# コレクション・プロバイダによるオブジェクト・エントリの表示

{bdg-secondary}`7.4以降で利用可能`

オブジェクトをパブリッシュすると、Liferayは [コレクションプロバイダ](../../content-authoring-and-management/collections-and-collection-pages/collection-providers.md) を作成し、 [コレクション表示フラグメント](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#adding-a-collection-display-fragment-to-a-page) と一緒に使用して、複数のオブジェクトエントリを表示します。 次に、Collection Display フラグメントを使用して、特定のオブジェクトタイプを表示し、フラグメン トのフィルタリング、スタイル、および表示オプションを使用し、他のフラグメントを埋め込んで、リストされた各オブジェクト エントリに対して表示する情報をカスタマイズできます。 [コレクションページ](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#displaying-collections-on-a-collection-page) を使ってオブジェクトのコレクションを表示することもできます。

## フラグメント・フィールドからオブジェクト・フィールドへのマッピング

コレクション表示フラグメント内でオブジェクトを選択すると、そのオブジェクトがフラグメントのマッピングソースとして設定されます。 フラグメント・フィールドをオブジェクト・フィールドにマッピングして、個々のオブジェクト・エントリに対して柔軟なページ表示を作成できるようになりました。 多くの基本的なコンポーネント・フラグメント（ヘッダーやボタンなど）は、そのフィールドをマッピング・ソースとしてのオブジェクト・セットにマッピングすることができる。 これは、そのオブジェクト・タイプに関連するコレクション・ページにいても同じように機能します。

例えば、オブジェクトにマッピングされたCollection Displayフラグメントにボタンを埋め込み、コレクションの各アイテムの名前を表示するようにボタンのリンクを設定することができます。

![マッピングされたCollection Displayフラグメント内に埋め込まれていれば、多くの基本コンポーネントタイプをオブジェクトフィールドにマッピングできます。](./displaying-object-entries-with-collection-providers/images/01.png)

## 関連オブジェクトのフィールドのマッピング

{bdg-secondary}`利用可能 7.4 U77 および GA77+`

```{important}
フラグメントのフィールドをメイン・オブジェクトに関連するオブジェクトにマッピングすることは、現在リリース機能フラグの背後にある。 詳しくは [Release Feature Flags](../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) を読んでください。
```

マップされたオブジェクトが他のオブジェクトと [1対多のリレーションシップ](./creating-and-managing-objects/relationships/defining-object-relationships.md) を持っている場合（表示されたオブジェクトが1つの関連オブジェクトを持っている場合）、関連オブジェクトのフィールドから情報を表示することもできます。

たとえば、 `City` オブジェクトのコレクションプロバイダがあり、関連する `Country` オブジェクトがある場合、埋め込みフラグメントに表示するフィールドとして `Country` フィールドを選択できます。 以下は、 `cities in country`というリレーションシップの例である：

![フラグメントがオブジェクトに関連付けられている場合、オブジェクトのフィールドを表示するか、関連オブジェクトが1つの場合は、その関連オブジェクトのフィールドを表示することができます。](./displaying-object-entries-with-collection-providers/images/02.png)

```{note}
同じ関係にある他のオブジェクトエントリが複数ある場合、このように関連オブジェクトエントリの情報を表示することはできません。
```

## オブジェクトのコレクションプロバイダーの使用

オブジェクトをパブリッシュしたら、以下の手順に従ってCollection Displayフラグメントを使用してオブジェクトのエントリを表示します：

1. 新しい [コンテンツページ](../../site-building/creating-pages/using-content-pages.md) または [表示ページテンプレート](../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md)を作成する。 または、編集を開始する ( ![編集ボタン](../../images/icon-edit-pencil.png) ）することから開始します。

   ```{note}
   コレクション・プロバイダを使用してコレクション・ページを作成することもできます。 詳しくは、[コレクションとコレクションページについて](../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)をご覧ください。
   ```

1. フラグメントとウィジェット (![Fragments and Widgets](../../images/icon-plus.png)) サイドバーから、 **コレクション表示** フラグメントをページまたはテンプレートにドラッグ＆ドロップします。

1. ［**コレクション表示フラグメント**］ を選択して設定オプションにアクセスし、［General］タブの ［**Select Collection**］をクリックします。

   ![フラグメントを選択し、［コレクションを選択］をクリックします。](../objects/displaying-object-entries-with-collection-providers/images/03.png)

1. モーダルウィンドウで、 **Collection Providers** タブをクリックし、 **オブジェクトのプロバイダ** を選択します。

   ![Collection Providers タブで、オブジェクトのプロバイダを選択します。](./displaying-object-entries-with-collection-providers/images/04.png)

1. (オプション) 表示されたオブジェクトエントリをフィルタリングする。 オブジェクト内のピックリストやブーリアンフィールドでフィルタリングすることができます：

   **Collection Options**(![Collection Options Button](../../images/icon-actions.png)) をクリックし、 **Filter Collection** を選択する。

   ![［Collection Options］ボタンをクリックして、［Filter Collection］を選択します。](./displaying-object-entries-with-collection-providers/images/05.png)

   次に、希望する **フィルタ** を選択し、 **適用** をクリックする。

   ![適用するフィルターを選択します。](./displaying-object-entries-with-collection-providers/images/06.png)

希望するプロバイダを選択した後、 **List Style** や **Pagination** など、追加のフラグメントオプションを使用してオブジェクトエントリの表示方法を決定します。

## 関連オブジェクト情報の表示

{bdg-secondary}`利用可能 7.4 U77 および GA77+`

オブジェクトが他のオブジェクトと [の関係を持っている場合](./creating-and-managing-objects/relationships/defining-object-relationships.md)、ネストされたコレクション表示フラグメントを使用して、その関係にある関連オブジェクトを表示することもできます。 埋め込まれたコレクション表示フラグメントは、新しいコレクションを形成するために、ユニークな [関連アイテムコレクションプロバイダ](../../content-authoring-and-management/collections-and-collection-pages/collection-providers.md#related-items-collections-providers) を使用します。

```{important}
関連アイテム・コレクション・プロバイダーによる関連オブジェクトの表示は、現在リリース機能フラグの後ろにあります。 詳しくは [Release Feature Flags](../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) を読んでください。
```

関連オブジェクトを含むオブジェクトデータを作成したら、以下の手順に従ってください：

1. [オブジェクトのコレクションを表示するには、コレクション・プロバイダを使用します。](#using-the-collection-provider-for-objects)

1. 既存のフラグメントのコレクションのアイテムの下に、別のコレクション表示フラグメントを埋め込みます。

   ```{tip}
   ページ編集メニューの*Browser*タブを選択し、新しいCollection Display要素をそこにドラッグして、より正確に階層のCollection Itemの下に埋め込みます。
   ```

   ![コレクション表示フラグメントを適切に埋め込むには、ブラウザタブを使用します。](./displaying-object-entries-with-collection-providers/images/07.png)

1. 新しいコレクション表示フラグメントの構成オプションで、 **Select Collection** をクリックします。

1. **Related Items Collection Providers** タブをクリックします。

1. オブジェクトのリレーションシップ名を持つコレクション・プロバイダを選択します。 関連するオブジェクト・タイプは、リレーションシップ名の下に表示されます。

   ![表示されているオブジェクトと別のオブジェクトタイプの間に作成したリレーションシップを選択します。](./displaying-object-entries-with-collection-providers/images/08.png)

最上位のコレクション表示フラグメントの各項目について、新しいフラグメントが選択されたリレーションシップ内のすべてのオブジェクトを一覧表示するようになりました。 フラグメントのオプションを使用するか、さらにフラグメントを追加して、それらがどのように表示されるかを示します。

## 関連トピック

* [オブジェクトの作成](./creating-and-managing-objects/creating-objects.md)
* [オブジェクトの入力を表示する](./displaying-object-entries.md)
* [コレクションとコレクションページについて](../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)
* [コレクションプロバイダー](../../content-authoring-and-management/collections-and-collection-pages/collection-providers.md)
* [オブジェクトリレーションシップの定義](./creating-and-managing-objects/relationships/defining-object-relationships.md)
