# Liferay サービスのシェルを使う

何が起きているのかを確認するために、システムに直接アクセスする必要がある場合もある。 KyleはLiferayサービスのシェルを使ってディレクトリ構造を表示し、データベースの作成を確認しようとしています。

ここでは、シェルを使ってコンソールからLiferayインスタンスのデータベースに直接問い合わせます。

## シェルへのアクセス

サービスのページから Liferay サービスのシェルにアクセスします。

1. Liferay Cloud コンソールで、UAT 環境に移動します。

1. 画面左側の **Services** をクリックする。

1. **Liferay** サービスをクリックします。

1. ［**Shell**］ タブをクリックします。

1. シェルに `ls` と入力すると Liferay Home ディレクトリの内容が表示されます。

    ![Liferay Homeディレクトリにあるような、シェル経由でサービス内のファイルを直接読んだり変更したりできます。](./using-the-liferay-services-shell/images/01.png)

```{note}
シェルを通してLiferayインスタンスに加えた変更は永久的なものではありません。 それらは、次にサービスが再起動したときに上書きされる。
```

## MySQLクライアントの使用

次に、MySQL クライアントを使用して Liferay インスタンスのデータベースを表示します。

1. シェルに `mysql` と入力して、デフォルト・ユーザーでMySQLクライアントにログインする。

    ```{note}
    デフォルトのデータベース・ユーザーでログインすると、データベースへの読み取り専用アクセス権が与えられます。 データを操作する必要がある場合は、 [MySQLクライアントの使用](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-mysql-client#logging-in-with-read-and-write-privileges) ログインする。
    ```

1. `show tables;` と入力すると、既存の全テーブルのリストが表示され、スクロールできる。

    ![Liferayデータベースのすべてのテーブルを見るにはshow tables MySQLコマンドを使います。](./using-the-liferay-services-shell/images/02.png)

1. 別のクエリを実行して、全サイトの [カテゴリとタグを使用したコンテンツの整理](https://learn.liferay.com/w/dxp/content-authoring-and-management/tags-and-categories/organizing-content-with-categories-and-tags) のリストを確認してください：

    ```sql
    select vocabularyId, name, groupId from AssetVocabulary;
    ```

    ![デフォルトユーザを使用すると、すべての語彙を表示するなど、読み取り専用の MySQL クエリを実行できます。](./using-the-liferay-services-shell/images/03.png)

1. 最後に、MySQL クライアントからログアウトします：

    ```sql
    quit
    ```

　 Liferayクラウド管理者コースを修了しました。

[コースに戻る](../../index.md)

## 関連概念

* [シェルアクセス](https://learn.liferay.com/web/guest/w/liferay-cloud/troubleshooting/shell-access)
* [MySQLクライアントの使用](https://learn.liferay.com/web/guest/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-mysql-client)
