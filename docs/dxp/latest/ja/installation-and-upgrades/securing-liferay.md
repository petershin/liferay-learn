---
toc:
- ./securing-liferay/authentication-basics.md
- ./securing-liferay/configuring-sso.md
- ./securing-liferay/multi-factor-authentication.md
- ./securing-liferay/using-antisamy.md
- ./securing-liferay/securing-web-services.md
---
# Liferayの保護

Liferay DXPは、セキュリティに配慮して構築されています。 これには、 [OWASP Top 10](https://www.owasp.org/index.php/Top_10_2013-Top_10) や [CWE/SANS Top 25](https://www.sans.org/top25-software-errors/) で説明されているような一般的なセキュリティ脆弱性やエクスプロイトの緩和が含まれます。

Liferayのインストールを保護するには、いくつかの側面があります-ホスティング環境、データベース、検索プロバイダー、アプリケーションサーバー、Liferay DXP自体のベストセキュリティプラクティスに従うことを含みますが、これらに限定されるものではありません。

```{note}
たとえば、Liferay DXPは、HTTPヘッダーのCRLFのサニタイズをアプリケーションサーバーに依存しています。 これがアプリケーションサーバーで適切に設定されていることを確認する必要があります。 この構成をスキップすると、Veracodeなどのセキュリティ検証製品がセキュリティレポートで誤検知のフラグを立てることがあります。
```

ここでは、Liferay DXP自体を保護するための基本的な要素について学びます。 これには、Liferay DXPインストールに対するユーザーの認証方法の設定、ユーザーへの権限付与、Liferay DXPウェブサービスへの安全なアクセスの設定、必要に応じてのセキュリティ機能の微調整が含まれます。

```{important}
セキュリティパッチがリリースされたら、それらを展開することをお勧めします。 コミュニティとCEのインストールの場合は、以前のセキュリティパッチがすべて含まれている最新のコミュニティリリースを常に使用することをお勧めします。
```

## 認証

LiferayDXP認証は柔軟です。 デフォルトでは、ユーザーは ［**Sign In**］ ウィジェットを使用してLiferay DXPにログインします。このウィジェットでは、データベースを使用してユーザーを認証します。 デフォルトでは、ゲストは［Sign In］ウィジェットを使用して、デフォルトの権限を持つアカウントを作成できます。 デフォルトの認証体験のほぼすべての要素は、管理者が変更することができます。 例:

* [多要素認証](./securing-liferay/multi-factor-authentication/using-multi-factor-authentication.md)を設定できます。
* [SSOを使用して](./securing-liferay/configuring-sso.md)認証を管理できます。
* Liferayは、ポータルデータベースを使用する代わりに、[LDAPと統合](../users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory.md)してユーザーを検証することもできます。
* ゲストアカウントの作成を [オフ](./securing-liferay/authentication-basics.md#disabling-guest-account-creation) にすることができます。

詳細は、 [認証の基本](./securing-liferay/authentication-basics.md) をご覧ください。

## 権限設定

Liferay DXPは、堅牢なロールベースアクセスコントロール（RBAC）システムを備えています。 ユーザーは、サイト、チーム、ユーザーグループ、または組織に割り当てることができます。 カスタムロールを作成し、そのロールに権限を付与し、そのロールをユーザーに割り当てることができます。 ロールは、サイト、組織、グローバルなど、特定のコンテキストにのみ適用されるようにスコープされています。 詳細は、[ロールと権限](../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md)を参照してください。

## Webサービスの保護

Liferay Web Services は、セキュリティと認可に対して多層的で設定可能なアプローチを持っています。

* [Service Access Policies](./securing-liferay/securing-web-services/setting-service-access-policies.md) リモートAPIへのアクセスを制御する。
* [Authentication Verifiers](./securing-liferay/securing-web-services/using-authentication-verifiers.md) 提供されたクレデンシャルを検証する。
* [Cross-Origin Resource Sharing](./securing-liferay/securing-web-services/setting-up-cors.md) 信頼できるソースのみからリソースを取得できるように設定することができます。

詳細は、[Webサービスの保護の概要](./securing-liferay/securing-web-services.md)を参照してください。

## セキュリティの微調整

追加のセキュリティ機能を細かく調整したり、無効にしたりする方法はたくさんあります。

* Liferay PortalのHTTPS [Webサーバー](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) アドレスを設定する。
* ユーザーを [リダイレクト](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) できる許可されているサーバーのリストを構成する。
* 任意のページからアクセスできる [ポートレット](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) のリストを構成する。
* アップロードおよびダウンロードを許可するファイルタイプを設定する。

これらの機能は、 [ポータルプロパティ](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) を使用して構成できます。

```{warning}
Liferayポータルの理念は「デフォルトで安全」です。 セキュリティ固有のデフォルトまたはホワイトリストを変更する場合は、十分に注意してください。 このようなアクションは、セキュリティの設定ミスや安全でないデプロイにつながる可能性があります。
```

## 関連トピック

Liferay Portalのインストールのセキュリティ保護の詳細は、 [当社のセキュリティステートメント](https://www.liferay.com/security) 、 [コミュニティセキュリティチーム](https://portal.liferay.dev/people/community-security-team) 、およびこれらのページに記載されているリソースを参照してください。

[Liferay Marketplace](https://www.liferay.com/marketplace) から入手可能な追加のセキュリティプラグインがあります。

## 次のステップ

* [認証の基本](./securing-liferay/authentication-basics.md)
* [Webサービスの保護の概要](./securing-liferay/securing-web-services.md)
