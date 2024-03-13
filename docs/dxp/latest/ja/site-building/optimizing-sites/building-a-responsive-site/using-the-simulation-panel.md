# シミュレーションパネルの使用

{bdg-secondary}`利用可能 Liferay DXP 2023.Q4+/Portal GA102+`

さまざまなシナリオをシミュレートすることで、ページの応答性を検証できます。

Liferayでは、シミュレーションパネルを使って、異なる [スクリーンサイズ](#simulation-panel-screen-size) をシミュレートし、利用可能な [セグメント](../../personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) に向けた [ページコンテンツ](#simulation-panel-page-content) と組み合わせたり、異なる [エクスペリエンス](../../personalizing-site-experience/experience-personalization/creating-and-managing-experiences.md) をページに適用したりすることができます。

## シミュレーションパネルへのアクセス

シミュレーションパネル(![シミュレーションパネル](../../../images/icon-simulation.png))はアプリケーションバーにあります。

![The Simulation panel is located in the application bar.](./using-the-simulation-panel/images/01.png)

シミュレーションパネルを使用するには、アドレスを使ってページにアクセスするか、Pagesアプリケーションからアクセスします。 Pagesアプリケーションでページを表示するには

1. **サイトメニュー**(![サイトメニュー](../../../images/icon-product-menu.png))を開き、 **サイトビルダー** &rarr; **ページ** に移動します。

1. 見たいページを見つけて、 **アクション**（![アクションアイコン](../../../images/icon-actions.png)）をクリックする。 &rarr; **表示** .

!!! 重要
    シミュレーションパネルを使用するには、「デバイスでプレビュー」権限が必要です。 コントロールパネル &rarr; サイト &rarr; サイト &rarr; リソース許可 &rarr; サイトの下にあります。 パーミッションの詳細については、 [ロール権限の定義](../../../users-and-permissions/roles-and-permissions/defining-role-permissions.md) を参照してください。

## シミュレーションパネル画面サイズ

画面サイズのシミュレーションには、3つの定義済み値（デスクトップ、タブレット、モバイル）と、2つの可変値（オートサイズとカスタム）の5つのオプションがあります。 内容をシミュレートするには、 **Options**( [Options](../../../images/icon-options.png) ) をクリックします。

|                                                                       オプション | 高さ           | 幅       |
| --------------------------------------------------------------------------: | :----------- | :------ |
| デスクトップ (![デスクトップアイコン](../../../images/icon-desktop.png)) | 1050 px      | 1300 px |
|     タブレット(![タブレットアイコン](../../../images/icon-tablet.png)) | 900 px       | 808 px  |
|       モバイル(![モバイルアイコン](../../../images/icon-mobile.png)) | 640 px       | 400 px  |
| オートサイズ(![オートサイズアイコン](../../../images/icon-autosize.png)) | ウィンドウ[^1]に適応 | 窓に適応    |
|       カスタム(![カスタムアイコン](../../../images/icon-custom.png)) | カスタム入力[^2］  | カスタム入力  |

[^1]: autosizeオプションは、シミュレーションをウィンドウのサイズに合わせます。

[^2]: シミュレートされたスクリーンの高さと幅にカスタム値を入力します。

![Simulating a desktop using the default experience.](./using-the-simulation-panel/images/02.png)

## シミュレーションパネルページ内容

セグメントやエクスペリエンスを設定している場合は、適用されたセグメントやエクスペリエンスに基づいてコンテンツをシミュレートすることもできます。 シミュレーション・パネルでは、体験やセグメントがどのように見えるかをシミュレーション画面で視覚化することができます。

1. 最初のセレクタで、「Preview By」の下にある「**Segments**」または「**Experiences**」を選択すると、2番目のセレクタで利用可能なセグメントとエクスペリエンスが表示されます。

1. 利用可能なセグメントや体験があれば、2番目のセレクタで選択する。

!!! note
    シミュレートされたコンテンツの上に表示されるメッセージは、適用されたセグメント／エクスペリエンスに関する情報を提供する。

![Selecting different experiences using the Page Content selectors.](./using-the-simulation-panel/images/03.gif)

## 関連トピック

[レスポンシブ・サイトの構築](../building-a-responsive-site.md)

[ユーザーセグメントの作成と管理](../../personalizing-site-experience/segmentation/creating-and-managing-user-segments.md)

[経験の創造と管理](../../personalizing-site-experience/experience-personalization/creating-and-managing-experiences.md)
