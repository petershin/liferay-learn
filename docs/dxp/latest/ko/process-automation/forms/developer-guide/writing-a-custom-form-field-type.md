# 사용자 정의 양식 필드 유형 작성

Forms 애플리케이션에는 고도로 구성 가능한 많은 [필드 유형이 포함되어 있습니다](../creating-and-managing-forms/forms-field-types-reference.md). 대부분의 사용 사례는 기존 필드 유형 중 하나로 충족됩니다. 사용 사례가 기본 필드 유형으로 충족되지 않는 경우 고유한 필드 유형을 만들 수 있습니다.

![많은 유용한 양식 요소가 있습니다.](./writing-a-custom-form-field-type/images/01.png)

* [예제 프로젝트를 배포하고 작동 방식 확인](#examine-the-custom-form-field-in-liferay)
* [양식 필드의 코드 이해](#understand-the-form-field-s-code)
* [필드에 사용자 지정 설정 추가](#add-custom-settings-to-the-form-field)

```{note}
- **다른 애플리케이션의 양식 필드 유형:** 문서 및 미디어(메타데이터 세트), 웹 콘텐츠(구조) 및 양식 애플리케이션으로 생성된 양식은 모두 동일한 양식 필드를 사용할 수 있습니다. 기본적으로 사용자 지정 양식 필드는 Forms 애플리케이션에서만 사용됩니다. 양식 필드 유형을 활성화해야 하는 애플리케이션을 명시적으로 지정하려면 다음 구성 요소 속성을 추가합니다.

    ```properties
    "ddm.form.field.type.scope=document-library,forms,journal"
    ```

- **프로젝트 호환성:** 예제 프로젝트는 Liferay 7.4에서 실행됩니다. Liferay 7.3을 실행 중인 경우 소스 코드는 호환되지만 [Workspace 프로젝트](../../../building-applications/tooling/liferay-workspace/what-is-liferay-workspace.md) Liferay 7.3용으로 재구성해야 합니다. 이를 수행하는 단계는 아래 지침에 포함되어 있습니다.

    Liferay 7.2를 실행 중인 경우 지원되는 프런트 엔드 프레임워크의 차이로 인해 이 소스 코드가 실행되지 않습니다. 7.2용 C2P9 슬라이더 코드 샘플을 적용하는 방법은 [Liferay 7.2용 사용자 정의 양식 필드 개발](./developing-a-custom-form-field-for-liferay-7-2.md) 참조하십시오.
```

## Liferay에서 사용자 지정 양식 필드 검사

사용자 정의 양식 필드가 작동하는 방식을 보려면 예제를 배포한 다음 새 필드를 사용하여 일부 양식 데이터를 추가하십시오.

### 예제 배포

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르십시오.

1. 사용자 정의 양식 필드 유형 프로젝트를 다운로드하고 압축을 풉니다.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/process-automation/forms/developer-guide/liferay-c2p9.zip -O
    ```

    ```bash
    unzip liferay-c2p9.zip
    ```

1. 모듈 루트에서 빌드 및 배포합니다.

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   ```{tip}
   이 명령은 배포된 jar를 Docker 컨테이너의 /opt/liferay/osgi/modules에 복사하는 것과 동일합니다.
   ```

   ```{note}
   Liferay 7.3의 경우 배포하기 전에 프로젝트를 다음과 같이 조정합니다.
   - `c2p9-impl/package.json`에서 `devDependencies` 참조를 `@liferay/portal-7.4`에서 `@liferay/portal-7.3으로 변경합니다. `.
   - `gradle.properties`에서 `liferay.workspace.product` 값을 `portal-7.3-ga8`으로 변경합니다(GA8보다 새로운 Liferay 7.3 버전을 사용할 수 있는 경우 대신 여기에서 참조하십시오).
   ```

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다.

   ```bash
   STARTED com.acme.c2p9.impl_1.0.0 [1009]
   ```

### 배포된 슬라이더 필드 사용

1. 브라우저에서 <http://localhost:8080>로 엽니다.

1. **사이트 메뉴** &rarr; **콘텐츠 & 데이터** &rarr; **양식** 의 Forms 애플리케이션으로 이동합니다.

1. **추가** 버튼(![Add](./../../../images/icon-add.png))을 클릭하여 양식 작성기를 엽니다.

1. **C2P9 슬라이더** 필드를 양식에 추가하십시오.

1. 레이블, 미리 정의된 값 및 도움말 텍스트를 입력하고 필드를 필수로 만들 수 있습니다. 이러한 설정은 기본 설정으로 제공되는 많은 기본 [](../creating-and-managing-forms/forms-field-types-reference.md) 과 일치합니다.

1. 양식을 게시하고 슬라이더 필드를 사용하여 레코드를 제출하십시오.

![슬라이더를 사용하여 0에서 100 사이의 값을 설정합니다.](./writing-a-custom-form-field-type/images/02.png)

## 양식 필드의 코드 이해

기본 양식 필드에는 Java 클래스와 JavaScript 파일이 포함됩니다. C2P9 Slider 필드에서 `C2P9DDMFormFieldType.java` 추상 클래스 `BaseDDMFormFieldType` 를 확장하고 OSGi 구성 요소에서 해당 메타데이터를 정의하여 `DDMFormFieldType` 구현을 제공합니다.

```{literalinclude} ./writing-a-custom-form-field-type/resources/liferay-c2p9.zip/c2p9-impl/src/main/java/com/acme/c2p9/internal/dynamic/data/mapping/form/field/type/C2P9DDMFormFieldType.java
   :dedent: 0
   :language: java
   :lines: 10-20
```

`ddm.form.field.type.description`: 설명 텍스트에 대한 언어 키를 제공합니다. 변환된 값이 `Language.properties` 파일에 정의되어 있는지 확인하십시오.

`ddm.form.field.type.display.order`: 정수 또는 부동 소수점 값을 설정하여 Form Builder 사이드바에서 필드가 표시되는 사이트를 결정합니다. 동일한 값을 가진 필드는 무작위로 정렬됩니다.

`ddm.form.field.type.icon`: 필드에 사용할 아이콘 유형을 결정합니다. [점토 아이콘](https://clayui.com/docs/components/icon.html) 선택합니다.

`ddm.form.field.type.label`: 레이블 텍스트에 대한 언어 키를 제공합니다. 변환된 값이 `Language.properties` 파일에 정의되어 있는지 확인하십시오.

`ddm.form.field.type.name`: 필드 유형 식별자를 제공합니다. 이것은 내부 및 다른 구성 요소에서 필드를 식별하는 데 사용됩니다.

`getModuleName` 메서드는 `Slider.es.js` 파일 경로를 `NPMResolver` 서비스에 전달합니다.

```{literalinclude} ./writing-a-custom-form-field-type/resources/liferay-c2p9.zip/c2p9-impl/src/main/java/com/acme/c2p9/internal/dynamic/data/mapping/form/field/type/C2P9DDMFormFieldType.java
   :dedent: 1
   :language: java
   :lines: 22-26,38-39
```
일부 경로 정의는 `package.json` 파일에서 수행됩니다( `이름` 선언 및 `스크립트` 섹션에 정의된 `소스 맵` 참조).

`getName` 메서드는 양식 필드 식별자를 반환합니다. 구성 요소 속성 `ddm.form.field.type.name`의 값과 일치해야 합니다.

```{literalinclude} ./writing-a-custom-form-field-type/resources/liferay-c2p9.zip/c2p9-impl/src/main/java/com/acme/c2p9/internal/dynamic/data/mapping/form/field/type/C2P9DDMFormFieldType.java
   :dedent: 1
   :language: java
   :lines: 28-31
```

`isCustomDDMFormFieldType` 은 내부적으로 사용됩니다. `getModuleName` 메서드에서 `NPMResolver.resolveModuleName()` 의 결과를 반환하는 경우 `true` 반환합니다.

```{literalinclude} ./writing-a-custom-form-field-type/resources/liferay-c2p9.zip/c2p9-impl/src/main/java/com/acme/c2p9/internal/dynamic/data/mapping/form/field/type/C2P9DDMFormFieldType.java
   :dedent: 1
   :language: java
   :lines: 33-36
```

`Slider.es.js` 필드에 대한 JavaScript 논리를 제공합니다. 파일에는 두 가지 구성 요소가 정의되어 있습니다. `메인` 및 `슬라이더`.

import 문은 Liferay의 기본 양식 필드인 `dynamic-data-mapping-form-field-type`에서 기능을 가져옵니다. 이들은 나중에 선언된 변수 `FieldBase` 및 `useSyncValue`을 사용하여 호출됩니다.

```{literalinclude} ./writing-a-custom-form-field-type/resources/liferay-c2p9.zip/c2p9-impl/src/main/resources/META-INF/resources/C2P9/Slider.es.js
   :dedent: 0
   :language: js
   :lines: 1-2
```

`const Slider =` 블록은 필드를 정의합니다. 매개변수 `name`, `onChange`, `predefinedValue`, `readOnly`및 `value`로 인스턴스화됩니다.

```{literalinclude} ./writing-a-custom-form-field-type/resources/liferay-c2p9.zip/c2p9-impl/src/main/resources/META-INF/resources/C2P9/Slider.es.js
   :dedent: 0
   :language: js
   :lines: 5-17
```

이러한 매개변수의 값은 일부 다른 매개변수와 함께 양식 필드에 대한 HTML `<input>` 태그를 정의합니다. 중요한 것은 사용자가 선택할 수 있는 `최대` 및 `최소` 값이 현재 하드 코딩되어 있다는 것입니다. 나중에 [변경할 것입니다](#add-custom-settings-to-the-form-field) . 필드의 `값` 삼항 연산자를 사용하여 정의됩니다. 값이 입력되면 사용하십시오. 그렇지 않으면 미리 정의된 값을 사용합니다.

`Main` 구성 요소는 파일 끝에서 내보내집니다. 가져온 `FieldBase`의 하위 요소로 `Slider` 포함합니다. `onChange` 함수는 이벤트가 감지될 때마다(슬라이더가 새 값으로 드래그될 때마다) 슬라이더의 사이트/값을 가져옵니다.

```{literalinclude} ./writing-a-custom-form-field-type/resources/liferay-c2p9.zip/c2p9-impl/src/main/resources/META-INF/resources/C2P9/Slider.es.js
   :dedent: 0
   :language: js
   :lines: 19-55
```

## 양식 필드에 사용자 정의 설정 추가

현재 슬라이더 필드의 최대 및 최소 설정은 하드 코딩되어 있지만 구성 가능하면 더 좋습니다. 양식 필드에 사용자 정의 설정을 추가하려면

- `DDMFormFieldTypeSettings` 클래스를 추가하고 `DDMFormFieldType`에 메서드를 추가하여 백엔드를 조정합니다.
- `DDMFormFieldTemplateContextContributor` 추가하고 `Slider.es.js`에서 설정이 정의되는 방식을 업데이트하여 새 설정을 렌더링하기 위한 프런트 엔드를 조정합니다.

### 백엔드에서 사용자 지정 설정 지원

양식 필드의 설정은 `DDMTypeSettings` 클래스에서 정의되며 `@DDMForm` 주석을 사용하여 필드의 사이드바에 나타나는 양식도 정의합니다. 그런 다음 `DDMFormFieldType` 자체는 새 설정 정의에 대해 알고 있어야 기본 필드 설정 양식을 표시하지 않습니다. `DDMFormFieldContextContributor` 클래스는 새 설정을 React 구성 요소로 보내 최종 사용자에게 보여줍니다.

1. `C2P9DDMFormFieldTypeSettings` Java 클래스를 `com.acme.c2p9.internal.dynamic.data.mapping.form.field.type` 패키지에 추가하십시오.

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

1. 각 설정에는 `레이블` 및 `자리 표시자`의 두 가지 언어 키가 있습니다. `c2p9-impl/src/main/resources/content/Language.properties` 열고 다음 줄을 추가합니다.

   ```properties
   max-value=Maximum Value
   min-value=Minimum Value
   enter-the-bottom-limit-of-the-range=Enter the bottom limit of the range.
   enter-the-top-limit-of-the-range=Enter the top limit of the range.
   ```

1. `getDDMFormFieldTypeSettings` 메서드를 추가/재정의하여 `DDMFormFieldType` 클래스를 업데이트합니다.

   ```java
   @Override
   public Class<? extends DDMFormFieldTypeSettings>
      getDDMFormFieldTypeSettings() {

      return C2P9DDMFormFieldTypeSettings.class;
   }
   ```

### 프런트 엔드에서 사용자 지정 설정 지원

프런트 엔드는 사용자가 입력한 최소값과 최대값을 지원하기 위해 `Slider.es.js` 을 업데이트하고 프런트 엔드가 백엔드에서 설정 값을 받을 수 있도록 `DDMTemplateContextContributor` 업데이트해야 합니다.

1. `com.acme.c2p9.internal.dynamic.data.mapping.form.field.type` 패키지에 `C2P9DDMFormFieldTemplateContextContributor` 클래스를 만듭니다.

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

1. `Slider.es.js`의 JavaScript 구성 요소를 업데이트하여 하드 코딩된 최소값과 최대값을 제거하고 대신 사용자가 해당 값을 입력할 수 있도록 합니다. 전체 파일 내용은 다음과 같습니다.

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

1. 양식 필드 모듈을 재배포합니다. 처리가 완료되면(콘솔에서 STOPPED &rarr; STARTED) Liferay를 다시 시작합니다.

   ```shell
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   ```shell
   docker container restart $(docker ps -lq)
   ```

1. 양식에서 Slider 필드를 다시 테스트하십시오. 이번에는 필드의 사이드바 설정에서 고급 탭으로 이동하여 다른 최소 및 최대 설정을 시도해야 합니다.

   ![이제 최소 및 최대 설정을 구성할 수 있습니다.](./writing-a-custom-form-field-type/images/03.png)
