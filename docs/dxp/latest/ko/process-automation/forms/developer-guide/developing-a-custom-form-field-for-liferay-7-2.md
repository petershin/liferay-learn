# Liferay 7.2용 사용자 정의 양식 필드 개발

Liferay 7.3 및 Liferay 7.4용 React 기반 사용자 지정 양식 필드를 개발할 수 있습니다. 방법을 알아보려면 [사용자 정의 양식 필드 유형 작성](./writing-a-custom-form-field-type.md) 을 참조하십시오. Liferay 7.2는 MetalJS 및 Soy 클로저 템플릿을 기반으로 하는 다른 프런트 엔드 기술을 사용했습니다. 이 자습서에서는 Liferay 7.2 설치에서 실행되도록 React 기반 Acme C2P9 슬라이더 필드를 조정하는 방법을 배울 수 있습니다.

## Liferay 7.2에서 실행되도록 Acme C2P9 슬라이더 조정

Liferay 7.2는 사용자 지정 양식 필드에 대해 다른 프런트 엔드 프레임워크를 사용했습니다. Liferay 7.2에서 실행하기 위해 Acme C2P9 슬라이더 필드를 조정하려면,

1. 사용자 지정 양식 필드 유형 프로젝트](./liferay-c2p9.zip)를 다운로드하여 압축을 풉니다.

풉니다. 
   
   

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/process-automation/forms/developer-guide/liferay-c2p9.zip -O
    ```

    ```bash
    unzip liferay-c2p9.zip
    ```

1. `liferay-c2p9.zip/gradle.properties` 파일을 열고 줄을 변경합니다. 

   ```properties
   liferay.workspace.product=portal-7.4-ga8
   ```

에 

   ```properties
   liferay.workspace.product=portal-7.2-ga2
   ```

1. `liferay-c2p9.zip/settings.gradle` 파일을 열고 줄을 변경합니다. 

   ```groovy
   classpath group: "com.liferay", name: "com.liferay.gradle.plugins.workspace", version: "latest.release"
   ```

에 

   ```groovy
   classpath group: "com.liferay", name: "com.liferay.gradle.plugins.workspace", version: "3.4.17"
   ```

1. `liferay-c2p9.zip/c2p9-impl/build.gradle` 파일을 열고 라인을 추가합니다. 

   ```groovy
    compileOnly group: "org.osgi", name: "osgi.cmpn"
    jsCompile group: "com.liferay", name: "com.liferay.dynamic.data.mapping.form.field.type"
    ```

1. `liferay-c2p9.zip/c2p9-impl/package.json` 파일을 엽니다. `devDependencies` 줄을 교체하여 시작합니다. 

   ```json
    "@liferay/portal-7.4": "*"
   ```

다음 두 줄로: 

   ```json
    "@liferay/portal-7.2": "*",
    "metal-tools-soy": "4.3.2"
   ```

그런 다음 기존 `스크립트` 내용(두 줄)을 다음 세 줄로 바꿉니다. 

   ```json
   "build": "npm run build-soy && npm run build-js && liferay-npm-bundler",
   "build-js": "babel --source-maps -d build/resources/main/META-INF/resources src/main/resources/META-INF/resources",
   "build-soy": "metalsoy --externalMsgFormat \"Liferay.Language.get('\\$2')\" --soyDeps \"./node_modules/clay-*/src/**/*.soy\" \"./node_modules/com.liferay.dynamic.data.mapping.form.field.type/META-INF/resources/+(FieldBase|components)/**/*.soy\""
   ```

1. `liferay-c2p9.zip/c2p9-impl/bnd.bnd` 파일을 열고 다음 줄을 추가합니다. 

   ```properties
   Provide-Capability:\
    soy;\
        type:String="LiferayFormField"
   ```

1. `liferay-c2p9.zip/c2p9-impl/.babelrc.js` 의 내용을 다음으로 바꿉니다. 

   ```js
   module.exports = {
       presets: ['@babel/preset-env'],
   };
   ```

**체크포인트:** 프로젝트가 7.2 프런트 엔드 프레임워크를 예상하도록 재구성되었으므로 양식 필드 프로젝트의 프런트 엔드를 교체해야 합니다.

1. 기존 `Slider.es.js` 파일을 제거하고 다음 세 파일을 생성하여 교체합니다.
   
      - `Slider.es.js`: MetalJS + Soy 프런트 엔드를 사용하는 새로운 슬라이더 구성 요소입니다. 

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

   - `Slider.soy`: 필드의 Soy 템플릿입니다. 
     
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

   - `SliderRegister.soy`: Slider의 Soy 템플릿에 대한 등록 코드입니다. 

      ```shell
      {namespace SliderRegister}

      {deltemplate PageRenderer.RegisterFieldType variant="'slider'"}
          {call Slider.render data="all" /}
      {/deltemplate}
      ```

1. `DDMFormFieldType` 에 대한 약간의 조정이 필요합니다. 필드의 식별자( `이름`)는 Soy 템플릿에서 문자열 리터럴로 참조되기 때문에 하이픈(`-`)을 가질 수 없습니다. `C2P9DDMFormFieldType` 클래스를 열고 하이픈을 제거하십시오.

   - 구성 요소 속성 `ddm.form.field.type.name`
   - `getName`에 의해 반환된 문자열
     
     두 위치의 값은 이제 `c2p9slider`입니다.

1. 프로젝트의 프런트 엔드가 교체되면 실행 중인 Liferay 7.2에 배포합니다. 

   - Liferay 7.2 Docker 컨테이너 실행을 시작하려면 
    
      ```shell
      docker run -it -m 8g -p 8080:8080 liferay/portal:7.2.1-ga2
      ```

   - 재구성된 양식 필드 프로젝트를 배포하려면 `liferay-c2p9.zip` 폴더로 이동하여 다음을 실행합니다. 
  
      ```shell
      ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
      ```

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다. 

   ```bash
   STARTED com.acme.c2p9.impl_1.0.0 [1009]
   ```

양식 필드가 배포되고 Liferay 7.2에서 [사용할 준비](./writing-a-custom-form-field-type.md#use-the-deployed-slider-field) 되었습니다.