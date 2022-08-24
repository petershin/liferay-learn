# 設定

テスト作成者がよく使う関数やパス、マクロに簡単にアクセスできるようにするため、既存のPoshiファイルを依存関係として保存するPoshiリソースを作成しました。 これらのリソースは、Poshi Runner Resources Gradle Pluginを通じてGradleの依存関係としてPoshiプロジェクトにロードすることができ、ファイルシステム上のローカルなPoshiファイルとは別に使用することができます。

デフォルトでは、Poshi単体またはLiferay Gradle Plugins Defaultsプラグインを使用するPoshiプロジェクトは、自動的にデフォルトのPoshiリソースjar、 `com.liferay:com.liferay.poshi.runner.resources:latest.version`にアクセスすることになります。 この公開された`com.liferay:com.liferay.poshi.runner.resources` jarには [Liferay poshi-runner-resourcesディレクトリ](https://github.com/liferay/liferay-portal/tree/master/modules/test/poshi/poshi-runner-resources/src/main/resources/default) のPoshiファイルが含まれており、標準のMavenリポジトリである [Maven Central](https://search.maven.org/artifact/com.liferay/com.liferay.poshi.runner.resources) と [Liferay Nexus](https://repository.liferay.com/nexus/#nexus-search;gav~com.liferay~com.liferay.poshi.runner.resources) から入手可能です。

jarファイルを使用するには、Poshiプロジェクトのbuild.gradleファイルに以下を追加します。変数 `GROUP`、`NAME`、`VERSION`は、 [Maven依存関係](https://search.maven.org/artifact/com.liferay/com.liferay.poshi.runner.resources) のプラグインを参照しています。

```
dependencies {
    poshiRunnerResources group: "GROUP", name: "NAME", version: "VERSION"
}
```

デフォルトのPoshiリソースjarファイルを使用するには、 `GROUP`、`NAME`、`VERSION`を以下の情報に置き換えてください。

```
dependencies {
    poshiRunnerResources group: "com.liferay", name: "com.liferay.poshi.runner.resources", version: "latest.release"
}
```

特定のバージョンのPoshiリソースjarを使用するには、 `GROUP`、`NAME`、`VERSION`を下記のように置き換えます。

```
dependencies {
poshiRunnerResources group: "com.liferay.poshi.runner.resources", name: "portal-master", version: "20220413-38b5985"
}
```

Poshiリソースの設定の詳細については、 [Poshi Runner Resources Gradle Plugin](https://github.com/liferay/liferay-portal/blob/master/modules/sdk/gradle-plugins-poshi-runner/README.markdown#poshi-runner-resources-gradle-plugin) を参照してください。
