# サイトのフレンドリURLを設定する

フレンドリーURLとは、ユーザーがサイトに素早くアクセスできるようにするための読みやすいURLのことです。 各URLは一意でなければならず、 `https://localhost:8080/web` のように付加される（例： `https://localhost:8080/web/helloworld/`）。

```{note}
プライベートページが有効な場合、そのページにもフレンドリーなURLを設定することができます。 一旦設定されると、それらは `https://localhost:8080/group` に追加される。
```

## サイトのフレンドリURLを設定する

以下の手順で、サイトのフレンドリーURLを設定します。

1. *サイトメニュー* (![Site Menu](../../../images/icon-product-menu.png)) を開き、 *設定*を展開し、 *サイト設定* &rarr; *サイト設定* &rarr; *サイトURL*に進みます。

1. *Friendly URL を入力*.

1. *［保存］* をクリックします。

![サイトのフレンドリURLを設定できます。](./configuring-your-sites-friendly-url/images/01.png)

サイトのホームページにフレンドリーなURLを追加したい場合は、次のセクションの追加手順を実行してください。

## インスタンスのホームURLの設定

インスタンスのホーム ページにフレンドリなURLを追加した場合は、インスタンスの［Home URL］フィールドを更新して、`http://localhost:8080`へのページリクエストが適切にリダイレクトされるようにする必要があります。 <!-- What is a Home URL? Do I HAVE to do this? What does it impact? -->

1. [グローバルメニュー](../../../getting-started/navigating-dxp.md) ( ![Global Menu icon](../../../images/icon-applications-menu.png) ) を開き、 *コントロールパネル* タブをクリックし、 *インスタンス設定*に進みます。

1. *［プラットフォーム］*見出しの下で*［Instance Configuration］*を選択し、*［General］*リンクをクリックします。

1. *［Navigation］*の下で、*［Home URL］*フィールドに新しいフレンドリなホームURLを入力します。 たとえば、デフォルトのサイトのフレンドリURLを`/my-site`に設定すると、サイトの公開ホームページのURLは`https://localhost:8080/web/my-site/home`になります。 つまり、`/web/my-site/home`と入力します。

![更新されたホームURLを入力すると、新しいフレンドリURLにリダイレクトされます。](./configuring-your-sites-friendly-url/images/02.png)

この設定を行うと、`localhost:8080`へのページリクエストは、Liferay DXPインスタンスの新しいホームページのフレンドリURLにリダイレクトされます。
