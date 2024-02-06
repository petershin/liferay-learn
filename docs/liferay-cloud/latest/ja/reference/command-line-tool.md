# コマンドラインツール

CLI ツールは Liferay クラウドサービスの表示と管理に使用できます。 インストール後、ターミナルで `lcp --help` を実行すると、利用可能なアクションが表示されます。

```{tip}
すべての 「lcp」コマンドの最後に 「-v」 または 「--verbose」オプションを実行すると、追加のログや情報を見ることができます。 すべての 「lcp」コマンドの最後に 「--help」フラグを実行すると、そのコマンドで使用できるフラグが表示されます。
```

* [CLIツールのインストール](#installing-the-cli-tool)
* [CLIツールのバージョン2から3へのアップグレード](#upgrading-the-cli-tool-from-version-2-to-3)
* [CLIリモートの設定](#configuring-the-cli-remote)
* [サービスログの表示](#showing-the-service-logs)
* [サービスインスタンスの数の変更](#changing-the-number-of-service-instances)
* [プロジェクトまたはサービスの一覧表示](#listing-projects-or-services)
* [サービスの再起動](#restarting-a-service)
* [Liferayクラウド環境へのデプロイ](#deploying-to-your-liferay-cloud-environment)
* [サービスのシェルへのアクセス](#accessing-a-services-shell)
* [CLIツールのバージョン3のアンインストール](#uninstalling-version-3-of-the-cli-tool)

## CLIツールのインストール

### \*ニックス・システムズ

ターミナルを開き、次のコマンドを実行する：

```bash
curl https://cdn.liferay.cloud/lcp/stable/latest/install.sh -fsSL | bash
```

パーミッションエラーが発生した場合は、もう一度コマンドを実行し、 `bash` を `sudo bash`に置き換えてみてください。

### Windowsシステム

[Windowsインストーラー](https://cdn.liferay.cloud/lcp/stable/latest/lcp-install.exe) の最新バージョンをダウンロードし、ウィザードの手順に従います。

## CLIツールのバージョン2から3へのアップグレード

バージョン3をインストールして使用するには、まず現在のバージョンをアンインストールする必要があります。 これにより、同じバイナリ名との競合が防止されます。

```{important}
これらの手順はCLIバージョン2のアンインストールに特化したものであり、 [CLIツールのバージョン3のアンインストール](#uninstalling-version-3-of-cli-tool) の手順とは**異なります。
```

### MacOSまたはLinuxでのバージョン2のアンインストール

1. ターミナルを開いて `lcp uninstall`を実行します。

1. コマンド `lcp`実行して、アンインストールが完了したことを確認します。

### Windowsでのバージョン2のアンインストール

1. Windows 10では、 ［**コントロールパネル**］ &rarr; ［**プログラム**］ &rarr; ［**プログラムのアンインストール**］ に移動します。

    また、Windows 7および8の場合は、 ［**コントロールパネル**］ &rarr; ［**Add or Remove Programs**］ に進みます。

1. `lcp amd64-installer-0.3`を選択します。

1. ［**アンインストール**］ をクリックして確認します。

1. `lcp` または `lcp.exe`コマンドを実行して、アンインストールが完了したことを確認してください。

バージョン3をインストールする前に、CLIバージョン2がアンインストールされていることを確認してください。

### バージョン3のインストール

バージョン2をアンインストールしたら、 [上記の説明](#installing-the-cli-tool) に従ってCLIツールのバージョン3をインストールすることができます。

## CLIリモートの設定

CLI ツールを使って Liferay Cloud サービスにアクセスするには、Liferay Cloud のリモート URL を指すように設定する必要があります： `liferay.cloud`.

CLIのリモートを一覧表示するには、次のコマンドを実行する：

```bash
lcp remote
```

このコマンドを使用して、CLIツールに新しいリモートを追加できます：

```bash
lcp remote set <remote-alias> <remote-url>
```

必要に応じて、デフォルトのリモートを変更できます：

```bash
lcp remote default <remote-alias>
```

または、リモートインラインを指定することもできます：

```bash
lcp shell -p <project-id> --service <service-id> --remote <remote-alias>
```

## バックアップのダウンロード

`lcp backup` コマンドを使用して、IDを使用して特定のバックアップをダウンロードする。

データベースとドキュメント・ライブラリの両方を同時にダウンロードするには、このコマンドを実行する：

```bash
lcp backup download --backupId <ID>
```

あるいは、 `--database` または `--doclib` フラグを追加して、指定されたものだけをダウンロードする：

```bash
lcp backup download <type> --backupId <ID>
```

## サービスログの表示

特定のプロジェクト、サービス、およびインスタンスのログを表示するには、 `lcp log` コマンドを使用します。 `lcp log --help`.

プロジェクト環境のすべてのサービスログを表示します：

```bash
lcp log -p <project>-<environment>
```

プロジェクト環境における単一のサービスのログを表示します：

```bash
lcp log -p <project>-<environment> -s <service>
```

または、サービスの完全なURLを使ってログを表示することもできます：

```bash
lcp log --url <service>-<project>-<environment>.lfr.cloud
```

デフォルトでは、 `lcp log` コマンドは、ネットワークへの影響を減らすために10,000行のみを返します。 しかし、 `-since` と `-until` パラメータを使って期間を指定することで、（例： `yesterday`、`yesterday at 9pm`、`10 minutes ago`、`mm/dd/YYYY HH:mm:ss`) この制限を回避することができます。

プロジェクト環境の特定の時間から現在までのすべてのサービスログを表示します：

```bash
lcp log -p <project>-<environment> --since <start_time>
```

特定の期間のプロジェクト環境のすべてのサービスログを表示します：

```bash
lcp log --since "<start_time>" --until "<end_time>"
```

また、 `lcp log` コマンドの出力をファイルにパイプするには、コマンドの最後に `>> "<new-file.txt>"` を追加します。 実行すると、新しいファイルが端末の現在のパスに作成されます。

```bash
lcp log -p <project>-<environment> -s <service> --since "<start_time>" --until "<end_time>" >> "<new-file.txt>"
```

## サービスインスタンスの数の変更

環境サービスを個別に拡張するには、 `lcp scale` コマンドを使用します。 `lcp scale --help`.

プロジェクト環境のすべてのサービスとそのインスタンスを表示して、スケールするサービスを選択します：

```bash
lcp scale -p <project>-<environment>
```

その後、端末の指示に従ってサービスを選択し、そのインスタンス数を決定します。

また、 `lcp scale` コマンドの一部として、対象となるサービスと必要なインスタンス数を指定することもできます：

```bash
lcp scale -p <project>-<environment> -s <service> <instances>
```

また、完全なURLを使用してインスタンスをスケーリングすることもできます：

```bash
lcp scale --url <service>-<project>-<environment>.lfr.cloud <instances>
```

## プロジェクトまたはサービスの一覧表示

`lcp list` コマンドを使用すると、プロジェクトのサービスが、それぞれのイメージとステータスとともに表示されます。 `lcp list --help`を実行すれば、利用可能なコマンドオプションを見ることができる。

自分が所有または関わっているプロジェクト、サービス、インスタンスの全リストを表示します：

```bash
lcp list
```

環境に応じたサービスのイメージとステータスを表示します：

```bash
lcp list -p <project>-<environment>
```

特定のサービスのイメージとステータスを確認します：

```bash
lcp list -p <project>-<environment> --service <serviceID>
```

また、 `lcp list`に完全なURLを渡して、サービスをチェックすることもできます：

```bash
lcp list --url <service>-<project>-<environment>.lfr.cloud
```

## サービスの再起動

`lcp restart` コマンドを使用して、環境サービスを再起動します。 `lcp restart --help`.

すべてのプロジェクトの環境とサービスを表示して、再起動する環境サービスを選択します：

```bash
lcp restart
```

プロジェクトの特定のサービスを再起動します：

```bash
lcp restart -p <project>-<environment> -s <service>
```

または、完全なURLを `lcp restart`渡してサービスを再起動します：

```bash
lcp restart --url <serviceID>-<projectID>.lfr.cloud
```

## Liferayクラウド環境へのデプロイ

`lcp deploy` コマンドを使用して、特定のサービスまたはすべてのサービスをいずれかの環境にデプロイします：

```bash
lcp deploy
```

リポジトリのルートディレクトリから `lcp deploy` を実行すると、適用可能なすべてのサービスが選択した環境にデプロイされます。 1つのサービスのフォルダ（サービスの`LCP.json` ファイルがあるフォルダ）からコマンドを実行して、そのサービスを環境にデプロイします。

`-r` をつけてコマンドを実行すると、デフォルト以外のリモート（ID）を指定することができます。

```bash
lcp deploy -r <remote-id>
```

詳細については、 [CLIツールによる変更点のデプロイ](../updating-services-in-liferay-paas/deploying-changes-via-the-cli-tool.md) を参照してください。

## サービスのシェルへのアクセス

サービス・コンテナのシェルにアクセスするには、以下のコマンドを実行する：

```bash
lcp shell
```

これにより、コンテナ内のすべてのサービスがリストアップされ、どのサービスにアクセスするかを選択するよう促されます。

または、サービスのプロジェクトIDとサービスIDを`lcp shell`コマンドに追加して、特定のサービスのコンテナのシェルにアクセスします:

```bash
lcp shell -p <project>-<environment> -s <service>
```

## ドキュメントを開く

`lcp docs` コマンドを使って、公式ドキュメントやヘルプセンターのコンテンツなどを含む Liferay Cloud リソースにアクセスします。

## CLIツールのバージョン3のアンインストール

MacとLinuxの場合は、このコマンドを実行する：

```bash
curl https://cdn.liferay.cloud/lcp/stable/latest/uninstall.sh -fsSL | bash
```

Windows 7および8の場合は、 ［**コントロールパネル**］ &rarr; ［**Add or Remove Programs**］ に進みます。 Windows 10では、 ［**コントロールパネル**］ &rarr; ［**プログラム**］ &rarr; ［**プログラムのアンインストール**］ に移動します。 次に、 プログラムの一覧から **LCP CLI** を探し、［**アンインストール**］をクリックします。 ウィザードの手順に従います。

## 関連トピック

* [トラブルシューティングツールとリソース](../support-and-troubleshooting/troubleshooting-tools-and-resources.md)
* [CLIツールによる変更点のデプロイ](../updating-services-in-liferay-paas/deploying-changes-via-the-cli-tool.md)
* [Liferay Cloudスタックのアップグレード](./upgrading-your-liferay-cloud-stack.md)
