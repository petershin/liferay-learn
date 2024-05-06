# 標準言語ファイルの上書き方法

Liferay DXP/Portalでは、言語ファイルを使用して、デフォルトロケールと他の多くのロケールの見出し、ラベル、およびメッセージを実装します。 モジュール内の新しい言語ファイル値を使用して、任意のロケールのこれらの翻訳をオーバーライドできます。

!!! note
   言語翻訳をオーバーライドするには、[Language Override tool](../../system-administration/configuring-liferay/changing-translations-with-language-override.md)を使用することをお勧めします。 このツールは、Liferay DXP 7.4 U4 (アップデート 4)以上、またはLiferay Portal 7.4 GA8以上で使用できます。 以前の方法を続けて読んでください。

## 標準言語ファイルの検証

標準言語ファイルは、ソースコードと[DXP/Portalバンドル](../../installation-and-upgrades/installing-liferay.md)に含まれています。

ソースの場合：

- [`liferay-[dxp|portal]/portal-impl/src/content/Language [_xx_XX].properties`](https://github.com/liferay/liferay-portal/tree/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-impl/src/content)
- [`liferay-[dxp|portal]/modules/apps/portal-language/portal-language-lang/src/main/resources/content/Language [_xx_XX].properties`](https://github.com/liferay/liferay-portal/tree/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-language/portal-language-lang/src/main/resources/content)

バンドルの場合：

- `portal-impl.jar#content/Language[_xx_XX].properties`
- `Liferay Foundation - Liferay Portal Language - Impl.lpkg` &rarr; `com.liferay.portal.language.lang-[version].jar#content/Language[_xx_XX].properties`

さまざまな言語とロケールの言語ファイルは、ファイル名の末尾で識別できます。 たとえば、`Language_ja.properties`は日本語用です。

これらの言語ファイルには、言語設定プロパティなど、オーバーライドできるプロパティが含まれています。

```properties
...
lang.user.name.field.names=prefix,first-name,middle-name,last-name,suffix
lang.user.name.prefix.values=Dr,Mr,Ms,Mrs
lang.user.name.required.field.names=last-name
lang.user.name.suffix.values=II,III,IV,Jr,Phd,Sr
...
```

メッセージやラベル用にオーバーライドできる単純な翻訳もたくさんあります。

```properties
category.admin=Admin
category.alfresco=Alfresco
category.christianity=Christianity
category.cms=Content Management
...
```

## プログラムによる言語ファイルのオーバーライド

Liferay DXP/Portal 7.4+では、メタデータを使用してオーバーライドを宣言できます。 以前のバージョンでは、Javaクラスがオーバーライドを宣言します。

お使いのバージョンが7.4より前の場合は、 [以前のバージョンでのオーバーライド](#overriding-in-earlier-versions) に進んでください。  それ以外の場合は、読み進めてください。

## サンプルをデプロイする（7.4以降の場合）

この例では、`home`言語ファイル設定を次のように変更します。

```{literalinclude} ./overriding-global-language-translations/resources/liferay-i2f4.zip/i2f4-impl/src/main/resources/content/Language_en_US.properties
   :language: properties
```

```{include} /_snippets/run-liferay-portal.md
```

次に、以下の手順でサンプルをデプロイします。

1. `liferay-i2f4.zip`サンプルプロジェクトをダウンロードして解凍する。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/liferay-internals/extending-liferay/liferay-i2f4.zip -O
   ```

   ```bash
   unzip liferay-i2f4.zip
   ```

1. プロジェクトモジュールをビルドしてデプロイします。

   ```bash
   cd liferay-i2f4
   ```

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   !!! note
      このコマンドは、デプロイされたjarをDockerコンテナの`/opt/liferay/osgi/modules`にコピーするのと同じです。

1. Liferay Dockerコンテナコンソールでデプロイを確認します。

   ```bash
   STARTED com.acme.i2f4.impl_1.0.0 [3209]
   ```

1. サンプルモジュールのカスタマイゼーションを確認します。 ブラウザで`https://localhost:8080`を開きます。

1. メニューアイコン（![Menu](../../images/icon-menu.png)）をクリックします。 ホームアイコンラベルには、カスタム言語ファイル値が使用されています。

   ![ホームアイコンには、カスタム言語ファイル値が使用されています。](./overriding-global-language-translations/images/04.png)

1. この例には、複数のロケールのカスタム言語ファイル値が含まれています。 たとえば、言語セレクターでブラジルのポルトガル語または日本語を選択すると、そのロケールでのカスタマイゼーションが表示されます。 モジュールは、これらのロケールの言語ファイルもオーバーライドします。

   ![カスタム言語ファイルは、ブラジルポルトガル語と日本語にも使用されます。](./overriding-global-language-translations/images/05.png)

例を見たところで、次にこれがどのように機能するかを確認していきます。

## 言語プロパティファイルを作成する

オーバーライドしたい翻訳ファイルを選択します。 サンプルモジュールは、`home`言語ファイルをオーバーライドします。

```{literalinclude} ./overriding-global-language-translations/resources/liferay-i2f4.zip/i2f4-impl/src/main/resources/content/Language_en_US.properties
   :language: properties
```

!!! important
   宣言する言語ファイルの値は、それらの既存の言語ファイルの値をオーバーライドします。 他のすべての既存の言語ファイル設定は保持されます。

オーバーライドする言語ファイルを決定したら、モジュールの`src/main/resources/content`フォルダに言語プロパティファイルを作成します。  ファイル名`Language.properties`を使用して、デフォルトのロケールの言語ファイルをオーバーライドします。 特定のロケールの言語ファイルをオーバーライドするには、言語プロパティのファイル命名規則を使用します。

```
Language[_xx_XX].properties
```

たとえば、日本語を上書きする場合は、`Language_ja.properties`を使用します。

## Bndファイルでオーバーライドを宣言する

モジュールの`bnd.bnd`ファイルで、言語リソースプロバイダーの機能を指定します。 サンプルの`Provide-Capability`ヘッダーは次のとおりです。

```{literalinclude} ./overriding-global-language-translations/resources/liferay-i2f4.zip/i2f4-impl/bnd.bnd
   :lines: 4-6
```

!!! note
   この例では、サービスのランキングを省略しており、OSGiのデフォルトのランキング `0`を使用しています。これは、デフォルトのグローバルリソースのバンドルサービスのランキング` -1`よりも高くなっています。

標準言語ファイルのオーバーライドは、同じモジュール内にあるほうが管理が簡単です。

複数のモジュールを使用して標準言語ファイルをオーバーライドすることはお勧めしませんが、複数のモジュールで同じ言語ファイルをオーバーライドすると、サービスランキングが最も高い言語リソースプロバイダーが優先されます。

たとえば、モジュールの言語ファイルがサービスランキング`1`のプロバイダーの言語ファイルよりも優先されるようにする場合は、ランキングを`2`以上に設定します。

```properties
Provide-Capability:\
    liferay.language.resources;\
        resource.bundle.base.name="content.Language";\
        service.ranking:Long="2"
```

モジュールをデプロイして、新しい言語ファイル値を確認します。

## 以前のバージョンでのオーバーライド

7.4より前のLiferay DXP/Portalバージョンでは、標準言語ファイルをオーバーライドするには、カスタマイズする翻訳ごとに [言語プロパティファイル](#create-a-language-properties-file) と`java.util.ResourceBundle`が必要です。 次の例をデプロイしてそのコードを調べることにより、詳細を確認してください。

!!! note
   言語ファイルの多くは標準言語ファイルにありますが、特定のアプリケーションモジュールにある場合もあります。 [overriding module language translation in earlier versions](./overriding-module-language-translations.md)のプロセスは、標準ファイルをオーバーライドするプロセスとは異なります。

### 以前のバージョンの例をデプロイする

この例では、`publish`言語ファイル設定を次のように変更します。

```{literalinclude} ./overriding-global-language-translations/resources/liferay-x8f3.zip/x8f3-impl/src/main/resources/content/Language_en_US.properties
   :language: properties
```

サンプルをデプロイする方法は次のとおりです。

1. `liferay-x8f3.zip` サンプルプロジェクトをダウンロードし、解凍します。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/liferay-internals/extending-liferay/liferay-x8f3.zip -O
   ```

   ```bash
   unzip liferay-x8f3.zip
   ```

1. プロジェクトモジュールをビルドしてデプロイします。

   ```bash
   cd liferay-x8f3
   ```

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

1. Liferay Dockerコンテナコンソールでデプロイを確認します。

   ```bash
   STARTED com.acme.x8f3.impl_1.0.0 [3209]
   ```

1. ブラウザで `https://localhost:8080` を開き、サインインする。

1. サイトページに移動し、編集アイコンをクリックします（![Edit](../../images/icon-edit.png)）。 公開ボタンに、カスタム言語ファイルが表示されます。

   ![公開ボタンには、カスタム言語ファイルが使用されています。](./overriding-global-language-translations/images/06.png)

1. 言語セレクターを使用してブラジルのポルトガル語または日本語を選択すると、カスタム言語ファイルが表示されます。 モジュールは、モジュールに含める各ロケールの言語ファイルをオーバーライドします。

   ![カスタム言語ファイルは、ブラジルポルトガル語と日本語にも使用されます。](./overriding-global-language-translations/images/07.png)

7.4以降の例と同様に、このモジュールは言語ファイルの変更値を指定します。 ただし、メタデータ（`bnd.bnd`ファイルヘッダー）を使用してオーバーライドを宣言する代わりに、モジュールは`ResourceBundle`クラスを使用します。

### リソースバンドルクラスを作成する

オーバーライドする各ロケールには、`java.util.ResourceBundle`を拡張するクラスが必要です。 `en_US`ロケールのリソースバンドルクラスの例を次に示します。

```{literalinclude} ./overriding-global-language-translations/resources/liferay-x8f3.zip/x8f3-impl/src/main/java/com/acme/x8f3/internal/language/X8F3EnglishResourceBundle.java
   :language: java
   :lines: 10-26
```

クラスの`_resourceBundle`フィールドには`ResourceBundle`が割り当てられます。 `ResourceBundle.getBundle`の呼び出しには、2つのパラメーターが必要です。  `content.Language_en_US`パラメーターは、モジュールの`src/main/resources/content`フォルダに対する言語ファイルの修飾名です。 2番目のパラメーターは、リソースバンドルの言語構文を設定する`control`です。 Liferayの構文と同じ言語構文を使用するには、Liferayの`com.liferay.portal.kernel.language.UTF8Control`クラスをインポートし、2番目のパラメーターを`UTF8Control.INSTANCE`に設定します。

クラスの`@Component`アノテーションは、それをOSGi `ResourceBundle` サービスコンポーネントとして宣言します。 その`language.id`プロパティは、`en_US`ロケール用にそれを指定します。

```{literalinclude} ./overriding-global-language-translations/resources/liferay-x8f3.zip/x8f3-impl/src/main/java/com/acme/x8f3/internal/language/X8F3EnglishResourceBundle.java
   :language: java
   :lines: 10
```

クラスは次のメソッドをオーバーライドします。

**`handleGetObject`：** モジュールのリソースバンドル（モジュールの言語プロパティファイルに基づく）で言語ファイルを検索し、キーの値を`Object`として返します。

**`getKeys`：** リソースバンドルのキーの`Enumeration`を返します。

リソースバンドルサービスコンポーネントは、デフォルトの言語ファイルをモジュールの言語ファイルオーバーライドにリダイレクトします。

複数のロケールの標準言語ファイルをオーバーライドするには、ロケールごとに個別のリソースバンドルクラスが必要です。 たとえば、チュートリアルコードには、ブラジルのポルトガル語、英語、および日本語用のクラスがあります。 各リソースバンドルは、`language.id`コンポーネントのプロパティ定義と言語ファイルの修飾名パラメーターでロケールを指定する必要があります。  たとえば、日本語ロケールでは次のようになります。

コンポーネント定義：

```{literalinclude} ./overriding-global-language-translations/resources/liferay-x8f3.zip/x8f3-impl/src/main/java/com/acme/x8f3/internal/language/X8F3JapaneseResourceBundle.java
   :language: java
   :lines: 10
```

リソースバンドルの割り当て：

```{literalinclude} ./overriding-global-language-translations/resources/liferay-x8f3.zip/x8f3-impl/src/main/java/com/acme/x8f3/internal/language/X8F3JapaneseResourceBundle.java
   :dedent: 1
   :language: java
   :lines: 23-24
```

モジュールをデプロイして、新しい言語ファイル値を確認します。

!!! note
   DXP 7.4以降にアップグレードする準備ができたら、言語ファイルオーバーライドモジュールを引き続き使用できます。 オプションとして、 [above](#declare-the-override-in-the-bnd-file) で示すように、`ResourceBundle` クラスを削除し、`Provide-Capability` ヘッダーを `bnd.bnd` ファイルで指定することで、モジュールを簡素化することができます。

## 関連情報

- [以前のバージョンでのモジュール言語ファイルのオーバーライドをする](./overriding-module-language-translations.md)
- [翻訳ファイルの変更](../../system-administration/configuring-liferay/changing-translations-with-language-override.md)