# 情報テンプレートの使用

{bdg-secondary}`7.4以降で利用可能`

Information Templatesを使用すると、Info Frameworkを実装するあらゆるアイテムタイプに対して、 [FreeMarker](https://freemarker.apache.org/) のテンプレートを作成することができます。 対応するアイテムタイプは、Webコンテンツ、ドキュメント、アセット、ブログ、カテゴリー、オブジェクトです。 一度作成したフラグメントフィールドをテンプレートにマッピングすることで、コンテンツページやディスプレイページでのアイテムの描画方法を決定することができます。 これにより、あなたのサイトに一貫したスタイルを導入することができます。

```{important}
情報テンプレートはフラグメントでのみ利用可能で、ウィジェットでは利用できません。 ウィジェットで表示されるWebコンテンツのFreeMarkerテンプレートをデザインしたい場合は、[Webコンテンツテンプレート](../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md) を使用してください。
```

## 情報テンプレートの作成

以下の手順で、インフォテンプレートを作成します：

1. **サイトメニュー**(![Site Menu](../../images/icon-product-menu.png)）を開き、 ［**デザイン**］ &rarr; ［**Templates**］ &rarr; ［**Information Templates**］ に移動します。

1. **追加** ボタン(![Add Button](../../images/icon-add.png)）をクリックします。

1. **名称** を入力し、 **アイテムタイプ** を選択し、(該当する場合）**アイテムサブタイプ** を選択します。

   ![名前を入力し、アイテムタイプ、アイテムサブタイプを選択します。](./using-information-templates/images/01.png)

1. ［**Save**］ をクリックします。 これにより、テンプレートデザインページにリダイレクトされます。

1. (オプション） [](#importing-and-exporting-scripts) 既存のFreeMarkerスクリプトを `.ftl` ファイルからインポートします。

1. FreeMarkerを使用してテンプレートをデザインします。

   エディターで `${` と入力すると、オートコンプリート機能を利用することができます。

   **Elements** サイドパネル(![Elements](../../images/icon-list-ul.png))では、選択したアイテムタイプの構造から利用可能なフィールドに素早くアクセスすることができます。

   ![FreeMarkerとElementsのサイドパネルで利用可能なフィールドを使用してテンプレートを設計します。](./using-information-templates/images/02.png)

   ```{note}
   要素」サイドパネルには、テンプレートに基づくフィールド(例：Journal Article Templates、Info Templates）は含まれません。 これは、無限ループを防ぐためです。
   ```

1. (オプション）プロパティサイドパネル(![Properties](../../images/icon-cog3.png)）で、テンプレートに **説明文** または **画像** を追加します。

1. 完了したら、 ［**Save**］ をクリックします。

作成された情報テンプレートは、コンテンツ表示フラグメントや、テキストやリッチテキストなどのマッピング可能な[サブ要素](../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md)を持つその他のフラグメントで使用することができます。 選択すると、コンテントページと表示ページテンプレートで項目がどのようにレンダリングされるかが決定されます。

## スクリプトのインポートとエクスポート

情報テンプレート編集時に、FreeMarkerスクリプトをインポート/エクスポートして、他のコンテキストで再利用することが可能です：

1. **サイトメニュー**(![Site Menu](../../images/icon-product-menu.png)）を開き、 ［**デザイン**］ &rarr; ［**Templates**］ &rarr; ［**Information Templates**］ に移動します。

1. 目的の情報テンプレートを選択します。

1. アプリケーションバーの **アクション** ボタン ![Actions Button](../../images/icon-actions.png) をクリックし、 **スクリプトのエクスポート** または **スクリプトのインポート** を選択します。

   ![Export ScriptまたはImport Scriptを選択します。](./using-information-templates/images/03.png)

エクスポートの際、現在のFreeMarkerスクリプトは、 `script.ftl` ファイルとして保存されます。

インポート時には、選択したファイルがテンプレートの現在のFreeMarkerスクリプトに置き換わります。

## インフォテンプレートの管理

テンプレート」アプリケーションでは、既存のすべての「情報テンプレート」を表示および管理できます。 既存の各テンプレートは、そのタイプ(例：ウェブコンテンツ記事）とサブタイプ(例：基本ウェブコンテンツ）が一覧表示されます。 テンプレートの「**アクション**」 ボタン(![Actions Button](../../images/icon-actions.png))をクリックすると、以下のオプションにアクセスすることができます：

| 操作    | Description                     |
|:----- |:------------------------------- |
| 編集    | テンプレートを編集する。                    |
| コピー   | 選択したテンプレートの内容で、新しいテンプレートを作成します。 |
| 権限の設定 | テンプレートの基本的な権限を管理します。            |
| 削除    | テンプレートを削除する。                    |

![管理オプションにアクセスするには、「アクション」ボタンをクリックします。](./using-information-templates/images/04.png)

また、 [export](#exporting-templates) をエクスポート、 [import](#importing-templates) をインポートし、LAR ファイルとしてサイトや環境間で情報テンプレートを共有することができます。 これを行うには、アプリケーションバーの **アクション** ボタンをクリックし、 **エクスポート/インポート** を選択します。

![テンプレートをLARファイルとしてエクスポート、インポートすることができます。](./using-information-templates/images/05.png)

```{note}
デフォルトでは、Info TemplateのエクスポートにはWidget Templatesが含まれます。 ただし、どのテンプレートを LAR ファイルに含めるかは設定可能です。
```

## 追加情報

* [ウィジェットテンプレートの作成](../creating-pages/page-fragments-and-widgets/using-widgets/styling-widgets/creating-a-widget-template.md)
* [Webコンテンツテンプレートの作成](../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md)
* [Webコンテンツテンプレートのフラグメントへのマッピング](../../content-authoring-and-management/web-content/web-content-templates/mapping-web-content-templates-to-fragments.md)
