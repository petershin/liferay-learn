# 7.4のメンテナンスモードと非推奨

新しいLiferay DXPやLiferay Portalのリリースごとに、機能の継続的な拡張が保証されない場合や、廃止される可能性があります。 機能の拡張を停止すると、その機能は **メンテナンスモード** に入ります。

**メンテナンスモード：** サポートされている機能で、これ以上の機能強化は予定されていない

時代遅れの機能は最終的に削除されるか、より新しく改良された機能に置き換えられる。 廃止された機能のサポートを終了する前に、Liferayはそれを **廃止予定** とマークします。

**非推奨：** 次のマイナーバージョンリリースからはサポートされません。

```{important}
廃止予定の機能のサポートは、早ければ次のマイナーリリースで終了する可能性があるため、機能の使用を停止することを計画してください。
```

```{important}
詳細は、 [Maintenance Mode and Deprecation Policies](https://help.liferay.com/hc/ja/articles/360015767952-Maintenance-Mode-and-Deprecation) を参照してください。
```

## 廃止予定の機能の利用可能性

廃止予定の機能には、さまざまな利用可能性があります。

**バンドルされています：** Liferayにはこの機能が含まれています。

**マーケットプレイス：** この機能はマーケットプレイスアプリの最終バージョンに含まれています。

**最終版：** このLiferayバージョン用にマーケットプレイスアプリの最終版がリリースされています。

**アーカイブ：** この機能は利用できませんが、そのコードはLiferayのリポジトリ（ <https://repository.liferay.com/nexus/index.html#welcome>）のソースアーティファクトで利用できます。

**削除：** この機能とそのコードは使用できません。

## 7.4で廃止予定の機能

7.4で廃止予定の機能は次のとおりです。

