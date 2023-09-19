# サイト構築を始める

サイトはLiferay DXPの基本的なコンポーネントです。 基本的に、サイトとは、追加機能を提供するコンテンツ・アプリケーションを含むページの集まりである。

Liferay DXPインスタンスを最初に起動し設定するとき、デフォルトのサイトが含まれます。 デフォルトではインスタンス名は *Liferay*ですが、この値はセットアップウィザードの設定やコントロールパネルの [Instance Settings](../system-administration/configuring-liferay/virtual-instances/instance-configuration.md) で変更することができます。

![Liferay DXPで強力なサイトを構築できます。](./getting-started-with-site-building/images/01.png)

## サイトの作成

Liferay DXPには、 [サイトの構築](./sites/adding-a-site.md) と [ページの作成](./creating-pages/adding-pages/adding-a-page-to-a-site.md)に必要なすべてのツールが含まれています。 既存の [サイトテンプレート](./sites/site-templates.md)からサイトを作成することもできます。このテンプレートには、アプリケーションを含む定義済みのページセットが含まれています。

ページも同様に柔軟です。 複数のページタイプがあります。 既存の[ページタイプ](./creating-pages/understanding-pages/understanding-pages.md)からページを作成するか、デフォルトの[ページテンプレート](./creating-pages/adding-pages/creating-a-page-template.md)、または自分で作成したページテンプレートからページを作成します。

サイトとページは階層的に整理することができます。 ネストされたページ（子ページ）や [ネストされたサイト](./sites/site-hierarchies.md) （子サイト）は、親サイトやページに好きなだけ追加できます。 Liferay DXPインスタンス全体で、さまざまな組織や従業員などのために複数のサイトを持つことが可能です。 [インポート/エクスポートオプション](./sites/exporting-importing-site-pages-and-content.md)を使用して、コンテンツやページをサイト間で共有することもできます。

ページとサイト [ナビゲーション](./site-navigation/using-the-navigation-menus-application.md) の動作は直感的で柔軟です。 ページを作成すると、自動的にナビゲーション・メニューに追加することができます。 お好みでページを非表示にしたり、ページへのアクセスを有効/制限するためにページパーミッションを設定することができます。

Liferay DXPは、ユーザーエクスペリエンスを中断することなくサイトに変更を加えることを可能にするツールも提供します。 Liferayサイトはステージングすることができ、ユーザーに公開する前にサイト上で変更を加えてテストすることができます。 Liferay DXPの [publications](./publishing-tools/publications.md) 機能がこれを処理します。 Publicationsを使用することで、ユーザーが見る本番サイトに影響を与えることなく、安全な環境でサイトを開発、追跡、更新することができます。

## コンテンツの表示

Liferay DXPのコンテンツ管理システム（CMS）は、さまざまな種類のコンテンツ（ブログ、画像、Webコンテンツ記事など）を作成、管理、および表示するためのさまざまなツールを提供します。 [Webコンテンツの表示ウィジェット](./displaying-content/additional-content-display-options/using-the-web-content-display-widget.md) を使って、任意のWebコンテンツ記事を表示することができます。

