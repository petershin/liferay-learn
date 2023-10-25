---
toc:
  - ./front-end-client-extensions/tutorials.md
  - ./front-end-client-extensions/javascript-yaml-configuration-reference.md
  - ./front-end-client-extensions/theme-js-yaml-configuration-reference.md
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

```{toctree}
:maxdepth: 3

front-end-client-extensions/tutorials.md
front-end-client-extensions/javascript-yaml-configuration-reference.md
front-end-client-extensions/theme-js-yaml-configuration-reference.md
front-end-client-extensions/css-yaml-configuration-reference.md
front-end-client-extensions/theme-css-yaml-configuration-reference.md
front-end-client-extensions/theme-favicon-yaml-configuration-reference.md
front-end-client-extensions/theme-sprite-map-yaml-configuration-reference.md
front-end-client-extensions/custom-element-yaml-configuration-reference.md
front-end-client-extensions/iframe-yaml-configuration-reference.md
front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md
front-end-client-extensions/client-extensions-ui-reference.md
```

{bdg-secondary}`利用可能な Liferay 7.4`

フロントエンドクライアント拡張は、ページを拡張し、新しい機能を統合します。 CSS、JavaScript、テーマのCSS、テーマのJS、テーマのお気に入りアイコン、カスタム要素、IFrameがあります。

これらの拡張は、[Liferay Workspace](../tooling/liferay-workspace/what-is-liferay-workspace.md)から作成し、デプロイできます。

