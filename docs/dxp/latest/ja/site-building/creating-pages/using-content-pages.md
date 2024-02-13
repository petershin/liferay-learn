---
toc:
  - ./using-content-pages/adding-elements-to-content-pages.md
  - ./using-content-pages/managing-content-in-content-pages.md
  - ./using-content-pages/using-widgets-on-a-content-page.md
  - ./using-content-pages/using-page-comments.md
  - ./using-content-pages/content-page-editor-ui-reference.md
---
# コンテントページの使用

デフォルトでは、Liferay DXPはコンテンツページタイプを使用し、ページのコンテンツとデザインを管理・編集するための便利なユーザーインターフェースを提供します。 コンテンツページでは、設定可能なドラッグ＆ドロップ要素をすぐに使用したり、独自の要素を開発したりして、希望するユーザーエクスペリエンスを作り出すことができます。

他のページタイプと同様に、 [ウィジェット](./using-content-pages/using-widgets-on-a-content-page.md) を使って、コンテンツページに動的な機能を追加し、ブログ、ウィキ、掲示板などを統合することができます。 コンテンツ・ページは主に [ページ・フラグメント](./page-fragments-and-widgets/using-fragments.md)を使って構築される。 ページ・フラグメントは拡張可能で再利用可能なページ要素で、テキスト、画像、リンクなどの編集可能なコンポーネントを含み、利用可能なコンテンツにマッピングすることもできます。 DXPのすぐに使えるフラグメントについては、 [デフォルトのフラグメントリファレンス](./page-fragments-and-widgets/using-fragments/default-fragments-reference.md) を、独自のフラグメントを作成する方法については、 [フラグメントの開発](../developer-guide/developing-page-fragments/developing-fragments-intro.md) を参照してください。

コンテンツページを編集する際、変更は **サイトビルダー** を通して行われ、下書きとして保存されます。 本番環境に影響を与えることなく、現在の編集セッションで行った変更を確認したり、元に戻したり、やり直したりすることができます。 準備ができたら、変更をすぐに公開するか、カスタム [ワークフロー](../../process-automation/workflow/introduction-to-workflow.md) を有効にして、レビューと公開プロセスを指示します。 また、 [コメント](./using-content-pages/using-page-comments.md) をページ要素に追加して、チームメンバーと共同作業することもできます。

![コンテンツページを編集する場合、すべての変更はサイトビルダーを通して行われます。](./using-content-pages/images/01.png)

コンテンツページのフラグメントやウィジェットを使って、ウェブコンテンツやドキュメントなどを表示することができます。 また、ページフィールドにマッピングされたコンテンツも含めて、閲覧、編集、管理することができます。 詳細については、 [コンテントページのコンテンツの管理](./using-content-pages/managing-content-in-content-pages.md) を参照してください。

パーソナライズされたページ の[エクスペリエンス](../personalizing-site-experience/experience-personalization/content-page-personalization.md)を作成し、ローカライズされた翻訳を管理して、ターゲットオーディエンスを引き付けます。 また、レスポンシブ・レイアウト・エディターを使って、ユーザー体験をさらに最適化することもできる。 このツールはページ内容を適応させるので、コンテンツページがデスクトップ、タブレット、スマートフォンでどのように表示されるかを確認し、設定することができます。

最後に、 [A/Bテスト](../optimizing-sites/ab-testing/ab-testing.md)、コンテンツページの代替バージョンを作成し、訪問者のデータ（直帰率、クリック数など）を追跡することができます。 アルゴリズムを使ってこのデータを分析し、どのページのバージョンが最も目的を達成できるかを判断し、それに応じてメッセージを磨くことができます。

はじめるには、 [コンテンツページへの要素の追加](./using-content-pages/adding-elements-to-content-pages.md) を参照してください。

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} コンテンツページへの要素の追加
:link: ./using-content-pages/adding-elements-to-content-pages.md
:::

:::{grid-item-card} コンテンツページでのコンテンツ管理
:link: ./using-content-pages/managing-content-in-content-pages.md
:::

:::{grid-item-card} フラグメントの使用

* [デフォルトのフラグメントリファレンス](./page-fragments-and-widgets/using-fragments/default-fragments-reference.md)
* [レイアウト要素の使用](./page-fragments-and-widgets/using-fragments/using-layout-elements.md)
* [フラグメントの設定](./page-fragments-and-widgets/using-fragments/configuring-fragments.md)
:::

:::{grid-item-card} コンテントページでのウィジェットの使用
:link: ./using-content-pages/using-widgets-on-a-content-page.md
:::

:::{grid-item-card} ページコメントの使用
:link: ./using-content-pages/using-page-comments.md
:::

:::{grid-item-card} コンテントページエディタUI リファレンス
:link: ./using-content-pages/content-page-editor-ui-reference.md
:::
::::
