# グリッドフラグメントを使用したレスポンシブレイアウトの構築

<!--TASK: Reconsider article.-->

> 対応可能：Liferay DXP 7.3以降

Liferay DXPではデフォルトで [レスポンシブデザインが使用](../building-a-responsive-site.md) されますが、コンテンツレイアウトをさらに細かく制御したい場合があります。 コンテントページで [グリッドフラグメント](../../creating-pages/page-fragments-and-widgets/using-fragments/using-layout-elements.md) を使用することにより、デスクトップデバイスとモバイルデバイスのさまざまなスクリーンサイズに対してコンテンツレイアウトを正確に制御できます。 [コンテントページを編集する](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md) 場合、［Grid］フラグメント（1）を使用してコンテンツの外枠を描き、デバイス表示セクション（3）でさまざまなターゲットデバイス用にカスタマイズされたレイアウトスタイル（2）を定義できます。 たとえば、1行のモジュール数をカスタマイズしたり、グリッドパッディングオプションをスマートフォンサイズの画面専用にカスタマイズすることが可能です。

![Using the Grid Fragment you can customize the layout options for different screen sizes.](./building-responsive-layouts-with-the-grid-fragment/images/04.png)

次の例を考えてみましょう。 保険会社のWebサイトのサービスセクションに、潜在的な顧客を対象としたサービスの概要を提供します。 このセクションでは、3つのモジュールのグリッドフラグメント内に一連のカードフラグメントを使用して、3つの異なるサービスに関する情報を含めます。

![You can customize your content layout combining the Grid Fragments with other Fragments.](./building-responsive-layouts-with-the-grid-fragment/images/01.png)

コンピューターからこの 'サービス' コンテントページにアクセスすると、グリッドレイアウトに期待される結果が表示されます。 しかし、スマートフォンからアクセスした場合、文字量や各カードフラグの幅の関係で、最適な結果とは言えません。 グリッドフラグメントスタイルを使用すると、各モジュールに表示するカードの数をカスタマイズしたり、さまざまなスクリーンサイズで最高の表示エクスペリエンスが得られるようにスタイルを変更したりできます。

![The default grid layout style is not optimized for a smartphone-sized screen.](./building-responsive-layouts-with-the-grid-fragment/images/02.png)

## グリッドフラグメントのレイアウトの変更

1. コンテントページで [グリッドフラグメントを構成](../../creating-pages/page-fragments-and-widgets/using-fragments/using-layout-elements.md) します。

1. 編集サイドバーで、_ブラウザ_ (![Simulation](../../../images/icon-hierarchy.png)) ボタンをクリックし、カスタマイズしたいグリッド・フラグメントをクリックします。

1. 編集ツールバーの［デバイスディスプレイ］セクションで、最適化するスクリーンサイズを選択します。

   ![Select the screen size you want to customize in the Device Display section.](./building-responsive-layouts-with-the-grid-fragment/images/06.png)

1. 設定サイドバーの_General_タブで、画面サイズに適したレイアウトオプションを選択します。 例えば、_Portrait Phone_レイアウトオプションでは、1行に1つのモジュールがより良く機能します。

1. 画像を選択して、ターゲット画面サイズに合わせて _Resolution_ を設定するか（Liferay DXP 7.4+ で使用可能）、デフォルトの _Auto_ オプションのままにして、 [Adaptive Media](../../../content-authoring-and-management/documents-and-media/publishing-and-sharing/using-adaptive-media.md) を使用します。

   ![Select the image resolution for the target screen size or leave the Auto option to use Adaptive Media.](./building-responsive-layouts-with-the-grid-fragment/images/05.png)

1. *［公開］*をクリックします。

1. オプションとして、メインツールバーの_シミュレーション_ (![Simulation](../../../images/icon-simulation.png)) ボタンをクリックすると、ターゲットデバイス上で変更を確認できます。

```{tip}
選択したグリッドフラグメント設定を保存して、他のコンテントページで再利用できます。 詳しくは、 [フラグメント・コンポジションの保存](../../creating-pages/page-fragments-and-widgets/using-fragments/saving-fragment-compositions.md) を参照のこと。
```

## 関連トピック

* [レスポンシブ・サイトの構築](../building-a-responsive-site.md)
* [フラグメント・コンポジションの保存](../../creating-pages/page-fragments-and-widgets/using-fragments/saving-fragment-compositions.md)
* [レイアウト要素の使用](../../creating-pages/page-fragments-and-widgets/using-fragments/using-layout-elements.md)
