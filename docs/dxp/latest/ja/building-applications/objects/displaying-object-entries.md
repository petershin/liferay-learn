# オブジェクトエントリーの表示

{bdg-secondary}`7.4以降で利用可能`

Liferay Objectでは、既存のDXPフレームワークを使用して、オブジェクトエントリをサイト内に動的に表示できます。 これには、複数のエントリーのコレクション表示や、個々のエントリーの表示ページが含まれます。

オブジェクトが公開されると、Liferayはコレクションプロバイダーを作成します。このコレクションプロバイダーを [コレクション表示フラグメント](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#adding-a-collection-display-fragment-to-a-page) で使用することで、複数のオブジェクトエントリーを表示できます。 また、コレクションをスタイル、フィルター、ページ分割するようフラグメントを設定できます。 詳細は、 [Collection Providers によるオブジェクトエントリの表示](./displaying-object-entries-with-collection-providers.md) を参照してください。

また、公開されたオブジェクトは情報フレームワークに統合されているので、[表示ページテンプレート](../../site-building/displaying-content/using-display-page-templates.md)のコンテンツの種類として選択することができます。 これを選択すると、オブジェクトがテンプレートのマッピングソースとして設定されるため、フラグメントフィールドをオブジェクトフィールドにマッピングしやすくなり、個々のオブジェクトエントリーの柔軟なページ表示を作成することができます。

さらに、FreeMarkerを使用して、 [オブジェクトの情報テンプレート](#creating-information-templates-for-objects) を作成できます。 作成したら、フラグメントフィールドをテンプレートにマップして、コンテンツページと表示ページでエントリーがどのようにレンダリングされるかを決定できます。

```{note}
情報テンプレートは、コンテンツ表示フラグメントおよびオブジェクトにマップできる[sub-elements](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md)を持つその他のフラグメント（テキスト、リッチテキストなど）で使用できます。
```

これらの統合により、パーソナライズされたユーザーエクスペリエンスを提供しながら、ユーザーはLiferayのWYSIWYGページ構築機能を活用できます。

## オブジェクトの表示ページテンプレートの作成

作成時、各オブジェクトエントリーには、次のパターンを使用する専用のフレンドリURLが自動的に割り当てられます： `server-address/l/objectEntryId` （例: `https://mysite.com/l/44337`）。 エントリーをそのURLで表示するには、まずオブジェクトの表示ページテンプレートを作成する必要があります。

次の手順を実行します：

1. **サイトメニュー**(![Site Menu](../../images/icon-menu.png))を開き、 ［**Design**］ を展開し、 ［**Page Templates**］ に進みます。

1. ［**Display Page Templates**］ タブをクリックします。

1. **追加** ボタン（![Add Button](../../images/icon-add.png)）をクリックし、 **空白** のテンプレートを選択します。

   これにより、モーダルウィンドウが開きます。

1. **名前** を入力し、コンテンツの種類に目的の **オブジェクト** を選択します。

   ![名前を入力し、コンテンツの種類に目的のオブジェクトを選択します](./displaying-object-entries/images/01.png)

1. ［**保存**］ をクリックします。

   これにより、選択したオブジェクトをデフォルトのマッピングソースとする空白のテンプレートが作成され、テンプレートの編集ページにリダイレクトされます。

1. ページフラグメントとウィジェットを使用して、オブジェクトエントリーの柔軟で動的な表示を作成します。 詳しくは、 [表示ページテンプレートの使用](../../site-building/displaying-content/using-display-page-templates.md) をご覧ください。

   ![フラグメント要素をオブジェクトフィールドにマップして、個々のエントリーの表示ページに動的に入力します。](./displaying-object-entries/images/02.png)

1. ページコメントウィジェットを追加し、エンドユーザーがエントリー表示ページにコメントできるようにします。

   ```{note}
   オブジェクト定義のコメントを有効にする必要があります。 そうでない場合は、ウィジェットは表示ページで非表示になります。
   ```

1. 完了したら、 ［**Publish**］ をクリックします。

1. テンプレートの **アクション** ボタン (![Actions Button](../../images/icon-actions.png)) をクリックし、 ［**Mark as Default**］ を選択します。

   このテンプレートは、ユーザーがフレンドリURLにアクセスするたびに、オブジェクトのエントリーをレンダリングするために使用されます。

   ![テンプレートのアクションボタンをクリックし、［Mark as Default］を選択します。](./displaying-object-entries/images/03.png)

### コメントの有効化

1. ［**グローバルメニュー**］（![Global Menu](../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動して、 ［**オブジェクト**］ をクリックします。

1. オブジェクト定義を編集します。

1. ［Details］タブで、コメントを有効にし、 ［**Save**］ をクリックします。

   ![コメントを有効にします。](./displaying-object-entries/images/04.png)

## オブジェクトの情報テンプレートの作成

1. **サイトメニュー**（![Site Menu](../../images/icon-product-menu.png)）を開き、 ［**デザイン**］ &rarr; ［**Templates**］ &rarr; ［**Information Templates**］ に移動します。

1. **追加**（![Add Button](../../images/icon-add.png)） をクリックします。

1. **名前** を入力し、目的の **オブジェクト** を選択します。

   ![名前を入力し、目的のオブジェクトを選択します。](./displaying-object-entries/images/05.png)

1. ［**保存**］ をクリックします。 これにより、テンプレートデザインページにリダイレクトされます。

1. （オプション）アプリケーションバーのアクション（![Actions Button](../../images/icon-actions.png)）をクリックし、 ［**Import Script**］ を選択して、インポートする`.ftl`ファイルを選択します。 これにより、現在のテンプレートがファイルのFreeMarkerスクリプトに置き換えられます。

   ![.ftlファイルからスクリプトをインポートします。](./displaying-object-entries/images/06.png)

1. [FreeMarker](https://freemarker.apache.org) を使用してテンプレートをデザインします。

   ［**Elements**］ サイドパネル（![Elements](../../images/icon-list-ul.png)）で、選択したオブジェクトの構造から使用可能なフィールドにアクセスできます。

   ![オブジェクトの構造で使用可能なフィールドから選択します。](./displaying-object-entries/images/07.png)

1. （オプション）［Properties］サイドパネル（![Properties](../../images/icon-cog3.png)）のテンプレートに説明または画像を追加します。

   ![［Properties］パネルに説明または画像を追加します。](./displaying-object-entries/images/08.png)

1. 完了したら、 ［**Save**］ をクリックします。

オブジェクトエントリーをフラグメントフィールドにマッピングするときに、テンプレートから選択できるようになりました。

![フラグメント要素をマッピングするときにテンプレートを選択します。](./displaying-object-entries/images/09.png)

## ナビゲーションメニューへのエントリの追加

オブジェクトは情報フレームワークと統合されているため、ナビゲーションメニューにオブジェクトのエントリを追加して、素早くアクセスできるようにすることができます。 すべての公開オブジェクトは、メニュー要素で利用可能なソースとして自動的に表示されます。 詳しくは、 [ナビゲーションメニューのアプリケーションを使う](../../site-building/site-navigation/using-the-navigation-menus-application.md) をご覧ください。

## 関連トピック

* [オブジェクトの作成](./creating-and-managing-objects/creating-objects.md)
* [コレクション・プロバイダによるオブジェクト・エントリの表示](./displaying-object-entries-with-collection-providers.md)
* [コレクションとコレクションページについて](../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)
* [表示ページテンプレートの使用](../../site-building/displaying-content/using-display-page-templates.md)
