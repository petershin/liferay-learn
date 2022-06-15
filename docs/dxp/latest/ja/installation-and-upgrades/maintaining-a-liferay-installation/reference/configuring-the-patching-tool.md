# パッチングツールの構成

> サブスクライバー

パッチングツールは、どのDXPインストールにも適応できます。 ツールの自動検出オプションは、パッチングツールを構成する最も簡単な方法です。 DXPをアプリケーションサーバーにインストールした場合、またはパッチツールのリクエストをプロキシする必要がある場合は、パッチツールを手動で設定できます。

**概要：**

* [`auto-discovery`を使用した自動構成](#automatic-configuration-using-auto-discovery)
* [構成のテスト](#testing-the-configuration)
* [手動設定](#manual-configuration)
* [パッチプロファイルの使用](#using-patching-profiles)

## `auto-discovery`を使用した自動構成

パッチングツールの `auto-discovery` コマンドは、DXPファイルをスキャンし、パッチに使用するプロパティファイルにそれらのパスを書き込みます。

パッチ適用ツールを自動的に構成するには、次の手順に従います。

1. `patching-tool` フォルダへのコマンドラインを開きます。

    ```bash
    cd patching-tool
    ```

1. auto-discoveryコマンドを実行します。

    [Liferay Home](../../reference/liferay-home.md) がパッチングツールの親フォルダである場合は、次のコマンドを実行します。

    ```bash
    ./patching-tool.sh auto-discovery
    ```

    [Liferay Home](../../reference/liferay-home.md) が別の場所にある場合は、コマンドにLiferay Homeパスを指定します。

    ```bash
    ./patching-tool.sh auto-discovery [path to Liferay Home]
    ```

ツールは、構成をファイル `default.properties`に書き込みます。

Liferay Homeへの間違ったパスを指定した場合、またはLiferay Homeが親フォルダにない場合、パッチツールは次のようなエラーを報告します。

```
The .liferay-home has not been detected in the given directory tree.

Configuration:
patching.mode=binary
war.path=../tomcat-9.0.17/webapps/ROOT/
global.lib.path=../tomcat-9.0.17/lib/ext/
liferay.home=**[please enter manually]**

The configuration hasn't been saved. Please save this to the default.properties file.
```

次のいずれかの方法を使用して問題を解決します。

* Liferay Homeがパッチングツールのツリーにある場合は、Liferay Homeフォルダに `.liferay-home` ファイルを作成し、`auto-discovery` コマンドを再実行します。
* プロパティファイルの `liferay.home` プロパティでLiferay Homeのパスを指定します（例： `default.properties`）。

## 構成のテスト

パッチングツールが設定されている場合、`info` コマンドを実行すると、次のようなすべての製品情報とパッチ情報が報告されます。

```
/patching-tool>./patching-tool.sh info
Loading product and patch information...
Product information:
  * build number: 7310
  * service pack version:
    - available SP version: 1
    - installable SP version: 1
  * patching-tool version: 3.0.5
  * time: 2020-09-01 14:02Z
  * host: 91WRQ72 (8 cores)
  ...
```

情報が正しくない場合は、構成を手動で編集します。

## 手動設定

パッチングツールのプロパティファイルを編集します。 `auto-discovery` コマンドは、デフォルトで `default.properties` ファイルを作成するか、指定されたファイル（例： [Patching Profile](#using-patching-profiles) ）を作成します。

### 一般的なプロパティ

| プロパティ                               | Description                                                                                                                                                            |
|:----------------------------------- |:---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `global.lib.path`                   | グローバルクラスパス上の `.jar` ファイルを保存する場所を指定します。 ヒント：`portal-kernel.jar`はグローバルクラスパス上にあります。<br><br>DXP 7.2では、`global.lib.path`は、`patching.mode`が`binary`の場合にのみ使用されます。 |
| `liferay.home`                      | [Liferay Home](../../reference/liferay-home.md) フォルダを指定します。これは通常、DXPの `osgi` および `tools` フォルダの親フォルダです。                                                                 |
| `module.framework.core.path`        | DXPの `osgi/core` フォルダへのパス。                                                                                                                                             |
| `module.framework.marketplace.path` | DXPの `osgi/marketplace` フォルダへのパス。                                                                                                                                      |
| `module.framework.modules.path`     | DXPの `osgi/modules` フォルダへのパス。                                                                                                                                          |
| `module.framework.portal.path`      | DXPの `osgi/portal` フォルダへのパス。                                                                                                                                           |
| `module.framework.static.path`      | DXPの `osgi/static` フォルダへのパス。                                                                                                                                           |
| `patches.folder`                    | パッチを保存する場所を指定します。 デフォルトの場所は `./patches`です。                                                                                                                             |
| `patching.mode` （**DXP 2.0のみ**） | パッチには、更新されたバイナリファイルとソースファイルが含まれています。 モードは、適用するファイルタイプを決定します。<br><br> **`binary`（デフォルト）：DXPインストールの更新用。<br>** `source`：DXPを拡張するソースツリーの更新用。               |
| `source.path` （**DXP 2.0のみ**） | DXPソースツリーの場所を指定します。 `source.path`は、`patching-mod`eが`source`の場合にのみ使用されます。                                                                                               |
| `war.path`                          | DXP Webアプリケーションへのパス（展開されたフォルダ構造または `.war` ファイルへのパス）を指定します。                                                                                                             |

### プロキシ設定

サービスパックの検出は、プロキシサーバーの背後で利用できます。 プロキシを構成するには、次の設定グループのいずれかを使用し、 `［PROXY_IP_ADDRESS］`を含むすべての値を置き換えます。

```properties
### Proxy settings

# HTTP Proxy

#proxy.http.host=[PROXY_IP_ADDRESS]
#proxy.http.port=80
#proxy.http.user=user
#proxy.http.password=password

# HTTPS Proxy

proxy.https.host=[PROXY_IP_ADDRESS]
proxy.https.port=80
proxy.https.user=user
proxy.https.password=password

# SOCKS Proxy

#proxy.socks.host=[PROXY_IP_ADDRESS]
#proxy.socks.port=1080
#proxy.socks.user=user
#proxy.socks.password=password
```

## パッチプロファイルの使用

自動検出を実行するか、手動でプロファイルを作成することにより、複数のランタイムのプロファイルを作成できます。 DXPランタイムを自動検出するには、次のようなパラメータを使用してパッチングツールを実行します。

```bash
./patching-tool.sh [name of profile] auto-discovery [path/to/Liferay Home]
```

これにより、同じ検出プロセスが実行され、プロファイル情報が `［プロファイル名］ .properties`というファイルに書き込まれます。 または、 `patching-tool` フォルダでプロファイルプロパティファイルを作成および編集できます。

プロファイルを作成したら、パッチングツールのコマンドで使用できます。 たとえば、次のコマンドは `test-server.properties`というプロファイルファイルを使用してパッチをインストールします。

```bash
./patching-tool.sh test-server install
```

## 追加情報

* [パッチのインストール](../patching-dxp-7-3-and-earlier/installing-patches-for-dxp-7-3-and-earlier.md)
* [パッチングツールのインストール](./installing-the-patching-tool.md)