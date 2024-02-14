# CLIツールの使用

Delectable Bonsai サイトが Liferay Experience Cloud 上で稼働している今、Kyle は開発チームが作成した [クライアント拡張](https://learn.liferay.com/w/dxp/building-applications/client-extensions) のデプロイを開始する準備ができています。 始めるには、 [コマンドラインツール](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool) をインストールする必要がある。

ここではCLIツールをインストールし、それを使ってクラウドコンソールにログインする。

## CLIツールのインストール

このコマンドでコマンドラインからツールをインストールする：

```bash
curl https://cdn.liferay.cloud/lcp/stable/latest/install.sh -fsSL | sudo bash
```

```{note}
Windows環境の場合は、代わりに [Windowsインストーラー](https://cdn.liferay.cloud/lcp/stable/latest/lcp-install.exe) をダウンロードして実行することができます。
```

これが完了すると、 `lcp` コマンドでツールを使えるようになる。

## ツールを使ってログインする

クライアント拡張プロジェクトをデプロイするには、CLIツールからログインする必要があります。

`lcp login` コマンドを実行してログインし、ブラウザを開くように促されたら `y` と入力する。

![CLIツールは、ブラウザ経由でログインするよう促します。](./using-the-cli-tool/images/01.png)

ブラウザのタブが自動的に開き、 `https://console.liferay.cloud/login`。 コンソール・セッションの有効期限が切れている場合は、CLIツールの認証に使用した認証情報で再度ログインしてください。

![一度ログインすると、CLIツールはコンソールであなたの環境にアクセスする権限が与えられます。](./using-the-cli-tool/images/02.png)

このツールは、クライアントの拡張機能を含むプロジェクトをデプロイするために、あなたの環境に接続することができます。

クラウドインスタンスのセットアップに関するこのモジュールは完了しました。

次： [コードをLXCインスタンスにデプロイする方法を学ぶ](../deploying-code-to-liferay-saas.md).

## 関連コンセプト

* [コマンドラインツール](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool)
