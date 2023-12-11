# オブジェクトエントリーの表示

{bdg-secondary}`liferay 7.4+`

Liferay Objectでは、既存のDXPフレームワークを使用して、オブジェクトエントリをサイト内に動的に表示できます。 これには、複数のエントリーのコレクション表示や、個々のエントリーの表示ページが含まれます。

オブジェクトが公開されると、Liferayはコレクションプロバイダーを作成します。このコレクションプロバイダーを [コレクション表示フラグメント](../../site-building/displaying-content/collections-and-collection-pages/displaying-collections.md#adding-a-collection-display-fragment-to-a-page) で使用することで、複数のオブジェクトエントリーを表示できます。 また、コレクションをスタイル、フィルター、ページ分割するようフラグメントを設定できます。 詳細は、 [Collection Providers によるオブジェクトエントリの表示](./displaying-object-entries-with-collection-providers.md) を参照してください。

また、公開されたオブジェクトは情報フレームワークに統合されているので、 [表示ページテンプレート](../../site-building/displaying-content/using-display-page-templates.md) のコンテンツの種類として選択することができます。 これを選択すると、オブジェクトがテンプレートのマッピングソースとして設定されるため、フラグメントフィールドをオブジェクトフィールドにマッピングしやすくなり、個々のオブジェクトエントリーの柔軟なページ表示を作成することができます。

さらに、FreeMarkerを使用して、 [オブジェクトの情報テンプレート](#creating-information-templates-for-objects) を作成できます。 作成したら、フラグメントフィールドをテンプレートにマップして、コンテンツページと表示ページでエントリーがどのようにレンダリングされるかを決定できます。

```{note}
情報テンプレートは、コンテンツ表示フラグメントや、 [サブエレメント](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md) （テキスト、リッチテキストなど）を持つ、オブジェクトにマッピング可能なその他のフラグメントで使用することができます。
```

これらの統合により、パーソナライズされたユーザーエクスペリエンスを提供しながら、ユーザーはLiferayのWYSIWYGページ構築機能を活用できます。

## オブジェクトの表示ページテンプレートの作成

作成されると、各Objectエントリには自動的に次のパターンを使用する専用のフレンドリ ーなURLが割り当てられます：`server-address/l/objectEntryId`（例：`https://mysite.com/l/44337`）。 エントリーをそのURLで表示するには、まずオブジェクトの表示ページテンプレートを作成する必要があります。

次の手順を実行します：

1. [サイトメニュー](../../images/icon-menu.png))を開き、_デザイン_を展開し、_ページテンプレート_に移動します。

1. *表示ページテンプレート*タブをクリックします。

1. *追加*ボタン(![追加ボタン](../../images/icon-add.png))をクリックし、_空白_テンプレートを選択します。

   これにより、モーダルウィンドウが開きます。

1. _名前_を入力し、コンテンツタイプに必要な_オブジェクト*を選択します。

   ![Enter a name and select the desired Object for Content Type](./displaying-object-entries/images/01.png)

1. ［_保存_］をクリックします。

   これにより、選択したオブジェクトをデフォルトのマッピングソースとする空白のテンプレートが作成され、テンプレートの編集ページにリダイレクトされます。

1. ページフラグメントとウィジェットを使用して、オブジェクトエントリーの柔軟で動的な表示を作成します。 詳しくは、 [表示ページテンプレートの使用](../../site-building/displaying-content/using-display-page-templates.md) をご覧ください。

   ![Map fragment elements to Object fields to dynamically populate Display Pages for individual entries.](./displaying-object-entries/images/02.png)

1. ページコメントウィジェットを追加し、エンドユーザーがエントリー表示ページにコメントできるようにします。

   ```{note}
   オブジェクト定義のコメントを有効にする必要があります。 そうでない場合は、ウィジェットは表示ページで非表示になります。
   ```

1. 完了したら、_Publish_をクリックします。

1. テンプレートの_Actions_ボタン(![Actions Button](../../images/icon-actions.png)) をクリックし、_Mark as Default_を選択します。

   このテンプレートは、ユーザーがフレンドリURLにアクセスするたびに、オブジェクトのエントリーをレンダリングするために使用されます。

   ![Click the Actions button for the template and select Mark as Default.](./displaying-object-entries/images/03.png)

### コメントの有効化

1. グローバルメニュー(![グローバルメニュー](../../images/icon-applications-menu.png))を開き、_コントロールパネル_タブに移動し、_オブジェクト_をクリックします。

1. オブジェクト定義を編集します。

1. Detailsタブでコメントを有効にし、_Save_をクリックする。

   ![Enable comments.](./displaying-object-entries/images/04.png)

## オブジェクトの情報テンプレートの作成

1. サイトメニュー](../../images/icon-product-menu.png))を開き、_デザイン_ &rarr; _テンプレート_ &rarr; _情報テンプレート_に移動します。

1. 追加*をクリック(![追加ボタン](../../images/icon-add.png))

1. 名前_を入力し、目的の_オブジェクト*を選択します。

   ![Enter a name and select the desired Object.](./displaying-object-entries/images/05.png)

1. ［_保存_］をクリックします。 これにより、テンプレートデザインページにリダイレクトされます。

1. (オプション) アプリケーションバーのアクション(![アクションボタン](../../images/icon-actions.png))をクリックし、_スクリプトのインポート_を選択し、インポートする`.ftl`ファイルを選択します。 これにより、現在のテンプレートがファイルのFreeMarkerスクリプトに置き換えられます。

   ![Import script from an .ftl file.](./displaying-object-entries/images/06.png)

1. [FreeMarker](https://freemarker.apache.org) を使用してテンプレートをデザインします。

   *Elements*サイドパネル（[Elements](../../images/icon-list-ul.png)）では、選択したObjectの構造から利用可能なフィールドにアクセスすることができます。

   ![Select from available fields in the Object's structure.](./displaying-object-entries/images/07.png)

1. (オプション) プロパティサイドパネルでテンプレートに説明や画像を追加します (![Properties](../../images/icon-cog3.png)).

   ![Add a description or image in the Properties panel.](./displaying-object-entries/images/08.png)

1. 終了したら、_保存_をクリックします。

オブジェクトエントリーをフラグメントフィールドにマッピングするときに、テンプレートから選択できるようになりました。

![Select the template when mapping fragment elements.](./displaying-object-entries/images/09.png)

## ナビゲーションメニューへのエントリの追加

オブジェクトは情報フレームワークと統合されているため、ナビゲーションメニューにオブジェクトのエントリを追加して、素早くアクセスできるようにすることができます。 すべての公開オブジェクトは、メニュー要素で利用可能なソースとして自動的に表示されます。 詳しくは、 [Using the Navigation Menus Application](../../site-building/site-navigation/using-the-navigation-menus-application.md) をご覧ください。

## 関連トピック

* [Creating Objects](./creating-and-managing-objects/creating-objects.md)
* [コレクションプロバイダーによるオブジェクトエントリーの表示](./displaying-object-entries-with-collection-providers.md)
* [コレクションとコレクション・ページについて](../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md)
* [表示ページテンプレートの使用](../../site-building/displaying-content/using-display-page-templates.md)
