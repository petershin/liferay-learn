# Liferay Cloudのクラスタリングの設定

この記事では、Liferay Cloud の Liferay DXP インスタンスにクラスタリングを設定するために必要な手順の概要を説明します。

**内容：**

1. [クラスタリング環境変数を有効にする](#enable-the-clustering-environment-variable)
1. [クラスタリングスケールの設定](#set-the-clustering-scale)
1. [クラスタリングポータルプロパティの追加](#add-clustering-portal-properties)
1. [デプロイと確認](#deploy-and-verify)

## クラスタリング環境変数を有効にする

Liferay Cloud Console で目的の環境から起動します。 次に、 `［Services］`から `［liferay］`に移動して、 `［環境変数］`をクリックします。 `LCP_PROJECT_LIFERAY_CLUSTER_ENABLED` 変数が `true`に設定されていることを確認します。 これは、イメージの起動プロセスに、クラスタリング設定をLiferay DXPに追加するように指示します。

![LCP **PROJECT** LIFERAY **CLUSTER** ENABLEDの設定](./setting-up-clustering-in-liferay-cloud/images/01.png)

## クラスタリングスケールの設定

クラスタリング環境のノード数は、Liferayサービスの `LCP.json` ファイル内（`liferay/`フォルダ内）の `スケール` プロパティによって決定されます。 Liferayサービスを初めてデプロイする場合、または `スケール` プロパティが `LCP.json` ファイルでまだ設定されていない場合は、最初に値を `1` 設定し、 [サービスをデプロイする](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md#deploy) 必要があります。

```json
{
  "kind": "Deployment",
  "id": "liferay",
  "image": "liferaycloud/liferay-dxp:7.2-4.0.1",
  "memory": 8192,
  "cpu": 8,
  "scale": 1,
}
```

Liferayサービスが `scale` プロパティを `1`に設定してデプロイされたら、この値を必要なノード数に更新します。

```{warning}
クラスタ化された環境の複数のノードは、データベーススキーマに変更があった場合（パッチのインストール時など）、互いに競合する可能性があります。 このような場合は、まずスケールを1に戻してLiferayサービスを再配置することで、スキーマの競合問題を回避します。 その後、スケールを正しいノード数に戻し、サービスを再配置します。
```

```{note}
Liferay DXPインスタンスのノード数を増やすと、プロジェクトに割り当てられるCPUコア数が増える可能性があります。 増加した CPU コア数がプランの最大値 [quota](../manage-and-optimize/quotas.md) を超えている場合、デプロイに失敗することがあります。
```

### オートスケーリング

オートスケーリングは、 `LCP.json` `scale` 属性と連動します。 オートスケーリングが有効な場合、 `スケール` プロパティはインスタンスの初期数を決定します。 その後、インスタンスの数は需要に応じて増加します。 詳細は、 [オートスケーリング](../manage-and-optimize/auto-scaling.md) を参照してください。

## クラスタリングポータルプロパティの追加

デフォルトでは、Liferay Cloud でクラスタリングを有効にするために、追加のポータルプロパティは必要ありません。 クラスタリングをセットアップするために必要な設定は、Liferay DXPサービスの起動時に、Dockerイメージ内の `portal-clu.properties` および `unicast.xml` ファイルにすでにコピーされています。

ただし、クラスタリング用に追加のポータルプロパティが必要な場合は、プロパティをリポジトリに追加できます。 クラスタリング固有のポータルプロパティを上書きするには、選択した環境に適した `コンフィグ` フォルダ内の `portal-clu.properties` ファイルに追加します。 Liferay サービスの設定のデプロイについては、 [Liferay DXP サービスの設定](./configuring-the-liferay-dxp-service.md) を参照してください。

## デプロイと確認

選択した環境に設定の変更をデプロイして、クラスタリングが有効になっていることを確認します。 詳しくは、 [Liferay Cloud 導入ワークフローの概要](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md) をご覧ください。

クラスタリングが正しく機能しているかどうかを確認するには、Liferay DXPインスタンスのログで、 `JGroupsReceiver` クラスからの `Accepted View` メッセージを確認します。

以下は、クラスタリングを使用した正常なデプロイメントのログの例です。

```shell
Aug 26 09:42:22.778 build-90 [liferay-68b8f6b48d-hdj9t] [dxp] INFO  [Incoming-2,liferay-channel-transport-0,liferay-68b8f6b48d-hdj9t-23003][JGroupsReceiver:91] Accepted view [liferay-68b8f6b48d-r8r5f-1292|8] (3) [liferay-68b8f6b48d-r8r5f-1292, liferay-68b8f6b48d-gzsg4-15389, liferay-68b8f6b48d-hdj9t-23003]
Aug 26 09:42:22.779 build-90 [liferay-68b8f6b48d-hdj9t] [dxp] INFO  [Incoming-1,liferay-channel-control,liferay-68b8f6b48d-hdj9t-17435][JGroupsReceiver:91] Accepted view [liferay-68b8f6b48d-r8r5f-29669|8] (3) [liferay-68b8f6b48d-r8r5f-29669, liferay-68b8f6b48d-gzsg4-48301, liferay-68b8f6b48d-hdj9t-17435]
```

`受け入れられたビュー[liferay-68b8f6b48d-r8r5f-1292|8]` は、 `liferay-68b8f6b48d-r8r5f-1292` がマスターノードであることを示します。

`（3）[liferay-68b8f6b48d-r8r5f-29669、liferay-68b8f6b48d-gzsg4-48301、liferay-68b8f6b48d-hdj9t-17435]` は、 `（3）` ノードがクラスターの一部であることを、ノードのIDと共に示しています。 このリストには、スレーブノードに加えてマスターノードが含まれます。

## 関連トピック

* [オートスケーリング](../manage-and-optimize/auto-scaling.md)
* [Liferay DXPサービスの紹介](../using-the-liferay-dxp-service.md)
* [Liferay DXPサービスの設定　](./configuring-the-liferay-dxp-service.md)
