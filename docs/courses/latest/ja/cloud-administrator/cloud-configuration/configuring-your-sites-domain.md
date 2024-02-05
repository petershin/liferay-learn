# サイトのドメインを設定する

これでDelectable Bonsaiのサイトが立ち上がりましたので、ドメイン名と接続することができます。

ここでは、サイト用のカスタムドメインを登録・設定します。

```{important}
この演習では、ドメイン登録サービスを使用して独自のカスタムドメインを予約していることを想定しています。 
```

## イングレスロードバランサーのIPアドレスを見つける

まず、本番環境のIngressロードバランサーのIPアドレスを見つけてください。

1. Liferay Cloud コンソールで本番環境に移動し、左側のメニューから **Network** をクリックします。

1. Network ページで、ロードバランサの IP アドレスが Ingress Endpoints セクションに表示されます。

![ロードバランサーのIPアドレスは、NetworkページのIngress Endpointsセクションの一番下に表示されています。](./configuring-your-sites-domain/images/01.png)

## カスタムドメインの登録

ご希望のドメイン登録サービスを使用して、本番環境用のIPアドレスでご希望のドメインを登録します。 自分のサイトに使う予定のドメイン名を選ぶ。 ドメインをタイプ `A` レコードとして登録する。

他の環境用に追加のカスタムドメインまたはサブドメインを設定する予定がある場合は、それらの環境の **Network** ページから IP アドレスを見つけ、ドメイン登録に使用します。

ドメインの登録とIPアドレスの指定の詳細については、選択したドメイン登録サービスのドキュメントを参照してください。

## ウェブサーバーサービスの設定

最後に、登録したカスタム・ドメインを使用するようにウェブ・サーバー・サービスを設定します。

1. Liferay Cloud コンソールで本番環境に移動します。

1. 左側のメニューから **Services** をクリックする。

1. `ウェブサーバー` サービスを選択します。

1. ［**Custom Domains**］ タブをクリックします。

1. **ドメイン名** リストに、登録したドメインで新しいエントリを追加します。

   ![www.delectablebonsai.com、この例のようにドメイン名を設定する。](./configuring-your-sites-domain/images/02.png)

1. **カスタムドメインの更新** をクリックする。

ウェブサーバーは、設定した新しいドメイン名を使用します。 追加のドメインまたはサブドメインを登録した場合は、同じ手順に従ってUAT環境のウェブサーバーサービスを設定します。

![追加のドメインやサブドメインを登録している場合は、UAT環境も設定する。](./configuring-your-sites-domain/images/03.png)

## カスタムドメインの確認

カスタムドメインを指定すると、Liferay Cloud は [Let's Encrypt](https://letsencrypt.org/) を経由してドメインの SSL 証明書を自動生成します。 1時間もかからないこともあれば、何時間もかかることもある。

```{note}
あなたのドメインのSSL証明書でロードバランサーを保護し、更新するには、通常、サイトへのルートを更新するよりも時間がかかります。 証明書の更新が完了する前にカスタムドメインのサイトにアクセスしようとすると、更新が完了するまでブラウザにセキュリティ警告が表示されます。
```

プロセスが完了したら、ブラウザで選択したドメインにアクセスし、Liferayインスタンスへのルートを確認してください。 あなたのブラウザは、接続がLet's Encryptによって保護され、検証されていることを示します。

![ロードバランサが新しいSSL証明書を更新すると、ブラウザは安全な接続を使用していることを確認します。](./configuring-your-sites-domain/images/04.png)

Next: [Liferayサービス](./setting-up-clustering-for-the-liferay-service.md) 、より多くのトラフィックを処理するためにクラスタリングを有効にします。

## 関連コンセプト

* [カスタムドメイン](https://learn.liferay.com/w/liferay-cloud//configuring-the-cloud-network/custom-domains)
* [ロードバランサー](https://learn.liferay.com/w/liferay-cloud//configuring-the-cloud-network/load-balancer#custom-ssl)
* [VPNインテグレーションの概要](https://learn.liferay.com/w/liferay-cloud//configuring-the-cloud-network/vpn-integration-overview)
