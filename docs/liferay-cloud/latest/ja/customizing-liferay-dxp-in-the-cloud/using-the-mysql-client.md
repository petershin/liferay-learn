# MySQLクライアントの使用

アプリケーションの問題のトラブルシューティングやカスタム開発を行うために、データベース内のデータを表示することが必要になる場合があります。 データベースにアクセスするには、組み込みのMySQLクライアントを使用して、データベースと直接やり取りする必要があります。 この機能は、Liferay Cloudの最新バージョンで利用可能で、いくつかの簡単な手順でアクセスすることができます。

```{note}
MySQLクライアントを利用できるのは、*Admin*および*Contributor*権限を持つLiferay Cloudユーザーのみです。
```

## 前提条件

Liferayサービスを通じてMySQLクライアントを使用する前に、サービスを少なくとも以下のサポートされているイメージバージョンにアップグレードする必要があります：

| **サービス** | **サポートされる最小イメージバージョン** |
|:---------------- |:----------------------------------------------- |
| **データベース** | liferaycloud/database：3.2.8                     |
| **DXP (7.0を使用**) | liferaycloud/liferay-dxp：7.0.10-ga1-fp90-3.0.19 |
| **DXP（7.1を使用**） | liferaycloud/liferay-dxp-7.1.10-ga1-fp17-3.0.19 |
| **DXP（7.2を使用**） | liferaycloud/liferay-dxp-7.2.10-sp1-fp4-3.0.19  |

```{warning}
データベースイメージを MySQL クライアントをサポートするバージョンにアップグレードすると、データベースの読み取り専用ユーザが初期化されます。 アップグレード前にこのユーザーのパスワードを設定しなかった場合、デフォルトのパスワードが使用され、後で変更することはできません。 詳しくは、 [読み取り専用データベースのパスワード変更](#changing-the-read-only-database-password) を参照してください。
```

## MySQLクライアントへのアクセス

1. Liferay Cloud のコンソールにログインします。

1. 適切な環境に移動し、 ［**サービス**］ をクリックします：

   ![サービスに移動して、ご使用の環境のすべてのサービスを表示します。](./using-the-mysql-client/images/01.png)

1. ［**liferay** サービス］をクリックします。

1. ［**Shell**］ タブをクリックします：

    ![［シェル］タブをクリックして、MySQLクライアントが使用可能なシェルにアクセスします。](./using-the-mysql-client/images/03.png)

1. この画面のシェルに `mysql` と入力します。 これにより、MySQLクライアントにログインし、読み取り専用のクエリを実行できます。 たとえば、 `show tables;`を実行すると、すべてのテーブルを表示できます。

    ![mysqlコマンドとshow tablesコマンドを実行します](./using-the-mysql-client/images/04.png)

利用可能なすべてのコマンドについては、公式の [MySQL Client documentation](https://dev.mysql.com/doc/refman/8.0/en/mysql-commands.html) を参照してください。

### 読み取りおよび書き込み権限でのログイン

デフォルトのユーザーは、データベースに対して読み取りクエリのみを実行でき、データを操作することはできません。 これにより、偶発的な修正でサービスのデータが破損することを防ぐことができます。

しかし、データベース内のデータを操作できることが **重要** であれば、シェルにこのコマンドを入力することで（ `mysql`とだけ入力するのではなく）、データベースの認証情報を使ってログインすることができます。

```bash
mysql -u ${LCP_SECRET_DATABASE_USER} -p${LCP_SECRET_DATABASE_PASSWORD}
```

データベース名、ユーザー名、パスワードは、 `データベース` サービスの [秘密](..//tuning-security-settings/managing-secure-environment-variables-with-secrets.md#viewing-and-modifying-an-existing-secret) で確認することができます。

### 読み取り専用データベースのパスワードの変更

サポートされているバージョンのデータベース サービスをまだデプロイしていない場合は、データベース サービスの `LCP_DATABASE_READONLY_USER_PASSWORD` 環境変数の `LCP.json`に独自のパスワードを設定することで、デフォルト ユーザーに独自のパスワードを設定することができます。

```{important}
MySQL クライアントをサポートするバージョンを使用してデータベースサービスをデプロイしている場合、デフォルトユーザーはすでにデフォルトパスワードで初期化されています。 このパスワードは後で変更できないので、環境変数 `LCP_DATABASE_READONLY_USER_PASSWORD` を追加できるのは、データベースサービスをデプロイする前（初めて、または上記より古いバージョンのイメージから更新する）のみです。 それ以外の場合は、デフォルトの生成されたパスワードを使用する必要があります。
```

次に、適切なDockerイメージバージョン（またはそれ以降）に更新し、[サービスを再デプロイ](../updating-services-in-liferay-paas/deploying-changes-via-the-liferay-cloud-console.md)し、MySQLクライアントを使用できるようにします。

`LCP_DATABASE_READONLY_USER_PASSWORD`でデフォルトユーザーのパスワードを設定した場合、同じ環境変数を `liferay` サービスに追加します。 それ以外の場合は、この変数を追加しないでください。 これにより、サービスはデフォルトのパスワードを使用します。

この変数は、 ［**環境変数**］ タブ内から追加できます。

![必要に応じて、［環境変数］タブをクリックしてパスワードを設定します。](./using-the-mysql-client/images/02.png)

## 関連情報

* [データベースサービス](../platform-services/database-service/database-service.md)