| 機能                                         | 利用可能                    | メモ                                                                                                                                                                                                                                                   |
|:------------------------------------------ |:----------------------- |:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| アプリビルダー、アプリビルダーワークフロー                      | 削除済み                    | [Liferay Objects](../../../building-applications/objects.md)によって置き換えられました。                                                                                                                                                                           |
| Bootstrap 3 & Bootstrap 4 互換性レイヤー          | 削除済み                    | [Theme upgrade](../../../site-building/site-appearance/themes/upgrading-a-theme.md)時に互換性レイヤーを追加することを選択するか、手動でレイヤーを追加します。                                                                                                                             |
| コマースアカウントウィジェット                            | 削除済み                    | DXP/Portalアカウントウィジェットに置き換わりました。                                                                                                                                                                                                                      |
| 中央認証サービス（CAS）                              | アーカイブ済み                 | 7.2で廃止。 SAML、OpenID Connect、Token-based SSOなど、他のソリューションに置き換えられています。                                                                                                                                                                                  |
| コマースカテゴリ・ナビゲーションウィジェット                     | バンドル                    | [表示ページテンプレート](../../../site-building/displaying-content/using-display-page-templates.md) [メニュー表示](../../../site-building/site-navigation/configuring-menu-displays.md) 対応に置き換わりました。                                                                  |
| コマースの素材リスト（BOM）について                        | 削除済み                    | Replaceed by [commerceBOM](https://learn.liferay.com/w/commerce/product-management/creating-and-managing-products/product-types/shop-by-diagram) .                                                                                                |
| コマースカテゴリーコンテンツウィジェット                       | バンドル                    | [表示ページテンプレート](../../../site-building/displaying-content/using-display-page-templates.md)で置き換えられました。                                                                                                                                                  |
| ダイジェスト認証                                   | バンドル                    | ダイジェスト認証では、弱いパスワードのハッシュストレージが必要となり、これが脆弱性となります。                                                                                                                                                                                                      |
| 動的データリスト                                   | バンドル                    | 7.3で廃止。 [Liferay Objects](../../../building-applications/objects.md)によって置き換えられました。                                                                                                                                                                   |
| 輸出入リソース・インポーター                             | 削除済み                    | このインポーターはもともと、テーマがデプロイ時に追加のLiferayアセットを提供できるようにするために作られました。 これは7.4の以前のバージョンでは非推奨であり、7.4 U74 / 7.4 GA74で削除された。 サイトイニシャライザーや [クライアントエクステンション](../../../building-applications/client-extensions.md)などの新しいアプローチを活用することをお勧めします。                           |
| EXTプラグインサポート                               | 削除済み                    | 構成設定や標準的な拡張ポイントに置き換えられました。                                                                                                                                                                                                                           |
| Google ログイン/SSO                            | アーカイブ済み                 | 7.2で廃止。 SAML、OpenID Connect、Token-based SSOなど、他のソリューションに置き換えられています。                                                                                                                                                                                  |
| イメージエディター（Soyベース）                          | 削除済み                    | Reactベースのイメージエディターに置き換えられました。                                                                                                                                                                                                                        |
| JAASサポートコード                                | バンドル                    | 置換はありません。                                                                                                                                                                                                                                            |
| Liferay Mobile Device Detection Enterprise | アーカイブ済み                 | 7.2で廃止。 最新の定義については、51Degreesにお問い合わせください.                                                                                                                                                                                                             |
| Liferay Screens                            | 削除。 7.3でリリースされた最終バージョン。 | 直接的な代替はないが、モバイルSDKとヘッドレスAPIがモバイルアプリケーション開発をサポートする。                                                                                                                                                                                                   |
| Liferay SyncコネクターとSyncクライアント               | アーカイブ済み                 | 7.3で廃止。 直接の置換はありません。                                                                                                                                                                                                                                 |
| ライブユーザー                                    | バンドル                    | 7.2で廃止。  [Analytics Cloud](https://learn.liferay.com/w/analytics-cloud/index) によって置き換えられました。                                                                                                                                             |
| モバイルSDK                                    | 削除済み                    | [ヘッドレスデリバリー](../../../headless-delivery/using-liferay-as-a-headless-platform.md)に置き換えられました。                                                                                                                                                          |
| NTLM                                       | アーカイブ済み                 | 7.2で廃止。 [Kerberos](../../securing-liferay/configuring-sso/authenticating-with-kerberos.md)に置き換えられました。 Microsoft Windows™ アカウントの認証に NTLM を使用している場合は、 [Kerberos](../../securing-liferay/configuring-sso/authenticating-with-kerberos.md)を使用するように切り替える。 |
| OAuth 1.0a                                 | アーカイブ済み                 | 7.2で廃止。 これはLiferayコネクターからOAuth 2.0に置き換えられます。                                                                                                                                                                                                         |
| アンケート                                      | 削除済み                    | [Forms/Forms Reports](../../../process-automation/forms/sharing-forms-and-managing-submissions/form-reports.md)に置き換わりました。                                                                                                                            |
| 検索ウィジェット（クラシック）                            | バンドル                    | 7.1で廃止。 [検索ウィジェット](../../../using-search/search-pages-and-widgets/search-results/search-results.md)に置き換えられます。                                                                                                                                        |
| SOAP Webサービス                               | バンドル（デフォルトでは無効）         | JSON webサービス、RESTサービス、GraphQLサービスに置き換えられました。                                                                                                                                                                                                         |
| テーマ：Hello World                            | アーカイブ済み                 | 7.3で廃止。 直接の置換はありません。                                                                                                                                                                                                                                 |
| Webコンテンツの検索ウィジェット                          | アーカイブ済み                 |                                                                                                                                                                                                                                                      |

以前のLiferayバージョンからアップグレードする場合は、以前のバージョンで廃止になった機能も考慮する必要があります。

* [7.3の非推奨事項とメンテナンスモードに移行した機能](./maintenance-mode-and-deprecations-in-7-3.md)
* [7.2の非推奨事項とメンテナンスモードに移行した機能](./maintenance-mode-and-deprecations-in-7-2.md)
* [7.1の非推奨事項](https://help.liferay.com/hc/ja/articles/360018403151-Digital-Experience-Platform-7-1-Deprecated-and-Removed-Items)
* [7.0の非推奨事項](https://help.liferay.com/hc/ja/articles/360018123832-Digital-Experience-Platform-7-0-Deprecated-and-Removed-Items)

## 7.4でメンテナンスモードに移行された機能

7.4でメンテナンスモードに移行した機能は次のとおりです。

| 機能        | メモ                                                                                                                                         |
|:--------- |:------------------------------------------------------------------------------------------------------------------------------------------ |
| Kaleoフォーム | [Liferay Objects](../../../building-applications/objects.md)のビジネスプロセスに置き換えられる。                                                             |
| Solrコネクター | 可能であれば、[Elasticsearchを使用](../../../using-search/installing-and-upgrading-a-search-engine/elasticsearch/installing-elasticsearch.md)してください。 |
| 連絡先モジュール  | 連絡先モジュールの4つのポートレット（連絡先センター、メンバー、私の連絡先、プロフィール）をメンテナンスモードに移動しました。 現在、代わりの選手はいない。                                                             |

```{note}
Liferayは、インポート/エクスポートとステージングを改善し続け、特に、ある環境でコンテンツを作成し、別の環境で消費する必要があるシナリオでのリモートライブステージングに対応しています。 詳しくは、[公開設定ツール](../../../site-building/publishing-tools.md) をご覧ください。
```

## 関連トピック

* [7.4 旧バージョンと非互換の変更](../../../liferay-internals/reference/7-4-breaking-changes.md)
* [7.4 デフォルト設定の変更](./default-setting-changes-in-7-4.md)