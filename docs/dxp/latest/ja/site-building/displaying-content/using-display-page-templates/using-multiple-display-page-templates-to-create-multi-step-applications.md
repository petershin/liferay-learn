# 複数の表示ページ・テンプレートを使用してマルチステップ・アプリケーションを作成する

{bdg-secondary}`Liferay 2023.Q4+/GA102+`

表示ページのテンプレートは、専用のURLにコンテンツを表示します。 このURLを使ってコンテンツを表示するには、まず、それを表示するためのテンプレートを定義しなければならない。

一般的に、デフォルトの表示ページテンプレートは、特定のコンテンツタイプに設定されます。 ただし、複数の表示ページテンプレートを同じコンテンツタイプに関連付け、それらのオプションのいずれかをリンクにマッピングすることはできます。 これは、ユーザーが複数のステップでアプリケーション（例えば、カスタムオブジェクト [からマッピングされた](../../../building-applications/objects/using-fragments-to-build-forms.md) フォーム）を作成できることを意味します。 複数の表示テンプレートを使用することで、各ステップが異なる表示ページテンプレートにリンクされるため、複数のステップを持つフォームを作成できます。

表示ページテンプレート、オブジェクト、フォームコンテナフラグメントを使用して、ユーザーがオブジェクトエントリを追加し、別のページで編集できるページを作成できます。 そのためには、 [カスタムオブジェクト](#tasks-custom-object) 、オブジェクトエントリーを編集するための [表示ページテンプレート](#edit-display-page-template) 、ユーザーが新しいオブジェクトエントリーを入力し、既存のオブジェクトエントリーのリストを見ることができる [コンテンツページ](#content-page-to-display-the-application) を作成する必要があります。

## タスクカスタムオブジェクト

1. [カスタムオブジェクト](../../../building-applications/objects/creating-and-managing-objects/creating-objects.md) を作成し、それに **Task** というラベルを付ける。

1. **タスク** オブジェクトをクリックする。

1. Fields "タブで、 **Description** というテキスト・タイプのフィールドを追加する。

1. Actions "タブで **Action** を追加し、 **Edit** とラベルを付ける。

1. アクションビルダーで、トリガーとして **Standalone** を選択します。

   このオプションにより、 [アクションをボタン](../../../building-applications/objects/creating-and-managing-objects/actions/using-manual-actions.md#mapping-buttons-to-object-actions-in-content-pages) にマッピングすることができます。

1. Actionとして **Update an Object Entry** を選択する。

   このオプションは、トリガーがアクティブになるたびに、選択された値を使用してオブジェクトエントリを更新します。

1. Valuesの **Add** をクリックし、 **Description** フィールドを選択します。 New Value」の下に「**description**」（フィールド名）を入力します。 これは、オブジェクトエントリーの Description フィールドの値を新しい値に置き換えます。

   ![Create the Edit action to update the object description value](./using-multiple-display-page-templates-to-create-multi-step-applications/images/01.png)

1. **エラーメッセージ** を追加し、**保存** をクリックします。

1. Detailsタブで、オブジェクトの **Scope** を選択し、右上の **Publish** をクリックします。

これでオブジェクトは公開され、コンテンツページや表示ページテンプレートのフォームコンテナ・フラグメントを使ってフォームを生成することができます。

![Creating the Task object](./using-multiple-display-page-templates-to-create-multi-step-applications/images/02.gif)

## アプリケーションを表示するコンテンツページ

1. [コンテンツページの作成](../../creating-pages/adding-pages/adding-a-page-to-a-site.md) . 空白のテンプレートを使用し、ページ名を「タスクリスト*」とします。

1. **グリッド** フラグメントをページに追加する。 それをクリックし、右のパネルで **モジュール数** を_2*に設定する。

1. フラグメントとウィジェット」サイドバーで、「フォームコンテナ」フラグメントを探します。 左のグリッド・モジュールにドラッグ・アンド・ドロップし、「**なし**」をクリックして、タスク・オブジェクトにマッピングする。

   左のグリッドモジュールで、ユーザーはオブジェクトに新しいエントリーを追加できる。

1. **フォーム コンテナ** フラグメントをクリックし、成功インタラクションを **ページに留まる** に設定します。

   ユーザーがオブジェクトにエントリーを追加すると、ページは更新されるが、それ以外は何も起こらない。

1. 右のグリッドモジュールに **Heading** フラグメントを追加する。 編集するには、それをダブルクリックする。 見出しに「タスクリスト*」と入力する。

1. 右のグリッド・モジュールの見出しの下に、 **Collection Display** フラグメントを追加する。 フラグメントをクリックする。「全般」タブで「コレクション*」をクリックする。

   右のグリッドモジュールでは、ユーザーはタスクのリストを見ることができます。

1. Collection Providers タブで、 **Tasks** を選択します。

   Collection Provider は、Tasks のエントリを任意の方法で表示します。

1. Collection Provider に **Grid** を追加し、右側のパネルで **Number of Modules** を **two** に設定します。

   ![The grids are marked in red.](./using-multiple-display-page-templates-to-create-multi-step-applications/images/03.png)

1. コレクション表示の左グリッドモジュールに **Heading** フラグメントを追加し、それを2回クリックします。 マッピングタブで、フィールドとして説明を選択する。

   このアクションはDescriptionフィールドに追加されたテキストをHeadingコンテンツとしてマッピングします。

1. コレクション表示の右グリッドモジュールに **ボタン** フラグメントを追加し、テキストを2回クリックして編集します。 テキストを **Edit** に変更する。

1. ページを公開する

ページを表示し、オブジェクトのエントリーを追加し、タスクのリストが更新されるのを見ることはできるが、まだ不完全である。 [Edit display page template](#edit-display-page-template) を作成し、ユーザーをEdit display page templateに誘導するために、Editボタンをページにマッピングする必要があります。

![Creating a content page to display the application](./using-multiple-display-page-templates-to-create-multi-step-applications/images/04.gif)

## 表示ページテンプレートを編集

1. [表示ページ・テンプレート](./creating-and-managing-display-page-templates.md) を作成し、名前を **Edit** とし、コンテンツ・タイプとして **Task** を選択する。

   表示ページテンプレートがタスクオブジェクトに関連付けられました。

1. フラグメントとウィジェット」サイドバーで、「フォームコンテナ」フラグメントを探します。 ページにドラッグ・アンド・ドロップし、「**なし**」をクリックし、タスク・オブジェクトにマッピングする。

   選択されたオブジェクト定義のフィールドを使用して、フォームが自動的に生成されます。

   ```{warning}
   マスターページテンプレートのフォームフィールドが表示ページに入力されない。 表示ページのマスターページにオブジェクトにリンクされたフォームコンテナを追加した場合、オブジェクトに関連するフォームフィールドを視覚化することはできません。
   ```

1. フォームコンテナを選択します。 Success Interactionを **Go to Page** に設定し、List of Tasksページを選択する。

   フォームが送信されると、タスク一覧ページが表示されます。

1. **Submit** ボタンを2回クリックしてください。 Fieldで、 **Edit** アクションを選択する。

   ユーザーが[送信]ボタンをクリックすると、[タスクのリスト]ページが表示され、[編集]アクションが有効になり、以前の[説明]値が新しく追加された値に置き換えられます。

```{tip}
表示ページテンプレートでフォームコンテナフラグメントが有効になりました。 フォームコンテナフラグメントを編集して、入力フラグメントのサブセットのみを使用することもできます。 そして、オブジェクト・エントリーが更新されると、利用可能なフィールドだけが更新される。

フラグメントを適当に編集し、フォームコンテナフラグメントをコンポジションとして保存して、コンテンツページと表示ページの両方で使用できるようにします。
```

![Creating the Edit display page template](./using-multiple-display-page-templates-to-create-multi-step-applications/images/05.gif)

## 表示ページテンプレートに関するSEOの考慮点

表示ページがデフォルトとしてマークされている場合、

   - `Sitemap.xml`のコンフィギュレーションは有効で、顧客は要件に応じてカスタマイズできる（破壊的な変更はない）。

   - デフォルトの表示ページが特定の表示ページとしてマップされると、`<head>`セクションに`rel="canonical"`という属性を持つ`<link> ` 要素が追加されます。

表示ページがデフォルトとしてマークされていない場合、これらの変更は自動的に行われる：

   - 表示ページが`Sitemap.xml`にインデックスされていない。

   - ロボットの設定が無効になっている。

   - 値`"noindex, nofollow"`はRobots設定で設定する。

   - 他のページから表示ページテンプレートへのリンクがある場合は、テンプレートの `<a>` タグに `rel="nofollow"` 属性を追加します。

   - 同じオブジェクトにデフォルトとマークされた表示ページが存在する場合、`<head>` セクションに `rel="canonical"` という属性とともに `<link>` 要素が追加され、デフォルトの表示ページテンプレートをカノニカルページとして指し示す。

![SEO configuration page for the display page template.](./using-multiple-display-page-templates-to-create-multi-step-applications/images/06.png)

## 申請結果

出来上がったアプリケーションを使用する前に

1. 仕事一覧のコンテンツページで、 **編集** ボタンを2回クリックします。

1. リンク]タブで、[リンク]の下にある[マップされたURL]を選択し、[表示ページテンプレートの編集]を選択します。

   編集]ボタンをクリックすると、[編集]表示ページテンプレートが表示され、そこでエントリーを編集してフォームを再送信し、[タスクリスト]コンテンツページに戻ることができます。

1. タスク一覧ページを公開する。

これで、タスク一覧ページにアクセスし、アプリケーションをテストすることができます。 ページの左側にタスクの説明を追加する。 ページが更新され、コレクション表示の右側に新しいタスクの説明が表示されます。

編集」ボタンをクリックすると、そのエントリーを編集できる「編集」表示ページに移動します。 submitをクリックすると、List of Tasksページに戻ります。

```{tip}
最初のステップとして表示ページ・テンプレートを作成し、フォーム・コンテナのサクセス・インタラクションを次の表示ページ・テンプレートを指す「エントリー表示ページに移動」に設定することができます。 これにより、連鎖したマルチステップ・フォームが作成される。
```

![Testing your resulting application.](./using-multiple-display-page-templates-to-create-multi-step-applications/images/07.gif)

## 関連トピック

[フラグメントを使ってフォームを構築する](../../../building-applications/objects/using-fragments-to-build-forms.md)

[オブジェクトの作成](../../../building-applications/objects/creating-and-managing-objects/creating-objects.md)

[サイトへのページの追加](../../creating-pages/adding-pages/adding-a-page-to-a-site.md)

[表示ページテンプレートの作成と管理](./creating-and-managing-display-page-templates.md)
