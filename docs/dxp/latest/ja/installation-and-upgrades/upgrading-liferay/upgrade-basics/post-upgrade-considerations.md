# アップグレード後の考慮事項

データベースをアップグレードした後、本番環境用にLiferayを再度構成し、Liferayインスタンスに影響を与える可能性のある機能の変更を確認する必要があります。

## 本番環境設定を再度有効にする

データベースをアップグレードした後、プロダクション設定を再度有効にしてください。

### 検索インデクス

7.2へのアップグレードで検索インデックスを無効にした場合は、無効にするために使用した `.config` ファイルを削除するか、`.config` ファイルで `indexReadOnly="false"` を設定して、再度有効にしてください。 例えば、

```bash
rm osgi/configs/com.liferay.portal.search.configuration.IndexStatusManagerConfiguration.config
```

検索インデックスの再インデックスは、すべてのLiferayのアップグレード後に必要です。 インデックスを再作成する、

1. **グローバルメニュー**( [グローバルメニューアイコン](./post-upgrade-considerations/images/01.png) )をクリックし、 **コントロールパネル** タブを開きます。

1. Configurationセクションの **Search** をクリックし、 **Index Actions** タブを選択します。

1. [再インデックス作成モード](../../../using-search/search-administration-and-tuning/reindexing-modes.md) を選択し、 **All search indexes** の **Reindex** をクリックします。

![You can reindex your search indexes in the Control Panel.](./post-upgrade-considerations/images/01.png)

```{note}
古いバージョン（7.1以下）からアップグレードした場合は、検索インデックスを処理するために、 [Elasticsearch](../../../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine.md) をインストールすることを検討してください。
```

### データベース設定

アップグレード前にアップグレード用にデータベースをチューニングした場合は（ [データベース・チューニング・アップグレード](../upgrade-stability-and-performance/database-tuning-for-upgrades.md) を参照）、本番用データベースの設定を復元します。

```{note}
データのアップグレード中にシャード環境から移行した場合は、仮想インスタンスへの移行を完了するために、さらに構成を調整する必要があります。 詳細については、 [アップグレードと更新のプロパティ](../other-upgrade-scenarios/upgrading-a-sharded-environment.md#Upgrade-and-Update-Properties) セクションを参照してください。
```

## 最新のマーケットプレイスアプリのインストール

新しい Liferay バージョンに対応した [Marketplace アプリ](../../../system-administration/installing-and-managing-apps/installing-apps/downloading-apps.md) の最新バージョンをインストールし、 [Gogo シェルコマンド](../upgrade-stability-and-performance/upgrading-modules-using-gogo-shell.md) を使用して、必要なデータベースのアップグレードを確認し、実行します。

## 機能変更の考慮

新しいLiferayバージョンでは、機能と動作が変わります。 以下の機能や動作がどのように変化するかを確認する。

### Webコンテンツの表示権限を有効にする

7.1以前は、デフォルトですべてのユーザーがウェブコンテンツの記事を閲覧できました。 デフォルトで閲覧権限がチェックされるようになった。 ロールごとに各ウェブコンテンツ記事の閲覧権限を編集することができます。

```{note}
7.4より前のバージョンでは、*コントロールパネル* &rarr; *設定* &rarr; *システム設定* &rarr; *ウェブコンテンツ* &rarr; *仮想インスタンススコープ* &rarr; *ウェブコンテンツ*に移動し、*記事の表示許可チェック有効*の選択を解除することで、すべてのウェブコンテンツ記事の表示許可を開くことができました。
```

![Disable the permissions check for viewing web content by scrolling down in the Web Content menu in the System Settings.](./post-upgrade-considerations/images/02.png)

### Webコンテンツの画像チェック

7.2にアップグレードすると、ウェブコンテンツの画像が [File Store](../../../system-administration/file-storage.md) （ドキュメントライブラリとしても知られています）に移動し、以前のテーブルである`JournalArticleImage`が削除されます。 イメージを移行できない場合、Liferayは失敗を報告します：

```
ジャーナル記事の画像{ファイル名}をファイルリポジトリに追加できません。
```

メッセージがなければ、画像はファイルストアにあるはずです。 ウェブコンテンツの記事をプレビューして画像を確認する。

## メンテナンスモードでの非推奨項目と機能の考慮

メンテナンスモード [の](../reference/maintenance-mode-and-deprecations-in-7-3.md) の廃止予定と機能を確認し、それらがあなたの Liferay インスタンスにどのような影響を与えるか対処する計画を立てましょう。

## 廃止されたデータを削除する

不要で役に立たないデータがあれば、それを削除することができる。 ここでは、よくある時代遅れのデータと、それを削除するためのツールを2つ紹介する。

* 廃止されたLiferayアプリまたはモジュールからのデータ。 [データクリーンアップ](../reference/data-cleanup.md) ツールを使用して削除します。

* 利用可能なLiferayアプリおよびモジュールからの廃止されたデータ。 [データ削除](../reference/data-removal.md) ツールを使用して削除します。

## さいごに

必要なアップグレード後のタスクがすべて完了すると、Liferayサーバーは以前と同じように通常の操作ができるようになります。 　
