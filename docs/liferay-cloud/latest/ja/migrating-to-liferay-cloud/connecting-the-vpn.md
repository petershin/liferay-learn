# ステージ 7:VPNを接続する

開発環境に必要であれば、クラウド環境をプライベートネットワークに接続することが移行の最終段階となります。 これは、VPNサーバーを設定（または更新）し、Liferay Cloudのコンソールで接続を設定するものです。

以下のような場合、Liferay Cloud 環境を VPN に接続する必要があります。

* 自社のプロジェクト要件でVPNを使用する場合
* あなたの環境を [LDAPディレクトリへの接続](https://learn.liferay.com/dxp/latest/ja/users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory.html?highlight=ldap) に接続したい。
* 別のディレクトリサーバーに環境を接続したい場合
* 他のウェブサービスと相互作用するリモートアプリケーションを使用する必要があります

VPNサーバーを設定する必要がない場合は、 [次のステップに進んでください。](#next-steps) .

## VPNサーバーの設定

Liferay Cloudと内部ネットワーク間で安全な接続を確立できるよう、VPNサーバーを設定する必要があります。

`EAP-TLS` または `EAP-MSCHAPV2` 認証プロトコルを使用するように、VPN 接続を設定することができます。 VPNサーバーの設定については、 [VPNサーバーの設定](../configuring-the-cloud-network/configuring-a-vpn-server.md) を参照してください。

## VPN接続の作成と設定

次に、Liferay Cloudのコンソールを使用して、設定したサーバーのVPN接続を作成します。

1. Liferay Cloudコンソールで、プロジェクトの要件に応じて、VPN接続したい環境（例えば、 `prd`）に移動してください。

1. 画面左側の「**設定**」 をクリックします。

    ![設定メニューに移動して、VPN構成設定にアクセスします。](./connecting-the-vpn/images/01.png)

1. VPNセクションまでスクロールダウンし、 **新しいVPNの作成** をクリックします。

    ![新規VPNの作成」をクリックして、VPN接続の設定を開始します。](./connecting-the-vpn/images/02.png)

1. VPNサーバーの設定に合わせ、すべてのVPN設定を行います。

    * **名前**(VPNを識別するために使用)
    * **説明**
    * **プロトコル**(IPSecまたはOpenVPN)

1. Liferay Cloud 環境のポートと、プライベートネットワークのポートをマッピングします。

    ![これらのフィールドを使用して、クラウド環境のポートとVPNのポートをマッピングしてください。](./connecting-the-vpn/images/03.png)

    ポートのマッピングは、Liferay Cloud環境でのリクエストをプライベートネットワーク内の特定のサービスにリダイレクトするのに便利です。

1. **Create and Connect VPN** をクリックします。

ボタンをクリックすると、VPN接続が確立されます。 VPNサーバーが正常に接続されるまで、多少時間がかかる場合があります。

## VPNサーバーの応答を確認する

VPNがLiferay Cloud環境に正常に接続されていることを確認するために、 `curl` コマンドを実行し、接続をテストします。

1. Liferay Cloud 環境（VPN 接続した環境と同じ）で、 `liferay` サービスに移動してください。

1. シェル」タブをクリックすると、 `liferay` サービスのシェルにアクセスできます。

    ![liferayサービスのシェルを使って、VPN接続を確認します。](./connecting-the-vpn/images/04.png)

1. このコマンドを実行します（ `####` は、プライベートネットワークにマッピングしたポートの番号に置き換えてください）。

    ```bash
    curl vpn:####
    ```

コマンドを実行した際に、VPNサーバーから応答があれば、VPNサーバーは正しく設定され、接続されていることになります。

## 次のステップ

これでVPN接続の設定が完了し、Liferay Cloudへの移行は完了です! [マイグレーション後の次のステップ](./next-steps-after-migration.md) を完了し、環境が整っていることを確認します。