[カスタム要素](#custom-element-client-extensions) および [IFrame](#iframe-client-extensions) クライアント拡張の作成については、[カスタム要素とIFrameクライアント拡張を理解する](./front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md)を参照してください。

```{note}
レイアウトセット（ページセット）、マスターテンプレート、ページのテンプレート、個別のコンテントページに、JavaScript、CSS、テーマのCSSクライアント拡張を追加することができます。 拡張を追加するレベルによって、どのエンティティが拡張のコードを継承するかが決まります。 例えば、マスターテンプレートに拡張を追加した場合、マスターテンプレートを使用するすべてのページテンプレートとコンテントページは、その拡張を継承します。
```

## JavaScriptクライアント拡張

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ （オンプレミス）`

JavaScriptクライアント拡張は、Liferayインスタンス全体にグローバルなJavaScriptライブラリとロジックを提供します。 JavaScriptクライアント拡張をデプロイし、それを使用するようにページを設定すると、そのページにアクセスするたびに（ページのヘッダーやフッターで）そのJavaScriptが自動的に実行されます。

`client-extension.yaml`ファイルにJavaScriptクライアント拡張を指定します。

```yaml
type: globalJS
```

開始するには、 [JavaScriptクライアント拡張の使用](./front-end-client-extensions/tutorials/using-a-javascript-client-extension.md) を参照してください。

## CSS クライアント拡張

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ （オンプレミス）`

CSSクライアント拡張は、ページに新しいCSSスタイリングを導入します。 ページ上にデプロイされたCSSクライアント拡張は、テーマやスタイルブックの設定を含む、ページの既存のスタイルに追加されます。

`client-extension.yaml`ファイルにCSSクライアント拡張を指定します。

```yaml
type: globalCSS
```

開始するには、 [CSSクライアント拡張の使用](./front-end-client-extensions/tutorials/using-a-css-client-extension.md) を参照してください。

## テーマのJavaScriptクライアント拡張

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ （オンプレミス）`

[JavaScriptクライアント拡張](#javascript-client-extensions) と同様に、サイトの[テーマ](../../site-building/site-appearance/themes/introduction-to-themes.md)が提供するものに代わる JavaScriptライブラリやロジックを追加することができます。

`client-extension.yaml`ファイルに、テーマのJavaScriptクライアント拡張を指定します。

```yaml
type: themeJS
```

## テーマのCSSクライアント拡張

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ （オンプレミス）`

[CSSクライアント・エクステンション](#css-client-extensions) がページにスタイリングを追加するのに対して、テーマCSSクライアント・エクステンションは、サイトのテーマ [](../../site-building/site-appearance/themes/introduction-to-themes.md)を含むページのスタイリングを上書きする。 クライアント・エクステンションは、 `clay.css` ファイルと、 `main.css` ファイルを使用して、サイトのテーマで通常使用される同じ名前のファイルを置き換えます。

このタイプのクライアント拡張は、Liferay Applications メニューの **Client Extensions** からオプションとして追加できます。

![あなたのサイトのテーマによって提供されるCSSを置き換えるために、テーマCSSクライアント拡張機能を追加します。](./front-end-client-extensions/images/01.png)

```{note}
このタイプのクライアント拡張機能を使用するには、`clay.css` と `main.css` ファイルをリモートでホストする必要があります。
```

`client-extension.yaml`ファイルにテーマのCSSクライアント拡張を指定します。

```yaml
type: themeCSS
```

## テーマのお気に入りアイコンクライアント拡張

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ （オンプレミス）`

Liferayのページのお気に入りアイコンをオーバーライドします。 デプロイすると、提供されたアイコンファイルはLiferayのどのページでも利用可能になります。 ページデザインオプションメニューからページのお気に入りアイコンを設定する際に、別の ［**Client Extension**］ タブでアクセスすることができます。

![ページのお気に入りアイコンを設定すると、特別なクライアント拡張タブからクライアント拡張のお気に入りアイコンにアクセスすることができます。](./front-end-client-extensions/images/02.png)

## テーマのスプライトマップクライアント拡張機能

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ （オンプレミス）`

テーマのスプライトマップクライアント拡張は、サイトページのスプライトマップをオーバーライドします。 スプライトマップを`.svg`の画像として定義すると、サイトの現在のテーマで使用されているものを置き換えます。

`client-extension.yaml`ファイルに、テーマのスプライトマップクライアント拡張を指定します。

```yaml
type: themeSpritemap
```

## カスタム要素クライアント拡張

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ （オンプレミス）`

> 旧名称：カスタム要素のリモートアプリケーション

カスタム要素クライアント拡張は、Liferayのフロントエンドインフラストラクチャーを使用して、外部アプリケーションをプラットフォームと統合し、ページウィジェットとしてレンダリングします。 Liferayの外からアクセスできるあらゆるドメインのアプリケーションを統合することができます。

カスタムエレメントクライアント拡張を使用するには、必要なURLと詳細を持つエントリーを会社レベルで作成し、Liferayに登録します。 そして、Liferayは各エントリーにユニークなウィジェットを生成し、アプリケーションを [カスタムHTML要素](https://web.dev/custom-elements-v1/) としてレンダリングします。

`client-extension.yaml`ファイルにカスタム要素のクライアント拡張を指定します。

```yaml
type: customElement
```

詳しくは、[カスタム要素とIFrameクライアント拡張機能を理解する](./front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md)をご参照ください。

## IFrameクライアント拡張

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ （オンプレミス）`

> 旧名称：IFrameのリモートアプリケーション

IFrameクライアント拡張は、 [カスタム要素クライアント拡張](#custom-element-client-extensions) のように動作します。 しかし、外部アプリケーションを`<iframe>`HTML要素としてレンダリングし、ホストページからのやり取りを制限することができます。 他のフロントエンドクライアント拡張とは異なり、これらの **は静的なリソース** を提供するものではありません。

`client-extension.yaml`ファイルに IFrameクライアント拡張を指定します。

```yaml
type: iframe
```

詳しくは、[カスタム要素とIFrameクライアント拡張機能を理解する](./front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md)をご参照ください。

## フロントエンドのクライアント拡張プロパティ

これらのプロパティは、任意のフロントエンドのクライアント拡張の`client-extension.yaml`ファイルに設定します。

| 名前              | データ型  | デフォルト値                  | 説明                                                                                                |
|:--------------- |:----- |:----------------------- |:------------------------------------------------------------------------------------------------- |
| `baseURL`       | 文字列   | **サイトURLから派生** | クライアント拡張の定義されたすべてのリソースが提供される基本パスです。                                                               |
| `description`   | 文字列   |                         | クライアント拡張の説明                                                                                       |
| `name`          | 文字列   |                         | クライアント拡張の名前（UIに表示されるもの）。 フロントエンドクライアント拡張には名前が必要です。                                                |
| `sourceCodeURL` | URL   | https://www.liferay.com | クライアント拡張のソースリポジトリへのアドレス。                                                                          |
| `typeSettings`  | 文字列[] | []                      | Liferayの`UnicodeProperties`の構文で処理される文字列のリスト。 タイプ固有のクライアント拡張のプロパティは、クライアント拡張のビルド時に自動的にこの中にコピーされます。 |

詳しくは、 [`client-extension.yaml`でのクライアント拡張の設定](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml) を参照してください。

## 関連トピック

* [クライアント拡張の概要](../client-extensions.md)
* [カスタム要素とIFrameクライアント拡張機能を理解する](./front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md)
* [JavaScriptクライアント拡張の使用](./front-end-client-extensions/tutorials/using-a-javascript-client-extension.md)
* [CSSクライアント拡張の使用](./front-end-client-extensions/tutorials/using-a-css-client-extension.md)
