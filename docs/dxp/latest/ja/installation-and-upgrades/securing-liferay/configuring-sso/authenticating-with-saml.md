---
toc:
  - ./authenticating-with-saml/saml-authentication-process-overview.md
  - ./authenticating-with-saml/configuring-saml-at-the-system-level.md
  - ./authenticating-with-saml/saml-admin.md
  - ./authenticating-with-saml/importing-user-groups-memberships-from-an-external-idp-through-saml.md
  - ./authenticating-with-saml/configuring-saml-at-the-instance-level.md
  - ./authenticating-with-saml/saml-settings.md
---
# SAMLによる認証

SAML（Security Assertion Markup Language）アダプターは、シングルサインオン（SSO）とシングルログオフ（SLO）をデプロイ環境に提供します。 SAMLは、アイデンティティプロバイダー（IdP）とサービスプロバイダー（SP）を使用して機能します。

**アイデンティティプロバイダー：** ユーザーが他のWebサイトにアクセスするためのシングルサインオンを提供する信頼できるシステム。

**サービスプロバイダー：** アプリケーションをホストし、適切な認証情報を持つ識別されたユーザーにのみアクセスを許可するWebサイト。

Liferay DXPインスタンスは、サービスプロバイダー（SP）またはアイデンティティプロバイダー（IdP）のいずれかとして機能できます。

```{note}
単一のLiferay DXPインスタンスは、SSOセットアップにおけるSPまたはIdPのいずれかであり、両方にすることはできません。 ただし、両方の目的で別々のインスタンスを使用できます（たとえば、一方のインスタンスをSPにし、もう一方をIdPにするなど）。
```

SAMLの構成に直接移動するか、SAMLがどのように機能するかを学ぶことができます。

* [SAML Authentication Process Overview (近日公開！)](./authenticating-with-saml/saml-authentication-process-overview.md)
* [システムレベルでのSAMLの設定](./authenticating-with-saml/configuring-saml-at-the-system-level.md)
* [SAML管理](./authenticating-with-saml/saml-admin.md)
* [SAMLを介した外部IdPからのユーザーグループのメンバーシップのインポート](./authenticating-with-saml/importing-user-groups-memberships-from-an-external-idp-through-saml.md)
* [インスタンスレベルでのSAML設定](./authenticating-with-saml/configuring-saml-at-the-instance-level.md)
* [SAML設定リファレンス](./authenticating-with-saml/saml-settings.md)
