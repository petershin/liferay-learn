---
toc:
  - ./managing-site-urls/configuring-your-sites-friendly-url.md
  - ./managing-site-urls/configuring-virtual-hosts-site-urls.md
  - ./managing-site-urls/setting-up-redirects-and-404-tracking.md
---
# サイトURLの管理

Liferay DXPでは、サイトURLを設定・管理するための複数の機能を追加設定なしで利用することができます。

## バーチャルホストのサイトURL

Liferayサーバーにバーチャルホストを設定し、ドメイン名（例： `www.helloworld.com`）とサブドメイン名（例： `developers.helloworld.com`）をサイトに接続します。 このようにして、1つのLiferay DXPサーバーで複数の別々のサイトをホストすることができます。 詳細は、[バーチャルホストのサイトURLの設定](./managing-site-urls/configuring-virtual-hosts-site-urls.md)を参照してください。

## フレンドリURL

フレンドリURLを定義し、ユーザーがサイトにすばやくアクセスできるようにします。 Liferayサーバー上の各フレンドリURLは一意でなければならず、`https://[server:port]/web` に追加されます（例： `https://localhost:8080/web/hello-world/`)。 詳細は、[サイトのフレンドリURLを設定する](./managing-site-urls/configuring-your-sites-friendly-url.md)を参照してください。

```{note}
また、ページやドキュメントにフレンドリURLを設定することも可能です。 詳しくは、[ページのフレンドリURLの設定](../creating-pages/page-settings/configuring-your-pages-friendly-url.md)と[ドキュメントURLの設定](../../content-authoring-and-management/documents-and-media/uploading-and-managing/configuring-document-urls.md)をご覧ください。
```

## サイトリダイレクト

サイトのURLリダイレクトを設定することで、404を回避し、ユーザーエクスペリエンスを向上させます。 Liferay DXPでは、エイリアスリダイレクトとパターンリダイレクトの 2 種類のリダイレクトを定義できます。

**エイリアスリダイレクト** : このリダイレクトは、絶対的なソースURLと絶対的な行先URLを明示的に定義するものです。 このため、ほとんどのユースケースにおいて、より予測しやすく、推奨されています。 あなたのサイトにエイリアスリダイレクトを設定する方法については、[エイリアスリダイレクトの使用](./managing-site-urls/setting-up-redirects-and-404-tracking/using-alias-redirects.md)を参照してください。

**パターンリダイレクト** {bdg-secondary}`7.4 U42+/GA42+`: これらのリダイレクトは、正規表現を用いてソースURLとその置換のパターンを定義します。 このため、URLのファミリーをすばやく一致させるのに使用するのが最適です。 しかし、正規表現によっては、エイリアスリダイレクトよりも遅くなり、意図した以上のURL一致が発生することがあります。 ご自身のサイトでの設定方法については、[パターンリダイレクトの使用](./managing-site-urls/setting-up-redirects-and-404-tracking/using-pattern-redirects.md)を参照してください。

## 404 URL

リダイレクトツールを使用して、404エラーにつながるサイトリクエストを追跡・管理します。 有効にすると、Liferay DXPは各404エラーをカタログ化するので、問題を評価し、迅速に解決することができます。 詳細情報と利用可能な設定オプションについては、[404 URLの追跡](./managing-site-urls/setting-up-redirects-and-404-tracking/tracking-404-urls.md)を参照してください。


