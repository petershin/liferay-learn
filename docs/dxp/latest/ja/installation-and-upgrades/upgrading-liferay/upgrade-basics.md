---
toc:
  - ./upgrade-basics/upgrading-via-auto-upgrade.md
  - ./upgrade-basics/upgrading-via-docker.md
  - ./upgrade-basics/using-the-database-upgrade-tool.md
  - ./upgrade-basics/post-upgrade-considerations.md
---
# アップグレードの基本

Liferayのツールや説明書は、DXPやポータル環境を安全かつ迅速にアップグレードするのに役立ちます。 小さなデータセットを持つ非クラスター環境などは、[Dockerイメージ](./upgrade-basics/upgrading-via-docker.md)を使ってアップグレードすることができます。 複雑で、より大きなデータセットを持つ、または多くのカスタマイズがあるDXP環境およびポータル環境は、[データベースアップグレードツール](./upgrade-basics/using-the-database-upgrade-tool.md)を使用してアップグレードします。 [自動アップグレード](./upgrade-basics/upgrading-via-auto-upgrade.md) は、起動時に有効にすることもできます。

```{warning}
アップグレードする前に、**必ず**データベースとインストールを[バックアップ](../../maintaining-a-liferay-installation/backing-up.md)してください。 バックアップコピーでアップグレードプロセスをテストすることをお勧めします。
```

```{note}
[Docker経由でのアップグレード](./upgrade-basics/upgrading-via-docker.md)は、小規模でカジュアルなポータル環境でデータベースをアップグレードする最も簡単な方法です。
```

アップグレードを始める前に、必要な項目を検討しましょう。 アップグレードに関するトピックは、次のカテゴリに分類されます。

