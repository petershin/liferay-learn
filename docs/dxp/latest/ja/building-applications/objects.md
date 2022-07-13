---
toc:
- ./objects/creating-and-managing-objects.md
- ./objects/objects-tutorials.md
- ./objects/using-forms-with-objects.md
- ./objects/deploying-object-widgets-to-sites.md
- ./objects/displaying-object-entries.md
- ./objects/enabling-workflows-for-objects.md
- ./objects/picklists.md
- ./objects/understanding-object-field-types.md
- ./objects/understanding-object-integrations.md
- ./objects/objects-application-permissions.md
- ./objects/integrating-objects-with-third-party-services.md
---
# オブジェクト

```{toctree}
:maxdepth: 3

objects/creating-and-managing-objects.md
objects/objects-tutorials.md
objects/using-forms-with-objects.md
objects/deploying-object-widgets-to-sites.md
objects/displaying-object-entries.md
objects/enabling-workflows-for-objects.md
objects/picklists.md
objects/understanding-object-field-types.md
objects/understanding-object-integrations.md
objects/objects-application-permissions.md
objects/integrating-objects-with-third-party-services.md
```

{bdg-secondary}`Liferay DXP/Portal 7.4以降で利用可能`

Liferay Objectを使用すると、コードを記述したりモジュールをデプロイしたりすることなく、アプリケーションを構築して提供できます。 オブジェクトで構築された各アプリケーションはLiferayのコアフレームワークと統合されているため、シームレスなユーザーエクスペリエンスを維持しながら、Liferay DXPをビジネスニーズに適応させた柔軟なソリューションを迅速に開発・管理することが可能です。

オブジェクトを作成する際、ユーザーはデータ[フィールド](./objects/creating-and-managing-objects/adding-fields-to-objects.md)、複雑な[オブジェクトのエントリ間の関係](./objects/creating-and-managing-objects/defining-object-relationships.md) 、特定の条件下で発動するカスタム[アクション](./objects/creating-and-managing-objects/defining-object-actions.md)を定義することができます。 また、[レイアウト](./objects/creating-and-managing-objects/designing-object-layouts.md)および[ビュー](./objects/creating-and-managing-objects/designing-object-views.md)を設計して、エントリ作成時およびオブジェクトのアプリケーションページでフィールドとリレーションを表示する方法を決定することも可能です。

公開する前に、各オブジェクトのデータを会社またはサイトにスコープし、Liferay UIのどこに表示されるかを決定できます。

作成時から、すべてのオブジェクトはLiferayの[コアフレームワーク](./core-frameworks.md)と完全に統合されており、プラットフォーム全体で統一されたエクスペリエンスを提供し、Liferayのすべての機能を活用します。 すべてのオブジェクトに対して[ヘッドレスREST API](./objects/understanding-object-integrations/headless-framework-integration.md)が自動的に生成される機能が含まれているため、定義されたエンドポイントを介してオブジェクトと対話できます。 これらのAPIを[Job Scheduler](./core-frameworks/dispatch-framework/using-dispatch.md)と統合して使用することで、オブジェクトデータを外部システムと動的に同期するようにTalendジョブを構成することもできます。

すべてのオブジェクトは[ワークフロー](./objects/enabling-workflows-for-objects.md)と統合されているため、定義されたレビューおよび承認プロセスを通じてオブジェクトエントリーの作成をガイドできます。  オブジェクトは、[フォーム](objects/using-forms-with-objects.md)とも統合されているため、オブジェクトフィールドにマップし、オブジェクトエントリーを作成するためのユーザー入力を受け取るフォームを設計できます。

エントリーが作成されると、Liferayの情報フレームワークを活用して、動的なユーザーエクスペリエンスを作成し、ページフラグメントと表示ページテンプレートを使用して[オブジェクトエントリーを表示](./objects/displaying-object-entries.md)できます。 Liferay DXP 7.4 U1とLiferay Portal 7.4 GA5では、[オブジェクトをウィジェットとしてサイトページ](./objects/deploying-objects-to-sites.md)にデプロイすることも可能です。

すべてのオブジェクトはLiferayの[権限設定フレームワーク](./objects/understanding-object-integrations/permissions-framework-integration.md)と統合されているため、アプリケーションとリソースの権限を割り当てて、オブジェクトとそのエントリーへのアクセスを管理できます。 範囲指定と合わせ、ロールベースのアクセス制御を行うことで、データを保護し、適切なユーザーのみがデータにアクセスできるようにすることができます。

オブジェクトを使用すると、オブジェクトフレームワークに登録されたシステムサービスを拡張し、設定することも可能です。 これには、カスタムフィールドやアクションの追加も含まれます。

カスタムアプリケーションの構築を開始するには[オブジェクトの作成](./objects/creating-and-managing-objects/creating-objects.md)を参照し、オブジェクトがLiferayのコアフレームワークをどのように活用するかについて確認するには[オブジェクト統合を理解する](./objects/understanding-object-integrations.md)を参照してください。

```{raw} html
:file: ../landingpage_template.html
```

```{raw} html
:file: objects/landing.html
```
