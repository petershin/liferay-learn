# About Collections and Collection Pages

```{note}
この情報はLiferay DXP 7.3以降に適用されます。 Liferayの以前のバージョンでは、コレクションはコンテンツセットと呼ばれていました。 コンテンツセットについては、 [Liferay DXP 7.2](#liferay-dxp-72) を参照してください。
```

コレクションは、情報をグループ化および絞り込みするために使用できるコンテンツ項目のセットです。 コレクションには、さまざまな種類のコンテンツを含めることも、特定の種類のコンテンツだけを含めることもできます。 そして、それらを [コレクションページ](./displaying-collections.md#displaying-collections-on-a-collection-page) に表示することができ、ページフラグメントを使用して希望の形式で表示することができます。

![Use a collection page to quickly present a specific collection in your desired format.](./about-collections-and-collection-pages/images/01.png)

次の例を考えてみましょう。 あなたは、製品のWebページに、お客様のサクセスストーリーを紹介するセクションを新設することを計画しています。 このセクションでは、新しいサクセスストーリーが公開されると自動的に表示されるようにしたいと考えています。 この場合、すべてのサクセスストーリーをグループ化したコレクションを作成し、コレクションのコンテンツを表示するコレクションページを作成することができます。 コレクションページだけでなく、コレクション表示フラグメントを使用して、このコレクションを他のコンテンツページで表示することもできます (詳細については、 [コレクションの表示](./displaying-collections.md#displaying-collections-on-a-collection-page) を参照してください)。

Liferayには2種類のコレクションがあります：

- **手動コレクション**

  コレクションの一部であるアイテムを手動で選択し、管理する。 手動コレクションの項目は自動的に変更されません。

  たとえば、 **Promotions** という名前のマニュアルコレクションを作成し、公開 Web サイトのいくつかのプロモーション Web コンテンツ記事を含めるとします。 コレクション内のアイテムを選択した後、新しいプロモーションコンテンツを手動で追加して、コレクションを最新の状態に保つ必要があります。

- **動的コレクション**

  コレクション内の項目のタイプを、これらの項目の基準とともに定義します。 コレクションのアイテムは、定義した基準に基づいて変更できます。 ダイナミックコレクションは、条件に一致する新しいアイテムでコンテンツが最新であることを確認したい場合に便利です。

  例えば、キッチン用品ストアの場合、 **porcelain** タグを持つすべてのブログ記事を含むコレクションを作成します（このタグはあなたの基準を表します）。 ダイナミック・コレクションには、 **porcelain** タグの付いたすべての新しいブログ記事が自動的に含まれます。

![Use manual collections to choose the items in the collection yourself, or dynamic collections to automatically assemble the items based on your chosen criteria.](./about-collections-and-collection-pages/images/02.png)

手動コレクションまたは動的コレクションの作成方法については、 [コレクションの作成](./creating-collections.md) を参照してください。

## コレクションの表示

コレクションを表示するには、 [コレクションページ](./displaying-collections.md#displaying-collections-on-a-collection-page) または [コレクション表示フラグメント](./displaying-collections.md#adding-a-collection-display-fragment-to-a-page) を使用します。

コレクションページは、コレクションにリンクされたページの一種です。 コレクションページは、コレクションの表示とカスタマイズを容易にします。 例えば、コレクションページを使って、コレクションに新しいアイテムをすばやく追加することができます。

![You can display your collection using a collection page](./about-collections-and-collection-pages/images/03.png)

コレクション表示フラグメントは、コレクションを表示するフラグメントの一種です。 このフラグメントを使用して、コンテンツページ、ページテンプレート、表示ページのいずれかにコレクションを表示することができます。

![You can show the collection's content using a Collection Display fragment](./about-collections-and-collection-pages/images/04.png)

詳細は、 [コレクションの表示](./displaying-collections.md) を参照してください。

## コレクションのカスタマイズ

Liferay セグメントをコレクションに関連付けると、 [セグメントの設定](../../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) に基づいて異なるコレクションアイテムを表示できます。

次の例を考えてみましょう。 あなたは、登録ユーザーに限定プロモーションを提供することで、キッチン用品ストアでの売り上げを伸ばしたいと考えています。 登録ユーザー向けのプロモーションや製品に関するニュースを含むコレクションを作成します。 商品に関するニュースはすべての人に表示したいが、プロモーションは登録ユーザーのみに限定したいと考えています。 登録ユーザーのための新しいセグメントを作成し、プロモーションコンテンツをフィルタリングする新しい **Personalized Variation** にセグメントをリンクすることができます。

詳細は、 [コレクションのパーソナライズ](../../../site-building/personalizing-site-experience/experience-personalization/personalizing-collections.md) を参照してください。

## アセットパブリッシャー設定をコレクションに変換する

コレクションは、直接、または [Asset Publisher ウィジェット](../../../site-building/displaying-content/using-the-asset-publisher-widget/displaying-assets-using-the-asset-publisher-widget.md) から作成できます。 アセットパブリッシャーオプションは、カスタマイズしたものを他のページでコレクションとして使用したい場合に便利です。 詳細は、 [コレクションの作成](./creating-collections.md#creating-a-collection-from-an-asset-publisher) をご覧してください。

## Liferay DXP 7.2

### コンテンツセットの管理

コンテンツ・セットとは、その名の通り、コンテンツ・アイテムの集合である。 つまり、管理者はコンテンツの一覧を定義して、その一覧を表示することができます。 コンテンツセットの表示方法は、それを表示するために使用される方法によって決定される。 例えば、コンテンツセットがスマートウォッチアプリで使用されている場合、単純なタイトルのリストとして表示することができ、タイトルを選択すると、接続されたモバイルデバイスに記事の全文が表示される。 同じコンテンツ・セットをウェブ・ブラウザで各記事の全内容を表示することもできる。

```{note}
以前のバージョンのLiferay DXPでは、アセットパブリッシャーを使用して、タグ、カテゴリ、アセットタイプなどの基準に基づいて、アセットの静的リストまたは動的リストのいずれかを定義および表示していました。 Liferay DXPでは、コンテンツセットは異なるタイプのアセットリストを定義するという核となる考え方を取り入れ、それを発展させたものです。 コンテンツリストは、特定のアプリケーションやウィジェットのコンテキスト外で作成され、異なるチャネルやアプリケーション間で使用および再利用することができます。
```

### コンテンツセットの作成と表示

コンテンツ・セットは、サイト管理インターフェイスで作成します。 コンテンツセットの作成と管理のためのすべての機能がここに含まれています。 コンテンツセットは、Liferayのウィジェットまたは独自のカスタムアプリケーションを使用して表示されます。 詳細は、 [コンテンツセットの作成](./creating-collections.md#creating-content-sets) および [コンテンツセットの表示](./displaying-collections.md#displaying-content-sets) を参照してください。

### コンテンツセットのパーソナライゼーション

コンテンツセットには、Liferay DXPのパーソナライズエンジンによって駆動されるバリエーションを持たせることができます。 コンテンツセットを作成した後、少なくとも1つのユーザーセグメントが作成されていれば、そのセグメント用にコンテンツセットのパーソナライズされたエクスペリエンスを作成することができます。 コンテンツ・セットにおけるエクスペリエンス・パーソナライゼーションの活用方法については、 [コンテンツ・セット・パーソナライゼーション](../../../site-building/personalizing-site-experience/experience-personalization/personalizing-collections.md#content-set-personalization) をご覧ください。

### アセットパブリッシャー設定をコンテンツセットに変換する

あなたはすでにアセットパブリッシャーを使用して、完全で精選されたコンテンツの一覧を作成するためにすでに多くの作業を行ってきたかもしれませんが、今度は作業を複製せずにその一覧を他の場所に表示したいと考えています。 コンテンツセットでそれができる。 詳しくは、 [アセット・パブリッシャの構成をコンテンツ・セットに変換する](./creating-collections.md#converting-asset-publisher-configurations-to-content-sets) の記事をお読みください。

## 関連情報

* [コレクションの作成](./creating-collections.md) 
* [コレクションの表示](./displaying-collections.md) 
* [パーソナライズ・コレクション](../../../site-building/personalizing-site-experience/experience-personalization/personalizing-collections.md) 
