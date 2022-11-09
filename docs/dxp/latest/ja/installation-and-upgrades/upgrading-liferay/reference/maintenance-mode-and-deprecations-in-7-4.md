# 7.4のメンテナンスモードと非推奨

新しいLiferay DXPやLiferay Portalのリリースごとに、機能の継続的な拡張が保証されない場合や、廃止される可能性があります。 機能の拡張を停止すると、その機能は **メンテナンスモード** に入ります。

**メンテナンスモード：** この機能はサポートされていますが、拡張は行われません。

廃止された機能は最終的に削除されるか、より新しい、より優れた機能に置き換えられます。 廃止された機能のサポートを終了する前に、Liferayはそれを **廃止予定** とマークします。

**廃止予定：** この機能は、次のマイナーバージョンのリリースでサポートされなくなります。 たとえば、7.4で廃止予定になった機能のサポートは、早ければ7.5で削除される可能性があります。

```{important}
廃止予定の機能のサポートは、早ければ次のマイナーリリースで終了する可能性があるため、機能の使用を停止することを計画してください。
```

```{important}
詳細は、 [Maintenance Mode and Deprecation Policies](https://help.liferay.com/hc/ja/articles/360015767952-Maintenance-Mode-and-Deprecation) を参照してください。
```

## 廃止予定の機能の利用可能性

廃止予定の機能には、さまざまな利用可能性があります。

**バンドル：** この機能はLiferayソフトウェアに含まれています。

**マーケットプレイス：** この機能はマーケットプレイスアプリの最終バージョンに含まれています。

**最終版：** このLiferayバージョン用にマーケットプレイスアプリの最終版がリリースされています。

**アーカイブ：** この機能は利用できませんが、そのコードはLiferayのリポジトリ（ <https://repository.liferay.com/nexus/index.html#welcome>）のソースアーティファクトで利用できます。

**削除：** この機能とそのコードは使用できません。

## 7.4で廃止予定の機能

7.4で廃止予定の機能は次のとおりです。

