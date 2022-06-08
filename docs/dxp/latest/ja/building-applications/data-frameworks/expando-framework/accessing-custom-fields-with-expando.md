# Expandosでカスタムフィールドにアクセスする

アプリケーションに追加のフィールドが必要な場合は、いつでも[サービスモデル定義](../service-builder/service-builder-basics/generating-model-persistence-and-service-code.html#examine-the-service-model-definition)に追加して、サービスビルダーを再実行することができます。 これにより、データベースのテーブルに新しいカラムが追加されます。 これは機能しますが、面倒です。ユーザーを新しいスキーマに移行するためのアップグレードプロセスを書かなければならなくなります。 しかし、LiferayのExpando機能を使えば、データベースを修正することなく、フィールドを追加することができます。 Expandosは、Javaでオブジェクトに追加のプロパティを追加することで機能します。 サンプルプロジェクトでは、ユーザーがカスタムフィールドにアクセスするデモを行っています。

## サンプルプロジェクトを参照する

1. Liferay DXPを起動します。 まだDockerコンテナがない場合は、以下を使用します。

   ```bash
   docker run -it -m 8g -p 8080:8080 [$LIFERAY_LEARN_DXP_DOCKER_IMAGE$]
   ```

   別のLiferay PortalバージョンまたはLiferay DXPを実行している場合は、上記のコマンドを適宜調整してください。

1. *［コントロールパネル］* &rarr; *［ユーザーと組織］*へ移動します。 管理者ユーザーのオプションアイコン（![Options icon](../../../images/icon-actions.png)）をクリックし、 *［編集］*をクリックします。 ［一般］タブで［カスタムフィールド］までスクロールします。 *[Add]*ボタンをクリックします。

1. 項目タイプとして、*［Input Field］*を選択します。 項目名として `［f5a3Text］` を入力します。 `［test］`のように、［starting value］を入力します。 *［Save］* をクリックします。

   ![ユーザーに［f5a3Text］というカスタムフィールドを作成します。](./accessing-custom-fields-with-expando/images/01.png)

1. Accessing Expando/0>をダウンロードして解凍します。 
   
   

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/building-applications/data-frameworks/expando-framework/liferay-f5a3.zip -O
   ```
</p></li> </ol> 



   ```bash
   unzip liferay-f5a3.zip
   ```


1. モジュールのルートから、ビルドおよびデプロイします。 
   

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```




   ```{note}
   このコマンドは、デプロイされたjarをDockerコンテナの/opt/liferay/osgi/modulesにコピーするのと同じです。
   ```


1. Liferay Dockerコンテナコンソールでデプロイを確認します。 
   
   

   ```bash
   STARTED com.acme.f5a3.web_1.0.0 [1034]
   ```


1. サンプルのモジュールが機能していることを確認します。 ブラウザで`https://localhost:8080`を開きます。

1. ［サイトページ］に移動し、編集アイコンをクリックします（![Edit icon](../../../images/icon-edit.png)）。 F5A3ポートレットをページに追加します。 ウィジェットは、サンプルウィジェットの下にあります。
   
   ![F5A3ポートレットを［サイトページ］に追加します。](./accessing-custom-fields-with-expando/images/02.png)
   
   ポートレットには、先ほど作成したユーザーのカスタムフィールドが表示されます。



## ポートレットを調べる

サンプルプロジェクトでは、シンプルなMVCポートレットを使用して、カスタムフィールドを表示するJSPファイルをレンダリングしています。 ポートレットには、デフォルトのJSPファイルを表示するだけなので、コードはありません。 

詳しくは、 [MVCの使用](../../developing-a-java-web-application/using-mvc.md)をご覧ください。



## JSPファイルを調べる

`<liferay-theme:defineObjects>`タグは、Liferay`User`オブジェクトにアクセスするためにJSPに含まれています。 多くのLiferayオブジェクトと同様に、`User`オブジェクトは`ExpandoBridge`サービスを継承しており、カスタムフィールドの値を作成(つまり`addAttribute()`)、設定(つまり`setAttribute()`)、取得(つまり`getAttribute()`)する方法が含まれています。 すべてのインターフェースのメソッドを見るには、[ExpandoBridge javadocs](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/expando/kernel/model/ExpandoBridge.html)をご覧ください。 



```{literalinclude} ./accessing-custom-fields-with-expando/resources/liferay-f5a3.zip/f5a3-web/src/main/resources/META-INF/resources/view.jsp
:language: jsp
```


サンプルプロジェクトでは、ユーザーの`f5a3Text`カスタムフィールドに関連する値を取得する簡単な例を示しています。 アプリケーションでは、カスタムフィールドを作成、設定、取得するための独自のコードを記述してください。
