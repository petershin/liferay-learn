# Liferay 7.2 のカスタムフォームフィールドの開発

Reactベースのカスタムフォームフィールドは、Liferay 7.3およびLiferay 7.4用に開発することができます。 その方法は、 [カスタムフォームフィールドタイプの書き方](./writing-a-form-storage-adapter.md) を参照してください。 Liferay 7.2では、MetalJSとSoyクロージャテンプレートをベースにした、異なるフロントエンド技術を採用しました。 このチュートリアルでは、ReactベースのAcme C2P9 SliderフィールドをLiferay 7.2インストール上で動作するように適合させることを学ぶことができます。

## Acme C2P9 スライダーを Liferay 7.2 で動作するように調整する。

Liferay 7.2 では、カスタムフォームフィールドに別のフロントエンドフレームワークを使用していました。 Acme C2P9 SliderフィールドをLiferay 7.2上で動作させるために調整すること。

1. [Custom Forms Field Type プロジェクト](./writing-a-custom-form-field-type/resources/liferay-c2p9.zip) をダウンロードし、解凍してください。

    ```bash
    curl https://learn.liferay.com/dxp/latest/ja/process-automation/forms/developer-guide/liferay-c2p9.zip -O
    ```

    ```bash
    unzip liferay-c2p9.zip
    ```
1. `liferay-c2p9.zip/gradle.properties` ファイルを開き、次の行を変更します。

   ```properties
   liferay.workspace.product=portal-7.4-ga8
   ```

   宛先

   ```properties
   liferay.workspace.product=portal-7.2-ga2
   ```

1. `liferay-c2p9.zip/settings.gradle` ファイルを開き、次の行を変更します。

   ```groovy
   classpath group: "com.liferay", name: "com.liferay.gradle.plugins.workspace", version: "latest.release"
   ```

   宛先

   ```groovy
   classpath group: "com.liferay", name: "com.liferay.gradle.plugins.workspace", version: "3.4.17"
   ```

1. `liferay-c2p9.zip/c2p9-impl/build.gradle` ファイルを開き、次の行を追加します。

   ```groovy
    compileOnly group: "org.osgi", name: "osgi.cmpn"
    jsCompile group: "com.liferay", name: "com.liferay.dynamic.data.mapping.form.field.type"
    ```

1. `liferay-c2p9.zip/c2p9-impl/package.json` ファイルを開いてください。 `devDependencies` の行を置き換えることから始めます。

   ```json
    "@liferay/portal-7.4": "*"
   ```

   を、この2行で表しています。

   ```json
    "@liferay/portal-7.2": "*",
    "metal-tools-soy": "4.3.2"
   ```

   次に、既存の `scripts` の内容（2行）を、以下の3行に置き換えます。

   ```json
   "build": "npm run build-soy && npm run build-js && liferay-npm-bundler",
   "build-js": "babel --source-maps -d build/resources/main/META-INF/resources src/main/resources/META-INF/resources",
   "build-soy": "metalsoy --externalMsgFormat \"Liferay.Language.get('\\$2')\" --soyDeps \"./node_modules/clay-*/src/**/*.soy\" \"./node_modules/com.liferay.dynamic.data.mapping.form.field.type/META-INF/resources/+(FieldBase|components)/**/*.soy\""
   ```

1. `liferay-c2p9.zip/c2p9-impl/bnd.bnd` ファイルを開き、以下の行を追加してください。

   ```properties
   Provide-Capability:\
    soy;\
        type:String="LiferayFormField"
   ```

1. `liferay-c2p9.zip/c2p9-impl/.babelrc.js` の内容を次のように置き換えます。

   ```js
   module.exports = {
       presets: ['@babel/preset-env'],
   };
   ```

   **チェックポイント** プロジェクトは7.2のフロントエンドフレームワークを想定して再設定されているので、フォームフィールドプロジェクトのフロントエンドを置き換える必要があります。

