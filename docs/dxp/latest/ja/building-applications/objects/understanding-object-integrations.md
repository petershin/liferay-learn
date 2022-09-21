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
understanding-object-integrations/assets-framework-integrations.md
```

公開されたカスタムオブジェクトはLiferayのコアフレームワークと統合されているため、Liferayの機能を活用してプラットフォーム全体で統一されたエクスペリエンスを構築できます。 この表は、Objects がこれらの統合をどのように活用しているかの概要を示しています。

| フレームワーク|  説明文 | 
| :--- | :--- |
| アセット| [添付ファイルフィールド](../objects/understanding-object-field-types.md#attachment) を使用して、インスタンスのドキュメントライブラリにファイルをアップロードしてください。 |
| 監査 | [監査アプリケーション](./creating-and-managing-objects/auditing-object-definition-events.m) を使用して、ユーザーとリソース情報を含むオブジェクト イベントを確認します。 |  
| カテゴライズ | カスタムオブジェクトのレイアウトにカテゴライズツールを追加し、ユーザーがエントリに[タグとカテゴリ](./creating-and-managing-objects/designing-object-layouts.md#adding-categorization) を追加できるようになりました。|
| ヘッドレス | Liferayは各公開Objectに対して[ヘッドレスエンドポイント](./understanding-object-integrations/headless-framework-integration.md) を生成するので、RESTコールをすることができます。 <!-- TASK: Add GraphQL when supported.--> ｜
| Info Framework | [Display Page Templates](../../site-building/displaying-content/using-display-page-templates.md), [Fragments](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments.md), [Navigation Menus](../../site-building/site-navigation/using-the-navigation-menus-application.md) でオブジェクトデータを利用することができます。Liferay はまた、そのエントリーを表示するために [Collection Provider](../../content-authoring-and-management/collections-and-collection-pages.md) を作成します。|
| ローカライゼーション | オブジェクト定義のフィールドをローカライズして、グローバルなユーザーにより良いサービスを提供します。|
| 権限 | オブジェクト定義とそのデータへのアクセスを制御するために、アプリケーションとリソースの権限を管理します。|
| ワークフロー | オブジェクトのカスタムワークフローを有効にして、オブジェクトエントリの作成、レビュー、および公開を指示します。|

<!-- TASK: Add the following integrations when ready -->
<!-- | Job Scheduler | Use the [Job Scheduler](../core-frameworks/dispatch-framework/using-job-scheduler.md) application to run Talend data integration tasks (e.g., bulk imports, data syncs). You can run them manually or schedule them to run at regular intervals. |-->
<!-- | Publications |  | -->

```{raw} html
:file: ../../landingpage_template.html
```

```{raw} html
:file: understanding-object-integrations/landing.html
```
