# コレクションとコレクションページについて

```{note}
この情報はLiferay DXP 7.3以降に適用されます。 Liferayの以前のバージョンでは、コレクションはコンテンツセットと呼ばれていました。 コンテンツセットについては、 [Liferay DXP 7.2](#liferay-dxp-7-2) を参照してください。
```

コレクションは、情報をグループ化および絞り込みするために使用できるコンテンツ項目のセットです。 コレクションには、さまざまな種類のコンテンツ、または特定の1種類のコンテンツだけを含めることができます。 そして、それらを [コレクションページ](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#displaying-collections-on-a-collection-page) に表示し、ページフラグメントを使用して希望のフォーマットで表示することができます。

![コレクションページでは、特定のコレクションをご希望のフォーマットですばやく表示できます。](./about-collections-and-collection-pages/images/01.png)

次の例を考えてみましょう。 あなたは、製品のWebページに、お客様のサクセスストーリーを紹介するセクションを新設することを計画しています。 このセクションでは、新しいサクセスストーリーが公開されると自動的に表示されるようにしたいと考えています。 この場合、すべての成功事例をグループ化したコレクションを作成し、コレクションの内容を表示するコレクションページを作成することができます。 コレクションページだけでなく、コレクション表示フラグメントを使用して、他のコンテンツページでこのコレクションを表示することができます（詳しくは、 [コレクションの表示](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#displaying-collections-on-a-collection-page) をご覧ください）。

Liferayには、2種類のコレクションがあります。

- **手動コレクション**

    コレクションの一部である項目を手動で選択し、管理します。 手動コレクションの項目は、自動的に変更されません。

    たとえば、 **Promotions** という名前のマニュアルコレクションを作成し、公開 Web サイトのいくつかのプロモーション Web コンテンツの記事を含めるとします。 コレクション内のアイテムを選択した後、コレクションを最新の状態に保つために、新しいプロモーションコンテンツを手動で追加する必要があります。

- **動的コレクション**

    コレクション内の項目のタイプを、これらの項目の基準とともに定義します。 コレクションの項目は、定義した基準に基づいて変更することができます。 ダイナミックコレクションは、条件に一致する新しいアイテムでコンテンツを最新に保ちたい場合に有効です。

    たとえば、キッチン用品店の場合、 **porcelain** タグを持つすべてのブログ記事を含むコレクションを作成します（このタグはあなたの基準を表します）。 ダイナミックコレクションは、 **porcelain** タグを持つすべての新しいブログ記事を自動的に含めます。

![コレクション内のアイテムを自分で選択するマニュアルコレクションと、選択した条件に基づいてアイテムを自動的に組み立てるダイナミックコレクションを使用します。](./about-collections-and-collection-pages/images/02.png)

手動または動的コレクションの作成方法については、「 [コレクションの作成」](./creating-collections.md)を参照してください。

## コレクションの表示

[コレクションページ](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#displaying-collections-on-a-collection-page) または [コレクション表示フラグメント](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#adding-a-collection-display-fragment-to-a-page) を使用して、コレクションを表示することができます。

コレクションページとは、コレクションにリンクしているページの一種です。 コレクションページでは、コレクションの表示やカスタマイズを簡単に行うことができます。 例えば、コレクションページを使って、新しいアイテムを素早くコレクションに追加することができます。

![コレクションページを使用して、コレクションを表示することができます](./about-collections-and-collection-pages/images/03.png)

コレクション表示フラグメントは、コレクションを表示するフラグメントの一種です。 このフラグメントを使用すると、任意のコンテンツページ、ページテンプレート、または表示ページでコレクションを表示することができます。

![コレクション表示フラグメントを使用して、コレクションのコンテンツを表示することができます。](./about-collections-and-collection-pages/images/04.png)

詳細は、 [コレクションの表示](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md) を参照してください。

## コレクションのカスタマイズ

Liferay セグメントをコレクションに関連付けると、 [セグメントの設定](../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md)に基づいて異なるコレクションアイテムを表示することができます。

次の例を考えてみましょう。 あなたは、登録ユーザーに限定プロモーションを提供することで、キッチン用品ストアでの売り上げを伸ばしたいと考えています。 登録ユーザー向けのプロモーションや、製品に関するニュースなどを含むコレクションを作成します。 商品に関するニュースはすべての人に表示したいが、プロモーションは登録ユーザーのみに限定したいと考えています。 登録ユーザー向けの新しいセグメントを作成し、プロモーションコンテンツをフィルタリングする新しい **Personalized Variation** にセグメントをリンクさせることができます。

詳細は、[コレクションのパーソナライズ](../../site-building/personalizing-site-experience/experience-personalization/personalizing-collections.md)を参照してください。

## アセットパブリッシャー設定をコレクションに変換する

コレクションは直接、または [Asset Publisher ウィジェット](../../site-building/displaying-content/using-the-asset-publisher-widget/displaying-assets-using-the-asset-publisher-widget.md)から作成することができます。 Asset Publisherオプションは、カスタマイズしたものを他のページでコレクションとして使用したい場合に便利です。 詳細は、 [コレクションの作成](./creating-collections.md#creating-a-collection-from-an-asset-publisher) をご覧してください。

## Liferay DXP 7.2

### コンテンツセットの管理

コンテンツ・セットとは、その名の通り、コンテンツ・アイテムの集合のことです。 つまり、管理者はコンテンツの一覧を定義して、その一覧を表示することができます。 コンテンツセットの表示方法は、その表示方法によって決定される。 例えば、コンテンツセットがスマートウォッチアプリで利用されている場合、単純なタイトル一覧として表示し、タイトルを選択すると接続されたモバイル端末に記事全文が表示されるようにすることができる。 同じコンテンツセットをウェブブラウザで表示すると、各記事の全内容を表示することができる。

```{note}
以前のバージョンのLiferay DXPでは、アセットパブリッシャーを使用して、タグ、カテゴリ、アセットタイプなどの基準に基づいて、アセットの静的リストまたは動的リストのいずれかを定義および表示していました。 Liferay DXPでは、コンテンツセットは、異なるタイプのアセットリストを定義するという核となる考えを持ち、それを発展させたものです。 コンテンツリストは、特定のアプリケーションやウィジェットのコンテキストに関係なく作成され、異なるチャネルやアプリケーションで使用したり再利用したりすることができます。
```

### コンテンツセットの作成と表示

コンテンツセットは、サイト管理インターフェイスで作成します。 コンテンツセットを作成・管理するための機能は、すべてここに含まれています。 コンテンツセットは、Liferayのウィジェットまたは独自のカスタムアプリケーションを使用して表示されます。 詳細は、 [コンテンツセットの作成](./creating-collections.md#creating-content-sets) および [コンテンツセットの表示](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#displaying-content-sets) を参照してください。

### コンテンツセットのパーソナライゼーション

コンテンツセットは、Liferay DXPのパーソナライゼーションエンジンによって駆動されるバリエーションを持つことができます。 コンテンツ・セットを作成した後、少なくとも1つのユーザー・セグメントが作成されていれば、そのセグメントに対して、コンテンツ・セットのパーソナライズされたエクスペリエンスを作成することができます。 コンテンツセットに対するエクスペリエンスパーソナライゼーションの活用方法については、 [コンテンツセットのパーソナライゼーション](../../site-building/personalizing-site-experience/experience-personalization/personalizing-collections.md#content-set-personalization) をご覧ください。

### アセットパブリッシャー設定をコンテンツセットに変換する

あなたはすでにアセットパブリッシャーを使用して、完全で精選されたコンテンツの一覧を作成するためにすでに多くの作業を行ってきたかもしれませんが、今度は作業を複製せずにその一覧を他の場所に表示したいと考えています。 コンテンツセットでそれができる。 詳しくは、 [Converting Asset Publisher Configuration to Content Sets](./creating-collections.md#converting-asset-publisher-configurations-to-content-sets) の記事をご覧ください。

## 関連情報

- [コレクションの作成](./creating-collections.md)
- [コレクションの表示](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md)
- [コレクションのパーソナライズ](../../site-building/personalizing-site-experience/experience-personalization/personalizing-collections.md)
