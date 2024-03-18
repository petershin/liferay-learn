# Liferay CLI 도구

Liferay CLI 도구를 사용하면 [Angular](https://angular.io/) , JavaScript, [React](https://reactjs.org/) , 공유 번들 또는 [Vue.js](https://vuejs.org/) 프로젝트를 쉽게 생성하여 Liferay의 REST 및 GraphQL 서비스와 인터페이스할 수 있습니다. `liferay` 명령을 사용하여 프로젝트를 생성, 빌드 및 배포할 수 있습니다.

```{note}
Liferay CLI 도구는 Liferay DXP 7.4+용 JavaScript 애플리케이션 프로젝트를 만드는 데 사용되는 이전 Yeoman 생성기를 대체합니다. 이전 버전의 경우 두 방법 중 하나를 사용할 수 있지만 7.4+의 경우 Yeoman 생성기 대신 CLI 도구를 사용해야 합니다.
```

## CLI 도구 설치

이 명령을 실행하여 로컬 시스템에 CLI 도구를 설치합니다.

```bash
npm install -g @liferay/cli
```

```{note}
CLI 도구를 전체적으로 설치하지 않으려면 `npx`를 사용하여 설치하지 않고 도구의 명령을 실행할 수도 있습니다. 예를 들어 `npx @liferay/cli new [project-name]을 실행하여 [새 프로젝트를 생성](#generating-a-project) 할 수 있습니다.
```

## 프로젝트 생성

`liferay new` 명령을 사용하여 새 [클라이언트 확장](../../client-extensions/frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) 또는 Liferay 플랫폼 프로젝트를 만듭니다.

1. 터미널을 열고 프로젝트를 생성할 사이트로 이동합니다. 다음 명령을 실행합니다.

    ```bash
    liferay new [project-name]
    ```

1. 프롬프트에서 새 프로젝트의 이름을 입력합니다. 이 이름은 ID로 사용됩니다.

1. 원격 앱 프로젝트 또는 Liferay 플랫폼 프로젝트를 생성할지 여부를 선택합니다.

   ![화살표 키를 사용하고 Enter 키를 눌러 원격 앱 또는 Liferay 플랫폼 프로젝트를 선택합니다.](./liferay-cli-tool/images/01.png)

   ```{note}
   [클라이언트 확장](../../client-extensions/frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md)는 Liferay DXP 인스턴스가 실행되는 원격 서버에서 호스팅됩니다. 접근하여 어플리케이션으로 사용할 수 있습니다. Liferay 플랫폼 프로젝트는 Liferay DXP/Portal에 배포할 수 있습니다.
   ```

1. 프롬프트에서 새 프로젝트에 대한 사람이 읽을 수 있는 설명을 입력합니다. 기본값은 "새 프로젝트"입니다.

1. 프로젝트의 대상 플랫폼을 선택합니다. 선택한 대상 플랫폼은 프로젝트의 기본 종속성과 프로젝트를 빌드하는 데 사용되는 규칙을 결정합니다(예: 프로젝트가 대상 플랫폼의 사용 가능한 모든 JavaScript API에 액세스해야 하는지 여부).

   버전 7.1 이상에 대해 Liferay Portal 또는 Liferay DXP 대상 플랫폼을 선택할 수 있습니다. 프로젝트의 `package.json` 파일에서 `@lifray/portal-agnostic` 대상을 정의하는 "Liferay Portal CE(플랫폼의 패키지 공유 안 함)"를 선택할 수도 있습니다. 이 경우 프로젝트에는 Liferay Portal과 함께 번들로 제공되는 추가 패키지가 포함되지 않으며 필요한 유일한 종속성은 빌드 및 번들 도구입니다.

   ```{note}
   Remote App 프로젝트를 선택하면 버전 7.4 이상만 선택할 수 있습니다. `플랫폼 패키지 공유 안 함` 옵션 대신 특정 버전을 선택하면 프로젝트가 Liferay 플랫폼에서 React 패키지를 가져옵니다. 이 옵션은 프로젝트의 크기와 수동 종속성을 줄이지만 해당 버전과 함께 번들로 제공되는 패키지를 사용하도록 프로젝트를 제한합니다.
   ```

1. 프롬프트의 주어진 옵션에서 생성할 프로젝트 유형을 선택합니다.

    ![화살표 키를 사용하고 Enter 키를 눌러 생성할 프로젝트 유형을 선택합니다.](./liferay-cli-tool/images/02.png)

    ```{note}
    Remote App 프로젝트를 생성하도록 선택한 경우 React 유형만 선택할 수 있습니다.
    ```

1. **Liferay 플랫폼 프로젝트를 생성하도록 선택한 경우:** 위젯의 범주를 선택합니다. 범주는 페이지를 편집할 때 위젯 목록에서 정렬되는 방식을 결정합니다. 기본값은 `category.sample` ("Sample" 위젯 범주의 경우)이지만 임의의 사용자 지정 값으로 변경할 수 있습니다.

    **대신 원격 앱 프로젝트를 생성하도록 선택한 경우** : 사용자 정의 요소에 대한 HTML 태그 이름을 선택합니다. 이름은 하나 이상의 하이픈(`-`)을 포함하고 문자로 시작해야 합니다. 그런 다음 Shadow DOM을 사용하여 렌더링할지 여부에 대한 프롬프트(`y` 또는 `n`)에 응답합니다.

CLI 도구는 프로젝트에 대해 선택한 이름으로 새 폴더에 프로젝트를 생성합니다.

## 프로젝트 구축

이 명령을 사용하여 CLI 도구로 만든 프로젝트를 빌드합니다.

```bash
liferay build
```

이렇게 하면 프로젝트가 빌드되고 결과 JAR 파일이 프로젝트의 `dist/` 디렉터리에 저장됩니다. 그런 다음 해당 JAR을 Liferay 인스턴스에 배포할 수 있습니다.

```{note}
CLI 도구로 생성된 프로젝트 내에서 `liferay build`에 대한 별칭으로 `npm run build`를 실행할 수도 있습니다.
```

## 프로젝트 배포

이 명령을 사용하여 프로젝트의 `dist/` 디렉토리에 저장된 JAR 파일을 로컬 Liferay 설치에 배포합니다( [`liferay 빌드`](#building-a-project) 실행 후).

```bash
liferay deploy
```

이 작업을 처음 실행하면 배포할 수 있도록 Liferay 설치 디렉터리를 요청하고 응답을 프로젝트 폴더의 `.liferay.json` 파일에 저장합니다. 배포 사이트를 변경하려면 이 파일에 구성된 디렉터리를 변경합니다.

## 프로젝트의 빌드 파일 지우기

오래된 아티팩트가 빌드를 방해할 때 `clean` 명령을 사용하여 [`빌드`](#building-a-project) 및 [`배포`](#deploying-a-project) 명령으로 생성된 `빌드/` 및 `dist/` 를 삭제합니다.

프로젝트 디렉터리에서 이 명령을 실행하여 다음 폴더를 제거합니다.

```bash
liferay clean
```

## Yeoman Generators로 만든 프로젝트 업그레이드

CLI 도구 명령을 실행하려면 프로젝트를 올바르게 구성해야 합니다. 이전 Yeoman 생성기로 만든 프로젝트( `yo liferay-js` 명령 사용)는 먼저 새 아키텍처로 업그레이드해야 합니다.

```{warning}
`upgrade-project` 명령은 Yeoman 생성기가 생성한 프로젝트의 일부만 업그레이드합니다. 프로젝트에 대한 기타 변경 사항 또는 사용자 정의는 그대로 유지됩니다. 업그레이드를 시도하기 전에 프로젝트를 백업하고 업그레이드가 자신의 변경 사항과 충돌하는 경우 수동으로 변경할 준비를 하십시오.
```

이 명령을 실행하여 Yeoman 생성기로 만든 React, Angular 또는 Vue.js 프로젝트를 Liferay CLI 도구와 함께 작동하도록 업그레이드하십시오.

```bash
liferay upgrade-project
```

## 다른 도구로 만든 프로젝트 조정

Liferay CLI 도구로 배포할 수 있도록 다른 도구로 만든 프로젝트를 조정할 수도 있습니다. 다음 도구로 만든 프로젝트를 조정할 수 있습니다.

* [**React**](https://reactjs.org/) 의 경우: [create-react-app](https://reactjs.org/) 프로젝트 생성기

* [**Angular**](https://angular.io/) 의 경우: [Angular CLI](https://cli.angular.io/) 프로젝트 생성기

* [**Vue.js**](https://vuejs.org/) : [Vue CLI](https://cli.vuejs.org/) 프로젝트 생성기

프로젝트 디렉터리에서 이 명령을 실행하여 다른 생성기로 만든 프로젝트를 조정합니다.

```bash
liferay adapt
```

CLI 도구는 프로젝트의 종속성에서 감지한 프레임워크를 기반으로 프로젝트를 조정합니다. 프로젝트의 `package.json` 파일에서 이러한 특정 종속성( `종속성` 또는 `devDependency`으로 나열됨)을 찾습니다.

* **반응** : `반응 스크립트`

* 각도가 **인 경우** : `@angular/cli`

* **Vue.js** 의 경우: `@vue/cli-service`
