# Liferayクラウドインフラ

Liferay Cloudは、堅牢で信頼性が高く、管理しやすいLiferay DXPの実装を実現するための主要コンポーネントの集合体を組み合わせた柔軟なプラットフォームです。 この図は、これらのコンポーネントがどのように組み合わされてこの実装が完成するかを示しています。

![Liferay Cloudと統合された主要なサービスやコンポーネントは、ここにその接続先が表示されています。](./liferay-cloud-infrastructure/images/01.png)

```{note}
プライベートクラスターサブスクリプションには、ビルトインの[Webアプリケーションファイアウォール](..//tuning-security-settings/web-application-firewall.md) も含まれています。 ただし、これは [共有クラスタでは利用できない](./platform-limitations.md#security) です。
```

各コンポーネントの説明は以下のリストを参照してください。

## 高度なアプリケーション・モニタリング

Liferay Cloud は、 [Dynatrace](https://www.dynatrace.com/) の監視の使用をサポートします。 このアプリは、アプリケーションのパフォーマンスやインフラなどをリアルタイムに監視します。 詳細は、 [高度なアプリケーションメトリクス](../manage-and-optimize/application-metrics.md#advanced-application-metrics-production-only) を参照してください。

## リポジトリの統合

Liferay Cloudは、Gitを使用したプロジェクトのソースコードと統合しています。 Jenkinsとの統合により、新しいコミットやプルリクエストが自動的にビルドを開始し、Liferay Cloud環境にデプロイすることができます。

[GitHub](../getting-started/configuring-your-github-repository.md)、 [Bitbucket](../getting-started/configuring-your-bitbucket-repository.md)、 [GitLab](../getting-started/configuring-your-gitlab-repository.md) の統合に対応しています。

## VPNサーバーとクライアント

Liferay Cloud環境では、お客様独自のVPNサーバーを利用した暗号化トンネルでデータの送受信が可能です。 Liferay Cloudは、対応するVPNからその環境に接続できるクライアント・サイト間VPNサービスを提供します。 この接続では、OpenVPNとIPSec（IKEv2）のプロトコルがサポートされています。 詳細は、 [VPNインテグレーションの概要](../infrastructure-and-operations/networking/vpn-integration-overview.md) を参照してください。

## Docker Hub

Liferay Cloud は、サービスイメージとバージョン（タグとして共有）の公開プラットフォームとして、 [Docker Hub](https://hub.docker.com/) を使用しています。 また、この実装により、お客様は任意の公開リポジトリやローカルの開発ワークスペースからカスタムDockerイメージを使用することができます。 サービスイメージのレジストリについては、Docker Hub の [Liferay Cloud profile](https://hub.docker.com/u/liferaycloud) を参照してください。

## DDoSプロテクション

Liferay Cloudは、分散型サービス妨害（DDoS）攻撃からの保護を内蔵しています。 また、 [GCP POPネットワーク](https://peering.google.com/#/infrastructure) を使用して、受信トラフィックが殺到しないように環境を保護し、世界中のエンドユーザーにコンテンツを安全かつ安定的に配信しています。

## HTTP(S) ロードバランサー

Liferay Cloud は、HTTP(S) のトラフィックを複数のインスタンスに分散しています。 また、 [GKE Ingress](https://cloud.google.com/kubernetes-engine) を使用してトラフィックを分散させ、サービスが過負荷になるリスクを低減します。

## ウェブサーバー

[Nginx](https://www.nginx.com/) Webサーバーは、すべてのLiferay Cloud環境内の他のサービスへのゲートウェイとして使用されます。 これには、レイヤー7攻撃防御、IP保護、監査ログを提供する内蔵ファイアウォールが含まれます。

このサーバーは、Liferay Cloudのメインサービスの1つとして設定可能です。 詳しくは [Web Server Service](../platform-services/web-server-service.md) を参照してください。

## Liferay DXP

[Liferay DXP](https://www.liferay.com/products/dxp) は、さまざまなアプリケーションからのデータやサービスを、1つの中央ユーザー・インターフェース・プラットフォームに接続し、編成し、統合しています。 Liferay Cloudは、クラウド上のDXPインスタンスに対して、迅速かつ信頼性の高い実装を提供します。 [Webサーバーサービス](#web-server) は、DXPへのすべてのHTTP(S)トラフィックのエントリーポイントとゲートウェイを提供します。

設定や任意のカスタムモジュールを [独自のプロジェクトリポジトリ](#repository-integration) に追加することで、Liferayサービスは通常のDXPインストールと同様に高度なカスタマイズが可能です。詳しくは、 [Liferayサービスについて](../using-the-liferay-dxp-service.md)をご覧ください。

## 検索

Liferay Cloudは、各環境内でRESTfulな検索、インデックス作成、分析機能として、 [Elasticsearch](https://www.elastic.co/elasticsearch/service) を使用しています。 検索サービスは、TCPまたはUDP接続によるプライベートネットワークトラフィックを介してのみアクセス可能です。

Elasticsearchエンジンは、Liferay Cloudの主要サービスの一つとして提供されているため、高い拡張性とカスタマイズ性を備えています。 詳しくは、 [Search Service](../platform-services/search-service.md) を参照してください。

## MySQLデータベース

Liferay Cloudは、Liferayのサービスを、プライベートネットワーク内の別のデータベースストレージサービスに接続します。 [MySQL](https://www.mysql.com/) データベースを使用して、信頼性、安全性、拡張性の高いDXPの実装をクラウドで実現しています。 データベースサービスは、TCPまたはUDP接続によるプライベートネットワークトラフィックを介してのみアクセス可能です。

MySQLデータベースは、Liferay Cloudの主要サービスの一つとして提供されているため、自由に設定やカスタマイズが可能です。 詳しくは、 [Database Service](../platform-services/database-service/database-service.md) を参照してください。

## パーシステッドストレージ（ボリュウム

Liferay Cloudは、プライベートネットワーク内で、ボリュームを必要とするあらゆるサービスの永続的なデータストレージとして使用します。 サービスの種類に応じて、ボリュームはそのサービス専用のSSDドライブに格納されるか、ネットワークファイルシステム（NFS）上でサービス間で共有されるかのいずれかになります。 ボリュームは、プライベートネットワークトラフィックを介してのみアクセス可能です。

デフォルトでは、Web Server、Liferay DXP、Backupの各サービスはNFSでボリュームを保存し、SearchとCIの各サービスは専用のSSDディスクを使用しています。 詳細は、 [永続的なファイルストレージボリュームの設定](../build-and-deploy/configuring-persistent-file-storage-volumes.md) を参照してください。

## バックアップ

Liferay Cloud は、Liferay DXP の Database サービスのコピーとボリュームを、プライベートネットワーク内に保存します。 顧客は、任意の環境から手動でバックアップを作成し、そのバックアップを他の環境に復元できます。 デフォルトでは、バックアップはHTTP(S)接続を介してパブリックウェブトラフィックにアクセスできます。

バックアップはLiferay Cloudのメインサービスの一つとして提供されており、その運用ルール（バックアップの頻度や保存期間など）は自由に設定することが可能です。 詳しくは [バックアップサービスの概要](../platform-services/backup-service/backup-service-overview.md) を参照してください。

## CIサーバー

Liferay Cloudは、開発中のお客様のプロジェクトのビルドとデプロイのプロセスを自動化します。 プロジェクトが [顧客のリポジトリ](#repository-integration) に結びついている状態で、Jenkinsをウェブフックで使用し、新しいコミットやプルリクエストを自動的にあらゆる環境にデプロイ可能なビルドに変換します。 このサービスは、特別な独立した `インフラ` 環境の中に存在しており、通常のユーザーはアクセスできません。 また、Liferay CloudはCloudコンソールでお客様にJenkinsビルドの詳細を表示するダッシュボードを提供します。

Jenkinsのビルドに使用するCIサービスは、Liferay Cloudのメインサービスの一つとして提供されており、お客様はこのサービスを設定し、必要に応じてJenkinsパイプラインをカスタマイズすることも可能です。 詳しくは [継続的インテグレーション](../platform-services/continuous-integration.md) を参照してください。

## CLIツール

Liferay Cloudでは、CLI Toolを使用することで、その環境やサービスに対して様々な管理作業を行うことが可能です。 このアプリケーションは、お客様のすべてのプロジェクトに使用できる中央のインターフェースとして機能し、HTTP(S)トラフィックにアクセスできます。 詳しくは、 [コマンドラインツール](./command-line-tool.md) 参照してください。

## アンチウイルス

Liferay Cloud は、 [ClamAV](https://www.clamav.net/) を使用して、トロイの木馬、ウイルス、マルウェア、その他の悪意のある脅威を自動的に検出します。 このエンジンは、クラウド内のバックグラウンドサービスとして動作しており、ユーザーや他のサービスからはアクセスできないようになっています。 Liferay Cloudの各クラスタには、アンチウィルスのインスタンスが1つずつ稼働しています。

## 侵入検知システム

Liferay Cloud は、 [Threat Stack](https://www.threatstack.com/cloud-security-platform/intrusion-detection) を使用して、そのコンポーネント内の侵入を自動的に検出します。 このシステムも内蔵の [ウイルス対策ソフト](#antivirus) と同様にバックグラウンドサービスとして動作しており、ユーザーや他のサービスからはアクセスできないようになっています。 Liferay Cloud の各クラスタには 1 つのインスタンスがあります。