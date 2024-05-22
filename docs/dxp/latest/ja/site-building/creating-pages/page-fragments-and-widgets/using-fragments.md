---
toc:
  - ./using-fragments/default-fragments-reference.md
  - ./using-fragments/using-layout-elements.md
  - ./using-fragments/configuring-fragments.md
  - ./using-fragments/mapping-and-linking-fragment-elements.md
  - ./using-fragments/configuring-fragment-visibility.md
  - ./using-fragments/editing-fragment-elements.md
  - ./using-fragments/personalizing-custom-forms-using-form-fragments.md
  - ./using-fragments/creating-dropdown-menus-with-fragments.md
  - ./using-fragments/duplicating-fragments.md
  - ./using-fragments/saving-fragment-compositions.md
  - ./using-fragments/managing-fragments.md
  - ./using-fragments/propagating-fragment-changes.md
---
# フラグメントの使用

ページ・フラグメントは、 [コンテンツ・ページ](../using-content-pages.md) と、それらに関連するテンプレート（すなわち、 [マスター](../defining-headers-and-footers/master-page-templates.md)、 [ページ](../adding-pages/creating-a-page-template.md)、 [表示ページ](../../displaying-content/using-display-page-templates.md)）を構築するための、拡張可能で再利用可能なドラッグ・アンド・ドロップ要素です。 HTML、CSS、JavaScriptを使用して構築され、ページに構造と機能の両方を提供することができます。

![フラグメントを使ってコンテンツページやテンプレートを構築](./using-fragments/images/01.png)

Liferay はすぐに使える様々なフラグメントを提供しますが、 [page fragment editor interface](../../developer-guide/reference/fragments/page-fragment-editor-interface-reference.md) や [Fragments Toolkit](../../developer-guide/developing-page-fragments/using-the-fragments-toolkit.md)を使ってカスタムフラグメントを開発することができます。 さらに、 [Liferay ウィジェット](../../developer-guide/reference/fragments/fragment-specific-tags-reference.md#including-widgets-within-a-fragment) をフラグメントに埋め込んだり、 [編集可能なフィールド](../../developer-guide/reference/fragments/fragment-specific-tags-reference.md)を追加することもできます。 詳細については、[Developing Page Fragments](../../developer-guide/developing-page-fragments/developing-fragments-intro.md)を参照してください。

フォームを使用している場合、 [カスタムフォームフラグメント](./using-fragments/personalizing-custom-forms-using-form-fragments.md)にマッピングすることで、フォームフィールドをパーソナライズすることができます。

すべてのページ・フラグメントは、 **セット** にまとめられている。 各フラグメントセットには、すべてのフラグメントからアクセス可能な共通リソースを含めることができる。 詳細は、[フラグメントにデフォルトのリソースを含める](../../developer-guide/developing-page-fragments/including-default-resources-with-fragments.md)を参照してください。

ページやテンプレートにフラグメントを追加した後、フラグメントやそのサブエレメントを設定・カスタマイズすることができます。 これらのオプションは異なる場合がありますが、一部はすべてに共通です。 使用可能なオプションの詳細については、 [フラグメントの設定](./using-fragments/configuring-fragments.md) を参照してください。


