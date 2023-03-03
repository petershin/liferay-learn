# npmbundlerrc 구조 이해

liferay-npm-bundler는 위젯 프로젝트의 루트 폴더에 있는 `.npmbundlerrc` 파일을 통해 구성됩니다. 전체 구성을 수동으로 만들거나 구성 사전 설정을 확장할 수 있습니다(Babel을 통해).

기본 사전 설정이 liferay-npm-bundler를 구성하는 방법을 알아보려면 [기본 사전 설정 참조](./how-the-default-preset-configures-the-liferay-npm-bundler.md) 을 참조하십시오.

## 구조

`.npmbundlerrc` 파일에는 4개의 가능한 단계 정의가 있습니다: *copy-process*, *pre-process*, *post-process*, *babel*. 이러한 위상 정의는 아래에서 자세히 설명합니다.

**Copy-Process:** `copy-plugins` 속성으로 정의됨(종속성 패키지에만 사용 가능). 지정된 각 패키지에서 복사하거나 제외해야 하는 파일을 지정합니다.

**전처리:** `플러그인` 속성으로 정의됩니다. Babel 단계가 실행되기 전에 실행할 플러그인을 지정합니다.

**Babel:** `.babelrc` 정의로 정의됩니다. 패키지의 `.js` 파일을 통해 Babel을 실행할 때 사용할 `.babelrc` 파일을 지정합니다.

```{note}
이 단계에서 Babel은 패키지 파일을 변환하지만(예: 필요한 경우 AMD 형식으로 변환) 트랜스파일하지는 않습니다. 이론적으로 적절한 플러그인을 구성하여 트랜스파일할 수도 있습니다. 관련 없는 두 프로세스가 섞이지 않도록 번들러를 실행하기 전에 트랜스파일링하는 것이 좋습니다.
```

**포스트 프로세스:** 포스트 플러그인 `속성으로` 됩니다. *전처리* 단계를 사용하는 대신 Babel 단계가 완료된 후 실행할 플러그인을 지정합니다.

다음은 `.npmbundlerrc` 구성의 예입니다.

```json
{
    "exclude": {
        "*": [
            "test/**/*"
        ],
        "some-package-name": [
            "test/**/*",
            "bin/**/*"
        ],
        "another-package-name@1.0.10": [
            "test/**/*",
            "bin/**/*",
            "lib/extras-1.0.10.js"
        ]
    },
    "include-dependencies": [
        "isobject", "isarray"
    ],
    "output": "build",
    "verbose": false,
    "dump-report": true,
    "config": {
        "imports": {
            "npm-angular5-provider": {
                "@angular/common": "^5.0.0",
            "@angular/core": "^5.0.0"
            }
        }
    },
    "/": {
    "plugins": ["resolve-linked-dependencies"],
    ".babelrc": {
      "presets": ["liferay-standard"]
    },
    "post-plugins": [
            "namespace-packages",
            "inject-imports-dependencies"
        ]
    },
    "*": {
      "copy-plugins": ["exclude-imports"],
      "plugins": ["replace-browser-modules"],
      ".babelrc": {
        "presets": ["liferay-standard"]
      },
      "post-plugins": [
        "namespace-packages",
        "inject-imports-dependencies",
        "inject-peer-dependencies"
      ]
    },
    "packages": {
        "a-package-name": [
        "copy-plugins": ["exclude-imports"],
        "plugins": ["replace-browser-modules"],
        ".babelrc": {
          "presets": ["liferay-standard"]
        },
        "post-plugins": [
          "namespace-packages",
          "inject-imports-dependencies",
          "inject-peer-dependencies"
        ]
        ],
        "other-package-name@1.0.10": [
          "copy-plugins": ["exclude-imports"],
          "plugins": ["replace-browser-modules"],
          ".babelrc": {
            "presets": ["liferay-standard"]
          },
          "post-plugins": [
            "namespace-packages",
            "inject-imports-dependencies",
            "inject-peer-dependencies"
          ]
        ]
    }
}
```

