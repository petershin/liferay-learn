# 기본 번들러 로더

기본적으로 liferay-npm-bundler에 대해 여러 개의 [로더](./understanding-bundler-loaders.md) 을 사용할 수 있습니다.

* [`babel-loader`](https://github.com/liferay/liferay-js-toolkit/tree/master/packages/liferay-npm-bundler-loader-babel-loader): [Babel](https://babeljs.io/)로 소스 파일을 처리합니다. 이렇게 하면 번들러 이전에 추가 빌드 단계를 피할 수 있습니다.
* [`copy-loader`](https://github.com/liferay/liferay-js-toolkit/tree/master/packages/liferay-npm-bundler-loader-copy-loader): 소스 파일(정적 자산)을 출력 폴더에 복사합니다.
* [`css-loader`](https://github.com/liferay/liferay-js-toolkit/tree/master/packages/liferay-npm-bundler-loader-css-loader): 로드된 후 DOM에 삽입되는 JavaScript 모듈로 CSS 파일을 변환합니다.
* [`json-loader`](https://github.com/liferay/liferay-js-toolkit/tree/master/packages/liferay-npm-bundler-loader-json-loader): JSON 파일의 내용을 객체로 내보내는 JavaScript 모듈을 생성하므로 `require()` 호출에 JSON 파일을 포함할 수 있습니다.
* [`sass-loader`](https://github.com/liferay/liferay-js-toolkit/tree/master/packages/liferay-npm-bundler-loader-sass-loader): 소스 파일에서 `node-sass` 또는 `sass` 을 실행하므로 정적 CSS 파일을 생성할 수 있습니다. `style-loader`전에 연결할 수 있습니다.
* [`style-loader`](https://github.com/liferay/liferay-js-toolkit/tree/master/packages/liferay-npm-bundler-loader-style-loader): 로드된 후 CSS 내용을 DOM에 삽입하는 JavaScript 모듈로 CSS 파일을 변환합니다. 그런 다음 `require()` 호출로 CSS 파일을 포함할 수 있습니다.

liferay-npm-bundler 로더의 사용 사례는 [liferay-js-toolkit 로더 쇼케이스](https://github.com/izaera/liferay-js-toolkit-showcase/tree/loaders) 을 참조하십시오. 기본 로더가 요구 사항을 충족하지 않는 경우 [Bundler용 사용자 정의 로더 생성](https://help.liferay.com/hc/en-us/articles/360037662951-Creating-Custom-Loaders-for-the-liferay-npm-bundler) 의 지침에 따라 고유한 로더를 생성할 수 있습니다.
