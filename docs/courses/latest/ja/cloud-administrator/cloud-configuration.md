---
toc:
  - ./cloud-configuration/setting-up-the-github-repository.md
  - ./cloud-configuration/configuring-your-sites-domain.md
  - ./cloud-configuration/setting-up-clustering-for-the-liferay-service.md
  - ./cloud-configuration/configuring-auto-scaling.md
  - ./cloud-configuration/rotating-your-database-password.md
  - ./cloud-configuration/installing-a-hotfix.md
---
# クラウド構成

LXC で変更をデプロイするためにクラウド コンソールをセットアップして使用する手順を説明しました。LXC-SMは同じクラウドコンソールを使って変更やカスタムコードをデプロイするので、[LXCと同じプロセス](./setting-up-your-cloud-project.md)を使ってLXC-SMのコンソールやツールを使い始めることができます。しかし、LXC-SMを使えば、管理できることが増えます: Liferayのコアサービスを完全に管理することもできます！

```{note}
次の2つのモジュール（Cloud Configurationと [クラウド開発のライフサイクル](./cloud-development-lifecycle.md) ）には、LXC-SM上のプロジェクトが必要です。
```

開発環境や本番環境には、クラウド・ネットワーク内の個別のサービスとして、これらすべてが含まれている：

* あなたの [Liferay DXPサービスの使用](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service)
* [Webサーバーサービス（Nginx）](https://learn.liferay.com/w/liferay-cloud/platform-services/web-server-service)
* [検索サービス（Elasticsearch）](https://learn.liferay.com/w/liferay-cloud/platform-services/search-service)
* [データベースサービス(MySQL)](https://learn.liferay.com/w/liferay-cloud/platform-services/database-service/database-service)
* [バックアップサービスの概要](https://learn.liferay.com/w/liferay-cloud/platform-services/backup-service/backup-service-overview)

![各環境では、これらのサービスは個別のクラウド・ネットワークで管理されている。](./cloud-configuration/images/01.png)

また、別の `infra` 環境に [継続的インテグレーション](https://learn.liferay.com/w/liferay-cloud/platform-services/continuous-integration) があり、他の環境用に作成またはデプロイしたビルドを制御している。

LXC-SM プロジェクトにおけるあなたの責任については、 [こちら](https://help.liferay.com/hc/ja/articles/360059798531-DXP-Cloud-Shared-Activities) を参照してください。

LXC-SMでは、特定のニーズに従って環境を構成し、管理するのはあなたの責任です。 ここでは、以下の方法を学ぶことができる。

* プロジェクト全体のビルドをデプロイするために、Gitリポジトリをセットアップする。
* Liferayインスタンスにカスタムドメインを設定する
* クラスタリングと自動スケーリングを有効にする
* データベースのパスワードを変更（ローテーション）する
* Hotfixのインストール

[続きはこちら](./cloud-configuration/setting-up-the-github-repository.md)
