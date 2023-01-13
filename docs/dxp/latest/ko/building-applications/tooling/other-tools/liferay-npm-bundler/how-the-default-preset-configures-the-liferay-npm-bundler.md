# 번들러 구성 사전 설정 이해

liferay-npm-bundler는 기본 구성 사전 설정인 [`liferay-npm-bundler-preset-standard`](https://github.com/liferay/liferay-npm-build-tools/tree/master/packages/liferay-npm-bundler-preset-standard)과 함께 제공됩니다. `.npmbundlerrc` 파일의 npm 패키지 이름에서 `liferay-npm-bundler` 접두사를 생략할 수 있습니다. 이 사전 설정은 빌드 프로세스를 위한 여러 플러그인을 구성하고 사용자가 직접 재정의하지 않는 한 자동으로 사용됩니다( `.npmbundlerrc` 이 누락된 경우에도). 이 사전 설정으로 liferay-npm-bundler를 실행하면 `liferay-npm-bundler-preset-standard`에서 [구성 파일](https://github.com/liferay/liferay-npm-build-tools/blob/master/packages/liferay-npm-bundler-preset-standard/config.json) 이 적용됩니다.

```json
{
  "/": {
    "plugins": ["resolve-linked-dependencies"],
    ".babelrc": {
      "presets": ["liferay-standard"]
    },
    "post-plugins": ["namespace-packages", "inject-imports-dependencies"]
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
  }
}
```

위의 구성은 모든 npm 패키지(`*`)에 대해 전처리 단계(`플러그인`)가 `replace-browser-modules` 플러그인을 실행해야 한다고 명시합니다. 이것을 `post-plugins` 로 설정하면 대신 post 단계에서 실행됩니다.

```{note}
프로젝트의 `.npmbundlerrc` 파일에 자신의 구성을 추가하여 구성 사전 설정 값을 재정의할 수 있습니다. 예를 들어, 위의 구성 사전 설정 예제를 사용하여 `.npmbundlerrc` 파일에서 고유한 `.babelrc` 값을 정의하여 정의된 "liferay-standard" babelrc 사전 설정을 재정의할 수 있습니다.
```

## Liferay 표준 사전 설정

[`liferay-standard` 프리셋](https://github.com/liferay/liferay-npm-build-tools/tree/master/packages/babel-preset-liferay-standard) 은 다음 플러그인을 패키지에 적용합니다.

* [exclude-imports](https://github.com/liferay/liferay-npm-build-tools/tree/master/packages/liferay-npm-bundler-plugin-exclude-imports): `imports` 섹션에서 선언된 패키지를 빌드에서 제외합니다.

* [inject-imports-dependencies](https://github.com/liferay/liferay-npm-build-tools/tree/master/packages/liferay-npm-bundler-plugin-inject-imports-dependencies): 종속 항목의 `package.json` 파일의 `imports` 섹션에서 선언된 종속 항목을 삽입합니다.

* [inject-peer-dependencies](https://github.com/liferay/liferay-npm-build-tools/tree/master/packages/liferay-npm-bundler-plugin-inject-peer-dependencies): 종속성' `package.json` 파일에 선언된 피어 종속성(프로젝트의 `node_modules` 폴더에서 해결됨)을 삽입합니다.

* [namespace-packages](https://github.com/liferay/liferay-npm-build-tools/tree/master/packages/liferay-npm-bundler-plugin-namespace-packages): 루트 프로젝트의 패키지 이름을 기반으로 하는 네임스페이스 패키지 이름으로 프로젝트별로 패키지를 분리하고 충돌을 방지합니다. 이것은 `package.json` 파일에서 나타나는 각 패키지 이름 앞에 `<project-package-name>$` 를 추가합니다.

* [replace-browser-modules](https://github.com/liferay/liferay-npm-build-tools/tree/master/packages/liferay-npm-bundler-plugin-replace-browser-modules): `browser`/`unpkg`/`jsdelivr` section of `package.json` 아래에 나열된 모듈에 대한 서버 측 파일을 해당하는 브라우저로 바꿉니다.

* [resolve-linked-dependencies](https://github.com/liferay/liferay-npm-build-tools/tree/master/packages/liferay-npm-bundler-plugin-resolve-linked-dependencies): `package.json` 파일(예: 로컬 파일 시스템 또는 GitHub에서 가져온 파일)에 나타나는 연결된 종속성 버전을 프로젝트의 `node_modules` 디렉터리에서 확인된 대로 실제 버전 번호로 바꿉니다.

## 라이프레이 바벨 프리셋

또한 번들러는 다음 플러그인을 호출하는 [babel-preset-liferay-standard](https://github.com/liferay/liferay-npm-build-tools/tree/master/packages/babel-preset-liferay-standard) 사전 설정으로 Babel을 실행합니다.

* [babel-plugin-normalize-requires](https://github.com/liferay/liferay-npm-build-tools/tree/master/packages/babel-plugin-normalize-requires): AMD `require()` 호출을 정규화합니다.

* [babel-plugin-transform-node-env-inline](https://github.com/babel/minify/tree/master/packages/babel-plugin-transform-node-env-inline): `NODE_ENV` 환경 변수를 인라인하고 이진 표현식의 일부인 경우(예: `process.env.NODE_ENV === "development"`) 정적으로 평가하고 교체하십시오.

* [babel-plugin-minify-dead-code-elimination](https://www.npmjs.com/package/babel-plugin-minify-dead-code-elimination): 가능한 경우 인라인 바인딩. 식을 평가하려고 시도하고 결과적으로 도달할 수 없는 항목을 정리합니다.

* [babel-plugin-wrap-modules-amd](https://github.com/liferay/liferay-npm-build-tools/tree/master/packages/babel-plugin-wrap-modules-amd): AMD `define()` 모듈 내부에 모듈을 래핑합니다.

* [babel-plugin-name-amd-modules](https://github.com/liferay/liferay-npm-build-tools/tree/master/packages/babel-plugin-name-amd-modules): 패키지 이름, 버전 및 모듈 경로를 기반으로 AMD 모듈의 이름을 지정합니다.

* [babel-plugin-namespace-modules](https://github.com/liferay/liferay-npm-build-tools/tree/master/packages/babel-plugin-namespace-modules): 루트 프로젝트의 패키지 이름을 기반으로 하는 네임스페이스 모듈로 앞에 `<project-package-name>$`가 붙습니다. 패키지가 프로젝트별로 지역화되고 충돌하지 않도록 각 모듈 이름 모양( `define()` 또는 `require()` 호출)에 대해 AMD `define()` 모듈 내부에 모듈을 래핑합니다.

* [babel-plugin-namespace-amd-define](https://github.com/liferay/liferay-npm-build-tools/tree/master/packages/babel-plugin-namespace-amd-define): AMD `define()` 호출에 접두사를 추가합니다(기본적으로 `Liferay.Loader.`).

이제 `.npmbundlerrc` 에 사용 가능한 구성 사전 설정과 작동 방식을 알게 되었습니다.
