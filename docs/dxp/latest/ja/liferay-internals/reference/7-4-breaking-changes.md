# 7.4 旧バージョンと非互換の変更

破壊的変更 既存の機能やコード構造を破壊したり、大幅に変更したりする。 最初の四半期リリース（2023 Q3）から始まるLiferay 7.4のすべての変更点です。 製品の変更や改良に伴い、私たちはこうした中断を最小限に抑えるよう最善を尽くしますが、避けられない場合もあります。

[Liferay ソースコード](https://github.com/liferay/liferay-portal/blob/master/readme/BREAKING_CHANGES.markdown) の 2023 Q3 以前からの 7.4 の変更点をお読みください。

## 2023年第4四半期リリース

### Liferay DXPの変更点

以下は、Liferayの既存の機能を破壊したり、大幅に変更したりする変更のリストです。

| **重大な変更**                                | **説明**                                                                                                        | **参考文献**                                                                                                                     |
| :--------------------------------------- | :------------------------------------------------------------------------------------------------------------ | :--------------------------------------------------------------------------------------------------------------------------- |
| **Elasticsearchの最低対応バージョン**。             | Elasticsearchは少なくともバージョン**7.17**にアップデートされている必要があります。 Liferay DXP が以前のバージョンで起動しなくなりました（コンソールエラーが表示されます）。       | [互換性マトリックス](https://help.liferay.com/hc/en-us/articles/360016511651#Liferay-DXP-Quarterly-Releases-Elasticsearch) |
| **ABテスト                                | ABテストは**1つのバリアント**（コントロールに加えて）しかサポートしない。 これにより、テストが完了するまでの時間が指数関数的に長くなるのを防ぐことができる。                            | [LRAC-14353](https://liferay.atlassian.net/browse/LRAC-14353)                                                     |
| **ページテンプレートのデフォルトメニュー表示設定**について          | デフォルトでは、プライベート・ページが有効になっていても、ページ・テンプレートから継承されたメニュー表示ウィジェットは、_ページ階層_設定を持ちます。 サイト内にページがない場合は、この限りではありません。       | [LPS-194075](https://liferay.atlassian.net/browse/LPS-194075)                                                     |
| **DMファイルダウンロードのキャッシュオプションはありません。**       | デフォルトでは、新しい_No Cache_オプションは、Guestユーザーに許可されていないDMファイルのダウンロードに使用されます。                                           | [LPS-174415](https://liferay.atlassian.net/browse/LPS-174415)                                                     |
| **WebSphere による Liferay のデプロイをサポートします。**| Liferay を IBM WebSphere アプリケーションサーバーに導入することは非推奨です。 この機能のサポートは1年後に終了する（2024年第4四半期リリースで）_。 | 未定                                                                                                                           |
| **サポートされるJavaのバージョン**。                   | JDK 8は非推奨であり、サポートは1年後（2024年Q4リリース）に終了する_。 Liferay DXP 7.4 では JDK 11 を使用する必要があります。        | 未定                                                                                                                           |

### モジュール・ソースコードの変更

**ExtRepository.java** [`modules/apps/document-library/document-library-repository-external-api/src/main/java/com/liferay/document/library/repository/external/ExtRepository.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-repository-external-api/src/main/java/com/liferay/document/library/repository/external/ExtRepository.java) 

-   **日付**:2023年9月29日
-   **チケット** [LPS-197315](https://liferay.atlassian.net/browse/LPS-197315) 
-   **変更点**：新しい `String` パラメータ (`fileName`) が `addExtRepositoryFileEntry(String, String, String, String, InputStream)` メソッドに追加されました。
-   **理由**：ファイル名は、Sharepoint 外部リポジトリでファイルを作成するために必要です。

**liferay-chart.tld**
`modules/apps/frontend-taglib/frontend-taglib-chart/src/main/resources/META-INF/liferay-chart.tld`

-   **日付**:2023年10月6日
-   **チケット**: [LPS-198114](https://liferay.atlassian.net/browse/LPS-198114) 
-   **変更内容**：Liferayチャートモジュールのタグリブは削除されました。
-   **理由**：これらのタグリブはLiferayでは使用されなくなり、Liferayはsoyのサポートを削除しました。

**CommerceShipmentItemLocalService.java** [`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/service/CommerceShipmentItemLocalService.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/service/CommerceShipmentItemLocalService.java) 

-   **日付**:2023年10月6日
-   **チケット**: [COMMERCE-12534](https://liferay.atlassian.net/browse/COMMERCE-12534) 
-   **変更点**：getCommerceShipmentOrderItemsQuantity`メソッドは`int`値の代わりに`BigDecimal` を返します。
-   **理由**：新しい測定単位機能には `BigDecimal` 値が必要です。

**CommerceShipmentItemService.java** [modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/service/CommerceShipmentItemService.java](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/service/CommerceShipmentItemService.java) 

-   **日付**:2023年10月6日
-   **チケット**: [COMMERCE-12534](https://liferay.atlassian.net/browse/COMMERCE-12534) 
-   **変更点**：getCommerceShipmentOrderItemsQuantity`メソッドは`int`値の代わりに`BigDecimal` を返します。
-   **理由**：新しい測定単位機能には `BigDecimal` 値が必要です。

**BaseClayTag.java**
`modules/apps/frontend-taglib/frontend-taglib-clay/src/main/java/com/liferay/frontend/taglib/clay/servlet/taglib/base/BaseClayTag.java`。

-   **日付**:2023年10月10日
-   **チケット**: [LPS-198462](https://liferay.atlassian.net/browse/LPS-198462) 
-   **変更点** `BaseClayTag`クラスは削除されました。
-   **理由**：このクラスは使用されなくなりました。

**ModelSearchRegistrarHelper.java**
`modules/apps/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/model/registrar/ModelSearchRegistrarHelper.java`。

-   **日付**:2023年10月11日
-   **チケット**: [LPS-198809](https://liferay.atlassian.net/browse/LPS-198809) 
-   **変更点**：ModelSearchRegistrarHelper` クラスは削除されました。
-   **理由**：検索登録機関のブートストラップ・スタイルが変更され、このクラスは使用されなくなりました。

**ModelSearchDefinitionContributor.java**
`modules/apps/portal-search/portal-search-spi/src/main/java/com/liferay/portal/search/spi/model/registrar/contributor/ModelSearchDefinitionContributor.java`。

-   **日付**:2023年10月11日
-   **チケット**: [LPS-198809](https://liferay.atlassian.net/browse/LPS-198809) 
-   **変更点ModelSearchDefinitionContributor` クラスは削除されました。
-   **理由**：検索登録機関のブートストラップ・スタイルが変更され、このクラスは使用されなくなりました。

**AccountRoleLocalService.java** [`modules/apps/account/account-api/src/main/java/com/liferay/account/service/AccountRoleLocalService.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/account/account-api/src/main/java/com/liferay/account/service/AccountRoleLocalService.java) 

-   **日付**:2023年10月17日
-   **チケット**: [LPS-173628](https://liferay.atlassian.net/browse/LPS-173628) 
-   **変更点**：checkCompanyAccountRoles` メソッドが削除されました。
-   **理由** `AddDefaultAccountRolesPortalInstanceLifecycleListener`と`AddDefaultAccountRolesPortletPermissionsPortalInstanceLifecycleListener` クラスは、代わりにデフォルトのアカウントロールを初期化してチェックします。

**CommerceCheckoutStepHttpHelper.java** [`modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/checkout/helper/CommerceCheckoutStepHttpHelper.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/checkout/helper/CommerceCheckoutStepHttpHelper.java) 

-   **日付**:2023年10月25日
-   **チケット**: [COMMERCE-12230](https://liferay.atlassian.net/browse/COMMERCE-12230) 
-   **変更点**：isActiveShippingMethodCommerceCheckoutStep`メソッドが追加の`CommerceOrder` 値を使用するようになりました。
-   **理由**：理由**: `CommerceOrder` 値はチェックアウトのパフォーマンスを向上させるためにパラメータとして渡されます。

**PaymentProcessCheckoutStepDisplayContext.java** [`modules/apps/commerce/commerce-checkout-web/src/main/java/com/liferay/commerce/checkout/web/internal/display/context/PaymentProcessCheckoutStepDisplayContext.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-checkout-web/src/main/java/com/liferay/commerce/checkout/web/internal/display/context/PaymentProcessCheckoutStepDisplayContext.java) 

-   **日付**:2023年10月25日
-   **チケット**: [COMMERCE-12230](https://liferay.atlassian.net/browse/COMMERCE-12230) 
-   **変更点**：PaymentProcessCheckoutStepDisplayContext`メソッドの鼻は、追加の`CommerceOrder` 値を使用します。
-   **理由**：理由**: `CommerceOrder` 値はチェックアウトのパフォーマンスを向上させるためにパラメータとして渡されます。

**AssetEntryItemSelectorCriterion.java** [`modules/apps/item-selector/item-selector-criteria-api/src/main/java/com/liferay/item/selector/criteria/asset/criterion/AssetEntryItemSelectorCriterion.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/item-selector/item-selector-criteria-api/src/main/java/com/liferay/item/selector/criteria/asset/criterion/AssetEntryItemSelectorCriterion.java) 

-   **日付**:2023年10月30日
-   **チケット**: [LPS-197840](https://liferay.atlassian.net/browse/LPS-197840) 
-   **変更点**：scopeGroupType`メソッドが削除されました。
-   **理由**：scopeGroupType`メソッドは使用されなくなりました。

**BasePreviewBackgroundTaskExecutor.java** [`modules/apps/document-library/document-library-preview-api/src/main/java/com/liferay/document/library/preview/background/task/BasePreviewBackgroundTaskExecutor.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-preview-api/src/main/java/com/liferay/document/library/preview/background/task/BasePreviewBackgroundTaskExecutor.java) 

-   **日付**:2023年10月31日
-   **チケット**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032) 
-   **変更点**：このクラスは `DLFileEntryConfiguration` に直接アクセスする代わりに、新しい `DLFileEntryConfigurationProvider` にアクセスします。
-   **理由**：DLFileEntryConfigurationProvider` クラスが追加されました。

**ExtendedObjectClassDefinition.java** [`modules/apps/static/portal-configuration/portal-configuration-metatype-api/src/main/java/com/liferay/portal/configuration/metatype/annotation/ExtendedObjectClassDefinition.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/static/portal-configuration/portal-configuration-metatype-api/src/main/java/com/liferay/portal/configuration/metatype/annotations/ExtendedObjectClassDefinition.java) 

-   **日付**:2023年10月31日
-   **チケット**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032) 
-   **何が変わったか**：このクラスに新しい静的メソッド `getScope(String)` が追加されました。
-   **理由**：新しいメソッドでは、`Scope` オブジェクトを String スコープ値で取得できるようになりました。

**DLFileEntryConfiguration.java** [`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfiguration.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfiguration.java) 

-   **日付**:2023年10月31日
-   **チケット**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032) 
-   **変更点**：このクラスは新しい属性 `maxNumberOfPages` を使用します。 これは以前は `PDFPreviewConfiguration` の一部だった。
-   **理由**：PDFPreviewConfiguration` は使用されなくなりました。

**DLFileEntryConfigurationProvider.java** [`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfigurationProvider.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/configuration/DLFileEntryConfigurationProvider.java) 

-   **日付**:2023年10月31日
-   **チケット**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032) 
-   **変更点このクラスは `DLFileEntryConfiguration` の新しい設定プロバイダです。
-   **理由**：この設定プロバイダは `DLFileEntryConfiguration` の複数の設定レベル（システム、インスタンス、サイト）へのアクセスを容易にします。

**DLFileEntryConfigurationConstants.java** [`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/constants/DLFileEntryConfigurationConstants.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/constants/DLFileEntryConfigurationConstants.java) 

-   **日付**:2023年10月31日
-   **チケット**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032) 
-   **何が変わったか？新しく追加されたクラスです。
-   **理由**：このクラスは `DLFileEntryConfiguration` 属性を扱うための共通の値を定義する。

**DLFileEntryConfigurationException.java** [`modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/exception/DLFileEntryConfigurationException.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/document-library/document-library-api/src/main/java/com/liferay/document/library/exception/DLFileEntryConfigurationException.java) 

-   **日付**:2023年10月31日
-   **チケット**: [LPS-195032](https://liferay.atlassian.net/browse/LPS-195032) 
-   **何が変わったのか**：これは新しいタイプのExceptionである。
-   **理由**：この例外は `DLFileEntryConfiguration` 属性に無効な値が設定された場合に使用されます。

**CPContentHelper.java** [`modules/apps/commerce/commerce-product-content-api/src/main/java/com/liferay/commerce/product/content/helper/CPContentHelper.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/commerce/commerce-product-content-api/src/main/java/com/liferay/commerce/product/content/helper/CPContentHelper.java) 

-   **日付**:2023年11月4日
-   **チケット**: [COMMERCE-12579](https://liferay.atlassian.net/browse/COMMERCE-12579) 
-   **変更点**：hasDirectReplacement`メソッドの名前が`isDirectReplacement` に変更されました。
-   **理由**：このメソッドは、SKUが他の商品の代替品であるかどうかをチェックする代わりに、代替品があるかどうかをチェックするようになりました。

### `portal-impl` クラスの変更点

**UserImpl.java** [`portal-impl/src/com/liferay/portal/model/impl/UserImpl.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/model/impl/UserImpl.java) 

-   **日付**:2023年10月4日
-   **チケット**: [LPS-196035](https://liferay.atlassian.net/browse/LPS-196035) 
-   **変更点**：WebDAVクライアントは、ダイジェスト認証で認証するために、ユーザーのスクリーンネーム、メールアドレス、または通常のパスワードの代わりに `userId` を使用する必要があります。
-   **理由**:WebDAV では、各ユーザーがアクセスするために個別のパスワードを生成する必要があり、ユーザーはアカウント設定を変更するためのアクションを取る必要があります。 ユーザーエクスペリエンスは `userId` を使って簡略化され、予期せぬ WebDAV アクセス拒否を回避することができます。

**portal.properties** [`portal-impl/src/portal.properties`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/portal.properties) 

-   **日付**:2023年10月8日
-   **チケット**: [LPS-189621](https://liferay.atlassian.net/browse/LPS-189621) 
-   **変更点**：sql.data.max.parameters`プロパティが削除された。
-   **理由**：データベース固有の `database.max.parameters` プロパティを使用する必要があります。

**OpenIdUtil.java**
`portal-impl/src/com/liferay/portal/util/OpenIdUtil.java`.

-   **日付**:2023年10月19日
-   **チケット**: [LPS-198877](https://liferay.atlassian.net/browse/LPS-198877) 
-   **変更点**：OpenIdUtil`クラスは削除された。 代わりに `OpenIdConnect` を使用する。
-   **理由**：OpenIDは非推奨となり、Liferayは内部的に使用しなくなりました。

**PersistedModelLocalServiceRegistryUtil.java** [`portal-impl/src/com/liferay/portal/service/PersistedModelLocalServiceRegistryUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/service/PersistedModelLocalServiceRegistryUtil.java) 

-   **日付**:2023年10月20日
-   **チケット**: [LPS-199563](https://liferay.atlassian.net/browse/LPS-199563) 
-   **変更点**：PersistedModelLocalServiceRegistryUtil`クラスが`portal-kernel`から`portal-impl` にリファクタリングされた。 portal-impl`を引き続き使用するために、ビルドの依存関係に追加する。
-   **理由**：コード構造を単純化するために、このクラスは `portal-impl` に移動された。

**HttpAuthManagerUtil.java** [`portal-impl/src/com/liferay/portal/security/authttp.HttpAuthManagerUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/security/auth/http/HttpAuthManagerUtil.java) 

-   **日付**:2023年10月21日
-   **チケット**: [LPS-197376](https://liferay.atlassian.net/browse/LPS-197376) 
-   **変更点**：HttpAuthManagerUtil`クラスが`portal-kernel`から`portal-impl` にリファクタリングされた。 portal-impl`を引き続き使用するために、ビルドの依存関係に追加する。
-   **理由**：コード構造を単純化するために、このクラスは `portal-impl` に移動された。

**ImageToolUtil.java** [`portal-impl/src/com/liferay/portal/image/ImageToolUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/image/ImageToolUtil.java) 

-   **日付**:2023年10月21日
-   **チケット**: [LPS-198319](https://liferay.atlassian.net/browse/LPS-198319) 
-   **変更点**：ImageToolUtil`クラスが`portal-kernel`から`portal-impl` にリファクタリングされた。 portal-impl`を引き続き使用するために、ビルドの依存関係に追加する。
-   **理由**：コード構造を単純化するために、このクラスは `portal-impl` に移動された。

**DLPreviewableProcessor.java**
`portal-impl/src/com/liferay/document/library/kernel/util/DLPreviewableProcessor.java`.

-   **日付**:2023年10月21日
-   **チケット**: [LPS-198319](https://liferay.atlassian.net/browse/LPS-198319) 
-   **変更点**：DLPreviewableProcessor`クラスが`portal-kernel`から`portal-impl` にリファクタリングされた。 portal-impl`を引き続き使用するために、ビルドの依存関係に追加する。
-   **理由**：コード構造を単純化するために、このクラスは `portal-impl` に移動された。

**RoleMembershipPolicyFactoryUtil.java** [`portal-kernel/src/com/liferay/portal/kernel/security.membershippolicy.RoleMembershipPolicyFactoryUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/security/membershippolicy/RoleMembershipPolicyFactoryUtil.java) 

-   **日付**:2023年10月23日
-   **チケット**: [LPS-199389](https://liferay.atlassian.net/browse/LPS-199389) 
-   **変更点**：RoleMembershipPolicyFactoryUtil`クラスが`portal-kernel`から`portal-impl` にリファクタリングされた。 portal-impl`を引き続き使用するために、ビルドの依存関係に追加する。
-   **理由**：コード構造を単純化するために、このクラスは `portal-impl` に移動された。

**RoleMembershipPolicyUtil.java** [`https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/security/membershippolicy/RoleMembershipPolicyUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/security/membershippolicy/RoleMembershipPolicyUtil.java) 

-   **日付**:2023年10月23日
-   **チケット**: [LPS-199389](https://liferay.atlassian.net/browse/LPS-199389) 
-   **変更点**：RoleMembershipPolicyUtil`クラスが`portal-kernel`から`portal-impl` にリファクタリングされた。 portal-impl`を引き続き使用するために、ビルドの依存関係に追加する。
-   **理由**：コード構造を単純化するために、このクラスは `portal-impl` に移動された。

**AuthenticatedSessionManagerUtil.java** [`portal-impl/src/com/liferay/portal/security/auth/session/AuthenticatedSessionManagerUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/security/auth/session/AuthenticatedSessionManagerUtil.java) 

-   **日付**:2023年10月23日
-   **チケット**: [LPS-199165](https://liferay.atlassian.net/browse/LPS-199165) 
-   **変更点**：AuthenticatedSessionManagerUtil`クラスが`portal-kernel`から`portal-impl` にリファクタリングされた。 portal-impl`を引き続き使用するために、ビルドの依存関係に追加する。
-   **理由**：コード構造を単純化するために、このクラスは `portal-impl` に移動された。

**Success.java** [`portal-impl/src/com/liferay/portal/xmlrpc/Success.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/xmlrpc/Success.java) 

-   **日付**:2023年10月23日
-   **チケット**: [LPS-199164](https://liferay.atlassian.net/browse/LPS-199164) 
-   **変更点**：Success`クラスが`portal-kernel`から`portal-impl` にリファクタリングされた。 portal-impl`を引き続き使用するために、ビルドの依存関係に追加する。
-   **理由**：コード構造を単純化するために、このクラスは `portal-impl` に移動された。

**Fault.java** [`portal-impl/src/com/liferay/portal/xmlrpc/Fault.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/xmlrpc/Fault.java) 

-   **日付**:2023年10月23日
-   **チケット**: [LPS-199164](https://liferay.atlassian.net/browse/LPS-199164) 
-   **変更点**：Fault`クラスが`portal-kernel`から`portal-impl` にリファクタリングされた。 portal-impl`を引き続き使用するために、ビルドの依存関係に追加する。
-   **理由**：コード構造を単純化するために、このクラスは `portal-impl` に移動された。

**XmlRpcUtil.java** [`portal-impl/src/com/liferay/portal/xmlrpc/XmlRpcUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/xmlrpc/XmlRpcUtil.java) 

-   **日付**:2023年10月23日
-   **チケット**: [LPS-199164](https://liferay.atlassian.net/browse/LPS-199164) 
-   **変更点**：XmlRpcUtil`クラスが`portal-kernel`から`portal-impl` にリファクタリングされた。 portal-impl`を引き続き使用するために、ビルドの依存関係に追加する。
-   **理由**：コード構造を単純化するために、このクラスは `portal-impl` に移動された。

**StartupHelperUtil.java** [`portal-impl/src/com/liferay/portal/events/StartupHelperUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/events/StartupHelperUtil.java) 

-   **日付**:2023年11月2日
-   **チケット**: [LPS-200501](https://liferay.atlassian.net/browse/LPS-200501) 
-   **変更点isStartupFinished`メソッドと`setStartupFinished(boolean)` メソッドが削除されました。
-   **理由**：このフラグは起動状態を正確に反映しないため、誤った使い方を避けるためにメソッドを削除した。

**ModelAdapterUtil.java** [`portal-impl/src/com/liferay/portal/model/adapter/ModelAdapterUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/model/adapter/util/ModelAdapterUtil.java) 

-   **日付**:2023年11月3日
-   **チケット**: [LPS-199825](https://liferay.atlassian.net/browse/LPS-199825) 
-   **変更点**：ModelAdapterUtil`クラスが`portal-kernel`から`portal-impl` にリファクタリングされた。 portal-impl`を引き続き使用するために、ビルドの依存関係に追加する。
-   **理由**：コード構造を単純化するために、このクラスは `portal-impl` に移動された。

### portal-kernel` クラスの変更点

**DLProcessorRegistry.java**
`portal-kernel/src/com/liferay/document/library/kernel/util/DLProcessorRegistry.java`.

-   **日付**:2023年9月27日
-   **チケット**: [LPS-196698](https://liferay.atlassian.net/browse/LPS-196698) 
-   **変更点**：getPreviewableProcessorMaxSize` メソッドが追加されました。
-   **理由このメソッドは設定値を取得するために必要です。

**FormNavigatorEntryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/servlet/taglib/ui/FormNavigatorEntryUtil.java`.

-   **日付**:2023年10月12日
-   **チケット**: [LPS-198653](https://liferay.atlassian.net/browse/LPS-198653) 
-   **変更点**：FormNavigatorEntryUtil`クラスは削除されました。 代わりに `FormNavigatorEntryProvider` で提供されている OSGi サービスを使用してください。
-   **理由**：このクラスは使用されなくなりました。

**OpenId.java**
`portal-kernel/src/com/liferay/portal/kernel/openid/OpenId.java`.

-   **日付**:2023年10月19日
-   **チケット**: [LPS-198877](https://liferay.atlassian.net/browse/LPS-198877) 
-   **変更点**：OpenId`クラスが削除された。 代わりに `OpenIdConnect` を使用する。
-   **理由**：OpenIDは非推奨となり、Liferayは内部的に使用しなくなりました。

**PersistedModelLocalServiceRegistry.java**
`portal-kernel/src/com/liferay/portal/kernel/service/PersistedModelLocalServiceRegistry.java`.

-   **日付**:2023年10月20日
-   **チケット**: [LPS-199563](https://liferay.atlassian.net/browse/LPS-199563) 
-   **変更点PersistedModelLocalServiceRegistry`クラスは削除されました。 代わりに`PersistedModelLocalServiceRegistryUtil`(これも`portal-impl` にリファクタリングされている) を使用してください。
-   **理由**：サービスの収集と検索ロジックが `PersistedModelLocalServiceRegistryUtil` にリファクタリングされた。

**ImageTool.java**
`portal-kernel/src/com/liferay/portal/kernel/image/ImageTool.java`.

-   **日付**:2023年10月21日
-   **チケット**: [LPS-198319](https://liferay.atlassian.net/browse/LPS-198319) 
-   **変更点**：ImageTool`クラスは削除された。 定数フィールドは `ImageConstants`にリファクタリングされたが、画像の向きに関連する定数は削除された。 代わりに`ImageToolUtil`の静的メソッドまたは`ImageConstants` の定数を使用する。
-   **理由**：このクラスは使用されなくなりました。

**PortletPermission.java**
`portal-kernel/src/com/liferay/portal/kernel/service/permission/PortletPermission.java`

-   **日付**:2023年10月21日
-   **チケット**: [LPS-196101](https://liferay.atlassian.net/browse/LPS-196101) 
-   **変更点**：PortletPermission`クラスは削除された。 代わりに `PortletPermissionUtil` を使用してください。
-   **理由**：このクラスは使用されなくなりました。

**RoleMembershipPolicyFactory.java**
`portal-kernel/src/com/liferay/portal/kernel/security/membershippolicy/RoleMembershipPolicyFactory.java`

-   **日付**:2023年10月23日
-   **チケット**: [LPS-199389](https://liferay.atlassian.net/browse/LPS-199389) 
-   **変更点**：RoleMembershipPolicyFactory`クラスは削除されました。 代わりに`RoleMembershipPolicyFactoryUtil` (`portal-impl` に移動しました) を使用してください。
-   **理由**：このクラスは使用されなくなりました。

**ThreadLocalDistributor.java**
`portal-kernel/src/com/liferay/portal/kernel/util/ThreadLocalDistributor.java`.

-   **日付**:2023年10月23日
-   **チケット**: [LPS-198859](https://liferay.atlassian.net/browse/LPS-198859) 
-   **変更点**：ThreadLocalDistributor` クラスが削除された。
-   **理由**：このクラスは使用されなくなりました。

**ThreadLocalDistributorRegistry.java**
`portal-kernel/src/com/liferay/portal/kernel/util/ThreadLocalDistributorRegistry.java`.

-   **日付**:2023年10月23日
-   **チケット**: [LPS-198859](https://liferay.atlassian.net/browse/LPS-198859) 
-   **変更点**：ThreadLocalDistributorRegistry` クラスが削除された。
-   **理由**：このクラスは使用されなくなりました。

**HttpAuthManager.java**
`portal-kernel/src/com/liferay/portal/kernel/security/authttp/HttpAuthManager.java`

-   **日付**:2023年10月23日
-   **チケット**: [LPS-197376](https://liferay.atlassian.net/browse/LPS-197376) 
-   **変更点**：HttpAuthManger`クラスは削除された。 代わりに`HttpAuthManagerUtil` を使用する。
-   **理由**：このクラスは使用されなくなりました。

**XmlRpcParser.java**
`portal-kernel/src/com/liferay/portal/kernel.xmlrpc.XmlRpcParser.java`.

-   **日付**:2023年10月23日
-   **チケット**: [LPS-199164](https://liferay.atlassian.net/browse/LPS-199164) 
-   **変更点**：XmlRpcParser`クラスは`XmlRpcUtil` クラスにリファクタリングされた。
-   **理由**：XmlRpcParser`クラスと`XmlRpcUtil` クラスは密接に関連しており、互いに依存していたため、この 2 つのクラスを統合した。

**AuthenticatedSessionManager.java**
`portal-kernel/src/com/liferay/portal/kernel/security/auth/session/AuthenticatedSessionManager.java`

-   **日付**:2023年10月23日
-   **チケット**: [LPS-199165](https://liferay.atlassian.net/browse/LPS-199165) 
-   **変更点**：AuthenticatedSessionManager`クラスは削除された。 代わりに`AuthenticatedSessionManagerUtil` を使用する。
-   **理由**：このクラスは使用されなくなりました。

**TemplateManagerUtil.java** [`portal-kernel/src/com/liferay/portal/kernel/template/TemplateManagerUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/template/TemplateManagerUtil.java) 

-   **日付**:2023年10月26日
-   **チケット**: [LPS-200072](https://liferay.atlassian.net/browse/LPS-200072) 
-   **変更点**：destroy`メソッドと `getTemplateManagers`メソッドが削除された。
-   **理由** これらのメソッドはもはや使用されていない。

**TemplateManager.java** [`portal-kernel/src/com/liferay/portal/kernel/template/TemplateManager.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/template/TemplateManager.java) 

-   **日付**:2023年10月26日
-   **チケット**: [LPS-200072](https://liferay.atlassian.net/browse/LPS-200072) 
-   **変更点**：init`メソッドと `destroy`メソッドが削除された。
-   **理由**:ライフサイクル管理は内部サービスロジックに移される。 サービスの消費者は、そのライフサイクルを直接コントロールすべきではない。

**ModelAdapterBuilderLocator.java**
`portal-kernel/src/com/liferay/portal/kernel/model/adapter/builder/ModelAdapterBuilderLocator.java`

-   **日付**:2023年11月3日
-   **チケット**: [LPS-199825](https://liferay.atlassian.net/browse/LPS-199825) 
-   **変更点ModelAdapterBuilderLocator`クラスは削除されました。 代わりに`ModelAdapterUtil` を直接使用してください。
-   **理由**：このクラスは使用されなくなりました。

**AssetEntriesFacet.java**
`portal-kernel/src/com/liferay/portal/kernel/search/facet/AssetEntriesFacet.java`.

-   **日付**:2023年11月3日
-   **チケット**: [LPS-200073](https://liferay.atlassian.net/browse/LPS-200073) 
-   **変更点**：AssetEntriesFacet`クラスは削除され、`FacetImpl`のロジックが使われるようになった。
-   **理由**：このクラスは使用されなくなりました。

**AuditMessageFactory.java** [`portal-kernel/src/com/liferay/portal/kernel/audit/AuditMessageFactory.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/audit/AuditMessageFactory.java) 

-   **日付**:2023年11月7日
-   **チケット**: [LPS-201086](https://liferay.atlassian.net/browse/LPS-201086) 
-   **変更点**：AuditMessageFactoryUtil`と`AuditMessageFactoryImpl`のロジックは`AuditMessageFactory` にリファクタリングされた。
-   **理由**：このロジックは不必要にクラス間で分割されていたため、コード構造を単純化するために `AuditMessageFactory` クラスに統合されました。

**AuditMessageFactoryUtil.java**
`portal-kernel/src/com/liferay/portal/kernel/audit/AuditMessageFactoryUtil.java`

-   **日付**:2023年11月7日
-   **チケット**: [LPS-201086](https://liferay.atlassian.net/browse/LPS-201086) 
-   **変更点**：AuditMessageFactoryUtil`クラスは削除された。 ロジックは `AuditMessageFactory` にリファクタリングされた。
-   **理由**：このロジックは不必要にクラス間で分割されていたため、コード構造を単純化するために `AuditMessageFactory` クラスに統合されました。

**PortletToolbar.java** [`portal-kernel/src/com/liferay/portal/kernel/portlet/toolbar/PortletToolbar.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/portlet/toolbar/PortletToolbar.java) 

-   **日付**:2023年11月21日
-   **チケット**: [LPS-200453](https://liferay.atlassian.net/browse/LPS-200453) 
-   **変更点**：PortletToolbar`クラスのコンストラクタがprivateになりました。 代わりに `PortletToolbar`のインスタンスを取得するには`PortletToolbar.INSTANCE` を使用してください。
-   **理由**：PortletToolbar`はもはや `util-spring` にはないので、代わりに静的インスタンスが必要である。

### タグリブの変更点

**liferay-commerce`タグリブ**。

-   **日付**:2023年10月16日
-   **チケット**: [LPS-199170](https://liferay.atlassian.net/browse/LPS-199170) 
-   **変更点**：SearchInputTag`と`UserManagementBarTag` タグリブは削除された。
-   **理由**：これらは内部タグリブであり、現在は使用されていない。 また、時代遅れのマークアップやロジックを使用していた。

**liferay-export-import-changeset`タグリブの**。

-   **日付**:2023年10月16日
-   **チケット**: [LPS-199170](https://liferay.atlassian.net/browse/LPS-199170) 
-   **変更点**：これらのタグリブは削除された：`AddEntitiesTag`、`AddEntityTag`、`CreateTag`、`CreateTei`、`ExportEntityTag`、`ExportImportEntityManagementBarButtonTag`、`ExportImportEntitySearchContainerMappingTag`、`ImportEntityTag`、`PublishChangesetTag`、`PublishModelMenuItemTag`。
-   **理由**：これらは内部タグリブであり、現在は使用されていない。 また、時代遅れのマークアップやロジックを使用していた。

## 2023年第3四半期リリース

### Liferay DXPの変更点

以下は、Liferayの既存の機能を破壊したり、大幅に変更する変更のリストです。

| **重大な変更**                             | **説明**                                                                                                                                                                                     | **参考文献**                                                                 |
| :------------------------------------ | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------- |
| **フラグメントのMark as Cacheableオプションの場所**。 | フラグメントをキャッシュ可能としてマーク（またはマーク解除）するには、エディターではなく、フラグメントのアクションメニュー内のフラグメントメニューを使用します。 これで、フラグメントに対する他の編集とは別にこの変更を行うことができるようになり、使用中のフラグメントにこの変更を伝搬する際のパフォーマンスコストを削減することができます。 この変更に伴う実装の変更は必要ない。 | [LPS-183735](https://liferay.atlassian.net/browse/LPS-183735) |

### モジュール・ソースコードの変更

**SolrClientManager.java** [`modules/apps/portal-search-solr8/portal-search-solr8-impl/src/main/java/com/liferay/portal/search/solr8/internal/connection/SolrClientManager.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/portal-search-solr8/portal-search-solr8-impl/src/main/java/com/liferay/portal/search/solr8/internal/connection/SolrClientManager.java) 

-   **日付**:2023年7月4日
-   **チケット**: [LPS-180691](https://liferay.atlassian.net/browse/LPS-180691) 
-   **変更点SolrClientManager`クラスの拡張ポイントが削除されました。
-   **理由**：Liferay はこのクラスの拡張をサポートしなくなりました。

**SolrClientFactory.java** [`modules/apps/portal-search-solr8/portal-search-solr8-impl/src/main/java/com/liferay/portal/search/solr8/internal/connection/SolrClientFactory.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/portal-search-solr8/portal-search-solr8-impl/src/main/java/com/liferay/portal/search/solr8/internal/connection/SolrClientFactory.java) 

-   **日付**:2023年7月4日
-   **チケット**: [LPS-180691](https://liferay.atlassian.net/browse/LPS-180691) 
-   **変更点**：CLOUD`と`REPLICATED` の拡張ポイントが削除された。
-   **理由**：Liferay はこれらの拡張ポイントをサポートしなくなりました。

**HttpClientFactory.java** [`modules/apps/portal-search-solr8/portal-search-solr8-impl/src/main/java/com/liferay/portal/search/solr8/internal/http/HttpClientFactory.java`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/portal-search-solr8/portal-search-solr8-impl/src/main/java/com/liferay/portal/search/solr8/internal/http/HttpClientFactory.java) 

-   **日付**:2023年7月4日
-   **チケット**: [LPS-180691](https://liferay.atlassian.net/browse/LPS-180691) 
-   **変更点BASIC`と`CERT` の拡張ポイントが削除された。
-   **理由**：Liferay はこれらの拡張ポイントをサポートしなくなりました。

### portal-impl` クラスの変更点

**MessagingHotDeployListener.java**
`portal-impl/src/com/liferay/portal/deploy/hot/MessagingHotDeployListener.java`

-   **日付**:2023年8月4日
-   **チケット**: [LPS-192680](https://liferay.atlassian.net/browse/LPS-192680) 
-   **変更点**：MessagingHotDeployListener`クラスは削除されました。 付随する `liferay/hot_deploy` メッセージバスの宛先も削除された。 代わりに、`HotDeployListener` を登録し、ホットデプロイイベントをリッスンする。
-   **理由**：削除されたメッセージバスの宛先はもう使用されていません。

**HookHotDeployListener.java** [`portal-impl/src/com/liferay/portal/deploy/hot/HookHotDeployListener.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/deploy/hot/HookHotDeployListener.java) 

-   **日付**:2023年8月17日
-   **チケット**: [LPS-193926](https://liferay.atlassian.net/browse/LPS-193926) 
-   **What Changed**：HookHotDeployListener` クラスは [`DLProcessor`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/document/library/kernel/processor/DLProcessor.java) のフック経由でのデプロイをサポートしなくなりました。 代わりに、`DLProcessor`をOSGi実装に変換する。
-   **理由**：これは `DLProcessorRegistryImpl` と `HookHotDeployListener` の間で `DLProcessor` の実装を登録するロジックが重複するのを防ぐためです。

**portal.properties** [`portal-impl/src/portal.properties`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/portal.properties) 

-   **日付**:2023年9月4日
-   **チケット**: [LPS-194379](https://liferay.atlassian.net/browse/LPS-194379) 
-   **変更内容**：ポータルのプロパティ `discussion.subscribe` が削除されました。 代わりに、UIのインスタンス設定で同じコンフィギュレーションを設定する。
-   **理由**インスタンス設定はインスタンスごとに、またLiferayの実行中に特別に設定できるので、インスタンス設定として設定する方が柔軟です。

**HookHotDeployListener.java** [`portal-impl/src/com/liferay/portal/deploy/hot/HookHotDeployListener.java`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/com/liferay/portal/deploy/hot/HookHotDeployListener.java) 

-   **日付**:2023年9月4日
-   **チケット**: [LPS-194350](https://liferay.atlassian.net/browse/LPS-194350) 
-   **変更点**：HookHotDeployListener` クラスはフック経由での外部リポジトリへのデプロイをサポートしなくなりました。 代わりに、独自の外部リポジトリ実装をOSGiサービスに変換する。
-   **理由**：OSGiサービスは、フック経由で外部リポジトリをデプロイするよりも多くの機能をサポートしています。

**portal.properties** [`portal-impl/src/portal.properties`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/portal.properties) 

-   **日付**:2023年9月13日
-   **チケット**: [LPS-195006](https://liferay.atlassian.net/browse/LPS-195006) 
-   **変更点**：ポータルのプロパティ `discussion.comments.always.editable.by.owner` が削除されました。 代わりに、UIのインスタンス設定で同じ設定を行ってください。
-   **理由**インスタンス設定はインスタンスごとに、またLiferayの実行中に特別に設定できるので、インスタンス設定として設定する方が柔軟です。

### `portal-kernel` クラスの変更点

**Document.java** [`portal-kernel/src/com/liferay/portal/kernel/search/Document.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/search/Document.java) 

-   **日付**:2023年7月7日
-   **チケット**: [LPS-188914](https://liferay.atlassian.net/browse/LPS-188914) 
-   **変更点**：これらの `addFile` メソッドは非推奨となりました：addFile(String, byte [], String)`, `addFile(String, File, String)`, `addFile(String, InputStream, String)`, `addFile(String, InputStream, String, int)`. ファイルのデータで `InputStream` を使用し、[`TextExtractor`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/util/TextExtractor.java) クラスの `extractText` メソッドを呼び出すことで、実装を更新します。 次に、`extractText`呼び出しの戻り値を使用して、`addFile(String, String)`を呼び出す。
-   **理由**：非推奨の `addFile` 実装は使われなくなった。

**BaseModelPermissionChecker.java**
`com.liferay.portal.kernel.security.permission.BaseModelPermissionChecker`.

-   **日付**:2023年8月11日
-   **チケット**: [LPS-182671](https://liferay.atlassian.net/browse/LPS-182671) 
-   **変更点**：BaseModelPermissionChecker` インターフェースは削除された。 [`ModelResourcePermission`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/security/permission/resource/ModelResourcePermission.java) を代わりに実装する。
-   **理由**このインタフェースは7.1で廃止され、使われなくなった。

**SchedulerEngine.java** [`portal-kernel/src/com/liferay/portal/kernel/scheduler/SchedulerEngine.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/scheduler/SchedulerEngine.java) 

-   **日付**:2023年8月24日
-   **チケット**: [LPS-194314](https://liferay.atlassian.net/browse/LPS-194314) 
-   **変更点**：unschedule`メソッドが削除されました。 代わりに `delete` メソッドを呼び出す。
-   **理由**：スケジュールされていないジョブも同時に削除する必要があるため、このメソッドは必要ありません。

**SchedulerEngineHelper.java** [`portal-kernel/src/com/liferay/portal/kernel/scheduler/SchedulerEngineHelper.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/scheduler/SchedulerEngineHelper.java) 

-   **日付**:2023年8月24日
-   **チケット**: [LPS-194314](https://liferay.atlassian.net/browse/LPS-194314) 
-   **変更点**：unschedule`メソッドが削除されました。 代わりに `delete` メソッドを呼び出す。
-   **理由**：スケジュールされていないジョブも同時に削除する必要があるため、このメソッドは必要ありません。

**SchedulerEngineHelperUtil.java** [`portal-kernel/src/com/liferay/portal/kernel/scheduler/SchedulerEngineHelperUtil.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/scheduler/SchedulerEngineHelperUtil.java) 

-   **日付**:2023年8月24日
-   **チケット**: [LPS-194314](https://liferay.atlassian.net/browse/LPS-194314) 
-   **変更点**：unschedule`メソッドが削除されました。 代わりに `delete` メソッドを呼び出す。
-   **理由**：スケジュールされていないジョブも同時に削除する必要があるため、このメソッドは必要ありません。

**DestinationEventListener.java**
`portal-kernel/src/com/liferay/portal/kernel/messaging/DestinationEventListener.java`.

-   **日付**:2023年9月1日
-   **チケット**: [LPS-195116](https://liferay.atlassian.net/browse/LPS-195116) 
-   **変更点**：DestinationEventListener`インターフェイスが削除された。 デスティネーション`の登録および登録解除イベントのリスニングはサポートされなくなった。
-   **理由**：このリスナーは使用されなくなりました。

**MessageBusEventListener.java**
`portal-kernel/src/com/liferay/portal/kernel/messaging/MessageBusEventListener.java`.

-   **日付**:2023年9月1日
-   **チケット**: [LPS-195116](https://liferay.atlassian.net/browse/LPS-195116) 
-   **変更点**：MessageBusEventListener`インターフェイスが削除された。 MessageListener`の登録イベントと登録解除イベントのリスニングはサポートされなくなった。
-   **理由**：このリスナーは使用されなくなりました。

**Destination.java** [`portal-kernel/src/com/liferay/portal/kernel/messaging/Destination.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/messaging/Destination.java) 

-   **日付**:2023年9月1日
-   **チケット**: [LPS-194337](https://liferay.atlassian.net/browse/LPS-194337) 
-   **変更点**：これらのメソッドは削除された：copyMessageListeners`、`getMessageListenerCount`、`isRegistered`、`register`、`unregister`。 [`MessageListenerRegistry`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/messaging/MessageListenerRegistry.java) インタフェースが追加され、指定された宛先名に関連付けられているメッセージリスナーを取得できるようになった。 destination.name`プロパティを使用して、`MessageListener`をOSGiサービスとして登録し、コードを更新する。
-   **理由**:この変更により、メッセージバスのコード構造が簡素化される。

**TriggerConfiguration.java** [`portal-kernel/src/com/liferay/portal/kernel/scheduler/TriggerConfiguration.java`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/scheduler/TriggerConfiguration.java) 

-   **日付**:2023年9月11日
-   **チケット**: [LPS-190994](https://liferay.atlassian.net/browse/LPS-190994) 
-   **変更点スケジューラーフレームワークは、ジョブを無効にするために空のcron式（または`0`のインターバル）を使用することをサポートしなくなりました。 代わりに、コンポーネント・ブラックリストを使って、特定のスケジューラ・コンポーネントを無効にしてください。 空のクーロン式を使用する際に表示されるエラーメッセージで、必要なクラス名を確認してください。
-   **理由ブートストラップされるべきでないジョブは、スケジューラ・フレームワークに登録されるべきではありません。
