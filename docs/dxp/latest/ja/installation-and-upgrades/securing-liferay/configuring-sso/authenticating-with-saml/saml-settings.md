# SAML設定

多くの同じフィールドが、サービス・プロバイダーとアイデンティティ・プロバイダーの両方の設定に表示されます。 以下は参考です。

**名前：** SPもしくはIdPに名前を付けます。 これは単なる説明用の名前であり、設定には使用されません。

**エンティティID：** このSPまたはIdPの正式名称です。 接続を設定する場合は、この名前と一致させる必要があります。

**Enabled：** このボックスをオンにすると、このSAMLプロバイダーが有効になります。

**許容時刻誤差(クロックスキュー)：** SPとIdPの時差の許容誤差をミリ秒単位で設定します。

**Authnを強制する：** このボックスをオンにすると、サービス・プロバイダーがユーザーを確認する前に、アイデンティティ・プロバイダーにユーザーの再認証を要求します。

**不明なユーザーはゲストです：** ゲストの動作は、コントロールパネル -> インスタンス設定 -> プラットフォーム -> ユーザー認証 -> 一般で定義されます。

**メタデータ：** サービス・プロバイダーのメタデータXMLファイルのURLを指定するか、サービス・プロバイダーのメタデータXMLファイルを手動でアップロードしてください。 URLを指定すると、XMLファイルを取得し、定期的に更新のためのポーリングを行います。 更新間隔は、システム設定で、秒数を指定するランタイム メタデータの更新間隔 (`saml.metadata.refresh.interval` if using a `config` file) プロパティを使用して設定できます。 URLによるメタデータXMLファイルの取得に失敗した場合、サービス・プロバイダー接続を有効にすることはできません。 アイデンティティ・プロバイダーサーバーがURL経由でメタデータにアクセスできない場合、XMLファイルを手動でアッ プロードできます。 この場合、メタデータXMLファイルの自動更新は行われません。

**名前識別子：** [SAML仕様](http://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf) のセクション8.3で利用可能なオプションから名前識別子フォーマットを選択します。 サービス・プロバイダーが受信することを想定する内容に従って設定します。 Liferayサービス・プロバイダーの場合、メールアドレス以外の選択は、名前識別子がスクリーン名を指していることを示します。 これらのフォーマットは、Liferayアイデンティティ・プロバイダーにとって特別な意味を持ちません。 `NameID` の値は、名前識別子属性で定義されます。

**ユーザーの解決：** マッチなし、名前 ID の形式に応じて動的に選択されるユーザーフィールドにマッチする、または特殊な SAML 属性マッピングを使用してマッチする、から選択します。 このアルゴリズムは、ユーザーの検索方法またはプロビジョニング方法を決定します。 例えば、名前IDの形式に応じて選択し、名前IDの形式がメールアドレスの場合、メールアドレスでアルゴリズムがマッチします。

**属性マッピング：** LiferayからSAML属性とマッチするフィールドを選択します。 Liferayのユーザーオブジェクトからいくつかのフィールドを選択するか、ユーザーオブジェクトに作成したカスタムフィールドを選択することができます。 これらの属性は、ユーザーがシステムにログインしたときに、SAMLアサーションから更新されます。 デフォルトでは、 `NameID`とサービス・プロバイダーは、 `emailAddress` が少なくとも1度マッチした後にユーザーにバインドされるようになっています。 バインディングは、ユーザーマッチングを行う前に優先的に確認されるため、メールアドレスが変更されたユーザーがログインできなくなることはなく、メールアドレスはSAML属性マッピングで修正することが可能です。

**キープアライブ** ユーザーが Liferay IdP を介して複数の Liferay SP インスタンスにログインしている場合、そのうちの 1 つにブラウザウィンドウを開いたままであれば、セッションを維持することができます。 SPがLiferay DXPの場合のみ設定します。 URLは、`https://[SP host name]/c/portal/saml/keep_alive`です。

## OSGi構成プロパティ

[OSGi設定ファイル](../../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md) やメタデータXMLをアップロードして接続のネゴシエーション方法を設定することで、UIの外で SAMLを設定することができます。

前述したように、SP接続の設定に関することは、SAML管理UIで行う必要があり、そこで設定はLiferayのデータベースに保存されます。

```{note}
OSGi の `.config` ファイルやLiferay DXPのシステム設定コントロールパネルアプリケーションを使用して、SAMLプロバイダー（IdP または SP）を設定しないでください。 システム設定UIは自動生成されるもので、上級管理者向けです。 SAML管理UI が行うフィールドの強化された入力値の検証は行われないため、管理者は無効な設定を作成することができます。
```

これは、OSGi設定管理で管理できるポータルインスタンスに対応した設定です。 影響を受けるプロパティは、 `SAMLProviderConfiguration` メタタイプに含まれるものです。

* `keyStoreCredentialPassword()`
* `keyStoreEncryptionCredentialPassword()`
* `assertionSignatureRequired()`
* `authnRequestSignatureRequired()`
* `clockSkew()`
* `defaultAssertionLifetime()`
* `entityId()`
* `enabled()`
* `ldapImportEnabled`
* `role()`
* `sessionMaximumAge`
* `sessionTimeout()`
* `signAuthnRequest()`
* `signMetadata()`
* `sslRequired()`
* `allowShowingTheLoginPortlet()`

SAML管理UIは、ポータルインスタンススコープの構成インスタンスを作成する場所として残されています。

`SamlConfiguration`メタタイプで表される、システム全体の設定もあることに注意してください。

Liferay 6.2を使用していた場合、以下のシステムワイドプロパティが削除されたことに注意してください。

* `saml.metadata.paths` （SP接続のデフォルトを削除した後は何の意味もありません。)
* `saml.runtime.metadata.max.refresh.delay`
* `saml.runtime.metadata.min.refresh.delay`

