---
toc:
  - ./front-end-client-extensions/tutorials.md
  - ./front-end-client-extensions/javascript-yaml-configuration-reference.md
  - ./front-end-client-extensions/css-yaml-configuration-reference.md
  - ./front-end-client-extensions/theme-css-yaml-configuration-reference.md
  - ./front-end-client-extensions/theme-favicon-yaml-configuration-reference.md
  - ./front-end-client-extensions/theme-sprite-map-yaml-configuration-reference.md
  - ./front-end-client-extensions/custom-element-yaml-configuration-reference.md
  - ./front-end-client-extensions/iframe-yaml-configuration-reference.md
  - ./front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md
  - ./front-end-client-extensions/client-extensions-ui-reference.md
---
# フロントエンドのクライアント拡張

{bdg-secondary}`liferay DXP 7.4 (self-hosted)`   {bdg-secondary}`Liferay Experience Cloud (SaaS)`   {bdg-unsupported}`Liferay Cloud：セルフマネージド`

フロントエンドクライアント拡張は、ページを拡張し、新しい機能を統合します。 利用可能なタイプには、CSS、JavaScript、テーマCSS、テーマファビコン、カスタム要素、IFrameがあります。

これらのエクステンションは [Liferay Workspace](../tooling/liferay-workspace/what-is-liferay-workspace.md) から作成およびデプロイできます。

