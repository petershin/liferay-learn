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

公開されたカスタムObjectはLiferayのコアフレームワークと統合されているため、Liferayの機能を活用してプラットフォーム全体で統一された体験を構築することが可能です。 この図は、Objects がこれらの統合をどのように活用しているかの概要を示しています。

| フレームワーク   | Description                                                                                                                                                                                                                                                                                                                                                                                                                           |
|:--------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| アセット      | [添付ファイルフィールド](./creating-and-managing-objects/fields/attachment-fields.md) を使用して、インスタンスのドキュメントライブラリにファイルをアップロードします。                                                                                                                                                                                                                                                                                                                   |
| 監査        | [Auditアプリケーション](./creating-and-managing-objects/auditing-object-definition-events.md) を使用して、オブジェクトのイベントをユーザーとリソースの情報とともに確認することができます。                                                                                                                                                                                                                                                                                                  |
| カテゴリの設定   | カスタムオブジェクトのレイアウトにカテゴライズツールを追加し、ユーザーがエントリに [タグとカテゴリ](./creating-and-managing-objects/layouts/designing-object-layouts.md#adding-categorization) を追加できるようにします。                                                                                                                                                                                                                                                                          |
| ヘッドレス     | Liferayは、公開されたObjectごとに [ヘッドレスエンドポイント](./understanding-object-integrations/headless-framework-integration.md) を生成するので、RESTコールをすることができます。 <!-- TASK: Add GraphQL when supported.--> |
| 情報フレームワーク | オブジェクトデータを使用する [表示ページテンプレート](../../site-building/displaying-content/using-display-page-templates.md), [フラグメント](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments.md), [ナビゲーションメニュー](../../site-building/site-navigation/using-the-navigation-menus-application.md). また、Liferayはそのエントリーを表示するために、 [Collection Provider](../../content-authoring-and-management/collections-and-collection-pages.md) を作成します。 |
| ローカライズ    | オブジェクト定義のフィールドをローカライズすることで、グローバルなユーザーへの対応が可能になります。                                                                                                                                                                                                                                                                                                                                                                                    |
| 権限の設定     | アプリケーションとリソースの権限を管理し、オブジェクト定義とそのデータへのアクセスを制御します。                                                                                                                                                                                                                                                                                                                                                                                      |
| ワークフロー    | オブジェクトのカスタムワークフローを有効にし、オブジェクトエントリーの作成、レビュー、公開を指示します。                                                                                                                                                                                                                                                                                                                                                                                  |

<!-- TASK: Add the following integrations when ready -->
<!-- | Job Scheduler | Use the [Job Scheduler](../core-frameworks/job-scheduler-framework/using-job-scheduler.m) application to run Talend data integration tasks (e.g., bulk imports, data syncs). You can run them manually or schedule them to run at regular intervals. |-->
<!-- | Publications |  | -->

```{raw} html
:file: ../../landingpage_template.html
```

```{raw} html
:file: understanding-object-integrations/landing.html
```
