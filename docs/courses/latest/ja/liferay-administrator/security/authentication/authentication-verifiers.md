# 認証ベリファイア

{bdg-secondary}`LXC-SM またはセルフホスト`

認証ベリファイアは、提供されたクレデンシャル（ユーザー名/パスワード、トークン、HTTPヘッダ、パラメータなど）がユーザーアカウントにマッチするかどうかを判断するコードの内部インスタンスです。 Liferayには、リモートクライアントがHTTP Basic認証を使用する場合、リクエストパラメータに認証情報を送信する場合、 `JSESSIONID`を使用する場合、その他の共有シークレットを使用する場合など、最も一般的な状況に対応する実装が組み込まれています。

認証ベリファイア **は、** クレデンシャルを提供するのではなく、認証されたセッションとともに、すでに提供された既存のクレデンシャルを検証するだけであることに注意することが重要である。

## 認証ベリファイアの設定

クラリティ・ビジョン・ソリューションズは、使用しない特定の機能をロックダウンしたいと考えている。 ファイル変換のためにインスタンスをLibreOffice/OpenOfficeに接続する予定がないため、画像要求認証ベリファイアをオフにすることにした。

1. **コントロールパネル** &rarr; **システム設定** &rarr; **セキュリティ** &rarr; **API 認証** にアクセスする。

1. Image Request認証ベリファイアはリストの最初にあるので、すでに選択されている。 **Enabled** チェックボックスのチェックを外す。

1. ［**保存**］ をクリックします。

![画像リクエスト認証は LibreOffice でのみ使用されます。](./authentication-verifiers/images/01.png)

これでImage Request認証ベリファイアが無効になりました。 その他に何をするのかについては、以下のリンクを参照のこと。

次へ [パスワードポリシー](./password-policies.md)

## 関連コンセプト

[Authentication Verifierの使用](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/securing-web-services/using-authentication-verifiers)
