# 初期設定の概要

Liferay Cloudの使用を開始するには、すべてのアカウント、環境、サービスが正常にプロビジョニングされ、インスタンスにデプロイされていることを確認する必要があります。 以下の手順で始めます：

- [セットアップメールの確認](#check-setup-emails)
- [Liferay Cloudコンソールへのアクセス](#access-the-dxp-cloud-console)
- [プロビジョニングされたプロジェクトのソースコードへのアクセス](#access-the-provisioned-project-source-code)
- [お客様のCIとDXPサービスにログインする](#log-in-to-your-ci-and-dxp-services)
- [セットアップの確認](#verifying-setup)

## セットアップメールの確認

Liferay Cloudのサブスクリプションに関連付けられたEメールアカウントでセットアップメールを確認してください。 購入したLiferay Cloud環境ごとに、Liferay Cloudのオンボーディングメールと招待メールが届くはずです。

オンボーディングメールには、非プロダクション環境でJenkinsとLiferay DXPにアクセスするために必要な認証情報と、Liferay Cloudを使い始めるための重要なステップが記載されています。

各環境招待は、購入された1つのLiferay Cloud環境へのアクセスを許可するものです。 すべての環境の招待を受けるようにしてください。

## Liferay Cloudコンソールへのアクセス

戻ってきたユーザーは、既存のアカウントを使ってLiferay Cloud Consoleに [ログインすることができます](https://console.liferay.cloud/login) 。 新規ユーザーは、Liferay Cloudのサブスクリプションに関連付けられたメールアカウントを使用して [アカウントを作成する必要があります](https://console.liferay.cloud/signup?undefined) 。

ログインすると、ユーザーはLiferay Cloud Console [のホームページ](https://console.liferay.cloud/projects) に移動します。

![図1：Liferay Cloud Consoleのホーム画面。](./initial-setup-overview/images/01.png)

ここから、環境やデプロイメントにアクセスして管理したり、他のチームメンバーを招待したりすることができます。

## プロビジョニングされたプロジェクトのソースコードへのアクセス

新しいLiferay Cloudのプロジェクトは、 `dxpcloud` 組織にホストされた一時的なGitHubリポジトリにプロビジョニングされます。 このリポジトリには、Liferay Cloudの開発プロジェクトのテンプレートが含まれています。

新しいプロジェクトのリポジトリにアクセスするには、Liferay Cloudのオンボーディングメールの指示に従い、後続のGitHub招待状を承認します。

招待状を受け取ったら、プロビジョニングされたプロジェクトのリポジトリを探します。

1. GitHubへのログイン

1. `dxpcloud` を **Your teams** の検索ボックスで検索します。

![図2：「Your teams」の検索ボックスでdxpcloudを検索します。](./initial-setup-overview/images/02.png)

プロビジョニングされたリポジトリを見つけたら、次のことをしなければなりません。

1. プロビジョニングされたリポジトリのコンテンツを、プライベートなGitリポジトリに転送する。

1. プライベートリポジトリとLiferay CloudのJenkins(CI)サービスをWebhookで連携させる。

詳しい手順は、 [GitHubリポジトリの設定](./configuring-your-github-repository.md) をご覧ください。

```{note}
他のホスティングサービスを利用していますか？ [Bitbucket](./configuring-your-bitbucket-repository.md) または [GitLab](./configuring-your-gitlab-repository.md) リポジトリを設定する方法をご覧ください。
```

## お客様のCIとDXPサービスにログインする

Jenkins(CI)とLiferay DXPにログインして、それぞれのWebインターフェースに直接アクセスします。

どちらのログイン資格も最初のオンボーディング メールで提供されていますが、 **環境変数** の下に、 **infra** 環境の **ci** サービス ページにも記載されています。

詳しい手順については、 [Liferay Cloudサービスへのログイン](./logging-into-your-liferay-cloud-services.md) をご覧ください。

## セットアップの確認

Liferay Cloudでのデプロイを開始する前に、正しい環境とサービスが正常にプロビジョニングされ、デプロイされていることを確認してください。

### 環境の検証

購入したすべての環境がLiferay Cloud・コンソールの [ホームページ](https://console.liferay.cloud/projects) の **Projects** に表示されていることを確認します。

![図3：Liferay Cloud Consoleでプロビジョニングされた環境を見る。](./initial-setup-overview/images/03.png)

すべての環境招待を受け入れた後に環境が見つからない場合は、Liferayサポートチームにお問い合わせください。

### 環境の場所を確認する

各環境のロケーションが、チームからリクエストされたロケーションと一致していることを確認します。

すべての環境の場所は、Liferay Cloudコンソールの [ホームページ](https://console.liferay.cloud/projects) に記載されています。

また、環境の ［**概要**］ ページや ［**設定**］ ページに移動することで、環境の位置を確認することができます。

![図4：［Overview］ページで環境の位置を確認する。](./initial-setup-overview/images/04.png)

環境の場所があなたのチームが要求した場所と一致しない場合は、 [Liferayサポートチームに](https://help.liferay.com/hc/ja/articles/360030208451-DXP-Cloud-Support-Overview) 連絡してください。

### Liferay Cloudスタックサービスの確認

Liferay Cloudのスタックサービスが正しく展開されていることを確認します。

1. Liferay Cloud Consoleから **dev** 環境にアクセスします。

1. **Services** ページに移動します。

![図5：［Services］ページでLiferay Cloud Stackサービスのステータスを表示します。](./initial-setup-overview/images/05.png)

適切にデプロイされると、5つのデフォルトクラウドスタックサービスのステータスがすべて 'Ready'になります。

## 追加情報

- [GitHubリポジトリの設定](./configuring-your-github-repository.md)
- [DXPのクラウド環境を理解する](./understanding-liferay-cloud-environments.md)
- [DXPクラウドサービスへログインする](./logging-into-your-liferay-cloud-services.md)
