---
visibility:
- Employee
- Partner
---
# コンテンツ管理と分析

**概要**

* Liferayのエクスペリエンス管理機能のデモンストレーションの基本は以下の通りです：
  * サイトページ
  * セグメンテーションとパーソナライゼーション
  * コンテンツ管理
  * 分析
* コンテンツ管理は、技術者でないユーザーがウェブコンテンツ、ドキュメント、ブログなどを追加する機能を提供します。
* LiferayのAnalytics機能により、管理者やマーケティング担当者はLiferayサイトのパフォーマンスを把握し、改善を行うことができます。

```{note}
* 本モジュールのライブワークショップの [録画](https://learn.liferay.com/documents/d/guest/se1-4-experience-management) をご覧ください。
* 上記ワークショップで使用されたプレゼンテーション資料はこちら [PDF](https://learn.liferay.com/documents/d/guest/se1-4-experience-management-pdf) からダウンロードしてください。
```

## コンテンツ管理

Liferayは、技術者でなくてもコンテンツの作成、管理、整理ができる堅牢なコンテンツ管理システム（CMS）を提供します。 Liferay は、 [Web Content](https://learn.liferay.com/w/dxp/content-authoring-and-management/web-content) 、 [Documents and Media](https://learn.liferay.com/w/dxp/content-authoring-and-management/documents-and-media) 、Collections、 [Blogs](https://learn.liferay.com/w/dxp/content-authoring-and-management/blogs) など、さまざまなタイプのコンテンツをサポートしています。

デモでは、多くの利点が強調される：

1. LiferayのCMS機能により、ユーザーは簡単にコンテンツを作成し、適切な情報が含まれ、さまざまなデバイスやチャネルで正しく表示されるようにすることができます。
2. ユーザーは、ドキュメント、画像、ビデオ、その他の要素など、再利用可能なコンポーネントを使用してコンテンツを作成する時間と労力を節約できます。
3. ユーザーは、サイトのデジタル資産をすばやく整理、検索、プレビューできます。
    1. コンテンツはフォルダやサブフォルダで整理できる。
    2. [カテゴリーやタグ](https://learn.liferay.com/w/dxp/content-authoring-and-management/tags-and-categories) を割り当てることで、エンドユーザーが適切なコンテンツを見つけ、適切な製品やサービスを比較・選択しやすくなります。

### デモのヒント

* **WYSIWYGエディタ** . 新しいコンテンツを作成するよりも、あらかじめ作成されたコンテンツを表示し、内蔵のWYSIWYGエディタを使ってどのように編集できるかを示す方が効果的です。
* **アセットごとに異なる表示** . 記事、ケーススタディ、プレスリリースなど、さまざまなタイプのコンテンツを定義し、さまざまな方法で表示する方法を示します。
* **翻訳** . ローカライゼーションが見込み客にとって重要な場合は、コンテンツを手動または自動で翻訳できることを示す。
* **コンテンツ公開** . Liferayには、スケジュールパブリッシングや自動期限切れなどをサポートするコンテンツパブリッシング機能があります。
* **ネイティブフレームワークとの統合** . すべてのコンテンツ（ウェブコンテンツ、ブログ、ドキュメントなど）は、パーミッションフレームワーク、検索エンジン、ワークフローエンジンなど、Liferayのコア機能と統合されているという事実について話してください。
* **Office 365とGoogle Driveの統合** . 見込み客が文書管理に関心がある場合は、Liferay DXP が提供する [Office 365](https://learn.liferay.com/w/dxp/content-authoring-and-management/documents-and-media/devops/enabling-document-creation-and-editing-with-microsoft-office-365) および [Google Drive](https://learn.liferay.com/w/dxp/content-authoring-and-management/documents-and-media/devops/google-drive-integration) とのネイティブな統合について触れてください。 これらの統合により、ユーザーはLiferay内で使い慣れたツールを使ってドキュメントを作成することができ、前述のDXPの機能をすべて活用できるメリットがあります。

## 分析

Liferayの [Analytics機能](https://learn.liferay.com/w/analytics-cloud/getting-started/viewing-the-analytics-dashboard) 、ユーザーがどのようにコンテンツとインタラクトしているかを理解することができます。これは、より関連性の高い、カスタマイズされたエクスペリエンスを提供するのに役立つ重要なツールです。 Liferay Analytics Cloudは、改善すべき領域を特定するアナリティクスによって、組織がデジタルエクスペリエンスの成果を最適化できるよう支援します。

![Liferayの分析機能には、Analytics Cloudコンソールからアクセスします。](./content-management-analytics/images/01.png)

アナリティクスのデモを行うには、意味のある結果を出すのに十分なデータが環境にあることを確認する。 何もない環境にはグラフもなく、測定する資産もなく、利害分析もない。 デモ環境には、顧客が製品の価値を理解するのに十分なデータがあることを確認する。

Liferayのアナリティクス機能をデモするとき、あるいはアナリティクスについて話すときはいつも、例えばGoogle Analyticsのような他のツールと比較して、このソリューションを使用する主な利点を強調してください。

Liferay Analyticsは、顧客にシームレスなエクスペリエンスを提供するように設計されており、Liferay DXPとネイティブに統合されています。 お客様が手動でサイト内の各ページにjavascriptコードを追加する必要はありません。 アナリティクスのトラッキングは、LiferayのUIから簡単に [、](https://learn.liferay.com/w/analytics-cloud/getting-started/connecting-liferay-dxp-to-analytics-cloud) 。 これに加えて、お客様はアナリティクスコンソールにアクセスすることなく、DXPから直接ページのパフォーマンスを見ることができます。

サイトページでカスタムイベントをトリガーして構築する必要があったレポートや資産分析が、すぐに提供されます。 例えば、ドキュメントのダウンロード、フォームと放棄率、クエリー検索、ユーザーが示した興味などに関する分析など。

Liferayはまた、評価が必要な任意のページで簡単な設定を介して [多変量テスト](https://learn.liferay.com/w/analytics-cloud/optimization/a-b-testing) を実行するためにすぐに使える機能を提供します。 ほとんどの場合、テストを完了するために必要な時間とインタラクションの数のために、デモで実行中のA/Bテストを示すデータを準備することは現実的ではありません。

見込み客は、実際に結果を見ることよりも、A/Bテストが提供されていること、設定が簡単であることに関心がある。 一つの選択肢は、A/Bテストの設定方法を示した上で、データを生成するためにユーザーに繰り返しページにアクセスしてもらうことでしか結果が得られないことを説明することだ。

パーソナライゼーションのセクションで説明したように、アナリティクスを使用すると、行動データと履歴データを使用してオーディエンスをセグメント化できるという利点があります。 このデータを利用することで、企業はユーザーによりパーソナライズされた体験を提供することができる。

おめでとうございます - これでエクスペリエンスマネジメントのモジュールは終わりです - 次は [styling Liferay](../basics-of-styling.md)の基本で、既存のデモのルックアンドフィールを調整する方法を学びましょう。
