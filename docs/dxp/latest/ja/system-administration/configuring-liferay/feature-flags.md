# ベータ版の機能と機能フラグ

## 機能フラグ

{bdg-secondary}`DXP 7.4 U69+/GA69+.`

Liferayのいくつかの機能は_feature flags_の後ろに隠されています。 機能フラグを使うことで、Liferayインスタンスに導入される新しい機能をコントロールすることができます。 新機能や実験的な機能は、機能フラグによってより効果的に採用され、検証される。

機能フラグにアクセスして管理するには、*グローバル メニュー* (![グローバル メニュー](../../images/icon-applications-menu.png)) を開き、*コントロール パネル* &rarr; に移動します。 *インスタンス設定*。 *プラットフォーム*の下にある*機能フラグ*をクリックします。 使用できる機能フラグには次の 3 種類があります。

1. [ベータ版の機能フラグ](#beta-feature-flags)

1. [リリース機能フラグ](#release-feature-flags)

1. [開発機能フラグ](#dev-feature-flags)

![You can use feature flags to control the visibility of features.](./feature-flags/images/01.png)

<!--  Add image for badge used to denote beta features in product
Liferay DXP uses a badge to highlight beta features. See below: -->

ベータ版機能のドキュメントには、それを区別するためのバッジが含まれている：

![The documentation for a beta feature includes a badge.](./feature-flags/images/02.png)

## ベータ機能フラグ

ベータ機能とは、ビジネス検証中の機能的特徴や能力のことである。 これらは実験的なものであり、使用にあたっては慎重な検討が必要である。 ベータ版の機能は、限られた期間の後に非推奨となったり、 [リリースの機能](#release-feature-flags) に変換されることがあります。 Liferayの [Community Slack](https://liferay.dev/chat) を通して、ベータ版の機能に関するフィードバックを行うことができます。

ベータ機能を有効にするには

1. *グローバル・メニュー*([グローバル・メニュー](../../images/icon-applications-menu.png))を開き、_コントロール・パネル_ &rarr; _インスタンス設定_ に移動します。

1. プラットフォーム]の下にある[機能フラグ]をクリックし、[ベータ版]をクリックします。

1. すべてのベータ機能が表示されます。 機能の有効／無効を切り替える。

また、検索バーを使ってベータ版の機能を探したり、並べ替え (![Sort](../../images/icon-sort2.png)) ボタンを使って並べ替えたり、ステータスに基づいてフィルタリングすることもできます。

![You can search, sort, or filter beta features.](./feature-flags/images/03.png)

## リリース機能フラグ

リリース機能は完全に機能するが、期間限定でフラグの後ろに隠されている。 このフラグによって、新機能の可視性をコントロールし、準備ができたら有効にすることができる。

リリース機能を有効にするには

1. *グローバル・メニュー*([グローバル・メニュー](../../images/icon-applications-menu.png))を開き、_コントロール・パネル_ &rarr; _インスタンス設定_ に移動します。

1. プラットフォーム]の下にある[機能フラグ]をクリックし、[リリース]をクリックします。

1. すべてのリリースの特徴がリストアップされている。 機能の有効／無効を切り替える。

また、検索バーを使ってリリースの特集を探したり、並べ替え (![Sort](../../images/icon-sort2.png)) ボタンを使って並べ替えたり、ステータスに基づいてフィルタリングすることもできます。 リリース機能のフラグは一定期間が経過すると削除されますので、Liferayのアップデートのリリースノートを確認してください。

![You can search, sort, or filter release features.](./feature-flags/images/04.png)

## 開発機能フラグ

Dev機能フラグは、アクティブな開発段階にある機能とケイパビリティのためのものであり、本番環境では有効にしてはならない。 テスト用の開発機能のみを有効にする。

ポータルのプロパティを使用して、コード `XXX-000000` の理論上の開発機能フラグを有効にするには、`portal-ext.properties` に次のように追加します：

```
feature.flag.XXX-000000=true
```

環境変数を使用してコード `XXX-000000` の理論上の開発機能フラグを有効にするには、設定に以下を追加します：

```
LIFERAY_FEATURE_PERIOD_FLAG_PERIOD__UPPERCASEX__UPPERCASEX__UPPERCASEX__MINUS__NUMBER0__NUMBER0__NUMBER0__NUMBER0__NUMBER0__NUMBER0_=true
```

```{warning}
開発用の機能を本番で使ってはいけない。 Liferayの不安定性は、開発機能フラグを有効にすることで予想される副作用です。 
```

## すぐに使えるベータ版の機能

{bdg-secondary}`ライフェライ2023.Q4+/GA102+`について

上記の通り、ベータ版の機能は実験的なものであり、使用にあたっては慎重な検討が必要である。 ベータ版の機能は、限られた期間の後に非推奨となったり、 [リリースの機能](#release-feature-flags) に変換されることがあります。 Liferayの [Community Slack](https://liferay.dev/chat) を通して、ベータ版の機能に関するフィードバックを行うことができます。

いくつかのベータ機能は、 [ベータ機能フラグ](#beta-feature-flags) の後ろに追加されます。

Liferay 2023.Q4では、いくつかのベータ機能はすぐに有効になりますが、UIではベータであることを示すタグが表示されます (![Beta](../../images/icon-beta-feature.png)) 。

![Some beta features are included out-of-the-box, clearly marked in the UI.](./feature-flags/images/05.png)

## 関連トピック

* [セマンティック・サーチ](../../using-search/liferay-enterprise-search/search-experiences/semantic-search.md)
* [ベータ版の特徴](https://help.liferay.com/hc/en-us/articles/12917247551757-Beta-Features)