| 機能                                         | 利用可能                    | メモ                                                                                                                                                                                                                                                    |
|:------------------------------------------ |:----------------------- |:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| App Builder, App Builderワークフロー             | 削除済み                    | [Liferay Objects](../../../building-applications/objects.md)によって置き換えられました。                                                                                                                                                                            |
| Bootstrap 3 & Bootstrap 4 互換性レイヤー          | 削除済み                    | [Theme upgrade](../../../site-building/site-appearance/themes/upgrading-a-theme.md)時に互換性レイヤーを追加することを選択するか、手動でレイヤーを追加します。                                                                                                                              |
| コマースアカウントウィジェット                            | 削除済み                    | DXP/Portalアカウントウィジェットに置き換わりました。                                                                                                                                                                                                                       |
| 中央認証サービス（CAS）                              | アーカイブ済み                 | 7.2で廃止。 SAML、OpenID Connect、Token-based SSOなど、他のソリューションに置き換えられています。                                                                                                                                                                                   |
| コマースカテゴリ・ナビゲーションウィジェット                     | バンドル                    | [表示ページテンプレート](../../../site-building/displaying-content/using-display-page-templates.md) [メニュー表示](../../../site-building/site-navigation/configuring-menu-displays.md) 対応に置き換わりました。                                                                   |
| コマースの素材リスト（BOM）について                        | 削除済み                    | コマースBOMに置き換えられます。                                                                                                                                                                                                                                     |
| コマースカテゴリーコンテンツウィジェット                       | バンドル                    | [ディスプレイページテンプレート](../../../site-building/displaying-content/using-display-page-templates.md)で置き換えられました。                                                                                                                                               |
| ダイジェスト認証                                   | バンドル                    | ダイジェスト認証では、弱いパスワードのハッシュストレージが必要となり、これが脆弱性となります。                                                                                                                                                                                                       |
| 動的データリスト                                   | バンドル                    | 7.3で廃止。 [Liferay Objects](../../../building-applications/objects.md)によって置き換えられました。                                                                                                                                                                    |
| EXTプラグインサポート                               | 削除済み                    | 構成設定や標準的な拡張ポイントに置き換えられました。                                                                                                                                                                                                                            |
| イメージエディター（Soyベース）                          | 削除済み                    | Reactベースのイメージエディターに置き換えられました。                                                                                                                                                                                                                         |
| Google ログイン/SSO                            | アーカイブ済み                 | 7.2で廃止。 SAML、OpenID Connect、Token-based SSOなど、他のソリューションに置き換えられています。                                                                                                                                                                                   |
| JAASサポートコード                                | バンドル                    | 置換はありません。                                                                                                                                                                                                                                             |
| Liferay Mobile Device Detection Enterprise | アーカイブ済み                 | 7.2で廃止。 最新の定義については、51Degreesにお問い合わせください.                                                                                                                                                                                                              |
| Liferay Screens                            | 削除。 7.3でリリースされた最終バージョン。 | 直接的な代替品はありませんが、Mobile SDKとHeadless APIがモバイルアプリケーションの開発をサポートします。                                                                                                                                                                                       |
| Liferay SyncコネクターとSyncクライアント               | アーカイブ済み                 | 7.3で廃止。 直接の置換はありません。                                                                                                                                                                                                                                  |
| ライブユーザー                                    | バンドル                    | 7.2で廃止。  [Analytics Cloud](https://learn.liferay.com/analytics-cloud/latest/ja/index.html) によって置き換えられました。                                                                                                                                              |
| モバイルSDK                                    | 削除済み                    | [ヘッドレスデリバリー](../../../headless-delivery/using-liferay-as-a-headless-platform.md)に置き換えられました。                                                                                                                                                           |
| NTLM                                       | アーカイブ済み                 | 7.2で廃止。 [Kerberos](../../securing-liferay/configuring-sso/authenticating-with-kerberos.md)に置き換えられました。 NTLMを使用してMicrosoft Windows™アカウントを認証している場合は、[Kerberos](../../securing-liferay/configuring-sso/authenticating-with-kerberos.md)を使用するように切り替えてください。 |
| OAuth 1.0a                                 | アーカイブ済み                 | 7.2で廃止。 これはLiferayコネクターからOAuth 2.0に置き換えられます。                                                                                                                                                                                                          |
| アンケート                                      | 削除済み                    | [Forms/Forms Reports](../../../process-automation/forms/sharing-forms-and-managing-submissions/form-reports.md)に置き換わりました。                                                                                                                             |
| 検索ウィジェット（クラシック）                            | バンドル                    | 7.1で廃止。 [検索ウィジェット](../../../using-search/search-pages-and-widgets/search-results/search-results.md)に置き換えられます。                                                                                                                                         |
| SOAP Webサービス                               | バンドル（デフォルトでは無効）         | JSON webサービス、RESTサービス、GraphQLサービスに置き換えられました。                                                                                                                                                                                                          |
| Solrコネクター                                  | 削除済み                    | 7.3で廃止。 Elasticsearchに置き換えられました。                                                                                                                                                                                                                      |
| テーマ：Hello World                            | アーカイブ済み                 | 7.3で廃止。 直接の置換はありません。                                                                                                                                                                                                                                  |
| Webコンテンツの検索ウィジェット                          | アーカイブ済み                 |                                                                                                                                                                                                                                                       |

以前のLiferayバージョンからアップグレードする場合は、以前のバージョンで廃止になった機能も考慮する必要があります。

* [7.3の非推奨事項とメンテナンスモードに移行した機能](./maintenance-mode-and-deprecations-in-7-3.md)
* [7.2の非推奨事項とメンテナンスモードに移行した機能](./maintenance-mode-and-deprecations-in-7-2.md)
* [7.1の非推奨事項](https://help.liferay.com/hc/ja/articles/360018403151-Digital-Experience-Platform-7-1-Deprecated-and-Removed-Items)
* [7.0の非推奨事項](https://help.liferay.com/hc/ja/articles/360018123832-Digital-Experience-Platform-7-0-Deprecated-and-Removed-Items)

## 7.4でメンテナンスモードに移行された機能

7.4でメンテナンスモードに移行した機能は次のとおりです。

| 機能        | メモ                                                                              |
|:--------- |:------------------------------------------------------------------------------- |
| Kaleoフォーム | [Liferay Objects](../../../building-applications/objects.md)のビジネスプロセスに置き換えられます。 |

```{note}
Liferayは、インポート/エクスポートとステージング、特にコンテンツをある環境で作成し、別の環境で消費する必要があるシナリオでのリモートライブステージングを改善し続けています。 詳しくは、 [公開ツール](../../../site-building/publishing-tools.md) をご覧ください。
```

## 追加情報

* [7.4 旧バージョンと非互換の変更](../../../liferay-internals/reference/7-4-breaking-changes.md)
* [7.4 デフォルト設定の変更](./default-setting-changes-in-7-4.md)
