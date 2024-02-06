# オートスケーリングの設定

任意のノード数で本番環境のクラスタリングを有効にすると、ピーク時のサイト・トラフィックをより適切に処理するために自動スケーリングを設定できます。

Marcusがオートスケーリングを設定するには、以下の手順に従ってください。

```{important}
自動スケーリングによって自動的に追加されたインスタンスの使用量に基づき、四半期ごとに請求されます。 これらの追加インスタンスの料金の詳細については、Liferayアカウントマネージャーにお問い合わせください。
```

## コンソールでオートスケーリングを有効にする

Liferay Cloud コンソールを使って、本番環境の自動スケーリングを有効にします。

1. Liferay Cloud コンソールで本番環境に移動します。

1. **Services** &rarr; **Liferay** に移動する。

1. **Scale** タブを選択する。

   ![LiferayサービスのScaleタブには、使用されているインスタンス数と、自動スケーリングを有効または無効にするコントロールが表示されます。](./configuring-auto-scaling/images/01.png)

1. **Enable Auto Scaling** をクリックする。

オートスケーリングが有効になりました。 クラスタリング構成のため、最低2つのノードがあり、使用量が増えれば、デフォルトの最大10ノードまでノードが追加されます。

## 最大インスタンス数の設定

ピーク時に何度か繰り返した結果、Delectable Bonsaiのウェブサイトはデフォルトの10以上のLiferayインスタンスを必要としていることがわかりました。 マーカスがオートスケールの最大値を10から12に再設定するのを助ける。

Liferay サービスの `LCP.json` ファイルの `maxInstances` プロパティでインスタンスの最大数を設定します：

1. プロジェクトのリポジトリで、 `liferay/` ディレクトリに移動し、 `LCP.json` ファイルを開きます。

1. `autoscale` JSONオブジェクト内で、 `maxInstances` の値を12に設定する：

   ```json
    "autoscale": {
        "maxInstances": 12
    }
   ```

1. 変更をコミットして Git リポジトリにプッシュします。

   ```bash
   git add liferay/LCP.json
   ```

   ```bash
   git commit -m "Increase the maximum number of instances to 12."
   ```

   ```bash
   git push origin [branch_name]
   ```

GitHub 上のあなたのリポジトリは最大インスタンス数が更新され、Liferay Cloud はあなたの変更で新しいビルドを作成します。

## 構成を展開する

更新された構成を本番環境にデプロイします。

1. Liferay Cloudコンソールにログインします。

1. 画面右上の **Builds** リンクをクリックし、Builds ページにアクセスします。

1. 新しい変更を加えたコミットに対応するビルドの Actions メニュー ![Actions menu icon](../../images/icon-actions.png) をクリックし、 **Deploy build to... を選択します。**

   ![Buildsページからコミットメッセージと一緒にデプロイするビルドを選択します。](./configuring-auto-scaling/images/02.png)

1. **Environment** ドロップダウン・メニューで本番環境を選択します。

1. 配備の影響を認識するボックスにチェックを入れる。

   ![本番環境を選択し、フォームに記入してビルドをデプロイします。](./configuring-auto-scaling/images/03.png)

1. ［**Deploy Build**］ をクリックします。

サービスが再起動すると、最大12インスタンスまで自動スケーリングが有効になります。

次: [データベースサービスのパスワードを変更する](./rotating-your-database-password.md).

## 関連概念

* [オートスケーリング](https://learn.liferay.com/w/liferay-cloud/manage-and-optimize/auto-scaling)
* [Liferayサービスへのデプロイ](https://learn.liferay.com/w/liferay-cloud/using-the-liferay-dxp-service/deploying-to-the-liferay-service)
* [Liferay Cloud Consoleを使った変更のデプロイ](https://learn.liferay.com/w/liferay-cloud/updating-services-in-liferay-paas/deploying-changes-via-the-liferay-cloud-console)
