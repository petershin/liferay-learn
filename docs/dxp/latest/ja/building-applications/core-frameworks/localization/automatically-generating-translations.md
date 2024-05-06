# 翻訳を自動的に生成する

Liferay DXPは、標準で50の言語をサポートしています。 各ロケールには、その言語のキーを含む [言語プロパティファイル](https://github.com/liferay/liferay-portal/tree/master/modules/apps/portal-language/portal-language-lang/src/main/resources/content) があります。

カスタム言語キーを使用してアプリケーションを作成する場合、これらすべての異なる言語に翻訳するのは面倒で困難です。 幸い、LiferayのLanguage Builderツールを使用して、翻訳を自動的に生成できます。 Language Builderは、MicrosoftのTranslator APIを使用して翻訳を生成します。

```{note}
機械翻訳の精度と正確性は、言語ごとに異なります。 これらの生成された翻訳をどのように利用するかは各自の判断となります。
```

## サンプルプロジェクトを参照する

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順を実行します。

1. [自動生成翻訳](./liferay-m7d6.zip) をダウンロードして解凍します。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/core-frameworks/localization/liferay-m7d6.zip -O
   ```

   ```bash
   unzip liferay-m7d6.zip
   ```

1. モジュールのルートフォルダにある`gradle.properties`ファイルを開きます。 Microsoft Translator購読キーを追加します。

   ```properties
   microsoft.translator.subscription.key={your unique key}
   ```

   Language Builderが機能するためには、独自の [Microsoft Translator購読キー](https://www.microsoft.com/en-us/translator/business/translator-api/) を取得する必要があります。

1. モジュールルートから、Language Builderを実行します。

   ```bash
   ./gradlew buildLang
   ```

   ターミナルウィンドウで、Language Builderはさまざまな言語プロパティファイルを生成します。 `「Translation is disabled because credentials are not specified」`というエラーが表示された場合は、購読キーが正しいことを再確認してください。

1. モジュールの`src/main/resources/content`フォルダに移動して、翻訳されたプロパティファイルを表示します。

  ![プロパティファイルは、src/main/resources/contentフォルダにあります。](./automatically-generating-translations/images/01.png)

## 言語キーの追加

サンプルプロジェクトでは、`Language.properties`ファイルに1つの言語キーがあります。  アプリケーションに必要な数の言語キーを追加してから、Language Builderを実行します。

言語キーをLiferayにデプロイするには、[グローバル言語キーのオーバーライド](../../../liferay-internals/extending-liferay/overriding-global-language-translations-with-language-properties.md)を参照してください。 既存のキーをオーバーライドする場合でも、新しいキーを追加する場合でも、手順は同じです。

一部の言語を自動的に翻訳されないようにする場合は、プロジェクトの`build.gradle`ファイルで`excludedLanguageIds`プロパティを使用します。  たとえば、フランス語を含める場合は以下のようにします。

```properties
buildLang {
    excludedLanguageIds = ["fa"]
}
```

Language Builderツールと追加の構成の詳細については、 [Lang Builder Gradle Plugin](https://github.com/liferay/liferay-portal/tree/master/modules/sdk/gradle-plugins-lang-builder) を参照してください。
