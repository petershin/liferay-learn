# JavaScript 모듈이 AMD용으로 포맷되는 방법

Liferay AMD 로더는 [AMD 사양](https://github.com/amdjs/amdjs-api/wiki/AMD)을 기반으로 합니다. npm OSGi 번들 내의 모든 모듈은 AMD 형식이어야 합니다. 이는 `정의` 호출 내부에 모듈 코드를 래핑하여 [CommonJS](http://www.commonjs.org/) 모듈에 대해 수행됩니다. liferay-npm-bundler는 모듈을 래핑하여 이 프로세스를 자동화하는 데 도움이 됩니다. [OSGi 번들 및 npm 패키지 구조](./the-structure-of-osgi-bundles-containing-npm-packages.md)에서 아래 구조에 대해 자세히 알아볼 수 있습니다.

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

예를 들어 `my-bundle-package$isobject@2.1.0` 패키지의 `index.js` 파일에는 다음 코드가 포함되어 있습니다.

```javascript
'use strict';

var isArray = require('my-bundle-package$isarray');

module.exports = function isObject(val) {
    return val != null && typeof val === 'object' && isArray(val) === false;
};
```

AMD 형식에 맞게 구성된 업데이트된 모듈 코드는 다음과 같습니다.

```javascript
define(
    'my-bundle-package$isobject@2.1.0/index', 
    ['module', 'require', 'my-bundle-package$isarray'], 
    function (module, require) {
        'use strict';

        var define = undefined;

        var isArray = require('my-bundle-package$isarray');

        module.exports = function isObject(val) {
            return val != null && typeof val === 'object' 
            && isArray(val) === false;
        };
    }
);
```

```{note}
모듈의 이름은 패키지, 버전 및 파일 경로(예: `my-bundle-package$isobject@2.1.0/index`)를 기반으로 해야 합니다. 그렇지 않으면 Liferay AMD 로더에서 찾을 수 없습니다.
```

모듈의 종속성에 유의하십시오: `['module', 'require', 'my-bundle-package$isarray']`.

`module` 및 `require` 은 AMD 사양에 정의된 대로 `module.exports` 개체 및 로컬 `require` 함수에 대한 참조를 가져오는 데 사용해야 합니다.

후속 종속성은 이 모듈이 종속된 모듈을 나타냅니다. 예제에서 `my-bundle-package$isarray` 는 패키지가 아니라 `my-bundle-package$isarray` 패키지의 기본 모듈의 별칭입니다(따라서 `my-bundle-package$isarray/index와 동일함).`).

또한 `package.json` 파일에는 `my-bundle-package$isarray` 가 `my-bundle-package$isarray/index`을 참조하지만 버전 `1.0으로 확인되어야 한다는 것을 알 수 있는 충분한 정보가 있습니다. 이러한 패키지의 .0` , 즉 이 경우 `my-bundle-package$isarray/index` 는 `my-bundle-package$isarray@1.0.0/index`를 나타냅니다.

또한 `var define = undefined; 파일 상단에` 추가. 이것은 `liferay-npm-bundler` 에 의해 도입되어 모듈이 (AMD 환경 대신) CommonJS 환경 내부에 있다고 생각하게 합니다. 이는 일부 npm 패키지가 UMD 형식으로 작성되고 AMD `define()` 호출 내에서 래핑하기 때문에 자체 `define()` 실행을 원하지 않고 CommonJS를 사용하는 것을 선호하기 때문입니다. 내보내기가 `module.exports` 전역을 통해 수행되는 경로.

이제 liferay-npm-bundler가 AMD용 JavaScript 모듈을 포맷하는 방법을 더 잘 이해하게 되었습니다!
