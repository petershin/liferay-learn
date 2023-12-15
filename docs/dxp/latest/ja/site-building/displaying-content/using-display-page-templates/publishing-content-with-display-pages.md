# 表示ページによるコンテンツの公開

表示ページテンプレートを使用して、コンテンツアイテムをフレンドリURLで表示するための再利用可能な動的デザインを作成できます。 [テンプレート](./creating-and-managing-display-page-templates.md) をデザインした後、そのコンテンツ・タイプを表示するためのデフォルト・テンプレートにしたり、一部のコンテンツ・アイテムだけがそのテンプレートを使用するように手動で設定したりすることができます。 一度設定すると、ユーザーはそのコンテンツアイテムのフレンドリURLにアクセスすることで、その表示ページを見ることができます。 コンテンツは、テンプレートのデザインやマッピングに応じて動的にレンダリングされます。 詳しくは、 [表示ページテンプレートの使用](../using-display-page-templates.md) をご覧ください。

```{note}
同じコンテンツタイプで複数の表示ページテンプレートを作成しても、デフォルトのテンプレートは1つしか選択できません。 代替テンプレートをデフォルトとして使用するには、そのテンプレートをコンテンツアイテムに個別に割り当てる必要があります。
```
## デフォルト表示ページテンプレートを設定する

1. **サイトメニュー**(![サイトメニュー](../../../images/icon-product-menu.png))を開き、 **デザイン** &rarr; **ページテンプレート** をクリックします。

1. **表示ページテンプレート** タブをクリックします。

1. 希望するテンプレートの **Actions**(![Actions](../../../images/icon-actions.png)) をクリックし、 **Mark as Default** を選択する。

   ```{tip}
   各テンプレートのコンテンツタイプは、その名前(1)の下に記載されています。 青いチェック（2）は、どのテンプレートがデフォルトとしてマークされているかを示しています。
   ```

   ![Select a display page template as the default one for the content type using the Actions menu.](./publishing-content-with-display-pages/images/01.png)

## 個々のコンテンツアイテムに表示ページテンプレートを設定する

1. **サイトメニュー**(![サイトメニュー](../../../images/icon-product-menu.png))を開き、目的のアプリケーション(例：ウェブコンテンツ、ブログ、カテゴリー)に移動します。

1. コンテンツアイテムの編集または作成を開始します。

   ![Edit or create a content item.](./publishing-content-with-display-pages/images/02.png)

1. Propertiesタブで、 **Display Page Template** セクションを展開し、ドロップダウンメニューをクリックし、 **Specific** を選択します。

   ```{note}
   特定の表示ページテンプレートを選択しない場合、コンテンツはコンテンツタイプに対応した [デフォルトのもの](#setting-a-default-display-page-template) を使用して公開されます。
   ```

   ![Select a specific display page template to configure it.](./publishing-content-with-display-pages/images/03.png)

1. **プレビュー** をクリックすると、表示ページがどのように見えるかをプレビューできます。

1. (オプション）［プロパティ］タブで、［**フレンドリーURL**］パネルを展開し、フレンドリーURLを変更します。 表示ページテンプレートを使って、コンテンツ項目を表示するためのURLを決定します。

   ```{note}
   Liferay 7.4 U34/GA34から、表示ページテンプレートのフレームワークは、アセットのフレンドリURLの履歴を考慮します。 これは、ファイルのURL履歴に保存されているすべてのURLが、ファイルの現在のURLに自動的にリダイレクトされることを意味します。 フレンドリーURL履歴は、 [ドキュメント](../../../content-authoring-and-management/documents-and-media/uploading-and-managing/configuring-document-urls.md) と [ブログ](../../../content-authoring-and-management/blogs/displaying-blogs.md) の両方でサポートされています。
   ```

   ![You can configure the friendly URL used for your displayed content.](./publishing-content-with-display-pages/images/04.png)

1. ［**公開**］ をクリックします。

設定が完了すると、Liferayはテンプレートを使用して、コンテンツ項目をその固有のフレンドリURLで表示します。 必要であれば、コンテンツの **Actions** ボタン（ [Actions](../../../images/icon-actions.png) ）をクリックし、 **Preview** または **View Content** を選択することで、いつでもコンテンツの表示ページをプレビューすることができます。

**Preview** は表示ページのテンプレート・コンテキストにコンテンツを表示し、 **View Content** はコンテンツ・アイテムのフレンドリーURLにリダイレクトします。

![Preview your content in the context of the display page template or view the Display Page using the content's Action menu.](./publishing-content-with-display-pages/images/05.png)

## 関連トピック

[表示ページテンプレートの使用](../using-display-page-templates.md) 

[表示ページテンプレートの作成と管理](./creating-and-managing-display-page-templates.md) 
