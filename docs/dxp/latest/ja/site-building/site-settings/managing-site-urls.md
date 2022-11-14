---
toc:
- ./managing-site-urls/configuring-your-sites-friendly-url.md
- ./managing-site-urls/configuring-virtual-hosts-site-urls.md
- ./managing-site-urls/using-the-redirection-tool.md
- ./managing-site-urls/using-pattern-redirects.md
---
# サイトURLの管理

```{toctree}
:maxdepth: 3

managing-site-urls/configuring-your-sites-friendly-url.md
managing-site-urls/configuring-virtual-hosts-site-urls.md
managing-site-urls/using-the-redirection-tool.md
managing-site-urls/using-pattern-redirects.md

```

Liferay DXPは、サイトURLを設定・管理するための複数の機能をすぐに利用することができます。

## バーチャルホストのサイトURL

Liferayサーバーにバーチャルホストを設定し、ドメイン名（例： `www.helloworld.com`）とサブドメイン名（例： `developers.helloworld.com`）をサイトに接続します。 このようにして、1つのLiferay DXPサーバーで複数の別々のサイトをホストすることができます。 詳細は、 [仮想ホストサイトURLの設定](./managing-site-urls/configuring-virtual-hosts-site-urls.md)を参照してください。

## フレンドリーなURL

ユーザーが素早くアクセスできるように、フレンドリーなURLを定義する。 Liferayサーバー上の各フレンドリーなURLは一意でなければならず、 `https://[server:port]/web` に付加されます（例： `https://localhost:8080/web/hello-world/`)。 詳細は、[サイトのフレンドリーURLの設定](./managing-site-urls/configuring-your-sites-friendly-url.md)を参照してください。

```{note}
また、ページやドキュメントにフレンドリーなURLを設定することも可能です。 詳しくは、[ページのフレンドリーURLの設定](../creating-pages/page-settings/configuring-your-pages-friendly-url.md)と［文書のURLの設定](../../content-authoring-and-management/documents-and-media/uploading-and-managing/configuring-document-urls.md) をご覧ください。
```

## サイトリダイレクト

サイトのURLリダイレクトを設定することで、404を回避し、ユーザーエクスペリエンスを向上させることができます。 Liferay DXP では、エイリアスリダイレクトとパターンリダイレクトの 2 種類のリダイレクトを定義することができます。

**Alias Redirects** : このリダイレクトは、絶対的なソースURLと絶対的なデスティネーションURLを明示的に定義するものです。 そのため、より予測しやすく、ほとんどのユースケースで推奨されています。 あなたのサイトにエイリアスリダイレクトを設定する手順については、 [リダイレクトツールの使用](./managing-site-urls/using-the-redirection-tool.md) を参照してください。

**パターンリダイレクト** {bdg-secondary}`7.4 U42+/GA42+`: これらのリダイレクトは、正規表現を用いてソースURLとその置換のパターンを定義します。 このため、URLのファミリーを素早くマッチングさせるのに最適な方法です。 しかし、正規表現によっては、エイリアスリダイレクトよりも遅くなり、意図した以上のURLマッチが発生することがあります。 あなたのサイトでの設定方法については、 [パターンリダイレクトの使用](./managing-site-urls/using-pattern-redirects.md) を参照してください。

## 404 URL

リダイレクトツールを使用して、404エラーにつながるサイトリクエストを追跡・管理します。 有効にすると、Liferay DXPは各404エラーをカタログ化するので、問題を評価し、迅速に解決することができます。 詳細と利用可能な設定オプションについては、 [リダイレクトツールの使用](./managing-site-urls/using-the-redirection-tool.md) を参照してください。

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} あなたのサイトのフレンドリーURLを設定する
:link: ./managing-site-urls/configuring-your-sites-friendly-url.md
:::

:::{grid-item-card} バーチャルホストのサイトURLの設定
:link: ./managing-site-urls/configuring-virtual-hosts-site-urls.md
:::

:::{grid-item-card} リダイレクトツールの使用
:link: ./managing-site-urls/using-the-redirection-tool.md
:::

:::{grid-item-card} パターンリダイレクトの利用
:link: ./managing-site-urls/using-pattern-redirects.md
:::
::::
