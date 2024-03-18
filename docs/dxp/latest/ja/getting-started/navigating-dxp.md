# DXPのナビゲート

Liferay DXP のすぐに使えるナビゲーションは、3つの主要なエリアに分かれています： [**サイトメニュー**](#site-menu) 、[**パーソナルメニュー**](#personal-menu) 、[**グローバルメニュー**](#global-menu) 。

## サイトメニュー

画面左側のDXP **サイトメニュー** には、現在表示されている特定のサイトを対象としたアクション、コンテンツ、設定が含まれています。 アプリケーションバーの **サイトメニュー**(![サイトメニュー](../images/icon-menu.png))をクリックすると、展開または非表示にすることができます。

![Expand the site menu so that all options are visible.](./navigating-dxp/images/01.png)

サイトメニューは選択されたサイトを示す。 上記の例では、サイトは `Liferay DXP` です。 サイトメニューの **Compass**(![Compass](../images/icon-compass.png))をクリックすると、作業中のサイトを変更できます。

これらは、サイト・メニューで行える一般的なサイト構築と管理作業である：

- [ページの追加](../site-building/creating-pages/adding-pages/adding-a-page-to-a-site.md)
- [コンテンツの作成](../content-authoring-and-management.md)
- [サイト・メンバーシップの管理](../site-building/sites/site-membership/adding-members-to-sites.md)
- [サイトの動作と機能の設定と最適化](../site-building.html)

## アプリケーションバー

アプリケーションバー_は各ページの上部に表示され、 [サイトメニュー](#site-menu) アプリケーション。 アプリケーションバーには、現在開いているアプリケーションによって異なるオプションを持つアクションメニュー(![Actions](../images/icon-actions.png))が表示されます。

![The actions available in the application bar depend on the application open at the moment.](./navigating-dxp/images/02.png)

ビュー・モードでページを開くと、アプリケーション・バーで使用できるツールはページの種類によって変わります。

![Content pages and widget pages show a different set of tools in the application bar.](./navigating-dxp/images/03.png)

[コンテンツページ](../site-building/creating-pages/using-content-pages.md) (A)の場合、利用可能なツールは以下の通り。

| ツール                                                                         | 説明                                                                                                                                                                            |
| :-------------------------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 編集(![編集](../images/icon-edit.png))                       | ページのエディターにアクセスする。                                                                                                                                                             |
| 設定ページ (![設定ページ](../images/icon-settings.png))            | ページの設定にアクセスする。                                                                                                                                                                |
| シミュレーション(![シミュレーション](../images/icon-simulation.png))     | さまざまな画面サイズと、ユーザーがページ上に表示できるコンテンツのプレビューにアクセスできます。                                                                                                                              |
| コンテンツ・パフォーマンス (![パフォーマンス](../images/icon-analytics.png)) | コンテンツパフォーマンスを定量的に分析するのに役立つ [コンテンツパフォーマンスツール](./../content-authoring-and-management/page-performance-and-accessibility/about-the-content-performance-tool.md) を開きます。 |
| A/Bテスト(![A/Bテスト](../images/icon-ab-testing.png))         | [A/Bテストツール](./../site-building/optimizing-sites/ab-testing/ab-testing.md) を開き、現在のデザインに対してバリアントデザインをテストすることで、コンテンツページの効果を評価します。                                      |
| ページ監査 (![ページ監査](../images/icon-information.png))         | [ページ監査ツール](./../content-authoring-and-management/page-performance-and-accessibility/about-the-page-audit-tool.md) を開き、ユーザーがパフォーマンス関連の問題を特定するのに役立ちます。                |

[ウィジェットページ](../site-building/creating-pages/using-widget-pages/adding-widgets-to-a-page.md) (B)の場合、利用可能なオプションは以下の通り。

| ツール                                                                         | 説明                                                                                                                                                                            |
| :-------------------------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 設定ページ (![設定ページ](../images/icon-settings.png))            | ページの設定にアクセスする。                                                                                                                                                                |
| トグルコントロール (![トグルコントロール](../images/icon-preview.png))     | カーソルを乗せたときにポップアップするウィジェットのコントロールを有効/無効にします。                                                                                                                                   |
| 追加(![追加](../images/icon-plus.png))                       | ページのエディターにアクセスする。                                                                                                                                                             |
| シミュレーション(![シミュレーション](../images/icon-simulation.png))     | さまざまな画面サイズと、ユーザーがページ上に表示できるコンテンツのプレビューにアクセスできます。                                                                                                                              |
| コンテンツ・パフォーマンス (![パフォーマンス](../images/icon-analytics.png)) | コンテンツパフォーマンスを定量的に分析するのに役立つ [コンテンツパフォーマンスツール](./../content-authoring-and-management/page-performance-and-accessibility/about-the-content-performance-tool.md) を開きます。 |
| ページ監査 (![ページ監査](../images/icon-information.png))         | [ページ監査ツール](./../content-authoring-and-management/page-performance-and-accessibility/about-the-page-audit-tool.md) を開き、ユーザーがパフォーマンス関連の問題を特定するのに役立ちます。                |

!!! note
    コンテンツページとウィジェットページのアプリケーションバーオプションはLiferay DXPのバージョンによって異なります。 [コンテンツパフォーマンス](../content-authoring-and-management/page-performance-and-accessibility/about-the-content-performance-tool.md) は、Liferay DXP 7.3からコンテンツページで、Liferay DXP 7.4からウィジェットページで利用できます。 Page AuditはLiferay DXP 7.4から、Toggle ControlsオプションはLiferay DXP 7.3から利用できます。

## 個人用メニュー

パーソナル・メニューは、ログインしているユーザーの情報とアクティビティのハブです。

![The Liferay DXP Personal Menu is available by clicking the avatar icon in the top right.](./navigating-dxp/images/04.png)

これらは、ユーザーが個人メニューから実行できるいくつかの一般的なアクションである：

- [アカウント情報の変更](./introduction-to-the-admin-account.md#changing-account-information) 
- [](../site-building/sites/site-membership/adding-members-to-sites.md) 
- [サイト通知](../collaboration-and-social/notifications-and-requests/user-guide/managing-notifications-and-requests.md) 
- [サインアウト](./introduction-to-the-admin-account.md#signing-out) 

## グローバルメニュー

DXP **グローバルメニュー** には、 [アプリケーション](#applications-menu) 、 [コマース](#commerce-menu) 、 [コントロールパネル](#control-panel) メニューがあります。 画面右上の **Global Menu**（![Global Menu](../images/icon-applications-menu.png)）をクリックしてアクセスします。

!!! note
    デフォルトでは、 **Guest** または **User** ロールを持つユーザーはグローバルメニューにアクセスすることができません。

また、インターフェースの右側にあるグローバルメニューの「アプリケーション」、「コマース」、または「コントロールパネル」タブから、利用可能な他のサイトに移動することもできます。

### グローバルメニュー

アプリケーションメニューには、Liferay DXPサーバー内の様々なアプリケーションを管理するためのリンクが含まれています。

![The applications menu contains many global settings and important functions applicable to all sites.](./navigating-dxp/images/05.png)

ここでは、アプリケーションメニューから管理できるアプリケーションの一部を紹介します：

- [コンテンツ・ダッシュボード](../content-authoring-and-management/content-dashboard.md) 
- [ワークフロー](../process-automation/workflow/introduction-to-workflow.md) 
- [リモートアプリ](../building-applications/client-extensions/frontend-client-extensions.md#custom-element-client-extensions) 

### コマースメニュー

Liferay 7.3 CE GA6およびLiferay DXP 7.3 GA1以降、Liferay Commerce 3.0はLiferay Portal 7.3 CE GA6およびLiferay DXP 7.3 GA1にバンドルされるようになりました。

![The Commerce Menu contains all store functions.](./navigating-dxp/images/06.png)

Liferay Commerceから管理できる機能をいくつか紹介します：

- [新しいカタログを作成する](https://learn.liferay.com/commerce/latest/ja/product-management/catalogs/creating-a-new-catalog.html) 
- [チャネルの管理](https://learn.liferay.com/ja/w/commerce/store-management/channels/managing-channels) 
- [在庫管理](https://learn.liferay.com/commerce/latest/ja/inventory-management.html) 
- [注文の処理](https://learn.liferay.com/commerce/latest/ja/order-management/orders/processing-an-order.html) 

Liferay Commerce の詳細については、 [Liferay Commerceの概要](https://learn.liferay.com/commerce/latest/ja/starting-a-store/introduction-to-liferay-commerce.html) を参照してください。

### コントロールパネル

コントロールパネル_には一般的な管理アクションと設定が含まれており、Liferay DXPインストレーションまたは特定のインスタンスに対してグローバルにスコープすることができます。

![The control panel is now part of the global menu.](./navigating-dxp/images/07.png)

以下は、コントロールパネルでできる一般的な管理作業です：

- [ユーザー、権限、ロールの管理](../users-and-permissions/users/adding-and-managing-users.md) 
- [ユーザーのログイン方法を変更する](../installation-and-upgrades/securing-liferay/authentication-basics.md) 
- [新しいサイトの作成](../site-building/sites/adding-a-site.md) 
- [サイト上のアプリケーションに新しいカスタムフィールドを追加](./../system-administration/configuring-liferay/adding-custom-fields.md) 

## DXP7.1および7.2

Liferay DXPの7.3より前のバージョンでは、グローバルメニューの内容は画面左側のサイトメニューの上にあるコントロールパネル内にあります。

![The control panel in DXP 7.1 and 7.2 is located above the site menu.](./navigating-dxp/images/08.png)

## 次のステップ

入門ウォークスルーを続け、 [最初のサイトの作成](./creating-your-first-site.md) について学びましょう。

## 関連トピック

- [最初のサイトの作成](./creating-your-first-site.md) 
- [サイトの外観を変更する](./changing-your-sites-appearance.md) 