後者の2つのプロパティは、単一のプロパティに置き換えられました。`com.liferay.saml.runtime.configuration.SamlConfiguration.getMetadataRefreshInterval()`

また、 ［**コントロールパネル**］ &rarr; ［**システム設定**］ &rarr;［セキュリティ］&rarr;SSOでの［SAML KeyStoreManager インプリメンテーション設定］の導入についても注意してください。 この設定のオプションは、 [システムレベルでのSAMLの設定](./configuring-saml-at-the-system-level.md) で説明されています。

最近のバージョンでは、 `SHA256` が設定および鍵の生成に使用されるデフォルトの暗号化アルゴリズムです。 デフォルト設定は、`SHA256`、次に `SHA384`、そして `SHA512` を経て `SHA1`にフォールバックしようとします。 `SHA1` は潜在的に脆弱であるため、このプロパティを使用してブラックリスト化することが可能です。

```properties
blacklisted.algorithms=["blacklisted_algorithm_url", "another_blacklisted_algorithm_url"]
```

`SHA1`をブラックリスト化するには、以下のような設定になります。

```properties
blacklisted.algorithms=["http://www.w3.org/2000/09/xmldsig#sha1"]
```

これらをこの名前の設定ファイルに配置します。

```bash
com.liferay.saml.opensaml.integration.internal.bootstrap.SecurityConfigurationBootstrap.config
```

メタデータXMLを設定すれば、接続のネゴシエーションの方法をもっと細かく設定できます。

## metadata.xmlによるネゴシエーションの設定

デフォルトのネゴシエーション設定がうまくいかない場合は、独自の設定を作成し、アップロードできます。 この作業を行う前に、ホストのメタデータURLにアクセスし、後で必要になる場合に備えて設定のコピーを保存しておいてください。

```
http://[hostname]/c/portal/saml/metadata
```

例えば、 `SHA1`しかサポートしていないレガシーIdPへの接続に行き詰まった場合、他のアルゴリズムを無効化する設定をアップロードできます。

```xml
<?xml version="1.0" encoding="UTF-8"?>
<md:EntityDescriptor xmlns:md="urn:oasis:names:tc:SAML:2.0:metadata" entityID="samlidp">
  <md:IDPSSODescriptor WantAuthnRequestsSigned="true" protocolSupportEnumeration="urn:oasis:names:tc:SAML:2.0:protocol">
    <md:Extensions>
      <alg:SigningMethod xmlns:alg="urn:oasis:names:tc:SAML:metadata:algsupport" Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1"/>
    </md:Extensions>
    <md:KeyDescriptor use="signing">
      <ds:KeyInfo xmlns:ds="http://www.w3.org/2000/09/xmldsig#">
        <ds:X509Data>
          <ds:X509Certificate>... omitted ...</ds:X509Certificate>
        </ds:X509Data>
      </ds:KeyInfo>
    </md:KeyDescriptor>
    <md:SingleLogoutService Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST" Location="http://localhost:8080/c/portal/saml/slo"/>
    <md:SingleLogoutService Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect" Location="http://localhost:8080/c/portal/saml/slo"/>
    <md:SingleSignOnService Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect" Location="http://localhost:8080/c/portal/saml/sso"/>
    <md:SingleSignOnService Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST" Location="http://localhost:8080/c/portal/saml/sso"/>
  </md:IDPSSODescriptor>
</md:EntityDescriptor>
```

上記の設定では、 `<md:Extensions>` ブロックは1つの署名アルゴリズム：`SHA1`しか持っていないことに注意してください。

```{note}
デフォルトの設定は `SHA1` にフォールバックするので、レガシーシステムがフォールバックメカニズムでネゴシエートできない場合を除き、これを行う必要はありません。 また、`SHA1`をブラックリスト化している場合は、動作しないことに注意してください。 [SHA1の脆弱性](https://en.wikipedia.org/wiki/SHA-1) があるため、可能であれば完全に使用を控えた方がよいでしょう。
```

メタデータ設定を変更した場合、変更前に保存していれば、デフォルトの設定に戻すことができます。 そうでない場合は、アップロードされたXMLファイルの代わりに、ピアのメタデータ設定の1つにURLを提供することができます。
