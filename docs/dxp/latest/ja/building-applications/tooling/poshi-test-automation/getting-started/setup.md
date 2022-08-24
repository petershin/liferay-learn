# 設定

## 前提条件

1. Java JDK 8

1. Google Chrome

1. [Gradle](https://gradle.org/install/) もしくは [Gradle Wrapper](https://docs.gradle.org/current/userguide/gradle_wrapper.html#sec:adding_wrapper) 6.6.1またはそれ以上。

## Poshi StandaloneのGradleプロジェクトをセットアップします。

1. 新しいディレクトリを作成します（例： `poshi-standalone`）。

1. 新しく作成したディレクトリにGradle wrapper（6.6.1以降）をセットアップします。
    ```
    $ gradle wrapper
    ```

    これで、ディレクトリには以下のものが含まれるはずです。
    ```
    poshi-standalone
    ├── .gradle
    ├── gradle   
    |   └── wrapper
    |       ├──  gradle-wrapper.jar
    |       └──  gradle-wrapper.properties
    ├── gradlew
    └── gradlew.bat
    ```

1. Poshi Standaloneのビルドファイルを取得するには、ターミナル／コマンドラインウィンドウで、任意のディレクトリから以下のコマンドを実行してください。

    ```
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/liferay/liferay-portal/master/modules/test/poshi/poshi-standalone/setup.sh)"
    ```

    初期のGradleファイルに加えて、ディレクトリには次のファイルがあるはずです。 `build.gradle`, `settings.gradle`、`poshi.properties`、および`poshi-ext.properties`

1. ルートディレクトリに、新しいフォルダ `poshi-tests`を作成します。 テストに必要なファイルが格納されます。

1. `poshi-tests` ディレクトリに移動し、パス、マクロ、テストケースの3つのフォルダを追加作成します。

    これで、ディレクトリには以下のものが含まれるはずです。

    ```
    poshi-standalone
    ├── .gradle
    ├── gradle   
    ├── gradle   
    |   └── wrapper
    |       ├──  gradle-wrapper.jar
    |       └──  gradle-wrapper.properties
    ├── poshi-tests
    |   ├── macros
    |   ├── paths
    |   └── testcases
    ├── build.gradle
    ├── gradlew
    ├── gradlew.bat
    ├── poshi.properties
    ├── poshi-ext.properties
    └── settings.gradle
    ```

この設定で、 `./gradlew task` (`gradlew.bat task` for Windows) を実行すると、プロジェクトで利用可能なタスクが表示されるようになっています。 Poshi StandaloneのGradle 設定については、Liferayのgithubリポジトリにある [Poshi Standalone](https://github.com/liferay/liferay-portal/tree/master/modules/test/poshi/poshi-standalone) を参照してください。

## Poshi Standaloneの更新

Poshi Standaloneは常に最新のリリースバージョンを実行するため、gradleプロジェクトを更新するための余分な手順は必要ありません。 ダウングレードが必要な場合は、 `build.gradle` ファイルの最後に以下の行を追加し、バージョン番号を [Poshi Runner Changelog](https://github.com/liferay/liferay-portal/blob/master/modules/test/poshi/CHANGELOG.markdown) にある希望のバージョンに置き換えてください。

```
poshiRunner {
    version = "1.0.xxx"
}
```