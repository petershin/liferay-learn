# ホットフィックスのインストール

Liferayインスタンスを最新の状態に保つことは、Liferay Cloudのメンテナンスの重要な部分です。しかし、 [DXPインスタンスを新しいマイナーバージョンにアップデートする](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/updating-your-dxp-instance-to-a-new-minor-version) に問題が現れる前にパッチを当てる必要がある場合は、Hotfixをデプロイすることができます。HotfixはLiferayサポートが提供する一時的な解決策で、修正バージョンにアップデートする準備が整うまでの間、これらの問題を修正します。

ここでは、カイルがHotfixのリクエストからインストールまでの手順を説明します。 彼はすでにサイトのダウンタイムを予定しており、本番環境でHotfixを導入してテストすることができる。 

## Hotfixのリクエスト

Liferay DXPの特定の問題に対する短期的な修正が必要な場合は、Hotfixをリクエストしてください。 これは、最近修正された既知の問題であったり、Liferayインスタンスで発見した新しい問題であったりします。 いずれの場合も、 [Liferay's Help Center](https://help.liferay.com) でリクエストを作成してください。

![Liferayのヘルプセンターでチケットを作成してホットフィックスをリクエストしてください。](./installing-a-hotfix/images/01.png)

新規チケットを作成すると、Liferayサポートスタッフがチケットに返信してサポートします。 問題を解決するためにHotfixが必要な場合、Liferayはチケット上でHotfixを提供するプロセスを説明します。

Liferayのスタッフがチケットを更新するたびに、Hotfixの準備ができたときなど、Eメールで最新情報を受け取ることができます。 Hotfixのダウンロードが完了したら、このページのいずれかのリンクで作成したチケットからダウンロードしてください。

![Hotfixを含むコメント、またはチケットの添付ファイルリストからダウンロードしてください。](./installing-a-hotfix/images/02.png)

## Hotfixを使用して新しいビルドを作成する

Hotfixができたら、それをリポジトリにコミットし、新しいCIビルドにプッシュする。

1. プロジェクトリポジトリの `liferay/config/common/patching/` フォルダにHotfixをコピーしてください。
   
   Hotfixを `common/` （すべての環境に適用されるように）フォルダに置き、UATと本番環境で同じビルドを使用します。

1. Hotfixをリポジトリに追加し、コミットします。 

   ```bash
   git add .
   ```

   ```bash
   git commit -m "Install new hotfix for issue..."
   ```

1. 変更を加えたブランチをプッシュアップしてください。 

   ```bash
   git push origin [branch_name]
   ```

Liferay Cloudはあなたの変更を検出し、あなたがデプロイできる新しいビルドをCIで作成します。 ビルドが完了するまで数分待つ。

## Hotfixの適用とテスト

Hotfixを本番環境に適用する前に、UAT環境でテストしてください。

1. クラウド・コンソールで、画面上部の **Builds** をクリックします。

1. リストの一番上にある新しいビルドが完了したら、 **Actions**( ![Actions menu](../../images/icon-actions.png) ) &rarr; **Deploy to... をクリックします。**
   
   ![まず、Hotfixを含むビルドをUATにデプロイしてください。](./installing-a-hotfix/images/03.png)

1. ［Select Environment］ドロップダウンメニューで、UAT環境を選択します。

1. Deploy Confirmationのチェックボックスにチェックを入れ、変更の影響を確認します。

1. ［**Deploy Build**］ をクリックします。

   Hotfixを使用してUAT環境のサービスが再起動します。

1. サービスが復旧したら、UAT Liferayインスタンスにログインして問題をテストし、ホットフィックスで問題が解決したことを確認してください。

## 本番環境へのデプロイ

Hotfixが正しく機能することを確認したら、予約したダウンタイム中に本番環境への [デプロイプロセス](#deploy-and-test-the-hotfix) ）展開プロセスを繰り返します。 後で同じ問題を修正したLiferayのバージョンにアップデートする場合は、Hotfixを削除することを忘れないでください。

　 クラウド管理者コースの自己管理型クラウド構成モジュールを完了しました。

次へ [クラウド開発ライフサイクル](../cloud-development-lifecycle.md). 

## 関連コンセプト

* [Liferayサービスへのデプロイ](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/deploying-to-the-liferay-service)
* [DXPインスタンスを新しいマイナーバージョンにアップデートする](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/updating-your-dxp-instance-to-a-new-minor-version)
* [Liferay DXPインスタンスのアップグレード](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/upgrading-your-liferay-dxp-instance)