[カスタム要素](#custom-element-client-extensions) と [IFrame](#iframe-client-extensions) クライアント拡張の作成については、 [カスタム要素と IFrame クライアント拡張を理解する](./front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) を参照してください。

```{note}
レイアウトセット（ページセット）、マスターテンプレート、ページのテンプレート、個別のコンテントページに、JavaScript、CSS、テーマのCSSクライアント拡張を追加することができます。 拡張を追加するレベルによって、どのエンティティが拡張のコードを継承するかが決まります。 例えば、マスターテンプレートに拡張を追加した場合、マスターテンプレートを使用するすべてのページテンプレートとコンテントページは、その拡張を継承します。
```

## JavaScript クライアント拡張

JavaScriptクライアント拡張は、Liferayインスタンス全体にグローバルなJavaScriptライブラリとロジックを提供します。 JavaScriptクライアント拡張をデプロイし、それを使用するようにページを設定すると、そのページにアクセスするたびに（ページのヘッダーやフッターで）そのJavaScriptが自動的に実行されます。

`client-extension.yaml`ファイルにJavaScriptクライアント拡張子を指定する：

```yaml
type: globalJS
```

[JavaScriptクライアント拡張の使用](./front-end-client-extensions/tutorials/using-a-javascript-client-extension.md) を参照してください。

## CSS クライアント拡張

CSSクライアント拡張は、ページに新しいCSSスタイリングを導入します。 ページ上にデプロイされたCSSクライアント拡張は、テーマやスタイルブックの設定を含む、ページの既存のスタイルに追加されます。

`client-extension.yaml`ファイルにCSSクライアント拡張子を指定する：

```yaml
type: globalCSS
```

[CSSクライアント拡張の使用](./front-end-client-extensions/tutorials/using-a-css-client-extension.md) を参照してください。

## テーマのCSSクライアント拡張

[CSSクライアント・エクステンション](#css-client-extensions) がページにスタイリングを追加するのに対し、テーマCSSクライアント・エクステンションは、サイトのテーマ [](../../site-building/site-appearance/themes/introduction-to-themes.md) を含むページのスタイリングを上書きする。 クライアント拡張機能では、`clay.css`ファイルと`main.css`ファイルを使用して、サイトのテーマで通常使用される同じ名前のファイルを置き換えます。

このタイプのクライアント拡張機能は、Liferay Applicationsメニューの **Client Extensions** からオプションとして追加できます。

![Add a theme CSS client extension to replace CSS provided by your site's theme.](./front-end-client-extensions/images/01.png)

```{note}
このタイプのクライアント拡張機能を使用するには、`clay.css` と `main.css` ファイルをリモートでホストする必要があります。

このクライアントエクステンションはテーマに含まれるデフォルトのCSSを完全に置き換えるので、Liferayで使用するアウトオブボックスウィジェットには、 [Clay styling](https://clayui.com/docs/css/index.html) 。 あるいは、特定の Liferay ウィジェットのスタイルを固定するには、コンテナ要素の Advanced タブで `cadmin` CSS クラスを含むコンテナでウィジェットをラップします。
```

`client-extension.yaml`ファイルにTheme CSSクライアントの拡張子を指定します：

```yaml
type: themeCSS
```

## テーマのお気に入りアイコンクライアント拡張

Liferayのページのお気に入りアイコンをオーバーライドします。 デプロイすると、提供されたアイコンファイルはLiferayのどのページでも利用可能になります。 ページデザインオプションメニューからページのファビコンを設定する際に、別の **クライアント拡張機能** タブでアクセスできます。

![When you configure the favicon for a page, access the favicon from your client extension from a special Client Extensions tab.](./front-end-client-extensions/images/02.png)

## テーマのスプライトマップクライアント拡張機能

テーマのスプライトマップクライアント拡張は、サイトページのスプライトマップをオーバーライドします。 スプライトマップを `.svg` 画像として定義すると、現在のテーマで使用されているスプライトマップを置き換えることができます。

`client-extension.yaml`ファイルにテーマスプライトマップクライアントの拡張子を指定します：

```yaml
type: themeSpritemap
```

## カスタム要素クライアント拡張

> 旧名称：カスタム要素のリモートアプリケーション

カスタム要素クライアント拡張は、Liferayのフロントエンドインフラストラクチャーを使用して、外部アプリケーションをプラットフォームと統合し、ページウィジェットとしてレンダリングします。 Liferayの外からアクセスできるあらゆるドメインのアプリケーションを統合することができます。

カスタムエレメントクライアント拡張を使用するには、必要なURLと詳細を持つエントリーを会社レベルで作成し、Liferayに登録します。 そして、Liferayは各エントリーにユニークなウィジェットを生成し、 [カスタムHTML要素](https://web.dev/custom-elements-v1/) としてアプリケーションをレンダリングします。

`client-extension.yaml`ファイルにカスタム要素のクライアント拡張子を指定する：

```yaml
type: customElement
```

詳しくは、 [カスタム要素とIFrameクライアント拡張機能を理解する](./front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) を参照してください。

## IFrameクライアント拡張

> 旧名称：IFrameのリモートアプリケーション

IFrameクライアント拡張機能は、 [カスタム要素クライアント拡張機能](#custom-element-client-extensions) のように動作します。 しかし、外部アプリケーションは`<iframe>`HTML要素としてレンダリングされ、ホストページからのインタラクションを制限することができる。 他のフロントエンドクライアント拡張とは異なり、これらは **静的リソース** を提供しない。

IFrameクライアントの拡張子を`client-extension.yaml`ファイルで指定する：

```yaml
type: iframe
```

詳しくは、 [カスタム要素とIFrameクライアント拡張機能を理解する](./front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) を参照してください。

## フロントエンドのクライアント拡張プロパティ

これらのプロパティは、任意のフロントエンドクライアント拡張の `client-extension.yaml` ファイルに設定します：

| 名前              | データ型                                                      | デフォルト値                                                 | 説明                                                                                                  |
| :-------------- | :-------------------------------------------------------- | :----------------------------------------------------- | :-------------------------------------------------------------------------------------------------- |
| `baseURL`       | 文字列                                                       | **サイトURLから派生** | クライアント拡張の定義されたすべてのリソースが提供される基本パスです。                                                                 |
| `description`   | 文字列                                                       |                                                        | クライアント拡張の説明                                                                                         |
| `name`          | 文字列                                                       |                                                        | クライアント拡張の名前（UIに表示されるもの）。 フロントエンドクライアント拡張には名前が必要です。                                                  |
| `sourceCodeURL` | URL                                                       | https://www.liferay.com                              | クライアント拡張のソースリポジトリへのアドレス。                                                                            |
| `typeSettings`  | 文字列[] | [] | Liferay の `UnicodeProperties` 構文で処理される文字列のリスト。 タイプ固有のクライアント拡張のプロパティは、クライアント拡張のビルド時に自動的にこの中にコピーされます。 |

詳しくは、 [`client-extension.yaml`](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml) のクライアント拡張の設定を参照してください。

## 関連トピック

* [クライアント拡張機能の紹介](../client-extensions.md)
* [カスタムエレメントとIFrameクライアント拡張機能を理解する](./front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md)
* [JavaScriptクライアント拡張機能の使用](./front-end-client-extensions/tutorials/using-a-javascript-client-extension.md)
* [CSSクライアント拡張機能を使う](./front-end-client-extensions/tutorials/using-a-css-client-extension.md)
