# 機能フラグ

{bdg-secondary}`dxp 7.4 u69+/ga69+`

Liferayのいくつかの機能は、 **機能フラグ** の後ろに隠されています。 機能フラグを使用することで、Liferayインスタンスに導入される新しい機能を制御することができます。 新機能や実験的な機能は、機能フラグを使うことでより効果的に採用・検証することができます。

機能フラグにアクセスし管理するには、 **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **Control Panel** &rarr; **Instance Settings** に移動します。 **Platform** の下にある **Feature Flags** をクリックします。 フィーチャーフラッグは3種類用意されています：

1. [ベータ版の機能フラグ](#beta-feature-flags)

1. [リリース機能フラグ](#release-feature-flags)

1. [Dev feature flags](#dev-feature-flags) .

![フィーチャーフラグを使用して、フィーチャーの可視性を制御することができます。](./feature-flags/images/01.png)


<!--  Add image for badge used to denote beta features in product
Liferay DXP uses a badge to highlight beta features. See below: -->

ベータ版機能のドキュメントには、それを際立たせるためのバッジが含まれています：

![ベータ版機能のドキュメントには、バッジが含まれています。](./feature-flags/images/02.png)

## ベータ版の機能フラグ

ベータ版とは、ビジネスで検証中の機能的な特徴や能力のことです。 これらは実験的なものであり、使用にあたっては十分な検討が必要です。 ベータ版の機能は、限られた期間後に非推奨となるか、 [リリース機能に変換される可能性があります](#release-feature-flags) . Liferayの [Community Slack](https://liferay.dev/chat) を通して、ベータ版の機能に関するフィードバックを行うことができます。

ベータ版機能を有効にするには

1. **グローバルメニュー**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** &rarr; **インスタンス設定** に移動します。

1. Platform の下にある **Feature Flags** をクリックし、 **Beta** をクリックします。

1. すべてのベータ版機能が表示されます。 トグルで機能の有効／無効を切り替えます。

また、検索バーを使ってベータ版の機能を探したり、Sort (![Sort](../../images/icon-sort2.png)) ボタンを使って並べ替えたり、ステータスに基づいてフィルタリングしたりすることも可能です。

![ベータ版の機能を検索、ソート、フィルターすることができます。](./feature-flags/images/03.png)

## リリース機能フラグ

リリース機能は完全に機能しますが、期間限定でフラグの後ろに隠れています。 このフラグによって、新機能の可視性をコントロールし、準備ができたら有効にすることができます。

リリース機能を有効にするには

1. **グローバルメニュー**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** &rarr; **インスタンス設定** に移動します。

1. Platform の下にある **Feature Flags** をクリックし、 **Release** をクリックします。

1. すべてのリリース機能を掲載しています。 トグルで機能の有効／無効を切り替えます。

また、検索バーを使ってリリース特集を探したり、Sort (![Sort](../../images/icon-sort2.png)) ボタンを使って並べ替えたり、ステータスに基づいてフィルタリングしたりすることもできます。 リリース機能のフラグは一定期間が経過すると削除されますので、Liferayのアップデートの際にはリリースノートを監視してください。

![リリース機能の検索、ソート、フィルタリングが可能です。](./feature-flags/images/04.png)

## 開発機能フラグ

Dev feature flagsは、アクティブな開発中の機能およびケイパビリティのためのもので、本番環境では有効にしてはいけません。 テスト用に開発用機能のみを有効にする。

ポータルのプロパティを使用して、コード `XXX-000000` の理論的な開発機能フラグを有効にするには、 `portal-ext.properties`に次のように追加します：

```
feature.flag.XXX-000000=true
```

環境変数を使って、コード `XXX-000000` の理論的なdev機能フラグを有効にするには、設定に次のように追加します：

```
LIFERAY_FEATURE_PERIOD_FLAG_PERIOD__UPPERCASEX__UPPERCASEX__UPPERCASEX__MINUS__NUMBER0__NUMBER0__NUMBER0__NUMBER0__NUMBER0__NUMBER0_=true
```

```{warning}
開発用の機能を本番で使用しない。 Liferayの不安定さは、dev機能フラグを有効にすることで予想される副作用です。 
```

## 追加情報

* [セマンティック検索](../../using-search/liferay-enterprise-search/search-experiences/semantic-search.md)
* [ベータ版の特徴](https://help.liferay.com/hc/ja/articles/12917247551757-Beta-Features)
