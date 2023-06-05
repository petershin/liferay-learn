# Webコンテンツテンプレートのフラグメントへのマッピング
<!--TASK: Relocate to section on Web Content Templates, since this is done on the Web Content side. -->
デフォルトでは、 [［Webコンテンツストラクチャー］](../../../content-authoring-and-management/web-content/web-content-structures/understanding-web-content-structures.md)の単一の値を持つフィールド（日付、数値、画像、番号付き、テキストなど）をフラグメントにマップすることが可能です。 複数値のフィールド（リストから選択、ラジオボタン、HTMLなど）の場合、まず [Webコンテンツテンプレート](../../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md)を使ってフィールドをレンダリングしなければなりません；次にそのテンプレートをフラグメントにマップすることができます。

例えば、この画像の ［**Web Content with Audience**］ ストラクチャーには、 ［**Text**］ 型のコンテンツ項目と ［**Select from List**］ 型のオーディエンスフィールドが含まれています。

![デフォルトでは、単一値のストラクチャー項目をフラグメントにマッピングすることができます。](./mapping-web-content-templates-to-fragments/images/02.png)

単一値のコンテンツ項目は直接フラグメントにマッピングできますが、複数値のオーディエンスフィールドをマッピングするには、Webコンテンツテンプレートが必要です。 [Webコンテンツテンプレート](../../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md)は、マッピングしたいフィールドを含むWebコンテンツの記事と同じストラクチャーを使用する必要があります。 この関係を表したのが次の画像です。

![Webコンテンツ記事と同じストラクチャーを使用するWeb コンテンツ テンプレートを作成します。](./mapping-web-content-templates-to-fragments/images/07.png)

```{note}
複数のストラクチャー項目値を個々のフラグメントにマッピングしたい場合は、そのストラクチャーを使用する各フィールドに対して1つのフィールドだけをレンダリングする別のWebコンテンツテンプレートを作成する必要があります。 1つのテンプレートですべてのフィールドをレンダリングする場合、テンプレートを選択すると、それらのすべての値がフラグメントにマップされます。
```

## Webコンテンツテンプレートのフラグメントへのマッピング

1. マッピングしたい複数値フィールドを含む[Webコンテンツストラクチャーを作成します](../../../content-authoring-and-management/web-content/web-content-structures/creating-structures.md)。
1. 複数値フィールド（A）と同じストラクチャーを使用する[Webコンテンツテンプレートを作成します](../../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md)。
1. Webコンテンツテンプレートのフィールド（B）で、ストラクチャーに複数値フィールドを使用している **変数**（C）を選択します。

    ![ストラクチャーを元に、複数値フィールドを持つWebコンテンツテンプレートを作成します。](./mapping-web-content-templates-to-fragments/images/08.png)

1. 前のWebコンテンツテンプレートに基づいて[Webコンテンツを作成します](../../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md)。

    ![複数値フィールドを持つテンプレートを元に、Webコンテンツを作成します。](./mapping-web-content-templates-to-fragments/images/01.png)

1. フラグメントがサポートされているページ（コンテントページ、表示ページテンプレートなど）で、 [フラグメントを追加します](../../../site-building/creating-pages/using-content-pages/adding-elements-to-content-pages.md)。
1. サイドバーパネルで、 **Selection**(![Selection](../../../images/icon-pages-tree.png)) ボタンをクリックし、マッピングしたいフラグメントの要素を選択します。
1. **マッピング** セクションで、 マッピングしたい値を含むWebコンテンツの記事を [選択し、マッピングしてください。](../../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#mapping-settings)
1. ［**Field**］ のドロップダウンメニューをクリックし、先に作成したWebコンテンツテンプレートを選択します。

    ![Webコンテンツテンプレートのフィールドをフラグメントにマップします。](./mapping-web-content-templates-to-fragments/images/04.png)

1. ［**公開**］ をクリックして変更を保存します。

## 関連トピック

- [フラグメントの使用](../../../site-building/creating-pages/page-fragments-and-widgets/using-fragments.md)
- [Webコンテンツストラクチャーを理解する](../../../content-authoring-and-management/web-content/web-content-structures/understanding-web-content-structures.md)
- [Webコンテンツテンプレートの作成](../../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md)
