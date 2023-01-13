# OSGi 번들 및 npm 패키지 구조

JavaScript 모듈을 배포하려면 프로젝트의 `node_modules` 폴더에서 추출한 npm 종속성을 사용하여 OSGi 번들을 만들고 [Liferay AMD Loader](https://github.com/liferay/liferay-amd-loader)에서 작동하도록 수정해야 합니다. liferay-npm-bundler는 이 프로세스를 자동화하여 아래와 유사한 번들을 생성합니다.

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

`node_modules` 내부의 패키지는 npm 도구와 동일한 형식이며 표준 `node_modules` 폴더에서 복사할 수 있습니다(예: AMD로 변환 등의 처리 후). `node_modules` 폴더는 npm 패키지(동일한 패키지의 다른 버전 포함)를 여러 개 포함하거나 npm 패키지를 전혀 포함하지 않을 수 있습니다.

이제 npm 패키지를 포함하는 OSGi 번들의 구조를 알았으므로 liferay-npm-bundler가 인라인 JavaScript 패키지를 처리하는 방법을 배울 수 있습니다.

## 인라인 JavaScript 패키지

liferay-npm-bundler가 생성하는 결과 OSGi 번들은 `node_modules` 폴더 내에 배치되는 여러 npm 패키지와 함께 하나의 인라인 JavaScript 패키지(예제에서 이름이 `my-bundle-package` 임)를 배포하도록 구성됩니다. 폴더.

인라인 패키지는 OSGi 표준 `META-INF/resources` 폴더에 중첩되어 있으며 표준 npm `package.json` 파일로 정의됩니다.

인라인 패키지는 선택 사항이지만 OSGi 번들당 하나의 인라인 패키지만 허용됩니다. 인라인 패키지는 일반적으로 OSGi 번들에 위젯이 포함된 경우 위젯에 대한 JavaScript 코드를 제공합니다. 아키텍처는 게시된 후 인라인 패키지와 npm 패키지를 구분하지 않습니다. 인라인 패키지는 구성 목적으로만 사용됩니다.

이제 liferay-npm-bundler가 npm 패키지용 OSGi 번들을 생성하는 방법을 알았습니다!
