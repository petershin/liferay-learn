# Personalizing Collections

{bdg-secondary}`liferay Portal 7.3 GA6 / DXP 7.3+ が利用可能です。`

デフォルトでは、どのユーザーもコレクションのすべてのコンテンツを見ることができ、誰でもパーソナライズされたバリエーションの一部となります。 しかし、 [セグメント](../segmentation/creating-and-managing-user-segments.md) を使って、コレクションのアイテムのパーソナライズされたバリエーションを作ることができる。 パーソナライズされたバリエーションを使用すると、コレクションの一部であるアイテムは変更されませんが、コレクションページ、コレクション表示フラグメント、またはアセット表示ウィジェットは、セグメント用にフィルタリングされたアイテムを表示します。

```{important}
セグメントを使用してコレクションをカスタマイズし、コレクションにパーソナライズされたバリエーションを設定するには、まずセグメントを定義する必要があります。 詳細については、 [ユーザーセグメントの作成と管理](../segmentation/creating-and-managing-user-segments.md) を参照してください。
```

![Collections are available for anyone, by default](./personalizing-collections/images/01.png)

次の例を考えてみましょう。 あなたは、登録ユーザーに限定プロモーションを提供することで、オンラインのキッチン用品ストアでの売り上げを伸ばしたいと考えています。 登録ユーザー向けのプロモーションや製品に関するニュースを含むコレクションを作成します。 商品に関するニュースはすべての人に表示したいが、プロモーションは登録ユーザーのみに限定したいと考えています。 この例では、登録ユーザーのための新しいセグメントを作成し、プロモーションコンテンツをフィルタリングする新しいパーソナライズされたバリエーションにセグメントをリンクすることができます。

```{tip}
コレクションに複数のパーソナライズされたバリエーションを作成し、必要に応じて編集または削除できます。 また、Anyoneパーソナライズドバリエーションを編集することはできますが、削除することはできません。
```

## パーソナライズされたバリエーションを作る

ユーザーのために [セグメント](../segmentation/creating-and-managing-user-segments.md) を作成したら、それらのセグメントに基づいてコレクションにパーソナライズされたバリエーションを追加できます。

1. サイトメニュー( ![サイトメニュー](../../../images/icon-applications-menu.png))を開き、_サイトビルダー_ &rarr; _コレクション_ に移動します。

1. [コレクション](../../../site-building/displaying-content/collections-and-collection-pages/creating-collections.md) を作成するか、既存のものを選択する。

1. *Add Personalized Variation*をクリックします。

   すでにパーソナライズされたバリエーションがあり、他の利用可能なセグメントがある場合は、パーソナライズされたバリエーションの横にある_追加_（[追加アイコン](../../../images/icon-add-app.png)）をクリックして、新しいパーソナライズされたバリエーションを追加します。

1. セグメントを選択し、それに応じてコレクションをカスタマイズします。

