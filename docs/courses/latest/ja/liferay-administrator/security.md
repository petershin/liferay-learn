---
toc:
  - ./tuning-security-settings/authentication.md
  - ./tuning-security-settings/securing-web-services.md
  - ./tuning-security-settings/authorizing-and-single-sign-on.md
  - ./tuning-security-settings/managing-antisamy.md
---
# セキュリティ

Liferayの哲学は "デフォルトで安全 "だ。 つまり、デフォルトのインストレーションのコンフィギュレーションはすぐにセキュアになるということだ。 しかし、セキュリティをあなたのニーズに近づける方法はたくさんある。 これらの方法にはいくつかのカテゴリーがある：

- 認証
- Webサービスの保護
- シングルサインオン
- AntiSamy

これらのカテゴリーは、デフォルトのままではなく、あなたの組織のデザインに合うように調整することができます。 ここでは、クラリティ・ビジョン・ソリューションズのニーズに合わせてLiferayのインストールを設定します。

まず、ユーザーがシステムにログオンする方法を設定する。 次に、デフォルトで設定されている認証ベリファイアを調整する。 その後、多要素認証を有効にします。

認証を設定したら、次はウェブ・サービスのセキュリティを確保する。 製品に同梱されているサービス・アクセス・ポリシーを調整し、Documents and Mediaで画像のCORS（Cross-Origin Resource Sharing）を有効にします。

その後、シングルサインオンを見て、ユーザがLiferayを使って複数のシステムにサインインできるようにSAML（Security Assertion Markup Language）を設定します。 最後に、OAuth 2を使ってアプリの認可を設定する。

最後に設定する機能は、 [AntiSamy](https://owasp.org/www-project-antisamy) サニタイザーで、HTML または CSS だけが許可されている場所に JavaScript コードを注入しようとするユーザーからインストールを保護します。

これらのトピックでは、Liferayのセキュリティ機能の多くを紹介します。 詳しくは、Liferay Learnの [Liferayの保護](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay) をご覧ください。

準備完了?

[次：顧客に最適なデプロイオプションを決定する](./tuning-security-settings/authentication.md)
