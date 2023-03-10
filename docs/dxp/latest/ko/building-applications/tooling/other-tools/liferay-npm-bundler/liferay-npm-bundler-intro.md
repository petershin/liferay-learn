# Liferay npm 번들러

liferay-npm-bundler는 플랫폼으로 Liferay Portal을 대상으로 하는 번들러(예: [Webpack](https://webpack.github.io/) 또는 [Browserify](http://browserify.org/) )이며 위젯에서 npm 패키지를 사용한다고 가정합니다(일반적인 웹 애플리케이션과 반대).

위젯 내에서 npm 패키지를 실행하는 작업 흐름은 표준 번들러와 약간 다릅니다. 단일 파일에 JavaScript를 **대신 전체 웹 페이지가 어셈블될 때 브라우저에서 모든 패키지를 함께 연결해야** . 그런 다음 위젯은 각각 고유한 복사본을 로드하지 않고 공통 버전의 모듈을 공유할 수 있습니다. liferay-npm-bundler가 이를 처리합니다.

```{note}
[프로젝트의 Wiki](https://github.com/liferay/liferay-npm-build-tools/wiki) 에서도 liferay-npm-bundler에 대한 정보를 찾을 수 있습니다.
```

## Liferay npm 번들러가 내부적으로 작동하는 방식

liferay-npm-bundler는 위젯 프로젝트를 가져오고 해당 파일(npm 패키지 포함)을 빌드 폴더에 출력하므로 표준 위젯 빌드(Gradle)가 OSGi 번들을 생성할 수 있습니다. [OSGi 번들 및 npm 패키지 구조](./the-structure-of-osgi-bundles-containing-npm-packages.md) 참조에서 빌드 폴더의 구조에 대해 자세히 알아볼 수 있습니다.

liferay-npm-bundler는 아래 프로세스를 사용하여 OSGi 번들을 생성합니다.

1. 프로젝트의 `package.json` 파일을 출력 디렉터리에 복사합니다.
1. 프로젝트의 종속성 트리를 탐색하여 종속성을 확인합니다.
1. 프로젝트를 위해,

    ㅏ. 규칙을 통해 `.npmbundlerrc` 구성에 지정된 소스 파일을 실행합니다.

    비. 구성된 플러그인으로 프로젝트 패키지를 전처리합니다.

    씨. 프로젝트 내부의 각 `.js` 파일에 대해 구성된 플러그인으로 [Babel](https://babeljs.io/) 을 실행합니다.

    디. 구성된 플러그인으로 프로젝트 패키지를 사후 처리합니다.

1. 각 npm 패키지 종속성에 대해

    ㅏ. npm 패키지를 출력 폴더에 복사하고 번들 이름을 앞에 붙입니다. 번들러는 표준 node_modules 트리 형식이 아닌 일반 **bundle-name$package** @ **version** 형식으로 패키지를 저장합니다. 무엇을 복사할지 결정하기 위해 번들러는 플러그인을 호출하여 패키지 파일 목록을 필터링합니다.

     비. 패키지 파일에 대한 규칙을 실행합니다.

     씨. 구성된 플러그인으로 npm 패키지를 전처리합니다.

     디. npm 패키지 내 각 `.js` 파일에 대해 구성된 플러그인으로 [Babel](https://babeljs.io/) 을 실행합니다.

     이자형. 구성된 플러그인으로 npm 패키지를 사후 처리합니다.

전처리 단계와 후처리 단계의 유일한 차이점은 실행 시점입니다(각각 Babel 실행 전 또는 후). 이 워크플로 중에 liferay-npm-bundler는 구성된 모든 플러그인을 호출하여 npm 패키지에서 변환(예: `package.json` 파일 수정 또는 파일 삭제 또는 이동)을 수행할 수 있습니다.

```{note}
이전, 이후 및 Babel 단계는 이전 작업 모드용으로 설계되었습니다([새 모드를 사용하도록 프로젝트 마이그레이션](./bundler-migration-guide/migration-to-the-new-mode.md) 참조). 자세한 내용은 참조) 새 모드에 대한 규칙으로 점진적으로 대체됩니다.
```

이 참조는 liferay-npm-bundler의 구성, 기본 사전 설정, 형식 등을 다룹니다.
