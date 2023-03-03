# Liferay npm 번들러 로더 이해

liferay-npm-bundler의 메커니즘은 webpack에서 영감을 받았습니다. webpack과 마찬가지로 liferay-npm-bundler는 최종 출력을 생성하기 전에 프로젝트의 소스 파일을 변환하는 로더를 포함하는 일련의 규칙을 사용하여 파일을 처리합니다.

```{note}
webpack이 단일 JS 번들 파일을 생성하는 동안 liferay-npm-bundler는 AMD 로더를 대상으로 하므로 webpack 및 liferay-npm-bundler 로더는 호환되지 않습니다.
```

로더는 기본 모듈에서 로더의 구성에 따라 소스 파일을 수신하고 새 파일 또는 수정된 파일을 반환하는 함수를 내보내는 npm 패키지입니다. 예를 들어, [babel-loader](https://github.com/liferay/liferay-js-toolkit/tree/master/packages/liferay-npm-bundler-loader-babel-loader) 은 ES6+ JavaScript 파일을 받아 Babel을 실행하고 생성된 소스 맵과 함께 트랜스파일된 ES5 파일을 반환합니다. 이 패턴을 사용하여 사용자 지정 [를](https://help.liferay.com/hc/ko/articles/360037662951-Creating-Custom-Loaders-for-the-liferay-npm-bundler) 수 있습니다. 다음은 몇 가지 로더 함수의 예입니다.

* Babel 또는 TSC를 통해 JavaScript 파일 전달
* CSS를 HTML 페이지에 동적으로 삽입하는 JS 모듈로 CSS 파일 변환
* SASS로 CSS 파일 처리
* [IDL(Interface Description Language)](https://en.wikipedia.org/wiki/Interface_description_language) 파일을 기반으로 코드를 생성하는 도구 만들기

로더는 프로젝트의 `.npmbundlerrc` 파일을 통해 구성됩니다. 로더의 구성은 두 가지 주요 옵션을 사용하여 지정됩니다.

* `sources`: 처리할 소스 파일이 포함된 폴더
* `규칙`: 로더, 옵션(해당되는 경우) 및 처리할 파일을 결정하는 정규식.

구성 요구 사항 및 옵션에 대한 자세한 내용은 [`.npmbundlerrc`의 구조 이해](./npmbundlerrc-structure.md#package-processing-options) 를 참조하세요.

로더는 체인으로 연결할 수 있습니다. 로더는 `use` 속성에 나열된 순서대로 파일을 처리합니다. 파일은 첫 번째 로더로 전달되고, 처리되고, 다음 로더로 전송되는 식으로 규칙에 의해 파일이 처리될 때까지 계속됩니다. sass-loader를 사용하여 SASS 파일을 CSS로 변환한 다음 style-loader를 사용하여 JavaScript 모듈로 변환하는 것과 같은 복잡한 프로세스를 실행할 수 있습니다. 규칙이 적용되면 liferay-npm-bundler는 번들러 플러그인의 pre, post 및 babel 단계를 계속합니다.
