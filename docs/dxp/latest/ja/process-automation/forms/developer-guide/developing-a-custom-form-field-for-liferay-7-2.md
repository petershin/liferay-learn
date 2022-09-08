# Liferay 7.2のカスタムフォーム項目の開発

Reactベースのカスタムフォーム項目は、Liferay 7.3およびLiferay 7.4用に開発できます。 方法については、[カスタムフォーム項目タイプの書き込み](./writing-a-custom-form-field-type.md)を参照してください。 Liferay 7.2では、MetalJSとSoyクロージャテンプレートをベースにした、異なるフロントエンド技術を採用しました。 このチュートリアルでは、ReactベースのAcme C2P9 SliderフィールドをLiferay 7.2インストール上で動作するように適合させることについて学びます。

## Acme C2P9 SliderをLiferay 7.2で動作するように調整する

Liferay 7.2 では、カスタムフォーム項目に別のフロントエンドフレームワークを使用していました。 Acme C2P9 SliderフィールドをLiferay 7.2上で動作するよう調整するには、以下の手順に従ってください。

1. [カスタムフォーム項目タイププロジェクト](./writing-a-custom-form-field-type/resources/liferay-c2p9.zip) をダウンロードし、解凍してください。

    ```bash
    curl https://learn.liferay.com/dxp/latest/ja/process-automation/forms/developer-guide/liferay-c2p9.zip -O
    ```

    ```bash
    unzip liferay-c2p9.zip
    ```
1. `liferay-c2p9.zip/gradle.properties`ファイルを開き、次の行を

   ```properties
   liferay.workspace.product=portal-7.4-ga8
   ```

   下記に変更します。

   ```properties
   liferay.workspace.product=portal-7.2-ga2
   ```

1. `liferay-c2p9.zip/settings.gradle`ファイルを開き、次の行を

   ```groovy
   classpath group: "com.liferay", name: "com.liferay.gradle.plugins.workspace", version: "latest.release"
   ```

   下記に変更します。

   ```groovy
   classpath group: "com.liferay", name: "com.liferay.gradle.plugins.workspace", version: "3.4.17"
   ```

1. `liferay-c2p9.zip/c2p9-impl/build.gradle`ファイルを開き、次の行を追加します。

   ```groovy
    compileOnly group: "org.osgi", name: "osgi.cmpn"
    jsCompile group: "com.liferay", name: "com.liferay.dynamic.data.mapping.form.field.type"
    ```

1. `liferay-c2p9.zip/c2p9-impl/package.json`ファイルを開きます。 次の`devDependencies`の行を

   ```json
    "@liferay/portal-7.4": "*"
   ```

   下記の2行に置き換えるところから始めます。

   ```json
    "@liferay/portal-7.2": "*",
    "metal-tools-soy": "4.3.2"
   ```

   次に、既存の`scripts`コンテンツ（2行）を下記の3行に置き換えます。

   ```json
   "build": "npm run build-soy && npm run build-js && liferay-npm-bundler",
   "build-js": "babel --source-maps -d build/resources/main/META-INF/resources src/main/resources/META-INF/resources",
   "build-soy": "metalsoy --externalMsgFormat \"Liferay.Language.get('\\$2')\" --soyDeps \"./node_modules/clay-*/src/**/*.soy\" \"./node_modules/com.liferay.dynamic.data.mapping.form.field.type/META-INF/resources/+(FieldBase|components)/**/*.soy\""
   ```

1. `liferay-c2p9.zip/c2p9-impl/bnd.bnd`ファイルを開き、次の行を追加します。

   ```properties
   Provide-Capability:\
    soy;\
        type:String="LiferayFormField"
   ```

1. `liferay-c2p9.zip/c2p9-impl/.babelrc.js`の内容を次のように置き換えます。

   ```js
   module.exports = {
       presets: ['@babel/preset-env'],
   };
   ```

   **チェックポイント：** プロジェクトは7.2のフロントエンドフレームワークを想定して再設定されているので、フォーム項目プロジェクトのフロントエンドを置き換える必要があります。

1. 既存の`Slider.es.js`ファイルを削除し、それに代わる以下の3つのファイルを作成します。
   - `Slider.es.js`：MetalJS + Soyフロントエンドを使用した新しいスライダーコンポーネント。

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
   - `Slider.soy`：フィールドのSoyテンプレート。
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

   - `SliderRegister.soy`：スライダーのSoyテンプレートの登録コード。

      ```shell
      {namespace SliderRegister}

      {deltemplate PageRenderer.RegisterFieldType variant="'slider'"}
          {call Slider.render data="all" /}
      {/deltemplate}
      ```

1. `DDMFormFieldType`に対して細かい調整が必要です：フィールドの識別子（`名前`）は、Soy テンプレートで Stringリテラルとして参照されるため、ハイフン（`-`）を持つことができません。 `C2P9DDMFormFieldType`クラスを開き、以下のハイフンを削除してください。

   - コンポーネントプロパティ `ddm.form.field.type.name`
   - `getName`によって返される文字列

   両方の場所の値は`c2p9slider`になりました。

1. プロジェクトのフロントエンドを置き換えたら、それを稼働中のLiferay 7.2にデプロイします。

   - Liferay 7.2のDockerコンテナを起動するには、次のコマンドを実行します。
      ```shell
      docker run -it -m 8g -p 8080:8080 liferay/portal:7.2.1-ga2
      ```
   - 再構成されたフォーム項目プロジェクトをデプロイするには、 `liferay-c2p9.zip`フォルダーに移動し、以下を実行します。
      ```shell
      ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
      ```

1. Liferay Dockerコンテナコンソールでデプロイを確認します。

   ```bash
   STARTED com.acme.c2p9.impl_1.0.0 [1009]
   ```

フォーム項目はデプロイされ、Liferay 7.2上で [使用できるように準備されています](./writing-a-custom-forms-field-type.md#use-the-deployed-slider-field) 。

