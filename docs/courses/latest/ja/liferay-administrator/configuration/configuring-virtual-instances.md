# 仮想インスタンスの設定

{bdg-secondary}`LXC-SM またはセルフホスト`

独自のサイト、ユーザー、組織を持つ別のLiferay環境が必要なビジネスユースケースがあるかもしれません。 新しいサーバーを立ち上げるのではなく、仮想インスタンスを作成することができる。

例えば、クラリティ・ビジョン・ソリューションズ社では、社外向けの一般向けウェブサイトと、「Glance」と呼ぶ従業員向けの社内イントラネットの両方を持っている。 これらは仮想インスタンスを使って構築される。

## LXCの仮想インスタンス

仮想インスタンスの設定については、Liferayクラウドのサポート担当者にお問い合わせください。

## LXC-SMとセルフホストにおける仮想インスタンス

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Virtual Instances** に移動する。

1. **追加** ボタン (![Add icon](../../images/icon-add.png)) をクリックし、以下の情報を入力します。

   * Web ID: `glance.clarityvisionsolutions.com`
   * バーチャルホスト： `glance.clarityvisionsolutions.com`
   * メールドメイン: `clarityvisionsolutions.com`
   * 最大ユーザー数 `0` (注、これは無制限ユーザーを意味します)
   * アクティブ：トグル・オン
   * 仮想インスタンス・イニシャライザ： **ブランク・サイト** を選択する。

   ![仮想インスタンス情報を入力します。](./configuring-virtual-instances/images/01.png)

［**保存**］ をクリックします。 新しい仮想インスタンスの準備ができました。

1. これは本当の外部ホスト・サイトではないので、ローカル・システムの `/etc/hosts` ファイルにドメインを追加する。

   `127.0.0.1 glance.clarityvisionsolutions.com`

   ```{note}
   docker コンテナを使用する場合は、--add-host glance.clarityvisionsolutions.com:127.0.0.1` エントリを run コマンドに含める必要があります。
   ```

1. 仮想インスタンスが正常に追加されたら、 `http://glance.clarityvisionsolutions.com:8080/`に移動します。

   ![新しい仮想インスタンスは使用可能です。](./configuring-virtual-instances/images/02.png)

## 新しいインスタンスの管理者を作成する

仮想インスタンスは個別のLiferayインスタンスです。 作成した新しいインスタンスにはユーザー・アカウントがありません。 Kyle Kleinにもこのインスタンスを管理できるようにする。

その方法を思い出す必要があれば、 [、](../users-accounts-organizations/managing-users.md#create-an-administrator) 、指示に従って彼を登録し、このインスタンスの管理者にしてください。

次のステップは、 [インスタンス設定](./configuring-instance-settings.md)。

## 関連コンセプト

- [仮想インスタンスについて](https://learn.liferay.com/en/w/dxp/system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances)
- [仮想インスタンスの追加](https://learn.liferay.com/en/w/dxp/system-administration/configuring-liferay/virtual-instances/adding-a-virtual-instance)
