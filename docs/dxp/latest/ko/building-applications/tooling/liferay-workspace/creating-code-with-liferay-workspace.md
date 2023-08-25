# Liferay 워크스페이스로 코드 만들기

Liferay 워크스페이스는 Liferay 개발 프로젝트를 생성하고 관리하기 위한 개발자용 도구입니다.

## 프로젝트 만들기

[Blade CLI](../blade-cli/installing-and-updating-blade-cli.md) 를 사용하면 사전 구축된 프로젝트 템플릿을 제공하여 Liferay Workspace에서 프로젝트를 쉽게 생성할 수 있습니다. 또는 수동으로 프로젝트를 만들 수도 있습니다.

### Blade CLI를 사용하여 프로젝트 생성

1. 작업 공간 내부에서 이 명령을 사용하여 원하는 작업과 가장 유사한 프로젝트 템플릿을 찾습니다:

   ```bash
   blade create -l
   ```

1. 사용하려는 템플릿을 확인했으면 프로젝트를 생성합니다. 예를 들어 MVC 포틀릿을 만들려면 다음 명령을 사용합니다:

   ```bash
   blade create -t mvc-portlet -p com.acme.z3x1.portlet -c MyPortlet myproject-web
   ```

   그러면 MVC 포틀릿 템플릿을 사용하여 프로젝트를 생성하고(`-t mvc-portlet`), 지정한 Java 패키지에서 포틀릿 클래스를 생성하고(`-p com.acme.z3x1.portlet`), 포틀릿 클래스 이름을 지정하고(`-c MyPortlet`), 프로젝트 이름을 `myproject-web`로 지정합니다.

### 수동으로 프로젝트 만들기

프로젝트를 생성하는 데 Blade CLI가 필요하지 않습니다. 원하는 경우 프로젝트 폴더를 수동으로 만들 수 있습니다:

1. 작업 공간 내부에서 프로젝트를 저장할 폴더를 만듭니다:

   ```bash
   cd [my project name]
   ```

1. 프로젝트에 대한 `build.gradle` 스크립트를 만듭니다. Liferay Workspace를 사용 중이므로 대부분의 경우 종속성은 하나만 필요합니다:

   ```groovy
   dependencies {
      compileOnly group: "com.liferay.portal", name: "release.portal.api"
   }
   ```

1. 프로젝트의 폴더 구조를 만듭니다.

Liferay DXP에서 실행할 코드를 작성하려면 배포할 Liferay 런타임이 있어야 합니다. 따라서 Liferay Workspace를 설치한 후 가장 먼저 해야 할 일은 작업 공간에 Liferay 번들을 추가하는 것입니다.

### Liferay CLI 도구와 함께 Liferay 워크스페이스 사용

[Liferay CLI](../other-tools/liferay-cli-tool.md) 도구는 Liferay Workspace와 함께 사용할 수 있습니다. 도구를 설치하고 프로젝트를 생성하는 방법을 알아보려면 Liferay CLI 문서를 참조하세요.

```{note}
Liferay 워크스페이스는 자체 노드 버전을 다운로드합니다(즉, 시스템 버전이 아닌 자체 노드 버전). 다른 노드 버전이 필요한 경우 build.gradle 파일에 선언하세요.
```

```gradle
node {
    nodeVersion = "16.18.1"
    npmVersion = "8.19.2"
    ...
}
```

`gw clean` 을 실행하여 빌드 캐시를 정리하세요.

## Liferay 워크스페이스에서 테마 생성기 사용

Liferay 테마 생성기는 사이트의 모양과 느낌을 변경할 수 있는 테마를 만들기 위한 node.js 기반 도구입니다. 이러한 프로젝트는 Liferay Workspace에서 관리할 수도 있습니다. Blade를 사용하거나 수동으로 테마 프로젝트를 만들 수 있습니다.

Blade로 테마 생성기 프로젝트를 생성하려면 다음 명령을 사용합니다:

```bash
blade create -t js-theme [project-name]
```

이렇게 하면 Node.JS와 `yo` 를 다운로드한 다음 `yo liferay-theme` 을 실행하여 시작할 수 있습니다.

