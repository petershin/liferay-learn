# 構成ファイルの使用

[システム設定](../system-settings.md) は、システムスコープの構成変更を行い、他の [スコープ](../understanding-configuration-scope.md)のデフォルト構成を設定するためのユーザーインターフェイスを提供します。 UIの同じ構成は、構成ファイルを介して行うことができます。

バージョンが同一であれば、構成ファイルを使用して、構成を実動前のシステムから実動システムに、または他のLiferay DXPシステム間で転送できます。

構成ファイルは、 [Apache Felix構成管理フレームワーク](http://felix.apache.org/documentation/subprojects/apache-felix-config-admin.html) によって定義された `.config` プロパティ値の形式を使用します。

```{note}
`.cfg`ファイルフォーマットはOSGi環境では一般的で、サポートされているフォーマットですが、プロパティ値の型を指定したり、複数の値を持つプロパティを許容したりできるため、 `.config`ファイルが好まれます。 このため、ベストプラクティスとして `.config` ファイルが使用・推奨・文書化されています。
```

## 構成ファイルの作成

システム設定には、設定エントリーを変更すると使用可能になる [**エクスポート**](../system-settings.md#exporting-and-deploying-configurations) オプションが用意されています。 エクスポートは、 `.config` ファイルを作成する最良の方法です。エントリの設定を含む `.config` ファイルを `key = value` 形式でダウンロードし、必要に応じて変更または配布します。 変更された値が1つだけであっても、使用可能なすべての構成キーと値がエクスポートされます。

単一の構成エントリまたは変更された構成のセット全体をエクスポートできます。

構成ファイルは、バッキングJavaクラスにちなんで名付けられます。 たとえば、Webコンテンツ機能をサポートするジャーナルサービスエントリには、次のファイル名があります。

```bash
com.liferay.journal.configuration.JournalServiceConfiguration.config
```

![Webコンテンツのシステム設定エントリには、バックエンドID com.liferay.journal.configuration.JournalServiceConfigurationがあります。](./using-configuration-files/images/01.png)

システムは構成ファイルの名前を強制します。 名前を編集すると、構成エントリへのリンクが壊れ、それ以上のカスタマイズは有効になりません。 唯一の例外は [ファクトリ構成](./using-factory-configuration.md)で、一意のサブネームを提供できる場合があります。

### パスワードエクスポートの有効化

デフォルトでは、設定ファイルをエクスポートする際にパスワードは除外されます（Elasticsearchのパスワード、Salesforceのパスワードなど）。 エクスポートに含めるには、 `portal-ext.properties` ファイルに以下のプロパティを追加してください。

```properties
module.framework.export.password.attributes=true
```

Liferayインスタンスを再起動することで、変更が反映されます。

## キー/値の構文

`.config` ファイルのすべてのキーと値の構文は同じです。

```properties
configurationName="value"
```

特殊文字を含まない単一値構成の場合、知っておくべきことはこれだけです。 複数の値と特定の文字の設定は少し異なります。

### 複数値の設定

構成エントリには、複数の値を受け入れるプロパティを含めることができます。 たとえば、サポートされているファイル拡張子を指定する構成プロパティには、複数の値が必要です。 `.config` ファイルに複数値設定を書き込む方法は次のとおりです。

```properties
multiValueSetting=["Value 1","Value 2", ...]
```

値の間に（コンマの後の）スペース文字を使用すると、プロパティーは無視されます。

［コンテンツ］セクションの［System Settings］で［Web Content］カテゴリを開き、仮想インスタンススコープとして［**Web Content**］ を選択します。 **Characters Blacklist** の複数の単一値エントリが表示されます。

![Webコンテンツシステム設定エントリには、多くのブラックリストに追加された文字フィールドがあります。](./using-configuration-files/images/02.png)

構成ファイルでは、これはカンマ区切り値の配列を持つ単一のキーで表されます。

```properties
charactersblacklist=["&","'","@","\\","]","}",":","\=",">","/","<","[","{","%","+","#","`","?","\"",";","*","~"]
```

### エスケープ文字

二重引用符（`"`）と等号（`=`）は、 `.config` ファイルで **エスケープ** する必要があります。  エスケープとは、別の文字を使用して、文字を通常の方法で使用してはならないことを示します。 二重引用符と等号はすでに `.config` ファイルで使用されているため、エスケープすると、システムは通常の方法では読み取らず、値の一部として渡すようにシステムに指示します。 `.config` ファイルの文字をエスケープするには、円記号を使用します。

```properties
charactersblacklist=["&","\"","\="]
```

この設定は、通常のエスケープされていない文字（`&`）と2つのエスケープされた文字（`\ "` および `\ =`）を持つ複数値設定を示しています。

二重引用符と等号の必須のエスケープに加えて、問題を回避するために値内のスペースをエスケープすることは有益です。 この例では、各スペース文字の前にバックスラッシュを使用して、正しく読み取られて処理されるようにしています。

```properties
blacklistBundleSymbolicNames=["Liferay\ Marketplace","Liferay\ Sharepoint\ Connector"]
```

自分でスペースをエスケープしない場合、システムは展開後にバックスラッシュを追加します。

## 型付き値

`.config` ファイル形式は、特殊なタイプマーカー文字を挿入することにより、構成値のタイプの指定をサポートします。 システムは各構成プロパティの正しいタイプをすでに認識しているため、タイプ文字は情報提供の目的でのみ役立ちます。 たとえば、ブール型の構成では、ブール型としてマークする値の直前に **B** あります。

```properties
addDefaultStructures=B"true"
```

`.config` ファイルにタイプマーカーが表示される場合は、無視しても問題ありません。 上記の例は、タイプマーカーなしでも同じように機能します。

```properties
addDefaultStructures="true"
```

## 構成ファイルのデプロイ

構成ファイルを作成したら、それをデプロイします。 それが登録され、ターゲットの構成値が自動的に更新されます。

`.config` ファイルをデプロイするには、 [Liferay Homeの](../../../installation-and-upgrades/reference/liferay-home.md) `osgi/configs` フォルダに配置します。 さらに構成を変更するには、 `.config` ファイルを直接編集するか、システム設定を使用します。

## 構成ファイルとクラスタリング

クラスター環境では、各ノードの各エントリーに同じ構成値が必要です。 たとえば、すべてのノードで同じブログ構成設定を使用する必要があります。 これを行うには、 `.config` ファイルをデプロイします。 透過性と保守性のために、 `.config` ファイルをクラスター内のすべてのノードにデプロイします。 ただし、構成ファイルが単一のノードにのみデプロイされている場合でも、内部システムはクラスター内のすべてのノードに変更を適用します。

```{important}
Liferay DXPの設定（例えば、Liferay Home）をソースコントロールシステムに保存する場合、OSGi設定ファイル（.config ファイル）を必ず含めるようにしてください。
```

## スキーマの読み取り専用設定の設定

{bdg-secondary}`あり 7.4 U19+`

特定のサイトやインスタンスをプロビジョニングする際、特定の設定を読み取り専用に設定すると便利な場合があります。 そのためには

1. 読み取り専用に設定するコンフィグレーションに移動します。 例えば、 **Control Panel** &rarr; **Instance Settings** &rarr; **Blogs** に移動します。

1. コンフィギュレーション設定を変更し、保存します。 ![Actions](../../../images/icon-actions.png) のアイコンをクリックします。 エクスポート］をクリックします。

1. コマンドラインで、エクスポートされた設定ファイルをそのファイルに対して読み取り専用に設定します。 例:

   ```bash
   chmod -w com.liferay.blogs.configuration.BlogsGroupServiceConfiguration.scoped_0efd1a18-105e-445d-8b42-0ea2d6117690.config
   ```

1. 設定ファイルを、インストール先の `/osgi/configs` フォルダに配置します。 設定画面を更新する。 コンフィギュレーションが読み取り専用になりました。

   ![設定ファイルを /osgi/configs に配置し、設定を読み取り専用にする。](./using-configuration-files/images/03.png)

## 単一の読み取り専用値の指定

単一の読み取り専用設定値を指定するには、 [ポータルプロパティ](../../../installation-and-upgrades/reference/portal-properties.md)を使用します。

{bdg-secondary}`利用可能な7.4+、7/3 FP1/SP1、および7.2 FP14/SP5`

以下は、プロパティの構文です。

```properties
configuration.override.${pid}_${key}=${value}{code}
```

例:

```properties
configuration.override.com.liferay.journal.configuration.JournalServiceConfiguration_indexAllArticleVersionsEnabled=B"false"
configuration.override.com.liferay.journal.configuration.JournalServiceConfiguration_journalArticleMaxVersionCount=I"5"{code}
```

```{important}
構成プロパティは、タイプマーカーを指定する必要があります。
```

プロパティ設定は、サーバー再起動時に適用されます。 プロパティ設定は最も優先度が高く、設定ファイルやデータベースで保持される設定よりも優先されます。 UIでは、すべての読み取り専用の構成設定を区別しています。 読み取り専用の設定値を変更する必要がある場合は、ポータルプロパティを使用します。

```{note}
読み取り専用の[ファクトリー設定値](./using-factory-configuration.md) はサポートされていません。
```
