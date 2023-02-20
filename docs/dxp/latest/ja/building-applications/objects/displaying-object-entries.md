# オブジェクトエントリの表示

{bdg-secondary}`7.4以降で利用可能`

Liferay Objectでは、既存のDXPフレームワークを使用して、オブジェクトエントリをサイト内に動的に表示できます。 これには、複数のエントリーのコレクション表示や、個々のエントリーの表示ページが含まれます。

Object が発行されると、Liferay は [Collection Display フラグメント](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#adding-a-collection-display-fragment-to-a-page) で使用するための Collection Provider を作成し、複数の Object エントリを表示するようにします。 また、コレクションをスタイル、フィルター、ページ分割するようフラグメントを設定できます。 また、公開されたオブジェクトはInfo Frameworkに統合されているので、 [表示ページテンプレート](../../site-building/displaying-content/using-display-page-templates.md)のコンテンツタイプとして選択することができます。 これを選択すると、オブジェクトがテンプレートのマッピングソースとして設定されるため、フラグメントフィールドをオブジェクトフィールドにマッピングしやすくなり、個々のオブジェクトエントリーの柔軟なページ表示を作成することができます。

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

1. モーダルウィンドウで、 *コレクションプロバイダ* タブをクリックし、 *オブジェクトのプロバイダ*を選択します。

   ![［Collection Providers］タブで、オブジェクトのプロバイダーを選択します。](./displaying-object-entries/images/03.png)

1. (オプション) どのオブジェクトエントリーを表示するかフィルタリングします。 オブジェクト内の任意のピックリストまたはブール値フィールドでフィルタリングすることができます。

   これを行うには、 *［Collection Options］*ボタン(![Collection Options Button](../../images/icon-actions.png))をクリックし、 *［Filter Collection］*を選択します。

   ![Collection Options ボタンをクリックし、Filter Collection を選択します。](./displaying-object-entries/images/04.png)

   次に、 目的の*フィルター*を選択し、 *［Apply］*をクリックします。

   ![適用するフィルターを選択します。](./displaying-object-entries/images/05.png)

目的のプロバイダを選択した後、追加のフラグメントオプションを使用して、オブジェクトエントリーの表示方法を決定します。これには、［ *List Style*］ および［ *Pagination*］が含まれます。

![フラグメントオプションを使用して、オブジェクトエントリーの表示方法を決定します。](./displaying-object-entries/images/06.png)

## オブジェクトの表示ページテンプレートの作成

作成時、各 Object エントリには、次のパターンを使用する専用のフレンドリー URL が自動的に割り当てられます： `server-address/l/objectEntryId` （例: `https://mysite.com/l/44337`）。 エントリーをそのURLで表示するには、まずオブジェクトの表示ページテンプレートを作成する必要があります。

次の手順を実行します：

1. *サイトメニュー* (![Site Menu](../../images/icon-menu.png)) を開き、 *デザイン*を展開し、 *ページテンプレート*に進みます。

1. *［Display Page Templates］*タブをクリックします。

1. *追加*ボタン（![Add Button](../../images/icon-add.png)）をクリックし、*空白* のテンプレートを選択します。

   これにより、モーダルウィンドウが開きます。

1. *名前*を入力し、コンテンツの種類に目的の*オブジェクト*を選択します。

   ![名前を入力し、コンテンツの種類に目的のオブジェクトを選択します](./displaying-object-entries/images/07.png)

1. *［Save］* をクリックします。

   これにより、選択したObjectをデフォルトのマッピングソースとする空白のテンプレートが作成され、テンプレートの編集ページにリダイレクトされます。

1. ページフラグメントとウィジェットを使用して、オブジェクトエントリの柔軟で動的な表示を作成できます。 詳しくは、 [表示ページテンプレートの使用](../../site-building/displaying-content/using-display-page-templates.md) をご覧ください。

   ![フラグメント要素をオブジェクトフィールドにマップして、個々のエントリーの表示ページに動的に入力します。](./displaying-object-entries/images/08.png)

1. ページコメント」ウィジェットを追加し、エンドユーザーがエントリー表示ページにコメントできるようにしました。

   ```{note}
   オブジェクト定義のコメントを有効にする必要があります。 そうでない場合は、ウィジェットは表示ページで非表示になります。
   ```

1. 完了したら、*［公開］*をクリックします。

1. テンプレートの *アクション* ボタン (![Actions Button](../../images/icon-actions.png)) をクリックし、 *デフォルトとしてマーク*を選択します。

   このテンプレートは、ユーザーがフレンドリーURLにアクセスするたびに、Objectのエントリーをレンダリングするために使用されるようになりました。

   ![テンプレートのActionsボタンをクリックし、Mark as Defaultを選択します。](./displaying-object-entries/images/09.png)

### コメントの有効化

1. *［グローバルメニュー］* （![Global Menu](../../images/icon-applications-menu.png)）を開き、 *［コントロールパネル］*タブに移動して、*［オブジェクト］*をクリックします。

1. オブジェクトの定義を編集する。

1. 詳細]タブでコメントを有効にし、[ *保存]*をクリックします。

   ![コメントを有効にする。](./displaying-object-entries/images/10.png)

