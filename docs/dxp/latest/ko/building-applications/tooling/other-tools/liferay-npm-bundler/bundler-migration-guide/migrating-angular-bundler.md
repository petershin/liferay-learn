# Liferay npm Bundler 2.x를 사용하도록 Angular 프로젝트 마이그레이션

liferay-npm-bundler 2.x를 사용하도록 Angular 프로젝트를 마이그레이션하려면 다음 단계를 따르십시오. liferay-npm-bundler 1.x는 일부 변환 단계를 수행하기 위해 Babel에 의존했지만 이제 이러한 변환은 버전 2.x에서 자동으로 적용됩니다. 따라서 프로젝트에서 Babel을 제거해야 합니다.

1. `package.json` 의 `liferay-npm-bundler` 종속성을 버전 2.x로 업데이트합니다.

    ```json
    {
      "devDependencies": {
...
        "liferay-npm-bundler": "^2.0.0",
        ...
      },
      ...
    }
    ```

1. liferay-npm-bundler 2.x에는 기본적으로 이러한 종속성이 포함되어 있으므로 `package.json`에서 모든 `liferay-npm-bundler-preset-*` 종속성을 제거합니다.
1. `.npmbundlerrc` 파일에서 구성한 번들러 사전 설정을 제거합니다. liferay-npm-bundler 2.x에는 모든 프레임워크를 자동으로 처리하는 하나의 스마트 사전 설정이 포함되어 있습니다.
1. `tsconfig.json` 파일을 열고 `"module": "amd"` 컴파일러 옵션을 아래 표시된 구성으로 대체하여 CommonJS 모듈을 생성합니다.

    ```json
    {
      "compilerOptions": {
        ...
        "module": "commonjs",
        ...
      }
    }
    ```

1. `.babelrc` 파일을 삭제하여 Babel 구성을 제거합니다.
1
아래 구성과 일치하도록 `package.json` 빌드 프로세스에서 Babel을 제거합니다.

    ```json    
    {
      "스크립트": {
        "빌드": "tsc && liferay-npm-bundler"
      },
...
    }
    ```

1. `package.json`에서 다음 Babel 종속성을 제거합니다. **devDependencies** :

    ```json
    "babel-cli": "6.26.0",
    "babel-preset-liferay-amd": "1.2.2"
    ```

엄청난! 프로젝트가 liferay-npm-bundler 2.x를 사용하도록 마이그레이션되었습니다.

## 관련 정보

* [AMD용 npm 모듈 포맷](../how-the-bundler-formats-js-modules.md)
* [liferay-npm-bundler 1.x와 2.x 사이에 변경된 사항](../changes-between-bundler-1-x-and-2-x.md)