```{note}
위에 표시된 모든 정의 형식(`*`, `some-package-name` 및 `some-package-name@version`)이 필요한 것은 아닙니다. 대부분의 경우 와일드카드 정의(`*`)로 충분합니다. 비와일드카드 형식(`some-package-name` 및 `some-package-name@version`)은 와일드카드 정의가 제공하는 것보다 더 구체적인 구성이 필요한 패키지의 드문 예외입니다.
```

### 표준 구성 옵션

다음은 `.npmbundlerrc` 파일에 대한 표준 구성 옵션입니다.

`config`: 모든 liferay-npm-bundler 및 Babel 플러그인에서 사용할 수 있는 전역 구성을 정의합니다. 각 특정 플러그인에 대해 사용 가능한 옵션을 찾으려면 각 플러그인의 설명서를 참조하십시오.

```json
{
  "config": {
    "imports": {
      "vuejs-provider": {
        "vue": "^2.0.0"
      }
    }
  }
}
```

`dump-report:` 디버깅 보고서 생성 여부를 설정합니다. `true`인 경우 프로젝트 및 npm 모듈을 처리할 때 취해진 모든 작업과 결정을 설명하는 `liferay-npm-bundler-report.html` 파일이 프로젝트 디렉터리에 생성됩니다. 이것을 빌드 플래그 `$ liferay-npm-bundler --dump-report` 또는 `$ liferay-npm-bundler -r`으로 전달할 수도 있습니다. 기본값은 `거짓`입니다.

`no-tracking:` 사용 분석을 당사 서버로 보낼지 여부를 설정합니다. CLI 인수 `$ liferay-npm-bundler --no-tracking`을 사용하거나 `.liferay-npm-bundler-no-tracking` 이라는 마커 파일을 생성하여 이를 빌드 플래그로 전달할 수도 있습니다. 프로젝트의 루트 폴더 또는 그 조상 중 하나 또는 환경 변수 설정 `LIFERAY_NPM_BUNDLER_NO_TRACKING=''`. 기본값은 `거짓`입니다.

`출력:` 기본적으로 번들러는 표준 Gradle 리소스 폴더에 패키지를 씁니다. `build/resources/main/META-INF/resources`. 기본 출력 폴더를 재정의하려면 이 값을 설정합니다. 종속성 npm 패키지는 빌드 폴더 내의 `node_modules` 폴더에 있습니다. `create-jar` 이 설정된 경우 기본 출력 폴더는 `build`입니다.

`사전 설정:` 기본 구성으로 사용할 `liferay-npm-bundler` 사전 설정을 지정합니다. `.npmbundlerrc` 파일이 제공되지 않으면 기본 `liferay-npm-bundler-preset-standard` 사전 설정이 사용됩니다. 사전 설정에서 제공하는 모든 설정은 상속되지만 재정의할 수 있습니다.

`verbose:` 도구가 수행하는 작업에 대한 자세한 정보를 콘솔에 출력할지 여부를 설정합니다. 기본값은 `거짓`입니다.

### 패키지 처리 옵션

`"/"`: 프로젝트 패키지에 대한 플러그인 구성.

`"\"`: 종속성 패키지에 대한 플러그인 구성.

*(별표)*: 모든 npm 패키지에 대한 기본 플러그인 구성을 정의합니다. 여기에는 해당 키로 식별되는 4개의 값이 포함됩니다. 키 `복사 플러그인`, `플러그인` 및 `사후 플러그인` 는 복사, 사전 및 사후 프로세스 단계에 적용할 `liferay-npm-bundler` 플러그인 배열을 식별합니다. Key `.babelrc` 은 Babel 단계에서 사용할 구성을 지정하는 개체를 식별하며 표준 `.babelrc` 파일과 동일한 구조를 갖습니다.

