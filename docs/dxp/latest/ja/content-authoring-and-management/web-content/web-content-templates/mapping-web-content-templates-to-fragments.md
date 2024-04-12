# Webコンテンツテンプレートのフラグメントへのマッピング
<!--TASK: Relocate to section on Web Content Templates, since this is done on the Web Content side. -->
デフォルトでは、 [Web コンテンツ構造](../../../content-authoring-and-management/web-content/web-content-structures/understanding-web-content-structures.md) フィールドの単一値（日付、数値、画像、数値、テキストなど）をフラグメントにマッピングできます。 多値フィールド（リストからの選択、ラジオボタン、HTMLなど）の場合、最初に [Webコンテンツテンプレート](../../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md)を使ってフィールドをレンダリングする必要があります。

例えば、この画像の **Web Content with Audience** 構造には、 **Text** タイプの Content フィールドと、 **Select from List** タイプの Audience フィールドが含まれています：

![デフォルトでは、単一値の構造体フィールドをフラグメントにマッピングできます。](./mapping-web-content-templates-to-fragments/images/01.png)

単一値のコンテンツフィールドはフラグメントに直接マッピングできますが、複数値のオーディエンスフィールドをマッピングするにはウェブコンテンツテンプレートが必要です。 [ウェブコンテンツ・テンプレート](../../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md) は、マップしたいフィールドを含むウェブコンテンツ記事と同じ構造を使うべきです。 この関係を表したのが次の画像です。

![ウェブコンテンツ記事と同じ構造を使用するウェブコンテンツ・テンプレートを作成する。](./mapping-web-content-templates-to-fragments/images/02.png)

```{note}
複数の構造体フィールド値を個々のフラグメントにマッピングしたい場合は、その構造体を使用する各フィールドに対して1つのフィールドだけをレンダリングする別のWebコンテンツテンプレートを作成する必要があります。 すべてのフィールドを1つのテンプレートにレンダリングすると、テンプレートを選択したときに、すべてのフィールドの値がフラグメントにマップされます。
```

## Webコンテンツテンプレートのフラグメントへのマッピング

1. [マッピングしたい複数値フィールドを含むウェブコンテンツ構造](../../../content-authoring-and-management/web-content/web-content-structures/creating-structures.md) を作成します。

1. [ウェブ・コンテンツ・テンプレート](../../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md) 、マルチバリュー・フィールド(A)と同じ構造を使用する。

1. ウェブ・コンテンツ・テンプレートで、フィールド(B)の下にある、 **変数**(C)を、構造内の複数値フィールドで選択します。

    ![複数値フィールドを持つ構造に基づいて、ウェブコンテンツのテンプレートを作成する。](./mapping-web-content-templates-to-fragments/images/03.png)

1. [前回のウェブコンテンツ・テンプレートに基づき、ウェブコンテンツ](../../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md) を作成します。

    ![複数値フィールドを持つテンプレートに基づいてウェブコンテンツを作成します。](./mapping-web-content-templates-to-fragments/images/04.png)

1. フラグメント対応ページ（コンテンツページ、表示ページテンプレートなど）で [フラグメントを追加](../../../site-building/creating-pages/using-content-pages/adding-elements-to-content-pages.md).

1. サイドバーパネルで、 **Selection**(![Selection](../../../images/icon-pages-tree.png)) ボタンをクリックし、マッピングしたいフラグメントの要素を選択します。

1. マッピングセクションで、 [**マッピングしたい値を含むウェブコンテンツ記事を選択し、**](../../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#mapping-settings) マッピングします。

1. **フィールド** ドロップダウンメニューをクリックし、前に作成したウェブコンテンツテンプレートを選択します。

   ![ウェブコンテンツテンプレートのフィールドをフラグメントにマッピングします。](./mapping-web-content-templates-to-fragments/images/05.png)

1. ［**公開**］ をクリックして変更を保存します。

```{warning}
ウェブコンテンツの記事は編集・保存されたときにインデックスが再作成されるが、コンテンツページは（リソースを節約するために）公開されたときにのみインデックスが再作成される。 そのため、キャッシュされたフラグメントにマップされたウェブコンテンツ記事が更新されると、ページを再度公開するか、 [フラグメントをキャッシュ可能なものとしてマーク解除](../../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/managing-fragments.md#managing-individual-page-fragments) するまで、更新はコンテンツページに表示されません。
```

## 関連トピック

[フラグメントの使用](../../../site-building/creating-pages/page-fragments-and-widgets/using-fragments.md)

[Webコンテンツストラクチャーを理解する](../../../content-authoring-and-management/web-content/web-content-structures/understanding-web-content-structures.md)

[Webコンテンツテンプレートの作成](../../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md)