## オブジェクトの情報テンプレートの作成

1. *サイトメニュー*（![Site Menu](../../images/icon-product-menu.png)）を開き、*［デザイン］* &rarr; *［Templates］* &rarr; *［Information Templates］*に移動します。

1. クリック *追加* (![Add Button](../../images/icon-add.png))

1. *名前*を入力し、目的の*オブジェクト*を選択します。

   ![名前を入力し、目的のオブジェクトを選択します。](./displaying-object-entries/images/11.png)

1. *［Save］* をクリックします。 これにより、テンプレートデザインページにリダイレクトされます。

1. (オプション) アプリケーションバーのアクション (![Actions Button](../../images/icon-actions.png)) をクリックし、 *スクリプトのインポート*を選択し、インポートする `.ftl` ファイルを選択します。 これにより、現在のテンプレートがファイルのFreeMarkerスクリプトに置き換えられます。

   ![.ftlファイルからスクリプトをインポートします。](./displaying-object-entries/images/12.png)

1. [FreeMarker](https://freemarker.apache.org)を使用してテンプレートをデザインします。

   *［Elements］*サイドパネル（![Elements](../../images/icon-list-ul.png)）で、選択したオブジェクトの構造から使用可能なフィールドにアクセスできます。

   ![オブジェクトの構造で使用可能なフィールドから選択します。](./displaying-object-entries/images/13.png)

1. （オプション）［Properties］サイドパネル（![Properties](../../images/icon-cog3.png)）のテンプレートに説明または画像を追加します。

   ![［Properties］パネルに説明または画像を追加します。](./displaying-object-entries/images/14.png)

1. 完了したら、*［Save］*をクリックします。

オブジェクトエントリーをフラグメントフィールドにマッピングするときに、テンプレートから選択できるようになりました。

![フラグメント要素をマッピングするときにテンプレートを選択します。](./displaying-object-entries/images/15.png)

## ナビゲーションメニューへのエントリの追加

オブジェクトは情報フレームワークと統合されているため、ナビゲーションメニューにオブジェクトのエントリを追加して、素早くアクセスできるようにすることができます。 公開されたすべてのオブジェクトは、メニュー要素で使用可能なソースとして自動的に表示されます。 詳しくは、 [Using the Navigation Menus Application](../../site-building/site-navigation/using-the-navigation-menus-application.md) をご覧ください。

## 追加情報

* [オブジェクトの作成](./creating-and-managing-objects/creating-objects.md)
* [コレクションとコレクションページについて](../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)
* [表示ページテンプレートの使用](../../site-building/displaying-content/using-display-page-templates.md)
