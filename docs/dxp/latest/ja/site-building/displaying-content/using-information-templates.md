# 情報テンプレートの使用

{bdg-secondary}`7.4+で利用可能`

情報テンプレートを使用すると、情報フレームワークを実装しているあらゆるアイテムタイプの [FreeMarker](https://freemarker.apache.org/) テンプレートを作成できます。 サポートされているアイテムタイプには、ウェブコンテンツ、ドキュメント、アセット、ブログ、カテゴリー、オブジェクトがあります。 一度作成すると、フラグメントフィールドをテンプレートにマッピングして、コンテンツページと表示ページでアイテムがどのようにレンダリングされるかを決定できます。 これは、あなたのサイトに一貫したスタイルを導入するのに役立ちます。

```{important}
情報テンプレートはフラグメントでのみ利用可能で、ウィジェットでは利用できません。 ウィジェットに表示されるウェブコンテンツ用のFreeMarkerテンプレートをデザインしたい場合は、 [ウェブコンテンツテンプレート](../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md) をご利用ください。
```

## 情報テンプレートの作成

以下の手順に従って、情報テンプレートを作成してください：

1. ![サイトメニュー](../../images/icon-product-menu.png))を開き、_デザイン_ &rarr; _テンプレート_ &rarr; _情報テンプレート_に移動します。

1. *追加*ボタンをクリックする (![追加ボタン](../../images/icon-add.png))

1. *名前*を入力し、_アイテムのタイプ_を選択し、(該当する場合)_アイテムのサブタイプ_を選択します。

   ![Enter a name and select an Item Type and Item Subtype.](./using-information-templates/images/01.png)

1. ［_保存_］をクリックします。 これにより、テンプレートデザインページにリダイレクトされます。

1. (オプション) [インポート](#importing-and-exporting-scripts) `.ftl` ファイルから既存の FreeMarker スクリプトをインポートします。

1. FreeMarkerを使ってテンプレートをデザインします。

   エディターで`${`と入力するとオートコンプリート機能が使える。

   *Elements*サイドパネル(![Elements](../../images/icon-list-ul.png))では、選択したアイテムタイプの構造から利用可能なフィールドに素早くアクセスすることができます。

   ![Design your template using FreeMarker and available fields in the Elements side panel.](./using-information-templates/images/02.png)

   ```{note}
   要素」サイドパネルには、テンプレートに基づくフィールドは含まれていません（例：ジャーナル記事テンプレート、情報テンプレート）。 これは無限ループを防ぐためである。
   ```

1. (オプション) Propertiesサイドパネルでテンプレートに_description_または_image_を追加します(![Properties](../../images/icon-cog3.png))。

1. 終了したら、_保存_をクリックします。

一度作成された情報テンプレートは、コンテンツ表示フラグメントや、テキストやリッチテキストなど、マッピング可能な [サブ要素](../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md) を持つその他のフラグメントで使用することができます。 選択すると、コンテントページと表示ページテンプレートで項目がどのようにレンダリングされるかが決定されます。

Liferay の [Headless](../../headless-delivery/using-liferay-as-a-headless-platform.md) API サービスは `restClient` オブジェクトを通してテンプレートエディタで利用できます。 使い方の詳細は [テンプレートエディターでヘッドレスAPIを呼び出す](../creating-pages/page-fragments-and-widgets/using-widgets/styling-widgets/creating-a-widget-template.md#calling-headless-apis-in-the-template-editor) を参照してください。

## スクリプトのインポートとエクスポート

情報テンプレートを編集する際、FreeMarkerスクリプトをインポートおよびエクスポートして、他のコンテキストで再利用することができます：

1. ![サイトメニュー](../../images/icon-product-menu.png))を開き、_デザイン_ &rarr; _テンプレート_ &rarr; _情報テンプレート_に移動します。

1. 必要な情報テンプレートを選択します。

1. アプリケーションバーの_Actions_ボタン(../../images/icon-actions.png)をクリックし、_Export Script_または_Import Script_を選択します。

   ![Select Export Script or Import Script.](./using-information-templates/images/03.png)

エクスポートすると、現在の FreeMarker スクリプトは `script.ftl` ファイルとして保存されます。

インポートする際、選択したファイルはテンプレートの現在のFreeMarkerスクリプトを置き換えます。

## 情報テンプレートの管理

テンプレート」アプリケーションでは、既存のすべての情報テンプレートを表示および管理できます。 それぞれの既存のテンプレートは、そのタイプ（例えば、ウェブコンテンツ記事）とサブタイプ（例えば、基本ウェブコンテンツ）と共にリストされます。 テンプレートの_Actions_ボタン(![Actions Button](../../images/icon-actions.png)) をクリックすると、以下のオプションにアクセスできます：

| 操作    | 説明                            |
| :---- | :---------------------------- |
| 編集する  | テンプレートを編集する。                  |
| コピー   | 選択したテンプレートの内容で新しいテンプレートを作成する。 |
| 権限の設定 | テンプレートの基本的な権限を管理します。          |
| 削除    | テンプレートを削除する。                  |

![Click the Actions button to access management options.](./using-information-templates/images/04.png)

また、 [](#exporting-templates) をエクスポートしたり、 [](#importing-templates) Info Templates を LAR ファイルとしてインポートして、サイトや環境間で共有することもできます。 これを行うには、アプリケーションバーの_Actions_ボタンをクリックし、_Export/Import_を選択します。

![Export and Import templates as LAR files.](./using-information-templates/images/05.png)

```{note}
デフォルトでは、情報テンプレートのエクスポートにはウィジェットテンプレートが含まれます。 ただし、どのテンプレートをLARファイルに含めるかは設定できます。
```

## 関連トピック

* [ウィジェットテンプレートの作成](../creating-pages/page-fragments-and-widgets/using-widgets/styling-widgets/creating-a-widget-template.md)
* [ウェブ・コンテンツ・テンプレートの作成](../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md)
* [ウェブコンテンツのテンプレートをフラグメントにマッピングする](../../content-authoring-and-management/web-content/web-content-templates/mapping-web-content-templates-to-fragments.md)
