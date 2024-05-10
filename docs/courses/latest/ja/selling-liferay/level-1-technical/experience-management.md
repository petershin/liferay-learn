---
toc:
  - ./experience-management/segmentation-personalization.md
  - ./experience-management/content-management-analytics.md
visibility:
- Employee
- Partner
---
# エクスペリエンスの管理

**概要**

* 管理者としてログインすれば、ページがどのように構築されるかを実演することができる。
* Liferayのエクスペリエンス管理機能のデモンストレーションの基本は以下の通りです：
  * サイトページ
  * セグメンテーションとパーソナライゼーション
  * コンテンツ管理
  * 分析
* ページは、Liferayのあらゆる情報がサイトユーザーに表示される主な方法です。

```{note}
* 本モジュールのライブワークショップの [録画](https://learn.liferay.com/ja/c/portal/login) をご覧ください。
* 上記ワークショップで使用されたプレゼンテーション資料はこちら [PDF](https://learn.liferay.com/ja/c/portal/login) からダウンロードしてください。
```

## 背景

[公開ページ](./public-pages-experience.md) のデモを行い、Liferayが提供する、ユーザーを [認証・認可するための機能](./liferay-authentication.md) について説明しました。デモの次の段階は、ユーザーがログインした後に利用できる機能を紹介することです。

このモジュールの大部分は、ページの作者や管理者の視点から経験管理機能を見せることを含んでいます - ページそのものを見せることは、公開ページに関する最初のモジュールですでにカバーされているからです。

![このモジュールは、ページ、セグメンテーションとパーソナライゼーション、コンテンツ管理、アナリティクスのセクションに分かれています。](./experience-management/images/01.png)

経験管理のさまざまな側面をよりよく理解するために、このモジュールは4つの主要セクションに分かれている：

* サイトページ
* セグメンテーションとパーソナライゼーション
* コンテンツ管理
* 分析

## サイトページ

[ページについて](https://learn.liferay.com/w/dxp/site-building/creating-pages/understanding-pages/understanding-pages) Liferay DXP はユーザーにコンテンツやアプリケーションを表示するために使用される主要な方法です。

デモを始める前に、ペルソナやユーザージャーニーなど、見込み客に見てもらう内容を紹介する。 より多くの文脈があれば、デモが始まったときに観客は何を見せられるのかをよりよく理解することができる。 そのためのヒントがある：

* ペルソナとユーザージャーニーを紹介する。
* Liferayが提供するシンプルさと、ページ構築に必要な労力の少なさを強調しています。
* バニラ環境を使わず、構築済みのデモを使うこと。
* 有意義で適切なコンテンツを事前に準備する。

これらのヒントに従うことで、Liferayでのページ管理がいかに簡単かを強調し、示すことができます。 専門的な知識がなくても、編集者はインラインでページを編集することができ、ページのデザインを変更したり、ページの内容を追加したり変更したりすることができる。

あらかじめ構築されたデモや、サイトイニシャライザーを使って構築されたサイトから始めると、バニラLiferay環境を使うよりもはるかに効果的です。 コンテンツや画像をアップロードする際には、デモ自体に関連するコンテンツを用意しておくこと。 プロスペクトのブランドや業種に関連した画像を使う方が、一般的な情報や画像を見て理解しようとするよりも、見ているものを自分たちのビジネスに関連付けやすいからだ。

### ページ編集のチュートリアル例

**ランディングページ**

![MasterclassはLiferayと共に提供されるサイトイニシャライザーで、学習管理アプリケーションの作成を可能にします。](./experience-management/images/02.png)

この例では、マスタークラスのサイト・イニシャライザー・テンプレートが使用されています。 しかし、これが個々の見込み客にとって適切でない場合は、見込み客のニーズや業種に最もマッチする別のサイト・イニシャライザーや事前に構築されたデモを使用する方がはるかに良い。

**ページの編集**

![ページの編集は、ツールバーの鉛筆アイコンを選択することで、Liferayのメインユーザーインターフェイスから直接行うことができます。](./experience-management/images/03.png)

編集モードを表示するには、ツールバーの鉛筆アイコンをクリックします。 テキストを変更するのがいかに簡単かを示し、変更がどのような効果をもたらすかを即座にプレビューできる。

下にスクロールすると、このグリッド内の各要素の幅を変更するなど、ページ構造をどのように変更できるかを示している。

**デバイスプレビュー**

![Liferayは、デザイナーが複数のデバイス上で各ページのレイアウトを制御する機能を提供します。](./experience-management/images/04.png)

編集者が異なるデバイスでページをプレビューできる方法を示す。 例えば、タブレットやモバイルでのグリッドの表示方法を変更することで、ページの応答性をコントロールする方法を簡単に示すことができる。

**画像の追加**

![どのページにも画像を追加するには、既存の画像から選択するか、新しい画像をアップロードするだけです。](./experience-management/images/05.png)

また、画像を変更したり、コンポーネントをドラッグ＆ドロップしてページ上にコンポーネントを追加する方法も紹介する。

**ページ翻訳**

![ユーザーはどのページでも、サポートされている言語のいずれかに翻訳することができます。](./experience-management/images/06.png)

Liferayアプリケーションを他の言語にローカライズする必要性が重要な場合、トップバーのアイコンから [コンテントページの翻訳](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/translating-pages-and-content/translating-content-pages) を簡単に直接追加できることを示します。 また、MLベースの自動翻訳サービスを利用して、 [翻訳のための第三者機関の利用](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/translating-pages-and-content/using-third-parties-for-translation) があることにも言及する。

最後にPublishボタンをクリックして、ページに加えた変更を公開します。

ページとその構成方法についての詳しい情報は、このサイトの別の場所で入手できる：

* [コンテントページの使用](https://learn.liferay.com/w/dxp/site-building/creating-pages/using-content-pages)
* [Content Page Editor UI Reference](https://learn.liferay.com/w/dxp/site-building/creating-pages/using-content-pages/content-page-editor-ui-reference)
* [フラグメントの使用](https://learn.liferay.com/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments)

### その他のトピック

デモのこの時点で取り上げると便利なトピックがいくつかある：

* [公開](https://learn.liferay.com/web/guest/w/dxp/site-building/publishing-tools/publications) ワークフロー
* [ページテンプレートの作成](https://learn.liferay.com/w/dxp/site-building/creating-pages/adding-pages/creating-a-page-template)
* ルック＆フィール

**出版ワークフロー**

ページを公開する際、公開ワークフローを有効にすることで、公開前に変更が検証され、Liferayが本番環境に公開する前にサイトコンテンツに変更を加える作業環境を提供するという概念を紹介する。

**ページテンプレート**

このハイレベルなデモでは、ニュース・ページは作成されていないが、もうひとつ紹介すべきトピックは、ユーザーが各ページをゼロから作成する必要がないということだ。 ユーザーは、ページ作成に必要な時間と労力を削減し、異なるページ間の一貫性を確保するために、事前定義されたページテンプレートから選択することができます。

**ルック&フィール**

表示されているUXはあくまで一例であり、色、ロゴ、フォント、ヘッダー、フッターなど、ルック＆フィールのあらゆる面を企業のブランディングに合わせて変更できることを強調する。 これらのトピックは、 [スタイリングの基本](./basics-of-styling.md) モジュールでカバーされます。

次：[セグメンテーションとパーソナライゼーション](./experience-management/segmentation-personalization.md)
