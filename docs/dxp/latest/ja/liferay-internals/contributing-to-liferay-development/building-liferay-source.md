# Building Liferay Source

このセクションでは、Liferay Portal をソースからできるだけ早くビルドするための手順を提供することを目的としています。 ナイトリースナップショットバンドルを使うことで、 *ant all* を使ったフルビルドが不要になり、Liferay Portal を構築する際に多くの時間を節約することができるようになりました。

最初のステップは、Liferay Portalをビルドするために必要なツールがインストールされていることを確認することです。 Liferay Portalの構築には必要です。

* Apache Ant
* Gradle
* Liferay Blade CLI

## Liferayポータルの構築

次のステップは、Github から *liferay-portal* のレポをフォークし、ナイトリースナップショットバンドルを使用するようにビルドを設定することです。

Liferay Portal をソースからビルドするには、以下のようにします。

* *liferay-binaries-cache-2020* のレポをクローンしてビルドを高速化します。

    ```
    git clone https://github.com/liferay/liferay-binaries-cache-2020 --branch master --single-branch --depth 1
    ```

* Githubのliferay-portalレポをフォークする: https://github.com/liferay/liferay-portal
* フォークされたレポのmasterブランチをクローンします。

    ```
    git clone https://github.com/<github-username>/liferay-portal
    ```

* 変更を取得するためのアップストリームとして、メインの liferay-portal リポを追加しました。

    ```
    git remote add upstream https://github.com/liferay/liferay-portal
    ```

* liferay-portal ディレクトリから実行します。

    ```
    ant compile install-portal-snapshots
    ant snapshot-bundle
    git checkout `cat ../bundles/.githash` -b my-custom-change
    ```

* スナップショットハッシュとスナップショットを同期させるために2回目を実行します。

    ```
    ant compile install-portal-snapshots
    ```

Liferay のコアコンポーネントをビルドして、スナップショットバンドルにデプロイできるようになりました。  コアコンポーネントをビルドした場合、コンポーネントはホットスワップできないため、バンドルを再起動する必要があります。

* コアプロジェクト（portal-impl, portal-kernelなど）をビルドするには、以下を実行します。

    ```
    ant deploy
    ```

* *liferay-portal* ディレクトリからスナップショットバンドル を起動します。

    ```
    ../bundles/tomcat-9.0.17/bin/startup.sh | bat
    ```

プラットフォーム全体を再コンパイルすることなく、liferay-portal内部からモジュールをビルドできるようになりました。 モジュールをコンパイルすると、ビルド環境が初期化されるため、上記の手順を完了してからコンパイルする必要があります。

* モジュール（portal-workflow-web, message-boards-web）を構築する場合は、以下を実行します。

    ```
    blade gw deploy
    ```

バンドルログに以下のメッセージが表示されるはずです。

```
2019-05-20 20:25:08.613 INFO [fileinstall-/Users/jamie/Repos/bundles/osgi/portal][BundleStartStopLogger:42] STOPPED com.liferay.portal.workflow.web_3.0.0 [248]
```

```
2019-05-20 20:25:09.312 INFO [Refresh Thread: Equinox Container: a8a147ab-cda3-4184-b37e-17724c1005f4][BundleStartStopLogger:39] STARTED com.liferay.portal.workflow.web_3.0.0 [248]
```

## 変更点

変更を加える場合、まず [JIRA](https://issues.liferay.com/secure/Dashboard.jspa) でチケットを作成し、コミットやプルリクエストの中でそのチケット番号を参照するのがベストです。

## JIRA

以下の手順でJIRAにチケットを作成します。

* [JIRA Account](https://issues.liferay.com/secure/Dashboard.jspa) に登録し、実装したい機能、改善、バグフィックスの進捗を確認することができます。 今後、これらを *課題* と呼ぶことにします。
* [問題のチケット](https://issues.liferay.com/secure/Dashboard.jspa) を送信してください。 チケットには、必ず以下のアクションを定義/完了させてください。
* 課題を明確に記述する。 バグであれば、それを再現するための手順も含める。
* 課題に対して適切なカテゴリーを選択してください。
* 問題の影響を受ける製品の最も古いバージョンを選択します。
* *Contribute Solution ボタン*をクリックして、表示された Contributor License Agreement に応答します。
* すでにチケットが存在する場合は、そのチケットから参加してください。

## ギズブ

以下の手順でGithubにカスタムの変更点を提出します。

* JIRAでチケットへの参照を含む論理的な作業単位をコミットします。 例えば `LPS-83432 CONTRIBUTING の例を命令形と具体形にする`
* 変更点を徹底的にテストしよう Liferay Portalがサポートするオペレーティングシステム、データベース、アプリケーションサーバー、およびその他の関連技術の多様性を考慮してください。 ある環境での変更が、他の環境の何かを壊さないようにすること。

Github 上のフォークにブランチをプッシュする前に、upstream/master の更新版にリベースしておくとよいでしょう。

* master から最新のコミットを取得します。

    ```
    git fetch upstream
    ```

* 最新のスナップショットバンドルを取得します。

    ```
    ant snapshot-bundle
    ```

* 最新のスナップショットリビジョンでリベースする。

    ```
    git rebase `cat ../bundles/.githash`
    ```

* 自分のブランチの変更を自分のフォークにプッシュする。

    ```
    git push origin my-custom-change
    ```

* liferay/liferay-portal リポジトリにプルリクエストを提出します。
* LPSチケットに、GitHubのプルリクエストへのリンクを記載します。

完了です! プルリクエストがクローズされるまで、コメントや質問には必ず返信してください。