1. 既存の `Slider.es.js` ファイルを削除し、それに代わる以下の3つのファイルを作成します。
   - `Slider.es.js`: MetalJS + Soyフロントエンドを使用した新しいスライダーコンポーネントです。

      ```js
      import 'dynamic-data-mapping-form-field-type/FieldBase/FieldBase.es';
      import './SliderRegister.soy.js';
      import templates from './Slider.soy.js';
      import Component from 'metal-component';
      import Soy from 'metal-soy';
      import {Config} from 'metal-state';

      class Slider extends Component {

          dispatchEvent(event, name, value) {
              this.emit(name, {
                  fieldInstance: this,
                  originalEvent: event,
                  value
              });
          }

          _handleFieldChanged(event) {
              const {value} = event.target;

              this.setState(
                  {
                      value
                  },
                  () => this.dispatchEvent(event, 'fieldEdited', value)
              );
          }
      }

      Slider.STATE = {

          label: Config.string(),

          name: Config.string().required(),

          predefinedValue: Config.oneOfType([Config.number(), Config.string()]),

          required: Config.bool().value(false),

          showLabel: Config.bool().value(true),

          spritemap: Config.string(),

          value: Config.string().value('')
      }

      Soy.register(Slider, templates);

      export default Slider;
      ```
   - `Slider.soy`: フィールドのSoyテンプレートです。
      ```shell
      {namespace Slider}

      {template .render}
          {@param label: string}
          {@param name: string}
          {@param showLabel: bool}
          {@param tip: string}
          {@param value: ?}
          {@param? _handleFieldChanged: any}
          {@param? predefinedValue: any}
          {@param? required: bool}
          {@param? spritemap: string}

          {call FieldBase.render}
              {param contentRenderer kind="html"}
                  {call .content}
                      {param _handleFieldChanged: $_handleFieldChanged /}
                      {param name: $name /}
                      {param predefinedValue: $predefinedValue /}
                      {param value: $value /}
                  {/call}
              {/param}
              {param label: $label /}
              {param name: $name /}
              {param required: $required /}
              {param showLabel: $showLabel /}
              {param spritemap: $spritemap /}
              {param tip: $tip /}
          {/call}
      {/template}

      {template .content}
          {@param name: string}
          {@param value: ?}
          {@param? _handleFieldChanged: any}
          {@param? predefinedValue: any}
          {let $attributes kind="attributes"}
              class="ddm-field-slider form-control slider"

              data-oninput="{$_handleFieldChanged}"

              id="myRange"

              max="100"

              min="1"

              name="{$name}"

              type="range"

              {if $value}
                  value="{$value}"
              {else}
                  value="{$predefinedValue}"
              {/if}
          {/let}

          <input {$attributes}>
      {/template}
      ```

   - `SliderRegister.soy`: スライダーのソイテンプレートの登録コードです。

      ```shell
      {namespace SliderRegister}

      {deltemplate PageRenderer.RegisterFieldType variant="'slider'"}
          {call Slider.render data="all" /}
      {/deltemplate}
      ```

1. `DDMFormFieldType` に対して細かい調整が必要です: フィールドの識別子 ( `の名前`) は、Soy テンプレートで String リテラルとして参照されるため、ハイフン (`-`) を持つことができません。 `C2P9DDMFormFieldType` クラスを開き、以下のハイフンを削除してください。

   - the component property `ddm.form.field.type.name`
   - the String returned by `getName`

   両方の場所の値は、現在、 `c2p9slider`.

1. プロジェクトのフロントエンドを置き換えたら、それを稼働中の Liferay 7.2 にデプロイします。

   - Liferay 7.2 の Docker コンテナを起動するには、次のコマンドを実行します。
      ```shell
      docker run -it -m 8g -p 8080:8080 liferay/portal:7.2.1-ga2
      ```
   - 再構成されたフォームフィールドプロジェクトを配備するには、 `liferay-c2p9.zip` フォルダーに移動し、以下を実行します。
      ```shell
      ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
      ```

1. Liferay Dockerコンテナコンソールでデプロイを確認します。

   ```bash
   STARTED com.acme.c2p9.impl_1.0.0 [1009]
   ```

</a> フォームフィールドはデプロイされ、 Liferay 7.2上で使用できるように準備されています。</p>

