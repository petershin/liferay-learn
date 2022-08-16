# 情報テンプレートの活用

{bdg-secondary}`7.4以降で利用可能`

情報テンプレートを使用すると、 [FreeMarker](https://freemarker.apache.org/) のテンプレートを、 [Infoフレームワーク (近日公開！)](../../building-applications/data-frameworks/info-framework.md) を実装する任意のアイテムタイプ用に作成することができます。 対応するアイテムの種類は、Webコンテンツ、ドキュメント、アセット、ブログ、カテゴリー、オブジェクトです。 フラグメントフィールドを作成すると、テンプレートにマッピングして、コンテンツページと表示ページで項目がどのようにレンダリングされるかを決定することができます。 これにより、サイトに一貫したスタイルを導入することができます。

```{important}
情報テンプレートはフラグメントでのみ利用可能で、ウィジェットでは利用できません。 ウィジェットで表示されるWebコンテンツのFreeMarkerテンプレートをデザインしたい場合は、[Webコンテンツテンプレート](../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md) を使用してください。
```

## 情報テンプレートの作成

以下の手順で、情報テンプレートを作成します。

1. **サイトメニュー**（![Site Menu](../../images/icon-product-menu.png)）を開き、 ［**デザイン**］ &rarr; ［**Templates**］ &rarr; ［**Information Templates**］ に移動します。

1. **追加** ボタン（![Add Button](../../images/icon-add.png)）をクリックします。

1. **名前** を入力し、 **アイテムタイプ** を選択し、（該当する場合）**アイテムサブタイプ** を選択します。

   ![名称を入力し、アイテムタイプとアイテムサブタイプを選択します。](./using-information-templates/images/01.png)

1. ［**保存**］ をクリックします。 これにより、テンプレートデザインページにリダイレクトされます。

1. (オプション) [Import](#importing-and-exporting-scripts) 既存の FreeMarker スクリプトを `.ftl` ファイルからインポートします。

1. FreeMarkerを使用してテンプレートをデザインします。

   エディタで `${` と入力すると、オートコンプリート機能を利用することができます。

   **Elements** サイドパネル(![Elements](../../images/icon-list-ul.png))では、選択したアイテムタイプの構造から利用可能なフィールドに素早くアクセスできます。

   ![FreeMarkerとElementsのサイドパネルにある利用可能なフィールドを使用して、テンプレートを設計します。](./using-information-templates/images/02.png)

   ```{note}
   要素サイドパネルには、テンプレートに基づくフィールド（例：ジャーナル記事テンプレート、情報テンプレート）は含まれません。 これは、無限ループを防止するためです。
   ```

1. (オプション) プロパティサイドパネル(![Properties](../../images/icon-cog3.png))で、 **説明文** または **画像** をテンプレートに追加します。

1. 完了したら、 [**保存**] をクリックします。

作成された情報テンプレートは、コンテンツ表示フラグメントや、テキストやリッチテキストなどのマッピング可能な[サブ要素](../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md)を持つその他のフラグメントで使用することができます。選択すると、コンテントページと表示ページテンプレートで項目がどのようにレンダリングされるかが決定されます。


## スクリプトのインポートとエクスポート

情報テンプレートを編集する際に、FreeMarkerスクリプトをインポート/エクスポートして、他のコンテキストで再利用することができます。

1. **サイトメニュー**（![Site Menu](../../images/icon-product-menu.png)）を開き、 ［**デザイン**］ &rarr; ［**Templates**］ &rarr; ［**Information Templates**］ に移動します。

1. 目的の情報テンプレートを選択します。

1. アプリケーションバーの **アクション** ボタン ![Actions Button](../../images/icon-actions.png) をクリックし、 **エクスポートスクリプト** または **インポートスクリプト** を選択します。
   
   ![スクリプトのエクスポート］または［スクリプトのインポート］を選択します。](./using-information-templates/images/03.png)

エクスポートする場合、現在の FreeMarker スクリプトは、 `script.ftl` ファイルとして保存されます。

インポート時には、選択したファイルがテンプレートの現在のFreeMarkerスクリプトに置き換わります。


## 情報テンプレートの管理

テンプレート」アプリケーションでは、既存のすべての情報テンプレートを表示および管理することができます。 既存の各テンプレートは、そのタイプ（例：Webコンテンツ記事）とサブタイプ（例：基本的なWebコンテンツ）が一覧表示されます。 テンプレートの「**Actions**」 ボタン(![Actions Button](../../images/icon-actions.png))をクリックすると、以下のオプションにアクセスすることができます。

| 操作   | Description                     |
|:---- |:------------------------------- |
| 編集   | テンプレートを編集する。                    |
| コピー  | 選択したテンプレートの内容で、新しいテンプレートを作成します。 |
| 権限設定 | テンプレートの基本権限を管理します。              |
| 削除   | テンプレートを削除する。                    |


![管理オプションにアクセスするには、 [アクション]ボタンをクリックします。](./using-information-templates/images/04.png)

また、 [export](#exporting-templates) をエクスポート、 [import](#importing-templates) Info Templates を LAR ファイルとしてインポートし、サイト間や環境間で共有することができます。 これを行うには、アプリケーションバーの **アクション** ボタンをクリックし、 **エクスポート/インポート** を選択します。

![テンプレートをLARファイルとしてエクスポート、インポートすることができます。](./using-information-templates/images/05.png)

```{note}
デフォルトでは、情報テンプレートのエクスポートはウィジェットテンプレートを含みます。 ただし、どのテンプレートを LAR ファイルに含めるかは設定できます。
```

## 追加情報

* [ウィジェットテンプレートの作成](../creating-pages/using-widget-pages/styling-widgets/creating-a-widget-template.md)
* [Webコンテンツテンプレートの作成](../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md)
* [Webコンテンツテンプレートのフラグメントへのマッピング](../../content-authoring-and-management/web-content/web-content-templates/mapping-web-content-templates-to-fragments.md)
