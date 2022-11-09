# 7.4 旧バージョンと非互換の変更

このドキュメントは、サードパーティのLiferay開発者またはユーザーとの既存の機能、API、または契約に違反する変更の時系列リストを示しています。 私たちはこれらの混乱を最小限にするために最善を尽くしていますが、時には避けられないこともあります。

このファイルに記載されている変更の種類の一部を次に示します。

* 削除または置換される機能
* 旧バージョンと非互換の変更：パブリックJavaまたはJavaScript APIの変更
* テンプレートで利用可能なコンテキスト変数の変更
* Liferayテーマおよびポートレットで利用可能なCSSクラスの変更
* 設定の変更：`portal.properties`、`system.properties`などの設定ファイルの変更
* 実行要件：Javaバージョン、Java EEバージョン、ブラウザーバージョンなど
* 非推奨またはサポート終了：たとえば、次のバージョンで特定の機能またはAPIが停止されると警告している

## liferay-ui:flashタグを削除
- **日付：** 2020年10月13日
- **JIRAチケット：** [LPS-121732](https://issues.liferay.com/browse/LPS-121732)

### 変更点

タグ`liferay-ui:flash`は削除され、使用できなくなりました。

### 影響を受ける人

これは、`liferay-ui:flash`タグを使用しているすべての開発に影響します。

### コードの更新方法

それでもAdobe Flashコンテンツをページに埋め込む必要がある場合は、`SWFObject`などの標準メカニズムを使用して独自のコードを記述してください。

### 変更が行われた理由

この変更は、2020年12月31日に [AdobeがFlashのサポートを終了](https://www.adobe.com/products/flashplayer/end-of-life.html) し、今後のバージョンのブラウザでFlashのサポートが削除されることに対応したものです。

---------------------------------------

## /portal/flashパスの削除
- **日付：** 2020年10月13日
- **JIRAチケット：** [LPS-121733](https://issues.liferay.com/browse/LPS-121733)

### 変更点

以前は、動画URLをパラメーターとして`/portal/flash`パブリックパスに渡すことで、Adobe Flash動画を再生できました。 `/portal/flash path`パスは削除されました。

さらに、プロパティとアクセサーは`ThemeDisplay`から削除され、使用できなくなりました。

### 影響を受ける人

これは、`/c/portal/flash`パスを直接使用してAdobe Flashコンテンツを含むページを表示している場合に影響します。

### コードの更新方法

コードを直接更新することはできません。 ただし、古い動作をシミュレートするカスタムページを作成できます。 このページでは、URLから動画パラメータを解析し、Adobe Flash再生の一般的な手段を使用して動画をインスタンス化できます。

### 変更が行われた理由

この変更は、2020年12月31日に [AdobeがFlashのサポートを終了](https://www.adobe.com/products/flashplayer/end-of-life.html) し、今後のバージョンのブラウザでFlashのサポートが削除されることに対応したものです。

---------------------------------------

## swfobject AUIモジュールの削除
- **日付：** 2020年10月13日
- **JIRAチケット：** [LPS-121736](https://issues.liferay.com/browse/LPS-121736)

### 変更点

AUIモジュールの`swfobject`は削除されました。 これは、Adobe Flashコンテンツを埋め込むために一般的に使用されるSWFObjectライブラリをロードする方法を提供していました。

### 影響を受ける人

これは、AUI `swfobject`モジュールを介してSWFObjectライブラリをグローバルに使用できるようにしている場合に影響します。

### コードの更新方法

それでもAdobe Flashコンテンツを埋め込む必要がある場合は、他の利用可能なメカニズムを使用して、SWFObjectライブラリをアプリケーションに直接挿入できます。

### 変更が行われた理由

この変更は、2020年12月31日に [AdobeがFlashのサポートを終了](https://www.adobe.com/products/flashplayer/end-of-life.html) し、今後のバージョンのブラウザでFlashのサポートが削除されることに対応したものです。

---------------------------------------

## AssetEntries_AssetCategoriesテーブルと対応するコードを削除
- **日付：** 2020年10月16日
- **JIRAチケット：** [LPS-89065](https://issues.liferay.com/browse/LPS-89065)

### 変更点

`AssetEntries_AssetCategories`マッピングテーブルとそれに対応するコードが削除されました。

### 影響を受ける人

これは、`AssetEntryLocalService`と`AssetCategoryLocalService`を使用してアセットエントリーとアセットカテゴリー間の関係を操作している場合に影響します。

### コードの更新方法

`AssetEntryAssetCategoryRelLocalService`の新しいメソッドを使用してください。 メソッドのシグネチャは、`AssetEntryAssetCategoryRelLocalService`の場合と同じであることに注意してください。

### 変更が行われた理由

この変更により、不要なテーブルと対応するコードが削除されます。

これは、7.2の旧バージョンと非互換の変更「 [Liferay AssetEntries_AssetCategoriesは使用されなくなりました](https://learn.liferay.com/dxp/latest/ja/liferay-internals/reference/7-2-breaking-changes.html#liferay-assetentries-assetcategories-is-no-longer-used) 」に対するフォローアップ手順です。この変更では、テーブルが`AssetEntryAssetCategoryRel`テーブルに置き換えられ、`AssetEntryLocalService`および`AssetCategoryLocalService`の対応するインターフェイスが`AssetEntryAssetCategoryRelLocalService`に移動されました。

---------------------------------------

## AntivirusScannerのサポートとClamdの統合をリファクタリング
- **日付：** 2020年10月21日
- **JIRAチケット：** [LPS-122280](https://issues.liferay.com/browse/LPS-122280)

### 変更点

ポータルのClamd統合実装は、Clamdリモートサービスを使用するOSGiサービスに置き換えられました。 AntivirusScanner OSGi統合は、AntivirusScanner実装選択ポータルプロパティおよびAntivirusScanner実装フック登録ポータルプロパティに置き換えられました。

### 影響を受ける人

これは、ポータルのClamd統合実装を使用している場合、またはフックを介して独自のAntivirusScanner実装を提供している場合に影響します。

### コードの更新方法

新しいClamd統合とAntivirusScannerサポートを有効にします。 [アップロードされたファイルのウイルス対策スキャンを有効にする](https://learn.liferay.com/dxp/latest/ja/system-administration/file-storage/enabling-antivirus-scanning-for-uploaded-files.html) を参照してください。

フックを介して独自のAntivirusScanner実装を提供している場合は、それをゼロより大きいサービスランキングのOSGiサービスに変換します。 ClamdリモートサービスAntivirusScanner実装サービスのランキングはゼロです。

### 変更が行われた理由

この変更により、コンテナ環境がより適切にサポートされ、APIが統合されてOSGi統合が実行されます。

---------------------------------------

## エンティティ表示ページ登録追跡ロジックを変更
- **日付：** 2020年10月27日
- **JIRAチケット：** [LPS-122275](https://issues.liferay.com/browse/LPS-122275)

### 変更点

表示ページとのエンティティの関連付けの保持（追跡）が変更されました。 Liferay DXP/Portalバージョン7.1から7.3では、デフォルト表示ページとのエンティティの関連付けのみが保持されていました。表示ページの関連付けがないエンティティ、および特定のデフォルト以外の表示ページとのエンティティの関連付けは保持されていませんでした。 この変更により、動作が切り替わります。

新しい動作は次のとおりです。

- デフォルト表示ページにリンクされているエンティティは保持されません。
- 表示ページがないエンティティは保持されます。
- デフォルト以外の特定の表示ページを持つエンティティは保持されます。

### 影響を受ける人

これは、表示ページを作成できるカスタムエンティティがある場合に影響します。

### コードの更新方法

表示ページを持つカスタムエンティティがある場合、 `BaseUpgradeAssetDisplayPageEntry` アップグレード処理をアプリケーションに追加して、表示ページロジックを入れ替えましょう。 プロセスは、テーブル、プライマリーキー列名、およびクラス名を受け取ります。

### 変更が行われた理由

この変更により、表示ページのロジックが全体的な表示ページの概念とより一致するようになります。

---------------------------------------

## 廃止予定および未使用のJSPタグを削除
- **日付：** 2020年11月24日
- **JIRAチケット：** [LPS-112476](https://issues.liferay.com/browse/LPS-112476)

### 変更点

廃止予定で未使用の一連のJSPタグが削除され、使用できなくなりました。 以下のタグが含まれています。

- `clay:table`
- `liferay-ui:alert`
- `liferay-ui:input-scheduler`
- `liferay-ui:organization-search-container-results`
- `liferay-ui:organization-search-form`
- `liferay-ui:ratings`
- `liferay-ui:search-speed`
- `liferay-ui:table-iterator`
- `liferay-ui:toggle-area`
- `liferay-ui:toggle`
- `liferay-ui:user-search-container-results`
- `liferay-ui:user-search-form`

### 影響を受ける人

これは、削除されたタグのいずれかを使用している場合に影響します。

### コードの更新方法

代替タグのある削除済みタグについては、7.3 [`liferay-ui.tld`](https://github.com/liferay/liferay-portal/blob/7.3.x/util-taglib/src/META-INF/liferay-ui.tld) を参照してください。 ただし、タグの多くには直接の置き換えはありません。 直接の置き換えがないタグを使用する必要がある場合は、古い実装をコピーして、プロジェクトから直接提供できます。

### 変更が行われた理由

これらのタグは、デフォルトのJSPコンポーネントの提供を明確にし、より小さくてもより高品質のコンポーネントセットの提供に注力するために削除されました。

---------------------------------------

## .container-fluid-1280 CSSクラスを置き換え
- **日付：** 2020年11月24日
- **JIRAチケット：** [LPS-123894](https://issues.liferay.com/browse/LPS-123894)

### 変更点

`.container-fluid-1280` CSSクラスが`.container-fluid.container-fluid-max-xl`に置き換えられました。 `.container-fluid-1280`のスタイルを持っていた互換性レイヤーも削除されました。

### 影響を受ける人

これは、コンテナ要素に`.container-fluid-1280` CSSクラスがある場合に影響します。

### コードの更新方法

`.container-fluid-1280`の代わりに、Clay `.container-fluid.container-fluid-max-xl`から更新されたCSSクラスを使用します。 または、ClayLayout [コンポーネント](https://clayui.com/docs/components/layout.html) と [TagLibs](https://clayui.com/docs/get-started/using-clay-in-jsps.html#clay-sidebar) を使用します。

### 変更が行われた理由

この変更により、廃止予定のレガシーコードが削除され、コードの一貫性とパフォーマンスが向上します。

---------------------------------------

## CSSおよびJavaScriptリソースのランタイム縮小化をデフォルトで無効化
- **日付：** 2020年11月27日
- **JIRAチケット：** [LPS-123550](https://issues.liferay.com/browse/LPS-123550)

### 変更点

`minifier.enable`ポータルプロパティがデフォルトで`false`になりました。 ランタイム時にCSSおよびJSリソースの縮小化を実行する代わりに、ビルド時に事前に縮小されたリソースを用意しています。 ページスタイルやロジックにユーザーに見える変更はありません。

### 影響を受ける人

これは、実装がランタイムミニファイア（通常はGoogle Closure Compiler）に依存している場合に影響します。

### コードの更新方法

以前のタンタイム時の縮小動作を維持する場合は、`minifier.enable`ポータルプロパティを`true`に設定します。

### 変更が行われた理由

フロントエンドのリソースの縮小化をランタイム時からビルド時に移動すると、サーバーの負荷が軽減され、フロントエンドエコシステム内で利用可能な最新の縮小化テクノロジーの使用が容易になります。

---------------------------------------

## SoyPortletクラスを削除
- **日付：** 2020年12月9日
- **JIRAチケット：** [LPS-122955](https://issues.liferay.com/browse/LPS-122955)

### 変更点

`SoyPortlet`クラスは削除されました。 このクラスは、ビューがClosure Templates（Soy）によってサポートされているポートレットを実装するために使用されていました。

### 影響を受ける人

これは、ポートレット開発のベースとして`SoyPortlet`を使用している場合に影響します。

### コードの更新方法

JSPを使用する`MVCPortlet`などの確立されたアーキテクチャ、または選択した特定のフロントエンドフレームワークを使用して、Soyポートレットを書き直すことを強くお勧めします。

### 変更が行われた理由

これは、フロントエンドの技術提供を簡素化し、市場で需要の高い実績のあるテクノロジーにより焦点を当てる方法として行われました。

利用可能なさまざまなフロントエンドオプションの詳細な調査と分析は、 [The State of Frontend Infrastructure](https://liferay.dev/blogs/-/blogs/the-state-of-frontend-infrastructure) で確認できます。ここでは、Soyから移行する理由についても説明しています。

> Liferayは、Soyが「聖杯」であると信じて数年かけて投資してきました。 クロージャテンプレートをコンパイルする機能により、JSPに匹敵するパフォーマンスが提供され、他のJavaScriptフレームワークの再利用可能なコンポーネントに対応できると信じてきました。 Soyはいくつかの目標を達成することができましたが、当社が望んでいたパフォーマンスを得ることはできませんでしたし、何よりもこの技術を使っているのは当社ぐらいだと感じていました。

---------------------------------------

## サーバー側のClosure Templates（Soy）のサポートを削除
- **日付：** 2020年12月14日
- **JIRAチケット：** [LPS-122956](https://issues.liferay.com/browse/LPS-122956)

### 変更点

次のモジュールと、Soyがサーバー側をレンダリングできるようにエクスポートしたクラスは削除されました。
- `portal-template-soy-api`
- `portal-template-soy-impl`
- `portal-template-soy-context-contributor`

移行を簡素化するために、次のモジュールは廃止予定ですが、以前のSoyコンポーネントのクライアント側の初期化を行う目的でのみ使用できます。
- `portal-template-soy-renderer-api`
- `portal-template-soy-renderer-impl`

### 影響を受ける人

これは、`SoyContext`、`SoyHTMLData`などの削除されたクラスを使用していて、`lang.type`属性の値として`LANG_TYPE_SOY`を使用して`TemplateContextContributor`を宣言している場合に影響します。

これは、Soy `ComponentRenderer`を使用してSoyコンポーネントを初期化している場合に影響します。

### コードの更新方法

削除されたSoyのサポートに代わるものはありません。 最初のシナリオに当てはまる場合は、サポートされている別のテンプレート言語に切り替えて、テンプレートとコンポーネントを書き換えてください。

`ComponentRenderer`を使用している場合、唯一の違いは、コンポーネントがサーバー側でマークアップを生成しなくなることです。 これが重要な場合は、一時的な回避策が追加されています。 サーバー側でレンダリングするマークアップのバージョンを手動で生成し、`context`パラメーターの`__placeholder__`プロパティとしてマークアップを渡すことができます。 `ComponentRenderer`は廃止予定であり、最終的には削除されることを忘れないでください。そのため、別のテクノロジーを使用してコンポーネントを書き直すことをお勧めします。

### 変更が行われた理由

これは、フロントエンドの技術提供を簡素化し、市場で需要の高い実績のあるテクノロジーにより焦点を当てる方法として行われます。

利用可能なさまざまなフロントエンドオプションの詳細な調査と分析は、 [The State of Frontend Infrastructure](https://liferay.dev/blogs/-/blogs/the-state-of-frontend-infrastructure) で確認できます。ここでは、Soyから移行する理由についても説明しています。

> Liferayは、Soyが「聖杯」であると信じて数年かけて投資してきました。 クロージャテンプレートをコンパイルする機能により、JSPに匹敵するパフォーマンスが提供され、他のJavaScriptフレームワークの再利用可能なコンポーネントに対応できると信じてきました。 Soyはいくつかの目標を達成することができましたが、当社が望んでいたパフォーマンスを得ることはできませんでしたし、何よりもこの技術を使っているのは当社ぐらいだと感じていました。

---------------------------------------

## com.liferay.portal.kernel.model.PortletPreferencesメソッド、getPreferencesおよびsetPreferencesを削除
- **日付：** 2020年12月20日
- **JIRAチケット：** [LPS-122562](https://issues.liferay.com/browse/LPS-122562)

### 変更点

ポートレットのルック&フィールは、XMLとして保存および取得されなくなりました。 これらは、プリファレンス名とプリファレンス値用に別々の列を持つ`PortletPreferenceValue`というテーブルに格納されるようになりました。

### 影響を受ける人

これは、`com.liferay.portal.kernel.model.PortletPreferences`メソッド、`getPreferences`または`setPreferences`を介してポートレットのルック&フィールを直接取得または設定している場合に影響します。

### コードの更新方法

`PortletPreferencesLocalService`を介して`javax.portlet.PortletPreferences`インスタンスにアクセスします。 `javax.portlet.PortletPreferences` APIを使用してプリファレンスを取得および設定します。

### 変更が行われた理由

この変更により、アップグレードが簡素化され、ストレージ要件が軽減され、`like`演算子を使用せずに設定のクエリがサポートされます。

---------------------------------------

## CSS互換性レイヤーを削除
- **日付：** 2021年1月02日
- **JIRAチケット：** [LPS-123359](https://issues.liferay.com/browse/LPS-123359)

### 変更点

Boostrap 3マークアップのサポートは削除され、使用できなくなりました。

### 影響を受ける人

これは、Boostrap 3マークアップを使用している場合、またはBoostrap 4マークアップに正しく移行していない場合に影響します。

### コードの更新方法

Clayマークアップを使用している場合は、最新の [Clayコンポーネント](https://clayui.com/docs/components/index.html) バージョンに従って更新できます。 マークアップがBoostrap 3に基づいている場合は、 [Bootstrap移行ガイドライン](https://getbootstrap.com/docs/4.4/migration/) に従ってBoostrap 4マークアップを使用してマークアップを更新できます。

### 変更が行われた理由

構成可能なCSS互換性レイヤーによってLiferay 7.0から7.1への移行が簡素化されていましたが、レイヤーを削除すると、新しいスタイルとの競合が解決され、一般的なCSSの重みが向上します。

---------------------------------------

## Log4j XML定義ファイルからspi.idプロパティを削除
- **日付：** 2021年1月19日
- **JIRAのチケットです。** [LPS-125998](https://issues.liferay.com/browse/LPS-125998)

### 何が変わったのでしょうか？

Log4j XML 定義ファイル内の `spi.id` プロパティは削除されました。

### 誰が影響を受けるのか？

これは、そのカスタム Log4j XML 定義ファイルで `@spi.id@` を使用している場合に影響します。

### どのようにコードを更新すればよいですか？

`@spi.id@` を Log4j XML 定義ファイルから削除してください。

### なぜ、このような変更を行ったのでしょうか？

SPIは、 [LPS-110758](https://issues.liferay.com/browse/LPS-110758) によって削除されました。

---------------------------------------

## frontend-taglib-clayタグから非推奨の属性を削除しました。
- **日付：** 2021-Jan-26
- **JIRAのチケットです。** [LPS-125256](https://issues.liferay.com/browse/LPS-125256)

### 何が変わったのでしょうか？

非推奨の属性は `frontend-taglib-clay` TagLib から削除されました。

### 誰が影響を受けるのか？

`<clay:*>` タグで非推奨の属性を使用している場合に影響があります。

### なぜ、このような変更を行ったのでしょうか？

`frontend-taglib-clay` モジュールは [`Clay v3`](https://github.com/liferay/clay) のコンポーネントを使用しており、削除された属性はサポートされていません。

---------------------------------------

## HTMLタグのBoolean属性の取り扱いを変更しました。
- **日付：** 2021-Feb-18
- **JIRAのチケットです。** [LPS-127832](https://issues.liferay.com/browse/LPS-127832)

### 何が変わったのか？

Boolean HTML属性は、 `trueの値が渡された場合のみレンダリングされます`。 このような属性の値は、その標準的な名前になります。

以前は、 `disabled` 属性に対して `false` のような値を指定すると、 `disabled="false"`として DOM にレンダリングされていましたが、現在はその属性が省略されています。 同様に、 `true` value for a `disabled` attribute は、以前は `disabled="true"`として DOM にレンダリングされていましたが、現在は `disabled="disabled"`としてレンダリングされています。

### 誰が影響を受けるのか？

これは、タグライブラリに次のようなブール値属性を渡している場合に影響します。

- `"allowfullscreen"`
- `"allowpaymentrequest"`
- `"async"`
- `"autofocus"`
- `"autoplay"`
- `"checked"`
- `"controls"`
- `"default"`
- `"disabled"`
- `"formnovalidate"`
- `"hidden"`
- `"ismap"`
- `"itemscope"`
- `"loop"`
- `"multiple"`
- `"muted"`
- `"nomodule"`
- `"novalidate"`
- `"open"`
- `"playsinline"`
- `"readonly"`
- `"required"`
- `"reversed"`
- `"selected"`
- `"truespeed"`

### どのようにコードを更新すればよいですか？

DOM に表示させたい boolean 属性には、必ず `true` の値を渡してください。 `true` の値を対象とする CSS セレクタ（例： `[disabled="true"]`）を、属性の存在（例： `[disabled]`）またはその正規名（例： `[disabled="disabled"]`）を対象とするように更新しました。

### なぜ、このような変更を行ったのでしょうか？

この変更は、 [HTML規格](https://html.spec.whatwg.org/#boolean-attribute) に準拠するためで、「要素に boolean 属性がある場合は真の値を表し、ない場合は偽の値を表します。属性が存在する場合、その値は空の文字列か、属性の正規名とASCII大文字小文字を区別せずに一致する値でなければなりません。」となっています。

---------------------------------------

## com.liferay.portal.kernel.model.PortalPreferences メソッド getPreferences と setPreferences を削除しました。

- **日付：** 2020-3-31
- **JIRAのチケットです。** [LPS-124338](https://issues.liferay.com/browse/LPS-124338)

### 何が変わったのでしょうか？

`PortalPreferences` プリファレンスは、 `PortalPreferenceValue` テーブルに格納されるようになりました。

### 誰が影響を受けるのか？

`com.liferay.portal.kernel.model.PortalPreferences` メソッド `getPreferences` または `setPreferences`で直接ポータルプリファレンスを取得または設定している場合に影響を及ぼします。

### どのようにコードを更新すればよいですか？

`javax.portlet.PortalPreferences` インスタンスに、 `PortalPreferencesLocalService`を介してアクセスします。 `javax.portlet.PortalPreferences` API を使用して、プリファレンスを取得および設定します。

### なぜ、このような変更を行ったのでしょうか？

この変更により、アップグレードの簡素化、ストレージ要件の削減、および `like` 演算子を使用しないプリファレンスのクエリーがサポートされます。

---------------------------------------

## item-selector-taglib が coverImage 関連イベントを発生させないようにした。

- **日付：** 2021-Apr-15
- **JIRAのチケットです。** [LPS-130359](https://issues.liferay.com/browse/LPS-130359)

### 何が変わったのか？

`ImageSelector` JavaScript モジュールは、 `coverImageDeleted`, `coverImageSelected`, `coverImageUploaded` イベントを `Liferay.fire()` API を使用して発生しなくなりまし た。 これらのイベントは、 `item-selector-taglib` モジュールと `blogs-web` モジュール間のコミュニケーションを円滑にするものでした。 ここで `Liferay.State` は `imageSelectorCoverImageAtom`を使って通信の同期をとります。

### 誰が影響を受けるのか？

`Liferay.on()` または同様の関数で削除されたイベントをリッスンしている場合に影響します。

### どのようにコードを更新すればよいですか？

実際には、これらの2つのモジュールの間の相互作用を観察するべきではありませんが、もし必要なら、 `Liferay.State.subscribe()` API を使って `imageSelectorCoverImageAtom` をサブスクライブすることができます。

### なぜ、このような変更を行ったのでしょうか？

`Liferay.fire()` と `Liferay.on()` は、グローバルに見えるイベントを共有チャンネルで公開します。 `Liferay.State` APIは、このように離れた場所で調整したいモジュールに適しており、型安全な方法でそれを行います。

---------------------------------------

## OAuth 2.0 Token InstrospectionのFeature Identifierを変更しました。

- **日付：** 2021-May-04
- **JIRAのチケットです。** [LPS-131573](https://issues.liferay.com/browse/LPS-131573)

### 何が変わったのか？

OAuth 2.0 Token Instrospectionの機能識別子が、 `token_introspection` から `token.introspection`に変更されました。

### 誰が影響を受けるのか？

これは、Token Introspection機能の識別子を使用している場合に影響します。 ここでは、いくつかの使用例を紹介します。

- Token Introspection機能の識別子を有効にして、OAuth 2.0アプリケーションをプログラムで追加する。
- OAuth 2.0アプリケーションでToken Introspection機能識別子が有効かどうかをチェックします。

### どのようにコードを更新すればよいですか？

トークンを `token_introspection` から `token.introspection`に変更します。

### なぜ、このような変更を行ったのでしょうか？

この変更は、OAuth 2.0の定数をすべて統一するために行われました。 機能識別子の単語の区切りには、ドットを使用することを推奨します。

---------------------------------------

## JournalArticleのContentフィールドを削除しました。

- **日付：** 2021-May-21
- **JIRAのチケットです。** [LPS-129058](https://issues.liferay.com/browse/LPS-129058)

### 何が変わったのか？

`JournalArticle` のコンテンツは、Dynamic Data Mapping (DDM) Field サービスによって保存されるようになりました。

### 誰が影響を受けるのか？

これは、 `JournalArticle` コンテンツフィールドを直接設定する場合に影響します。

### どのようにコードを更新すればよいですか？

コンテンツ・フィールドを直接設定するのではなく、 `JournalArticleLocalService`'の更新メソッドを使用します。

### なぜ、このような変更を行ったのでしょうか？

この変更により、コンテンツの取得や解析を行わずに、データベース内のファイル、ページ、WebコンテンツのDDMフィールドを容易に参照できるようになりました。

---------------------------------------

## com.liferay.portal.kernel.util.StringBundler を com.liferay.petra.string.StringBundler で置き換えた。

- **日付：** 2021-Jun-25
- **JIRAのチケットです。** [LPS-133200](https://issues.liferay.com/browse/LPS-133200)

### 何が変わったのか？

`com.liferay.portal.kernel.util.StringBundler` クラスは、非推奨となりました。 `com.liferay.petra.string.StringBundler` クラスがこれに取って代わりました。

`com.liferay.petra.string.StringBundler` の代わりに `com.liferay.portal.kernel.util.StringBundler`を返すようになったいくつかのメソッドを紹介します。

- `com.liferay.frontend.taglib.dynamic.section.BaseJSPDynamicSection.java#modify`
- `com.liferay.frontend.taglib.dynamic.section.DynamicSection#modify`
- `com.liferay.portal.kernel.io.unsync.UnsyncStringWriter#getStringBundler`
- `com.liferay.portal.kernel.layoutconfiguration.util.RuntimePage#getProcessedTemplate`
- `com.liferay.portal.kernel.layoutconfiguration.util.RuntimePageUtil#getProcessedTemplate`
- `com.liferay.portal.kernel.servlet.BufferCacheServletResponse#getStringBundler`
- `com.liferay.portal.kernel.servlet.taglib.BodyContentWrapper.java#getStringBundler`
- `com.liferay.portal.kernel.theme.PortletDisplay#getContent`
- `com.liferay.portal.kernel.util.StringUtil#replaceToStringBundler`
- `com.liferay.portal.kernel.util.StringUtil#replaceWithStringBundler`
- `com.liferay.portal.layoutconfiguration.util.PortletRenderer#render`
- `com.liferay.portal.layoutconfiguration.util.PortletRenderer#renderAjax`
- `com.liferay.portal.layoutconfiguration.util.RuntimePageImpl#getProcessedTemplate`
- `com.liferay.taglib.BaseBodyTagSupport#getBodyContentAsStringBundler`
- `com.liferay.taglib.BodyContentWrapper#getStringBundler`
- `com.liferay.taglib.aui.NavBarTag#getResponsiveButtonsSB`

### 誰が影響を受けるのか？

これらのメソッドのいずれかを呼び出すと、影響があります。

### どのようにコードを更新すればよいですか？

インポート `com.liferay.petra.string.StringBundler` の代わりに `com.liferay.portal.kernel.util.StringBundler`.

### なぜ、このような変更を行ったのでしょうか？

`com.liferay.portal.kernel.util.StringBundler` クラスは、非推奨となりました。

---------------------------------------

## UserLocalService関連クラスのパブリックAPIを変更しました。

- **日付：** 2021-Jul-07
- **JIRAのチケットです。** [LPS-134096](https://issues.liferay.com/browse/LPS-134096)

### 何が変わったのか？

通常 `void` を返す多くのメソッドは、代わりに `boolean` 値を返すようになりました。 このリストには

- com.liferay.portal.kernel.service.UserLocalService#addDefaultGroups
- com.liferay.portal.kernel.service.UserLocalService#addDefaultRoles
- com.liferay.portal.kernel.service.UserLocalService#addDefaultUserGroups
- com.liferay.portal.kernel.service.UserLocalServiceUtil#addDefaultGroups
- com.liferay.portal.kernel.service.UserLocalServiceUtil#addDefaultRoles
- com.liferay.portal.kernel.service.UserLocalServiceUtil#addDefaultUserGroups
- com.liferay.portal.kernel.service.UserLocalServiceWrapper#addDefaultGroups
- com.liferay.portal.kernel.service.UserLocalServiceWrapper#addDefaultRoles
- com.liferay.portal.kernel.service.UserLocalServiceWrapper#addDefaultUserGroups
- com.liferay.portal.service.impl.UserLocalServiceImpl#addDefaultGroups
- com.liferay.portal.service.impl.UserLocalServiceImpl#addDefaultRoles
- com.liferay.portal.service.impl.UserLocalServiceImpl#addDefaultUserGroups

### 誰が影響を受けるのか？

これらのメソッドのいずれかを呼び出すすべての人

### どのようにコードを更新すればよいですか？

すぐに対応する必要はありませんが、戻り値の型が変更されていることに注意が必要です。

### なぜ、このような変更を行ったのでしょうか？

この変更は、指定されたユーザーにデフォルトのグループ、ロール、およびユーザーグループが追加されているかどうか、またはそのユーザーがすでにこれらの関連付けを持っているかどうかを確認するために行われたものです。

---------------------------------------

## CSSモジュールfrontend-css-webを削除しました。

- **日付：** 2021-Aug-02
- **JIRAのチケットです。** [LPS-127085](https://issues.liferay.com/browse/LPS-127085)

### 何が変わったのか？

`frontend-css-web` モジュールは削除され、その CSS ファイルはアップグレードされました。

### 誰が影響を受けるのか？

この変更は、以下のモジュールに影響します。

- `modules/apps/asset/asset-taglib/`
- `modules/apps/asset/asset-tags-navigation-web/`
- `modules/apps/captcha/captcha-taglib/`
- `modules/apps/comment/comment-web/`
- `modules/apps/commerce/commerce-product-content-web/`
- `modules/apps/document-library/document-library-web/`
- `modules/apps/dynamic-data-lists/dynamic-data-lists-web/`
- `modules/apps/dynamic-data-mapping/dynamic-data-mapping-form-web/`
- `modules/apps/dynamic-data-mapping/dynamic-data-mapping-web/`
- `modules/apps/flags/flags-taglib/`
- `modules/apps/frontend-css/frontend-css-web/`
- `modules/apps/frontend-editor/frontend-editor-ckeditor-web/`
- `modules/apps/frontend-js/frontend-js-aui-web/`
- `modules/apps/frontend-js/frontend-js-components-web/`
- `modules/apps/frontend-taglib/frontend-taglib/`
- `modules/apps/frontend-theme/frontend-theme-styled/`
- `modules/apps/item-selector/item-selector-taglib/`
- `modules/apps/knowledge-base/knowledge-base-web/`
- `modules/apps/mobile-device-rules/mobile-device-rules-web/`
- `modules/apps/polls/polls-web/`
- `modules/apps/portal-settings/portal-settings-authentication-cas-web/`
- `modules/apps/product-navigation/product-navigation-control-menu-web/`
- `modules/apps/site-navigation/site-navigation-directory-web/`
- `modules/apps/social/social-bookmarks-taglib/`
- `modules/apps/staging/staging-taglib/`
- `modules/apps/wiki/wiki-web/`
- `modules/dxp/apps/portal-search-tuning/portal-search-tuning-rankings-web/`
- `portal-kernel/`
- `portal-web/`

### どのようにコードを更新すればよいですか？

必要なコードの更新はありません。

### なぜ、このような変更を行ったのでしょうか？

この変更により、DXP/Portalから非推奨のレガシーコードが削除され、コードのパフォーマンスとコードの一貫性が改善されました。

---------------------------------------

## 一部の SanitizedServletResponse 静的メソッド、HHttpHeaders X_XSS_PROTECTION 定数、および http.header.secure.x.xss.protection ポータルプロパティを削除しました。

- **日付：** 2021-Aug-05
- **JIRAのチケットです。** [LPS-134188](https://issues.liferay.com/browse/LPS-134188)

### 何が変わったのか？

以下のメソッド、定数、ポータルプロパティが削除されました。

方法です。

- `com.liferay.portal.kernel.servlet.SanitizedServletResponse#disableXSSAuditor`
- `com.liferay.portal.kernel.servlet.SanitizedServletResponse#disableXSSAuditor`
- `com.liferay.portal.kernel.servlet.SanitizedServletResponse#disableXSSAuditorOnNextRequest`
- `com.liferay.portal.kernel.servlet.SanitizedServletResponse#disableXSSAuditorOnNextRequest`

定数です。

- `com.liferay.portal.kernel.servlet.HttpHeaders#X_XSS_PROTECTION`

ポータルのプロパティです。

- `http.header.secure.x.xss.protection`

### 誰が影響を受けるのか？

これは、これらのメソッドを呼び出したり、定数を使用したり、ポータルプロパティを使用した場合に影響します。

### どのようにコードを更新すればよいですか？

これらのメソッドを呼び出すコードや定数を使用するコードを削除してください。 X-Xss-Protectionヘッダーは、最近のブラウザでは効果がなく、誤ったセキュリティ感覚を与える可能性があります。

`http.header.secure.x.xss.protection` プロパティをポータルプロパティ拡張ファイルから削除します（例： `portal-ext.properties`）。

### なぜ、このような変更を行ったのでしょうか？

X-Xss-Protectionヘッダーは、最近のブラウザではサポートされなくなりました。 これらの静的メソッド、定数、ポータルプロパティは、X-Xss-Protectionヘッダーに関連しています。

---------------------------------------

## OpenIdConnectServiceHandler インターフェースを OpenIdConnectAuthenticationHandler に置き換える。

- **日付：** 2021-Aug-09
- **JIRAのチケットです。** [LPS-124898](https://issues.liferay.com/browse/LPS-124898)

### 何が変わったのか？

`OpenIdConnectServiceHandler` インターフェースが削除され、 `OpenIdConnectAuthenticationHandler` インターフェースに置き換わりました。

旧インターフェース。

```
portal.security.sso.openid.connect.OpenIdConnectServiceHandler
```

新しいインターフェース。

```
portal.security.sso.openid.connect.OpenIdConnectAuthenticationHandler
```

### 誰が影響を受けるのか？

`OpenIdConnectServiceHandler` インターフェースを実装または使用している場合、この影響はあります。

### どのようにコードを更新すればよいですか？

あなたのコードが `OpenIdConnectServiceHandler` インターフェースを呼び出している場合は、 `OpenIdConnectAuthenticationHandler` インターフェースを呼び出すように変更してください。 これには、DXP/Portal ユーザーのサインイン用に、 `UnsafeConsumer` を提供する必要があります。

`OpenIdConnectServiceHandler` インターフェースを実装している場合、 `OpenIdConnectAuthenticationHandler` インターフェースを実装し、提供されたリフレッシュトークンを使用してユーザーの OIDC アクセストークンをリフレッシュする方法を提供します。 この規定を設けない場合、最初のアクセストークンの有効期限が切れると、セッションは無効となります。

### なぜ、このような変更を行ったのでしょうか？

この変更により、OIDCリフレッシュトークンの取り扱いが改善されました。 このような理由から、今回の変更となりました。

- アクセストークンのリフレッシュ処理をHTTPリクエストの処理から切り離すこと。 この切り離しを行わないと、リフレッシュトークンを1回しか使えないプロバイダとのOIDCセッションの維持に問題が生じる可能性があります。 ポータルサイトのセッションが早期に無効化されることがある。

- 対応するアクセストークンと同時に期限が切れるリフレッシュトークンを提供するOIDCプロバイダーのポータルセッションが早期に無効化されるのを防ぐため。

---------------------------------------

## 言語キーの名称を変更

- **日付：** 2021-Sep-09
- **JIRAのチケットです。** LPS-135504

### 何が変わったのか？

すべてのモジュールの言語キーは `liferay-[dxp|portal]/modules/apps/portal-language/portal-language-lang`の `portal-language-lang` というモジュールに移動されました。 また、同じ名前で異なる値の言語キーを使用しているモジュールがある場合、異なる値に対応する言語キーを追加した。 影響を受けるモジュールから見ると、言語キーの名称が変更されています。

### 誰が影響を受けるのか？

これは、名前が変更された言語キーを使用またはオーバーライドしている場合に影響します。 [言語キーの名称変更](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/upgrading-liferay/reference/renamed-language-keys.html) 古い言語キー名を新しい名前にマッピングします。

### どのようにコードを更新すればよいですか？

[言語キーの名称変更](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/upgrading-liferay/reference/renamed-language-keys.html) のマッピングに基づき、名前を変更した言語キーのすべてのインスタンスの名前を新しい名前に変更します。

### なぜ、このような変更を行ったのでしょうか？

言語キーを一元管理することで、管理が容易になります。

---------------------------------------

## CAS SSOモジュールをportal-security-sso-casプロジェクトに移動しました。

- **日付：** 2021-Sep-15
- **JIRAのチケットです。** [LPS-88905](https://issues.liferay.com/browse/LPS-88905)

### 何が変わったのか？

CASのSSOモジュールは、 `portal-security-sso` プロジェクトから、 `portal-security-sso-cas`という名前の新しいプロジェクトに移動されました。 新しいプロジェクトは非推奨ですが、Liferay Marketplaceからダウンロードすることができます。

### 誰が影響を受けるのか？

これは、CAS SSOを認証システムとして使用している人に影響します。

### どのようにコードを更新すればよいですか？

認証システムとしてCAS SSOを継続して使用する場合は、Liferay Marketplaceから対応するアプリをダウンロードする必要があります。

### なぜ、このような変更を行ったのでしょうか？

これは、SSOサポートを統合し、オープンスタンダードへの注力を強化する継続的な取り組みの一部です。

---------------------------------------

## clay:select Tagのname Attributeを印刷用にネームスペース化した。

- **日付：** 2021-Sep-15
- **JIRAチケット：** [LPS-139131](https://issues.liferay.com/browse/LPS-139131)

### 変更点

`clay:select`の属性`name`に、印刷時にデフォルトでポートレットネームスペース（使用可能な場合）が含まれるようになりました。

### 影響を受ける人

これは、`clay:select`とその`name`属性を使用してデータサーバー側を処理するすべてのユーザーに影響します。

### コードの更新方法

値の前に`liferayPortletResponse.getNamespace() + NAME_VALUE`を付けて、自分で属性のネームスペースを設定している場合は、そのプレフィックスを削除して、`name="NAME_VALUE"`を直接使用します。

フルコントロールが必要な場合（またはネームスペースのバージョンが不十分な場合）は、タグに`useNamespace="<%= Boolean.FALSE %>"`を渡すことで古い動作に戻すことができます。

### 変更が行われた理由

この変更は、現在の`aui:select`タグの動作により適合するように、また、今後`clay:select`タグへの移行を容易にし、現在の`clay:select`タグの使用を簡略化するために行われました。

--------------------------------------

## コアレジストリAPIおよびレジストリ実装モジュールを削除

- **日付：** 2021年9月28日
- **JIRAチケット：** [LPS-138126](https://issues.liferay.com/browse/LPS-138126)

### 変更点

コアレジストリAPI（`registry-api`）およびレジストリ実装（`registry-impl`）モジュールが削除されました。

### 影響を受ける人

これは、レジストリAPIを使用しているすべてのユーザーに影響します。

### コードの更新方法

システムバンドルの`org.osgi.framework.BundleContext`を使用してネイティブOSGi APIにアクセスします。  `com.liferay.portal.kernel.module.util.SystemBundleUtil.getBundleContext()`メソッドを呼び出して、コンテキストを取得します。 

### 変更が行われた理由

ネイティブOSGi APIにより、ブリッジAPIは不要になります。

---------------------------------------

## ドキュメントタイプにおけるWebコンテンツのサポートが削除されました

- **日付:** 2021年9月30日
- **JIRAチケット：** [LPS-139710](https://issues.liferay.com/browse/LPS-139710)

### 変更点

ドキュメントタイプのWebコンテンツフィールドのサポートが削除されました。

### 影響を受ける人

これは、Webコンテンツフィールドのドキュメントタイプを使用しているユーザーすべてに影響します。

### コードの更新方法

Webコンテンツフィールドのドキュメントタイプへの参照をすべて削除します。

### 変更が行われた理由

Webコンテンツフィールドのドキュメントタイプは、ドキュメントとメディアに含まれている偶発的な機能でした。 そのユースケースは不明確でした。 ステージング機能を有効にすると、ドキュメントとメディアドキュメントにリンクされたWebコンテンツの記事間で循環問題が発生しました。

---------------------------------------

## OpenID Connect プロバイダーの署名アルゴリズムが RS256 と異なる場合、設定する必要があります

- **日付：** 2021年9月30日
- **JIRAチケット：** [LPS-138756](https://issues.liferay.com/browse/LPS-138756)

### 変更点

ポータルのOpenID Connectクライアントで、プロバイダーと合意したIDトークンの署名アルゴリズムを明示的に指定する必要があります。

### 影響を受ける人

これは、UIにリストされている **最初の** サポートされている署名アルゴリズム以外の署名アルゴリズムを使用してIDトークンに署名するOpenID Connectプロバイダーを統合しているユーザーすべてに影響します。 リストは、プロバイダーのディスカバリーエンドポイントから提供されるか、UIでオフラインで構成されます。

### コードの更新方法

UIで、OpenID Connect プロバイダー接続の設定を確認します。 登録されたIDトークン署名アルゴリズムとして、合意されたアルゴリズムを指定します。

### 変更が行われた理由

これにより、OpenID Connectプロバイダーがサポートするすべての署名アルゴリズムの使用が改善されます。

---------------------------------------

## サービスXMLファイルを持つサービスモジュールフォルダにサービスビルダータスクを制限しました。

- **日付：** 2021年11月02日
- **JIRAチケット：** [LPS-129696](https://issues.liferay.com/browse/LPS-129696)

### 変更点

すべてのOSGiプロジェクトにサービスビルダープラグインを自動的に適用しましたが、 `buildService` タスクターゲットを `service.xml` ファイルを含む`*-service` モジュールフォルダに制限しました。

### 影響を受ける人

これは、Liferay Workspaceで `buildService` タスクを実行している場合に影響します。

### コードの更新方法

コードの変更は必要ありません。 `buildService` タスクを実行する場合、 `service.xml` ファイルが含まれている`*-service` モジュールフォルダを対象とする必要があります。

### 変更が行われた理由

これは、 `buildService` が対象とすべきフォルダを明確にするために行われたものです。

---------------------------------------

## FragmentEntryLocalServiceとFragmentEntryServiceのaddFragmentEntryメソッドを更新しました。

- **日付：** 2021年12月16日
- **JIRAチケット：** [LPS-125034](https://issues.liferay.com/browse/LPS-125034)

### 変更点

`FragmentEntryLocalService` および `FragmentEntryService` の`addFragmentEntry`メソッドには `FragmentEntry` のアイコン向けの新しいパラメーターがあります。 

### 影響を受ける人

`FragmentEntryLocalService` と `FragmentEntryService` を使用してフラグメント エントリを追加するユーザーすべてに影響します。

### コードの更新方法

`FragmentEntryLocalService` および `FragmentEntryService`の新しい`addFragmentEntry`メソッドを使用する場合、 `FragmentEntry`の`icon`向けの新しい`String`パラメーターを含める必要があります。

### 変更が行われた理由

この変更は、フラグメントをインポートする際に、新しいアイコンを使用できるようにするために行われたものです。

---------------------------------------

## FragmentEntryProcessorContext、DefaultFragmentEntryProcessorContext、FragmentRendererContext、DefaultFragmentRendererContextのgetSegmentsExperienceIdsメソッドが削除されました。

- **日付：** 2021年12月17日
- **JIRAチケット：** [LPS-141471](https://issues.liferay.com/browse/LPS-141471)

### 変更点

`FragmentEntryProcessorContext`、`DefaultFragmentEntryProcessorContext`、 `FragmentRendererContext` および `DefaultFragmentRendererContext`からの `getSegmentsExperienceIds`メソッドが削除されました。 `FragmentEntryConfigurationParser`からのシグネチャー`getContextObjects(JSONObject, String)` を持つメソッドは削除されました。

### 影響を受ける人

これは、`FragmentEntryProcessorContext`、 `DefaultFragmentEntryProcessorContext`、`FragmentRendererContext` もしくは `DefaultFragmentRendererContext` を使用して `segmentsExperienceIds`の`long array`を取得する、または`FragmentEntryConfigurationParser`からのシグネチャー `getContextObjects(JSONObject, String)`を持つメソッドを使用している場合のユーザーすべてに影響します。

### コードの更新方法

`FragmentEntryProcessorContext`、`DefaultFragmentEntryProcessorContext`、`FragmentRendererContext` および `DefaultFragmentRendererContext`の `getSegmentsEntryIds`を使用します。 `FragmentEntryConfigurationParser`からシグネチャー`getContextObjects(JSONObject, String, long[])`というメソッドを使用します。ここで、3番目のパラメータは、  `segmentsEntryIds`の`long array`を表しています。

### 変更が行われた理由

この変更は、フラグメント内でコレクションを使用する際に、コレクションのバリエーションを取得できるようにするために行われました。

---------------------------------------

## ポータルのプロパティからリダイレクトURLが削除されました。

- **日付：** 2022年5月24日
- **JIRAチケット：** [LPS-128837](https://issues.liferay.com/browse/LPS-128837)

### 変更点

リダイレクトURLの設定は、ポータルのプロパティから設定できなくなりました。 UIの「インスタンス設定」の「 [リダイレクト URL](../../system-administration/configuring-liferay/virtual-instances/redirect-urls.md) 」で設定することができます。

### 影響を受ける人

この問題は、ポータルのプロパティを使用してリダイレクトURLを設定している人に影響します。

### コードの更新方法

UIの「インスタンス設定」の「 [リダイレクト URL](../../system-administration/configuring-liferay/virtual-instances/redirect-urls.md) 」で必要な設定を行ってください。

### 変更が行われた理由

この変更は、管理者がLiferayインスタンスごとにリダイレクトURLの設定を個別に行えるようにするために行われました。

---------------------------------------

## ポータルLibsクリーンアップ

- **日付** 2022-May-26
- **JIRA チケット** [LPS-142130](https://issues.liferay.com/browse/LPS-142130)

### 削除済み

- abdera.jar, axiom-api.jar, axiom-impl.jar - [LPS-142131](https://issues.liferay.com/browse/LPS-142131)
- xuggle-xuggler-noarch.jar - [LPS-143939](https://issues.liferay.com/browse/LPS-143939) 注：FFmpegがXugglerを置き換えた。 詳しくは、 [Enabling FFmpeg for Audio and View Previews](../../content-authoring-and-management/documents-and-media/devops/enabling-ffmpeg-for-audio-and-video-previews.md) をご覧ください。
- bcmail.jar と bcprov.jar - [LPS-143945](https://issues.liferay.com/browse/LPS-143945)
- ant.jar - [LPS-143953](https://issues.liferay.com/browse/LPS-143953)
- aspectj-rt.jar と aspectj-weaver.jar - [LPS-143999](https://issues.liferay.com/browse/LPS-143999)
- jfreechart.jar と jcommon.jar - [LPS-144001](https://issues.liferay.com/browse/LPS-144001)
- boilerpipe.jar - [LPS-144005](https://issues.liferay.com/browse/LPS-144005)
- ecs.jar - [LPS-144081](https://issues.liferay.com/browse/LPS-144081)
- chardet.jar - [LPS-144084](https://issues.liferay.com/browse/LPS-144084)
- ical4j.jar - [LPS-144119](https://issues.liferay.com/browse/LPS-144119)
- jrcs-diff.jar - [LPS-144476](https://issues.liferay.com/browse/LPS-144476)
- curvesapi.jar - [LPS-144549](https://issues.liferay.com/browse/LPS-144549)
- concurrent.jar - [LPS-144640](https://issues.liferay.com/browse/LPS-144640)
- gif89.jar - [LPS-144861](https://issues.liferay.com/browse/LPS-144861)
- antlr2.jar と antlr3.jar - [LPS-144863](https://issues.liferay.com/browse/LPS-144863)
- bsf.jar - [LPS-145153](https://issues.liferay.com/browse/LPS-145153)
- commons-chain.jar - [LPS-145154](https://issues.liferay.com/browse/LPS-145154)
- freshcookies-security.jar - [LPS-145155](https://issues.liferay.com/browse/LPS-145155)
- htmlparser.jar - [LPS-145367](https://issues.liferay.com/browse/LPS-145367)
- jakarta-regexp.jar - [LPS-145500](https://issues.liferay.com/browse/LPS-145500)
- xmpcore.jar - [LPS-145541](https://issues.liferay.com/browse/LPS-145541)
- jcifs.jar - [LPS-145556](https://issues.liferay.com/browse/LPS-145556)
- juh.jar, jurt.jar, ridl.jar and unoil.jar - [LPS-145918](https://issues.liferay.com/browse/LPS-145918) 。
- xalan.jar - [LPS-145946](https://issues.liferay.com/browse/LPS-145946)
- wsdl4j.jar - [LPS-145991](https://issues.liferay.com/browse/LPS-145991)
- jsr107cache.jar - [LPS-146007](https://issues.liferay.com/browse/LPS-146007)
- xstream.jar - [LPS-146069](https://issues.liferay.com/browse/LPS-146069)
- liferay-icu.jar - [LPS-146089](https://issues.liferay.com/browse/LPS-146089)
- stringtemplate.jar - [LPS-146169](https://issues.liferay.com/browse/LPS-146169)
- rhino.jar - [LPS-146440](https://issues.liferay.com/browse/LPS-146440)
- odmg.jar - [LPS-146547](https://issues.liferay.com/browse/LPS-146547)
- closure-compiler.jar - [LPS-147006](https://issues.liferay.com/browse/LPS-147006)
- nekohtml.jar - [LPS-147042](https://issues.liferay.com/browse/LPS-147042)
- hessian.jar - [LPS-147424](https://issues.liferay.com/browse/LPS-147424)
- jericho-html.jar - [LPS-147656](https://issues.liferay.com/browse/LPS-147656)
- rmi-api.jar - [LPS-148863](https://issues.liferay.com/browse/LPS-148863)
- commons-beanutils.jar - [LPS-149082](https://issues.liferay.com/browse/LPS-149082)
- soap.jar - [LPS-149611](https://issues.liferay.com/browse/LPS-149611)
- serializer.jar - [LPS-150261](https://issues.liferay.com/browse/LPS-150261)
- jaxws-rt.jar - [LPS-150410](https://issues.liferay.com/browse/LPS-150410)
- xbean-spring.jar - [LPS-150448](https://issues.liferay.com/browse/LPS-150448)
- commons-math.jar - [LPS-150548](https://issues.liferay.com/browse/LPS-150548)
- streambuffer.jar, mimepull.jar, saaj-api.jar, saaj-impl.jar - [LPS-150781](https://issues.liferay.com/browse/LPS-150781)
- DBCP、c3p0、Tomcat プール - [LPS-151028](https://issues.liferay.com/browse/LPS-151028)
- stax.jar - [LPS-151308](https://issues.liferay.com/browse/LPS-151308)

### モジュールに移動しました

- im4java.jar と monte-cc.jar - [LPS-144170](https://issues.liferay.com/browse/LPS-144170)
- java-diff.jar, daisydiff.jar and eclipse-core-runtime.jar - [LPS-144201](https://issues.liferay.com/browse/LPS-144201)
- urlrewritefilter.jar - [LPS-145186](https://issues.liferay.com/browse/LPS-145186)
- jai_core.jar と jai-codec.jar - [LPS-145778](https://issues.liferay.com/browse/LPS-145778)
- ccpp.jar, ccpp-ri.jar, jena.jar, oro.jar and reffilter.jar - [LPS-145917](https://issues.liferay.com/browse/LPS-145917)
- netty-buffer.jar, netty-codec.jar, netty-common.jar, netty-handler.jar, netty-resolver.jar および netty-transport.jar - [LPS-146451](https://issues.liferay.com/browse/LPS-146451)
- jazzy.jar - [LPS-146894](https://issues.liferay.com/browse/LPS-146894)
- commons-discovery.jar - [LPS-147205](https://issues.liferay.com/browse/LPS-147205)
- scribe.jar - [LPS-147542](https://issues.liferay.com/browse/LPS-147542)
- tika-core.jar, tika-parsers.jar, vorbis-java-core.jar and vorbis-java-tika.jar - [LPS-147938](https://issues.liferay.com/browse/LPS-147938)
- commons-lang3.jar - [LPS-148100](https://issues.liferay.com/browse/LPS-148100)
- commons-digester.jar と commons-validator.jar - [LPS-148191](https://issues.liferay.com/browse/LPS-148191)
- jmatio.jar - [LPS-148218](https://issues.liferay.com/browse/LPS-148218)
- mime4j.jar - [LPS-148287](https://issues.liferay.com/browse/LPS-148287)
- poi.jar - [LPS-148302](https://issues.liferay.com/browse/LPS-148302)
- metadata-extractor.jar と xmpcore.jar - [LPS-148460](https://issues.liferay.com/browse/LPS-148460)
- commons-compress.jar - [LPS-148461](https://issues.liferay.com/browse/LPS-148461)
- tagsoup.jar - [LPS-148497](https://issues.liferay.com/browse/LPS-148497)
- java-libpstjar - [LPS-148577](https://issues.liferay.com/browse/LPS-148577)
- mp4parser.jar - [LPS-148582](https://issues.liferay.com/browse/LPS-148582)
- juniversalchardet.jar - [LPS-148666](https://issues.liferay.com/browse/LPS-148666)
- jhighlight.jar - [LPS-148670](https://issues.liferay.com/browse/LPS-148670)
- jna.jar - [LPS-148671](https://issues.liferay.com/browse/LPS-148671)
- sparse-bit-set.jar - [LPS-148757](https://issues.liferay.com/browse/LPS-148757)
- netcdf.jar - [LPS-148925](https://issues.liferay.com/browse/LPS-148925)
- jaxb-runtime.jar と istack-commons-runtime.jar - [LPS-148926](https://issues.liferay.com/browse/LPS-148926)
- commons-exec.jar - [LPS-149097](https://issues.liferay.com/browse/LPS-149097)
- commons-collections4.jar - [LPS-149099](https://issues.liferay.com/browse/LPS-149099)
- commons-math3.jar - [LPS-149151](https://issues.liferay.com/browse/LPS-149151)
- pdfbox.jar - [LPS-149426](https://issues.liferay.com/browse/LPS-149426)
- rometools.jar - [LPS-150149](https://issues.liferay.com/browse/LPS-150149)
- passwordencryptor.jar - [LPS-150150](https://issues.liferay.com/browse/LPS-150150)
- jdom2.jar - [LPS-150423](https://issues.liferay.com/browse/LPS-150423)
- xbean.jar - [LPS-150447](https://issues.liferay.com/browse/LPS-150447)
- asm.jar - [LPS-151419](https://issues.liferay.com/browse/LPS-151419)

### なぜ、このような変更を行ったのですか？

この変更は、メンテナンスが終了した古いライブラリの脆弱性に対応するために行われたものです。

---------------------------------------

## Elasticsearch のソート可能なタイプマッピングが keyword から icu_collation_keyword に変更されました。

- **日付：** 2022年5月12日
- **JIRAチケット：** [LPS-152937](https://issues.liferay.com/browse/LPS-152937)

### 変更点

ローカライズされたソート可能な `*_<languageId>_sortable` とネストされた `ddmFieldArray.ddmFieldValueText_<languageId>_String_sortable` フィールドの Elasticsearch タイプマッピングは `keyword` から `icu_collation_keyword`へ変更された。

これらのフィールドの索引情報を符号化して保存するようになった。 例えば、 `エンティティタイトル` のテキストが、 `MkRQOlBaBFA6UEAyARABEAA=`として格納されるようになった。

この新しい `icu_collation_keyword` タイプは、各言語の正しい照合規則を使用してソートすることができます。 詳しくは、 <https://www.elastic.co/guide/en/elasticsearch/plugins/7.17/analysis-icu-collation-keyword-field.html>をご覧ください。

既存のLiferayインストールを更新した場合、完全な再インデックスが実行され、Elasticsearchマッピングが再作成されると、新しいマッピングが有効になります。

### 影響を受ける人

`*_<languageId>_sortable` と `ddmFieldArray.ddmFieldValueText_<languageId>_String_sortable` フィールドをカスタムElasticsearchクエリで使用している場合。

   - **ソートされた結果** を見ると、各言語の正しい照合規則で結果がソートされていることがわかります。
   - **Elasticsearch インデックス** から情報を取得する場合、情報がエンコードされた形式で返されるようになったことがわかります。

### コードの更新方法

古いソートの動作を維持したい場合は、Elasticsearch マッピングをカスタマイズして、 `icu_collation_keyword`を削除する必要があります。 マッピングの設定方法の詳細については、https://learn.liferay.com/dxp/latest/en/using-search/installing-and-upgrading-a-search-engine/elasticsearch/advanced-configuration-of-the-liferay-elasticsearch-connector.html を参照してください。

これらのフィールドからデータを取得するには、Elasticsearchの `_source` フィールドから同じ情報を取得します。 <https://www.elastic.co/guide/en/elasticsearch/reference/7.17/mapping-source-field.html>. または、前項で説明したように、 `icu_collation_keyword` を削除してください。

---------------------------------------

## MySQL Connector を 8.0.29 にアップグレードし、MySQL でプロトコル TLSv1.2 を使用するよう強制された。

- **日付：** 2022年7月20日
- **JIRAのチケットです。** [lps-157036](https://issues.liferay.com/browse/LPS-157036) , [lps-157039](https://issues.liferay.com/browse/LPS-157039)

### 変更点

MySQLコネクタがバージョン8.0.29にアップグレードされました。 MySQL 8.0.29 では TLSv1.2 を使用しており、TLSv1 および TLv1.1 はサポートされなくなりました。 詳しくは、https://dev.mysql.com/doc/refman/8.0/en/encrypted-connection-protocols-ciphers.html をご覧ください。

### 影響を受ける人

MySQLのバージョンが5.7.28より低い場合、特にDXP U37以降で自動ダウンロードされたMySQLコネクタを使用されているクライアント様。 MySQLコネクタ8.0.28以降を手動でインストールされた方は、MySQLを5.7.28以降にアップグレードする必要があります。 

### コードの更新方法

MySQLをバージョン5.7.28以上にアップグレードするか、プロトコルをTLSv1.2に手動で設定してください（https://dev.mysql.com/doc/refman/5.7/en/encrypted-connection-protocols-ciphers.html#encrypted-connection-supported-protocols を参照）。

### 変更が行われた理由

- この変更は、セキュリティ上の脆弱性に対応するために行われたものです。
