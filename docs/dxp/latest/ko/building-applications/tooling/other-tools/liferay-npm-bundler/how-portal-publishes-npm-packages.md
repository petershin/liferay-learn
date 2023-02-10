# 번들러가 npm 패키지를 게시하는 방법

지정된 [구조](./the-structure-of-osgi-bundles-containing-npm-packages.md)을 사용하여 OSGi 번들을 배포하면 표준 URL을 통해 해당 모듈을 사용할 수 있습니다. 해결된 모듈을 더 잘 설명하기 위해 아래 예제 구조는 liferay-npm-bundler 1.x가 생성하는 표준 구조입니다. 2.x 버전이 생성하는 네임스페이스 패키지가 없습니다. liferay-npm-bundler 2.0은 아래 설명된 대로 이 중복 제거 메커니즘을 재정의하여 격리된 종속성과 가져오기를 구현합니다.

- `my-bundle/`
    - `META-INF/`
        - `resources/`
            - `package.json`
                - 이름: 내 번들 패키지
                - 버전: 1.0.0
                - 메인: 라이브러리/인덱스
                - 종속성:
                    - isarray: 2.0.0
                    - isobject: 2.1.0
                - ...
            - `lib/`
                - `index.js`
                - ...
            - ...
            - `node_modules/`
                - `isobject@2.1.0/`
                    - `package.json`
                        - 이름: isobject
                        - 버전: 2.1.0
                        - 메인: 라이브러리/인덱스
                        - 종속성:
                            - isarray: 1.0.0
                        - ...
                    - ...
                - `isarray@1.0.0/`
                    - `package.json`
                        - 이름: isarray
                        - 버전: 1.0.0
                        - ...
                    - ...
                - `isarray@2.0.0/`
                    - `package.json`
                        - 이름: isarray
                        - 버전: 2.0.0
                        - ...
                    - ...

위에 표시된 예제 OSGi 번들을 배포하는 경우 다음 URL을 사용할 수 있습니다(각 모듈당 하나씩).

