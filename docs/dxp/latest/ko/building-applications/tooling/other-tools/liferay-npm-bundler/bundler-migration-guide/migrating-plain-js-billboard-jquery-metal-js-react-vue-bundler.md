---
uuid: 93d457e7-711c-48dd-bf1b-cb4b07c3a84a
---

# Liferay npm Bundler 2.x를 사용하기 위해 일반 JavaScript, Billboard JS, JQuery, Metal JS, React 또는 Vue JS 프로젝트 마이그레이션

liferay-npm-bundler 2.x를 사용하기 위해 아래 표시된 프레임워크 프로젝트를 마이그레이션하려면 다음 단계를 따르십시오.

* 일반 자바스크립트 프로젝트
* Billboard.js 프로젝트
* 제이쿼리 프로젝트
* Metal.js 프로젝트
* 반응 프로젝트
* Vue.js 프로젝트

소스 파일을 트랜스파일하려면 Babel이 필요하지만 번들러 1.x가 부과한 프로젝트에서 변환에 사용된 Babel 사전 설정을 제거해야 합니다. liferay-npm-bundler 2.x는 기본적으로 다음 변환을 처리합니다.

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

1. liferay-npm-bundler 2.x에는 기본적으로 이러한 종속성이 포함되어 있으므로 `package.json` 에서 `liferay-npm-bundler-preset-*` 종속성을 모두 제거합니다.
1. `.npmbundlerrc` 파일에서 구성한 번들러 사전 설정을 제거합니다. liferay-npm-bundler 2.x에는 모든 프레임워크를 자동으로 처리하는 하나의 스마트 사전 설정이 포함되어 있습니다.
1. 프로젝트의 `.babelrc` 파일에서 *liferay-project* 사전 설정을 제거합니다. 남아 있어야 하는 것은 아래에 표시된 `es2015` 사전 설정입니다.

    ```json
    {
      "presets": ["es2015"]
    }
    ```

    프로젝트에서 React를 사용하는 경우 `react` 사전 설정도 유지되는지 확인하세요.

    ```json    
    {
      "presets": ["es2015", "react"]
    }
    ```

1. `package.json`에서 `babel-preset-liferay-project` 종속성을 제거합니다.

엄청난! 프로젝트가 liferay-npm-bundler 2.x를 사용하도록 마이그레이션되었습니다.

## 관련 정보

* [AMD](../how-the-bundler-formats-js-modules.md)용 npm 모듈 포맷
<!-- * \[Using the NPMResolver API in Your Portlets\](/docs/7-2/frameworks/-/knowledge_base/f/using-the-npmresolver-api-in-your-portlets) TODO: Update link-->
* [liferay-npm-bundler 1.x와 2.x 사이에 변경된 사항](../changes-between-bundler-1-x-and-2-x.md)
