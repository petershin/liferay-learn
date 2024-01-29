---
toc:
  - ./extending-liferay/low-code-no-code.md
  - ./extending-liferay/client-extensions.md
visibility:
- Employee
- Partner
---
# Liferayの拡張

**概要**

* Liferayを拡張することは、プラットフォームの可能性をフルに活用する上で非常に重要です。
* 特定のビジネスニーズを念頭に置いてLiferayをカスタマイズすることで、ユーザーのニーズに合わせたデジタル体験を作成することができます。
* このモジュールでは、Liferayを拡張する5つの主要な方法を紹介します。
  * エディタ
  * 設定
  * ローコード
  * 統合
  * クライアント拡張機能

## 背景

Liferay DXPは、フル機能のデジタルエクスペリエンスプラットフォームであり、顧客のための洗練されたソリューションを実装するために使用できる幅広い機能をすぐに提供します。

このように幅広い機能を備えていても、それぞれの顧客には、すぐに使える機能だけでは満たせない要件がある。 Liferayは常に柔軟なプラットフォームであり、各顧客独自の要件を実現するためにカスタマイズや拡張を行うことができます。

このモジュールでは、顧客のニーズを満たすためにLiferayを拡張、設定、カスタマイズするために使用できる主要なアプローチを概説します。

```{note}
* 本モジュールのライブワークショップの [録画](https://learn.liferay.com/ja/c/portal/login) をご覧ください。
* 上記ワークショップで使用されたプレゼンテーション資料はこちら [PDF](https://learn.liferay.com/ja/c/portal/login) からダウンロードしてください。
```

## 伝統的なカスタマイズ

Liferay DXP 7.3までは、Liferayを拡張する主な方法はJava OSGiモジュールを書くことでした。 これにより開発者は、高度な柔軟性とカスタマイズ性を実現しながら、機能の追加、削除、変更を簡単に行うことができるようになった。

OSGiモジュールはプラットフォームのコアにデプロイされ、拡張される：

* コアの変更は、APIの変更などによるアップグレードに影響する。
* Liferay DXPの新しいリリースでは、フルアップグレードを行わないと新機能にアクセスできません。

## Liferay DXPの最新バージョン

重要なのは、その点である：

* Liferay DXPの最新バージョンには、3つの主要な機能セットが含まれています：デジタルエクスペリエンスプラットフォームコア、コマース、アナリティクス
* これにより、顧客は簡素化された製品ラインだけでなく、四半期ごとの最新情報を入手することもできる。
* アップデートには、既知の問題の修正だけでなく、新機能も含まれています。

![Liferay DXPには、デジタル・エクスペリエンス・プラットフォームの中核機能と、コマースとアナリティクスが含まれています。](./extending-liferay/images/01.png)

## Liferayを拡張する - エディタ

Liferay DXPを拡張する1つの方法として、すぐに使える様々なエディターがあります。 例えば、Liferayのエクスペリエンスマネジメント機能を通じて提供される機能を利用する。

これらの方法によって、ユーザーは視覚的な方法でページを構築し、設定することができる。 代表的な例をいくつか挙げよう：

* フラグメント
* 公開
* テーマ
* スタイルブック
* テンプレート

### フラグメント

