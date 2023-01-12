# 初期設定の概要

Liferay Cloud を使い始めるには、すべてのアカウント、環境、サービスが正常にプロビジョニングされ、インスタンスにデプロイされたことを確認する必要があります。 以下の手順で始めます：

- [セットアップメールの確認](#check-setup-emails)
- [Liferay Cloud Consoleにアクセスします。](#access-the-liferay-cloud-console)
- [プロビジョニングされたプロジェクトのソースコードへのアクセス](#access-the-provisioned-project-source-code)
- [CIとLiferayのサービスにログインします。](#log-in-to-your-ci-and-liferay-services)
- [セットアップの確認](#verifying-setup)

## セットアップメールの確認

Liferay Cloud のサブスクリプションに関連するメールアカウントで、セットアップメールを確認してください。 購入したLiferay Cloud環境ごとに、招待メールと一緒にLiferay Cloudオンボーディングメールが届くはずです。

オンボーディングメールは、非運用環境でのJenkinsとLiferay DXPにアクセスするために必要な認証情報と、Liferay Cloudを使い始めるための重要なステップを提供します。

各環境の招待状は、購入した1つのLiferay Cloud環境へのアクセスを許可するものです。 すべての環境の招待を受けるようにしてください。

## Liferay Cloud Consoleにアクセスします。

復帰したユーザーは、 [既存のアカウントで Liferay Cloud Console](https://console.liferay.cloud/login) にログインできます。 新規ユーザーは、 [Liferay Cloudのサブスクリプションに関連するメールアカウントを使用して、](https://console.liferay.cloud/signup?undefined) アカウントを作成する必要があります。

ログイン後、ユーザーは Liferay Cloud Console [のホームページ](https://console.liferay.cloud/projects)に移動します。

![図1：Liferay Cloud Consoleのトップページ。](./initial-setup-overview/images/01.png)

ここから、環境やデプロイメントにアクセスして管理したり、他のチームメンバーを招待したりすることができます。

## プロビジョニングされたプロジェクトのソースコードへのアクセス

新しい Liferay Cloud プロジェクトは、 `dxpcloud` 組織にホストされる一時的な GitHub リポジトリがプロビジョニングされます。 このリポジトリには、Liferay Cloud 開発プロジェクトのテンプレートが含まれています。

新しいプロジェクトのリポジトリにアクセスするには、Liferay Cloud オンボーディングメールの指示に従って、その後の GitHub の招待を承諾します。

招待状を受け取ったら、プロビジョニングされたプロジェクトのリポジトリを探します。

1. GitHubへのログイン

1. `dxpcloud` を _Your teams_ の検索ボックスで検索します。

![図2：「Your teams」の検索ボックスでdxpcloudを検索します。](./initial-setup-overview/images/02.png)

プロビジョニングされたリポジトリを見つけたら、次のことをしなければなりません。

1. プロビジョニングされたリポジトリのコンテンツを、プライベートなGitリポジトリに転送する。

1. プライベートリポジトリとLiferay CloudのJenkins（CI）サービスをWebhookで連携させる。

詳しい手順は、 [GitHubリポジトリの設定](./configuring-your-github-repository.md) をご覧ください。

```{note}
他のホスティングサービスを利用していますか？ [Bitbucket](./configuring-your-bitbucket-repository.md) または [GitLab](./configuring-your-gitlab-repository.md) リポジトリを設定する方法をご覧ください。
```

## CIとLiferayのサービスにログインします。

Jenkins (CI)とLiferayにログインし、それぞれのWebインターフェースに直接アクセスします。

どちらのログイン資格も最初のオンボーディング メールで提供されていますが、 *環境変数* の下に、 *infra* 環境の *ci* サービス ページにも記載されています。

詳細な手順については、 [Liferay Cloud Services にログインする](./logging-into-your-liferay-cloud-services.md) を参照してください。

## セットアップの確認

Liferay Cloudでのデプロイを開始する前に、正しい環境とサービスが正常にプロビジョニングされデプロイされたことを確認します。

### 環境の検証

*Projects* の下のLiferay Cloud Console
[ホームページ](https://console.liferay.cloud/projects)に購入した環境が全て表示されていることを確認します。 

![図3：Liferay Cloud Consoleでプロビジョニングされた環境を確認する。](./initial-setup-overview/images/03.png)

すべての環境招待を受け入れた後に環境が見つからない場合は、Liferayサポートチームにお問い合わせください。

### 環境の場所を確認する

各環境のロケーションが、チームからリクエストされたロケーションと一致していることを確認します。

すべての環境ロケーションは、Liferay Cloud Console [ホームページ](https://console.liferay.cloud/projects)に記載されています。

また、環境の *［概要］* ページや *［設定］* ページに移動することで、環境の位置を確認することができます。

![図4：［Overview］ページで環境の位置を確認する。](./initial-setup-overview/images/04.png)

環境の場所があなたのチームが要求した場所と一致しない場合は、 [Liferayサポートチームに](https://help.liferay.com/hc/en-us/articles/360030208451-DXP-Cloud-Support-Overview)連絡してください。

### DXP Cloudスタックサービスの確認

Liferay Cloud スタックサービスが正しくデプロイされていることを確認します。

1. Liferay Cloud Console から *dev* 環境にアクセスします。

1. *Services* ページに移動します。

![図 5：Services ページで Liferay Cloud Stack サービスのステータスを確認します。](./initial-setup-overview/images/05.png)

適切にデプロイされると、5つのデフォルトクラウドスタックサービスのステータスがすべて 'Ready'になります。

## 追加情報

- [GitHubリポジトリの設定](./configuring-your-github-repository.md)
- [Liferayのクラウド環境について理解する](./understanding-liferay-cloud-environments.md)
- [Liferayクラウドサービスにログインする](./logging-into-your-liferay-cloud-services.md)