`제외:` 전체 또는 특정 패키지에서 번들링에서 제외할 파일의 glob 표현식을 정의합니다. 각 목록은 다음 키 중 하나로 식별되는 배열입니다. `*` (모든 패키지), `{package name}` (패키지의 모든 버전) 또는 `{package name}@{version}` (패키지의 특정 버전). 다음은 구성 예입니다.

```json
{
  "exclude": {
    "*": ["__tests__/**/*"],
    "is-object": ["test/**/*"],
    "is-array@1.0.1": ["test/**/*", "Makefile"]
  }
}
```

`무시:` 프로젝트에 대한 Babel로 지정된 JavaScript 파일 처리를 건너뜁니다. 다음은 구성 예입니다.

```json
{
  "ignore": ["lib/legacy/**/*.js"]
}
```

`include-dependencies:` `package.json`의 `종속성` 섹션에 나열되지 않은 경우에도 번들링에 포함할 패키지를 정의합니다. 이러한 패키지는 `node_modules` 폴더에서 사용할 수 있어야 합니다(예: `package.json`에 저장하지 않고 수동으로 설치하거나 `devDependencies` 섹션에 나열됨).

`패키지:` 패키지당 npm 패키지에 대한 플러그인 구성을 정의합니다.

`max-parallel-files:` EMFILE 오류를 방지하기 위해 병렬로 처리할 최대 파일 수를 정의합니다(특히 Windows에서). 기본값은 `128`입니다.

`process-serially:` **참고**: v 2.7.0부터 제거되었습니다. `max-parallel-files`로 대체되었습니다.

`규칙:` 로더를 사용하여 프로젝트 소스 파일에 적용할 규칙을 정의합니다. 규칙에는 사용할 로더를 정의하는 `사용` 배열 속성이 있어야 합니다. 이 속성은 패키지 이름 또는 `로더` 및 `옵션` 속성이 있는 개체를 사용하여 지정할 수 있으며 해당하는 경우 아래 속성 중 하나 이상을 사용할 수 있습니다.

* `테스트`: 규칙을 적용할지 여부를 결정하기 위해 `소스` 폴더에 있는 파일을 필터링하는 정규식을 정의합니다. 적합한 각 파일의 프로젝트 상대 경로는 정규식과 비교되며 일치하는 파일은 로더에서 처리됩니다.
* `제외`: 제외할 파일을 지정하여 `테스트` 표현식을 세분화합니다.
* `포함`: 포함할 파일을 지정하여 `테스트` 표현식을 세분화합니다.

다음은 구성 예입니다.

```json
{
  "rules": [
    {
      "test": "\\.js$",
      "exclude": "node_modules",
      "use": [
        {
          "loader": "babel-loader",
          "options": {
            "presets": ["env", "react"]
          }
        }
      ]
    },
    {
      "test": "\\.css$",
      "use": ["style-loader"]
    },
    {
      "test": "\\.json$",
      "use": ["json-loader"]
    }
  ]
}
```