[パーソナライズされたバリエーションの優先順位付け](#personalizing-collections) または [全セグメントからのコレクションエントリーの組み合わせ](#combining-collection-entries-from-all-segments) によって、ユーザーが見ることができるものをコントロールできるようになりました。

## バリエーションの優先順位付け

{bdg-secondary}`liferay DXP 7.4+で利用可能です。`

ユーザーが複数のセグメントに属している場合、 [ユーザーが属しているすべてのセグメントからのコレクションエントリ](#combining-collection-entries-from-all-segments) を組み合わせたり、パーソナライズされたバリエーションに優先順位をつけたりして、どのパーソナライズされたバリエーションをユーザーに表示するかを決定することができます。

コレクションを編集する際、パーソナライズされたバリエーションのソート可能なリストにアクセスし、その_Actions_ボタン( ![Actions button](../../../images/icon-actions.png) )をクリックして、_Prioritize_または_Deprioritize_を選択することで、バリエーションのランクを変更することができます。 また、バリエーションをドラッグ＆ドロップして優先順位を並べ替えることもできる。

```{note}
優先順位は、リスト内の各項目の位置に応じて割り当てられる。 最優先されるのはリストの一番上のポジションだ。
```

![Prioritize collections variations to determine which variation is displayed for users](./personalizing-collections/images/02.png)

## 全セグメントからのコレクションエントリーを組み合わせる

複数の [セグメント](../segmentation/creating-and-managing-user-segments.md) に属するユーザについては、デフォルトのエントリまたは [優先された](#prioritizing-variations) パーソナライズされたバリエーションのみを表示するのではなく、そのユーザが属するすべてのセグメントからコレクションエントリを組み合わせて表示することができます。

1. *グローバルメニュー* ( ![アプリケーションメニューアイコン](../../../images/icon-applications-menu.png))を開き、_コントロールパネル_ タブ &rarr; _システム設定_ の下の設定を選択します。

1. コンテンツとデータ」で*資産*を選択する。

1. システム・スコープで、_コレクション_を選択します。

1. ダイナミック・コレクションとマニュアル・コレクションの機能を有効にします。

1. ［_保存_］をクリックします。

![Enable the feature to combine assets from all segments in asset publisher for dynamic and manual collections.](./personalizing-collections/images/03.png)

複数のセグメントに属するユーザーは、すべてのセグメントのコンテンツを見ることができるようになりました。

例えば、3つのセグメントがあります：登録ユーザー、ブラジル人ユーザー、カナダ人ユーザー。 登録ユーザーであれば、そのセグメントで選択されたコンテンツのみが表示されます。 ブラジルとカナダのユーザーも同様だ。 ただし、ブラジル在住の登録ユーザーであれば、両方のセグメントで選択されたコンテンツを見ることができます。 どのセグメントにも属していない場合は、「誰でも」に設定されたコンテンツが表示される。

![Users that belong to multiple segments can see content from all segments](./personalizing-collections/images/04.png)

## Liferay DXP 7.2

### コンテンツセットのパーソナライゼーション

では、 [セグメント](../segmentation/creating-and-managing-user-segments.md) を使って、コンテンツセットのパーソナライズを実演してみましょう。 この例では、ホームページにデフォルトで表示されるコンテンツセットを作成します。 次に、それを変更して、American Engineersセグメントのメンバー向けの技術記事を含む個人用バリエーションを作成します。

コンテンツ・セットについてご存じない方は、 [コンテンツ・セットの作成](../../../site-building/displaying-content/collections-and-collection-pages/creating-collections.md#creating-content-sets) の記事をご覧ください。

#### デフォルトのコンテンツセットの作成と設定

まずデフォルトのコンテンツセットを作成し、アセットパブリッシャーを使ってホームページに設定します。

1. *Site Menu* ( ![Site Menu](../../../images/icon-applications-menu.png) ) を開き、_Content and Data_ &rarr; _Content Sets_ に移動します。

1. *追加* ( ![Add](../../../images/icon-add.png) ) をクリックし、*手動選択* を選択します。

1. *ホームページ・コンテンツ*と名付ける。

1. 新しいコンテンツセットでは、アセットエントリーの横にある*選択*をクリックし、*基本ウェブコンテンツ*を選択します。

   ![Click Select to add a new asset entry.](./personalizing-collections/images/05.png)

1. 基本ウェブコンテンツの選択ページで、追加したいコンテンツを選択し、_追加_をクリックします。

1. ホーム・ページに移動し、アセット・パブリッシャー・ウィジェットをページに追加します。

1. アセット・パブリッシャの[設定]を開きます。

1. Asset Selectionで_Content Set_を選択します。

1. Select Content Setで_Select_をクリックし、_Home Page Content_を選択し、_Save_をクリックします。

これで、設定したコンテンツ・セットがホームページのAsset Publisherウィジェットに表示されるようになりました。 次に、パーソナライズ用のコンテンツセットを設定します。

#### コンテンツセットのパーソナライズ

次に、技術者向けのコンテンツセットを作成し、その表示を構成します。

1. サイト管理からコンテンツセットに戻る。

1. *New Personalized Variation*をクリックし、American Engineersセグメントを選択する。

   ![Create a new personalized variation.](./personalizing-collections/images/06.png)

1. Asset Entriesの横にある_Select_をクリックし、_Basic Web Content_を選択します。

1. エンジニアの読者に適した記事を選択し、_追加_をクリックします。

これで、アメリカのエンジニアセグメントのメンバーがこのコンテンツセットを表示するときはいつでも、デフォルトではなく、パーソナライズされたバージョンが表示されるようになりました。 シミュレーターを使ってテストしてみましょう。

## 関連情報

* [コンテンツページのパーソナライズ](./content-page-personalization.md)
* [コレクションとコレクション・ページについて](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md)
* [ユーザーセグメントの作成](../segmentation/creating-and-managing-user-segments.md)
* [ユーザーセグメントへのロールの割り当て](../../../users-and-permissions/roles-and-permissions/assigning-roles-to-user-segments.md)
