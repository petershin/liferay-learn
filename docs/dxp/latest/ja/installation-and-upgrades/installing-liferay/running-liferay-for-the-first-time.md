# Liferayを初めて実行する

[Liferay DXP/Portalをインストール](./installing-a-liferay-tomcat-bundle.md#installing)して[データベースを構成](./configuring-a-database.md)すると、実行する準備が整います。

## サーバーを起動する

1. アプリケーションサーバーにバンドルされている起動スクリプトを実行します。 Tomcatバンドルの例：

    ```bash
    ./liferay-dxp-version/tomcat-version/bin/startup.sh
    ```

    ```{note}
    デフォルトでは、DXPはログファイルを`[Liferay Home]/logs`に書き込みます。
    ```


    The Setup Wizard appears in your web browser at `http://localhost:8080`.
    
    ![On completing startup, DXP launches a web browser that displays the Basic Configuration page.](./running-liferay-for-the-first-time/images/01.png)

1. ポータルの*［Name］*、*［Default Language］*および*［Time Zone］*を設定します。

1. *［Administrator User ］*の名、姓、メールアドレスを設定します。

1. *［Database］*セクションで、*［Change］*をクリックしてデータベースフォームを表示します。

    ```{warning}
    本番環境グレードのLiferay DXPインスタンスではHSQLを使用しないでください。
    ```

    ![セットアップウィザードのデータベースフォームでは、DXP用に作成したデータベースを指定できます。](./running-liferay-for-the-first-time/images/02.png)

1. データベースを指定します。

| Field             | Description                       |
|:----------------- |:--------------------------------- |
| *［Database Type］* | 接続するデータベースの種類を選択します               |
| *［JDBC URL］*      | Liferay DXP用に作成したデータベースへのパスを更新します |
| *［User Name］*     | データベースのユーザ名                       |
| *パスワード*           | データベースのユーザーパスワード                  |

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6\. *サンプルデータ*について：本番環境グレードのDXPインスタンスを作成している場合、またはデータが不要な場合は、サンプルデータフィールドを選択しないでください。 サンプルデータには、デモンストレーション用のユーザー、サイト、組織が含まれています。

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7\. *［Finish Configuration］*をクリックします。

セットアップウィザードは、設定値を[Liferay Home](../reference/liferay-home.md)の`portal-setup-wizard.properties`ファイルに保存します。

Liferay DXPエンタープライズサブスクリプションをお持ちの場合、DXPはアクティベーションキーを要求します。 [Activating Liferay DXP](../setting-up-liferay/activating-liferay-dxp.md)を参照してください。

最後に、サーバーを再起動するようプロンプト表示されます。

## サーバーを再起動する

アプリケーションサーバーにバンドルされているシャットダウンスクリプトおよび起動スクリプトを使用してサーバーを再起動します。 Tomcatのサンプルコマンド：

### シャットダウン

```bash
./liferay-dxp-version/tomcat-version/bin/shutdown.sh
```

### 立ち上げ時

```bash
./liferay-dxp-version/tomcat-version/bin/startup.sh
```

DXPは、セットアップウィザードで指定したデータベースとポータルの設定値を使用して初期化します。 DXPのホームページが`http://localhost:8080`に表示されます。

![DXPを構成してサーバーを再起動すると、DXPのホームページが表示され、サインインできるようになります!](./running-liferay-for-the-first-time/images/03.png)

　 これでオンプレミスのLiferay DXPインスタンスを起動しました。

## 次のステップ

[管理者ユーザーとしてサインインして](../../getting-started/introduction-to-the-admin-account.md)、DXP/ポータルでソリューションの構築を開始できます。 または、[その他のセットアップ](../setting-up-liferay.md)トピックを参照できます。

* [アプリのインストールと管理](../../system-administration/installing-and-managing-apps/installing-apps.md)
* [試用期間中のプラグインへのアクセス](../../system-administration/installing-and-managing-apps/installing-apps/accessing-ee-plugins-during-a-trial-period.md)
* [検索エンジンのインストール](../../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine.md)
* [Liferayの保護](../securing-liferay.md)
* [高可用性のクラスタリング](../setting-up-liferay/clustering-for-high-availability.md)