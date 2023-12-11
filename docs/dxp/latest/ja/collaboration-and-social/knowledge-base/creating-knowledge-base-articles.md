# ナレッジベース記事の作成

{bdg-secondary}`liferay 7.4 U72+/GA72+`.

ナレッジベースは、記事のリポジトリを作成・管理するためのツールを提供します。 アプリケーションのWYSIWYGエディタを使うか、ZIPアーカイブのMarkdownファイル(`.markdown`, `.md`)としてインポートすることで記事を作成することができます。

![Create and manage a repository of articles.](./creating-knowledge-base-articles/images/01.png)

## エディターでの記事の作成

1. [サイトメニュー](../../images/icon-menu.png)を開き、_コンテンツとデータ_ &rarr; _ナレッジベース_に移動します。

1. [フォルダと記事](../../images/icon-pages-tree.png))で、_追加_(![追加ボタン](../../images/icon-add.png))をクリックし、_基本記事_を選択します。

   [記事テンプレート](./knowledge-base-templates.md) を作成した場合、代わりにそれを選択することができます。

   ![Click Add and select the desired article template.](./creating-knowledge-base-articles/images/02.png)

1. 記事のタイトルを入力してください。

1. 記事の内容を入力する。 記事のHTMLソースを表示または編集するには、エディタで_ソース_ボタン（！[Source](../../images/icon-code.png)）をクリックします。

   ![Enter content for the article.](./creating-knowledge-base-articles/images/03.png)

1. (オプション）記事に添付ファイルを追加する。

1. (オプション) 記事の [表示ページテンプレート](../../site-building/displaying-content/using-display-page-templates.md) を選択する。 この設定はナレッジベース記事のデフォルトの表示ページテンプレートを上書きします。

1. (オプション) [タグ](../../content-authoring-and-management/tags-and-categories/tagging-content-and-managing-tags.md) または [カテゴリ](../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) を記事に追加し、視認性と整理性を向上させます。

1. (オプション）有効期限とレビュー日を設定します。 デフォルトでは、記事の有効期限が切れたり、レビューが必要になることはありません。 詳しくは [ナレッジベースの管理](./managing-the-knowledge-base.md) をご覧ください。

1. (任意）資産と記事を関連づける。

1. 記事のフレンドリーURLを設定する。 デフォルトでは、URLはタイトル・フィールドと一致するが、手動で変更することもできる。

    ```{important}
    記事を保存または公開した後、そのフレンドリーURLを変更することはできません。
    ```
1. (オプション）記事のパーミッションを設定する。 デフォルトでは、閲覧権限はGuestロールに割り当てられ、誰でも記事を閲覧することができます。

1. 掲載する場合は_Publish_を、後で修正する場合は_Save as Draft_をクリックしてください。

保存されると、その記事は「フォルダと記事」セクションに表示されます。 Knowledge Baseのワークフローを有効にしている場合、記事は公開される前に承認プロセスを通過する必要があります。

## Markdownファイルのインポート

必要であれば、ナレッジベースの記事をMarkdownファイル (`.markdown`, `.md`) としてインポートすることができます。 そのためには、各Markdownファイルが適切にフォーマットされ、ZIPアーカイブにパッケージされていることを確認する必要があります。 インポートされた記事は自動的にHTMLに変換され、記事とフォルダのセクションに表示されます(![フォルダと記事](../../images/icon-pages-tree.png))。 詳細な手順については、 [ナレッジベース記事のインポート](./importing-knowledge-base-articles.md) を参照してください。

## 関連トピック

* [ナレッジベースの管理](./managing-the-knowledge-base.md)
* [ナレッジベース記事のインポート](./importing-knowledge-base-articles.md)
