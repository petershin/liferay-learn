---
toc:
  - ./knowledge-base/importing-knowledge-base-articles.md
  - ./knowledge-base/creating-knowledge-base-articles.md
  - ./knowledge-base/managing-the-knowledge-base.md
  - ./knowledge-base/knowledge-base-templates.md
  - ./knowledge-base/responding-to-knowledge-base-feedback.md
  - ./knowledge-base/knowledge-base-display-widget.md
  - ./knowledge-base/other-knowledge-base-widgets.md
  - ./knowledge-base/knowledge-base-system-settings.md
  - ./knowledge-base/developer-guide.md
---
# ナレッジベース（管理）

{bdg-secondary}`liferay 7.4 U72+/GA72+`.

ナレッジベースは、製品ドキュメントを作成・管理するためのツールを提供します。 Liferay UIで記事を書いたり、既存のMarkdownファイルをインポートすることができます。 さらに、 [テンプレート](./knowledge-base/knowledge-base-templates.md) を作成して、記事の構成や内容を標準化することもできる。 [ワークフロー](../process-automation/workflow/introduction-to-workflow.md) を有効にすることで、記事は公開前に承認プロセスを通過します。

![Create and manage product documentation.](./knowledge-base/images/01.png)

公開後は、 [ナレッジベースウィジェット](./knowledge-base/knowledge-base-display-widget.md) を使って、ドキュメントの階層や個々のセクションや記事を表示することができます。 あるいは、 [表示ページテンプレート](../site-building/displaying-content/using-display-page-templates.md) 、 [情報テンプレート](../site-building/displaying-content/using-information-templates.md) 、 [フラグメン ト](../site-building/creating-pages/page-fragments-and-widgets/using-fragments.md) を使用して、ナレッジベースの記事を表示およびスタイル設定できます。 内蔵コメントにより、ユーザーは記事 [フィードバック](./knowledge-base/responding-to-knowledge-base-feedback.md) を残すことができ、ナレッジベース内で管理・追跡することができます。

さらに、MarkdownファイルをインポートしてGitHubのようなサービスでホスティングしている場合、インポートした記事の [ソースURL](./knowledge-base/importing-knowledge-base-articles.md#setting-a-source-url) を有効にすることができます。 一度設定すると、Knowledge Baseは各記事にEdit on GitHubボタンを追加し、ユーザーはソースリポジトリで記事のMarkdownを閲覧できるようになります。

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} ナレッジベース記事の作成
:link: ./knowledge-base/creating-knowledge-base-articles.md
:::

:::{grid-item-card} Importing Knowledge Base Articles
:link: ./knowledge-base/importing-knowledge-base-articles.md
:::

:::{grid-item-card} ナレッジベースの管理
:link: ./knowledge-base/managing-the-knowledge-base.md
:::

:::{grid-item-card} ナレッジベーステンプレート
:link: ./knowledge-base/knowledge-base-templates.md
:::

:::{grid-item-card} ナレッジベースフィードバックへの対応
:link: ./knowledge-base/responding-to-knowledge-base-feedback.md
:::

:::{grid-item-card} ナレッジベース表示ウィジェット
:link: ./knowledge-base/knowledge-base-display-widget.md
:::

:::{grid-item-card} その他のナレッジベースウィジェット
:link: ./knowledge-base/other-knowledge-base-widgets.md
:::

:::{grid-item-card} ナレッジベースシステム設定
:link: ./knowledge-base/knowledge-base-system-settings.md
:::

:::{grid-item-card} 開発者ガイド
:link: ./knowledge-base/developer-guide.md
:::
::::