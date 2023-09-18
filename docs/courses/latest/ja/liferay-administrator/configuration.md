---
toc:
  - ./configuration/configuring-system-settings.md
  - ./configuration/configuring-virtual-instances.md
  - ./configuration/configuring-instance-settings.md
  - ./configuration/server-administration-and-email.md
---
# 設定

Liferayがインストールされるか、LXCまたはLXC-SMでインスタンスが作成された後、物語は始まる。 Delectable BonsaiのIT管理者は、あなたの助けを借りて、システムを設定し、ウェブサイトとそのコンテンツを作成できるようにユーザーを登録しなければなりません。

多くの設定は、スコープやレベルの階層で構成することができる。 より詳細なスコープ設定は、その上の設定に優先する。 例えば、サイト・レベルのコンフィギュレーション・セットは、システム・レベルやインスタンス・レベルのコンフィギュレーションに優先します。 こうすることで、スコープ（インスタンスやサイト）のオーナーがオーバーライドできる、賢明なデフォルトを設定することができる。 詳しくは [設定スコープについて](https://learn.liferay.com/dxp/latest/ja/system-administration/configuring-liferay/understanding-configuration-scope.html) 。

完成したコンフィギュレーションには以下が含まれる。

* アップロードされたファイルをスキャンするウイルス対策ソフトウェア。
* 自社ブランドで販売するDelectable Bonsaiシロップを購入する企業のための別個の仮想インスタンス。
* 仮想インスタンスに対する個別のユーザー認証設定。
* 接続されているメールサーバー。

最初のステップは「システム設定の構成」です。

[続きはこちら](./configuration/configuring-system-settings.md)
