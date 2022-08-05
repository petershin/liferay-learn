# 詳細設定リファレンス

{bdg-secondary}`利用可能な7.4 DXP U23+または7.4 GA23+`

*Advanced* Settings tab for Page Fragments は、より複雑な設定や技術的な設定を行うためのフィールドを提供します。 例えば、高度な設定により、ウェブブラウザがフラグメントのHTMLを処理する方法を変更することができます。

FragmentのAdvanced Settingsメニューは以下の手順で表示されます。

1. フラグメントをサポートするページまたはテンプレートの編集を開始します。

1. サイドバーメニューの*ブラウザ*パネル（![Browser](../../../../../images/icon-browser.png)）を開き、［Page Elements］の下で目的の*フラグメント*を選択します。

   または、ページまたはテンプレートで目的のフラグメントをクリックして、このメニューを開くこともできます。

1. ページ要素」サイドメニューの「 *アドバンス」* タブをクリックします。

![編集サイドバーメニューの「ブラウザ」パネルから、フラグメントの詳細設定にアクセスします。](./advanced-settings-reference/images/01.png)

## HTML Tag (Automatic Copy)

ウェブスクレイパー、ブラウザ、サイトレンダラーが、ページ上にあるコンテンツの種類をより簡単に検索して取得できるようにするためのHTMLタグがいくつか存在します。 *Container* Page Fragmentでは、ページ上のContainer FragmentのHTML要素にどのタグを生成するかを選択することができます。

| 項目                        | Description                                                                                                                                 |
|:------------------------- |:------------------------------------------------------------------------------------------------------------------------------------------- |
| HTML Tag (Automatic Copy) | フラグメントに生成されるHTMLタグを選択します（コンテナフラグメントのみ）。 利用可能なオプションは、 `div` （デフォルト）、 `header`, `nav`, `section`, `article`, `main`, `aside`, and `footer`です。 |

```{note}
選択されたタグは、コンテナフラグメント自体にのみ適用され、その中に入れ子になっている他のフラグメントやコンテンツには適用されません。
```

![コンテナ・フラグメントに使用するHTMLタグは、「詳細設定」タブで選択することができます。](./advanced-settings-reference/images/02.png)

## 検索結果からのコンテンツ非表示

サイト内の検索結果からページフラグを隠したい場合があります。 この設定は、特に、あるフラグメントが多くのページで共通して再利用されるなど、コンテンツ検索に関連性がない場合に、無関係な検索結果が繰り返されることを防ぐのに役立ちます。

![無関係なフラグメントやよく再利用されるフラグメントを非表示にして、サイトの検索結果を改善することができます。](./advanced-settings-reference/images/03.png)

## 追加情報

* [一般設定リファレンス](./general-settings-reference.md)
* [フラグメントの使用](../../using-fragments.md)
* [新しいスタイルブックの作成](../../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md)
* [スタイルブックトークンの定義](../../../../site-appearance/style-books/developer-guide/style-book-token-definitions.md)
