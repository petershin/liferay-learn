# Webアプリケーションファイアウォール

{bdg-secondary}`Liferay Cloud 5.x.x`で利用可能です。

Liferay Cloud には [ModSecurity](https://github.com/SpiderLabs/ModSecurity) という Web アプリケーションファイアウォールが含まれています。 ウェブサーバーに送信されたリクエストを、あらかじめ定義されたカスタムルールと照らし合わせて検査します。 このステップでは、XSS、SQLインジェクションなどの典型的なWebアプリケーションのリアルタイムL7攻撃や、機密情報の損失につながる可能性のあるその他の形式の乗っ取りを防止します。

Liferay Cloud には、 [プライベートネットワーク](../networking/private-network.md)、パブリック [ロードバランサー](../networking/load-balancer.md) ( [レイヤー7](https://www.nginx.com/resources/glossary/layer-7-load-balancing/) ) 、 [CDN](../networking/load-balancer.md#cdn) などのネットワークセキュリティ機能が追加され ています。

![図1：Webアプリケーションファイアウォールは一般的な攻撃から保護します。](./web-application-firewall/images/01.png)

```{note}
[共有クラスタサブスクリプション](../../reference/platform-limitations.md#security) では、カスタムファイアウォールルールは使用できません。
```

## ModSecurityの有効化

ModSecurityはデフォルトで無効になっています。 これを有効にするには、 `LCP_WEBSERVER_MODSECURITY` [環境変数](../../platform-services/web-server-service.md#environment-variables) を、プロジェクトリポジトリの `webserver/LCP.json` ファイルに追加してください。 攻撃検知ルールは、ModSecurityが有効な場合のみ処理されます。 [独自のルールを追加する必要があります](#adding-attack-detection-rules) .

これらの値は、 `LCP_WEBSERVER_MODSECURITY`で許可されています。

***On** : ModSecurityを有効にします。 攻撃検知ルールが処理される。

***Off** : ModSecurity を無効にします。 ルールが処理されない。

***DetectionOnly** : ModSecurity を有効にします。 ルールは処理されるが、破壊的なアクションは実行されない（ブロック、拒否、ドロップ、許可、プロキシ、リダイレクト）。

```{tip}
環境変数`LCP_WEBSERVER_MODSECURITY` は ModSecurity自身の [`SecRuleEngine`ディレクティブ](https://github.com/SpiderLabs/ModSecurity/wiki/Reference-Manual-%28v3.x%29#SecRuleEngine) と同等です。
```

ModSecurity を有効にするには、 `LCP_WEBSERVER_MODSECURITY` の値を `On` または `DetectionOnly`に設定し、 [変更をデプロイします。](../../build-and-deploy/deploying-changes-via-the-cli-tool.md).

## ModSecurityの設定変更

ModSecurityの設定はデフォルトを推奨します。 デフォルトの設定を上書きするには、プロジェクトリポジトリの `websecerver/configs/{ENV}/modsec/` ディレクトリに `modsecurity.conf` ファイルを作成します。 Liferay Cloud のデフォルト `modsecurity.conf`を完全に上書きするため、必要な設定をすべて行う必要があります。

[この推奨設定例](https://github.com/SpiderLabs/ModSecurity/blob/v3/master/modsecurity.conf-recommended) をコピーして、独自の `modsecurity.conf` ファイルの出発点としてください。 このファイルを使用する場合は、 `SecRuleEngine DetectionOnly` の行をこの行に置き換えてください。

```
SecRuleEngine ${LCP_WEBSERVER_MODSECURITY}
```

許可された設定の詳細については、 [ModSecurity Reference Manual](https://github.com/SpiderLabs/ModSecurity/wiki/Reference-Manual-%28v3.x%29) を参照してください。

## 攻撃検知ルールの追加

攻撃検知ルールはデフォルトでは提供されません。 あなたの特定のニーズに従ってルールを提供する必要があります。

### OWASP ModSecurity コアルールセット

OWASP FoundationのModSecurity Core Rule Set（CRS）は、Liferay Cloudでの使用を推奨しています。 OWASP CRS [はこちらからダウンロードできます](https://coreruleset.org/installation/) .

ModSecurityにOWASP CRSを追加するには。

1. ダウンロードしたアーカイブをリポジトリフォルダに解凍します `webserver/configs/{ENV}/modsec/rules/`.

1. `crs-setup.conf.example` を `webserver/configs/{ENV}/modsec/` フォルダに移動します。

1. `crs-setup.conf.example` を `crs-setup.conf`にリネームしてください。

1. `crs-setup.conf` ファイルを開き、ファイルの最終行に以下を追加してください。

```
/etc/nginx/modsec/rules/*.conf
```

1. ファイルをリポジトリにコミットし、 [変更をデプロイします。](../../build-and-deploy/deploying-changes-via-the-cli-tool.md).

ルールセットは、 [ModSecurity](#enabling-modsecurity) を有効にした時点で解釈されます。

## ModSecurity監査ログの使用

[を有効にすると、](#enabling-modsecurity) 、ModSecurity は自動的に監査ログを生成し、すべてのトランザクションの詳細情報を記録します。 ログに記録された情報を見るには、Web サーバーの `/var/log` ディレクトリにある `modsec_audit.log` ファイルを開いてください。

[](#changing-modsecuritys-configuration) 独自の modsecurity.conf ファイルを提供して ModSecurity を設定する場合、 modsec_audit.log の代わりに、Web サーバのコンソール (ダウンロードできる場所) に情報を記録することが可能です。 `` `` `modsecurity.conf` ファイル内のこの行を変更してください。

```
SecAuditLog /var/log/modsec_audit.log
```

`/var/log/modsec_audit.log` を `/dev/stdout` に置き換えると、各トランザクションの監査ログがコンソールに表示されます。 監査ログは、変更を展開した時点で表示されます。

必要であれば、 `modsecurity.conf` ファイルに1行追加して、監査ログの形式をJSONに変更します。

```
SecAuditLogFormat JSON
```

## 関連トピック

* [プライベートネットワーク](../networking/private-network.md)
* [ロードバランサー](../networking/load-balancer.md)
* [CDN](../networking/load-balancer.md#cdn)
