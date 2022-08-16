# バーチャルホストのサイトURLの設定

バーチャルホストは、ドメイン名（つまり、`www.helloworld.com`）をサイトに接続します。 これは、完全なドメインまたはサブドメイン（たとえば、`developers.helloworld.com`）にできます。 これを使用して、1つのLiferay DXPサーバー上で複数のWebサイトを個別のサイトとしてホストできます。 次の手順に従って、バーチャルホストのサイトURLを設定します。

1. プロバイダーで、Liferay DXP インスタンスの IP アドレスを指すように DNS 名を設定します。 <!-- I think we can take this .5 step further by either linking to a often cited resource on how on a common domain name provider, a user would update the DNS name to point to a particular IP address. -->

1. Liferay DXP 内で Site Menu (![Site Menu](../../../images/icon-product-menu.png)) を開き、 **Configuration** を展開し、 **Site Settings** &rarr; **Site Configuration** &rarr; **Site URL** に進みます。

   ![［サイト設定］の［サイトURL］に移動します。](./configuring-virtual-hosts-site-urls/images/01.png)

1. **バーチャルホスト** フィールドに希望のドメインまたはサブドメインを入力します（例： `www.helloworld.com`, `http://developers.helloworld.com`)。

   ![バーチャルホストを特定のロケールに指定できます。](./configuring-virtual-hosts-site-urls/images/02.png)

   ```{important}
   ドメインは単一のサイトにのみ適用できます。 1つのドメインを複数のサイトにマッピングすることはできません。
   ```

1. (オプション）Liferay 7.3 GA2 以降、バーチャルホストドメインを追加する場合は **Plus** ボタン(![Plus Button](../../../images/icon-plus.png))をクリックします。

1. (オプション）Liferay 7.3 GA2 以降は、各バーチャルホストの言語を選択します。 サイトの各翻訳にドメインがある場合、各ドメインにバーチャルホストを追加することができます。

   ```{note}
   ロケールは、サイトで使用可能な言語に制限されます（定義されている場合）。 ロケールが指定されていない場合は、サイトのデフォルトのロケールが使用されます。 ロケールは、関連付けられているすべてのドメインのサイトに適用されます。
   ```

   ![複数のバーチャルホストを追加して、異なるドメインを指すようにすることができます。](./configuring-virtual-hosts-site-urls/images/03.png)

1. ［**保存**］ をクリックします。

これで、設定済みのドメインを使用してサイトにアクセスできるようになりました。

## 追加情報

* [サイトのフレンドリURLを設定する](./configuring-your-sites-friendly-url.md)
* [リダイレクションツールの使用](./using-the-redirection-tool.md)
