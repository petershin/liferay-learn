# Liferay Workspaceの設定

```{warning}
Liferay Workspaceは使い方が簡単で、[最初から](./what-is-liferay-workspace.md)始めることで、基本を学ぶことができます。 もしあなたが喜んで [プロジェクトの作成](./creating-code-with-liferay-workspace.md) や [コードのデプロイ](./creating-code-with-liferay-workspace.md #deploying-code-via-liferay-workspace) 、あるいは [Docker コンテナを使用](./configuring-a-liferay-docker-container.md)しているなら、ここの情報は必要ないかもしれません。 ただし、もっと掘り下げて、ワークスペースで実行できるすべてのことについて学びたい場合は、このサイトが有益となるでしょう。 
```

取り上げるトピックは次のとおりです。

- Liferay Workspaceとバンドルされたプラグインの更新
- 開発、UAT、および本番環境の使用
- ターゲットプラットフォームの管理

## Liferay Workspaceとバンドルされたプラグインの更新

Liferay Workspaceは、開発者の生産性を高めるために常に更新されており、ワークスペースを最新の状態にするのは簡単なプロセスです。

1. Liferayのリポジトリにある[ワークスペースのリリースに移動](https://repository-cdn.liferay.com/nexus/content/repositories/liferay-public-releases/com/liferay/com.liferay.gradle.plugins.workspace)します。 バージョンがリストに表示されます。必要なバージョン番号をメモしてください。
1. ワークスペースのルートフォルダにある`settings.gradle`ファイルを開きます。
1. `依存関係`ブロックで、リポジトリで見つけたバージョンでバージョンを更新します。 最新のリリースを維持したい場合は、バージョン番号の代わりにテキスト`latest.release`を指定してください。

   ```groovy
    dependencies {
        classpath group: "com.liferay", name: "com.liferay.gradle.plugins.workspace", version: "[WORKSPACE_VERSION]"
    }
    ```

1. ファイルを保存して閉じます。 アップグレードを実行するには、`tasks`のような任意のGradleコマンドを実行します。

   ```bash
   ./gradlew tasks
   ```

　 これで、ワークスペースがアップグレードされました。

## Liferayバージョンの更新

ワークスペースがコンパイルするLiferayのバージョンを更新することをお勧めします。 これは、単一のプロパティによって処理されます。

```properties
liferay.workspace.product=[$LIFERAY_LEARN_PORTAL_WORKSPACE$]
```

プロパティの値を、コードを開発しているLiferayのバージョンに更新します。 その後、ワークスペースの依存関係が自動的に新しいバージョンに更新されます。

## JDK11の使用

```{note}
JDK 11でコンパイルする場合は、JDK11で実行する必要があります。 ワークスペースに変更を加える前に、アプリサーバーでJDK11が実行されていることを確認してください。 LiferayのDockerイメージはデフォルトでJDK8を使用することに注意してください。 これをオーバーライドするには、`-e JAVA_VERSION=zulu11`環境変数を使用してDockerイメージを作成します。
```

**前提条件：** 古いバージョンのワークスペースを使用している場合は、次の2つをアップグレードする必要があります。

1. Gradleをバージョン6.6.1以上に更新します
1. ワークスペースのバージョンを3.4.2以上に更新します（アップグレード手順については上記を参照）。

Gradleをアップグレードするには、ワークスペースの`gradle/wrapper/gradle-wrapper.properties`ファイルを編集します。

```properties
distributionUrl=https\://services.gradle.org/distributions/gradle-6.6.1-all.zip
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
zipStorePath=wrapper/dists
zipStoreBase=GRADLE_USER_HOME
```

ワークスペースもアップグレードした場合は、`liferay.workspace.product` プロパティが設定されていることを確認してください。 `blade init -l`と入力すると、Blade CLIを使用してこのプロパティの現在のリストをいつでも取得できることを忘れないでください。

古いワークスペースをアップグレードした場合は、Liferay CDNがワークスペースの`settings.gradle`ファイルで宣言されていることを確認してください。

```groovy
maven {
    url "http://repository.liferay.com/nexus/content/groups/public"
}
```
これで、LiferayプロジェクトでJDK11を使用する準備が整いました。 既存のプロジェクトがある場合は、追加で必要な手順があります。

### サービスビルダープロジェクト

古いワークスペースをサービスビルダープロジェクトでアップグレードした場合は、この構成をサービスビルダーの`-service`モジュールの`build.gradle`ファイルに追加します。

```groovy
tasks.withType(JavaCompile) {

    // Generated classes using Jodd library are unable to be read when compiled against JDK 11

    sourceCompatibility = JavaVersion.VERSION_1_8
    targetCompatibility = JavaVersion.VERSION_1_8
}
```
### JAX-WSプロジェクト

JAX-WSプロジェクトがある場合は、JDK 11から削除された`javax.xml.soap`のクラスが必要です。 次に、それらを依存関係として手動で指定する必要があります。


```groovy
compile 'com.sun.xml.ws:jaxws-ri:2.3.2'
```

## ターゲットプラットフォームの管理

通常、Gradleの依存関係を定義するときは、次のようにそれらの依存関係のバージョンを提供する必要があります。

```groovy
dependencies {
   compileOnly group: "javax.portlet", name: "portlet-api", version: "3.0.1"
   compileOnly group: "javax.servlet", name: "javax.servlet-api", version: "4.0.1"
}
```

Liferayのプラットフォームで作成されたアプリケーションはそのプラットフォームを対象としているため、Liferayでは、Liferayのバージョンを宣言し、Liferayから他の依存関係を継承することで、すべての依存関係を1回で簡単に指定できます。 そうすれば、上記のような混乱はありません。

ターゲットプラットフォームはデフォルトで有効になっています。使用するために特別なことをする必要はありません。 現在、ほとんどの依存関係は次のようになっています。

```groovy
dependencies {
    compileOnly group: "com.liferay.portal", name: "release.portal.api"
}
```

これにより、Liferayに付属するすべての依存関係がもたらされます。 何らかの理由で特定の依存関係を指定する必要がある場合でも、次の事ができます。

```groovy
dependencies {
        compileOnly group: "com.liferay.portal", name: "release.portal.api"
        cssBuilder group: "com.liferay", name: "com.liferay.css.builder", version: "3.0.2"
}
```
