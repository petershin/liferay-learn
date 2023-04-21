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
- ./front-end-client-extensions/remote-applications-ui-reference.md
---
# フロントエンドのクライアント拡張機能

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
front-end-client-extensions/remote-applications-ui-reference.md
```

{bdg-secondary}`利用可能 Liferay 7.4 U45+/GA45+`

フロントエンドクライアントエクステンションは、ページを拡張し、新しい機能を統合します。 CSS、JavaScript、テーマCSS、テーマJS、テーマファビコン、カスタム要素、IFrameがあります。

これらのエクステンションは [Liferay Workspace](../tooling/liferay-workspace/what-is-liferay-workspace.md)から作成し、デプロイすることができます。

[カスタム要素](#custom-element-client-extensions) および [IFrame](#iframe-client-extensions) クライアント拡張の作成については、「 [カスタム要素および IFrame クライアント拡張を理解する」](./front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) を参照してください。

```{note}
レイアウトセット(＝ページセット）、マスターテンプレート、ページテンプレート、個別コンテンツページに、JavaScript、CSS、Theme CSSクライアント拡張を追加することができます。 拡張機能を追加するレベルによって、どのエンティティが拡張機能のコードを継承するかが決まります。 例えば、マスターテンプレートに拡張機能を追加した場合、マスターテンプレートを使用するすべてのページテンプレートとコンテンツページは、その拡張機能を継承する。
```

## JavaScript クライアント拡張

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ (オンプレミス）`

JavaScriptクライアントエクステンションは、Liferayインスタンス全体にグローバルなJavaScriptライブラリとロジックを提供します。 JavaScriptクライアント拡張を導入し、それを使用するようにページを設定すると、そのページにアクセスするたびに(ページのヘッダーやフッターで）そのJavaScriptが自動的に実行されます。

`client-extension.yaml` ファイルに JavaScript クライアント拡張機能を指定します：

```yaml
type: globalJS
```

[JavaScriptクライアントエクステンションの使用](./front-end-client-extensions/tutorials/using-a-javascript-client-extension.md) を参照してください。

## CSS クライアント拡張

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ (オンプレミス）`

CSSクライアント拡張は、ページに新しいCSSスタイリングを導入します。 ページ上に配置されたCSSクライアント拡張は、テーマやスタイルブックの設定を含む、ページの既存のスタイルに追加されます。

`client-extension.yaml` ファイルに CSS クライアント拡張子を指定します：

```yaml
type: globalCSS
```

[Using CSS Client Extension](./front-end-client-extensions/tutorials/using-a-css-client-extension.md) を参照してください。

## テーマJavaScriptクライアント拡張機能

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ (オンプレミス）`

[JavaScript クライアント拡張](#javascript-client-extensions) と同様に、サイトの [テーマ](../../site-building/site-appearance/themes/introduction-to-themes.md)が提供するものに代わる JavaScript ライブラリやロジックを追加することができます。

`client-extension.yaml` ファイルに、Theme JavaScript クライアント拡張を指定します：

```yaml
type: themeJS
```

## テーマCSSクライアントエクステンション

{bdg-secondary`Liferay Experience Cloud and Liferay DXP 7.4+ (on-premises)`

[CSSクライアント拡張](#css-client-extensions) がページにスタイルを追加するのに対し、テーマCSSクライアント拡張はサイトのテーマ [からも含めてページのスタイルをオーバーライドします](../../site-building/site-appearance/themes/introduction-to-themes.md). クライアント拡張機能は、 `clay.css` ファイルと `main.css` ファイルを使用して、サイトのテーマで通常使用される同じ名前のファイルを置き換えます。

このタイプのクライアントエクステンションは、Liferay Applicationsメニューの **Client Extensions** からオプションとして追加することができます。

![Add a theme CSS client extension to replace CSS provided by your site's theme.](./front-end-client-extensions/images/01.png)

```{note}
このタイプのクライアント拡張機能を使用するには、`clay.css` と `main.css` ファイルがリモートでホストされている必要があります。
```

`client-extension.yaml` ファイルに Theme CSS クライアント拡張子を指定します：

```yaml
type: themeCSS
```

## テーマファビコンクライアント拡張機能

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ (オンプレミス）`

Liferayのページのファビコンをオーバーライドします。 デプロイすると、提供されたアイコンファイルはLiferayのどのページでも利用可能になります。 ページデザインオプションメニューからページのファビコンを設定する際に、別の **Client Extensions** タブでアクセスすることができます。

![ページのファビコンを設定すると、特別なクライアントエクステンションタブからクライアントエクステンションのファビコンにアクセスすることができます。](./front-end-client-extensions/images/02.png)

## テーマ・スプライトマップ・クライアント拡張機能

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ (オンプレミス）`

テーマスプライトマップクライアント拡張は、サイトページのスプライトマップをオーバーライドします。 スプライトマップを `.svg` の画像として定義し、サイトの現在のテーマで使用されているものを置き換えます。

`client-extension.yaml` ファイルに、テーマ・スプライト・マップ・クライアント拡張を指定します：

```yaml
type: themeSpritemap
```

## カスタムエレメントクライアントエクステンション

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ (オンプレミス）`

> 旧名称：Custom Element Remote App

カスタム要素クライアント拡張は、Liferayのフロントエンドインフラストラクチャを使用して、外部アプリケーションをプラットフォームと統合し、ページウィジェットとしてレンダリングします。 Liferayの外からアクセスできるあらゆるドメインのアプリケーションを統合することができます。

カスタムエレメントクライアント拡張を使用するには、必要なURLと詳細を持つエントリーを会社レベルで作成し、Liferayに登録します。 そして、Liferayは各エントリーにユニークなウィジェットを生成し、アプリケーションを [カスタムHTML要素](https://web.dev/custom-elements-v1/) としてレンダリングします。

`client-extension.yaml` ファイルにカスタムエレメントのクライアント拡張子を指定します：

```yaml
type: customElement
```

詳しくは、 [カスタム要素とIFrameクライアント拡張機能を理解する](./front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) をご参照ください。

## IFrameクライアント拡張機能

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ (オンプレミス）`

> 旧名称：IFrame Remote Apps

IFrame クライアント拡張は、 [カスタム要素クライアント拡張](#custom-element-client-extensions) のように動作します。 しかし、外部アプリケーションを `<iframe>` HTML要素としてレンダリングし、ホストページからの操作を制限することができます。 他のフロントエンドクライアント拡張機能とは異なり、これらの **は静的なリソース** を提供するものではありません。

`client-extension.yaml` ファイルに IFrame クライアント拡張を指定します：

```yaml
type: iframe
```

詳しくは、 [カスタム要素とIFrameクライアント拡張機能を理解する](./front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) をご参照ください。

## フロントエンドクライアントエクステンションプロパティ

これらのプロパティは、任意のフロントエンドクライアント拡張の `client-extension.yaml` ファイルに設定します：

| 名前              | データ型     | デフォルト値                  | 説明                                                                                                                 |
|:--------------- |:-------- |:----------------------- |:------------------------------------------------------------------------------------------------------------------ |
| `baseURL`       | 文字列      | **サイトURLから派生したもの** | クライアントエクステンションの定義されたすべてのリソースが提供されるベースパスです。                                                                         |
| `description`   | 文字列      |                         | クライアントエクステンションの説明です。                                                                                               |
| `name`          | 文字列      |                         | クライアントエクステンションの名前(UIに表示されるもの）です。 フロントエンドクライアントエクステンションには名前が必要です。                                                   |
| `sourceCodeURL` | URL      | https://www.liferay.com | クライアントエクステンションのソースリポジトリへのアドレスです。                                                                                   |
| `typeSettings`  | 文字列[]の場合 | []                      | Liferay の `UnicodeProperties` の構文で処理される文字列のリストです。 タイプ固有のクライアントエクステンションのプロパティは、クライアントエクステンションのビルド時に自動的にこの中にコピーされます。 |

[Client Extension の設定 `client-extension.yaml`](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml) を参照してください。

## 追加情報

* [クライアントエクステンションの紹介](../client-extensions.md)
* [カスタム要素とIFrameクライアント拡張機能を理解する](./front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md)
* [JavaScriptクライアントエクステンションの使用](./front-end-client-extensions/tutorials/using-a-javascript-client-extension.md)
* [CSSクライアントエクステンションの使用](./front-end-client-extensions/tutorials/using-a-css-client-extension.md)
