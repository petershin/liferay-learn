---
toc:
  - ./configuration/configuring-system-settings.md
  - ./configuration/configuring-virtual-instances.md
  - ./configuration/configuring-instance-settings.md
  - ./configuration/server-administration-and-email.md
---
# 設定

Liferayがインストールされるか、LXCまたはLXC-SMでインスタンスが作成された後、物語は始まる。 クラリティ・ビジョン・ソリューションズのIT管理者は、お客様のご協力を得て、ウェブサイトとそのコンテンツを作成できるようにシステムを設定し、ユーザーを登録する必要があります。

多くの設定は、スコープやレベルの階層で構成することができる。 より詳細なスコープ設定は、その上の設定に優先する。 例えば、サイト・レベルのコンフィギュレーション・セットは、システム・レベルやインスタンス・レベルのコンフィギュレーションに優先します。 こうすることで、スコープ（インスタンスやサイト）のオーナーがオーバーライドできる、賢明なデフォルトを設定することができる。 詳しくは [設定スコープについて](https://learn.liferay.com/w/dxp/system-administration/configuring-liferay/understanding-configuration-scope) 。

完成したコンフィギュレーションには以下が含まれる。

* アップロードされたファイルをスキャンするウイルス対策ソフトウェア
* 2つの社内サイト（パートナー向けB2Bサイトと社内イントラネット）用の独立した仮想インスタンス
* 仮想インスタンス用の個別のユーザー認証設定
* 接続されているメールサーバー

最初のステップは「システム設定の構成」です。

[次：顧客に最適なデプロイオプションを決定する](./configuration/configuring-system-settings.md)
