# カスタムサービスの使用

Liferay Cloudでは、すぐに利用できる標準的なサービスだけでなく、より多くのサービスを実行することができます。 また、Liferay Cloudインフラストラクチャ内で新しいプロセスを実行するためのカスタムサービスを作成し、デプロイすることができます。 Liferay Cloud環境においてカスタムサービスの利用を希望されるお客様は、まず営業担当者にご連絡いただき、この機能を有効にし、お客様の環境が適切にプロビジョニングされていることを確認してください。

```{note}
カスタムサービスを追加するためには、十分なハードウェアリソースが用意されている必要があります。 プロビジョニングプロセス中にカスタムサービスに追加のリソースを割り当てることができます。
```

Liferay Cloud は、サービスの基盤として Docker イメージを使用しています。 これらのサービスをローカルで実行したい場合は、 [［install Docker］](https://docs.docker.com/get-docker/) をローカルシステムにインストールしてください。

詳しくは、 [［custom services limitations］](../reference/platform-limitations.md#custom-services) を参照してください。

## カスタムサービスの追加

以下の手順で、Liferay Cloud のビルドに独自のカスタムサービスを追加してください。

1. カスタムサービスをDockerイメージとして作成または検索します。 プロジェクトのワークスペースに直接追加したDockerfileを使用するか、 [［Docker Hub］](https://hub.docker.com/) などのパブリックリポジトリのイメージを使用できます。

1. サービス用の新しいディレクトリを他のサービスディレクトリ（たとえば `［liferay］` および `［データベース］`）と一緒に追加し、その中に `［LCP.json］` ファイルを含めます：

    ```
    ├── backup
    ├── ci
    ├── database
    ├── liferay
    ├── search
    ├── webserver
    └── myCustomService
        └── LCP.json
    ```

    このファイルに設定を追加する方法の詳細は、[LCP.jsonによる設定 ](../reference/configuration-via-lcp-json.md) を参照してください。

    ```{warning}
    新しいカスタムサービスでビルドをトリガーしても、新しいサービス用に十分なリソースがプロビジョニングされていない場合、他のサービスに割り当てられたリソースに干渉する可能性があります。

    LCP.jsonファイルで新しいサービスのメモリとCPUの割り当てを直接設定して、正しい量のハードウェアリソースを取得できるようにします。
    ```

1. カスタムサービスを適用する環境を`［LCP.json］`内で指定します。 これは、新しいサービス用にプロビジョニングしたリソースの数によって異なります。

    たとえば、ビルドを `［prd］` 環境にのみ適用するには、 `［LCP.json］`に以下のプロパティを追加します：

    ```json
    {
      "environments": {
          "prd": {
            "deploy": true
          }
      }
    }
    ```

    そのようなプロパティが指定されていない場合、デフォルトでは、サービスはすべての環境用のカスタムサービスを構築しようとします。

1. Dockerイメージを新しいサービスに適用します。 Dockerイメージの追加に使用する方法は、パブリックリポジトリにアップロードされたイメージを使用しているか、ローカルのDockerfileを使用しているかによって異なります。

    * **公開リポジトリからのDockerイメージを使用している場合：** イメージの名前を `［LCP.json］`内の `［イメージ］` プロパティに追加します：

      ```
      "image": "mydockerimages/myservice:1.0.0"
      ```

    * **ローカルのDockerfileを使用している場合：** カスタムサービスのディレクトリにDockerfileを追加します。 サービスがビルドされると、DockerfileからのDockerイメージがサービスのイメージとして自動的に選択されます。

      ```{note}
      Dockerfileは自動的にサービスのイメージとして使用されます。 その結果、LCP.jsonの "image "プロパティは無視されます。
      ```

1. これらの変更をバージョン管理のブランチにコミットします：

    ```bash
    git add my-custom-service/
    git commit -m "Add custom service"
    ```

1. ブランチをプッシュし、Liferay Cloud で新しいビルドを開始し、デプロイします。 ビルドのデプロイについては、 [Liferay Cloud デプロイメントの概要](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow#deploy) にあるデプロイの情報を参照してください。

CIで変更を加えて新しいビルドを起動したら、Liferay Cloudコンソールで **Builds** 画面に移動してビルドを確認することができます。 ［**サービス**］ の列にリストされているサービスには、他のサービスとの新しいサービスが含まれています。

このビルドをいずれかの環境にデプロイする場合（アクションメニューで[**ビルドを** にデプロイ]をクリックして）、その環境の ［**サービス**］ ページに移動して、そこにリストされているカスタムサービスを確認することもできます：

![新しい "カスタムサービス" 他のサービスと並行して展開。](./using-a-custom-service/images/01.png)

## 関連トピック

* [Liferay Cloud 導入ワークフローの概要](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow)
