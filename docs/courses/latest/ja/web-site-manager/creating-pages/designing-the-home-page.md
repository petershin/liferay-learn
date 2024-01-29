# ホームページのデザイン

クラリティの現在のホームページは少しまばらだ。 今はヘッダーとフッターに加えてバナーが1つあるだけだ：

![The home page's content consists of a simple banner.](./designing-the-home-page/images/01.png)

クラリティのマーケティング・チームは、トップページにもっと多くのことを求めている。 彼らは次のことを望んでいる。

1. 企業の独自性を際立たせる特徴のリスト
1. お客様の声スライダー

[フラグメントの使用](https://learn.liferay.com/ja/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments) HTML、JavaScript（必要な場合）、CSSの再利用可能なスニペットで、サイトページのルック＆フィールを構築するために使用できます。 組み込みのフラグメントとカスタムフラグメントの両方を組み合わせて、カスタムコードをほとんど使わずにページを構成します。

まず、クラリティの独自性を強調するフラグメント・コンポジションを加える：

1. 編集モードでホームページを開く。

1. **clarity-uniqueness-composition** をページに追加する。

1. ページを公開する。

![The uniqueness of Clarity is highlighted.](./designing-the-home-page/images/03.png)

このユニークなコンポジションは、既成概念にとらわれない断片と、クラリティが提供する画像を組み合わせて作られ、クラリティが求めるコンテンツとルック＆フィールを提供する。

コンテンツの最後のセクションには、顧客の声が掲載されている。 この場合、テキストは顧客の見積もりを表示するように変更されます。

1. 編集モードでホームページを開く。

1. **clarity-testimonials-composition** をページに追加する。

1. 右側のフラグメント設定サイドバーで、各 **証言** フィールドに引用符を付けます：

   **最初の証言:**

   ```html
   "Wow, 4K is way cooler when I have my Clarity glasses on. Let's be honest, I'm way cooler too."<br /><br />Scott, Almuerzo, TX
   ```

   **第二の証言：**

   ```html
   "I look good, and I never knew it!"<br /><br />Cherise, Mittagessen SD
   ```

   **第三の証言：**

   ```html
   "If looks could kill, my mirror would be serving ten life sentences."<br /><br />Bran, Ranchi OR
   ```

1. ページを公開する。

![Customer Testimonials are displayed.](./designing-the-home-page/images/04.png)

[「フラグメントとリソースのインポート」](./importing-fragments-and-resources) でインポートした **Testimonials Slider** というカスタムフラグメントで定義されています。

　 ページの作成に関するこのモジュールは終了しました。 クラリティのページが整い、ホームページも肉付けされた。 しかし、ほとんどのサイトページにはコンテンツがない。

モジュール 3： [コンテンツの作成](../creating-content.md).

## 関連コンセプト

* [コンテントページのコンテンツの管理](https://learn.liferay.com/ja/w/dxp/site-building/creating-pages/using-content-pages/managing-content-in-content-pages)
* [Content Page Editor UI Reference](https://learn.liferay.com/ja/w/dxp/site-building/creating-pages/using-content-pages/content-page-editor-ui-reference)
* [コンテントページの使用](https://learn.liferay.com/ja/w/dxp/site-building/creating-pages/using-content-pages)