[フラグメントの使用](https://learn.liferay.com/web/guest/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments) はLiferay DXPでリッチページを作成するために使用できるビルディングブロックの1つです。 フラグメントはコンテンツ作成者とページ作成者が使用することを目的としています。

![Liferayのページビルダーは、個々のページを構築するために使用される幅広いフラグメントをページ作成者に提供します。](./extending-liferay/images/02.png)

Liferayのドラッグアンドドロップインターフェースのおかげで、ページへのフラグメントの追加や、追加後の設定は、技術的な専門知識に関係なく、誰にでもできる簡単なプロセスです。 また、あらかじめ設定されたフラグメントのセットを、 [フラグメント構成の保存](https://learn.liferay.com/web/guest/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/saving-fragment-compositions) として保存することもでき、これを他のページに追加することで、類似ページの作成プロセスを短縮することができる。

**ページフラグメントの開発**

![フラグメント・エディターにより、開発者はHTMLと必要に応じてCSS、JavaScript、Freemarkerを追加してカスタムフラグメントを作成することができます。](./extending-liferay/images/03.png)

これに加えて、開発者はUI内のエディターやCLIツールを使って、ゼロから新しいフラグメントを作成することができる。 開発者は、HTMLと、オプションでCSS、JavaScript、Freemarkerを組み合わせて、ほとんどすべての目的に対応する新しいフラグメントを構築する。

参照： [ページフラグメントの開発](https://learn.liferay.com/web/guest/w/dxp/site-building/developer-guide/developing-page-fragments)

### 公開

![パブリケーションは、コンテンツ作成者が変更を準備し、スケジュールに従って公開することを可能にする。](./extending-liferay/images/04.png)

[公開](https://learn.liferay.com/w/dxp/site-building/publishing-tools/publications) 機能により、コンテンツ作成者は変更を準備し、スケジュールに従って公開することができる。 これは、通常のパブリッシングプロセスをサポートするだけでなく、特別な変更（たとえば、画像の更新や新しいページの追加を伴う季節のプロモーションなど）にも使用できます。

お客様はパブリケーションを作成し、必要なユーザーを招待して、パブリッシュする前に変更を加えることができます。

### テーマ

[テーマの概要](https://learn.liferay.com/ja/w/dxp/site-building/site-appearance/themes/introduction-to-themes) は、Liferayサイトのルック＆フィールをカスタマイズする柔軟な方法を提供します。 テーマはDXPにコードを展開する必要があるため、Liferay Experience Cloud SaaSの顧客にはサポートされていません。

### スタイルブック

![スタイルブックは、色、フォント、スペーシングなど、サイトに適用されるビジュアル・スタンダードのセットです。](./extending-liferay/images/05.png)

[スタイルブックを使用してサイトの外観を標準化する](https://learn.liferay.com/ja/w/dxp/site-building/site-appearance/style-books/using-a-style-book-to-standardize-site-appearance) は、色、フォント、スペーシングなど、サイトに適用されるビジュアル・スタンダードのセットです。 これにより、各ページで一貫した体験を維持しながら、各ページのレイアウトを独立してデザインすることができる。

### テンプレート

![Liferayは、人気のあるFreemarkerスクリプト言語を使用して、開発者がウィジェットやアセットのカスタムテンプレートを作成できるようにします。](./extending-liferay/images/06.png)

テンプレートはLiferayのユーザーインターフェースの外観や動作をカスタマイズするための強力なツールです。 Liferayは、コンテンツやページのルックアンドフィールを変更するために使用される、再利用可能なテンプレートを作成する方法を提供します。

一旦エディターで記述されたテンプレートは、マーケティングチームなどのユーザーが選択することができ、ページにコンテンツを簡単に表示することができる。

技術的なレベルでは、テンプレートはHTML、CSS、Javascriptの組み合わせを使用し、Freemarkerと呼ばれる一般的なスクリプト言語に基づいています。

こちらも参照のこと：

* [Webコンテンツテンプレート](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/web-content/web-content-templates)
* [情報テンプレートの使用](https://learn.liferay.com/w/dxp/site-building/displaying-content/using-information-templates)
* [ウィジェットテンプレートを使用したウィジェットのスタイル設定](https://learn.liferay.com/w/dxp/site-building/displaying-content/additional-content-display-options/styling-widgets-with-widget-templates)

## Liferay を拡張する - 設定

技術的にLiferayを拡張するわけではありませんが、Liferayが顧客の特定のニーズを満たしていることを確認するもう一つの効果的な方法は、コンフィギュレーションオプションを利用することです。 これらにより、開発者や管理者はコードを書くことなくプラットフォームの機能を拡張することができる。

コンフィギュレーション・オプションの例としては、以下のようなものがある：

* システム設定
* インスタンス設定

### システム設定

[システム設定](https://learn.liferay.com/w/dxp/system-administration/configuring-liferay/system-settings) 管理者は Liferay ポータルのグローバル設定を行うことができます。 サイト、メール、検索の設定など。

```{note}
Liferay Experience Cloud SaaS を使用して Liferay DXP をデプロイする場合、システム設定は使用できません。
```

### インスタンス設定

インスタンス設定は、特定のLiferayインスタンスの動作や外観をカスタマイズするための強力なツールです。 インスタンス設定では、認証、Eメール、言語、検索設定など、管理者が幅広いオプションを設定できます。

### 仮想インスタンス

[仮想インスタンス](https://learn.liferay.com/w/dxp/system-administration/configuring-liferay/virtual-instances) はLiferayのリソースを論理的に分離したもので、管理者は単一のLiferayインストール内に複数の独立したサイトを作成することができます。 各仮想インスタンスには、完全に個別のデータと設定があります。 それぞれはユニークなドメイン名でアクセスされ、どこから見ても、追加のインスタンスとインストールを共有する別のLiferayベースの実装です。

```{note}
Liferay Experience Cloud SaaS を使用して Liferay DXP をデプロイする場合、お客様は仮想インスタンスを作成できません。 事実上、彼らの環境は、他の顧客と共有する共有クラスタ内の仮想インスタンスである。 この仮想インスタンス内に、選択したサブスクリプションプランで提供される上限まで、追加のサイトを作成できます。
```

次へ [Low-Code / No-Code機能でLiferayを拡張する](./extending-liferay/low-code-no-code.md)