Workspace 외부에서 테마 프로젝트를 만들 때와 동일한 방식으로 Workspace에서 테마 프로젝트를 만들 수도 있습니다:

1. 테마 생성기를 설치했다고 가정하고 Liferay 워크스페이스로 이동합니다. 다른 프로젝트와 마찬가지로 테마 프로젝트는 어디에나 배치할 수 있습니다. 다음 명령을 실행하여 테마 프로젝트를 만듭니다:

   ```bash
   yo liferay-theme
   ```

1. 새 테마 폴더로 이동하여 다음을 실행합니다.

   ```bash
   ../gradlew build
   ```

   위의 명령은 워크스페이스 루트에서 한 폴더 아래에 있다고 가정합니다. 프로젝트를 중첩한 경우(예: `테마` 폴더), 그에 따라 `gradlew` 로 호출을 조정하세요. 이 명령은 Liferay의 노드 그래들 플러그인을 사용하여 프런트엔드 테마를 빌드합니다.

Workspace가 프로젝트를 인식하는지 확인하려면 이 명령을 사용하여 모든 프로젝트를 표시하세요:

```bash
./gradlew projects
```

## 워크스페이스에 Liferay 번들 추가하기

Workspace는 코드의 런타임 다운로드 및 설정을 자동화합니다. 서버에서 코드를 실행할 준비가 되면 몇 단계만 거치면 서버를 다운로드할 수 있습니다:

1. 타겟팅하는 Liferay 릴리스를 찾습니다.

   **DXP:** [Liferay Workspace 대상 버전](https://help.liferay.com/hc/en-us/articles/360041818312) 페이지로 이동하여 번들 URL을 클립보드에 복사합니다.

   **CE:** [releases-cdn.liferay.com/portal](https://releases-cdn.liferay.com/portal)로 이동하여 필요한 번들을 찾은 다음 해당 URL을 클립보드에 복사합니다.

1. 워크스페이스의 루트 폴더에서 `gradle.properties` 를 열고 번들 URL 속성을 설정합니다:

   ```properties
   liferay.workspace.bundle.url=[paste the URL from your clipboard]
   ```

   Liferay DXP를 사용하는 경우 이러한 속성도 설정합니다:

   ```properties
   liferay.workspace.bundle.token.download=true
   liferay.workspace.bundle.token.email.address=[enter the email address registered on liferay.com]
   liferay.workspace.bundle.token.password=[enter your liferay.com password]
   ```

   파일을 저장하고 닫습니다.

1. 번들을 다운로드할 준비가 되셨나요? 이 명령을 실행합니다:

   ```bash
   ./gradlew initBundle
   ```

   또는 Blade를 선호한다면,

   ```bash
   blade server init
   ```

DXP를 사용하는 경우 보안상의 이유로 번들을 다운로드한 후 속성 파일에서 비밀번호를 제거해야 합니다.

## Liferay 워크스페이스를 통한 코드 배포

위 단계에서 추가한 Liferay 번들 또는 Liferay를 실행하는 Docker 컨테이너에 코드를 배포할 수 있습니다.

### Liferay 번들에 코드 배포하기

Liferay 워크스페이스에 추가된 번들에 코드를 배포하는 것은 매우 간단합니다. 프로젝트 폴더에서 이 Gradle 작업을 실행합니다:

```bash
../gradlew deploy
```

이렇게 하면 워크스페이스 루트 폴더에 있는 Gradle 래퍼 스크립트가 호출되고 프로젝트가 워크스페이스에 추가된 Liferay 번들에 배포됩니다.

### Liferay 도커 컨테이너에 코드 배포하기

이미 [Liferay Docker 컨테이너를 생성한 경우](./configuring-a-liferay-docker-container.md), 로컬 번들에 배포하는 것만큼이나 쉽게 배포할 수 있습니다. 동일한 Gradle 작업을 실행합니다:

```bash
../gradlew deploy
```

## 관련 주제

* [Liferay 도커 컨테이너 구성하기](./configuring-a-liferay-docker-container.md)
* [Blade CLI로 프로젝트 생성](../blade-cli/generating-projects-with-blade-cli.md)
