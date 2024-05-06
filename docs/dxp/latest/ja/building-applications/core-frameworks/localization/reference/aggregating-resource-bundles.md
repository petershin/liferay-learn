# リソースバンドルの集約

ローカライズされたメッセージを共有するモジュールを操作する場合、bndヘッダは、モジュールに関連付けるリソースバンドルを指定する必要があります。 Liferayは、リソースバンドルを集約するために必要なパラメーターを自動的に指定するbnd命令を提供します。

1. `bnd.bnd`ファイルを開きます。

1. `-liferay-aggregate-resource-bundles:` bnd命令を追加し、現在のモジュールと集約するリソースバンドルがあるモジュールのバンドルシンボリック名を割り当てます。

    ```properties
    -liferay-aggregate-resource-bundles: \
        [bundle.symbolic.name1],\
        [bundle.symbolic.name2]
    ```

    たとえば、モジュール`com.acme.able.impl`および`com.acme.baker.impl`のリソースバンドルを使用するモジュールは、次のように構成されます。

    ```properties
    -liferay-aggregate-resource-bundles: \
        com.acme.able.impl,\
        com.acme.baker.impl
    ```

現在のモジュールのリソースバンドルは、リストされているモジュールのリソースバンドルよりも優先されます。

ビルド時に、Liferayのbndプラグインは、bnd命令を`Require-Capability`および`Provide-Capability`パラメーターに自動的に変換します。

```{note}
Liferayのネイティブモジュールを使用してリソースを集約するには、パラメーターを手動で指定する必要があります。 
```

## 参照

結果のOSGiヘッダは、jarファイルの`MANIFEST.MF`ファイルにあります。 たとえば、モジュールのシンボリック名が`com.acme.web`で、`com.acme.able.impl`および`com.acme.baker.impl`のリソースバンドルを使用する場合、`Require-Capability`は次のようになります。

```properties
Require-Capability: liferay.resource.bundle;filter:="(bundle.symbolic.name=com.acme.able.impl)",liferay.resource.bundle;filter:="(bundle.symbolic.name=com.acme.baker.impl)"
```

`Provide-Capability`は次のようになります。

```properties
Provide-Capability:  liferay.resource.bundle;resource.bundle.base.name="content.Language"\
liferay.resource.bundle;resource.bundle.aggregate="(bundle.symbolic.name=com.acme.web),(bundle.symbolic.name=com.acme.able.impl),(bundle.symbolic.name=com.acme.baker.impl)";\
bundle.symbolic.name="com.acme.web";resource.bundle.base.name="content.Language";\
service.ranking=1,;servlet.context.name="com.acme.web"
```

サンプルの`Provide-Capability`ヘッダには、次の2つの部分があります。

1. `liferay.resource.bundle;resource.bundle.base.name="content.Language"`は、モジュールがベース名が`content.language`のリソースバンドルを提供することを宣言します。

1. `liferay.resource.bundle;resource.bundle.aggregate=...`ディレクティブは、リソースバンドルが集約されるバンドルのリスト、ターゲットバンドル、ターゲットバンドルのリソースバンドル名、およびこのサービスのランキングを指定します。

    * `"(bundle.symbolic.name=com.acme.web),(bundle.symbolic.name=com.acme.able.impl),(bundle.symbolic.name=com.acme.baker.impl)"`：このサービスは、バンドル`bundle.symbolic.name=com.acme.web`（現在のモジュール）からのリソースバンドルを
    `bundle.symbolic.name=com.acme.able.impl` および 
    `bundle.symbolic.name=com.acme.baker.impl` で集約します。

    必要な数のバンドルを集約します。 リストされたバンドルは降順で優先されます。

    * `bundle.symbolic.name=com.acme.web;resource.bundle.base.name="content.Language"`：`content.Language`という名前の`com.acme.web`バンドルのリソースバンドルをオーバーライドします。

    * `service.ranking=1`：リソースバンドルのサービスランキングは`1`です。 OSGiフレームワークは、このサービスが`com.acme.web`の`content.Language`リソースバンドルを対象とする他のすべてのリソースバンドルサービスを上回る場合、このサービスを適用します。

    * `servlet.context.name=com.acme.web`：ターゲットリソースバンドルはサーブレットコンテキスト`com.acme.web`にあります。
