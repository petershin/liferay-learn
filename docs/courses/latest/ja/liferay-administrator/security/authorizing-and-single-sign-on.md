---
toc:
  - ./authorizing-and-single-sign-on/authenticating-with-saml.md
  - ./authorizing-and-single-sign-on/authorizing-with-oauth2.md
---
# 認証とシングルサインオン

認証と認可はコインの裏表のようなものだ。 認証は、与えられたクレデンシャルがシステムに保存されているクレデンシャルと一致することを保証する。 認可は、すでに起こった認証によってリソースへのアクセスを許可する。 ここでは、Liferay が他のシステムから来た認証情報を使ってユーザーを認証する方法と、Liferay がユーザーに代わってリソースへのアクセスを承認するために [OAuth 2](https://oauth.net/2/) を使う方法について学びます。

Liferayは、レガシーシステム用のトークンベース、Open AM、CAS、OpenID Connect、Kerberos、Security Assertion Markup Language (SAML)など、シングルサインオンのための多くのエンタープライズオプションを提供しています。 クラリティ・ビジョン・ソリューションズは、ほとんどの組織と同様に、これらすべてを使用しているわけではないので、ここではSAMLに焦点を当てる。 その他のオプションについては、 [シングルサインオンの設定](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/configuring-sso) をご覧ください。

Liferayは、業界標準のOAuth 2.0が提供するトークン交換プロトコルでリソースへのアクセスを許可することもできます。 ここでは、Webクライアントからモバイルアプリ、ヘッドレスマイクロサービスまで、Liferayに保存されたリソースへのアクセスをユーザーに許可するOAuth 2プロファイルの設定方法を学びます。

[SAML による認証](./authorizing-and-single-sign-on/authenticating-with-saml.md)から始める。
