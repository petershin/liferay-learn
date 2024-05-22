---
toc:
  - ./building-a-responsive-site/building-responsive-layouts-with-the-grid-fragment.md
  - ./building-a-responsive-site/using-the-simulation-panel.md
---
# レスポンシブサイトの構築

世界の全ページビューの半分以上は、携帯電話やタブレットなどのモバイルデバイスからアクセスされています。 どのサイトも、モバイルデバイスで表示した場合に、デスクトップで表示した場合と同様に見栄えをよくする必要があります。 Liferay DXPでは、どのデバイスがサイトにアクセスしても、可能な限り最高のエクスペリエンスを提供することができます。

Liferayでは、すぐに使えるレスポンシブレイアウトを使用しています。

* DXPウィジェットやLiferayのUIフレームワークを使ったカスタムウィジェットは、画面サイズに合わせて自動的に拡大縮小されます。

  ![Adjust the widget's size.](./building-a-responsive-site/building-a-responsive-site/images/01.png)

* ナビゲーションや商品メニューのようなUI要素は、小さな画面でも使いやすいように自動的に調整されます。

  ![The main navigation adjusts its size.](./building-a-responsive-site/building-a-responsive-site/images/02.png)

* 画面幅が狭い場合、Liferayはすべてのコンテンツが読みやすいように列を結合します。

  ![Columns are combined when the width is low.](./building-a-responsive-site/building-a-responsive-site/images/03.png)

* テーマツールは、Web開発者が最適なモバイルパフォーマンスを確保するのに役立ちます。

デフォルトのテーマを使用している場合、ページはすでにモバイルデバイスに合わせて調整されています。 また、すべてが意図したとおりに表示されるかどうかを確認するツールもある。 デバイス・シミュレーター(![Simulation](../../images/icon-simulation.png))は、異なるデバイス上でページがどのように見えるかを表示します。

```{tip}
Liferay 7.2では、モバイルデバイスの検出時にサイトの動作を制御するモバイルデバイスルールを作成できます。 モバイル・デバイス・ルールの作成の詳細については、 [モバイル・デバイス・ルールの作成](./building-a-responsive-site/creating-mobile-device-rules.md) を参照してください。
```


