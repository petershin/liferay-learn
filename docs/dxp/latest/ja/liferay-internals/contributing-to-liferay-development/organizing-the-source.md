# Organizing the Source

Liferayのソースがどのように構成されているかをしっかりと理解することは、バグ修正や新機能の追加に取り組む際に重要です。 Liferay Sourceは、プラットフォームが提供する様々なフレームワークの完全な実装を提供するため、カスタムプロジェクトを構築する際の大きな参考資料にもなります。

Liferay Sourceは、2つの主要な領域を使用して構成されるようになりました。

* **Portal Core** - オリジナルのプラットフォームの一部で、今のところモジュールに抽出されていないものです。 これらは Liferay 6.2 でおなじみの portal-impl, portal-service, portal-web のような名前を持っています。
* **モジュール** - 多くの機能がモジュールとして抽出され、 *liferay-portal/modules* ディレクトリに常駐するようになりました。 多くのモジュールは Liferay MVC パターンに従っており、関連する .api, .service, .web モジュールに整理されています。

## 詳細情報

Liferay Sourceで使われているいくつかのパターンをより深く理解するために、公式LiferayドキュメントのDeveloping a Web Applicationチュートリアルを必ず読んでください。

## ブログウィジェット

次の例では、すぐに使えるBlogsウィジェットを使って、そのアプリケーションに関連するパターンをいくつか紹介し、コード内の特定のセクションのドキュメントへのリンクも提供します。

## ブログポートレット

`liferay-portal/modules/apps/blogs/blogs-web/src/main/java/
com/liferay/blogs/web/internal/portlet/BlogsPortlet.java`

*BlogsPortlet* は Liferay MVC パターンに従っており、Blogs Widget のメインエントリポイントです。 一つ注意すべきことは、BlogsPortletクラスはビューテンプレートのinitパラメータをリストアップしていないことです。 詳しくは次の通りです。

詳細については、 [Liferay MVC docs](https://help.liferay.com/hc/ja/articles/360029028191-Liferay-MVC-Portlet) を参照してください。

## BlogsViewMVCRenderCommand

`liferay-portal/modules/apps/blogs/blogs-web/src/main/java/
com/liferay/blogs/web/internal/portlet/BlogsViewMVCRenderCommand.java`

ポートレットコンポーネントが *view-template*をリストアップしていない場合、これは通常、MVCRenderCommandがエントリ.jspファイルにディスパッチしていることを意味します。 *BlogsViewMVCRenderCommand* */blogs/view.jsp* /と/blogs/viewの両方へのディスパッチを処理する。

## ビュー.jsp

`liferay-portal/modules/apps/blogs/blogs-web/src/main/resources
/META-INF/resources/blogs/view.jsp`

ブログウィジェットのuiのメインエントリポイントを提供します。 チュートリアルのDeveloping a Web Applicationには、初歩的なJSP開発のための素晴らしい例があります。

## アセットレンダラー

`liferay-portal/modules/apps/blogs/blogs-web/src/main/java/
com/liferay/blogs/web/asset/model`

アセットレンダラーは、アセットフレームワークの一部で、アセットパブリッシングを使用してアセットをレンダリングするために使用されます。

## パネルエントリー

`liferay-portal/modules/apps/blogs/blogs-web/src/main/java/
com/liferay/blogs/web/internal/application/list/BlogsPanelApp.java`

パネルエントリにより、製品メニューにウィジェットを追加し、プロジェクトに管理画面を持たせることができます。

## Configuration (Automatic Copy)

`liferay-portal/modules/apps/blogs/blogs-web/src/main/java/
com/liferay/blogs/web/internal/configuration/BlogsPortletInstanceConfiguration.java`

コンフィギュレーションコンポーネントを使用して、システム設定に設定可能なパラメータを追加します。 これにより、すぐに使える機能を使って、簡単にプロジェクトを設定できるようになります

## スケジューラー

`liferay-portal/modules/apps/blogs/blogs-web/src/main/java/
com/liferay/blogs/web/internal/messaging/CheckEntryMessageListener.java`

あらゆるアプリケーションにスケジュールタスクを追加できます。 これは、アプリケーション内で定期的に実行する必要があるものがある場合に便利です。

## FriendlyURL

`liferay-portal/modules/apps/blogs/blogs-web/src/main/java/
com/liferay/blogs/web/internal/portlet/route/BlogsFriendlyURLMapper.java`

Friendly URLは、アプリケーションがレンダーとアクションのURLに、よりSEOに適したURLを使用できるようにするものです。

## ダイナミックインクルード

`liferay-portal/modules/apps/blogs/blogs-web/src/main/java/
com/liferay/blogs/web/internal/servlet/taglib/BlogsPortletHeaderJSPDynamicInclude.java`

Dynamic includeは、Fragment bundleを使用せずにUIをカスタマイズできるため、アップグレードフレンドリーです。

## アプリケーションディスプレイテンプレート

`liferay-portal/modules/apps/blogs/blogs-web/src/main/java/
com/liferay/blogs/web/internal/template/BlogsPortletDisplayTemplateHandler.java`

アプリケーション表示テンプレートは、標準的なJSPを使用する代わりに、Freemarkerのテンプレートを使用することができます。 このため、JSPを直接カスタマイズするよりも、ADTの方がアップグレードに適しています。

## アプリケーション表示テンプレートサンプル

`/Users/jamie/Repos/liferay-portal/modules/apps/blogs/blogs-web/src/main/resources/
com/liferay/blogs/web/template/dependencies/portlet_display_template_basic.ftl`

多くのアプリケーションには、基本的なアプリケーション表示テンプレートが付属しており、これを利用することで、より簡単に使い始めることができます。 例えば、blogsウィジェットには、ブログのエントリーをリストアップする基本的なテンプレートが付属しており、JSPの対応するものと類似しています。

これらは、ブログウィジェットで使用されているフレームワークのほんの一部です。 このほかにも、コード全体を通してさまざまなものがあります。 モジュールの下にある他のウィジェットの多くも、これと同じパターンを使用しています。 ですから、一つのウィジェットがどのように構成されているかを学べば、レポの中でほとんどのコードがどのように構成されているかを誰でも理解できるようになります。