様々なタイプのコンテンツを混在して公開したい場合は、 [Asset Publisher](./displaying-content/using-the-asset-publisher-widget/displaying-assets-using-the-asset-publisher-widget.md) または [Collections](../site-building/displaying-content/additional-content-display-options/displaying-collections.md)をご利用ください。 アセットパブリッシャーが表示するコンテンツを手動で選択することも、特定の条件に基づいてアセットを動的に表示することもでき、ユーザーの体験を大幅にコントロールできます。 また、 [Iframe ウィジェット](./displaying-content/additional-content-display-options/using-the-iframe-widget.md) を使ったり、 [埋め込みページ](./creating-pages/understanding-pages/other-page-types.md#embedded)を作成することで、他のウェブサイトからコンテンツを埋め込むこともできます。

[Fragments](./creating-pages/page-fragments-and-widgets/using-fragments.md)に沿ってコンテンツを作成・編集することができます。 フラグメントとは、コード（CSS、HTML、JavaScript）の個々の断片のことで、これを並べたり組み合わせたりして、ページを構築することができます。 Liferayはすぐに使える多くのフラグメントを提供します。 [カスタマイズされたソリューションが必要な場合は、独自のフラグメントを修正または作成することができます](./developer-guide/developing-page-fragments/developing-fragments-intro.md)。

各コンテンツにはデフォルトのランディングページがありますが、 [表示ページテンプレート](./displaying-content/using-display-page-templates.md) を作成してカスタマイズすることができます。 表示ページテンプレートは、ウェブコンテンツの一部（タイトル、本文、画像など）をフラグメントにマッピングするもので、思い通りの外観を作ることができます。

![表示ページテンプレートでは、ウェブコンテンツをページフラグメントにマッピングして、ご希望のデザインとレイアウトでコンテンツを表示できます。](./getting-started-with-site-building/images/02.png)

## ユーザーエクスペリエンスのカスタマイズ

Liferay DXPの [パーソナライゼーションとセグメンテーション](./personalizing-site-experience.md) フレームワークにより、ユーザーの興味やニーズに対応し、それを満たすサイト体験を構築することができます。 [所属する組織やサイト内での役割など、特定の基準に基づいてユーザーセグメント](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) を作成し、それを使用して [パーソナライズされたページレイアウトやコンテンツ](./personalizing-site-experience/experience-personalization/content-page-personalization.md) をユーザー層に合わせて表示したり、 [Analytics Cloud](https://learn.liferay.com/analytics-cloud/latest/en/connecting-data-sources/connecting-liferay-dxp-to-analytics-cloud.html) と統合してセグメント内のユーザーの行動を分析し、サイトとのインタラクションを確認したりすることができます。 [ユーザーの行動に基づいてコンテンツを推奨](./personalizing-site-experience/experience-personalization/understanding-content-recommendations.md)することもできます。

<!-- Screenshot -->

## サイトのカスタマイズと設定

あなたのサイトの外観、動作、機能を変更するために利用可能な多くの [設定](./site-settings/site-settings-ui-reference.md)。 [サイトとそのコンテンツは、](./site-settings/site-localization.md) 、必要に応じて簡単に多言語にローカライズできる。

サイトのルック＆フィールを[異なるテーマを使用することで変更](../getting-started/changing-your-sites-appearance.md)することができます。 テーマは [Liferay Marketplace](../system-administration/installing-and-managing-apps/using-marketplace.md)からダウンロードしてデプロイすることもできますし、 [自分でテーマを作成することもできます](./site-appearance/themes/theme-development/getting-started/setting-up-an-environment-and-creating-a-theme.md)。 テーマはサイト全体のルック＆フィールを決定し、ページのCSS、JavaScript、HTMLを定義します（FreeMarkerのテンプレートを使用）。  FreeMarkerは、標準的なHTML要素を組み合わせ、変数、条件文、ループなどの機能を追加しています。 詳しくは [テーマの開発](./developer-guide.md) をご覧ください。

## サイトの最適化

Liferay DXP は、サイトの [検索エンジン最適化（SEO）ランキング](../site-building/displaying-content/using-display-page-templates/configuring-seo-and-open-graph.md)の向上から、 [各デバイスに最適化されたレスポンシブページ](./optimizing-sites/building-a-responsive-site/building-a-responsive-site.md) の作成、 [A/B テスト](../site-building/optimizing-sites/ab-testing/ab-testing.md)によるメッセージングキャンペーンの磨き上げまで、サイトを最適化するための複数のツールと機能を提供します。 A/Bテストは、ページの現在のデフォルトのバリエーションとページのバリアント（複数可）を比較し、特定のゴール（直帰率、クリック数など）に対してどのページがより良いパフォーマンスを示すかを確認します。 これにより、データに基づいてサイトに関するより良い判断ができるようになり、ユーザーや顧客にこれまで以上に迅速にサービスを提供できるようになります。
