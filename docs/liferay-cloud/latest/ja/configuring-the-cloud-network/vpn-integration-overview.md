# VPNインテグレーションの概要

Liferay Cloudは、ポートフォワーディングと冗長トンネルをサポートするVPNクライアント-サイト接続を提供します。 この機能は、Liferay Cloud上の契約者の本番環境と内部ネットワークとを接続するためによく使われます。 セキュリティと信頼性のために、これらのVPN接続は環境ごと（本番環境、ステージング、または開発）に分離されています。

![トポロジー1 - Liferay Cloud VPN クライアント-サイト間トポロジー](./vpn-integration-overview/images/01.png)

契約者は、Liferay Cloudサービス間の接続を、対応するVPNサーバーのIPアドレスにマッピングすることで、冗長なVPNトンネルを使用することができます。 冗長性はさまざまなアベイラビリティーゾーンに配置され、回復力を提供します。 クライアントからサイトへのアプローチには、企業ネットワークで実行されているサービスへの接続が含まれます。 このモデルは、コンテナ化されたアーキテクチャとKubernetesのネットワークレイヤーが提供されているため、推奨されています。

VPN接続が設定されると、環境のログページで、ドロップダウンリストから ［**VPN Logs**］ を選択することで、VPNサーバーからのログメッセージを表示することができます。

![［VPN Logs］を選択すると、自分の環境での最近のVPNアクティビティが表示されます。](./vpn-integration-overview/images/02.png)

詳細は、 [VPNサーバーの制限](../reference/platform-limitations.md#vpn-servers) のセクションを参照してください。

## 設定

クライアントからサイトへのVPN機能は、次のプロトコルをサポートしています。

* IPsec (IKEv2)
* OpenVPN

契約者は、Liferay Cloudのコンソール設定画面から、希望する環境のプロトコル（IPSecまたはOpenVPN）のいずれかを選択して接続を実行することができます。 コンソールUIでは、接続に任意の数の転送ポートを設定できます。

```{note}
IPsecサーバで `IKEv2` プロトコルを使用すると、`MSCHAPv2` または `TLS` 認証プロトコルを使用することができます。 詳しくは、 [IPsecサーバーの基本設定](./configuring-a-vpn-server.md#basic-setup-for-an-ipsec-server) をご覧ください。
```

詳しくは、 [Liferay Cloud に VPN サーバーを接続する](./connecting-a-vpn-server-to-liferay-cloud.md) をご覧ください。

## Liferay Cloud と IPSec VPN サーバーを接続する。

このユースケースでは、Liferay Cloud 内で動作する Liferay Portal インスタンスがあり、内部ネットワーク内で動作する HTTP サービスにアクセスする必要があると仮定します。

![トポロジー2 - お客様の社内ネットワーク内のHTTPサービスにアクセスするポータル インスタンス](./vpn-integration-overview/images/03.png)

次のことに注意してください。

* お客様の内部ネットワークで動作している `192.168.100.30:8080` 上の Hello World サービスは、サーバーアドレス `vpn:33000`を介して Liferay Portal サービスからアクセスすることができます。
* クライアントからサーバーへの接続は、 `18.188.145.101:500`実行されている顧客のVPNサーバーを介して行われます。
* ポート転送ルールは、ローカルポート **33000** を公開し、 `192.168.100.30:8080`上で実行されているアプリケーションにマップします。

接続とポート転送ルールが設定されると、Hello World サービスへのリクエストは、どの Liferay Cloud サービスからも行えるようになります。

```bash
curl vpn:33000

<body><h1>Hello world!</h1></body></html>
```

### Liferay Cloud 共有クラスタのIP範囲

Liferay Cloudは、VPNサーバーにマッピングできる幅広い利用可能なIPアドレスを使用しています。 デフォルトでは、Liferay Cloud サービスのすべての送信用外部 IP アドレスは固定されていません。

安定した発信用外部IPアドレスを得るには、Liferay Cloud Private Clusterの機能を利用するのが最適です。

### Liferay Cloud プライベートクラスタのIP範囲について

Liferay Cloudは、オプションで各契約者のサービスを専用のクラスターに分離するプライベートクラスターを提供しています。 各クラスターは、サブスクライバーのクラスターからのすべての送信インターネットトラフィック専用のゲートウェイで設定され、静的外部IPが割り当てられます。

## 次のステップ

* [Client-to-Site VPNの設定例](./configuring-a-vpn-server.md)
