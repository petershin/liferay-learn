---
toc:
  - ./understanding-object-integrations/permissions-framework-integration.md
  - ./understanding-object-integrations/using-custom-object-apis.md
  - ./understanding-object-integrations/assets-framework-integration.md
---
# オブジェクト統合を理解する

公開されたカスタムオブジェクトはLiferayのコアフレームワークと統合されているため、Liferayの機能を活用してプラットフォーム全体で統一されたエクスペリエンスを構築できます。 下表は、オブジェクトがこうした統合をどのように活用するかの概要を示しています。

| フレームワーク        | 説明                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| :------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| アセット           | [Attachment フィールド](./creating-and-managing-objects/fields/attachment-fields.md) を使用して、インスタンスのドキュメント・ライブラリにファイルをアップロードします。                                                                                                                                                                                                                                                                                                                                                 |
| 監査             | [Audit アプリケーション](./creating-and-managing-objects/auditing-object-events.md) または REST API を使用して、カスタムオブジェクト定義の入力履歴を有効にして監査します。                                                                                                                                                                                                                                                                                                                                              |
| カテゴリー設定        | カスタムオブジェクトレイアウトにカテゴリー化ツールを追加し、ユーザーがエントリーに [タグやカテゴリー](./creating-and-managing-objects/layouts/designing-object-layouts.md#adding-categorization) を追加できるようにしました。                                                                                                                                                                                                                                                                                                            |
| ヘッドレス          | Liferay は各公開オブジェクトに対して [ヘッドレスエンドポイント](./understanding-object-integrations/using-custom-object-apis.md) を生成するので、REST 呼び出しを行うことができます。 <!-- TASK: Add GraphQL when supported.-->                                                                                                                                                                                                                                                                                             |
| 情報             | [表示ページ・テンプレート](../../site-building/displaying-content/using-display-page-templates.md) , [フラグメント](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments.md) , [ナビゲーション・メニュー](../../site-building/site-navigation/using-the-navigation-menus-application.md) でオブジェクト・データを使用する。 Liferay はまた、そのエントリーを表示するために [Collection Provider](../../content-authoring-and-management/collections-and-collection-pages.md) を作成します。 |
| ローカライズ         | オブジェクト定義のフィールドをローカライズすることで、グローバルユーザーにより良いサービスを提供できます。                                                                                                                                                                                                                                                                                                                                                                                                                                |
| 権限の設定          | アプリケーションとリソースのアクセス許可を管理し、オブジェクト定義とそのデータへのアクセスを制御します。                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| ユーザー関連データ（UAD） | オブジェクト定義とエントリでユーザー関連データを管理します。 詳細については、 [ユーザーデータの管理（GDPR）](../../users-and-permissions/managing-user-data.md) を参照してください。                                                                                                                                                                                                                                                                                                                                                  |
| ワークフロー         | オブジェクトのカスタムワークフローを有効にして、オブジェクトエントリの作成、レビュー、公開を指示します。                                                                                                                                                                                                                                                                                                                                                                                                                                 |

<!-- TASK: Add the following integrations when ready -->

<!-- | Job Scheduler | Use the [Job Scheduler](../core-frameworks/job-scheduler-framework/using-job-scheduler.m) application to run Talend data integration tasks (e.g., bulk imports, data syncs). You can run them manually or schedule them to run at regular intervals. |-->

<!-- | Publications |  | -->

```{raw} html
:file: ../../landingpage_template.html
```

```{raw} html
:file: understanding-object-integrations/landing.html
```
