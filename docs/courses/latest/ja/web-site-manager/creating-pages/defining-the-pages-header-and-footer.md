# ページのヘッダーとフッターを定義する

[マスターページ](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/defining-headers-and-footers/master-page-templates) では、ページのヘッダーとフッターに共通の要素を定義できます。 クラリティには現在、ホームページが1ページあるだけだ。 これはマスターページが利用可能になる前に作成されたため、空白のマスターページが自動的にページに関連づけられた。 ヘッダーにはLiferayのロゴとラベル、ページベースのナビゲーションメニュー、検索バーウィジェット、サインイン/パーソナルメニューがあります。

![The default header and footer are useful, but replaceable.](./defining-the-pages-header-and-footer/images/01.png)

クラリティは独自のヘッダーとフッターのデザインを必要とするため、マスターページを作成してヘッダーとフッターを定義し、サイト全体のすべてのページで再利用します。

1. *サイトメニュー*([商品メニュー](../../images/icon-product-menu.png))を開き、_デザイン_ &rarr; _ページテンプレート_をクリックします。

1. *追加* (![追加](./../../images/icon-add.png))をクリックし、ページ名を_Clarity MP_とします。

   コンテンツページエディターが表示されます。 デフォルトでは、ページにはドロップゾーンという1つの要素しかない。 クラリティのヘッダーとフッターは、ドロップゾーンの上下に表示されます。

1. サイドバーの「フラグメントとウィジェット」(![Fragments and Widgets](./../../images/icon-add-widget.png)) メニューで、_clarity-header-comp_をドロップゾーンの上にドラッグし、次に_clarity-footer-comp_をドロップゾーンの下にドラッグします。

   これらのフラグメントコンポジションは、前のステップ、 [Fragments and Resources](./importing-fragments-and-resources.md) でインポートしました。

1. ヘッダーの画像断片をロゴにマッピングする。 ブラウザーを開き（！[Browser](../../images/icon-hierarchy.png)）、Header Container要素を展開し、真ん中のグリッドモジュールの画像フラグメントにたどり着くまで要素の展開を続けます。

   ![Click the image fragment's inner element to set the source of the image.](./defining-the-pages-header-and-footer/images/04.png)

1. 画像断片をクリックして設定を開き、_image-square_をクリックして画像のソースを設定します。

1. 直接ソースを選択し、画像_clarity_logo_を選択します。

   ![Set the image to use in the header.](./defining-the-pages-header-and-footer/images/05.png)

1. 同じ手順で、_clarity_logo_画像をフッターの画像断片に追加します。

   ![Set the image to use in the footer.](./defining-the-pages-header-and-footer/images/06.png)

1. マスターを公開する」をクリックする。

   ユーザーメニューはカスタムフラグメント `user-nav-fragment.zip` です。 HTMLとCSSを使用して、ログイン・ユーザー用のメニューを作成します。 ログアウトしているユーザーには、ユーザーアイコンとSIGN INの文字が表示され、これをクリックするとサインインページにアクセスできます。

   ![Logged in users see a menu with links to important pages.](./defining-the-pages-header-and-footer/images/03.png)

マスターページが完成した。 現在、ヘッダーとフッターの両方に、サイトのページ階層を示すメニューがあります。 これは [ナビゲーションメニューの作成](./creating-navigation-menus.md) で改善される。 今は、既存のHomeページとすべてのウィジェットページ（例えば、既存のSearchページ）でマスターページを使用するようにLiferayを設定する時です。

1. マスターページの_Actions_メニュー(![Actions](../../images/icon-actions.png))を開き、_Mark as Default_をクリックします。 このマスターページをすべてのウィジェットページのデフォルトとして使用することを確認してください。

1. トップページに移動し、管理ヘッダーの_編集_ (![編集](../../images/icon-edit.png))をクリックする。

1. コンテンツ・ページ・エディターで、_ページ・デザイン・オプション_サイドバー・メニュー（[ページ・デザイン・オプション](../../images/icon-format.png)）を開き、_Clarity MP_を選択します。

1. Publish_をクリックする。

1. 同様の手順で、デフォルトのユーティリティページ（404と500エラーページ）をマスターページを使用するように設定します。 サイトメニュー(![商品メニュー](../../images/icon-product-menu.png))で、_サイトビルダー_ &rarr; _ページ_ &rarr; _ユーティリティページ_をクリックします。

これでマスターページにヘッダーとフッターが定義されました。

![The header and footer is in place.](./defining-the-pages-header-and-footer/images/07.png)

ヘッダーとフッターがあっても、ルック＆フィールはまだ洗練されていない。 リンクは現在すべて青色で、例えばクラリティのブランドカラーにはマッチしていません。 手作業で時間をかけて修正するよりも、今はそのままにしておこう。 後で導入するテーマCSSクライアントエクステンションが、これらの視覚的欠点を改善する。

次ページ： [サイトの残りのページを作成する](./completing-the-site-structure.md).

## 関連コンセプト

* [マスターページテンプレート](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/defining-headers-and-footers/master-page-templates)
* [マスターページテンプレートの作成](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/defining-headers-and-footers/creating-a-master-page-template)
* [マスターページテンプレートの管理](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/defining-headers-and-footers/managing-master-page-templates)
