# 機能フラグ

{bdg-secondary}`DXP 7.4 U69+/GA69+`

Liferay のいくつかの機能は **機能フラグ** の後ろに隠されています。 機能フラグを使うことで、Liferayインスタンスに導入される新しい機能をコントロールすることができます。 新機能や実験的な機能は、機能フラグによってより効果的に採用され、検証される。

機能フラグにアクセスして管理するには、 **グローバルメニュー**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** &rarr; **インスタンス設定** に移動します。 **Platform** の下にある **Feature Flags** をクリックする。 フィーチャー・フラッグには3種類ある：

1. [ベータ版の機能フラグ](#beta-feature-flags)

1. [リリース機能フラグ](#release-feature-flags)

1. [開発機能フラグ](#dev-feature-flags)

![フィーチャーフラグを使って、フィーチャーの可視性をコントロールすることができる。](./feature-flags/images/01.png)

<!--  Add image for badge used to denote beta features in product
Liferay DXP uses a badge to highlight beta features. See below: -->

ベータ版機能のドキュメントには、それを区別するためのバッジが含まれている：

![ベータ機能のドキュメントにはバッジが含まれている。](./feature-flags/images/02.png)

## ベータ機能フラグ

ベータ機能とは、ビジネス検証中の機能的特徴や能力のことである。 これらは実験的なものであり、使用にあたっては慎重な検討が必要である。 ベータ版の機能は、限られた期間の後に非推奨となったり、 [リリースの機能](#release-feature-flags) に変換されることがあります。 Liferayの [Community Slack](https://liferay.dev/chat) を通して、ベータ版の機能に関するフィードバックを行うことができます。

ベータ機能を有効にするには

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **Control Panel** &rarr; **Instance Settings** に移動する。

1. Platform の下にある **Feature Flags** をクリックし、 **Beta** をクリックする。

1. すべてのベータ機能が表示されます。 機能の有効／無効を切り替える。

また、検索バーを使ってベータ版の機能を探したり、ソート (![Sort](../../images/icon-sort2.png)) ボタンを使って並べ替えたり、ステータスに基づいてフィルタリングすることもできます。

![ベータ版の機能を検索、並べ替え、フィルターすることができます。](./feature-flags/images/03.png)

## リリース機能フラグ

リリース機能は完全に機能するが、期間限定でフラグの後ろに隠されている。 このフラグによって、新機能の可視性をコントロールし、準備ができたら有効にすることができる。

リリース機能を有効にするには

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **Control Panel** &rarr; **Instance Settings** に移動する。

1. Platform の下にある **Feature Flags** をクリックし、 **Release** をクリックする。

1. すべてのリリースの特徴がリストアップされている。 機能の有効／無効を切り替える。

また、検索バーを使ってリリースの特集を探したり、並べ替え (![Sort](../../images/icon-sort2.png)) ボタンを使って並べ替えたり、ステータスに基づいてフィルタリングすることもできます。 リリース機能のフラグは一定期間が経過すると削除されますので、Liferayアップデートのリリースノートを確認してください。

![リリース機能の検索、並べ替え、フィルタリングができます。](./feature-flags/images/04.png)

## 開発機能フラグ

Dev機能フラグは、アクティブな開発段階にある機能とケイパビリティのためのものであり、本番環境では有効にしてはならない。 テスト用の開発機能のみを有効にする。

ポータルのプロパティを使用して、 `XXX-000000` というコードで理論上の開発機能フラグを有効にするには、 `portal-ext.properties`に以下を追加します：

```
feature.flag.XXX-000000=true
```

環境変数を使って、 `XXX-000000` というコードで、理論上のdev機能フラグを有効にするには、これをコンフィギュレーションに追加します：

```
LIFERAY_FEATURE_PERIOD_FLAG_PERIOD__UPPERCASEX__UPPERCASEX__UPPERCASEX__MINUS__NUMBER0__NUMBER0__NUMBER0__NUMBER0__NUMBER0__NUMBER0_=true
```

```{warning}
開発用の機能を本番で使ってはいけない。 Liferayの不安定性は、開発機能フラグを有効にすることで予想される副作用です。 
```

## 関連トピック

* [セマンティック検索](../../using-search/liferay-enterprise-search/search-experiences/semantic-search.md)
* [ベータ版の特徴](https://help.liferay.com/hc/ja/articles/12917247551757-Beta-Features)
