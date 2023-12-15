# コレクションプロバイダー

コレクションプロバイダは、ページに表示するアイテムをコレクションにグループ化します。 また、情報フレームワークを使ってアイテムを必要なコレクションにグループ化することもできます。

```{note}
items_という用語は、商品やカテゴリーなどのコンテンツ以上のものを指すことができ、それらは現在のサイトやLiferayインスタンスの外に配置することができます。
```

## デフォルト・コレクション・プロバイダー

以下のコレクション・プロバイダは、すぐに利用可能で、同じ名前のウィジェットと同じように機能します：

* 最も閲覧されたアセット：現在のサイトで最も閲覧されたアセットを多いものから順に表示します。
* 格付けの高い資産：格付けの高い資産から低い資産へと表示されます。
* 最近のコンテンツ：最近更新されたアセットを最新のものから順に表示します。

![When configuring a collection display fragment, you can choose collection providers such as Most Viewed Assets, Highest Rated Assets, and Recent Content.](./collection-providers/images/01.png)

いくつかのコレクションプロバイダは、Liferayのアプリケーションによって自動的に作成されます。 例えば、

* オブジェクトがパブリッシュされると、Liferayはそのオブジェクトのコレクションプロバイダを作成します。 詳細は、 [Using Collection Provider for Objects](../../../building-applications/objects/displaying-object-entries.md#using-the-collection-provider-for-objects) を参照してください。
* [Liferay DXP] 検索ブループリント検索ブループリントが公開されると、Liferayはそのためのコレクションプロバイダを作成します。 詳しくは、[検索ブループリント付きコレクション](../../../using-search/liferay-enterprise-search/search-experiences/search-blueprints/collections-with-search-blueprints.md) ] を参照してください。

## 関連項目コレクションプロバイダー

関連アイテムコレクションプロバイダは、表示されているメインアイテムに関連するアイテムのリストを表示します。 これらのコレクション・プロバイダーには2つの方法でアクセスできる：

1. コレクション表示フラグメントを表示ページに追加する。

1. コンテンツページのコレクション表示フラグメントの中にコレクションを入れ子にする。

![When configuring a collection display fragment, you can choose Related Items collection providers.](./collection-providers/images/02.png)

**Related Assets:** 表示中のメインアイテムに関連するアイテムを表示します。

**このアイテムのカテゴリ:** 現在のアイテムまたは資産のカテゴリを表示します。

**Items with Categories in Same Vocabularies** :は、表示中のメインアセットと同じ語彙のアイテムを表示します。 例えば、メインアセットに **football** というカテゴリがあり、 **football** が **sports** 語彙の一部である場合、 **sports** 語彙の下にある他のすべてのカテゴリが表示されます。

**同じカテゴリのアイテム:** には、表示されているメインアイテムと同じカテゴリのアイテムが表示されます。 たとえば、メインアイテムのカテゴリが **サッカー** の場合、同じカテゴリのアイテムが表示されます。 [**詳細ルール**] で [同じ語彙の任意のカテゴリ] または [特定のカテゴリ] を選択することで、結果をさらに絞り込むことができます。

![Items with the Same Categories requires you to choose an item type.](./collection-providers/images/04.png)

**リレーションシップのあるオブジェクト** :（オブジェクトを表示しているとき）表示中のオブジェクトとリレーションシップのある他のオブジェクトを表示します。 メイン・オブジェクトが持つすべてのリレーションシップに対して、新しい関連項目コレクション・プロバイダが表示されます。 例えば、メイン・オブジェクトが **country** で、 **city** オブジェクトと [1対多のリレーションシップ](../../../building-applications/objects/creating-and-managing-objects/relationships/defining-object-relationships.md) （1つの国に多くの都市がマッピングされている）がある場合、その国のエントリーに関連するすべての都市オブジェクト・エントリーが表示されます。

### 同じカテゴリーを持つアイテムの高度なルール

表示された項目は、その種類に基づいてフィルタリングしながら、さらに絞り込むことができます。

![When configuring the Items with the Same Categories provider, you can choose advanced rules from the drop-down.](./collection-providers/images/03.png)

**Any Category of the Same Vocabulary** :は、主な資産と同じ語彙のカテゴリを持つすべてのアイテムを表示します。 例えば、メインアセットに **football** というカテゴリがある場合、 **sports** という語彙に含まれる他のすべてのアイテムが表示されます。

**特定のカテゴリー** :リストをさらに絞り込むための追加カテゴリーからの結果を表示します。 例えば、 **breaking news** というカテゴリを追加して、 **football** と **breaking news** というカテゴリを持つアセットを表示することができます。

```{tip}
デフォルトでは、親カテゴリーを選択すると、自動的にその子カテゴリーが選択されます。 これはコントロールパネルの*インスタンス設定*で変更できます。
```