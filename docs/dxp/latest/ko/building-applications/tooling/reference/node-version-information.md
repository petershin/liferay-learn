# 노드 버전 정보

Liferay DXP는 다양한 프런트엔드 구성 요소에 대해 [개의 노드](https://nodejs.org/en/) (및 [NPM](https://www.npmjs.com/) )을 사용합니다. 특히 [Liferay 테마 생성기](../../../site-building/site-appearance/themes/theme-development/getting-started/setting-up-an-environment-and-creating-a-theme.md) 및 Liferay의 [JavaScript 애플리케이션 도구](../../developing-a-javascript-application.md) 는 빌드 및 배포를 위해 NPM 명령을 사용해야 합니다.

이러한 종속성은 특정 버전의 Node 및 NPM을 사용하도록 설계되었습니다. 테마 또는 JavaScript 애플리케이션을 개발할 때 올바른 버전이 설치되어 있는지 확인하려면 [노드 버전 호환성 매트릭스](#version-compatibility-matrix) 을 확인하십시오.

## 노드 버전 업데이트

Liferay 설치를 위해 설치된 Node의 이전 버전 또는 지원되지 않는 버전이 있는 경우 올바르게 작동하려면 업데이트해야 할 수 있습니다. Node를 특정 주 버전으로 업데이트하려면 다음 단계를 따르세요.

1. 기존 노드 설치를 제거하십시오.

    ```bash
    sudo apt-get remove node npm
    ```

1. 리포지토리를 업데이트합니다.

    ```bash
    sudo apt-get update
    ```

1. Node.js의 원하는 **주 버전** 을 검색합니다. Liferay DXP 버전에 필요한 노드의 주 버전에 대해 [버전 호환성 매트릭스](#version-compatibility-matrix) 을 확인하십시오.

    ```bash
    curl -sL deb.nodesource.com/setup_##.x | sudo -E bash -
    ```

    예를 들어 Liferay 버전 7.4를 사용하는 경우 버전 Node 버전 `16.x`에 대해 다음을 실행합니다.

    ```bash
    curl -sL deb.nodesource.com/setup_16.x | sudo -E bash -
    ````

1. 하나의 명령어로 Node와 NPM을 설치합니다.

    ```bash
    sudo apt-get install -y nodejs
    ````

1. Node 및 NPM의 예상 버전이 있는지 확인합니다.

    ```bash
    node --version
    ```

    ```bash
    npm --version
    ```

이제 Liferay 설치를 위해 지원되는 Node 및 NPM 버전이 있어야 합니다(지원되는 최신 마이너 버전으로 업데이트됨). 그러나 NPM 버전이 예상 버전과 일치하지 않는 경우 다음 명령을 사용하여 NPM의 특정 버전을 설치할 수 있습니다.

```bash
npm install -g npm@x.x.x
```

## 모듈의 노드 버전 지정

모듈에 특정 버전의 노드가 필요한 경우 모듈의 `build.gradle` 파일에서 이를 구성할 수 있습니다. 예를 들어 모듈에 Node 버전 `10.15.3` 및 NPM 버전 `6.4.1`이 필요한 경우 이 코드를 `build.gradle` 파일에 추가할 수 있습니다.

```
node {
    nodeVersion = "10.15.3"
    npmVersion = "6.4.1"
}
```

## 버전 호환성 매트릭스

| **라이프레이 버전** | **지원되는 노드 버전** | **지원되는 NPM 버전** |
|:------------:|:--------------:|:---------------:|
|     7.0      |     6.6.0      |      6.4.1      |
|     7.1      |     8.15.0     |      6.4.1      |
|     7.2      |    10.15.3     |      6.4.1      |
|     7.3      |    10.15.3     |      6.4.1      |
|     7.4      |    16.13.0     |      8.1.0      |
