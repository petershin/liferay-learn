# Liferay Commerceを既存のLiferayインストールにデプロイする

この記事では、Liferay Commerceを既存のLiferay DXPインスタンスにデプロイする方法について説明します。 Liferay CommerceはLiferay DXP上に構築されているため、既存のDXP 7.1または7.2インスタンスを実行している必要があります。 このガイドに従う前に、システム要件を確認してください。

Liferay Commerceの使用を開始するには：

1. 最新の Liferay Commerce `LPKG` をダウンロードしてください。
   * エンタープライズ契約者は [ヘルプセンター](https://customer.liferay.com/downloads?p_p_id=com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_productAssetCategoryId=118190997&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191001) から最新の `LPKG` をダウンロードできる。
     * エンタープライズ契約のお客様は、Liferay Commerceの注文番号またはアクティベーションキーも必要です。 [プロキシサーバーを介したMarketplaceアプリのアクティブ化](https://help.liferay.com/hc/en-us/articles/360018427391) を参照してください。
   * 最新のオープンソース `LPKG` は [Liferay Commerce Community Download Page](https://www.liferay.com/downloads-community) から入手できます。

1. `${liferay.home}/deploy`フォルダに`LPKG` をデプロイする。

    ```{note}
    Liferay DXP へのアプリケーションのデプロイについては、 [Liferay Home](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/reference/liferay-home.html) を参照してください。
    ```

1. (_Subscribers_) アクティベーション・キーを `${liferay.home}/deploy` フォルダーにデプロイします。

1. アプリケーションサーバーコンソールに次のメッセージが表示されることを確認します。

   ```
   2019-08-09 00:25:10.662 INFO  [fileinstall-/../../liferay-dxp-7.1.10.1-sp1/osgi/marketplace][LPKGArtifactInstaller:202] The portal instance needs to be restarted to complete the installation of file:/../../liferay-dxp-7.1.10.1-sp1/osgi/marketplace/Liferay%20Commerce%20-%20API.lpkg
   2019-08-09 00:25:10.664 INFO  [fileinstall-/../..//liferay-dxp-7.1.10.1-sp1/osgi/marketplace][LPKGArtifactInstaller:202] The portal instance needs to be restarted to complete the installation of file:/../../liferay-dxp-7.1.10.1-sp1/osgi/marketplace/Liferay%20Commerce%20-%20Impl.lpkg
   ```

1. アプリケーションサーバーを完全にシャットダウンします。

1. アプリケーションサーバーを起動します。

1. このメッセージを見て、`LPKG`がインストールを開始したことを確認する：

   ```
   2019-08-09 00:32:48.850 INFO  [main][BaseDeployer:877] Deploying minium-theme.war
   ```

1. **最初の**デプロイでは、一連のコマンドの後にこのメッセージが表示される：

   ```
   2019-08-09 00:34:51.753 INFO  [main][ThemeHotDeployListener:108] 1 theme for minium-theme is available for use
   ```

1. 初回起動時に、Liferay Commerce のデフォルトコンテンツに再インデックスを実行します。_Control Panel_ &rarr; _Configuration_ &rarr; _Search_ に移動します。

1. _すべての検索インデックス_の隣にある_再インデックス_をクリックします。

Liferay Commerceがデプロイされ、使用できる状態になりました。 ストア管理者は、ストアフロントの構築とカタログの作成を開始できます。

## 関連トピック

アプリケーションサーバーが再起動された場合、Liferay Commerce は `VerifyProcess` コマンドを2度目は実行しないことに注意してください。

* [Liferay Commerce 3.0 互換性マトリックス](https://help.liferay.com/hc/en-us/articles/360049238151)
* [インストールの概要](../installation-overview.md)
* [Liferay Commerce Tomcat Bundle の使用](./using-the-liferay-commerce-tomcat-bundle.md)
