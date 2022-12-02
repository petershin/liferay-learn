---
toc:
- ./browser-based-client-extensions/tutorials.md
- ./browser-based-client-extensions/understanding-custom-element-and-iframe-client-extensions.md
- ./browser-based-client-extensions/remote-applications-ui-reference.md
---
# ブラウザベースのクライアント拡張機能

```{toctree}
:maxdepth: 3

browser-based-client-extensions/tutorials.md
browser-based-client-extensions/understanding-custom-element-and-iframe-client-extensions.md
browser-based-client-extensions/remote-applications-ui-reference.md
```

{bdg-secondary}`利用可能な Liferay 7.4 U45+/GA45+`

Liferayは、ページを補強し機能を統合するための、ブラウザベースの様々なクライアント拡張機能を提供します。 これらの拡張機能には、CSS、JS、テーマCSS、テーマFavicon、カスタム要素、IFrameが含まれます。

これらのエクステンションは [Liferay Workspace](../tooling/liferay-workspace/what-is-liferay-workspace.md)から作成し、デプロイすることができます。 これらのブラウザベースのクライアント拡張の基本バージョンを生成するには、Liferayワークスペースの [Blade CLI](../tooling/blade-cli.md) を使って次のコマンドを実行します。

```bash
blade create -t client-extension [your-new-folder-name]
```

[カスタム要素](#custom-element-client-extensions) と [IFrame](#iframe-client-extensions) クライアント拡張の作成については、 [カスタム要素および IFrame クライアント拡張を理解する](./browser-based-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) を参照してください。

```{note}
レイアウトセット（＝ページセット）、マスターテンプレート、ページテンプレート、個々のコンテンツページに、JS、CSS、テーマCSSのクライアント拡張機能を追加することができます。 拡張機能を追加するレベルにより、どのエンティティが拡張機能のコードを継承するかが決まります。 例えば、マスターテンプレートに拡張機能を追加した場合、マスターテンプレートを使用しているすべてのページテンプレートとコンテンツページは、その拡張機能を継承します。
```

## JavaScript クライアント拡張

JavaScriptのクライアント拡張機能は、最もわかりやすく、簡単に作ることができます。 JavaScriptクライアント拡張をLiferayインスタンスにデプロイし、それを使用するようにページを設定すると、そのページにアクセスするたびに、それに含まれるJavaScriptが自動的に実行されます。 これにより、OSGiモジュールやテーマを使用せずに、ページに特別な機能を追加することができます。

このタイプの作業を始めるには、 [最初のJavaScriptクライアント拡張を作成する](./browser-based-client-extensions/tutorials/creating-your-first-javascript-client-extension.md) を参照してください。

## CSS クライアント拡張

CSSクライアント拡張は、ページ上のCSSスタイリングを上書きする方法です。 CSSクライアント拡張をLiferayインスタンスにデプロイし、それを使用するようにページを設定すると、それに含まれるCSSが、テーマやスタイルブックの設定など、ページに存在するスタイリングを上書きします。

このタイプの作業を始めるには、 [最初のCSSクライアントエクステンションを作成する](./browser-based-client-extensions/tutorials/creating-your-first-css-client-extension.md) を参照してください。

## テーマCSSクライアントエクステンション

CSSクライアントエクステンションと同様に、テーマ全体を展開することなく、 [テーマ](../../site-building/site-appearance/themes/introduction-to-themes.md) と同じ方法でCSSを追加することも可能です。 このタイプのクライアント拡張機能では、 `clay.css` ファイルと `main.css` ファイルを使用します。これは、デフォルトでテーマによって生成されるスタイルファイルと同じものです。 このタイプのクライアント拡張は、Liferayアプリケーションメニューの **Remote Apps** からオプションとして追加できます。

![テーマCSSクライアント拡張機能を追加すると、テーマそのものはそのままで、テーマと同じようにCSSをページに適用することができます。](./browser-based-client-extensions/images/01.png)

```{note}
このタイプのクライアント拡張機能を使用するには、`clay.css` と `main.css` ファイルがリモートでホストされている必要があります。
```

## テーマファビコンクライアントエクステンション

また、クライアントエクステンションを使用して、Liferayのページのファビコンを上書きすることができます。 テーマのファビコンクライアント拡張をデプロイすると、それに含まれるアイコンファイルがLiferayのあらゆるページで利用可能になります。 ページデザインオプションメニューからページのファビコンを設定する際に、別の **Client Extensions** タブでアクセスすることができます。

![ページのファビコンを設定する際、クライアント拡張機能から特別なクライアント拡張機能タブからファビコンにアクセスします。](./browser-based-client-extensions/images/02.png)

## カスタム要素クライアント拡張機能

> 旧製品名：カスタムエレメントリモートアプリ

カスタム要素クライアント拡張は、Liferayのフロントエンドインフラを使用して、外部アプリケーションをプラットフォームと統合し、ページウィジェットとしてレンダリングします。 Liferayの外からアクセスできるあらゆるドメインのアプリケーションを統合することができます。

カスタム要素クライアント拡張を使用するには、Liferayに登録するために必要なURLと詳細情報を持つエントリーを会社レベルで作成します。 そして、Liferay は各エントリに対してユニークなウィジェットを生成し、アプリケーションを [カスタム HTML 要素としてレンダリングします。](https://web.dev/custom-elements-v1/) .

詳しくは、 [カスタムエレメントとIFrameクライアント拡張機能を理解する](./browser-based-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) を参照してください。

## IFrameクライアント拡張機能

> 旧製品名：IFrame Remote Apps

IFrame クライアント拡張は、 [カスタム要素クライアント拡張と同様に動作します](#custom-element-client-extensions) 。 しかし、外部アプリケーションを `<iframe>` HTML 要素としてレンダリングし、ホストページからのインタラクションを制限することができます。 詳しくは、 [カスタムエレメントとIFrameクライアント拡張機能を理解する](./browser-based-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) を参照してください。

## 追加情報

* [クライアントエクステンションの紹介](../client-extensions.md)
* [最初のJavaScriptクライアント拡張を作成する](./browser-based-client-extensions/tutorials/creating-your-first-javascript-client-extension.md)
* [最初のCSSクライアントエクステンションを作成する](./browser-based-client-extensions/tutorials/creating-your-first-css-client-extension.md)
* [カスタムエレメントとIFrameクライアント拡張機能を理解する](./browser-based-client-extensions/understanding-custom-element-and-iframe-client-extensions.md)
