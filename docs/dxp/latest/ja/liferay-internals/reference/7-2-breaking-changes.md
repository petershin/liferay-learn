# 7.2破壊的な変更

このドキュメントは、サードパーティのLiferay開発者またはユーザーとの既存の機能、API、または契約に違反する変更の時系列リストを示しています。 私たちはこれらの混乱を最小限にするために最善を尽くしていますが、時には避けられないこともあります。

このファイルに記載されている変更の種類の一部を次に示します。

* 削除または置換される機能
* 旧バージョンと非互換の変更：パブリックJavaまたはJavaScript APIの変更
* テンプレートで利用可能なコンテキスト変数の変更
* Liferayテーマおよびポートレットで利用可能なCSSクラスの変更
* 設定の変更：`portal.properties`、`system.properties`などの設定ファイルの変更
* 実行要件：Javaバージョン、Java EEバージョン、ブラウザーバージョンなど
* 非推奨またはサポート終了：たとえば、次のバージョンで特定の機能またはAPIが停止されると警告している
* 推奨事項：たとえば、後方互換性のためにLiferay Portalに古いAPIが保持されているにもかかわらず、古いAPIに代わる、新しく導入されたAPIを使用することを推奨している

## 旧バージョンと非互換の変更リスト

### テーマにおけるJSPテンプレートのサポートを削除しました。
- **日付：** 2018年11月14日
- **JIRAチケット：** [LPS-87064](https://issues.liferay.com/browse/LPS-87064)

#### 変更点

テーマがJSPテンプレートを利用できなくなりました。 また、関連するロジックは、パブリックAPI `com.liferay.portal.kernel.util.ThemeHelper`および`com.liferay.taglib.util.ThemeUtil`から削除されました。

#### 影響を受ける人

これは、JSP テンプレートを使用したテーマや、削除されたメソッドを使用している人に影響します。

#### コードの更新方法

JSP テンプレートを利用したテーマをお持ちの方は、FreeMarker への移行をご検討ください。

#### 変更が行われた理由

JSPは本当の意味でのテンプレートエンジンではないので、ほとんど使われることはありません。 今後、テンプレートエンジンはFreeMarkerを推奨します。

JSPテンプレートの削除により、既存および新規のテンプレートエンジンに焦点を当てることができるようになりました。

---------------------------------------

### Lodashはデフォルトでは含まれなくなりました。
- **日付：** 2018年11月27日
- **JIRAチケット：** [LPS-87677](https://issues.liferay.com/browse/LPS-87677)

#### 変更点

以前は、Lodash はデフォルトですべてのページに含まれており、グローバルな `window._` とスコープ付きの `AUI._` 変数を通じて利用できるようになっていました。 Lodashはデフォルトで含まれなくなり、これらの変数は未定義になりました。

#### 影響を受ける人

この問題は、カスタムスクリプトで `AUI._` または `window._` 変数を使用していたすべての開発者に影響します。

#### コードの更新方法

サードパーティライブラリを追加する方法として、独自のLodashバージョンを提供し、カスタム開発で使用する必要があります。

一時的な対策として、Liferayポータルのコントロールパネルの*［コントロールパネル］* &rarr; *［設定］* &rarr; *［システム設定］* &rarr; *［サードパーティー］* &rarr; *［Lodash］*で*［Lodashを有効にする］*プロパティを`true`に設定することで、以前の動作に戻すことができます。

#### 変更が行われた理由

この変更は、ほとんどの場合未使用で冗長なすべてのページに追加のライブラリコードをバンドルして提供することを回避するために行われました。

---------------------------------------

### 2つのステージングポータルプロパティをOSGi構成に移動
- **日付：** 2018年12月12日
- **JIRAチケット：** [LPS-88018](https://issues.liferay.com/browse/LPS-88018)

#### 変更点

2つのStagingプロパティが、 `portal.properties` から、 `export-import-service` モジュール内の `ExportImportServiceConfiguration.java` というOSGi設定に移動されました。

#### 影響を受ける人

この問題は、以下のポータルサイトのプロパティを使用している人に影響します。

- `staging.delete.temp.lar.on.failure`
- `staging.delete.temp.lar.on.success`

#### コードの更新方法

`portal.properties` ファイルを上書きする代わりに、Portalの設定管理者からプロパティを管理することができます。 これにアクセスするには、Liferayポータルの*［コントロールパネル］* &rarr; *［設定］* &rarr; *［システム設定］* &rarr; *［Infrastructure］* &rarr; *［エクスポート / インポート］*に移動し、そこで設定を編集します。

新しいコンフィギュレーションをアプリケーションに組み込みたい場合は、 [making applications configurable](https://dev.liferay.com/develop/tutorials/-/knowledge_base/7-1/making-applications-configurable) の手順に従ってください。

#### 変更が行われた理由

この変更は、ポータルの構成変更を容易にするためのモジュール化の一環として行われたものです。

---------------------------------------

### ページの機能へのリンクアプリケーションURLを削除
- **日付：** 2018年12月14日
- **JIRAチケット：** [LPS-85948](https://issues.liferay.com/browse/LPS-85948)

#### 変更点

*Link Portlet URLs to Page* ポートレットの Look and Feel のオプションは、Liferay Portal 7.1 で非推奨とされ、ユーザーは設定プロパティでオプションを表示、非表示することができるようになりました。 Liferay Portal 7.2 では、これは削除され、設定することができなくなりました。

#### 影響を受ける人

この問題は、UIでオプションを使用した管理者とポートレットでオプションを使用した開発者に影響します。

#### コードの更新方法

この機能を利用しているポートレットは、ポータルでプロパティへの事前構成された参照が無視されるため、更新する必要があります。

#### 変更が行われた理由

このプロパティを使用するポートレットは限られており、同じ結果を得るにはもっと良い方法があります。

---------------------------------------

### TermsOfUseContentProviderをkernel.utilから移動しました。
- **日付：** 2019年1月07日
- **JIRAチケット：** [LPS-88869](https://issues.liferay.com/browse/LPS-88869)

#### 変更点

`TermsOfUseContentProvider` インターフェイスのパッケージが変更されました。

`com.liferay.portal.kernel.util` &rarr; `com.liferay.portal.kernel.term.of.use`

`TermsOfUseContentProviderRegistryUtil` クラスの名前とパッケージが変更されました。

`TermsOfUseContentProviderRegistryUtil` &rarr; `TermsOfUseContentProviderUtil`

および

`com.liferay.portal.kernel.util` &rarr; `com.liferay.portal.internal.terms.of.use`

`TermsOfUseContentProvider` を取得するロジックも変更されました。 登録されたサービスの順序に依存するランダムな最初のサービスを常に返すのではなく、 `TermsOfUseContentProvider` サービスが追跡され、 `com.liferay.portal.kernel.util.ServiceProxyFactory`で更新されます。 その結果、 `TermsOfUseContentProvider` は、サービスランキングを尊重するようになりました。

#### 影響を受ける人

これは、`com.liferay.portal.kernel.util.TermsOfUseContentProviderRegistryUtil`を使用して`com.liferay.portal.kernel.util.TermsOfUseContentProvider`サービスを検索していたすべての人に影響します。

#### コードの更新方法

`com.liferay.portal.kernel.util.TermsOfUseContentProvider`を使用する場合は、インポートパッケージ名を更新してください。 `portal-web`で何か使用している場合は、`com.liferay.portal.kernel.util.TermsOfUseContentProviderRegistryUtil`を`com.liferay.portal.kernel.term.of.use.TermsOfUseContentProviderUtil`に更新してください。 モジュール内の`com.liferay.portal.kernel.util.TermsOfUseContentProviderRegistryUtil`の使用を削除し、代わりに`@Reference`アノテーションを使用して`com.liferay.portal.kernel.term.of.use.TermsOfUseContentProvider`サービスをフェッチします。

#### 変更が行われた理由

これは、パッケージのバージョンがロックダウンする可能性を減らすために、カーネルプロバイダインターフェースをクリーンアップするためのいくつかのステップのうちの1つです。

---------------------------------------

### HibernateConfigurationConverterとConverterを削除しました。
- **日付：** 2019年1月07日
- **JIRAチケット：** [LPS-88870](https://issues.liferay.com/browse/LPS-88870)

#### 変更点

インターフェイス`com.liferay.portal.kernel.util.Converter`とその実装`com.liferay.portal.spring.hibernate.HibernateConfigurationConverter`が削除されました。

#### 影響を受ける人

これにより、 `HibernateConfigurationConverter`で実装されているカスタマイズされた `portlet-hbm.xml` ファイルを生成するサポートが削除されました。 詳細は、 [LPS-5363](https://issues.liferay.com/browse/LPS-5363) を参照してください。

#### コードの更新方法

`HibernateConfigurationConverter`の使用は削除する必要があります。 生成された `portlet-hbm.xml` が正確であることを確認します。

#### 変更が行われた理由

これは、パッケージのバージョンがロックダウンする可能性を減らすために、カーネルプロバイダインターフェースをクリーンアップするためのいくつかのステップのうちの1つです。

---------------------------------------

### JDKの関数とサプライヤーを使用するように切り替えました。
- **日付：** 2019年1月08日
- **JIRAチケット：** [LPS-88911](https://issues.liferay.com/browse/LPS-88911)

#### 変更点

パッケージ `com.liferay.portal.kernel.util` の `Function` と `Supplier` のインターフェイスは削除されました。 それらの使用は、`java.util.function.Function`および`java.util.function.Supplier`に置き換えられました。

#### 影響を受ける人

パッケージ `com.liferay.portal.kernel.util`の `Function` と `Supplier` インターフェイスを実装している人に影響があります。

#### コードの更新方法

`com.liferay.portal.kernel.util.Function`と`com.liferay.portal.kernel.util.Supplier`の使用を、それぞれ`java.util.function.Function`と`java.util.function.Supplier`に置き換える必要があります。

#### 変更が行われた理由

これは、パッケージのバージョンがロックダウンする可能性を減らすために、カーネルプロバイダインターフェースをクリーンアップするためのいくつかのステップのうちの1つです。

---------------------------------------

### com.liferay.portal.service.InvokableServiceインターフェイスを廃止
- **日付：** 2019年1月08日
- **JIRAチケット：** [LPS-88912](https://issues.liferay.com/browse/LPS-88912)

#### 変更点

パッケージ `com.liferay.portal.kernel.service` の `InvokableService` と `InvokableLocalService` インターフェイスは削除されました。

#### 影響を受ける人

パッケージ `com.liferay.portal.kernel.service`で `InvokableService` と `InvokableLocalService` を使用していた人に影響があります。

#### コードの更新方法

`InvokableService` と `InvokableLocalService`の使用は削除する必要があります。 削除後にコンパイルエラーが発生した場合、サービスの実装を生成するために、必ず最新版のサービスビルダーを使用してください。

#### 変更が行われた理由

これは、パッケージのバージョンがロックダウンする可能性を減らすために、カーネルプロバイダインターフェースをクリーンアップするためのいくつかのステップのうちの1つです。

---------------------------------------

### ServiceLoaderConditionのサポートを終了しました。
- **日付：** 2019年1月08日
- **JIRAチケット：** [LPS-88913](https://issues.liferay.com/browse/LPS-88913)

#### 変更点

パッケージ `com.liferay.portal.kernel.util` のインターフェース `ServiceLoaderCondition` とその実装 `DefaultServiceLoaderCondition` は削除されました。

#### 影響を受ける人

この問題は、 `ServiceLoaderCondition` と `DefaultServiceLoaderCondition`を使用している人に影響します。

#### コードの更新方法

`ServiceLoaderCondition`の使用は削除する必要があります。 更新されたメソッドシグネチャに従って、`com.liferay.portal.kernel.util.ServiceLoader`の`load`メソッドの使用を更新します。

#### 変更が行われた理由

これは、パッケージのバージョンがロックダウンする可能性を減らすために、カーネルプロバイダインターフェースをクリーンアップするためのいくつかのステップのうちの1つです。

---------------------------------------

### JDK述語を使用するように変更しました。
- **日付：** 2019年1月14日
- **JIRAチケット：** [LPS-89139](https://issues.liferay.com/browse/LPS-89139)

#### 変更点

インターフェイス`com.liferay.portal.kernel.util.PredicateFilter`が削除され、`java.util.function.Predicate`に置き換えられました。 その結果、以下の実装が削除されました。

- `com.liferay.portal.kernel.util.AggregatePredicateFilter`
- `com.liferay.portal.kernel.util.PrefixPredicateFilter`
- `com.liferay.portal.kernel.portlet.JavaScriptPortletResourcePredicateFilter`
- `com.liferay.dynamic.data.mapping.form.values.query.internal.model.DDMFormFieldValuePredicateFilter`

`com.liferay.portal.kernel.util.ArrayUtil_IW` クラスが再生成されました。

#### 影響を受ける人

`PredicateFilter`, `AggregatePredicateFilter`, `PrefixPredicateFilter`, `JavaScriptPortletResourcePredicateFilter`, そして `DDMFormFieldValuePredicateFilter`を使用していた方に影響します。

#### コードの更新方法

`com.liferay.portal.kernel.util.PredicateFilter`の使用を`java.util.function.Predicate`に置き換える必要があります。 さらに、 `AggregatePredicateFilter`, `PrefixPredicateFilter`, `JavaScriptPortletResourcePredicateFilter`, `DDMFormFieldValuePredicateFilter`の使用を削除してください。

#### 変更が行われた理由

これは、パッケージのバージョンがロックダウンする可能性を減らすために、カーネルプロバイダインターフェースをクリーンアップするためのいくつかのステップのうちの1つです。

---------------------------------------

### com.liferay.portal.kernel.utilパッケージから安全でない機能インターフェイスを削除しました
- **日付：** 2019年1月15日
- **JIRAチケット：** [LPS-89223](https://issues.liferay.com/browse/LPS-89223)

#### 変更点

`com.liferay.portal.osgi.util.test.OSGiServiceUtil` クラスは削除されました。 また、以下のインターフェースは `com.liferay.portal.kernel.util` パッケージから削除されました。

- `UnsafeConsumer`
- `UnsafeFunction`
- `UnsafeRunnable`

#### 影響を受ける人

これは、上記のクラス/インターフェイスを使用している人に影響します。

#### コードの更新方法

`com.liferay.portal.osgi.util.test.OSGiServiceUtil` クラスは、Liferay Portal 7.1 から非推奨になりました。 `com.liferay.osgi.util.service.OSGiServiceUtil`. `UnsafeConsumer`, `UnsafeFunction` and `UnsafeRunnable` の使用を、パッケージ `com.liferay.petra.function`の対応するインターフェースに置き換えます。

#### 変更が行われた理由

これは、パッケージのバージョンがロックダウンする可能性を減らすために、カーネルプロバイダインターフェースをクリーンアップするためのいくつかのステップのうちの1つです。

---------------------------------------

### ポータル配信における非推奨のNTLMについて
- **日付：** 2019年1月21日
- **JIRAチケット：** [LPS-88300](https://issues.liferay.com/browse/LPS-88300)

#### 変更点

NTLM モジュールは `portal-security-sso` プロジェクトから `portal-security-sso-ntlm`という名前の新しいプロジェクトに移動されました。 この新しいプロジェクトは非推奨で、Liferay Marketplaceからダウンロードすることができます。

#### 影響を受ける人

これは、NTLMを認証システムとして使用している人に影響します。

#### コードの更新方法

NTLMを認証システムとして使い続けたい場合は、Liferay Marketplaceから対応モジュールをダウンロードする必要があります。 あるいは、Kerberosに移行することもできます（推奨）。これは、変更の必要がなく、Liferay Portal 7.0+と互換性があります。

#### 変更が行われた理由

この変更は、古い独自のソリューション（NTLM）を使用しないようにするために行われました。 標準的なプロトコルであり、NTLMと比較してより安全な認証方法であるKerberosが推奨されるようになりました。

---------------------------------------

### ポータル配信における非推奨のOpenID
- **日付：** 2019年1月21日
- **JIRAチケット：** [LPS-88906](https://issues.liferay.com/browse/LPS-88906)

#### 変更点

OpenID モジュールは、 `portal-security-sso-openid`という名前の新しいプロジェクトに移動されました。 この新しいプロジェクトは非推奨で、Liferay Marketplaceからダウンロードすることができます。

#### 影響を受ける人

これは、OpenIDを認証システムとして使っている人に影響します。

#### コードの更新方法

OpenIDを認証システムとして使い続けたい場合は、Liferay Marketplaceから該当モジュールをダウンロードする必要があります。 または、Liferay Portal Distributionで利用可能なOpenID Connectに移行する必要があります。

#### 変更が行われた理由

この変更は、非推奨のソリューション（OpenID）を使用しないために行われました。 OAuthの上で動作するため、より安全な認証方法であるOpenID Connectが推奨されるようになりました。

---------------------------------------

### ポータル配信における非推奨のGoogle SSOについて
- **日付：** 2019年1月21日
- **JIRAチケット：** [LPS-88905](https://issues.liferay.com/browse/LPS-88905)

#### 変更点

Google SSO モジュールは `portal-security-sso` プロジェクトから `portal-security-sso-google`という名前の新しいプロジェクトに移動されました。 この新しいプロジェクトは非推奨で、Liferay Marketplaceからダウンロードすることができます。

#### 影響を受ける人

これは、Google SSOを認証システムとして使用している人に影響します。

#### コードの更新方法

Google SSOを認証システムとして使い続けたい場合は、Liferay Marketplaceから対応するモジュールをダウンロードする必要があります。 または、OpenID Connectを使用することもできます。

#### 変更が行われた理由

この変更は、認証に古いソリューション（Google SSO）を使用しないようにするために行われました。 OpenID Connectは、認証にGoogleの実装を使用することが推奨されている仕様です。

---------------------------------------

### liferay-amd-loader から Liferay.Loader.addModules を削除しました。
- **日付：** 2019年2月01日
- **JIRAチケット：** [LPS-83949](https://issues.liferay.com/browse/LPS-83949)

#### 変更点

liferay-amd-loader version 4.x 以降では、addModules 関数が削除されました。

#### 影響を受ける人

これは、liferay-amd-loaderを直接使ってモジュールを定義している人に影響します。

#### コードの更新方法

Liferay.Loader.addModules を直接置き換えるものはありません。

モジュールを公開するためにJS Toolkitプロジェクトを作成するのも一つの方法です： https://github.com/liferay/liferay-frontend-projects/tree/master/maintenance/projects/js-toolkit/docs

#### 変更が行われた理由

すべてのモジュール解決をサーバー側で行うことで、スピードとネットワークパフォーマンスを向上させます。

---------------------------------------

### AlloyEditor v2.0は、Reactの新しいメジャーバージョンを含むように更新されました。
- **日付：** 2019年2月4日
- **JIRAチケット：** [LPS-90079](https://issues.liferay.com/browse/LPS-90079)

#### 変更点

AlloyEditorがバージョン2.0.0になり、React v15からv16へのメジャーアップグレードが行われました。

`React.createClass` は、React v15.5.0（2017年4月）で [非推奨、React v16.0.0](https://reactjs.org/blog/2017/04/07/react-v15.5.0.html) （2017年9月）でが廃止されました。 AlloyEditor にバンドルされているすべてのボタンは、 `React.createClass`の代わりに ES6 クラス構文を使用するように更新されました。

#### 影響を受ける人

この問題は、 `React.createClass`を使って独自のボタンを作成した人に影響します。 `createClass` 関数は使用できなくなり、実行時にアクセスしようとするとエラーが発生します。

#### コードの更新方法

コードの更新は、2つの方法のいずれかで行う必要があります。

- [Reactのドキュメント](https://reactjs.org/docs/react-component.html)に記載の通り、`React.createClass`APIからカスタムボタンをポートし、ES6`class`APIを使用します。例として、[以前の`createClass`ベースの実行](https://github.com/liferay/alloy-editor/blob/2826ab9ceabe17c6ba0d38985baf8a787c23db43/src/ui/react/src/components/buttons/button-ol.jsx)から[ES6クラスベースのボタン](https://github.com/liferay/alloy-editor/blob/b082c312179ae6626cb2ddcc04ad3ebc5b355e1b/src/components/buttons/button-ol.jsx)に移行する際の変更点をご覧ください。
  
- 互換性アダプタを提供します。[create-react-classパッケージ](https://www.npmjs.com/package/create-react-class) (説明は[こちら](https://reactjs.org/docs/react-without-es6.html))をページに注入することで、`createClass`のAPIを復元することができます。 

#### 変更が行われた理由

この変更は、より新しいメジャーバージョンのReactを使用するために行われ、パフォーマンスと互換性の改善をもたらし、非推奨のAPIを削除することでバンドルサイズを縮小しています。

---------------------------------------

### dl.tabs.visibleポータルプロパティは非推奨になりました

- **日付：** 2019年4月10日
- **JIRAチケット：** [LPS-93948](https://issues.liferay.com/browse/LPS-93948)

#### 変更点

`dl.tabs.visible` プロパティを使用すると、ウィジェットページに配置したときに、Documents and Media ウィジェットのナビゲーションタブの表示/非表示を切り替えられるようになります。 この設定オプションは削除されたため、ウィジェットページにナビゲーションタブが表示されることはありません。

#### 影響を受ける人

`dl.tabs.visible` プロパティを `true`に設定した人に影響します。

#### コードを更新するにはどうすればよいですか？

コードの変更は必要ありません。

#### 変更が行われた理由

ドキュメント & メディアはUXの観点から見直され、ウィジェットページのナビゲーションタブの削除はUIクリーンアップの一環として行われました。

---------------------------------------

### ユーザーメニューを製品メニューから移動

- **日付：** 2019年4月19日
- **JIRAチケット：** [LPS-87868](https://issues.liferay.com/browse/LPS-87868)

#### 変更点

ユーザーメニューはプロダクトメニューから削除され、ユーザーメニューエントリは、ユーザーのアバターによってトリガーされるドロップダウンメニューである新しいパーソナルメニューに移動されました。

#### 影響を受ける人

これは、プロダクトメニューのユーザーメニューセクションをカスタマイズしたすべてのユーザーに影響します。

#### コードの更新方法

カスタムユーザーメニューエントリーを保持し、パーソナルメニューで利用できるようにしたい場合は、 `PersonalMenuEntry` インターフェイスを実装する必要があります。 `PanelCategoryKeys.USER`、 `PanelCategoryKeys.USER_MY_ACCOUNT`、 `PanelCategoryKeys.USER_SIGN_OUT` のパネルカテゴリキーで登録されているすべてのパネルアプリは、 `PersonalMenuEntry`に変換しておく必要があります。

#### 変更が行われた理由

製品ナビゲーションはUXの観点から見直されており、プロダクトメニューからユーザーメニューを削除し、メニューを独自のメニューに分割することで、ユーザーエクスペリエンスが向上します。

---------------------------------------

### 国別一覧から香港・マカオを削除しました。

- **日付：** 2019年4月26日
- **JIRAチケット：** [LPS-82203](https://issues.liferay.com/browse/LPS-82203)

#### 変更点

香港とマカオは国名から削除され、それぞれ湘江（リージョンコード：CN-91）、澳門（リージョンコード：CN-92）として中国の地域名として記載されています。

#### 影響を受ける人

これは、住所に香港やマカオを使用していた人に影響します。

#### コードの更新方法

コードの変更は必要ありません。 ただし、香港とマカオの `countryId` をコードにハードコードしている場合は、中国の `countryId`に更新する必要があります。 香港とマカオへの言及は、対応する `regionId`で行う必要があります。

#### 変更が行われた理由

1997年の香港返還、1999年のマカオ返還を経て、現在、香港とマカオは中国の特別行政区となっています。

---------------------------------------

### JGroups が 3.6.16 から 4.1.1 にアップグレードされました。

- **日付：** 2019年8月15日
- **JIRAチケット：** [LPS-97897](https://issues.liferay.com/browse/LPS-97897)

#### 変更点

JGroups をバージョン 3.6.16 からバージョン 4.1.1 に更新しました。

#### 影響を受ける人

クラスターリンクをご利用の方に影響します。

#### コードの更新方法

`portal.properties` の `cluster.link.channel.properties.*` プロパティは、値として接続文字列を受け付けなくなり、構成 XML ファイルへのファイルパスが必要になりました。 3.6.16 のプロトコルプロパティのいくつかは削除され、4.1.1 では解析されなくなりました。

#### 変更が行われた理由

今回のバージョンアップは、セキュリティ上の問題を修正するために行われました。

---------------------------------------

### Liferay AssetEntries_AssetCategories は使用されなくなりました

- **日付：**  2019年9月11日
- **JIRAのチケットです。** [LPS-99973](https://issues.liferay.com/browse/LPS-99973) , [LPS-76488](https://issues.liferay.com/browse/LPS-76488)

#### 変更点

以前は、Liferay は `AssetEntry` と `AssetCategory` の間の関係で、 `AssetEntryLocalService` と `AssetCategoryLocalService`にマッピングテーブルと対応するインターフェイスを使用しました。 このマッピングテーブルと対応するインタフェースは、テーブル `AssetEntryAssetCategoryRel` とサービス `AssetEntryAssetCategoryRelLocalService`に置き換わった。

#### 影響を受ける人

これは、 `AssetEntries_AssetCategories` の関係で、 `AssetEntryLocalService` と `AssetCategoryLocalService`を通じて古いインターフェースの呼び出しに依存するすべてのコンテンツやコードに影響 します。

#### コードの更新方法

`AssetEntryAssetCategoryRelLocalService` の新しいメソッドを使用すると、従来と同じデータを取得できます。 メソッドのシグネチャは変更されておらず、別のサービスに移されただけです。

**例**

昔のやり方。

```java
リスト<AssetEntry> entries =
AssetEntryLocalServiceUtil.getAssetCategoryAssetEntries(categoryId);

for (AssetEntry entry: entries) {
  ...
}
```

新しい方法です。

```java
long ［］ assetEntryPKs =
_assetEntryAssetCategoryRelLocalService.getAssetEntryPrimaryKeys（assetCategoryId）; （long assetEntryPK：assetEntryPKs）に対して

{
  AssetEntry = _assetEntryLocalService.getEntry（assetEntryPK）;
...
}

...

@Reference
private AssetEntryAssetCategoryRelLocalService _assetEntryAssetCategoryRelLocalService;

@Reference
private AssetEntryLocalService _assetEntryLocalService;
```

#### 変更が行われた理由

この変更は、 [LPS-76488](https://issues.liferay.com/browse/LPS-76488) の結果、開発者が与えられたカテゴリのアセットリストの順序を制御できるようになったことに起因しています。

---------------------------------------

### 自動タグ付けは手動で再設定する必要があります。

- **日付：** 2019年10月02日
- **JIRAチケット：** [LPS-97123](https://issues.liferay.com/browse/LPS-97123)

#### 変更点

自動タグ付け設定の名称を変更し、再編成しました。 自動アップグレードプロセスはなくなりましたので、手動でAuto Taggingを再設定する必要があります。

#### 影響を受ける人

この問題は、SP1にアップグレードされたDXP 7.2のインストールで、自動タグ付けが設定され、有効になっている場合に発生します。

#### コードの更新方法

システム設定で自動タグ付けを再設定する必要があります（詳細は、 [公式ドキュメント](https://help.liferay.com/hc/ja/articles/360029041551-Configuring-Asset-Auto-Tagging) を参照してください）。 古い設定インタフェースを参照しているコードは、新しいインタフェースを使用するように更新する必要があります。

#### 変更が行われた理由

この変更により、これまで分割されていた設定インターフェースが統一され、ユーザーエクスペリエンスが向上しました。

---------------------------------------

### ブログ画像ポータルプロパティをシステム設定に移動

- **日付：** 2019年10月02日
- **JIRAチケット：** [LPS-95298](https://issues.liferay.com/browse/LPS-95298)

#### 変更点

ブログ画像の設定を `portal.properties` から System Settings に移動しました。 自動アップグレードプロセスがないため、カスタムBlogsイメージのプロパティは手動で再設定する必要があります。

#### 影響を受ける人

この問題は、SP1にアップグレードしたDXP 7.2のインストールで、 `blogs.image.max.size` と `blogs.image.extensions` のプロパティにカスタム値を持っている場合に発生します。

#### コードの更新方法

カスタムブログ画像のプロパティ値を保持する場合は、*［設定］* &rarr; *［ブログ］* &rarr; *［ファイルアップロード］*の［システム設定］で再構成する必要があります。 古いプロパティを参照しているコードは、新しいコンフィギュレーション・インターフェースを使用するように更新する必要があります。

#### 変更が行われた理由

この変更は、ブログ画像のプロパティを再起動せずに設定できるようにするために行われました。

---------------------------------------

### キャッシュブートストラップ機能を削除

- **日付：** 2020年1月08日
- **JIRAチケット：** [LPS-96563](https://issues.liferay.com/browse/LPS-96563)

#### 変更点

キャッシュブートストラップ機能は削除されました。 これらのプロパティは、キャッシュブートストラップを有効化/構成するために使用できなくなりました。

`ehcache.bootstrap.cache.loader.enabled`, `ehcache.bootstrap.cache.loader.properties.default`, `ehcache.bootstrap.cache.loader.properties.${specific.cache.name}`.

#### 影響を受ける人

これは、上記のプロパティを使用するすべてのユーザーに影響します。

#### コードの更新方法

削除された機能を直接置き換えるものはありません。 それに依存するコードがある場合は、自分で実装する必要があります。

#### 変更が行われた理由

この変更は、セキュリティの問題を回避するために行われました。

---------------------------------------

### ContentTransformerListenerをデフォルトで無効化

- **日付：** 2020年5月25日
- **JIRAチケット：** [LPS-114239](https://issues.liferay.com/browse/LPS-114239)

#### 変更点

`ContentTransformerListener` はデフォルト設定で無効になりました。

#### 影響を受ける人

これは、`ContentTransformerListener`によって提供されるレガシーなWebコンテンツ機能を使用したLiferay Portalのインストールに影響します。例えば、別のWebコンテンツ内にWebコンテンツを埋め込む、レガシーなエディット・イン・プレース・インフラストラクチャ、トークンの置換(`@article_group_id@`、`@articleId;elementName@`)などです。

#### コードを更新するにはどうすればよいですか？

コードを更新する必要はありません。 それでも`ContentTransformerListener`を使用する場合は、システム設定で有効にできます。

#### なぜこの変更が行われたのですか？

`ContentTransformerListener`は、記事要素に対して多くの文字列プロセスを実行します（記事フィールドに対して`HtmlUtil.stripComments`および`HtmlUtil.stripHtml`を呼び出します）。 パフォーマンスを向上させるために無効にされました。

---------------------------------------

### DDMDataProviderのメソッドを置き換え

- **日付：** 2020年7月14日
- **JIRAチケット：** [LPS-81563](https://issues.liferay.com/browse/LPS-81563)

#### 変更点

`com.liferay.dynamic.data.mapping.data.provider.DataProvider`の`getData`メソッドの`ddmDataProviderContext`パラメーター（`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderContext`型）が、`ddmDataProviderRequest`（`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest`型）に置き換えられました。

#### 影響を受ける人

これは、置き換えられたメソッドを使用するすべてのユーザーに影響します。

#### コードを更新するにはどうすればよいですか？

`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderContext`型のパラメーターを、`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest`型のパラメーターに置き換えます。

#### なぜこの変更が行われたのですか？

この変更は、 [LPS-81563](https://issues.liferay.com/browse/LPS-81563) でのデータプロバイダーAPIリファクタリングの一部です。

---------------------------------------

### DDMDataProviderRequestのコンストラクターを削除

- **日付：** 2020年7月14日
- **JIRAチケット：** [LPS-81563](https://issues.liferay.com/browse/LPS-81563)

#### 変更点

コンストラクターメソッドが`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest`から削除されました。

#### 影響を受ける人

これは、削除されたコンストラクターを使用するすべてのユーザーに影響します。

#### コードを更新するにはどうすればよいですか？

`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest.Builder`を使用して、コンストラクターではなく、必要なすべてのパラメーターを使用して新しい`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest`を作成します。

#### なぜこの変更が行われたのですか？

この変更は、 [LPS-81563](https://issues.liferay.com/browse/LPS-81563) でのデータプロバイダーAPIリファクタリングの一部です。

---------------------------------------

### DDMDataProviderRequestのメソッドを削除

- **日付：** 2020年7月14日
- **JIRAチケット：** [LPS-81563](https://issues.liferay.com/browse/LPS-81563)

#### 変更点

次のメソッドが`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest`から削除されました。

- `getDDMDataProviderContext`
- `setDDMDataProviderContext`
- `getHttpServletRequest`
- `getParameter`
- `queryString`

#### 影響を受ける人

これは、削除されたメソッドを使用していたすべてのユーザーに影響します。

#### コードを更新するにはどうすればよいですか？

`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest`および`com.liferay.dynamic.data.mapping.data.provider.internal.DDMDataProviderInstanceSettingsImpl`を使用して、`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderContext`によって提供されるデータを取得します。

また、メソッド`withParameter`を使用して`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest.Builder`を介して`javax.servlet.http.HttpServletRequest`オブジェクトを追加し、メソッド`getParameterOptional`を使用してそれを取得します。

`getParameter`の代わりに既存のメソッド`getParameterOptional`を使用します。 `queryString`の使用を`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest.Builder`のメソッド`withParameter`に置き換えて、必要なすべてのパラメーターを追加します。 

#### なぜこの変更が行われたのですか？

この変更は、 [LPS-81563](https://issues.liferay.com/browse/LPS-81563) でのデータプロバイダーAPIリファクタリングの一部です。

---------------------------------------

### DDMDataProviderRequestのメソッドを置き換え

- **日付：** 2020年7月14日
- **JIRAチケット：** [LPS-81563](https://issues.liferay.com/browse/LPS-81563)

#### 変更点

`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest`の`getDDMDataProviderInstanceId`メソッドが`getDDMDataProviderId`に置き換えられました。

#### 影響を受ける人

これは、置き換えられたメソッドを使用していたすべてのユーザーに影響します。

#### コードを更新するにはどうすればよいですか？

`getDDMDataProviderInstanceId`の使用を`getDDMDataProviderId`に置き換えます。

#### なぜこの変更が行われたのですか？

この変更は、 [LPS-81563](https://issues.liferay.com/browse/LPS-81563) でのデータプロバイダーAPIリファクタリングの一部です。

---------------------------------------

### DDMDataProviderResponseのメソッドを削除

- **日付：** 2020年7月14日
- **JIRAチケット：** [LPS-81563](https://issues.liferay.com/browse/LPS-81563)

#### 変更点

メソッド`error`、`of`、および`getDataMap`がクラス`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponse`から削除されました。

#### 影響を受ける人

これは、削除されたメソッドを使用していたすべてのユーザーに影響します。

#### コードを更新するにはどうすればよいですか？

コードで次の更新されたメソッドを使用します。

- `error`メソッドを呼び出す代わりに、`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponse.Builder`の`withStatus`メソッドを使用します。
- `of`メソッドを`Builder`の`withStatus`および`withOutput`メソッドに置き換えます。
- `Builder`の`withOutput`メソッドを使用して`getDataMap`呼び出しを出力追加に置き換え、メソッド`getOutputOptional`を介して取得します。

メソッド`withOutput`は、必要な回数だけ呼び出すことができます。 

#### なぜこの変更が行われたのですか？

この変更は、 [LPS-81563](https://issues.liferay.com/browse/LPS-81563) でのデータプロバイダーAPIリファクタリングの一部です。

---------------------------------------

### DDMDataProviderResponseのメソッドを置き換え

- **日付：** 2020年7月14日
- **JIRAチケット：** [LPS-81563](https://issues.liferay.com/browse/LPS-81563)

#### 変更点

`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponse`の`get`メソッドが`getOutputOptional`に置き換えられました。

#### 影響を受ける人

これは、置き換えられたメソッドを使用していたすべてのユーザーに影響します。

#### コードを更新するにはどうすればよいですか？

`get`の代わりに`getOutputOptional`を使用します。

#### なぜこの変更が行われたのですか？

この変更は、 [LPS-81563](https://issues.liferay.com/browse/LPS-81563) でのデータプロバイダーAPIリファクタリングの一部です。

---------------------------------------

### DDMDataProviderResponseのEnumを置き換え

- **日付：** 2020年7月14日
- **JIRAチケット：** [LPS-81563](https://issues.liferay.com/browse/LPS-81563)

#### 変更点

ローカルenum `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponse.Status`が、`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponse`から`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponseStatus`に移動されました その結果、`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponse`からの`getStatus`のデータ型が、`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponse.Status`から`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponseStatus`に変更されました。 

#### 影響を受ける人

これは、置き換えられたenumを使用していたすべてのユーザーに影響します。

#### コードを更新するにはどうすればよいですか？

`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponse.Status`の使用を`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponseStatus`に置き換えます。

#### なぜこの変更が行われたのですか？

この変更は、 [LPS-81563](https://issues.liferay.com/browse/LPS-81563) でのデータプロバイダーAPIリファクタリングの一部です。

---------------------------------------

### DDMDataProviderResponseOutputを削除

- **日付：** 2020年7月14日
- **JIRAチケット：** [LPS-81563](https://issues.liferay.com/browse/LPS-81563)

#### 変更点

`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponseOutput`が削除されました。

#### 影響を受ける人

これは、削除されたクラスを使用していたすべてのユーザーに影響します。

#### コードを更新するにはどうすればよいですか？

削除されたクラスを直接置き換えるものはありません。 それに依存するコードがある場合は、自分で実装する必要があります。

#### なぜこの変更が行われたのですか？

クラス`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderResponseOutput`は、 [LPS-81563](https://issues.liferay.com/browse/LPS-81563) のデータプロバイダーコードに改善が実装された後に使用されなくなったため、廃止予定の警告なしに削除されました。

---------------------------------------

### DDMDataProviderTrackerのメソッドを削除

- **日付：** 2020年7月14日
- **JIRAチケット：** [LPS-81563](https://issues.liferay.com/browse/LPS-81563)

#### 変更点

`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderTracker`の`getDDMDataProviderContextContributors`メソッドが削除されました。

#### 影響を受ける人

これは、削除されたメソッドを使用していたすべてのユーザーに影響します。

#### コードを更新するにはどうすればよいですか？

`getDDMDataProviderContextContributors`の代わりに`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest`および`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderInstanceSettings`を使用して、必要なデータを取得します。

#### なぜこの変更が行われたのですか？

`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderContext`クラスによって提供されるすべてのデータは、クラス`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderRequest`および`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderInstanceSettings`にあります。 したがって、クラス`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderContext`および`com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderContextContributor`は不要になりました。  `com.liferay.dynamic.data.mapping.data.provider.DDMDataProviderContextContributor`がLiferay Portal 7.2で削除されたことに注意してください。 

---------------------------------------

### DDMFormInstanceRecordLocalServiceのメソッドを置き換え

- **日付：** 2020年7月14日
- **JIRAチケット：** [LPS-81564](https://issues.liferay.com/browse/LPS-81564)

#### 変更点

この変更は、`com.liferay.dynamic.data.mapping.service.DDMFormInstanceRecordLocalService`、`com.liferay.dynamic.data.mapping.service.DDMFormInstanceRecordLocalServiceUtil`、および`com.liferay.dynamic.data.mapping.service.DDMFormInstanceRecordLocalServiceWrapper`に対して行われました。

`getDDMFormValues`メソッドには`ddmStorageId`（`long`型）と呼ばれる単一のパラメーターがありましたが、現在は2つのパラメーター`storageId`（`ddmStorageId`の置換）と`ddmForm`（`com.liferay.dynamic.data.mapping.model.DDMForm`型）があります。 

#### 影響を受ける人

これは、置き換えられたメソッドを使用していたすべてのユーザーに影響します。

#### コードを更新するにはどうすればよいですか？

メソッドに`com.liferay.dynamic.data.mapping.model.DDMForm`型の新しいパラメーターを渡します。

#### なぜこの変更が行われたのですか？

この変更は、 [LPS-81564](https://issues.liferay.com/browse/LPS-81564) でのストレージアダプタAPIリファクタリングの一部です。

---------------------------------------

### DDMStructureServiceのメソッドを削除

- **日付：** 2020年7月14日
- **JIRAチケット：** [LPS-91760](https://issues.liferay.com/browse/LPS-91760)

#### 変更点

以下にリストされているメソッドが、`com.liferay.dynamic.data.mapping.service.DDMStructureService`、`com.liferay.dynamic.data.mapping.service.DDMStructureServiceUtil`、および`com.liferay.dynamic.data.mapping.service.DDMStructureServiceWrapper`クラスから削除されました。

- `addStructure`（パラメーターは`long userId`、`long groupId`、`long classNameId`、`Map<Locale, String> nameMap`、`Map<Locale, String> descriptionMap`、`com.liferay.dynamic.data.mapping.model.DDMForm ddmForm`、`com.liferay.dynamic.data.mapping.model.DDMFormLayout ddmFormLayout`、`String storageType`、`com.liferay.portal.kernel.service.ServiceContext serviceContext`）

- `addStructure`（パラメーターは`long userId`、`long groupId`、`long classNameId`、`Map<Locale, String> nameMap`、`Map<Locale, String> descriptionMap`、`String xsd`、`com.liferay.portal.kernel.service.ServiceContext serviceContext`）

- `addStructure`（パラメーターは`long userId`、`long groupId`、`String parentStructureKey`、`long classNameId`、`String structureKey`、`Map<Locale, String> nameMap`、`Map<Locale, String> descriptionMap`、`String xsd`、`String storageType`、`int type`、`com.liferay.portal.kernel.service.ServiceContext serviceContext`)

- `addStructure`（パラメーターは`long groupId`、`long parentStructureId`、`long classNameId`、`String structureKey`、`Map<Locale, String> nameMap`、`Map<Locale, String> descriptionMap`、`String xsd`、`String storageType`、`int type`、`com.liferay.portal.kernel.service.ServiceContext serviceContext`）

- `addStructure`（パラメーターは`long userId`、`long groupId`、`String parentStructureKey`、`long classNameId`、`String structureKey`、`Map<Locale, String> nameMap`、`Map<Locale, String> descriptionMap`、`com.liferay.dynamic.data.mapping.model.DDMForm ddmForm`、`com.liferay.dynamic.data.mapping.model.DDMFormLayout ddmFormLayout`、`String storageType`、`int type`、`com.liferay.portal.kernel.service.ServiceContext serviceContext`）

- `updateStructure`（パラメーターは`long groupId`、`long parentStructureId`、`long classNameId`、`String structureKey`、`Map<Locale, String> nameMap`、`Map<Locale, String> descriptionMap`、`String definition`、`com.liferay.portal.kernel.service.ServiceContext serviceContext`）

- `updateStructure`（パラメーターは`long structureId`、`long parentStructureId`、`Map<Locale, String> nameMap`、`Map<Locale, String> descriptionMap`、`String definition`、`com.liferay.portal.kernel.service.ServiceContext serviceContext`）

#### 影響を受ける人

これは、削除されたメソッドを使用していたすべてのユーザーに影響します。

#### コードの更新方法

削除されたメソッドを、残りの`addStructure`メソッドと`updateStructure`メソッドのいずれかに置き換えます。

#### 変更が行われた理由

これらのメソッドは、Liferay Portal 7.0で廃止されました。

---------------------------------------

### 動的データマッピング永続性クラスのメソッドを削除

- **日付：** 2020年7月14日
- **JIRAチケット：** [LPS-91760](https://issues.liferay.com/browse/LPS-91760)

#### 変更点

メソッド`fetchByPrimaryKeys`および`getBadColumnNames`が次のクラスから削除されました。

- `com.liferay.dynamic.data.mapping.service.persistence.DDMContentPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMDataProviderInstancePersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMFormInstancePersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMFormInstanceRecordPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMFormInstanceVersionPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMStorageLinkPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMStructureLayoutPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMStructurePersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMStructureVersionPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMTemplatePersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMDataProviderInstanceLinkPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMFormInstanceRecordVersionPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMStructureLinkPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMTemplateLinkPersistence`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMTemplateVersionPersistence`

#### 影響を受ける人

これは、削除されたメソッドを使用していたすべてのユーザーに影響します。

#### コードの更新方法

削除されたメソッドを、基本クラス`com.liferay.portal.kernel.service.persistence.impl.BasePersistenceImpl`で提供されている対応するメソッドに置き換えます。

#### 変更が行われた理由

基本クラス`com.liferay.portal.kernel.service.persistence.impl.BasePersistenceImpl`で提供されるデフォルトの実装があるため、`fetchByPrimaryKeys`のカスタム実装は必要ありません。

`getBadColumnNames`は、インターフェイス（`com.liferay.dynamic.data.mapping.service.persistence.DDMContentPersistence`など）から自動的に削除され、クラスがService Builderによって生成されたときに実装クラス（`com.liferay.dynamic.data.mapping.service.persistence.impl.DDMContentPersistenceImpl`など）に保持されました。  

---------------------------------------

### 動的データマッピングユーティリティクラスのメソッドを削除

- **日付：** 2020年7月14日
- **JIRAチケット：** [LPS-91760](https://issues.liferay.com/browse/LPS-91760)

#### 変更点

メソッド`getBadColumnNames`が次のクラスから削除されました。

- `com.liferay.dynamic.data.mapping.service.persistence.DDMContentUtil`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMDataProviderInstanceUtil`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMFormInstanceRecordUtil`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMFormInstanceUtil`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMFormInstanceVersionUtil`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMStorageLinkUtil`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMStructureLayoutUtil`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMStructureUtil`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMStructureVersionUtil`
- `com.liferay.dynamic.data.mapping.service.persistence.DDMTemplateUtil`

#### 影響を受ける人

これは、削除されたメソッドを使用していたすべてのユーザーに影響します。

#### コードの更新方法

削除されたメソッドを、基本クラス`com.liferay.portal.kernel.service.persistence.impl.BasePersistenceImpl`で提供されている対応するメソッドに置き換えます。

#### 変更が行われた理由

`getBadColumnNames`は、永続性ユーティリティ（`com.liferay.dynamic.data.mapping.service.persistence.DDMContentUtil`など）から自動的に削除され、クラスがService Builderによって生成されたときに永続性の実装（`com.liferay.dynamic.data.mapping.service.persistence.impl.DDMContentPersistenceImpl`など）に保持されました。  

---------------------------------------

### module.framework.properties.felix.fileinstall.\*ポータルプロパティの名前をmodule.framework.properties.file.install.\*に変更

- **日付：** 2020年8月8日
- **JIRAチケット：** [LPS-115016](https://issues.liferay.com/browse/LPS-115016)

#### 変更点

`module.framework.properties.felix.fileinstall.`で始まるポータルプロパティの名前が `module.framework.properties.file.install.`で始まるように変更されました。

#### 影響を受ける人

これは、`module.framework.properties.felix.fileinstall.`で始まるポータルプロパティを持っているすべてのユーザーに影響します。

#### コードの更新方法

`module.framework.properties.felix.fileinstall.`で始まるポータルプロパティの名前を`module.framework.properties.file.install.`で始まる名前に変更します。

#### 変更が行われた理由

この変更は、Apache Felix Fileinstallのインライン化を反映しています。 Liferayがこの機能を管理および維持するようになったため、プロパティの名前が適切に変更されました。

---------------------------------------

### buffered.increment.enabledポータルプロパティの置き換え

- **日付：** 2020年10月21日
- **JIRAチケット：** [LPS-122159](https://issues.liferay.com/browse/LPS-122159)

#### 変更点

`buffered.increment.enabled`ポータルプロパティを使用したビューカウント管理の有効化と無効化は、`view.count.enabled`ポータルプロパティを使用するように置き換えられました。

ビューカウントのグローバルな有効化と無効化が、`view.count.enabled`ポータルプロパティを使用して実行されるようになりました。

たとえば、特定のエンティティのビューカウントを無効にするには、`view.count.enabled[SomeEntity]=false`を設定することで可能になりました。 

#### 影響を受ける人

これは、`buffered.increment.enabled=false`ポータルプロパティ設定を持っているすべてのユーザーに影響します。

これは、`buffered.increment.enabled[SomeEntity]=false`ポータルプロパティ設定を使用して、一部のエンティティ（`SomeEntity`など）のビューカウントを無効にしたすべてのユーザーに影響します。 

#### コードの更新方法

`buffered.increment.enabled=false`を`view.count.enabled=false`に置き換えます。

`buffered.increment.enabled[SomeEntity]=false`を`view.count.enabled[SomeEntity]=false`に置き換えます。ここで、`SomeEntity`は、ビューカウントを無効にするエンティティです。

#### 変更が行われた理由

これにより、ビューカウント動作の管理が容易になります。

---------------------------------------

### module.framework.properties.file.install.optionalImportRefreshScopeポータルプロパティの削除

- **日付：** 2021年2月3日
- **JIRAチケット：** [LPS-122008](https://issues.liferay.com/browse/LPS-122008)

#### 変更点

`module.framework.properties.file.install.optionalImportRefreshScope`ポータルプロパティが削除されました。 ファイルのインストールでは、更新が必要なオプションのパッケージを含むバンドルをスキャンするときに、常に管理対象バンドルのみがチェックされるようになりました。

#### 影響を受ける人

これは、`module.framework.properties.file.install.optionalImportRefreshScope`ポータルプロパティを指定しているすべてのユーザーに影響します。

#### コードの更新方法

`module.framework.properties.file.install.optionalImportRefreshScope`プロパティを削除します。 他の動作を使用するようにファイルのインストールを構成することはできません。

#### 変更が行われた理由

代替動作が望まれるケースはほとんどありませんでした。 ファイルのインストールはバンドルをLiferayにインストールする主な方法であるため、すべてのバンドルはデフォルトでLiferayによって管理されます。 この機能をサポートする分岐ロジックを削除すると、コードの保守性と可読性が向上します。

---------------------------------------

### .cfgファイルに.cfg形式を使用

- **日付：** 2021年2月21日
- **JIRAチケット：** [LPS-128031](https://issues.liferay.com/browse/LPS-128031)

#### 変更点

この変更の前は、`.cfg`ファイルは`.cfg`または`.config`形式を使用できました。 現在、`.cfg`構成ファイルは [ここ](https://sling.apache.org/documentation/bundles/configuration-installer-factory.html#property-files-cfg) で定義されている`.cfg`形式を使用する必要があります。 

#### 影響を受ける人

これは、`.config`形式を使用している`.cfg`ファイルを持っているすべてのユーザーに影響します。

#### コードを更新するにはどうすればよいですか？

`.cfg`ファイルの名前を`.config`に変更し、`.config`形式を使用していることを確認するか、`.cfg`ファイルを`.cfg`形式を使用するように変更します（上記のリンクを参照）。

#### なぜこの変更が行われたのですか？

Apacheのファイルインストール実装により、`.cfg`ファイルで`.config`形式を使用できるようになりました。 独自のファイルインストール実装を使用するように切り替えたとき、保守性を容易にするために、より厳密なフォーマット処理を行うことにしました。

---------------------------------------