# Dockerイメージから始める

Liferayの最新バージョンはDocker HubでDockerイメージとして入手可能です。 それらは2つのカテゴリーに分類されます。

* [Liferay/Portal](https://hub.docker.com/r/liferay/portal) 
* [Liferay/DXP](https://hub.docker.com/r/liferay/dxp) 

以下の手順に従って、Liferayの最新リリースをダウンロード、起動し、ツアーを開始してください。

```{important}
Dockerをお持ちでない場合、 まずはこちらへ： [Linux](https://docs.docker.com/install/linux/docker-ce/ubuntu/) | [Windows](https://docs.docker.com/docker-for-windows/install/) | [OSX](https://docs.docker.com/docker-for-mac/install/) 
```
## Liferay Portalを始める

Liferay Portalは、説得力のある柔軟なWebエクスペリエンスを構築するための、オープンソースでコミュニティがサポートするプラットフォームです。

1. を実行して、新しい Liferay Portal インスタンスを起動します。

   ```bash
   docker run -it -m 8g -p 8080:8080 [$LIFERAY_LEARN_PORTAL_DOCKER_IMAGE$]
   ```

    ```{tip}
    起動完了を示す`org.apache.catalina.startup.Catalina.start Server startup in [x] milliseconds`が表示されるまで待つ。
    ```
1. **test@liferay.com** というメールアドレスと **test** というパスワードを使って `<http://localhost:8080>` から Liferay にサインインしてください。

1. プロンプトが表示されたら、パスワードを変更し（**learn** など）、 **Save** をクリックします。

   ![Change your password upon first login.](./starting-with-a-docker-image/images/01.png)

```{warning}
本番環境では、デフォルトの管理者アカウントを使うべきではありません。代わりに、あなたのビジネスに特化した [adminアカウントを作成する](./introduction-to-the-admin-account.md#creating-a-new-admin-user) 。
```
## Liferay DXPを使ってみる

Liferay DXPは、世界中で使用されている商用サポート済みのエンタープライズ対応プラットフォームであり、Liferay Portalの基盤の上に構築されています。 Dockerイメージから始めるのは簡単で、トライアルライセンスが含まれています。

1. 新しいLiferay DXPインスタンスを起動し、以下を実行します。

   ```bash
   docker run -it -m 8g -p 8080:8080 [$LIFERAY_LEARN_DXP_DOCKER_IMAGE$]
   ```

1. **test@liferay.com** というメールアドレスと **test** というパスワードを使って `<http://localhost:8080>` から Liferay にサインインしてください。

1. プロンプトが表示されたら、パスワードを変更し（**learn** など）、 **Save** をクリックします。

   ![Change your password upon first login.](./starting-with-a-docker-image/images/01.png)

```{warning}
本番環境では、デフォルトの管理者アカウントを使うべきではありません。代わりに、あなたのビジネスに特化した [adminアカウントを作成する](./introduction-to-the-admin-account.md#creating-a-new-admin-user) 。
```
## 次のステップ

引き続きスタートガイドを進め、 [管理者アカウント](./introduction-to-the-admin-account.md) を使用して初めてログインする方法を学習します。

状況をチェックする以上のことをしますか？ 詳細は、 [Installing a Liferay DXP Tomcat Bundle](../installation-and-upgrades/installing-liferay/installing-a-liferay-tomcat-bundle.md) を参照してください。

[Dockerイメージの使用](../installation-and-upgrades/installing-liferay/using-liferay-docker-images.md) に関する詳細をご覧ください。