* [準備と計画](#preparation-and-planning)
* [カスタム開発のアップグレード](#upgrading-custom-development)
* [構成とインフラストラクチャーの移行](#migrating-and-updating-configurations-and-infrastructure)
* [アップグレードパフォーマンスの向上](#improving-upgrade-performance)
* [データベースのアップグレードの実行](#executing-the-database-upgrade)

## 準備と計画

準備と計画は、小規模でカジュアルなインストールではあまり重要でない場合がありますが、大規模なエンタープライズレベルのインストールでは **必須** です。

### 利用可能なアップグレードパスの確認

次の表で現在のLiferay DXP/ポータルのバージョンを調べて、インストールのアップグレードパスを確認してください。

| アップグレードパス                                                                   | Description                                     |
|:--------------------------------------------------------------------------- |:----------------------------------------------- |
| Liferay DXP/Portal 6.2+ &rarr; DXP 7.4                                      |                                                 |
| Liferay Portal 6.1.x &rarr; DXP/Portal 7.1 &rarr; DXP 7.4                   | Liferay Portal 6.1のサポート期間は終了しました                |
| Liferay Portal 5.xおよび6.0.x &rarr; Liferay Portal 6.2 &rarr; Liferay DXP 7.4 | Liferay Portal 5.0、5.1、5.2、および6.0のサポート期間は終了しました |

Liferay Portalを同じマイナーバージョンの新しいGAにアップグレードする場合（たとえば、7.3 GA1からGA2にアップグレードする場合）、データスキーマに変更がない場合は、新しいGAの使用をすぐに開始できます。 スキーマが変更された場合、起動メッセージには、 [データベースをアップグレード](#executing-the-database-upgrade) する必要がある新しいデータスキーマバージョンが報告されます。[Dockerイメージ](./upgrade-basics/upgrading-via-docker.md)を使用してアップグレードを呼び出すのが最も簡単です。

パスにLiferay Portal 6.2へのアップグレードが含まれている場合は、最初に [Liferay Portal 6.2のアップグレード手順](https://help.liferay.com/hc/ja/articles/360017903232-Upgrading-Liferay) に従ってください。

```{note}
一部の新しいLiferayバージョンでは、テーブル列の名前が変更されています。 これらの列に関連付けられている [仮想列](https://en.wikipedia.org/wiki/Virtual_column) はデータベースのアップグレードを妨げるため、アップグレードの前に削除する必要があります。 アップグレード後、同等の仮想列を追加できます。 詳細については、 [アップグレードのトラブルシューティング](./reference/troubleshooting-upgrades.md) を参照してください。
```

### 非推奨項目およびデフォルト設定の変更点を確認する

Liferayの新しいバージョンでは、機能と構成のデフォルトが変更されている場合があります。 最新の非推奨項目および機能と設定の変更点については、リファレンスセクションまたは次の記事を参照してください。

* [メンテナンスモードと非推奨](./reference/maintenance-mode-and-deprecations-in-7-3.md)
* [デフォルト設定の変更](./reference/default-setting-changes-in-7-3.md)

### アップグレードパッチのリクエスト（サブスクリプション）

> サブスクリプション

Liferay DXPサブスクリプションをお持ちの場合は、最新のフィックスパックにアップデートするか、データベースのアップグレードの準備をするためのアップグレードパッチをリクエストしてください。 このプロセスを開始するには、 [ヘルプセンター](https://help.liferay.com/hc/requests/new) でチケットを提出してください。

### パブリケーションの準備

[パブリケーション](../../site-building/publishing-tools/publications.md)がインスタンスで有効になっている場合、アップグレード前にすべての有効なパブリケーションを公開していることを確認してください。 アップグレード後、有効なパブリケーションは有効期限切れとしてマークされ、公開や変更を行うことができなくなります。

```{note}
アップグレード前に公開したパブリケーションは、アップグレード処理後に元に戻すことができないので、注意してください。 以前のLiferayバージョンで作成されたすべてのパブリケーションについて、*元に戻す*オプションが削除されました。
```

### コマースのアップグレードの準備

[Commerce](https://learn.liferay.com/commerce/latest/ja/index.html) を使用している場合は、Liferayデータベースをアップグレードする前にコマースをアップグレードする準備をしてください。  詳細については、 [Liferay Commerceのアップグレード](https://learn.liferay.com/commerce/latest/ja/installation-and-upgrades/upgrading-liferay-commerce.html) を参照してください。

### マーケットプレイスアプリの更新

Liferayデータベースをアップグレードする前に、現在使用しているLiferayバージョンのマーケットプレイスアプリを更新し、更新されたアプリをテストします。 アプリの更新をスキップすると問題が発生し、アプリが新しいLiferayバージョンで有効にならない場合があります。

```{important}
データベースをアップグレードする前に、現在のインストールでこれを行ってください。
```

新しいLiferayバージョンに対応したアプリの最新バージョンでは、データのアップグレードが必要なデータベーススキーマの変更が行われている可能性があります。 Liferayデータベースのアップグレード **中** またはアップグレード **後** にアプリデータをアップグレードできます。

**オプション1：** データベースをアップグレードする **前** に最新のアプリをインストールし、データベースのアップグレードの一環としてアプリのデータを自動的にアップグレードします。 各データベースのアップグレードパスには、アプリのセットアップの詳細が記述されます。

**オプション2：** データベースのアップグレード **後** に最新のアプリをインストールし、[Gogoシェルコマンド](./upgrade-stability-and-performance/upgrading-modules-using-gogo-shell.md)を使用してアプリデータをアップグレードします。  [アップグレード後の考慮事項](./upgrade-basics/post-upgrade-considerations.md)で、アプリのセットアップの詳細について説明しています。

## カスタム開発のアップグレード

開発したプラグイン（テーマ、アプリ、カスタマイゼーションなど）は、新しいLiferayバージョンに適合させる必要があります。 これは、依存関係の更新と同じくらい簡単な場合もあれば、APIの変更に合わせたコードの更新が必要な場合もあります。 カスタムプラグインの更新をしないと、新しいLiferayバージョンで無効になる場合があります。 [カスタム開発のアップグレード](./upgrading-custom-development.md)では、コードのアップグレードのプロセスを説明しています。

## 構成とインフラストラクチャの移行と更新

構成と対応するインフラストラクチャを、以前のインストールから新しいインストールに移行して更新する必要があります。

```{important}
6.2以前からアップグレードする場合は、ファイルストアの構成を更新します。 詳細については、[ファイルストアの更新](./reference/file-store-updates.md) を参照してください。
```

```{important}
`locales` [ポータルプロパティ](../../installation-and-upgrades/reference/portal-properties.md)をオーバーライドした場合は、アップグレードする前に新しいインストールでそれをアップグレードしてください。 これにより、すべてのロケールのデータが確実にアップグレードされます。
```

データベースのアップグレードが完了してから、他の設定を更新します。 詳細は、[構成とプロパティの移行](./migrating-configurations-and-properties.md)を参照してください。

## アップグレードパフォーマンスの向上

不要なデータをそのままにしておいたり、パフォーマンスチューニングをしていないと、大規模なデータセットのアップグレードに非常に長い時間がかかる場合があります。 データベースのアップグレードを迅速化する方法はいくつかあります。

### データのプルーニング

Liferayサーバーに不要なインスタンス、サイト、ページ、またはバージョン管理されたコンテンツアイテム（Webコンテンツの記事、ドキュメント、メディアファイルなど）がある場合、それらを削除するとアップグレード時間が大幅に短縮されます。 不要なデータを削除する方法については、[より高速なアップグレードのためのデータベースのプルーニング](./upgrade-stability-and-performance/database-pruning-for-faster-upgrades.md)を参照してください。

### データベースのパフォーマンスを調整する

アップグレード操作（本番環境よりもデータ書き込みが多い）用にデータベースを調整すると、データベースのアップグレードパフォーマンスが向上します。 詳細は、[アップグレードのためのデータベース調整](./upgrade-stability-and-performance/database-tuning-for-upgrades.md)を参照してください。

### バッチインサートを有効にする

[バッチインサートを有効](./upgrade-basics/using-the-database-upgrade-tool.md#batch-insert-property) にすることで、より高速な実行が可能になります。

## データベースのアップグレードの実行

Liferayデータベースをアップグレードするには、2つの方法があります。

* [自動アップグレードによるアップグレード](./upgrade-basics/upgrading-via-auto-upgrade.md) は、起動中にアップグレードが行われるように、ポータルのプロパティで有効にすることができます。 Dockerイメージを使用したアップグレードの例については、 [Dockerによるアップグレード](./upgrade-basics/upgrading-via-docker.md) を参照してください。 イメージはデータベースを更新し、アップグレードされたデータベースを使用して起動します。

* [データベースアップグレードツールの使用](./upgrade-basics/using-the-database-upgrade-tool.md) 。 アップグレードツールは、Liferayインスタンスから切り離された状態でLiferayデータベースを更新するためのクライアントプログラムです。 これにより、アップグレードプロセスに重点が置かれ、アップグレード操作のための[データベースの調整](./upgrade-stability-and-performance/database-tuning-for-upgrades.md)、[不要なデータのプルーニング](./upgrade-stability-and-performance/database-pruning-for-faster-upgrades.md)が容易になり、データベースのアップグレードが迅速化されます。

```{note}
[データベースアップグレードオプション](./reference/database-upgrade-options.md)では、さまざまなDXP/Portalインストールタイプでの上記の方法によるデータベースのアップグレード（およびGogo シェルによるモジュールのアップグレード）に関して説明しています。
```

## 追加ツール

その他のツールもご覧ください：

* [アップグレードレポート](./reference/upgrade-report.md)
* [アップグレードログコンテキスト](./reference/upgrade-log-context.md)
* [MBeansによるアップグレードの監視](./reference/monitoring-upgrades-with-mbeans.md)

## まとめ

上記のタスクを完了すると、アップグレードが完了します。 ただし、Liferayを使用する前に、必要なランタイム設定を再確立し、アップグレード固有の調整を元に戻す必要があります。 さらに、新しいLiferay本番環境インスタンスに推奨される、以前のLiferayバージョンでは利用できなかったアプリケーションがある場合があります。 詳細は、[アップグレード後の考慮事項](./upgrade-basics/post-upgrade-considerations.md)を参照してください。

アップグレードコンポーネントについて理解したので、Liferayインスタンスをアップグレードできます。 データベースをアップグレードする前に、現在のインストールで準備作業を必ず行ってください。 カスタムプラグインコードのアップグレードとデータベースのアップグレードを並行して実行するのが一般的です。 データベースのアップグレードは最初に開始する一般的なタスクであるため、以下に2つの方法へのリンクを示します。

* [オートアップグレードによるアップグレード](./upgrade-basics/upgrading-via-auto-upgrade.md)
* [データベースアップグレードツールの使用](./upgrade-basics/using-the-database-upgrade-tool.md)

さらに、アップグレードに関連する以下のアップグレードシナリオを参照してください。

* [シャード化された環境のアップグレード](./other-upgrade-scenarios/upgrading-a-sharded-environment.md)
* [クラスター化されたインストールの維持](../maintaining-a-liferay-installation/maintaining-clustered-installations.md)