`소스:` 이 프로젝트 폴더의 파일에 규칙이 적용됩니다. 폴더는 중첩될 수 있으며(예: `/src/main/resources/`) POSIX 경로 구분 기호를 사용하여 작성해야 합니다(예: Win32 시스템에서 `\` 대신 `/` 사용). 규칙은 프로젝트의 패키지 종속성 파일에 자동으로 적용됩니다.

다음은 구성 예입니다.

```json
{
  "sources": ["src", "assets"]
}
```

### OSGi 번들 생성 옵션

버전 2.2.0부터 liferay-npm-bundler는 위젯 OSGi 번들을 생성할 수 있습니다.

* **create-jar**: truthy 값으로 설정된 경우 OSGi 번들을 생성합니다. `true`로 설정하면 모든 하위 옵션이 기본값을 사용합니다. 개체가 전달되면 각 하위 옵션을 개별적으로 구성할 수 있습니다. 이것을 빌드 플래그로 전달할 수도 있습니다: `$ liferay-npm-bundler --create-` 또는 `$ liferay-npm-bundler -j`. 기본값은 `거짓`입니다.

```json
{
  "create-jar": true
}
```

* **create-jar.auto-deploy-portlet**: 이 옵션은 더 이상 사용되지 않습니다. 대신 `create-jar.features.js-extender` 옵션을 사용하십시오.

* **create-jar.features.configuration**: 사용할 시스템(OSGi) 및 위젯 인스턴스(포틀릿 사양에 정의된 위젯 환경 설정) 구성을 설명하는 파일을 지정합니다. 기본값은 해당 파일이 있는 경우 `features/configuration.json` 이고 그렇지 않은 경우 기본값은 `undefined`입니다.

```json
{
  "create-jar": {
    "features": {
      "configuration": "features/configuration.json"
    }
  }
}
```

* **create-jar.output-dir:** 최종 JAR을 배치할 사이트를 지정합니다.

```json
{
  "create-jar": {
    "output-dir": "dist"
  }
}
```

* **create-jar.features.js-extender:** JS Portlet Extender로 OSGi 번들을 처리할지 여부를 제어합니다. 번들에 사용할 Extender의 최소 필수 버전을 지정할 수도 있습니다. 이는 번들에서 고급 기능을 사용하려는 경우 유용할 수 있지만 이전 버전의 Extender에 배포할 수 있도록 하려는 경우에 유용할 수 있습니다. Extender의 모든 버전에서 번들을 배포할 수 있도록 문자열 `"any"` 을 전달합니다. `true`이면 liferay-npm-bundler는 번들에 사용되는 기능에 필요한 Extender의 최소 버전을 자동으로 결정합니다. 기본값은 `참`입니다. 다음은 구성 예입니다.

```json
{
  "create-jar": {
    "features": {
      "js-extender": "1.1.0"
    }
  }
}
```

* **create-jar.features.web-context:** 번들의 정적 리소스를 게시하는 데 사용할 컨텍스트 경로를 지정합니다. 기본값은 `{project version}{project name}`.

```json
{
  "create-jar": {
    "features": {
      "web-context": "/my-project"
    }
  }
}
```

* **create-jar.features.localization:** 번들에 사용할 L10N 파일을 지정합니다. 기본 이름을 가진 속성 파일이 존재하는 경우 기본값은 `features/localization/Language` 이고 그렇지 않은 경우 기본값은 `undefined`입니다.

```json
{
  "create-jar": {
    "features": {
      "localization": "features/localization/Language"
    }
  }
}
```

* **create-jar.features.settings:** 이 옵션은 더 이상 사용되지 않습니다. 대신 `create-jar.features.configuration` 옵션을 사용하십시오.

```{note}
플러그인의 구성은 모든 가능한 단계에서 플러그인을 구성하는 옵션과 Babel을 실행할 때 사용할 `.babelrc` 파일을 지정합니다( [Babel 문서](https://babeljs.io/docs/usage/babelrc/ 참조) ) 해당 파일 형식에 대한 자세한 내용은 참조하십시오.
```

```{note}
liferay-npm-bundler 버전 1.4.0 이전에는 패키지 구성이 도구 옵션(`*`, `output`, `exclude` 등) 옆에 배치되었습니다. 패키지 이름 충돌을 방지하기 위해 이제 패키지 구성이 네임스페이스로 지정되고 `packages` 섹션 아래에 배치됩니다. 이전 버전과의 호환성을 유지하기 위해 패키지 구성(`package-name@version`, `package-name` 또는 `*`)이 없는 경우 liferay-npm-bundler는 패키지 구성을 위해 `packages` 외부의 루트 섹션으로 돌아갑니다. `패키지` 섹션에서 찾을 수 있습니다.
```

이제 `.npmbundlerrc` 파일의 구조를 알게 되었습니다!
