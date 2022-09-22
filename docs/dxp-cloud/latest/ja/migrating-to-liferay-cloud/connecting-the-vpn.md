# ステージ 7:VPNを接続する

開発環境に必要であれば、クラウド環境をプライベートネットワークに接続することが移行の最終段階となります。 これは、VPNサーバーを設定（または更新）し、Liferay Cloudコンソールで接続を設定するものです。

以下のような場合、Liferay Cloud環境をVPNに接続する必要がある場合があります。

* 自社のプロジェクト要件でVPNを使用する場合
* 自分の環境を [LDAPサーバー](https://learn.liferay.com/dxp/latest/ja/users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory.html?highlight=ldap) に接続したい。
* 別のディレクトリサーバーに環境を接続したい場合
* 他のウェブサービスと相互作用するリモートアプリケーションを使用する必要があります

VPNサーバーの設定が必要ない場合は、 [次のステップに進んでください](#next-steps) .

## VPNサーバーの設定

Liferay Cloudと内部ネットワークとの間に安全な接続を確立できるように、VPNサーバーを設定する必要があります。

VPN接続では、 `EAP-TLS` または `EAP-MSCHAPV2` 認証プロトコルを使用するように設定することが可能です。 VPNサーバーの設定については、 [VPNサーバーの設定](../infrastructure-and-operations/networking/configuring-a-vpn-server.md) を参照してください。

## VPN接続の作成と設定

次に、DXPクラウドのコンソールを使用して、設定したサーバーのVPN接続を作成します。

1. Liferay Cloudコンソールで、プロジェクトの要件に応じて、VPNを接続したい環境（ `prd`など）に移動します。

1. 画面左側の **Settings** をクリックします。

    ![設定メニューに移動し、VPN構成設定にアクセスします。](./connecting-the-vpn/images/01.png)

1. VPNセクションまでスクロールし、 **Create New VPN** をクリックします。

    ![新規VPNの作成」をクリックして、VPN接続の設定を開始します。](./connecting-the-vpn/images/02.png)

1. VPNサーバーの設定に合わせ、すべてのVPN設定を行います。

    * **名前**(VPNを識別するために使用される)
    * **説明**
    * **プロトコル**（IPSec または OpenVPN）

1. Liferay Cloud環境のポートと、プライベートネットワークのポートをマッピングします。

    ![これらのフィールドを使用して、クラウド環境のポートとVPNのポートをマッピングしてください。](./connecting-the-vpn/images/03.png)

    ポートのマッピングは、DXPクラウド環境内のリクエストをプライベートネットワーク内の特定のサービスにリダイレクトするのに有効です。

1. **Create and Connect VPN** をクリックします。

ボタンをクリックすると、VPN接続が確立されます。 VPNサーバーが正常に接続されるまで、多少時間がかかる場合があります。

## VPNサーバーの応答を確認する

VPNがLiferay Cloud環境に正常に接続されていることを確認するために、 `curl` コマンドを実行して接続をテストしてください。

1. DXPクラウド環境（VPN接続した環境と同じ）で、 `liferay` サービスに移動してください。

1. Shellタブをクリックして、 `liferay` サービスのシェルにアクセスします。

    ![liferayサービスのシェルを使って、VPN接続を確認します。](./connecting-the-vpn/images/04.png)

1. このコマンドを実行します（ `####` は、プライベートネットワークにマッピングしたポートの番号に置き換えてください）。

    ```bash
    curl vpn:####
    ```

コマンドを実行した際に、VPNサーバーから応答があれば、VPNサーバーは正しく設定され、接続されていることになります。

## 次のステップ

これでVPN接続の設定が完了し、DXPクラウドへの移行が完了しました! 移行後の [次のステップを完了し、](./next-steps-after-migration.md) 環境が整っていることを確認します。
