# Factory設定の使用

ほとんどのLiferay DXPシステム設定では、1つのエントリに1つの設定セットしか許可されていません。 設定を変更するには、単一の設定フォームを更新します。これは、[影響を受ける設定全体](../understanding-configuration-scope.md)に適用されます。 あまり一般的ではあり *が、設定は同時に共存する複数のエントリをサポートします。これらは*Factory設定*と呼ばれます。 Factory設定の場合、各設定セットは固有の設定を提供します。 一般的な使用法は、サードパーティサーバー（LDAPやElasticsearchなど）へのシステムスコープの接続の設定です。 これらのサーバーへの接続ごとに固有の設定値が必要であるため、Factory設定を使用してそれを可能にします。</p>

```{tip}
Factory設定例：[組織タイプの追加] (../../../users-and-permissions/organizations/adding-a-new-organization-type.md) がサポートされており、現実の階層をモデル化したり、階層ルールを適用する必要がある場合に便利です。 Liferay DXPでは、各組織タイプはシステム設定のFactory設定エントリーで作成されます。
```

## Factory設定の特定

サービスがFactory設定をサポートしている場合、そのシステム設定エントリーには追加ボタンがあります。

![システム設定エントリーに追加ボタンがある場合、Factory設定をサポートしています。](./using-configuration-files/images/01.png)

追加ボタン ![Add](../../../images/icon-add.png) をクリックして、設定値の新しいセットを追加します。

## Factory設定ファイル

単一インスタンス設定と同様に、システム設定インターフェイス（上記の追加ボタンを使用）または [設定ファイル](./using-configuration-files.md)介してFactory設定を設定できます。 標準の単一インスタンス設定ファイルは、設定オブジェクトの完全修飾クラス名に `.config`追加したものを使用します。

```bash
my.service.ServiceConfiguration.config
```

サービスがFactory設定をサポートしている場合は、設定の最初のインスタンス `-default.config`を呼び出す規則を使用します。 デフォルトの組織タイプの名前は次のようになっています。

```bash
com.liferay.organizations.internal.configuration.OrganizationTypeConfiguration~default.config
```

```{note}

Liferay DXP/Portal バージョン 7.0-7.3 では、チルダ (`~`) を使ってFactory設定ファイルの名前とサブネームを分ける代わりに、ブラウザとOSに応じたダッシュ (`-`) またはアンダースコア (`_`) を使ってください。 例えば、

ダッシュ：

`com.liferay.organizations.internal.configuration.OrganizationTypeConfiguration-default.config`

アンダースコア：

`com.liferay.organizations.internal.configuration.OrganizationTypeConfiguration_default.config`

チルダは好ましい区切り文字ですが、ダッシュとアンダースコアもまだサポートされています。
```

次のインスタンスには、一意の *サブネーム* （ *デフォルト*以外のもの）が含まれています。 このインスタンスを使用する必要があるときにわかりやすい名前を使用することをお勧めします。 [新しい組織タイプの追加](../../../users-and-permissions/organizations/adding-a-new-organization-type.md)の例に続いて、次の名前の設定ファイルで_リーグ_タイプを追加できます。

```bash
com.liferay.organizations.internal.configuration.OrganizationTypeConfiguration~league.config
```

```{warning}
サブネーム付きの設定ファイルを提供すると、たとえサービスが複数の設定項目を受け入れるように設計されていなくても、Factory設定のシナリオが強制されます。 上記のようにシステム設定UIを使用して、設定項目でFactory設定を使用することがサポートされているかどうかを確認します。 
```

Factory設定をサポートする一部のシステム設定エントリには、デフォルトインスタンスの設定ファイルが付属していません（例：匿名ユーザーエントリー）。 Factory設定ファイルをエクスポートして `.config` ファイルを取得する場合、 `-default.config` 命名規則は使用されません。 代わりに、それが最初の出現か追加の出現かに関係なく、そのサブネームには保証された一意の識別情報が与えられます。

```bash
com.liferay.user.associated.data.web.internal.configuration.AnonymousUserConfiguration~6befcd73-7c8b-4597-b396-a18f64f8c308.config
```

あなたが別のシステムにデプロイするための設定ファイルをエクスポートしている場合は、最初の`～`の後、エクスポートファイル名の一部の名前を変更して、より分かりやすいサブネームを使用できます。 注意：ファイルの名前を変更して、エクスポート元と同じシステムにデプロイすると、新しいサブネームにより、完全に新しい設定としてマークされます。 この場合、名前が変更されたインスタンスだけでなく、追加の設定インスタンスが作成されます。

```{warning}
Factory設定をサポートする設定エントリーでは、 `.config` ファイル名からサブネームを省略すると、システム設定はこの `.config` ファイルが対象とする設定エントリーの新しいエントリを追加しないようにします。 これは、既知のバグが原因です。 詳しくは [LPS-76352](https://issues.liferay.com/browse/LPS-76352)を参照してください。 不適切な名前の設定ファイルがデプロイされると、そのシステム設定エントリーから問題の設定に関するエントリーを追加することができなくなります。

誤った（サブネームがない）`.config`ファイルをデプロイしても、何も永久に無効化されることはありません。 上記の適切な規則に従ってファイル名を変更するか、完全に削除して最初からやり直します。
```