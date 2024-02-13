---
toc:
  - ./building-a-custom-ticketing-system/defining-a-custom-data-schema.md
  - ./building-a-custom-ticketing-system/applying-a-custom-theme.md
  - ./building-a-custom-ticketing-system/deploying-a-custom-application.md
  - ./building-a-custom-ticketing-system/implementing-a-documentation-referral-system.md
  - ./building-a-custom-ticketing-system/ticket-management-with-cron-jobs.md
---
# カスタム発券システムの構築

Liferayは、デジタルソリューションの構築を容易にします。 例えば、あなたのビジネスに必要なスタイルや機能を備えたカスタムチケットアプリケーションを作成することができます。

![See the custom ticketing system sample.](./building-a-custom-ticketing-system/images/01.png)

ここでは、カスタム発券システムの仕組みについて学びます。 以下のことを学ぶ。

* カスタム・データ・スキーマの定義
* カスタムCSSテーマを適用する
* カスタムアプリケーションのデプロイ
* 文書紹介システムの導入

これらの各コンポーネントは、 [クライアントエクステンション](../../building-applications/client-extensions.md) を使用することで配備可能である。 各クライアント拡張機能の設定は、 [`client-extension.yaml`](../../building-applications/client-extensions/working-with-client-extensions.md#configuring-client-extensions) ファイルによって定義される。

## 前提条件

開始する前に、適切なファイルをダウンロードし、システムをセットアップしてください。

1. サンプル・ワークスペースをダウンロードするには、次のコマンドを実行する：

   ```bash
   curl -o com.liferay.ticket.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.ticket.workspace\&\v\=LATEST\&p\=zip
   ```

1. コマンドラインで `liferay-ticket-workspace` フォルダに移動します。

   ```bash
   cd liferay-ticket-workspace
   ```

1. ローカルの Liferay バンドルを生成します。

   ```bash
   ./gradlew initBundle
   ```

1. Liferay バンドルを実行します。

   ```bash
   ./bundles/tomcat-9.0.73/bin/catalina.sh run
   ```

1. メールアドレス **test@liferay.com** とパスワード **test** を使って http://localhost:8080 から Liferay にサインインします。 プロンプトが表示されたら、パスワードを **learn** に変更する。

1. すべてのサンプルプロジェクトをビルドします。

   ```bash
   ./gradlew build
   ```

最初のステップでは、カスタム・データ・スキーマを定義する。

[行こう！](./building-a-custom-ticketing-system/defining-a-custom-data-schema.md) 
