---
toc:
  - ./personalizing-site-experience/segmentation.md
  - ./personalizing-site-experience/experience-personalization.md
  - ./personalizing-site-experience/migration-from-audience-targeting.md
  - ./personalizing-site-experience/enabling-automated-live-chat-systems.md
---
# サイトエクスペリエンスのパーソナライズ

Liferay DXPは、ユーザーを理解し、パーソナライズされた体験を提供するための強力なツールをすぐに利用できます。

例えば、 [ユーザーセグメント](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) を作成し、それらを異なる [エクスペリエンス](./personalizing-site-experience/experience-personalization/creating-and-managing-experiences.md) にマッピングすることができます。 エクスペリエンスを導入することで、 [コレクションをパーソナライズし、](./personalizing-site-experience/experience-personalization/personalizing-collections.md) コンテンツや [ユーザーが見るページ](./personalizing-site-experience/experience-personalization/content-page-personalization.md) をカスタマイズすることができる。

```{tip}
ユーザーが複数のセグメントに属している場合、 [特定のパーソナライズされたバリエーション](./personalizing-site-experience/experience-personalization/personalizing-collections.md#creating-personalized-variations) を優先するか、 [すべてのセグメントからコレクションエントリを組み合わせることができます](./personalizing-site-experience/experience-personalization/personalizing-collections.md#combining-collection-entries-from-all-segments) 。
```

## セグメンテーション

セグメントビルダーを使用すると、ユーザープロファイルの属性、行動、サイトの役割などによって類似ユーザーをグループ化することができます。

![Build user segments by checking for different user property values.](./personalizing-site-experience/images/01.png)

開始するには、 [セグメントの作成と管理](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) を参照してください。

```{note}
ユーザーセグメントにロールを割り当てることができます。 詳細については、 [ユーザーセグメントにロールを割り当てる](../users-and-permissions/roles-and-permissions/assigning-roles-to-user-segments.md) を参照してください。
```

### Liferay Analytics Cloudを使用したユーザーセグメントの動作の追跡

Liferay DXPインスタンスをLiferay Analytics Cloudと統合することで、セグメントをスーパーチャージできます。 Analytics Cloudは、DXPをSalesforce（tm）およびその他のデータソースと統合して、ユーザーベースをさらに理解する方法を提供します。

Analytics Cloudとの統合により、機械学習による詳細なデータ分析機能が提供され、DXPサイトの各ページのユーザー行動とエンゲージメントを把握することができます。 Analytics Cloudを使用すると、ユーザーの行動や、標準コンテンツと対象コンテンツの両方との相互作用を確認できます。 詳細は、 [ユーザーセグメントの分析を取得する](./personalizing-site-experience/segmentation/getting-analytics-for-user-segments.md) を参照してください。

![Site metrics using Analytics Cloud.](./personalizing-site-experience/images/02.png)

## パーソナライゼーション

[ユーザー・セグメント](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) を作成したら、ユーザー・セグメントに特化したサイト [体験](./personalizing-site-experience/experience-personalization/creating-and-managing-experiences.md) のカスタマイズを開始できる。 コンテンツページのパーソナライズとコンテンツセットのパーソナライズは、パーソナライズされたユーザー体験を提供するために使用できる2つの方法です。

### コンテントページ

コンテンツページのパーソナライゼーションは、現在のユーザーに基づいてページのレイアウトとコンテンツを動的に変更します。 現在のユーザーのユーザー・セグメント基準に基づいて、 [コンテンツ・ページ](./creating-pages/using-content-pages.md) で異なるテキスト、画像、ウィジェット、さらには異なるレイアウトを提供するエクスペリエンスを作成できます。 詳細は、 [コンテントページのパーソナライゼーション](./personalizing-site-experience/experience-personalization/content-page-personalization.md) を参照してください。

![You can create unique experiences for different segments of users.](./personalizing-site-experience/images/03.png)

### コレクション

[コレクション](./displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md) は、コンテンツを整理して表示します。 [コレクション・パーソナライゼーション](./personalizing-site-experience/experience-personalization/personalizing-collections.md) ユーザー・セグメントに基づいたコレクションの選択を提供します。 つまり、与えられたコンテキストに表示されるコンテンツセットは、 [ユーザーセグメント](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) の基準によって決定される。 例えば、コレクションを使って、ページの一番上に「特集」記事を表示することができます。 そして、デフォルトではなく、より専門的なコンテンツを受け取るべきユーザーを含むユーザーセグメントを作成することができます。 そのようなセグメントには、デフォルトではなく、彼らの興味に合わせてパーソナライズされたコンテンツが表示される。 詳しくは、 [コレクションのパーソナライズ](./personalizing-site-experience/experience-personalization/personalizing-collections.md) をご覧ください。

![You can personalize content sets to display assets for specific user segments.](./personalizing-site-experience/images/04.png)

```{note}
コレクションはLiferay DXP 7.2ではコンテンツセットと名付けられました。
```

### ユーザーエクスペリエンスのプレビュー

ページ上部の **シミュレーション** ボタン(![Simulation](../images/icon-simulation.png))をクリックし、セグメント選択からユーザーセグメントを選択すると、そのユーザーセグメントのメンバーとしてページをプレビューすることができます。

ユーザーセグメントのパースペクティブを表示すると、そのユーザーセグメントのコンテンツページまたはコンテンツセットのパーソナライゼーションがプレビューされます。

![You can preview different experiences from the Preview panel.](./personalizing-site-experience/images/05.png)

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} セグメンテーション
:link: ./personalizing-site-experience/segmentation.md
:::

:::{grid-item-card} エクスペリエンスのパーソナライゼーション
:link: ./personalizing-site-experience/experience-personalization.md
:::

:::{grid-item-card} オーディエンスターゲティングからの移行
:link: ./personalizing-site-experience/migration-from-audience-targeting.md
:::

:::{grid-item-card} 自動ライブチャットシステムの有効化
:link: ./personalizing-site-experience/enabling-automated-live-chat-system.md
:::
::::