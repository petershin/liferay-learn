# Webアプリケーションファイアウォール

Liferay Cloudは、Webアプリケーションファイアウォール（WAF）機能を内蔵し、機密データの損失、攻撃者によるシステムの乗っ取り、ダウンタイムにつながる可能性のある高度なレイヤー7攻撃からアプリケーションを保護します。

ここでは、Liferay Cloudの機能が、一般的な攻撃から保護するWAFをどのように形成しているかを学びます。

![図1：Webアプリケーションファイアウォールは、一般的な攻撃から保護します。](./web-application-firewall/images/01.png)

```{note}
カスタムファイアウォールルールは、 [共有クラスタサブスクリプション](../../reference/platform-limitations.md#security) では使用できません。
```

## プライベートネットワーク

Liferay Cloudのサービスはインターネットに公開されません。 Liferay Cloudの各環境は独自のプライベートネットワークを持ち、同じ環境のサービスは公衆インターネットと相互作用することなく、安全な通信プロトコルで通信することができます。 このプライベートネットワークの設定については、 [プライベートネットワーク](../networking/private-network.md) を参照してください。

## パブリックロードバランサー

Liferay Cloud Public Load Balancer ( [Layer 7](https://www.nginx.com/resources/glossary/layer-7-load-balancing/) ) は，TLS (1.0 to 1.2) プロトコルを用いたプロキシされた HTTP(S) 接続により，環境のサービスへインターネットアクセスを提供します． 各ロードバランサーには、カスタムドメインの設定に使用できる静的IPがあります。 HTTP（S）負荷分散は、IPスプーフィングと大規模なSYNフラッド攻撃を吸収して保護できます。 この機能はLiferay Cloudに組み込まれており、ユーザーによる設定は必要ありません。

## CDNオフロード

Liferay Cloud の [CDN](../networking/load-balancer.md#cdn) は、クライアントとオリジンサーバーの間のプロキシとして機能します。 CDNは、キャッシュ可能なコンテンツを、バックエンドサーバー（インスタンス）に送信するのではなく、ユーザーに近いPOP（Points-of-Presence）からキャッシュして提供します。

キャッシュ可能なコンテンツに対するDDoS攻撃が発生した場合、要求はオリジンサーバーではなく世界中のPOPに送信されるため、攻撃を吸収するためのより多くの場所が提供されます。

## IP許可および拒否リスト

Liferay Cloud が提供する [Webserver (Nginx) サービス](../../platform-services/web-server-service.md) では、許可リストと拒否リストを使用して、IP アドレスや範囲に基づいて受信トラフィックを許可またはブロックする機能が利用できます。

ユーザーは `nginx.conf` ファイルの `stream` コンテキストまたは `server` ブロック内の `allow` および `deny` ディレクティブを利用できます。

```
stream {
    ...
    server {
        listen 12345;
        deny   192.168.1.2;
        allow  192.168.1.1/24;
        allow  2001:0db8::/32;
        deny   all;
    }
}
```
