# 高可用性サブスクリプションへのアップグレード

多くの場合、Liferay Cloudの標準サブスクリプションプランは、ライブプロジェクトの高品質なパフォーマンスを確保するのに十分です。 お客様のニーズの変化に応じて、サブスクリプションプランをアップグレードし、お客様の環境に割り当てられるリソースを増やす必要があるかもしれません。

![Liferay Cloudの標準的なサブスクリプションを利用した本番環境。](./upgrading-to-a-high-availability-subscription/images/01.png)

高可用性サブスクリプションにアップグレードすると、環境に割り当てられるリソースの量が増え、Dynatrace統合を使用したり、 `liferay`, `weberver`, `search` サービス用のインスタンスの数を増やせるようになります。

![High Availabilityサブスクリプションを使用した本番環境。](./upgrading-to-a-high-availability-subscription/images/02.png)

この追加されたインフラを利用するためには、以下の手順が必要です。

## アカウントマネージャーとのコミュニケーション

Liferay Cloudサブスクリプションをアップグレードする最初のステップは、アカウントマネージャーと連絡を取ることです。 アカウントをアップグレードすると、Liferay Cloudチームは、プロジェクトで使用できるリソースを増やします。

追加リソースのプロビジョニングが完了したら、サービスの設定を更新する必要があります。 このため、 `liferay`, `webserver`, `search` の各サービスの設定更新が必要です。

## Liferay サービスの構成

まず、 `liferay` サービスを設定して、お使いの環境で使用するインスタンス数を増やします。 Liferay Cloud [プロジェクトリポジトリ](../getting-started/configuring-your-github-repository.md)'の `liferay/LCP.json` ファイルで、 `scale` プロパティの値を1つ増やします（通常、 `1` から `2` 高可用性サブスクリプションにアップグレードする場合):

```
{
    "kind": "Deployment",
    "id": "liferay",
    "image": "liferaycloud/liferay-dxp:7.2-4.2.1",
    "memory": 8192,
    "cpu": 8,
    "scale": 2,
    ...
}
```

### Dynatraceの統合を有効にする

High Availabilityサブスクリプションには、 `liferay` サービスとDynatraceの統合を使用できるアドオンも含まれています。 本番環境でこの機能を利用するには、 `liferay` サービスを設定するための追加手順が必要です。

Liferay Cloud チームは、サブスクリプションをアップグレードする際に、この設定に使用する `テナント` 値を提供します。 この `テナント` の値を使用して、ここに記載されている [の手順を実行します](..//tuning-security-settings/managing-secure-environment-variables-with-secrets.md#integrating-dynatrace-with-production-environments) .

## Web Server サービスの構成

次に、 `ウェブサーバー` サービスを設定し、お使いの環境で使用するインスタンス数を増やします。 プロジェクトリポジトリの `scale` プロパティを `webserver/LCP.json` ファイルで増やし、 `liferay` サービスで使用するインスタンスの数に合わせてください。

```
{
    "kind": "Deployment",
    "id": "webserver",
    "image": "liferaycloud/nginx:1.16.1-4.1.1",
    "memory": 512,
    "cpu": 2,
    "scale": 2,
    ...
}
```

## サーチサービス設定

最後に、 `search` サービスを更新して、使用するインスタンスの数を増やすために、プロジェクトリポジトリの `search/LCP.json` ファイルにある `scale` プロパティを増やします。 サービスの開始時に問題が発生しないように、値を次の奇数インスタンス数に増やします（通常、High Availabilityサブスクリプションにアップグレードする場合は、 `1` から `3` まで）。

```
{
    "kind": "StatefulSet",
    "id": "search",
    "image": "liferaycloud/elasticsearch:6.8.13-4.1.1",
    "memory": 8192,
    "cpu": 8,
    "scale": 3,
    "podManagementPolicy": "Parallel",
    ...
}
```

```{warning}
`search` サービスのインスタンスが適切に接続できるように、`scale` プロパティを奇数ノードに増やし、`podManagementPolicy` プロパティを `Parallel` に設定することを確認します。
```

## 変更内容を展開する

すべてのサービスの設定が完了したら、 [新しい設定](../build-and-deploy/overview-of-the-liferay-cloud-deployment-workflow.md#deploy) を本番環境とUAT環境に配備してください。 Liferay Cloud への変更のデプロイに慣れていない場合は、次の手順を例として確認することができます。

### 変更した内容でJenkinsビルドを作成する

Gitがインストールされている端末でGitコマンドを実行し、変更内容を送信します。

1. 変更したファイルをGitに追加します。

    ```bash
    git add .
    ```

1. 変更内容とメッセージを添えてコミットしてください。

    ```bash
    git commit -m "Liferay Cloud High Availability subscription upgrade"
    ```

1. 変更をGitHub(またはその他)にプッシュします。

    ```bash
    git push origin master
    ```

変更をプッシュすると、自動的にビルドが作成されます。 ビルドが完了するのを待ってから、次に進みます。

### ビルドを環境に導入する

最後に、 [Liferay Cloud コンソール](https://console.liferay.cloud/login) を使用して、完成したビルドを該当する環境にデプロイします。

1. Liferay Cloud コンソールで Builds ページに移動します（ページ上部のリンクを使用します）。

1. リストの中から前回作成したビルドを探し、「Actions」メニューから「**Deploy build to**」をクリックします。

    ![ビルドのActionsメニューでデプロイします。](./upgrading-to-a-high-availability-subscription/images/03.png)

1. ビルドをデプロイする環境を選択します（例： `acme-uat`）。

1. 以下の情報を読み、確認ボックスを選択して、展開結果を確認します。

    ![チェックボックスにチェックを入れ、準備ができたらビルドをデプロイしてください。](./upgrading-to-a-high-availability-subscription/images/04.png)

1. **Deploy Build** をクリックします。

ビルドが環境にデプロイされ、設定した追加インスタンスでサービスが再起動します。

## まとめ

　 これらの手順を完了すると、環境は完全に高可用性モデルへとアップグレードされます。 これらの環境は、ユーザーのニーズを満たすために、より多くのリソースと機能を備えています。
