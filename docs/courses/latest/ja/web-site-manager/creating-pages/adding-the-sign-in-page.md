# サインインページの追加

ユーザーは現在、ヘッダーのユーザーメニューにある **Sign In** をクリックしてClarityにログインできます。

1. ログアウトする。 どのページでも、ユーザーアイコンをクリックし、ドロップダウンメニューから **Sign Out** を選択します。 現在、ログアウトリンクを制御するカスタムフラグメントはデフォルトの Liferay ログアウト URL を使用しています：`c/portal/logout`です。

1. サインインページをテストする。 どのページでも、ユーザーアイコンと **Sign In** リンクをクリックしてください。 現在、サインインリンクを制御するカスタムフラグメントはデフォルトの Liferay ログイン URL を使用しています：`c/portal/login`を使用しています。 これは、デフォルトのSign Inウィジェットを起動したページで有効にします。 しかし、クラリティのマスターページが適用されている現状では醜い：

   ![The default sign in widget clashes with the master page.](./adding-the-sign-in-page/images/07.png)

クラリティはサインイン体験をもっと良くする必要がある。 次に、カスタムサインインページを追加します。

1. 空白テンプレートを使用してサインインページを追加します。 Add_をクリックすると、コンテンツ・ページ・エディターがロードされます。

1. ページ上部の管理バーにある **Options** メニュー(![Options](../../images/icon-options.png))を開き、 **Configure** をクリックします。

   ![Configure the sign-in page.](./adding-the-sign-in-page/images/08.png)

1. 一般ページ設定画面で、もう一度 **Hidden from Menu Display** を有効にして、サインインページがメニュー表示ウィジェットのナビゲーションメニューに表示されないようにします。 フレンドリーURL、`/sign-in`をメモし、 **Save** をクリックする。

1. メニューから **Design** リンクをクリックし、テーマオプションを見てください。 これらは現在、ページ管理の設定によってすべてのページに設定されています（同様にオプションメニューからアクセスできます(![Options](../../images/icon-options.png)）。

1. このページのカスタムテーマを定義する **をクリックして、継承されたテーマオプションを上書きします。 以下の設定のチェックを外してください：フッターの表示]と[ヘッダーの表示]。 検索バーを表示させたくないので、** Show Header Search_のチェックを外すこともできるが、ヘッダーを完全に非表示にすることでそれも達成できる。

1. 下にスクロールして設定を保存します。

1. ページ上部の戻る矢印を使ってコンテンツページエディタに戻り、インポートしたフラグメント「Sign In」を追加します。

1. ページを公開する。

   ![The sign in page is in place.](./adding-the-sign-in-page/images/09.png)

1. ここで、カスタムユーザーナビゲーションフラグメントを編集して、`/c/portal/login`の代わりに新しいサインインページを指すようにします。 サイトメニューへ (**![商品メニュー](../../images/icon-product-menu.png)) &rarr;***Design***&rarr;***Fragments** .

1. `user-nav_Dropdown`フラグメントを開く。 HTMLペインで、ログインURLを設定する行を見つける：

    ```html
    <a class="user-sign-in" href="/c/portal/login">
    ```

1. サインインページのフレンドリーURLである`sign-in`を指すように行を置き換える：

    ```html
    <a class="user-sign-in" href="${publicFriendlyURL}/sign-in">
    ```

    この`publicFriendlyURL`変数は、FreeMarkerの構文を使ってHTMLの最初の行に設定されます：

    ```html
    [#assign publicFriendlyURL = themeDisplay.getPathFriendlyURLPublic() +
       themeDisplay.getSiteGroup().getFriendlyURL() /]
    ```

1. **Publish** をクリックする。

1. ページまたはマスターページで使用中のフラグメントに、新しいフラグメントコードを伝搬する。 フラグメントの **Actions**(![Actions](../../images/icon-actions.png)) メニューを開き、 **View Usages** をクリックします。

1. リストアップされた使用法をすべて選択し、 **Propagate**(![Propagate](../../images/icon-propagate.png))をクリックします。 詳しくは [フラグメントの変更のプロパゲート](https://learn.liferay.com/ja/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/propagating-fragment-changes) を参照のこと。

1. どのページからでもログアウトし、 **サインイン** をクリックしてください。 新しいページが表示されますので、そこでサインインしてください。

    ![Sign in using the new page.](./adding-the-sign-in-page/images/10.png)

今はグレーの背景を気にする必要はない。 カスタムサインインフラグメントのCSSは、`form-box`クラスを次のようにスタイルする：

```css
.form-box {
    align-items: flex-start;
    background-color: var(--brand-color-2);
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    padding: var(--spacer-6) var(--spacer-7) var(--spacer-4);
    width: 35%;
}
```

このように背景色をブランドカラー変数に設定することは、後でサイトをスタイリングする際に影響を与えることができるため、良い習慣である。 今のところ、`brand-color-2`という変数はグレーに解決され、見た目は良くない。 この問題を解決するために色をハードコードするのは良い解決策ではないので、今はグレーのままにしておく。

これでクラリティのサイト構造は整った。 しかし、ナビゲーションメニューはもう少し改良が必要だろう。

![The navigation menu is okay, but it could use some enhancements.](./adding-the-sign-in-page/images/05.png)

次ページ： [新しいナビゲーション・メニューの作成](./creating-navigation-menus.md).

## 関連コンセプト

* [サイトにページを追加する](https://learn.liferay.com/ja/w/dxp/site-building/creating-pages/adding-pages/adding-a-page-to-a-site)
* [ページの検索](https://learn.liferay.com/ja/w/dxp/using-search/search-pages-and-widgets/working-with-search-pages/search-pages)
* [コンテンツの検索](https://learn.liferay.com/ja/w/dxp/using-search/getting-started/searching-for-content)
