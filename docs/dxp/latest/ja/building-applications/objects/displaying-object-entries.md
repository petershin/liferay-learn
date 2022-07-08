# オブジェクトエントリの表示

{bdg-secondary}`7.4以降で利用可能`

Liferay Objectでは、既存のDXPフレームワークを使用して、オブジェクトエントリをサイト内に動的に表示できます。 これには、複数のエントリーのコレクション表示や、個々のエントリーの表示ページが含まれます。

オブジェクトが公開されると、Liferayはコレクションプロバイダーを作成します。このコレクションプロバイダーを [コレクション表示フラグメント](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#adding-a-collection-display-fragment-to-a-page) で使用することで、複数のオブジェクトエントリーを表示できます。 また、コレクションをスタイル、フィルター、ページ分割するようフラグメントを設定できます。 また、公開されたオブジェクトはInfo Frameworkに統合されているので、 [表示ページテンプレート](../../site-building/displaying-content/using-display-page-templates/about-display-page-templates-and-display-pages.md)のコンテンツタイプとして選択することができます。 これを選択すると、オブジェクトがテンプレートのマッピングソースとして設定されるため、フラグメントフィールドをオブジェクトフィールドにマッピングしやすくなり、個々のオブジェクトエントリーの柔軟なページ表示を作成することができます。

さらに、FreeMarkerを使用して、[オブジェクトの情報テンプレート](#creating-information-templates-for-objects)を作成できます。 作成したら、フラグメントフィールドをテンプレートにマップして、コンテンツページと表示ページでエントリーがどのようにレンダリングされるかを決定できます。

```{note}
情報テンプレートは、コンテンツ表示フラグメントおよびオブジェクトにマップできる[sub-elements](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md)を持つその他のフラグメント（テキスト、リッチテキストなど）で使用できます。
```

これらの統合により、パーソナライズされたユーザーエクスペリエンスを提供しながら、ユーザーはLiferayのWYSIWYGページ構築機能を活用できます。

## オブジェクトのコレクションプロバイダーの使用

オブジェクトを公開した後、以下の手順でコレクション表示フラグメントを使用してオブジェクトのエントリーを表示します。

1. 新しい [コンテンツページ](../../site-building/creating-pages/using-content-pages.md) または [表示ページテンプレート](../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md)を作成します。 または、既存のページを*編集*（![編集ボタン](../../images/icon-edit-pencil.png)）することから開始します。

   ```{note}
   また、コレクションプロバイダーを使ってコレクションページを作成することもできます。 詳しくは、[コレクションとコレクションページについて](../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)をご覧ください。
   ```

1. *コレクション表示*フラグメントを*［Fragments and Widgets］*（![Fragments and Widgets](../../images/icon-plus.png)）サイドバーからページまたはテンプレートにドラッグアンドドロップします。

   ![コレクション表示フラグメントをページまたはテンプレートにドラッグアンドドロップします。](./displaying-object-entries/images/01.png)

1. ［*コレクション表示フラグメント*］ を選択して設定オプションにアクセスし、［General］タブの ［*Select Collection* ］をクリックします。

   ![フラグメントを選択し、［コレクションを選択］をクリックします。](../objects/displaying-object-entries/images/02.png)

1. モーダルウィンドウで、 *［Collection Providers］*タブをクリックし、*オブジェクトのプロバイダー*を選択します。

   ![［Collection Providers］タブで、オブジェクトのプロバイダーを選択します。](./displaying-object-entries/images/03.png)

1. (オプション) どのオブジェクトエントリーを表示するかフィルタリングします。 オブジェクト内の任意のピックリストまたはブール値フィールドでフィルタリングすることができます。

   これを行うには、 *［Collection Options］*ボタン(![Collection Options Button](../../images/icon-actions.png))をクリックし、 *［Filter Collection］*を選択します。

   ![［Collection Options］ボタンをクリックして、［Filter Collection］を選択します。](./displaying-object-entries/images/04.png)

   次に、 目的の*フィルター*を選択し、 *［Apply］*をクリックします。

   ![適用するフィルターを選択します。](./displaying-object-entries/images/05.png)

目的のプロバイダを選択した後、追加のフラグメントオプションを使用して、オブジェクトエントリーの表示方法を決定します。これには、［ *List Style*］ および［ *Pagination*］が含まれます。

![フラグメントオプションを使用して、オブジェクトエントリーの表示方法を決定します。](./displaying-object-entries/images/06.png)

## オブジェクトの表示ページテンプレートの作成

1. *サイトメニュー*（![Site Menu](../../images/icon-menu.png)）を開きます。 *［デザイン］* &rarr; *［ページテンプレート］*に移動し、*［表示ページテンプレート］*タブをクリックします。

1. *追加*ボタン（![Add Button](../../images/icon-add.png)）をクリックし、*空白* のテンプレートを選択します。

   これにより、モーダルウィンドウが開きます。

1. *名前*を入力し、コンテンツの種類に目的の*オブジェクト*を選択します。

   ![名前を入力し、コンテンツの種類に目的のオブジェクトを選択します](./displaying-object-entries/images/07.png)

1. *［保存］*をクリックします。

保存されると、選択されたオブジェクトがテンプレートのマッピングソースとして設定され、テンプレートの編集画面にリダイレクトされます。 ここでは、オブジェクトフィールドにマッピングするフラグメントを使って、個々のオブジェクトエントリーのページ表示を柔軟にデザインすることができます。 詳しくは、 [表示ページテンプレートの使用](../../site-building/displaying-content/using-display-page-templates/about-display-page-templates-and-display-pages.md) をご覧ください。

![フラグメント要素をオブジェクトフィールドにマップして、個々のエントリーの表示ページに動的に入力します。](./displaying-object-entries/images/08.png)

## オブジェクトの情報テンプレートの作成

1. *サイトメニュー*（![Site Menu](../../images/icon-product-menu.png)）を開き、*［デザイン］* &rarr; *［Templates］* &rarr; *［Information Templates］*に移動します。

1. *追加*ボタン（![Add Button](../../images/icon-add.png)）をクリックします。

1. *名前*を入力し、目的の*オブジェクト*を選択します。

   ![名前を入力し、目的のオブジェクトを選択します。](./displaying-object-entries/images/09.png)

1. *［保存］* をクリックします。 これにより、テンプレートデザインページにリダイレクトされます。

1. （オプション）アプリケーションバーのアクションボタン（![Actions Button](../../images/icon-actions.png)）をクリックし、*［Import Script］*を選択して、インポートする`.ftl`ファイルを選択します。 これにより、現在のテンプレートがファイルのFreeMarkerスクリプトに置き換えられます。

   ![.ftlファイルからスクリプトをインポートします。](./displaying-object-entries/images/10.png)

1. [FreeMarker](https://freemarker.apache.org)を使用してテンプレートをデザインします。

   *［Elements］*サイドパネル（![Elements](../../images/icon-list-ul.png)）で、選択したオブジェクトの構造から使用可能なフィールドにアクセスできます。

   ![オブジェクトの構造で使用可能なフィールドから選択します。](./displaying-object-entries/images/11.png)

1. （オプション）［Properties］サイドパネル（![Properties](../../images/icon-cog3.png)）のテンプレートに説明または画像を追加します。

   ![［Properties］パネルに説明または画像を追加します。](./displaying-object-entries/images/12.png)

1. 完了したら、*［Save］*をクリックします。

オブジェクトエントリーをフラグメントフィールドにマッピングするときに、テンプレートから選択できるようになりました。

![フラグメント要素をマッピングするときにテンプレートを選択します。](./displaying-object-entries/images/13.png)

## 追加情報

* [オブジェクトの作成](./creating-and-managing-objects/creating-objects.md)
* [コレクションとコレクションページについて](../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)
* [表示ページテンプレートと表示ページについて](../../site-building/displaying-content/using-display-page-templates/about-display-page-templates-and-display-pages.md)
