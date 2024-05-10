# コンテンツ推薦を理解する

ユーザーはWebサイトにアクセスすると、コンテンツと対話し、興味に応じてさまざまな行動を示します。 Liferay DXPは、 [Analytics Cloud](https://learn.liferay.com/w/analytics-cloud/index) と組み合わせて、この閲覧動作を分析し、ユーザーに関連するコンテンツを表示できます。 これは、ユーザーが購入または消費する可能性が高い特定の製品またはコンテンツを宣伝するのに役立ちます。 たとえば、ユーザーがオンラインストアにアクセスして特定の種類の商品に関心を示した場合、コンテンツリコメンデーションを使用して、類似商品や関連商品のプロモーションをユーザーに表示できます。

```{important}
 [Liferay DXPをAnalytics Cloudに接続する](https://learn.liferay.com/ja/w/analytics-cloud/getting-started/connecting-liferay-dxp-to-analytics-cloud) に接続し、ユーザーにコンテンツの推奨を提供する必要があります。
```

## コンテンツリコメンデーションの仕組み

コンテンツリコメンデーションの構成は、2段階のプロセスです。 まず、ユーザーの行動を追跡し、関心のあるトピックを定義します。 この手順では、 [Liferay DXPをAnalytics Cloudに接続する](https://learn.liferay.com/ja/w/analytics-cloud/getting-started/connecting-liferay-dxp-to-analytics-cloud) 必要があります。 Analytics Cloudは、サイトでの以前のユーザーの行動に基づいて、関心のあるトピックを定義およびランク付けし、これらの関心をサイトのユーザーIDに関連付けます。 次に、ユーザーの興味に基づいて、ユーザーに推奨するコンテンツを表示します。 この手順では、 [動的コレクション](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md) を作成し、このコレクションをWebサイトに表示する必要があります。 Analytics Cloudは、ユーザーの関心に基づいて一連のキーワードをDXPに送信し、これらのキーワードはコレクション内のフィルターとして機能します。 ユーザーに表示するコンテンツの種類を定義するには、コレクションが必要です。

```{note}
Analytics Cloud で Interests を使用する方法の詳細については、 [セグメント](https://learn.liferay.com/w/analytics-cloud/people/segments/segments) を参照してください。
```

![Interests view in Liferay Analytics Cloud](./understanding-content-recommendations/images/01.png)

Analytics Cloudは、タイル、説明、 [カテゴリ](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) 、 [タグ](../../../content-authoring-and-management/tags-and-categories/tagging-content-and-managing-tags.md) などのさまざまなコンテンツ要素に基づいて関心事項を作成します。 コンテンツリコメンデーションを生成するために、コンテンツにカテゴリとタグを追加する必要は厳密にはありません。 ただし、コンテンツを分類してタグ付けすると、Analytics Cloudはユーザーの興味を定義するためのより多くの情報を入手でき、より適切な推奨事項を提供できます。 また、 [カテゴリやタグを使用](../../../content-authoring-and-management/tags-and-categories/organizing-content-with-categories-and-tags.md) することで、おすすめしたいコンテンツを詳細に制御することができます。

```{note}
Analytics Cloudは現在、ユーザーの興味を作成するために、英語のタイトルと説明文のみを考慮します。
```

## コンテンツ推薦の設定

次の要素が設定されていれば、コンテンツ推薦は自動的に機能します。

1. [Analytics CloudがLiferay DXPインスタンスに接続され](./configuring-content-recommendations.md#connecting-analytics-cloud-to-your-liferay-dxp-instance) 、サイトコンテンツが同期されている。
2. Liferay DXPで異なるコンテンツを含む [動的コレクションを作成](./configuring-content-recommendations.md#creating-a-dynamic-collection) し、コンテンツ推薦オプションを有効にする。
3. アセットパブリッシャー、コレクション表示フラグメント、またはコレクションページを使用して、 [動的コレクションを表示](./configuring-content-recommendations.md#displaying-the-dynamic-collection) する。

```{note}
コレクションはLiferay DXP 7.2ではコンテンツセットと名付けられました。
```

コレクションまたはコンテンツセットを表示する方法は、Liferay DXPのバージョンによって異なります。 Liferay DXP 7.2では、アセットパブリッシャーを使用して表示ページにコンテンツセットを表示します。 DXP 7.3以降では、アセットパブリッシャーに加えて、コレクション表示フラグメントまたはコレクションページを使用してコレクションのコンテンツを表示できます。 コレクション、コレクションページ、およびコンテンツセットの詳細は、 [コレクションとコレクションページについて](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md) を参照してください。

サイトのコンテンツ推薦を表示する方法の詳細は、 [コンテンツ推薦の設定](./configuring-content-recommendations.md) を参照してください。

## コンテンツ推薦を実装する方法の例

コンテキストでのコンテンツ推薦を理解するために、次の例を考えてみましょう。 あなたのオンラインのキッチン用品店では、さまざまなキッチン関連商品を提供しています。 あるユーザーがサイトにアクセスし、コーヒーメーカー、コーヒーマグ、コーヒーブレンダーなどのコーヒーアクセサリと対話します。 Analytics Cloudは、ユーザーの対話に基づいて、ユーザーが関心を持つトピック（この例では「コーヒー」）を生成します。

DXPでは、動的コレクションを作成し、カトラリー、調理器具、食品貯蔵庫、コーヒーアクセサリなど、さまざまな種類の商品情報とプロモーションを含めます。 同じユーザーがこのコレクションを表示しているページにアクセスした場合、キッチン用品サイトでは、コーヒー関連の商品やプロモーションが他の種類の商品よりも優先され、このコンテンツがより目立つようにそのユーザーに表示されます。

ユーザーがコーヒー関連のコンテンツを訪問し、対話を行えば行うほど、このユーザーの個人プロファイルの中で「コーヒー」が高く関連付けられ、コーヒーに関するコンテンツリコメンデーション数が増え、他の商品のリコメンデーション数が減ります。

## コンテンツリコメンデーションとセグメント

ユーザーの行動に基づいて推奨コンテンツを表示することは、 [セグメント](../segmentation/creating-and-managing-user-segments.md) を使用してユーザーエクスペリエンスをパーソナライズすることとは異なります。 セグメントを使用する場合、ユーザーをグループに分類し、これらの特定のグループにコンテンツをターゲティングします。 セグメントベースのパーソナライゼーションでは、特定のコンテンツを特定のユーザーグループにターゲティングします。 コンテンツ推薦では、サイトでのユーザーの以前の動作に基づいてコンテンツがユーザーに自動的に推奨されるため、グループを定義する必要はありません。

ただし、 [セグメントを使用してコレクションをカスタマイズする](./personalizing-collections.md) 機能を利用して、特定のユーザーグループにコンテンツ推薦を提供できます。 たとえば、コンテンツ推薦の動的コレクションを、ドイツからの訪問者のみを含むセグメントと組み合わせることができます。 この場合、ドイツからサイトに訪問した人だけが、このコレクションからコンテンツ推薦を受け取ります。

## 関連情報

- [Liferay DXPをAnalytics Cloudに接続する](https://learn.liferay.com/ja/w/analytics-cloud/getting-started/connecting-liferay-dxp-to-analytics-cloud)
- [コンテンツ推薦の設定](./configuring-content-recommendations.md)
- [興味のあるトピックの理解](https://learn.liferay.com/ja/w/analytics-cloud/people/individuals/understanding-interests)
- [コレクションとコレクション・ページについて](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md)
