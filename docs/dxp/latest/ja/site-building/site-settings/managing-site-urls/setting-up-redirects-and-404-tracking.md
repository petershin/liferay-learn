---
toc:
- ./setting-up-redirects-and-404-tracking/using-alias-redirects.md
- ./setting-up-redirects-and-404-tracking/using-pattern-redirects.md
- ./setting-up-redirects-and-404-tracking/tracking-404-urls.md
---
# リダイレクトと404トラッキングの設定

{bdg-secondary}`7.4 U48+/GA48+`

URLの整合性を保つことは、どんなサイトにとっても重要です。 Liferayの **Redirection** ツールは、HTTPリダイレクトを管理し、個々のサイトについて404エラーを追跡する便利で統合された方法を提供します。 リンク切れを回避・修正し、ユーザーエクスペリエンスとサイトのSEOの両方を向上させるために使用します。

アプリケーションにアクセスするには、 **サイトメニュー**(![Site Menu](../../../images/icon-product-menu.png)) を開き、 **コンフィグレーション** &rarr; **リダイレクト** にアクセスしてください。

![サイトメニューの「リダイレクト」ページに移動します。](./setting-up-redirects-and-404-tracking/images/01.png)

## リダイレクトの定義

2種類のリダイレクトを定義することができます。

**Alias Redirects** : ソースと宛先の絶対的なURLを使用して、永久的な（301）または一時的な（302）URLリダイレクトを定義することができます。

**Pattern Redirects** {bdg-secondary}`7.4 U48+/GA48+`: ソースURLとその置換のパターンを設定する正規表現を使用して、一括リダイレクトを定義することができます。

Liferay はほとんどの場合、エイリアスリダイレクトを推奨します。なぜなら、エイリアスリダイレクトはより予測しやすいからです。 パターンリダイレクトは、URLのファミリーをマッチングさせるのに最適な方法です。 正確な正規表現によっては、パターンリダイレクトは遅くなり、意図したよりも多くのURLマッチが発生することになります。 詳しくは、 [エイリアスリダイレクトの使用](./setting-up-redirects-and-404-tracking/using-alias-redirects.md) と [パターンリダイレクトの使用](./setting-up-redirects-and-404-tracking/using-pattern-redirects.md) を参照してください。

## 404エラーの解決

リダイレクションアプリケーションでは、404エラーになるサイトリクエストを表示・管理できるため、問題を評価し、迅速に解決することができます。 Liferay 7.4+では、404トラッキングはデフォルトで無効になっています。 この機能を有効にすると、Redirectionアプリケーションの404 URLタブが有効になり、エラーのカタログ化が開始されます。 詳しくは、 [404 URLの追跡](./setting-up-redirects-and-404-tracking/tracking-404-urls.md) をご覧ください。


