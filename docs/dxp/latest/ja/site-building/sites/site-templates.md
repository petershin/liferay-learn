---
toc:
- ./site-templates/creating-site-templates.md
- ./site-templates/propagating-template-changes.md
- ./site-templates/configuring-site-template-propagation.md
- ./site-templates/exporting-importing-site-templates.md
---
# サイトテンプレート

```{toctree}
:maxdepth: 4

site-templates/creating-site-templates.md
site-templates/propagating-template-changes.md
site-templates/configuring-site-template-propagation.md
site-templates/exporting-importing-site-templates.md
```

Liferayには、サイト作成時に使用できる構造やコンテンツを設計するためのサイトテンプレートが用意されています。 各テンプレートには、ページ、スタイルブック、Webコンテンツなどを追加するための、サイト標準アプリケーションのほとんどが含まれています。 テンプレートで作成されたサイトは、そのデータをすべて引き継ぎます。 詳しくは、 [サイトテンプレートの作成](./site-templates/creating-site-templates.md) をご覧ください。

```{note}
サイトテンプレートは、ステージング、ワークフロー、メンバーシップ、チーム、およびセグメントを除くすべてのサイトアプリケーションをサポートします。
```

テンプレートを使ってサイトを作成すると、テンプレートのページに変更を加え、その変更を接続されているサイトに自動的に反映させることができます。 詳しくは、 [テンプレート変更の伝搬](./site-templates/propagating-template-changes.md) を参照してください。

```{important}
サイトテンプレートは、主に複数のサイトにまたがるページを管理するためのものです。 Webコンテンツやその他のアセットをサイト間で作成・管理する必要がある場合は、[アセットライブラリ](../../content-authoring-and-management/asset-libraries/asset-libraries-overview.md) を使用します。
```

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} サイトテンプレートの作成
:link: ./site-templates/creating-site-templates.md
:::

:::{grid-item-card} テンプレートの変更を伝播する
:link: ./site-templates/propagating-template-changes.md
:::

:::{grid-item-card} サイトテンプレートのプロパゲーションを設定する
:link: ./site-templates/configuring-site-template-propagation.md
:::

:::{grid-item-card} サイトテンプレートのエクスポートとインポート
:link: ./site-templates/exporting-importing-site-templates.md
:::
::::
