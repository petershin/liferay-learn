# カスタムフォーム項目タイプの書き込み

フォームアプリケーションには、高度に設定可能な [フィールドタイプが標準で](../creating-and-managing-forms/forms-field-types-reference.md)多く含まれています。 既存のフィールドタイプのいずれかを使えば、ほとんどのユースケースに対応できます。 デフォルトのフィールドタイプでユースケースに対応できない場合、独自のフィールドタイプを作成することができます。

![多くの便利なフォーム要素があります。](./writing-a-custom-form-field-type/images/01.png)

* [サンプルプロジェクトをデプロイして動作を確認する](#examine-the-custom-form-field-in-liferay)
* [フォームフィールドのコードを理解する](#understand-the-form-field-s-code)
* [フィールドにカスタム設定を追加する](#add-custom-settings-to-the-form-field)

```{note}
- **その他のアプリケーションにおけるフォームフィールドタイプ：** ドキュメントとメディア（メタデータセット）、Webコンテンツ（ストラクチャー）およびフォームアプリケーションで作成されたフォームは、同じフォームフィールドをすべて消費できます。 デフォルトでは、カスタムフォームフィールドは、フォームアプリケーションでのみ使用されます。 どのアプリケーションがフォームフィールドタイプを有効にするかを明示的に指定するために、コンポーネントプロパティを追加します。

    ```properties
    "ddm.form.field.type.scope=document-library,forms,journal""
    ```

- **プロジェクトの互換性** サンプルプロジェクトはLiferay 7.4で動作しています。 Liferay 7.3を実行している場合、ソースコードは互換性がありますが、[ワークスペースプロジェクト](../../../building-applications/tooling/liferay-workspace/what-is-liferay-workspace.md)をLiferay 7.3用に再設定する必要があります。 そのための手順が、以下のインストラクションに記載されています。

    Liferay 7.2をお使いの場合、サポートされるフロントエンドフレームワークの違いにより、このソースコードは実行されません。 C2P9スライダーのコードサンプルを7.2用に適合させる方法については、 [Liferay 7.2のカスタムフォーム項目の開発](./developing-a-custom-form-field-for-liferay-7-2.md)を参照してください。
```

## Liferay のカスタムフォームフィールドを調べる 

カスタムフォームフィールドがどのように機能するかを見るために、サンプルをデプロイし、新しいフィールドを使ってフォームデータを追加します。

### 例をデプロイする

```{include} /_snippets/run-liferay-portal.md
```

次に、以下の手順に従います。

1. カスタムフォームフィールドタイプのプロジェクトをダウンロードし、解凍します。

    ```bash
    curl https://resources.learn.liferay.com/dxp/latest/en/process-automation/forms/developer-guide/liferay-c2p9.zip -O
    ```

    ```bash
    unzip liferay-c2p9.zip
    ```

1. モジュールのルートから、ビルドおよびデプロイします。

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   ```{tip}
   このコマンドは、デプロイされたjarをDockerコンテナの/opt/liferay/osgi/modulesにコピーするのと同じです。
   ```

   ```{note}
   Liferay 7.3 の場合、デプロイする前にプロジェクトに以下の調整を加えてください。
   - c2p9-impl/package.json` で、`devDependencies` の参照を `@liferay/portal-7.4` から `@liferay/portal-7.3` に変更します。
   - `gradle.properties` で `liferay.workspace.product` の値を `portal-7.3-ga8` に変更します (GA8 より新しい Liferay 7.3 バージョンがある場合は、代わりにここを参照してみてください)。
   ```

1. Liferay Dockerコンテナコンソールでデプロイを確認します。

   ```bash
   STARTED com.acme.c2p9.impl_1.0.0 [1009]
   ```

### デプロイされたスライダーフィールドを使用する

1. ブラウザで<http://localhost:8080>を開きます。

1. ［**サイトメニュー**］ &rarr; ［**コンテンツ & データ**］ &rarr; ［**フォーム**］ のフォームアプリケーションに移動します。

1. **追加** ボタン（![Add](./../../../images/icon-add.png)）をクリックして、フォームビルダーを開きます。

1. フォームに **C2P9 Slider** フィールドを追加します。

1. ラベル、初期値、ヘルプテキストを記入し、フィールドを必須とすることもできます。 これらの設定は、多くの [デフォルトのフィールド](../creating-and-managing-forms/forms-field-types-reference.md) が基本設定として提供するものと一致します。

1. フォームを公開し、スライダーフィールドを使用してレコードを送信します。

![スライダーで0〜100の値を設定します。](./writing-a-custom-form-field-type/images/02.png)

## フォームフィールドのコードを理解する

基本的なフォームフィールドは、JavaクラスとJavaScriptファイルから構成されています。 C2P9スライダーフィールドでは、抽象クラス `BaseDDMFormFieldType`を拡張してOSGiコンポーネントでそのメタデータを定義することで、`C2P9DDMFormFieldType.java`が`DDMFormFieldType`の実装を提供します。

```{literalinclude} ./writing-a-custom-form-field-type/resources/liferay-c2p9.zip/c2p9-impl/src/main/java/com/acme/c2p9/internal/dynamic/data/mapping/form/field/type/C2P9DDMFormFieldType.java
   :dedent: 0
   :language: java
   :lines: 10-20
```

`ddm.form.field.type.description`：説明テキストに言語キーを指定します。 翻訳された値が`Language.properties`ファイルに定義されていることを確認してください。

`ddm.form.field.type.display.order`：フォームビルダーサイドバーのどこにフィールドが表示されるかを整数値または浮動小数点で設定します。 同じ値を持つフィールドはランダムに並べられます。

`ddm.form.field.type.icon`: フィールドに使用するアイコンタイプを決定します。 任意の [Clayアイコン](https://clayui.com/docs/components/icon.html) を選択します。

`ddm.form.field.type.label`: ラベルテキストに言語キーを指定します。 翻訳された値が`Language.properties`ファイルに定義されていることを確認してください。

`ddm.form.field.type.name`：フィールドタイプ識別子を指定します。 これは内部および他のコンポーネントでフィールドを識別するために使用されます。

`getModuleName`メソッドは、`Slider.es.js`ファイルパスを`NPMResolver`サービスに渡します。

```{literalinclude} ./writing-a-custom-form-field-type/resources/liferay-c2p9.zip/c2p9-impl/src/main/java/com/acme/c2p9/internal/dynamic/data/mapping/form/field/type/C2P9DDMFormFieldType.java
   :dedent: 1
   :language: java
   :lines: 22-26,38-39
```
パス定義の一部は`package.json`ファイルで実現されています（`name`宣言と`scripts`セクションで定義された`source-maps`をご覧ください)。

`getName`メソッドは、フォームフィールド識別子を返します。 これは、コンポーネントプロパティ `ddm.form.field.type.name`の値と一致しなければなりません。

```{literalinclude} ./writing-a-custom-form-field-type/resources/liferay-c2p9.zip/c2p9-impl/src/main/java/com/acme/c2p9/internal/dynamic/data/mapping/form/field/type/C2P9DDMFormFieldType.java
   :dedent: 1
   :language: java
   :lines: 28-31
```

`isCustomDDMFormFieldType`は内部で使用されます。 `getModuleName`メソッドで`NPMResolver.resolveModuleName()`の結果を返している場合は、`true`を返します。

```{literalinclude} ./writing-a-custom-form-field-type/resources/liferay-c2p9.zip/c2p9-impl/src/main/java/com/acme/c2p9/internal/dynamic/data/mapping/form/field/type/C2P9DDMFormFieldType.java
   :dedent: 1
   :language: java
   :lines: 33-36
```

`Slider.es.js`は、フィールドのJavaScriptロジックを指定します。 `Main`と`Slider`の2つのコンポーネントがファイルに定義されています。

インポートステートメントは、Liferayの基本フォームフィールドである`dynamic-data-mapping-form-field-type`の機能を取り込みます。 これらは、宣言された変数 `FieldBase`と`useSyncValue`を使って後で呼び出されます。

```{literalinclude} ./writing-a-custom-form-field-type/resources/liferay-c2p9.zip/c2p9-impl/src/main/resources/META-INF/resources/C2P9/Slider.es.js
   :dedent: 0
   :language: js
   :lines: 1-2
```

`const Slider =`ブロックはフィールドを定義し、パラメーター`name`、`onChange`、`predefinedValue`、`readOnly`および`value`でインスタンス化されています。

```{literalinclude} ./writing-a-custom-form-field-type/resources/liferay-c2p9.zip/c2p9-impl/src/main/resources/META-INF/resources/C2P9/Slider.es.js
   :dedent: 0
   :language: js
   :lines: 5-17
```

これらのパラメーターの値は、その他のいくつかのパラメーターと共にフォームフィールドのHTML `<input>`タグを定義します。 重要なのは、ユーザーが選択できる`max`と`min`の値は、現在ハードコードされていることです。 これは、 [後ほど変更します](#add-custom-settings-to-the-form-field) 。 フィールドの`value`は三項演算子を用いて定義されており、値が入力されていれば、それを使用します。 それ以外の場合は、初期値を使用します。

`Main`コンポーネントはファイルの最後にエクスポートされ、インポートされた`FieldBase`の子要素として`Slider`を含んでいます。 `onChange`関数は、イベントが検出されるたびに（スライダーが新しい値までドラッグされるたびに）スライダーの位置と値を取得します。

```{literalinclude} ./writing-a-custom-form-field-type/resources/liferay-c2p9.zip/c2p9-impl/src/main/resources/META-INF/resources/C2P9/Slider.es.js
   :dedent: 0
   :language: js
   :lines: 19-55
```

## フォームフィールドにカスタム設定を追加する

現在、スライダーフィールドの最大値と最小値の設定はハードコーディングされていますが、設定可能であればよりよいでしょう。 フォームフィールドにカスタム設定を追加するには、

- `DDMFormFieldTypeSettings`クラスを追加し、`DDMFormFieldType`にメソッドを追加して、バックエンドを調整します。
- `DDMFormFieldTemplateContextContributor`を追加し、`Slider.es.js`で定義されている設定方法を更新して、新しい設定をレンダリングするためにフロントエンドを適応させます。

### バックエンドのカスタム設定に対応

フォームフィールドの設定は `DDMTypeSettings`クラスで定義されます。また、 `@DDMForm`アノテーションを使ってフィールドのサイドバーに表示されるフォームも定義されます。 それから、 `DDMFormFieldType`自体が新しい設定定義について知っている必要があるので、デフォルトのフィールド設定フォームを表示しないようにします。 `DDMFormFieldContextContributor`クラスが新しい設定をReactコンポーネントに送信し、エンドユーザーに表示します。

1. `C2P9DDMFormFieldTypeSettings` Java クラスを `com.acme.c2p9.internal.dynamic.data.mapping.form.field.type` パッケージに追加します。

   ```java
   package com.acme.c2p9.internal.dynamic.data.mapping.form.field.type;

   import com.liferay.dynamic.data.mapping.annotations.DDMForm;
   import com.liferay.dynamic.data.mapping.annotations.DDMFormField;
   import com.liferay.dynamic.data.mapping.annotations.DDMFormLayout;
   import com.liferay.dynamic.data.mapping.annotations.DDMFormLayoutColumn;
   import com.liferay.dynamic.data.mapping.annotations.DDMFormLayoutPage;
   import com.liferay.dynamic.data.mapping.annotations.DDMFormLayoutRow;
   import com.liferay.dynamic.data.mapping.form.field.type.DefaultDDMFormFieldTypeSettings;

   @DDMForm
   @DDMFormLayout(
      paginationMode = com.liferay.dynamic.data.mapping.model.DDMFormLayout.TABBED_MODE,
      value = {
         @DDMFormLayoutPage(
            title = "%basic",
            value = {
               @DDMFormLayoutRow(
                  {
                     @DDMFormLayoutColumn(
                        size = 12,
                        value = {
                           "label", "predefinedValue", "required", "tip"
                        }
                     )
                  }
               )
            }
         ),
         @DDMFormLayoutPage(
            title = "%advanced",
            value = {
               @DDMFormLayoutRow(
                  {
                     @DDMFormLayoutColumn(
                        size = 12,
                        value = {
                           "dataType", "min", "max", "name", "showLabel",
                           "repeatable", "type", "validation",
                           "visibilityExpression"
                        }
                     )
                  }
               )
            }
         )
      }
   )
   public interface C2P9DDMFormFieldTypeSettings
      extends DefaultDDMFormFieldTypeSettings {

      @DDMFormField(
         label = "%max-value",
         properties = "placeholder=%enter-the-top-limit-of-the-range",
         type = "numeric"
      )
      public String max();

      @DDMFormField(
         label = "%min-value",
         properties = "placeholder=%enter-the-bottom-limit-of-the-range",
         type = "numeric"
      )
      public String min();

   }
   ```

1. 各設定には、`label`と`placeholder`の2つの言語キーがあります。 `c2p9-impl/src/main/resources/content/Language.properties`を開き、以下の行を追加してください。

   ```properties
   max-value=Maximum Value
   min-value=Minimum Value
   enter-the-bottom-limit-of-the-range=Enter the bottom limit of the range.
   enter-the-top-limit-of-the-range=Enter the top limit of the range.
   ```

1. `getDDMFormFieldTypeSettings`メソッドを追加/オーバーライドすることにより、`DDMFormFieldType`クラスを更新します。

   ```java
   @Override
   public Class<? extends DDMFormFieldTypeSettings>
      getDDMFormFieldTypeSettings() {

      return C2P9DDMFormFieldTypeSettings.class;
   }
   ```

### フロントエンドでのカスタム設定に対応

フロントエンドでは、ユーザーが入力する min と max の値に対応するために`Slider.es.js` を更新し、フロントエンドがバックエンドから設定値を受け取れるように `DDMTemplateContextContributor` を追加する必要があります。

1. `C2P9DDMFormFieldTemplateContextContributor` クラスを `com.acme.c2p9.internal.dynamic.data.mapping.form.field.type` パッケージに作成します。

   ```java
   package com.acme.c2p9.internal.dynamic.data.mapping.form.field.type;

   import com.liferay.dynamic.data.mapping.form.field.type.DDMFormFieldTemplateContextContributor;
   import com.liferay.dynamic.data.mapping.model.DDMFormField;
   import com.liferay.dynamic.data.mapping.render.DDMFormFieldRenderingContext;

   import java.util.HashMap;
   import java.util.Map;

   import org.osgi.service.component.annotations.Component;

   @Component(
     property = "ddm.form.field.type.name=c2p9-slider",
     service = DDMFormFieldTemplateContextContributor.class
   )
   public class C2P9DDMFormFieldTemplateContextContributor
     implements DDMFormFieldTemplateContextContributor {

     @Override
     public Map<String, Object> getParameters(
        DDMFormField ddmFormField,
        DDMFormFieldRenderingContext ddmFormFieldRenderingContext) {

        Map<String, Object> parameters = new HashMap<>();

        parameters.put("max", (String)ddmFormField.getProperty("max"));
        parameters.put("min", (String)ddmFormField.getProperty("min"));

        return parameters;
     }

   }
   ```

1. `Slider.es.js`のJavaScriptコンポーネントを更新し、ハードコードされた最小値と最大値を削除し、代わりにユーザーが値を入力できるようにします。 ファイルの全内容は以下の通りです。

   ```javascript
   import {FieldBase} from 'dynamic-data-mapping-form-field-type/FieldBase/ReactFieldBase.es';
   import {useSyncValue} from 'dynamic-data-mapping-form-field-type/hooks/useSyncValue.es';
   import React from 'react';

   const Slider = ({max, min, name, onChange, predefinedValue, readOnly, value}) => (
      <input
         className="ddm-field-slider form-control slider"
         disabled={readOnly}
         id="myRange"
         max={max}
         min={min}
         name={name}
         onInput={onChange}
         type="range"
         value={value ? value : predefinedValue}
      />
   );

   const Main = ({
      label,
      max,
      min,
      name,
      onChange,
      predefinedValue,
      readOnly,
      value,
      ...otherProps
   }) => {
      const [currentValue, setCurrentValue] = useSyncValue(
         value ? value : predefinedValue
      );

      return (
         <FieldBase
            label={label}
            name={name}
            predefinedValue={predefinedValue}
            {...otherProps}
         >
            <Slider
               max={max}
               min={min}
               name={name}
               onChange={(event) => {
                  setCurrentValue(event.target.value);
                  onChange(event);
               }}
               predefinedValue={predefinedValue}
               readOnly={readOnly}
               value={currentValue}
            />
         </FieldBase>
      );
   };

   Main.displayName = 'Slider';

   export default Main;
   ```

1. フォームフィールドモジュールを再デプロイします。 処理が完了したら（コンソールでSTOPPED &rarr; STARTED）、Liferayを再起動します。

   ```shell
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   ```shell
   docker container restart $(docker ps -lq)
   ```

1. フォームのスライダーフィールドを再度テストします。 今回は、フィールドのサイドバー設定の［詳細設定］タブで、最小値と最大値の設定を変えて試してみてください。

   ![MinとMaxの設定ができるようになりました。](./writing-a-custom-form-field-type/images/03.png)
