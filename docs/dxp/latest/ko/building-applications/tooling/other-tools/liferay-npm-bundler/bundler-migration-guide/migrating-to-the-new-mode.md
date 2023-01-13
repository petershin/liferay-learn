# liferay-npm-bundler의 새 모드를 사용하도록 프로젝트 마이그레이션

[issue #303](https://github.com/liferay/liferay-js-toolkit/issues/303)부터 liferay-npm-bundler에 대해 두 가지 작동 모드를 사용할 수 있습니다. 번들러가 실행되기 전에 파일을 사전 처리하거나 번들러를 사용하여 웹팩(규칙 세트를 통해 소스 파일 처리)과 유사하게 전체 프로세스를 처리할 수 있습니다. 번들러가 전체 프로세스를 처리할 수 있도록 프로젝트를 새 구성 모드를 사용하도록 마이그레이션하려면 다음 단계를 따르세요.

1. 프로젝트의 `package.json` 파일을 열고 liferay-npm-bundler만 사용하도록 `빌드` 스크립트를 업데이트합니다.

    구 버전:

    ```json
    {
      "scripts":{
        "build": "babel --source-maps -d build src && liferay-npm-bundler"
      }
    }
    ```

    새로운 버전:

    ```json
    {
      "scripts":{
        "build": "liferay-npm-bundler"
      }
    }
    ```

1. 프로젝트의 `.npmbundlerrc` 파일에서 번들러가 사용할 규칙을 정의합니다(예: 파일 변환을 위해 babel 실행). 아래 예제 구성은 `babel-loader` 을 사용하여 JavaScript 파일을 변환하는 규칙을 정의합니다. 기본 로더의 전체 목록은 [기본 로더 참조](../default-bundler-loaders.md) 을 참조하십시오. [Bundler용 사용자 정의 로더 생성](https://help.liferay.com/hc/en-us/articles/360037662951-Creating-Custom-Loaders-for-the-liferay-npm-bundler) 의 단계에 따라 사용자 정의 로더를 생성합니다. liferay-npm-bundler는 babel을 사용하여  `/src/` 의 `*.js` 파일을 처리하고 결과를 기본 `/build/` 폴더에 기록합니다.

    ```json
    {
      "sources": ["src"],
      "rules": [
        {
          "test": "\\.js$",
          "exclude": "node_modules",
          "use": [
            {
              "loader": "babel-loader",
              "options": {
                "presets": ["env"]
              }
            }
          ]
        }
      ]
    }
    ```

    ```{note}
    liferay-npm-bundler의 새 모드는 webpack과 매우 유사하게 작동하지만 **webpack과 호환되지 않습니다**. Webpack은 단일 JavaScript 번들 파일을 생성하고 liferay-npm-bundler는 AMD 로더를 대상으로 합니다.
    ```

## 관련 정보

* [기본 liferay-npm-bundler 로더](../default-bundler-loaders.md)
* [liferay-npm-bundler의 로더 이해](../understanding-bundler-loaders.md)
