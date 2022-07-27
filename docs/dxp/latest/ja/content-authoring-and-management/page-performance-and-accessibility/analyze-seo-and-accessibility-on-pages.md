# ページのSEOとアクセシビリティを分析する

Liferay DXP 7.4以降、ページ監査ツールを使用して、ページのSEOとアクセシビリティを調べることができます。 ページ監査ツールは [Google PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights/) サービスを使用して、Liferay DXPに特定の推奨事項を提供します。  このツールを使用すると、コンテンツ作成者は次のことができます。

- ページが検索エンジンのインデックス作成と可視性のために最適化されていることを確認します。これにより、ページは検索結果で上位にランク付けされ、適切なオーディエンスにリーチできます。
- ページがアクセシビリティのベストプラクティスに準拠しているかどうかを確認し、すべての個人の使いやすさと全体的なエクスペリエンスを向上させます。
- 実用的な情報を使用して、ページに影響を与えるSEOとアクセシビリティの問題を修正します。

```{important}
ページ監査ツールはPageSpeed Insightsを使用しているため、一般にアクセス可能なページでのみ機能します。 非公開ページがLiferayシステムで有効になっている場合は、このツールを使用することはできません。
```

## SEOとアクセシビリティのチェック

Liferay DXPのページ監査ツールは、次の要素を評価します。

SEOの問題：

- 正しくない画像のアスペクト比
- 欠落しているmeta-description
- リンクテキスト
- インデックスからブロックされているページ
- 無効な`hreflang`
- 無効な正規化URL
- 判読できないフォントサイズ
- 小さなタップ対象
- 欠落している`<title>`要素
- 一部のクロールできないリンク

アクセシビリティの問題：

- 低いコントラスト比
- 欠落している`img-alt`属性
- 欠落している`input-alt`属性

