# AMD 로더 구성을 내보내는 방법

```{note}
Liferay AMD 로더가 작동하는 방식을 이해하지 못하는 경우 먼저 [Liferay AMD 모듈 로더](./understanding-bundler-loaders.md)를 읽어보십시오.
```

[중복 제거](./how-portal-publishes-npm-packages.md#package-de-duplication) 을 사용하면 `/o/js_loader_modules` URL에서 반환된 구성을 통해 Liferay AMD Loader에서 JavaScript 모듈을 사용할 수 있습니다.

아래 표시된 OSGi 번들은 이 문서에서 참조용으로 사용됩니다.
<!-- TODO: Update the following bullets into an actual dir structure diagram akin to: https://learn.liferay.com/liferay-cloud/latest/en/reference/upgrading-your-liferay-cloud-stack.html#preparing-to-upgrade -->
* `my-bundle/`
    * `META-INF/`
        * `resources/`
            * `package.json`
                * 이름: 내 번들 패키지
                * 버전: 1.0.0
                * 메인: 라이브러리/인덱스
                * 종속성:
                    * isarray: 2.0.0
                    * isobject: 2.1.0
                * ...
            * `lib/`
                * `index.js`
                * ...
            * ...
            * `node_modules/`
                * `isobject@2.1.0/`
                    * `package.json`
                        * 이름: isobject
                        * 버전: 2.1.0
                        * 메인: 라이브러리/인덱스
                        * 종속성:
                            * isarray: 1.0.0
                        * ...
                    * ...
                * `isarray@1.0.0/`
                    * `package.json`
                        * 이름: isarray
                        * 버전: 1.0.0
                        * ...
                    * ...
                * `isarray@2.0.0/`
                    * `package.json`
                        * 이름: isarray
                        * 버전: 2.0.0
                        * ...
                    * ...

예를 들어 위 구조의 경우 [OSGi 번들 및 npm 패키지 구조](./the-structure-of-osgi-bundles-containing-npm-packages.md)에서 설명한 대로 Liferay AMD 로더가 사용할 수 있도록 아래 구성이 게시됩니다.

```javascript
Liferay.PATHS = {
...
  'my-bundle-package@1.0.0/lib/index': '/o/js/resolved-module/my-bundle-package@1.0.0/lib/index',
  'isobject@2.1.0/index': '/o/js/resolved-module/isobject@2.1.0/index',
  'isarray@1.0.0/index': '/o/js/resolved-module/isarray@1.0.0/index',
  'isarray@2.0.0/index': '/o/js/resolved-module/isarray@2.0.0/index',
  ...
}
Liferay.MODULES = {
  ...
  "my-bundle-package@1.0.0/lib/index.es": {
    "dependencies": ["exports", "isarray", "isobject"],
    "map": {
      "isarray": "isarray@2.0.0", 
      "isobject": "isobject@2.1.0"
    }
  },
  "isobject@2.1.0/index": {
    "dependencies": ["module", "require", "isarray"],
    "map": {
      "isarray": "isarray@1.0.0"
    }
  },
  "isarray@1.0.0/index": {
    "dependencies": ["module", "require"],
    "map": {}
  },
  "isarray@2.0.0/index": {
    "dependencies": ["module", "require"],
    "map": {}
  },
  ...
}
Liferay.MAPS = {
  ...
  'my-bundle-package@1.0.0': { value: 'my-bundle-package@1.0.0/lib/index', exactMatch: true}
  'isobject@2.1.0': { value: 'isobject@2.1.0/index', exactMatch: true},
  'isarray@2.0.0': { value: 'isarray@2.0.0/index', exactMatch: true},
  'isarray@1.0.0': { value: 'isarray@1.0.0/index', exactMatch: true},
  ...
}
```

주:

* `Liferay.PATHS` 속성은 JavaScript 모듈 파일에 대한 경로를 설명합니다.
* `Liferay.MODULES` 속성은 각 모듈의 종속성 이름과 버전을 설명합니다.
* `Liferay.MAPS` 속성은 패키지 기본 모듈의 별칭을 설명합니다.
