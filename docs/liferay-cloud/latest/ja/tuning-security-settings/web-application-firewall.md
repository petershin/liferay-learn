# Webアプリケーションファイアウォール

{bdg-secondary}`Liferay Cloud 5.x.x`

Liferay Cloud には [ModSecurity](https://github.com/SpiderLabs/ModSecurity) という Web アプリケーションファイアウォールが含まれています。 Webサーバーに送信されたリクエストを、あらかじめ定義されたカスタムルールと照らし合わせて検査します。 このステップでは、XSS、SQLインジェクションなどの典型的なWebアプリケーションのリアルタイムL7攻撃や、機密情報の損失につながる可能性のあるその他の形式の乗っ取りを防止します。

Liferay クラウドには、 [プライベートネットワーク](../networking/private-network.md) 、パブリック [ロードバランサー](../networking/load-balancer.md) ( [レイヤー7](https://www.nginx.com/resources/glossary/layer-7-load-balancing/) )、 [CDN](../networking/load-balancer.md#cdn) などのネットワークセキュリティ機能が追加されています。

![Figure 1: The Web Application Firewall protects against common attacks.](./web-application-firewall/images/01.png)

```{note}
カスタムファイアウォールルールは、 [共有クラスタサブスクリプション](../../reference/platform-limitations.md#security) では使用できません。
```

## ModSecurityの有効化

ModSecurityはデフォルトで無効になっています。 これを有効にするには、`LCP_WEBSERVER_MODSECURITY` [環境変数](../../platform-services/web-server-service.md#environment-variables) をプロジェクトリポジトリの `webserver/LCP.json` ファイルに追加する。 攻撃検知ルールは、ModSecurityが有効な場合のみ処理されます。 [](#adding-attack-detection-rules) 独自のルールを追加する必要がある。

これらの値は `LCP_WEBSERVER_MODSECURITY` で使用できる：

* **On** : ModSecurityを有効にする。 攻撃検知ルールが処理されます。

* **Off** ：ModSecurityを無効にします。 ルールが処理されません。

* **DetectionOnly** ：ModSecurityを有効にする。 ルールは処理されますが、破壊的なアクション（ブロック、拒否、ドロップ、許可、プロキシ、リダイレクト）は実行されません。

```{tip}
環境変数 `LCP_WEBSERVER_MODSECURITY` は ModSecurity の [`SecRuleEngine` ディレクティブ](https://github.com/SpiderLabs/ModSecurity/wiki/Reference-Manual-%28v3.x%29#SecRuleEngine) と同じです。
```

ModSecurity を有効にするには、`LCP_WEBSERVER_MODSECURITY` の値を `On` または `DetectionOnly` に設定してから、 [変更を配置する](../../build-and-deploy/deploying-changes-via-the-cli-tool.md) 。

## ModSecurityの設定を変更する

ModSecurityの設定はデフォルトを推奨します。 デフォルトの設定を上書きするには、プロジェクトリポジトリの `webserver/configs/{ENV}/modsec/` ディレクトリに `modsecurity.conf` ファイルを作成します。 これはLiferay Cloudのデフォルトの`modsecurity.conf`を完全に上書きするので、必要な設定をすべて提供する必要があります。

コピー [この推奨設定例](https://github.com/SpiderLabs/ModSecurity/blob/v3/master/modsecurity.conf-recommended) を、あなた自身の `modsecurity.conf` ファイルの出発点としてください。 このファイルを使用する場合は、`SecRuleEngine DetectionOnly` という行をこの行に置き換えてください：

```
SecRuleEngine ${LCP_WEBSERVER_MODSECURITY}
```

許可される設定の詳細については、 [ModSecurity Reference Manual](https://github.com/SpiderLabs/ModSecurity/wiki/Reference-Manual-%28v3.x%29) 。

## 攻撃検知ルールの追加

攻撃検知ルールはデフォルトでは提供されません。 お客様指定のニーズに従ってルールを提供する必要があります。

### OWASP ModSecurity Core Rule Set

OWASP Foundation の ModSecurity Core Rule Set (CRS) は Liferay Cloud での使用を推奨しています。OWASP CRSは [こちら](https://coreruleset.org/installation/) からダウンロードできます。

ModSecurityにOWASP CRSを追加するには：

1. ダウンロードしたアーカイブをリポジトリフォルダ `webserver/configs/{ENV}/modsec/rules/` に解凍します。

1. `crs-setup.conf.example`を`webserver/configs/{ENV}/modsec/` フォルダに移動する。

1. `crs-setup.conf.example`を`crs-setup.conf` にリネームする。

1. `crs-setup.conf`ファイルを開き、ファイルの最終行に以下を追加する：

```
/etc/nginx/modsec/rules/*.conf
```

1. ファイルをリポジトリにコミットし、 [変更をデプロイする](../../build-and-deploy/deploying-changes-via-the-cli-tool.md) 。

[ModSecurity](#enabling-modsecurity) を有効にすると、ルールセットは解釈される。

## ModSecurity監査ログの使用

[有効にする](#enabling-modsecurity) と、ModSecurityは自動的に監査ログを生成し、すべてのトランザクションの詳細情報を記録します。 ログに記録された情報を見るには、ウェブサーバの `/var/log` ディレクトリにある `modsec_audit.log` ファイルを開きます。

[`modsecurity.conf`ファイル](#changing-modsecuritys-configuration) を提供して ModSecurity を設定する場合、`modsec_audit.log` の代わりにウェブサーバーのコンソール（ダウンロード可能）に情報を記録することができます。 modsecurity.conf`ファイルのこの行を変更してください：

```
SecAuditLog /var/log/modsec_audit.log
```

各トランザクションの監査ログをコンソールに表示するには、`/var/log/modsec_audit.log` を `/dev/stdout` に置き換える。 監査ログは、変更をデプロイした時点で表示されます。

必要であれば、`modsecurity.conf`ファイルに1行追加して、監査ログのフォーマットをJSONに変更してください：

```
SecAuditLogFormat JSON
```

## 関連トピック

* [プライベート・ネットワーク](../networking/private-network.md)
* [ロードバランサー](../networking/load-balancer.md)
* [CDN](../networking/load-balancer.md#cdn)
