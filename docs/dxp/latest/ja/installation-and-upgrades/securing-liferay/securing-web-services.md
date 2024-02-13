---
toc:
- ./securing-web-services/setting-service-access-policies.md
- ./securing-web-services/using-authentication-verifiers.md
- ./securing-web-services/setting-up-cors.md
---
# Webサービスの保護

Liferay DXPは、Webサービスに4つのセキュリティレイヤーを提供しています。

**IP許可レイヤー。** Webサービス呼び出し要求の発信元IPアドレスは、ポータルのプロパティファイルでホワイトリスト化する必要があります。 ホワイトリストに登録されていないIPアドレスからのWebサービス呼び出しは、自動的に失敗します。

**サービスアクセスポリシー層。** Webサービスの呼び出し要求に対応するメソッドは、有効な各サービスアクセスポリシーによってホワイトリスト化される必要があります。 ワイルドカードを使用すると、明示的にホワイトリストに登録する必要のあるサービスクラスやメソッドの数を減らすことができます。

**認証/検証レイヤー（ブラウザのみ）。** Webサービス呼び出しのリクエストがブラウザから来る場合、リクエストには認証トークンが含まれていなければなりません。 この認証トークンは、 `p_auth` URL パラメータの値です。 トークンはLiferay DXPによって生成され、ブラウザセッションに関連付けられます。 JSON WebサービスのAPIページまたは`Liferay.Service(...)`を使用したJavaScriptを介してLiferay DXP Webサービスを呼び出すと、`p_auth`パラメータが自動的に提供されます。 Liferay DXPが呼び出し元の認証トークンをユーザーに関連付けることができない場合、Webサービス呼び出し要求は失敗します。

**ユーザーパーミッション層。** 適切に実装されたWebサービスには、パーミッションチェックがあります。 ウェブサービスを呼び出すユーザーは、サービスを呼び出すための権限を持っている必要があります。

## 承認

Liferay DXP には、いくつかの調整可能な認証レイヤーがあります。

* Liferay DXPのJavaサーブレットへのアクセスを制限するためのリモートIPおよびHTTPSトランスポートチェック
* ポータルサービス関連の認可チェックを行うExtensible Access Control Policies層
* Extensible [ロールベースのパーミッションフレームワーク](../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) for Liferay assets (stored in the database or elsewhere.)
* ポートレットへのアクセスを制御するポートレットコンテナセキュリティチェック
* リモートAPI認証方式におけるリモートIPチェック
* [Service Access Policies](./securing-web-services/setting-service-access-policies.md) リモートAPIへのアクセスを制御する。
* [Authentication Verifiers](./securing-web-services/using-authentication-verifiers.md) 提供されたクレデンシャルを検証するもの。
* [Cross-Origin Resource Sharing](./securing-web-services/setting-up-cors.md) 信頼できるソースのみからリソースを取得できるように設定することができます。
