# 7.3 旧バージョンと非互換の変更

このドキュメントは、サードパーティのLiferay開発者またはユーザーとの既存の機能、API、または契約に違反する変更の時系列リストを示しています。 私たちはこれらの混乱を最小限にするために最善を尽くしていますが、時には避けられないこともあります。

このファイルに記載されている変更の種類の一部を次に示します。

* 削除または置換される機能
* APIの非互換性：パブリックJavaまたはJavaScript APIの変更
* テンプレートで利用可能なコンテキスト変数の変更
* Liferayテーマおよびポートレットで利用可能なCSSクラスの変更
* 設定の変更：`portal.properties`や`system.properties`などの設定ファイルの変更。
* 実行要件：Javaバージョン、Java EEバージョン、ブラウザーバージョンなど
* 非推奨またはサポート終了：たとえば、次のバージョンで特定の機能またはAPIが停止されると警告している

## 旧バージョンと非互換の変更リスト

### Liferay FontAwesomeはデフォルトで含まれなくなりました。

* **日付:** 2019年8月21日
* **JIRAチケット：** [LPS-100021](https://issues.liferay.com/browse/LPS-100021)

#### 変更点

Font Awesome、Glyphicon、およびカスタムLiferayアイコンのアイコンフォントが含まれていたLiferay FontAwesomeは、デフォルトでは含まれなくなりました。

#### 影響を受ける人

これは、これらのアイコンフォント自体を含まないテーマが適用されているページまたはサイトに影響します。 これらのアイコンフォントを使用するページやサイトのコンテンツやコードは機能しなくなります。

#### コードの更新方法

アイコンフォントの使用方法に応じて、いくつかの方法があります。

##### liferay-ui:icon使用の場合

`<liferay-ui:icon iconCssClass="icon-user">`を`<liferay-ui:icon icon="user" markupView="lexicon" />` に置き換える。

##### JavaScriptで生成されたアイコンの場合

手動で FontAwesome アイコンの html を生成する場合は、`Liferay.Util.getLexiconIconTpl('user')` API を使用できます。 たとえば、前の呼び出しは、ユーザーのsvgアイコンのHTMLコードを返します。

##### JSP内の直接HTMLの場合

jsps でアイコンを直接使用する開発者は、上で説明した `liferay-ui:icon` タグを使用するか、代わりに `clay:icon` タグを使用して svg ベースのアイコンを生成することができます。

##### 非制御コードの場合

アイコンフォントを使用するコンテンツにアクセスできない場合、またはコードやコンテンツを更新したくない場合は、フォントをテーマに含めることができます。

7.2のアップグレードプロセス中、テーマアップグレードアシスタントは、FontAwesomeをテーマの一部として維持するよう開発者に促します。 アイコンフォントが既に含まれているテーマは影響を受けず、7.3でも引き続き機能します。

#### 変更が行われた理由

この変更は、不要なファイルを提供しないことで帯域幅を節約し、サイトのパフォーマンスを向上させるために行われました。

***

### liferay.frontend.ProgressBarを削除

* **日付:** 2019年8月28日
* **JIRAチケット：** [LPS-100122](https://issues.liferay.com/browse/LPS-100122)

#### 変更点

レガシーな動作の一時的なブリッジとして使われていた、レガシーな metal+soy の `liferay.frontend.ProgressBar` コンポーネントは削除されました。

#### 影響を受ける人

これは、`liferay.frontend.ProgressBar`に依存しているコードに影響します。これは通常、`soy`を介して `{call liferay.frontend.ProgressBar /}` として行われます。

#### コードの更新方法

`liferay.frontend.ProgressBar`コンポーネントを直接置き換えるものはありません。 それに依存するコンポーネントがある場合は、古い実装のコピーを同じ場所に配置して、モジュール内でローカルに使用できます。

#### 変更が行われた理由

`liferay.frontend.ProgressBar`コンポーネントは7.2で非推奨となり、使用されなくなりました。

***

### AssetCategoryのツリーパスが左右のカテゴリーIDに置き換わりました

* **日付:** 2019-10-08
* **JIRAチケット：** [LPS-102671](https://issues.liferay.com/browse/LPS-102671)

#### 変更点

`AssetCategory`の左と右のカテゴリーIDが削除され、単一のツリーパスに置き換えられました。

#### 影響を受ける人

これは、`AssetCategory`と関連APIで左右のカテゴリーIDを使用している人に影響する。

左右のカテゴリーIDは主に`AssetCategory`の内部階層ツリーに使用された。

`AssetCategoryLocalService::rebuildTree(long groupId, boolean force)`は削除された。

これらのメソッドは `AssetCategoryUtil` から削除された：

* `countAncestors`
* `countDescendants`
* `getAncestors`
* `getDescendants`

`AssetEntryQuery`から左右のカテゴリIDに関するメソッドが削除されました。

`G_P_N_V`で終わるファインダーメソッドは、`P_N_V`で終わるメソッドに置き換えられました。

#### コードの更新方法

##### 左右のカテゴリーIDの場合

左右のカテゴリーIDを使用している場合は、次のオプションを検討してください。

* 新しいツリーパスを使用するようにコードを調整する
* サービスAPIを使用して同じ目標を達成できるかどうかを検討する

例えば、`category.getLeftCategoryId()` と `category.getRightCategoryId()` を使ってカテゴリーIDを扱う代わりに、`category.getTreePath()` を使ってツリーパスを取得することができる。  次に、ツリーパスを使用します。

参考として、このスニペット `AssetCategoryLocalService` はカテゴリを追加するときにツリーのパスを設定します：

```
if (parentCategory == null) {
    category.setTreePath("/" + categoryId + "/");
}
else {
    category.setTreePath(
        parentCategory.getTreePath() + categoryId + "/");
}
```

[7.3.0-ga1 - AssetCategoryLocalServiceImpl.java#L122-L128](https://github.com/liferay/liferay-portal/blob/7.3.0-ga1/portal-impl/src/com/liferay/portlet/asset/service/impl/AssetCategoryLocalServiceImpl.java#L122-L128) を参照してください。

##### AssetCategoryLocalService#rebuildTree(long, boolean)の場合

`AssetCategoryLocalService#rebuildTree(long, boolean)`の呼び出しは不要かもしれない。 このメソッドは主に、現在は置き換えられている内部階層ツリーの実装を維持するために使用されていました。

`rebuildTree`メソッドの呼び出しがまだ必要かどうかを確認するために、既存のコードを再評価することを検討してください。

##### AssetCategoryUtilおよびAssetEntryQueryの場合

`AssetCategoryUtil`と`AssetEntryQuery`から削除されたメソッドを使用する場合は、以下の提案を考慮してください：

* 既存のコードを再評価する
* 既存のサービスAPIが同じ目標を達成できるかどうかを検討する

##### G **P** N_Vを含むFinderメソッドの場合

`G_P_N_V`で終わる`AssetCategory`検索メソッドを使用する場合は、代わりに`P_N_V` で終わるメソッドを使用してください。

#### 変更が行われた理由

この変更は、AssetCategoryの階層ツリーの実装を改善するために行われました。

***

### liferay.frontend.Sliderを削除

* **日付:** 2019-10-10
* **JIRAチケット：** [LPS-100124](https://issues.liferay.com/browse/LPS-100124)

#### 変更点

レガシーな動作の一時的なブリッジとして使われていた、レガシーな metal+soy の `liferay.frontend.Slider` コンポーネントは削除されました。

#### 影響を受ける人

これは`liferay.frontend.Slider`に依存しているすべてのコードに影響します; これは通常`{call liferay.frontend.Slider /}`として`soy`を介して行われます。

#### コードの更新方法

`liferay.frontend.Slider`コンポーネントを直接置き換えるものはありません。 それに依存するコンポーネントがある場合は、古い実装のコピーを同じ場所に配置して、モジュール内でローカルに使用できます。

#### 変更が行われた理由

`liferay.frontend.Slider`コンポーネントは7.2で非推奨となり、使用されなくなりました。

***

### com.liferay.asset.taglib.servlet.taglib.soy.AssetTagsSelectorTagを削除

* **日付:** 2019年10月15日
* **JIRAチケット：** [LPS-100144](https://issues.liferay.com/browse/LPS-100144)

#### 変更点

Javaクラス `com.liferay.asset.taglib.servlet.taglib.soy.AssetTagsSelectorTag` は削除されました。

#### 影響を受ける人

これは、このクラスを直接インスタンス化または拡張するコードに影響します。

#### コードの更新方法

削除されたクラスを直接置き換えるものはありません。 それに依存するコードがある場合は、古い実装を独自のプロジェクトにコピーし、ローカルバージョンに依存するように依存関係を変更する必要があります。

#### 変更が行われた理由

`asset:asset-tags-selector`とそのコンポーネントはReactに移行され、古いタグとその大豆インフラは不要になった。

***

### 削除されたポータルプロパティuser.groups.copy.layouts.to.user.personal.site

* **日付:** 2019年12月26日
* **JIRAチケット：** [LPS-106339](https://issues.liferay.com/browse/LPS-106339)

#### 変更点

ポータルのプロパティ`user.groups.copy.layouts.to.user.personal.site`とそれに関連する動作が削除されました。

#### 影響を受ける人

これは、`user.groups.copy.layouts.to.user.personal.site`プロパティを`true`に設定してユーザーグループのページをユーザー個人サイトにコピーしている人に影響します。

#### コードの更新方法

このプロパティを直接置き換えるものはありません。 この動作に依存している場合、`UserGroupLocalServiceImpl#copyUserGroupLayouts`の古い実装を自分のプロジェクトにコピーすることができます。

#### 変更が行われた理由

このプロパティに関連付けられた動作は、6.2以降廃止されました。

***

### EXTプラグインの自動デプロイのサポートを削除

* **日付:** 2019年12月31日
* **JIRAチケット：** [LPS-106008](https://issues.liferay.com/browse/LPS-106008)

#### 変更点

Auto Deployer (`liferay-home/deploy folder` 経由) を使った EXT プラグインのデプロイのサポートを削除しました。 デプロイフォルダーにコピーされたEXTプラグインは認識されなくなりました。

#### 影響を受ける人

これは、Auto Deployerを介してEXTプラグインをデプロイするすべてのユーザーに影響します。

#### コードの更新方法

削除された機能を直接置き換えるものはありません。 EXTプラグインがある場合は、手動でデプロイするか、 [`ant direct-deploy`](https://github.com/liferay/liferay-plugins/blob/7.0.x/ext/build-common-ext.xml#L211) を使用する必要があります。

#### 変更が行われた理由

この機能は7.1以降廃止されました。

***

### OSGi構成プロパティautoUpgradeを置換

* **日付:** 2020-Jan-03
* **JIRAチケット：** [LPS-102842](https://issues.liferay.com/browse/LPS-102842)

#### 変更点

`com.liferay.portal.upgrade.internal.configuration.ReleaseManagerConfiguration.config`で定義されていた OSGi プロパティ`autoUpgrade`は、ポータルのプロパティ`upgrade.database.auto.run` に置き換えられました。

モジュールのアップグレードプロセスのみを制御していた古いプロパティとは異なり、新しいプロパティはコアアップグレードプロセスにも影響します。 デフォルト値は `false` で、起動時やモジュールのデプロイ時にアップグレード処理は実行されません。 モジュールのアップグレードプロセスは、Gogo シェルコンソールを介して、またはサーバーがダウンしているときはデータベースアップグレードツールを介していつでも実行できます。

このプロパティは `portal-developer.properties` で `true` に設定されている。

#### 影響を受ける人

この変更は、サーバーの起動時またはモジュールの展開時にアップグレードを自動的に実行することを期待しているすべての環境に影響します。 本番環境では、`upgrade.database.auto.run` を `true` に設定することは推奨されません。 ただし、サーバーの起動時にアップグレードする必要がある場合は、最初にLiferayデータベースとファイルストア（ドキュメントライブラリ）をバックアップします。

`upgrade.database.auto.run`を`false`(デフォルト値)に設定したが、データベースのアップグレードが必要な場合、Liferayは必要なアップグレードに関する情報を表示し、起動を停止します。 データベースのアップグレードは通常、メジャー/マイナーのLiferayリリースで必要であり、初期のCE Portal GAリリースおよび特定のサービスパック（例外的な場合）で必要になる場合があります。フィックスパックではデータベースのアップグレードは必要ありません。 起動時に、Liferayは保留中のマイクロ変更に関する情報を出力します。 いつでもGogo シェルコンソールとリリースノートを使用して、このような変更を確認し、実行するかどうかを決定できます。

#### コードの更新方法

この変更はコードには影響しません。

#### 変更が行われた理由

この変更は、コアとモジュール間の自動アップグレード機能を統合するために行われました。 本番環境での起動時に新しいアップグレードプロセスが実行されないように、デフォルト値も変更されました。

***

### SingleVMPoolUtilおよびMultiVMPoolUtilクラスの削除

* **日付:** 2020年1月7日
* **JIRAチケット：** [LPS-106315](https://issues.liferay.com/browse/LPS-106315)

#### 変更点

`SingleVMPoolUtil`と`MultiVMPoolUtil` クラスは削除された。

#### 影響を受ける人

これは、これらの削除されたクラスを使用するすべての人に影響する。

#### コードの更新方法

`SingleVMPoolUtil`または`MultiVMPoolUtil`の代わりに`PortalCacheHelperUtil` を使用してください。 たとえば、 [SQLQueryTableNamesUtil](https://github.com/liferay/liferay-portal/blob/7.3.x/portal-impl/src/com/liferay/portal/dao/orm/hibernate/SQLQueryTableNamesUtil.java#L113-L116) を参照。

#### 変更が行われた理由

`SingleVMPoolUtil`クラスと`MultiVMPoolUtil` クラスは、もともと [LPS-84138](https://issues.liferay.com/browse/LPS-84138) で非推奨とされていた。 このクラスはもう使われていない。

***

### キャッシュブートストラップ機能を削除

* **日付:** 2020年1月8日
* **JIRAチケット：** [LPS-96563](https://issues.liferay.com/browse/LPS-96563)

#### 変更点

キャッシュブートストラップ機能は削除されました。 これらのプロパティは、キャッシュブートストラップを有効化/構成するために使用できなくなりました。

* `ehcache.bootstrap.cache.loader.enabled`
* `ehcache.bootstrap.cache.loader.properties.default`
* `ehcache.bootstrap.cache.loader.properties.${specific.cache.name}`

#### 影響を受ける人

これは、上記のプロパティを使用するすべてのユーザーに影響します。

#### コードの更新方法

削除された機能を直接置き換えるものはありません。 それに依存するコードがある場合は、自分で実装する必要があります。

#### 変更が行われた理由

この変更は、セキュリティの問題を回避するために行われました。

***

### liferay-frontend:cards-treeviewタグを削除

* **日付:** 2020年1月10日
* **JIRAチケット：** [LPS-106899](https://issues.liferay.com/browse/LPS-106899)

#### 変更点

`liferay-frontend:cards-treeview` タグが削除されました。

#### 影響を受ける人

これは、JSPのタグ、またはSOY（閉鎖テンプレート）テンプレート内のそのコンポーネントの一部を使用するすべてのユーザーに影響します。

#### コードの更新方法

削除された機能を直接置き換えるものはありません。 それに依存するコードがある場合は、自分で実装する必要があります。

#### 変更が行われた理由

この変更は、タグが主に内部で使用されたために行われました。

***

### liferay-frontend:contextual-sidebarタグを削除

* **日付:** 2020年1月10日
* **JIRAチケット：** [LPS-100146](https://issues.liferay.com/browse/LPS-100146)

#### 変更点

`liferay-frontend:contextual-sidebar`タグは削除されました。

#### 影響を受ける人

これは、SOY（閉鎖テンプレート）テンプレート内のjspまたはそのコンポーネントの一部からのタグを使用するすべてのユーザーに影響します。

#### コードの更新方法

削除された機能を直接置き換えるものはありません。 それに依存するコードがある場合は、自分で実装する必要があります。

#### 変更が行われた理由

この変更は、タグが主に内部で使用されたために行われました。

***

### Portal Vulcan APIのアクションの追加メソッドを削除

* **日付:** 2020年1月22日
* **JIRAチケット：** [LPS-98387](https://issues.liferay.com/browse/LPS-98387)

#### 変更点

シグネチャが `String, Class, GroupedModel, String, UriInfo` と `String, Class, Long, String, Long, UriInfo` の `addAction` メソッドは削除された。

#### 影響を受ける人

これは、削除された `addAction` メソッドを使用している人や、`compileOnly group' のような依存関係を持つ人に影響します："com.liferay", name: "com.liferay.portal.vulcan.api", version："[1.0.0, 2.0.0)"`.

#### コードの更新方法

`AddAction` メソッドには、`String, Class, GroupedModel, String, Object, UriInfo`または`String, Class, Long, String, Object, Long, UriInfo` というシグネチャを指定してください。

#### 変更が行われた理由

これらのメソッドは、クリーンアップリファクタリングの一部として削除されました。

***

### 変更されたコントロールメニューとプロダクトメニューの配置

* **日付:** 2020年2月4日
* **JIRAチケット：** [LPS-107487](https://issues.liferay.com/browse/LPS-107487)

#### 変更点

コントロールとプロダクトメニューの配置と構造は、いくつかのアクセシビリティの問題と一般的な視覚的な不具合に対処するために変更されました。

これらの変更は、コントロールメニューとプロダクトメニューに適用されています。

* プロダクトメニューはコントロールメニューの外に移動されました
* コントロールメニューの動作を制御するために `position:sticky` を使用するようになりました。
* コントロールメニュー内のメニューのスタイルが更新され、スティッキー動作が追加されました。

#### 影響を受ける人

これは、カスタマイズされた `portlet.ftl` テンプレートを持つカスタムコントロールパネルテーマを持っている開発者や、スティッキーバーとして動作するカスタムメニューを開発し、`*ControlMenuEntry` API を使用してインクルードしている開発者に影響する可能性があります。

#### コードの更新方法

##### コントロールパネルのテーマ

コントロールパネルのカスタムテーマを使用している開発者は、(もしあれば) `portlet.ftl` のポートレットセクションの上に `@liferay.control_menu` マクロの呼び出しを移動してください。

**前:**

```html
<section class="portlet" id="portlet_${htmlUtil.escapeAttribute(portletDisplay.getId())}">
	${portletDisplay.writeContent(writer)}
</section>

<#if portletDisplay.isStateMax()>
	<@liferay.control_menu />
</#if>
```

**その後:**

```html
<#if portletDisplay.isStateMax()>
	<@liferay.control_menu />
</#if>

<section class="portlet" id="portlet_${htmlUtil.escapeAttribute(portletDisplay.getId())}">
	${portletDisplay.writeContent(writer)}
</section>
```

##### カスタムスティッキーバー

`ControlMenuEntry`APIを使用してカスタムスティッキーバーをインクルードしている開発者は、コントロールメニューに新しくインクルードされた拡張ポイントを使用してコンポーネントをインジェクトすることができます。

メニューを注入するコードを `DynamicInclude` コンポーネントに移動し、適切な位置に登録する：

* コントロールメニューの前に`com.liferay.product.navigation.taglib#/page.jsp#pre`を使用してください。
* コントロールメニューの後`com.liferay.product.navigation.taglib#/page.jsp#post`を使用してください。

#### 変更が行われた理由

この変更は、アクセシビリティを向上させ、上位に配置されたメニューの配置と制御に必要なロジックを簡素化するために行われました。 一般的な視覚的な不具合を回避する、より正確で期待されるマークアップを提供します。

***

### jQueryはデフォルトで含まれなくなりました

* **日付:** 2020年2月4日
* **JIRAチケット：** [LPS-95726](https://issues.liferay.com/browse/LPS-95726)

#### 変更点

以前は、`jQuery`はデフォルトですべてのページに含まれており、グローバル変数 `window.$` とスコープ付き変数 `AUI.$` から利用可能でした。 この変更後、`jQuery`はデフォルトでは含まれなくなり、これらの変数は`undefined`になった。

#### 影響を受ける人

これは、カスタムスクリプトで `AUI.$` または `window.$` を使用していた開発者に影響します。

#### コードの更新方法

コードで使用する独自のバージョンのJQueryを提供するサードパーティライブラリを追加するための戦略のいずれかを使用します。

さらに、一時的な措置として、 **System Settings** &rarr; **Third Party** &rarr; **jQuery** の`Enable jQuery`プロパティを`true`に設定することで、以前の動作を復活させることができます。

#### 変更が行われた理由

この変更は、ほとんどの場合未使用で冗長なすべてのページに追加のライブラリコードをバンドルして提供することを回避するために行われました。

***

### サーバー側の並列レンダリングはサポートされなくなりました

* **日付:** 2020年3月16日
* **JIRAチケット：** [LPS-110359](https://issues.liferay.com/browse/LPS-110359)

#### 変更点

`layout.parallel.render`という接頭辞を持つプロパティが削除された。これは、AJAXレンダリングが有効な場合にのみパラレルレンダリングがサポートされることを意味する。

#### 影響を受ける人

これは、削除されたプロパティを使用するすべてのユーザーに影響します。

#### コードの更新方法

プロパティファイルから、`layout.parallel.render`をプレフィックスに持つプロパティを削除する。

#### 変更が行われた理由

この機能は廃止されました。

***

### ContentField値のプロパティ名をcontentFieldValueに変更

* **日付:** 2020年3月18日
* **JIRAチケット：** [LPS-106886](https://issues.liferay.com/browse/LPS-106886)

#### 変更点

Headless Delivery API で、ContentField スキーマ内のプロパティ名 `value` が `contentFieldValue` に変更された。

#### 影響を受ける人

これは、ContentField `value` プロパティ名に依存する REST クライアントに影響する。

#### コードの更新方法

RESTクライアントのプロパティ名を`contentFieldValue`に変更する。

#### 変更が行われた理由

`{schemaName}+Value`と呼ばれるヘッドレスAPIのすべての値のプロパティ名との一貫性を回復する変更です。

***

### liferay-editor-image-uploaderプラグインを削除しました

* **日付:** 2020年3月27日
* **JIRAチケット：** [LPS-110734](https://issues.liferay.com/browse/LPS-110734)

### 変更点

`liferay-editor-image-uploader`AUI プラグインが削除された。 このコードは`addimages` CKEditorプラグインにマージされ、Alloy EditorとCKEditorで使用されている。

### 影響を受ける人

これは、プラグインを直接使用するカスタムソリューションに影響します。

### コードの更新方法

`liferay-editor-image-uploader`プラグインを直接置き換えるものはありません。 それに依存するコンポーネントがある場合は、古い実装のコピーを同じ場所に配置して、モジュール内でローカルに使用できます。

#### 変更が行われた理由

この変更により、CKEditorでの画像のドラッグアンドドロップ処理が可能になり、Alloy EditorとCKEditorの両方に共通の画像アップローダが提供されます。

***

### TinyMCEエディターはデフォルトでバンドルされなくなりました

* **日付:** 2020年3月27日
* **JIRAチケット：** [LPS-110733](https://issues.liferay.com/browse/LPS-110733)

### 変更点

7.3以降では、CKEditorがデフォルトであり、WYSIWYGエディターのみがサポートされています。

### 影響を受ける人

これはTinyMCEを使用するすべてのユーザーに影響します。

### コードの更新方法

TinyMCEを使用するようにLiferayポータルを構成している場合は、これらの構成を削除できます。 それでもTinyMCEを使用したい場合は、次の手順を実行する必要があります。

* 構成を保持します。
* ブラウザで https://repository.liferay.com/nexus/index.html を開きます。
* `com.liferay.frontend.editor.tinymce.web`を検索します。
* `com.liferay.frontend.editor.tinymce.web` モジュールの .jar ファイルをダウンロードします。
* ダウンロードした.jarファイルをliferay-portalインスタレーションにデプロイします。

#### 変更が行われた理由

この変更は、1つのエディターを中心にリッチテキストコンテンツを作成するためのすべてのUXを統合して、よりまとまりのある包括的なエクスペリエンスを提供するために行われました。

***

### Simple Editorはデフォルトでバンドルされなくなりました

* **日付:** 2020年3月27日
* **JIRAチケット：** [LPS-110734](https://issues.liferay.com/browse/LPS-110734)

### 変更点

7.3以降では、CKEditorがデフォルトであり、WYSIWYGエディターのみがサポートされています。

### 影響を受ける人

これは、LiferayフロントエンドエディターのシンプルなWebモジュールを使用するすべてのユーザーに影響します。

### コードの更新方法

Simple Editorを使用するようにLiferay Portalを構成している場合は、これらの構成を削除できます。 Simple Editorを引き続き使用する場合は、次の手順を実行する必要があります。

* 構成を保持します。
* ブラウザで https://repository.liferay.com/nexus/index.html を開きます。
* `com.liferay.frontend.editor.simple.web`を検索します。
* `com.liferay.frontend.editor.simple.web` モジュールの .jar ファイルをダウンロードします。
* ダウンロードした.jarファイルをliferay-portalインストールにデプロイします。

#### 変更が行われた理由

この変更は、1つのエディターを中心にリッチテキストコンテンツを作成するためのすべてのUXを統合して、よりまとまりのある包括的なエクスペリエンスを提供するために行われました。

***

### asset.vocabulary.defaultが言語キーを保持するようになりました

* **日付:** 2020年4月28日
* **JIRAチケット：** [LPS-112334](https://issues.liferay.com/browse/LPS-112334)

### 変更点

`asset.vocabulary.default`は言語キーになり、固定値である`Topic`はなくなりました。

### 影響を受ける人

これは、プロパティを上書きするすべてのユーザーに影響します。

### コードの更新方法

プロパティが上書きされない場合は、コードを変更する必要はありません。 プロパティが上書きされ、指定されたキーが見つからない場合、提供されたテキストはデフォルトの語彙の名前として使用されます。

#### 変更が行われた理由

この変更はユーザーがすべての言語でデフォルトの語彙の名前を変更する必要がないように行われました。

***

### Liferay.Pollerがデフォルトで初期化されなくなりました

* **日付:** 2020年5月19日
* **JIRAチケット：** [LPS-112942](https://issues.liferay.com/browse/LPS-112942)

#### 変更点

グローバル AUI ユーティリティ `Liferay.Poller` は非推奨となり、デフォルトでは初期化されなくなりました。

#### 影響を受ける人

これは `Liferay.Poller` に依存しているコードに影響します; これは通常 JSP 内で `Liferay.Poller.init()` を呼び出すことで行われます。

#### コードの更新方法

ユーティリティ `Liferay.Poller` を直接置き換えるものはありません。 もし `Liferay.Poller` を初期化しなければならない場合は、JSPを更新して以下のコードを使うようにしてください：

```html
<%@ page import="com.liferay.petra.encryptor.Encryptor" %>

<%-- For access to `company` and `themeDisplay`. --%>
<liferay-theme:defineObjects>

<aui:script use="liferay-poller">
	<c:if test="<%= themeDisplay.isSignedIn() %>">
		Liferay.Poller.init({
			encryptedUserId:
				'<%= Encryptor.encrypt(company.getKeyObj(), String.valueOf(themeDisplay.getUserId())) %>',
		});
	</c:if>
</aui:script>
```

#### 変更が行われた理由

`Liferay.Poller` コンポーネントはチャットアプリケーションでのみ使用され、アーカイブされています。 デフォルトで初期化をスキップすると、一般的なケースでページの読み込みが合理化されます。

***

### ContentTransformerListenerはデフォルト設定で無効になっています

* **日付:** 2020年5月25日
* **JIRAチケット：** [LPS-114239](https://issues.liferay.com/browse/LPS-114239)

#### 変更点

`ContentTransformerListener`がデフォルトで無効になった。

#### 影響を受ける人

これは `ContentTransformerListener` によって提供されるレガシーなウェブコンテンツ機能を使用している Liferay Portal のインストールに影響します。例えば、別のウェブコンテンツの中にウェブコンテンツを埋め込んだり、レガシーな編集インフラストラクチャ、トークンの置換（`@article_group_id@`、`@articleId;elementName@`）などです。

#### コードの更新方法

コードを更新する必要はありません。 それでも `ContentTransformerListener` を使いたいのであれば、システム設定の **Content & Data** &rarr; **Web Content** &rarr; **Virtual Instance Scope** &rarr; **Web Content** の下にある **Enable ContentTransformerListener** プロパティを使って有効にすることができる。

#### 変更が行われた理由

`ContentTransformerListener`は、記事要素での高価な文字列処理（記事フィールドで `HtmlUtil.stripComments`と`HtmlUtil.stripHtml` を呼び出す）のため、パフォーマンスを改善するために無効にされた。

***

### Liferay.BrowserSelectors.runが呼び出されなくなりました

* **日付:** 2020年5月26日
* **JIRAチケット：** [LPS-112983](https://issues.liferay.com/browse/LPS-112983)

#### 変更点

`Liferay.BrowserSelectors.run()`関数がページ上で呼び出されなくなり、その結果、冒頭の `<html>`タグからいくつかのCSSクラスが削除されるようになりました。 これらの多くは現在、代わりに`<body>`要素に追加されている。

#### 影響を受ける人

これは、`<html>` 要素内でこれらのCSSクラスに依存しているすべてのコードに影響します：

* `aol`
* `camino`
* `edgeHTML` or `edge`
* `firefox`
* `flock`
* `gecko`
* `icab`
* `ie`, `ie6`, `ie7`, `ie9`, or `ie11`
* `js`
* `konqueror`
* `mac`
* `mozilla`
* `netscape`
* `opera`
* `presto`
* `safari`
* `secure`
* `touch`
* `trident`
* `webkit`
* `win`

#### コードの更新方法

`Liferay.BrowserSelectors.run()`関数を直接置き換えるものはありませんが、代わりに `<body>` 要素の新しいクラスをターゲットにするようにCSSやJavaScriptを適応させることができます。 これらのクラスは、現在使用しているブラウザを反映するために、`<body>` 要素に追加されます：

* `chrome`
* `edge`
* `firefox`
* `ie`
* `mobile`
* `other`

あるいは、`Liferay.BrowserSelectors.run()`を呼び出して、以下のコードで古いクラスを `<html>` 要素に適用することもできます：

```
<aui:script use="liferay-browser-selectors">
	Liferay.BrowserSelectors.run();
</aui:script>
```

#### 変更が行われた理由

クラスは、古いブラウザを参照するものもあり、Alloy UIに依存するレガシーなJavaScriptによって、一番上の`<html>`要素に追加されていた。 古いブラウザー参照を削除するこの変更は、サーバー側で行われるようになり、ページの読み込み時間が改善されました。

***

### ブロッキングキャッシュのサポートを削除

* **日付:** 2020年6月17日
* **JIRAチケット：** [LPS-115687](https://issues.liferay.com/browse/LPS-115687)

#### 変更点

ブロッキングキャッシュのサポートが削除されました。 これらのプロパティは、ブロッキングキャッシュを有効にするために使用できなくなりました。

* `ehcache.blocking.cache.allowed`
* `permissions.object.blocking.cache`
* `value.object.entity.blocking.cache`

#### 影響を受ける人

これは、上記のプロパティを使用するすべてのユーザーに影響します。

#### コードの更新方法

削除された機能を直接置き換えるものはありません。 それに依存するコードがある場合は、自分で実装する必要があります。

#### 変更が行われた理由

この変更は、ブロッキングキャッシュを有効にしてはならないため、パフォーマンスを向上させるために行われました。

***

### 各エンティティモデルのキャッシュプロパティ設定のサポートを削除

* **日付:** 2020年6月24日
* **JIRAチケット：** [LPS-116049](https://issues.liferay.com/browse/LPS-116049)

#### 変更点

エンティティのこれらのキャッシュプロパティを設定するためのサポートが削除されました：

* `value.object.entity.cache.enabled*`
* `value.object.finder.cache.enabled*`
* `value.object.column.bitmask.enabled*`

例えば、これらのプロパティはエンティティ `com.liferay.portal.kernel.model.User` に対するものです：

* `value.object.entity.cache.enabled.com.liferay.portal.kernel.model.User`
* `value.object.finder.cache.enabled.com.liferay.portal.kernel.model.User`
* `value.object.column.bitmask.enabled.com.liferay.portal.kernel.model.User`

#### 影響を受ける人

これは、エンティティに対して上記のプロパティを使用するすべてのユーザーに影響します。

#### コードの更新方法

削除された機能を直接置き換えるものはありません。 エンティティからこれらのプロパティを削除する必要があります。

#### 変更が行われた理由

これらのプロパティはエンティティには役に立たないため、この変更が行われました。

***

### ポータルのプロパティを "module.framework.properties.felix.fileinstall.\*"から "module.framework.properties.file.install.\*"に変更しました。

* **日付:** 2020年7月13日
* **JIRAチケット：** [LPS-115016](https://issues.liferay.com/browse/LPS-115016)

#### 変更点

"module.framework.properties.felix.fileinstall"で始まるポータルプロパティの名前が "module.framework.properties.file.install"で始まるように変更されました。

#### 影響を受ける人

これは、`module.framework.properties.felix.fileinstall.*`ポータル・プロパティ設定をオーバーライドした人に影響します。

#### コードの更新方法

`module.framework.properties.felix.fileinstall.*`で始まるプロパティの名前を、`module.framework.properties.file.install.*`で始まるプロパティに変更する。

#### 変更が行われた理由

この変更は、Apache Felix ファイルインストールのインライン化を反映するために行われました。 Liferayは現在、この機能を管理および保守しています。

***

### Elasticsearchの動的データマッピングフィールドをネストされたドキュメントに変更

* **日付:** 2020年7月27日
* **JIRAチケット：** [LPS-103224](https://issues.liferay.com/browse/LPS-103224)

#### 変更点

Elasticsearch の Dynamic Data Mapping フィールドのうち、`ddm__keyword__` と `ddm__text__` で始まるフィールドは、新しいネストされたドキュメント `ddmFieldArray` に移動された。

`ddmFieldArray`には、以下のフィールドを持つ複数のエントリがある：

* `ddmFieldName`：Dynamic Data Mapping 構造体のフィールド名を表す。 この名前は `DDMIndexer.encodeName` メソッドを用いて生成される。
* `ddmFieldValue*`：インデックス付けされたデータを含む。 このフィールドの名前は `DDMIndexer.getValueFieldName` を使って生成され、フィールドのデータ型と言語に依存する。
* `ddmValueFieldName`：インデックス化されたデータが格納されるインデックスフィールド名を表す。

Solr検索エンジンを使用している場合、この変更は適用されません。

#### 影響を受ける人

これは、Elasticsearch インデックスで `ddm__keyword__*` と `ddm__text__*` フィールドを使用してクエリを実行するカスタム開発をしている人に影響します。

#### コードの更新方法

Elasticsearch クエリでは、新しいネストされたドキュメント `ddmFieldArray` を使用する必要があります。

Liferayコードにはいくつかの例があります。 例えば、 [DDMIndexerImpl](https://github.com/liferay/liferay-portal/blob/7.3.x/modules/apps/dynamic-data-mapping/dynamic-data-mapping-service/src/main/java/com/liferay/dynamic/data/mapping/internal/util/DDMIndexerImpl.java) と [AssetHelperImpl](https://github.com/liferay/liferay-portal/blob/master/modules/apps/asset/asset-service/src/main/java/com/liferay/asset/internal/util/AssetHelperImpl.java) は `DDM_FIELD_ARRAY` 定数を使用しています。

システム設定から従来の動作を復元して、`ddm__keyword__*`フィールドと`ddm__text__*`フィールドを使い続けることもできます。

1. **System Settings** &rarr; **Dynamic Data Mapping** &rarr; **Dynamic Data Mapping Indexer** にアクセスしてください。
1. **Enable Legacy Dynamic Data Mapping Index Fields** を選択します。
1. 完全なインデックスの再構築を実行します。

#### 変更が行われた理由

この変更は、Dynamic Data Mapping 構造体が多すぎる場合に発生する **Limit of total fields has been exceeded** Elasticsearch エラーを回避するために行われました。

***

### Lexiconアイコンパスの移動

* **日付:** 2020年8月17日
* **JIRAチケット：** [LPS-115812](https://issues.liferay.com/browse/LPS-115812)

### 変更点

レキシコンのアイコンのパスが `themeDisplay.getPathThemeImages() + "/lexicon/icons.svg` から `themeDisplay.getPathThemeImages() + "/clay/icons.svg` に変更されました。

### 影響を受ける人

これは、Lexiconアイコンパスを直接使用するカスタムソリューションに影響します。 `lexicon` パス上のアイコンをビルドするための Gradle タスクは削除されます。

### コードの更新方法

パスを更新して `lexicon` ではなく `clay` を参照するようにする。

#### 変更が行われた理由

この変更は、アイコンスプライトマップへの参照を統合するために行われました。

***

### DDM永続性クラスからclassNameId関連のメソッドを削除

* **日付:** 2020年8月18日
* **JIRAチケット：** [LPS-108525](https://issues.liferay.com/browse/LPS-108525)

### 変更点

以下のクラスから `countByClassNameId`、`findByClassNameId`、`removeByClassNameId` メソッドが削除された：

* `com.liferay.dynamic.data.mapping.service.persistence.DDMStructureLinkPersistence`
* `com.liferay.dynamic.data.mapping.service.persistence.DDMStructureLinkUtil`
* `com.liferay.dynamic.data.mapping.service.persistence.DDMStructurePersistence`
* `com.liferay.dynamic.data.mapping.service.persistence.DDMStructureUtil`
* `com.liferay.dynamic.data.mapping.service.persistence.DDMTemplateLinkPersistence`
* `com.liferay.dynamic.data.mapping.service.persistence.DDMTemplateLinkUtil`

### 影響を受ける人

これは、これらのメソッドのいずれかを使用するすべてのユーザーに影響します。

### コードの更新方法

他のファインダーとカウンターのメソッドを使用できます。

#### 変更が行われた理由

これらのメソッドは、 [LPS-108525](https://issues.liferay.com/browse/LPS-108525) のソリューションの一部として削除されました。

***

### com.liferay.dynamic.data.mapping.util.BaseDDMDisplayメソッドを削除

* **日付:** 2020年8月18日
* **JIRAチケット：** [LPS-103549](https://issues.liferay.com/browse/LPS-103549)

### 変更点

`isShowAddStructureButton`メソッドが削除された。

### 影響を受ける人

これは、このメソッドを使用するすべてのユーザーに影響します。

### コードの更新方法

このメソッドの代わりに `isShowAddButton(Group scopeGroup)` メソッドを使うことができます。

#### 変更が行われた理由

このメソッドは、クリーンアップリファクタリングの一部として削除されました。

***

### ポータルプロパティview.count.enabledおよびbuffered.increment.enabledを置き換え

* **日付:** 2020-10-01
* **JIRA Ticket:** [LPS-120626](https://issues.liferay.com/browse/LPS-120626) および [LPS-121145](https://issues.liferay.com/browse/LPS-121145)

#### 変更点

ビューカウントをグローバルに、またはエンティティ専用に有効にしたり無効にしたりする機能は、ポータルプロパティから削除され、システム設定として構成されるようになりました。 ビューカウントは UI の **システム設定** &rarr; **インフラストラクチャ** &rarr; **ビューカウント** で設定するか、`com.liferay.view.count.configuration.config` という名前の設定ファイルを使って設定します。

ポータルプロパティの変更は次のとおりです。

`buffered.increment.enabled`ポータル・プロパティが削除された。 ビューカウントをグローバルに有効/無効にするには、ビューカウントページの `enabled` プロパティを使用します。

例えば、7.3の`view.count.enabled[SomeEntity]=false`や7.2の`buffered.increment.enabled[SomeEntity]=false`のように。しかし、ビューカウントページの`Disabled Class Name`の値リストにエンティティクラス名を追加することで、特定のエンティティのビューカウント動作を無効にすることができるようになりました。

#### 影響を受ける人

これは、ポータルのプロパティ `view.count.enabled=false` または `buffered.increment.enabled=false` を設定している人に影響します。

この問題は、7.3初期のバージョンで `view.count.enabled[SomeEntity]=false` 、7.2ポータルで `buffered.increment.enabled[SomeEntity]=false` というポータルのプロパティ設定を使って、あるエンティティ（例えば `SomeEntity`）のビューカウントを無効にしている人に影響します。

#### コードの更新方法

`view.count.enabled`または`buffered.increment.enabled` ポータル・プロパティと、`view.count.enabled[SomeEntity]=false`または`buffered.increment.enabled[SomeEntity]=false` のようなエンティティ固有のプロパティを削除する。

システム設定または構成ファイルを使用して、ビューカウントの動作を構成します。

**システム設定** &rarr; **インフラストラクチャ** &rarr; **ビューカウント** で、`enabled` を `false` に設定してビューカウントをグローバルに無効にするか、`enabled` を `true` に設定してビューカウントをグローバルに有効にし、`Disabled Class Name` 値リストにエンティティクラス名を追加して特定のエンティティのビューカウントを無効にします。

設定ファイルを使用するには、システム設定でビューカウントを設定し、設定を保存して、`com.liferay.view.count.configuration.config`ファイルにエクスポートします。 そのファイルを `[Liferay Home]/osgi/configs` フォルダに配置します。

#### 変更が行われた理由

この変更は、ビューカウント動作の管理を容易にするために行われました。

***

### ポータルプロパティ"module.framework.properties.file.install.optionalImportRefreshScope"を削除

* **日付:** 2020-10-11
* **JIRAチケット：** [LPS-122008](https://issues.liferay.com/browse/LPS-122008)

#### 変更点

ポータルのプロパティ `module.framework.properties.file.install.optionalImportRefreshScope` は削除されました。 ファイルのインストールでは、更新が必要なオプションのパッケージを含むバンドルをスキャンするときに、管理対象バンドルのみがチェックされるようになりました。

#### 影響を受ける人

これは、ポータル・プロパティ設定`module.framework.properties.file.install.optionalImportRefreshScope`を持っている人に影響します。

#### コードの更新方法

プロパティ `module.framework.properties.file.install.optionalImportRefreshScope` を削除しました。 他の動作を使用するようにファイルのインストールを構成することはできません。

#### 変更が行われた理由

代替動作が望まれるケースはほとんどありません。 ファイルのインストールは、バンドルをLiferayにインストールする主な方法であるため、バンドル管理のデフォルトになりました。 古い機能とその分岐ロジックを削除すると、コードの保守性と可読性が向上します。

***
