---
toc:
  - ./objects/creating-and-managing-objects.md
  - ./objects/using-forms-with-objects.md
  - ./objects/using-fragments-to-build-forms.md
  - ./objects/deploying-object-widgets-to-sites.md
  - ./objects/displaying-object-entries.md
  - ./objects/displaying-object-entries-with-collection-providers.md
  - ./objects/enabling-workflows-for-objects.md
  - ./objects/picklists.md
  - ./objects/understanding-object-integrations.md
  - ./objects/objects-application-permissions.md
  - ./objects/integrating-objects-with-third-party-services.md
---
# オブジェクト

{bdg-secondary}`liferay 7.4+`

Liferay Objectを使用すると、コードを記述したりモジュールをデプロイしたりすることなく、アプリケーションを構築して提供できます。 オブジェクトで構築された各アプリケーションはLiferayのコアフレームワークと統合されているため、シームレスなユーザーエクスペリエンスを維持しながら、Liferay DXPをビジネスニーズに適応させた柔軟なソリューションを迅速に開発・管理することが可能です。

オブジェクト定義を作成する際、データ [フィールド](./objects/creating-and-managing-objects/fields.md) 、 [他の定義とのリレーション](./objects/creating-and-managing-objects/relationships.md) 、 [指定された条件下で実行されるアクション](./objects/creating-and-managing-objects/actions.md) を追加することができます。 また、 [レイアウト](./objects/creating-and-managing-objects/layouts.md) と [ビュー](./objects/creating-and-managing-objects/views.md) をデザインして、エントリー作成時やオブジェクトのアプリケーション・ページでフィールドやリレーションシップがどのように表示されるかを決定することもできます。

作成時から、すべてのオブジェクトはLiferayのコアフレームワーク [](./core-frameworks.md) と完全に統合され、プラットフォーム全体で統一されたエクスペリエンスを提供し、Liferayのすべての機能を活用します。 これには、 [Headless REST API](./objects/understanding-object-integrations/using-custom-object-apis.md) をすべてのオブジェクトに対して自動的に生成することが含まれます。これにより、定義されたエンドポイントを通してオブジェクトと対話することができます。 これらのAPIは、 [Job Scheduler](./core-frameworks/job-scheduler-framework/using-job-scheduler.md) 統合と一緒に使用して、オブジェクトデータを外部システムと動的に同期するTalendジョブを構成することもできます。

すべてのオブジェクトは [ワークフロー](./objects/enabling-workflows-for-objects.md) と統合されているため、定義されたレビューおよび承認プロセスを通じて、オブジェクトエントリの作成をガイドすることができます。 オブジェクトはまた、 [Forms](objects/using-forms-with-objects.md) と統合されているため、オブジェクト・フィールドに対応するフォームを設計し、オブジェクト項目を作成するためのユーザー入力を受け取ることができます。

エントリが作成されると、LiferayのInfoフレームワークを活用して、 [オブジェクトエントリを表示することで、動的なユーザーエクスペリエンスを作成することができます。](./objects/displaying-object-entries.md) Page FragmentsとDisplay Page Templatesを使用します。 また、 [ウィジェット](./objects/deploying-object-widgets-to-sites.md) としてサイトページにオブジェクトを追加することもできます。

すべてのオブジェクトは、Liferayの [Permissionsフレームワーク](./objects/understanding-object-integrations/permissions-framework-integration.md) と統合されているので、オブジェクトとそのエントリへのアクセスを管理するために、アプリケーションとリソースのパーミッションを割り当てることができます。 範囲指定と合わせ、ロールベースのアクセス制御を行うことで、データを保護し、適切なユーザーのみがデータにアクセスできるようにすることができます。

オブジェクトを使用すると、オブジェクトフレームワークに登録されている [システムサービス](./objects/creating-and-managing-objects/extending-system-objects.md) を拡張して設定することもできます。 これには、カスタムリレーションシップやアクションの追加も含まれます。 <!--TASK: Add fields when ready.-->

カスタムアプリケーションの構築を開始するには [オブジェクトの作成](./objects/creating-and-managing-objects/creating-objects.md) を参照し、オブジェクトがLiferayのコアフレームワークをどのように活用するかについて確認するには [オブジェクト統合を理解する](./objects/understanding-object-integrations.md) を参照してください。

<!--
## Modeling Data Structures

Fields, Relationships

## Implementing Business Logic

Actions, Validations, Notifications

## Integrating with External Systems

Proxy, APIs

## Designing User Interfaces

-->