* [http://localhost/o/js/module/598/my-bundle-package@1.0.0/lib/index.js](http://localhost/o/js/module/598/my-bundle-package@1.0.0/lib/index.js)

* [http://localhost/o/js/module/598/isobject@2.1.0/index.js](http://localhost/o/js/module/598/isobject@2.1.0/index.js)

* [http://localhost/o/js/module/598/isarray@1.0.0/index.js](http://localhost/o/js/module/598/isarray@1.0.0/index.js)

* [http://localhost/o/js/module/598/isarray@2.0.0/index.js](http://localhost/o/js/module/598/isarray@2.0.0/index.js)

```{note}
OSGi 번들 ID(598)는 다를 수 있습니다.
```

## 패키지 중복 제거

둘 이상의 OSGi 모듈이 동일한 패키지 및 버전의 여러 복사본을 내보낼 수 있으므로 Liferay Portal은 *해결 모듈*이라는 새로운 개념을 사용하여 이러한 충돌을 중복 제거해야 합니다.

해결된 모듈은 동일한 패키지 및 버전의 여러 복사본이 존재할 때 Liferay Portal의 프런트 엔드로 내보낸 참조 패키지입니다. 패키지의 동일한 복사본을 내보내는 여러 번들 중 하나에서 무작위로 참조됩니다.

위의 예를 사용하면 서로 다른 OSGi 번들 내에서 동일한 모듈을 참조하는 각 표준 URL 그룹에 대해 해결된 모듈에 대한 또 다른 표준 URL이 있습니다. 예제 구조에는 아래와 같이 확인된 모듈 URL이 있습니다.

* [http://localhost/o/js/resolved-module/my-bundle-package@1.0.0/lib/index.js](http://localhost/o/js/resolved-module/my-bundle-package@1.0.0/lib/index.js)

* [http://localhost/o/js/resolved-module/my-bundle-package\$isobject@2.1.0/index.js](http://localhost/o/js/resolved-module/my-bundle-package\$isobject@2.1.0/index.js)

* [http://localhost/o/js/resolved-module/my-bundle-package\$isarray@1.0.0/index.js](http://localhost/o/js/resolved-module/my-bundle-package\$isarray@1.0.0/index.js)

* [http://localhost/o/js/resolved-module/my-bundle-package\$isarray@2.0.0/index.js](http://localhost/o/js/resolved-module/my-bundle-package\$isarray@2.0.0/index.js)

```{note}
OSGi 번들 ID(예제에서는 598)가 제거되고 모듈이 'resolved-module'로 대체됩니다.
```

다음으로 번들러(버전 2.0.0부터)가 패키지 종속성을 분리하는 방법을 배울 수 있습니다. 이 변경이 이루어진 이유에 대한 자세한 내용은 [What Changed Between liferay-npm-bundler 1.x and 2.x](./changes-between-bundler-1-x-and-2-x.md) 을 참조하십시오.

## 격리된 패키지 종속성

liferay-npm-bundler 2.x로 생성된 일반적인 OSGi 번들 구조는 다음과 같습니다.

- `my-bundle/`
    - `META-INF/`
        - `resources/`
            - `package.json`
                - 이름: 내 번들 패키지
                - 버전: 1.0.0
                - 메인: 라이브러리/인덱스
                - 종속성:
                    - 내 번들 패키지$isarray: 2.0.0
                    - 내 번들 패키지$isobject: 2.1.0
                - ...
            - `lib/`
                - `index.js`
                - ...
            - ...
            - `node_modules/`
                - `my-bundle-package$isobject@2.1.0/`
                    - `package.json`
                        - 이름: my-bundle-package$isobject
                        - 버전: 2.1.0
                        - 메인: 라이브러리/인덱스
                        - 종속성:
                            - 내 번들 패키지$isarray: 1.0.0
                        - ...
                    - ...
                - `my-bundle-package$isarray@1.0.0/`
                    - `package.json`
                        - 이름: my-bundle-package$isarray
                        - 버전: 1.0.0
                        - ...
                    - ...
                - `my-bundle-package$isarray@2.0.0/`
                    - `package.json`
                        - 이름: my-bundle-package$isarray
                        - 버전: 2.0.0
                        - ...
                    - ...

각 패키지 종속성은 번들 이름(예제 구조에서`my-bundle-package$` )으로 네임스페이스가 지정됩니다. 이렇게 하면 각 프로젝트가 자체 종속성을 로드하고 동일한 패키지를 내보내는 프로젝트와의 잠재적인 충돌을 피할 수 있습니다. 예를 들어 아래의 두 위젯 프로젝트를 고려하십시오.

- `my-widget`
    - 패키지.json
        - 종속성:
            - a-라이브러리 1.0.0
            - 도우미 1.0.0
    - node_modules
        - 도서관
            - 버전: 1.0.0
            - 종속성:
                - 도우미 ^1.0.0
        - 도우미
            - 버전: 1.0.0

- `another-widget`
    - 패키지.json
        - 종속성:
            - a-라이브러리 1.0.0
            - 도우미 1.2.0
    - node_modules
        - 도서관
            - 버전: 1.0.0
            - 종속성:
                - 도우미 ^1.0.0
        - 도우미
            - 버전: 1.2.0

이 예에서 `a-library` 은 버전 1.0.0 이상에서 `a-helper` 에 종속됩니다(종속 항목의 캐럿 ^ 표현에 유의). 번들러는 번들 이름을 모듈에 접두사로 지정하여 격리된 종속성을 구현하므로 `my-widget` 은 1.0.0에서 `a-helper` 을 가져오고 `another-widget` 는 1.2에서 `a-helper` 을 얻습니다. .0.

종속성 격리는 번들 간의 충돌을 방지할 뿐만 아니라 각 위젯이 개발될 때 `node_modules` 폴더에 있던 것을 가져오므로 피어 종속성이 결정적으로 작동하도록 합니다.

이제 네임스페이스 모듈이 번들 종속성을 분리하여 충돌을 방지하는 방법을 이해했으므로 다음에 중복 제거에 대해 알아볼 수 있습니다.

## 가져오기를 통한 중복 제거

독립된 종속성은 유용하지만 때때로 모듈 간에 동일한 패키지를 공유하는 것이 더 유익할 수 있습니다. 이를 위해 liferay-npm-bundler는 자체 패키지를 사용하는 대신 외부 OSGi 번들에서 패키지를 가져올 수 있습니다. 이제 하나의 프로젝트에 공유 종속성을 넣고 나머지에서 참조할 수 있습니다.

예를 들어, `my-toolbar`, `my-menu`, `my-content`의 세 가지 위젯이 사이트의 홈 페이지를 구성하는 경우 이 위젯은 가짜지만 멋진 WUI(Wonderful UI Components)에 의존합니다. 뼈대. 이 매우 제한된 프레임워크에는 다음 세 가지 패키지만 포함됩니다.

1.  `component-core`
1.  `button`
1.  `textfield`

번들러는 기본적으로 위젯의 이름으로 각 종속성 패키지에 네임스페이스를 지정하므로 페이지에 WUI 패키지의 네임스페이스가 지정된 복사본 3개가 생성됩니다. 이것은 당신이 원하는 것이 아닙니다. 동일한 패키지를 공유하므로 WUI 패키지를 포함하는 네 번째 번들을 생성하고 세 위젯에서 WUI 패키지를 가져올 수 있습니다. 그 결과 아래와 같은 구조가 됩니다.

- `my-toolbar/`
    - `.npmbundlerrc`
        - 구성:
            - 수입:
                - wui 제공자:
                    - 구성 요소 코어: ^1.0.0
                    - 버튼: ^1.0.0
                    - 텍스트 필드: ^1.0.0
- `my-menu/`
    - `.npmbundlerrc`
        - 구성:
            - 수입:
                - wui 제공자:
                    - 구성 요소 코어: ^1.0.0
                    - 버튼: ^1.0.0
                    - 텍스트 필드: ^1.0.0
- `my-content/`
    - `.npmbundlerrc`
        - 구성:
            - 수입:
                - wui 제공자:
                    - 구성 요소 코어: ^1.0.0
                    - 버튼: ^1.0.0
                    - 텍스트 필드: ^1.0.0
- `wui-provider/`
    - `.package.json`
        - 이름: wui 제공자
        - 종속성:
            - 컴포넌트 코어: 1.0.0
            - 버튼: 1.0.0
            - 텍스트 필드: 1.0.0

번들러는 특정 패키지의 네임스페이스를 전환하여 외부 번들을 가리킵니다. `my-toolbar` 위젯에 다음 코드가 있다고 가정합니다.

```javascript
var Button = require('button');
```

기본적으로 번들러 2.x는 다른 번들에서 가져오지 않은 경우 이를 다음과 같이 변환합니다.

```javascript
var Button = require('my-toolbar$button');
```

단, `버튼` 은 `wui-provider`에서 가져왔기 때문에 대신 아래 값으로 변경됩니다.

```javascript
var Button = require('wui-provider$button');
```

또한 로더가 올바른 버전을 찾을 수 있도록 버전 `^1.0.0` 의 `wui-provider$button` 에 대한 종속성이 `my-toolbar`의 `package.json` 파일에 포함되어 있습니다. 그게 당신이 필요한 전부입니다. 런타임에 `wui-provider$button` 가 필요하면 코드가 `my-toolbar`에서 실행되더라도 `wui-provider`의 컨텍스트로 이동하고 거기에서 하위 종속성을 로드합니다. 상상할 수 있듯이 `wui-provider`의 모듈도 네임스페이스가 지정되어 있고 일단 모듈을 로드하면 계속해서 `wui-provider$` 접두사 모듈이 필요하기 때문에 작동합니다.

## 패키지를 가져올 때의 전략

가져오기를 통한 중복 제거는 강력한 도구이지만 오류가 발생하지 않도록 버전 관리 전략을 설계해야 합니다.

먼저 가져온 종속성을 `.npmbundlerrc` 파일에서만 선언할지 아니면 `package.json` 에서도 선언할지 결정해야 합니다. `.npmbundlerrc` 에 가져온 종속성을 나열하는 것으로 충분합니다. `node_modules` 폴더에 없더라도 로더는 런타임에 이를 찾습니다. `.npmbundlerrc` 에 가져온 종속성을 나열하는 것으로 충분합니다. `node_modules` 폴더에 없는 경우에도 로더는 런타임에 이를 찾습니다. 표준 운영 체제에서 동적 연결 지원에 대한 이전 경험이 있는 경우 이를 DLL 또는 공유 객체로 생각하십시오.

테스트에 사용하거나 컴파일에 필요한 유형(예: Typescript)을 포함하는 경우 종속성을 `node_modules` 에도 설치해야 할 수 있습니다. 이 경우 `package.json`의 `종속성` 또는 `devDependencies` 섹션에 배치할 수 있습니다. 후자에 나열하면 liferay-npm-bundler에 의해 출력 번들에서 자동으로 제외됩니다. 그렇지 않으면 출력에 중복 표시되지 않도록 `.npmbundlerrc` 파일에서 제외해야 합니다.

`package.json` 및 `.npmbundlerrc`모두에 종속성을 나열하는 경우 버전 동기화를 유지하는 방법을 결정합니다. 가장 좋은 조언은 두 파일에서 동일한 버전 제약 조건을 사용하는 것이지만 필요한 경우 그렇게 하지 않기로 결정할 수 있습니다. 예를 들어 테스트를 실행하기 위해 런타임 중에 다른 번들에서 종속성 중 하나를 가져오는 경우를 상상해 보십시오. 버전 제한 ^1.5.1을 사용하고 있다고 가정합니다. 버전 >=1.5.1 및 <2.0.0(^1.5.1이 의미하는 바)으로 코드를 테스트한 경우 런타임 중에 호환되는 버전을 얻는 것이 바람직합니다. 따라서 `.npmbundlerrc` 에서도 ^1.5.1을 사용하여 종속성을 선언합니다.

그러나 ^1.5.1에 대해 개발 중이더라도 좀 더 관대해지고 런타임 중에 더 낮은 버전(예: 1.4.0)을 가져와야 하는 경우가 있습니다. 이 경우 `package.json` 에서 ^1.5.1을 선언하고 `.npmbundlerrc`에서 ^1.0.0을 선언할 수 있습니다.

결국 종속성을 처리하는 방법을 결정하는 것은 사용자에게 달려 있습니다.

1. `package.json` (개발 중)
1. `.npmbundlerrc` (런타임 동안)

런타임에 종속성이 충족되도록 버전 관리 전략을 선택하고 고수하는 것이 좋습니다. 