ページ監査を実行した後、問題を修正するための実用的な情報とともに、各問題の説明を確認できます。 これらの各要素の詳細については、 [Google Lighthouseのドキュメンテーション](https://web.dev/learn/#lighthouse) を参照してください。

## ページ監査ツールの構成

```{note}
ページ監査ツールを構成するには、Liferay DXPへの管理アクセスが必要です。
```

ページ監査ツールはデフォルトで有効になっていますが、ページ監査を実行する前にツールの構成を完了する必要があります。 この構成には以下が必要です。

- PageSpeed Insights APIキー。 Googleでは、PageSpeed Insightsを自動化された方法で使用し、1秒あたり複数のクエリを実行するために、このキーが必要です。 このAPIキーを作成するには、Googleドキュメンテーションの [Get Started with the PageSpeed Insights API](https://developers.google.com/speed/docs/insights/v5/get-started) を参照してください。
- ページ監査の優先戦略。 デフォルトでは、ページ監査ツールはモバイル戦略を使用しますが、ページを分析するためにデスクトップ戦略を構成することもできます。 モバイル戦略には、小さな画面でコンテンツを監査するための追加のルールが含まれています。 選択した戦略はすべてのページ監査に適用されるため、ページのモバイルバージョンとデスクトップバージョンを監査する場合は、各監査戦略を個別に実行する必要があります。

![ページ監査ツールのAPIキーと監査戦略を構成します](./analyze-seo-and-accessibility-on-pages/images/01.png)

ページ監査ツールを構成するには、Liferay DXPでGoogle PageSpeed Insights設定を構成します。 Liferay DXPの他の設定と同様に、さまざまなスコープでページ監査ツールを有効または無効にできます。 これらの構成設定にアクセスするには、管理者権限が必要です。 詳細は、 [設定スコープについて](../../system-administration/configuring-liferay/understanding-configuration-scope.md) を参照してください。

### 現在のサイトにページ監査ツールを構成する

1. サイトメニュー（![Site Menu](../../images/icon-product-menu-open.png)）を選択し、［Configuration］ &rarr; ［Site Settings］に移動します。
1. ［コンテンツとデータ］セクションで、*［Pages］*をクリックします。
1. ［Site Scope ］セクションで、*［Google PageSpeed Insights］*をクリックします。

   ![現在のサイトスコープでGoogle PageSpeed Insights設定を使用して、ページ監査ツールを構成します。](./analyze-seo-and-accessibility-on-pages/images/02.png)

   ```{note}
   Google PageSpeed Insights設定は、設定がより高いスコープとして有効になっている場合にのみ、サイトスコープで使用できます。 詳細については、[設定スコープについて](../../system-administration/configuring-liferay/understanding-configuration-scope.md)を参照してください。
   ```

1. ［Enable Google PageSpeed Insights］チェックボックスがオンになっていることを確認します。
1. Google PageSpeed Insights APIキーをコピーして、このキーを［API Key］フィールドの下に貼り付けます。
1. PageSpeed Insightsテスト用の優先戦略を選択します。 選択した戦略は、すべてのページ監査に適用されます。
1. *［保存］* をクリックします。

### Liferay DXPシステムにページ監査ツールを構成する

1. Liferay DXPのグローバルメニュー（![Global Menu](../../images/icon-applications-menu.png)）をクリックします。
1. *［コントロールパネル］*タブを選択し、［設定］の下で、*［System Settings］*をクリックします。
1. ［コンテンツとデータ］セクションで、*［Pages］*をクリックします。
1. 目的のスコープ（システム、仮想インスタンス、またはサイト）の下で、*［Google PageSpeed Insights］*をクリックします。
1. *［Enable Google PageSpeed Insights］*チェックボックスをオンまたはオフにして、ページ監査ツールを有効または無効にします。

   ![システム、仮想インスタンス、またはサイトスコープでページ監査ツール設定を構成します](./analyze-seo-and-accessibility-on-pages/images/03.png)

1. *［Update］*をクリックします。

ページ監査ツールをグローバルに無効にするには、システムスコープで［Enable Google PageSpeed Insights］オプションをオフにします。

## ページ監査ツールへのアクセスとページ監査の実行

1. 監査するページにアクセスし、アプリケーションバーの*［ページ監査］* （![Page Audit](../../images/icon-information.png)）ボタンをクリックします。

   ![［ページ監査］ボタンをクリックして、新しいページ監査を開始します。](./analyze-seo-and-accessibility-on-pages/images/05.png)

   ```{note}
   ページ監査をまだ構成していない場合は、［ページ監査］パネルで構成を完了するように求められます。 この場合は、*構成*をクリックして [構成を完了](#configuring-the-page-audit-tool) してください。
   ```

1. ［ページ監査］パネルには、［ページ監査の開始］ボタンが表示されます。
1. *［ページ監査の開始］*をクリックして、ページをGoogle PageSpeed Insightsに接続し、監査プロセスを開始します。

テストを実行した後、ページを開いてページ監査（![Page Audit](../../images/icon-information.png)）ボタンをクリックすると、いつでも最後の監査結果を確認できます。

## ページ監査ツールでSEOとアクセシビリティの問題を分析する

監査を実行した後、ページ監査ツールには、Google PageSpeed Insightsのルールに従って、ページの問題が表示されます。 テスト名の横の数字は、その特定のテストのエラーの総数を示します（または、テストに100を超えるエラーがある場合は`+100`）。

問題をクリックすると、次の3つのセクションが表示されます。

**Description（C）：** 選択した監査テストに関する一般的な情報を提供します。

**Tips（D）：** エラーソースに関するより具体的な情報と、Liferay DXPでエラーを修正または軽減する方法が含まれています。

**Failing Elements（E）：** PageSpeed Insightルールを使用してテストに合格しなかったページ要素を一覧表示します。

![ページ監査ツールのGUIには、ページの問題の一覧と、問題を修正または軽減するための実用的な情報が表示されます。](./analyze-seo-and-accessibility-on-pages/images/04.png)

ページ監査ツールを使用するときは、次の情報を考慮してください。

- ページで以前に監査テストを実行したことがある場合、ページ監査ツールは最後のテストの実行時間とテスト結果を表示します。 ページ監査の結果を更新するには、再開する（![relaunch](../../images/icon-restore2.png)）アイコン（A）をクリックして新しいテストを実行します。
- ページ監査ツールは、特定の時間にSEOとアクセシビリティの問題についてページを分析します。 ページまたはページのコンテンツが変更された場合（たとえば、動的コンテンツを表示した場合）、テスト結果が異なる場合があります。
- ページ監査は、[デフォルトのエクスペリエンス](../../site-building/personalizing-site-experience/experience-personalization/creating-and-managing-experiences.md)の結果のみを表示します。
- ページがローカライズされている場合は、言語ごとにページ監査テストを実行できます。 テストを実行する前に、ページ監査ツールの_［フラグ］_ボタンをクリックして言語を選択してください。

  ![ページ監査ツールのフラグボタンを使用して、監査するページ言語を変更できます。](./analyze-seo-and-accessibility-on-pages/images/06.gif)

- [リモート本番環境ステージング](../../site-building/publishing-tools/staging.md)を使用してページを公開していて、ステージング環境がインターネットに接続されていない場合、ページ監査ツールは本番環境で使用できますが、問題の修正はステージング環境でのみ行うことができます。

## ページ監査パネルエラーのトラブルシューティング

ページを監査する際のエラーを回避するには、有効な [Google PageSpeed Insights APIキーを構成](#configuring-the-page-audit-tool) し、監査するページにインターネットからアクセスできることを確認してください。

### 一般的なエラー

| エラー             | 説明                                                                                                                                                                                                                                                 |
|:--------------- |:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| このAPIキーは無効です    | Google PageSpeed Insights APIキーが無効です。 エラーメッセージの*［APIキーを設定］*ボタンをクリックして、有効なAPIキーを構成します。 </br>APIキーを取得するには、Googleドキュメンテーションの [Get Started with the PageSpeed Insights API](https://developers.google.com/speed/docs/insights/v5/get-started) を参照してください。 |
| このページは監査できません   | 監査しようとしているページは、一般に公開されていません。                                                                                                                                                                                                                       |
| 予期しないエラーが発生しました | これは一般的なエラーです。 ページ監査ツールが正しく構成されていること、および監査するページにインターネットからアクセスできることを確認してください。                                                                                                                                                                        |

## 追加情報

- [Google PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights/)
- [PageSpeed Insights API を使ってみる](https://developers.google.com/speed/docs/insights/v5/get-started)
- [設定スコープについて](../../system-administration/configuring-liferay/understanding-configuration-scope.md)
