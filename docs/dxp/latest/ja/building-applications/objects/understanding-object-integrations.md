---
toc:
- ./understanding-object-integrations/permissions-framework-integration.md
- ./understanding-object-integrations/headless-framework-integration.md
- ./understanding-object-integrations/assets-framework-integration.md
---
# オブジェクト統合を理解する

```{toctree}
:maxdepth: 3

understanding-object-integrations/permissions-framework-integration.md
understanding-object-integrations/headless-framework-integration.md
understanding-object-integrations/assets-framework-integration.md
```

公開されたカスタムオブジェクトはLiferayのコアフレームワークと統合されているため、Liferayの機能を活用してプラットフォーム全体で統一されたエクスペリエンスを構築できます。 この表は、Objects がこれらの統合をどのように活用しているかの概要を示しています。

| フレームワーク   | Description                                                                                                                                                                                                                                                                                                                                                                                                                           |
|:--------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| アセット      | インスタンスのドキュメントライブラリにファイルをアップロードするには、 [Attachment フィールド](./creating-and-managing-objects/fields/attachment-fields.md) を使用します。                                                                                                                                                                                                                                                                                                           |
| 監査        | [Audit アプリケーション](./creating-and-managing-objects/auditing-object-definition-events.md) を使用して、Object イベントとそのユーザー情報およびリソース情報を確認します。                                                                                                                                                                                                                                                                                                     |
| カテゴリの設定   | カスタムオブジェクトレイアウトにカテゴリ分類ツールを追加し、ユーザーがエントリに [タグとカテゴリ](./creating-and-managing-objects/layouts/designing-object-layouts.md#adding-categorization) を追加できるようにしました。                                                                                                                                                                                                                                                                          |
| ヘッドレス     | Liferay は、各公開 Object に対して [ヘッドレスエンドポイント](./understanding-object-integrations/headless-framework-integration.md) を生成するので、REST コールを行うことができます。 <!-- TASK: Add GraphQL when supported.--> |
| 情報フレームワーク | Objectデータを使用する [表示ページテンプレート](../../site-building/displaying-content/using-display-page-templates.md), [フラグメント](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments.md), [ナビゲーションメニュー](../../site-building/site-navigation/using-the-navigation-menus-application.md). Liferay はまた、そのエントリーを表示するために [Collection Provider](../../content-authoring-and-management/collections-and-collection-pages.md) を作成します。 |
| ローカライズ    | オブジェクト定義のフィールドをローカライズすることで、世界中のユーザーにより良いサービスを提供することができます。                                                                                                                                                                                                                                                                                                                                                                             |
| 権限の設定     | アプリケーションとリソースのパーミッションを管理し、オブジェクト定義とそのデータへのアクセスを制御します。                                                                                                                                                                                                                                                                                                                                                                                 |
| ワークフロー    | オブジェクトのカスタムワークフローを有効にし、オブジェクトエントリの作成、レビュー、公開を指示します。                                                                                                                                                                                                                                                                                                                                                                                   |

<!-- TASK: Add the following integrations when ready -->
<!-- | Job Scheduler | Use the \[Job Scheduler\](../core-frameworks/dispatch-framework/using-job-scheduler.md) application to run Talend data integration tasks (e.g., bulk imports, data syncs). You can run them manually or schedule them to run at regular intervals. |--><!-- | Publications |  | -->

```{raw} html
:file: ../../landingpage_template.html
```

```{raw} html
:file: understanding-object-integrations/landing.html
```
