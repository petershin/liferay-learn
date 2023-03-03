# Liferay Workspace로 코드 생성

Liferay Workspace는 Liferay 개발 프로젝트를 만들고 관리하기 위한 개발자 도구입니다.

## 프로젝트 생성

[Blade CLI](../blade-cli/installing-and-updating-blade-cli.md) 을 사용하면 사전 구축된 프로젝트 템플릿을 제공하여 Liferay Workspace에서 프로젝트를 쉽게 생성할 수 있습니다. 또는 수동으로 프로젝트를 생성할 수 있습니다.

### 블레이드 CLI를 사용하여 프로젝트 생성

1. 작업 공간 내에서 다음 명령을 사용하여 수행하려는 작업과 가장 일치하는 프로젝트 템플릿을 찾습니다.

   ```bash
   blade create -l
   ```

1. 사용할 템플릿을 식별했으면 프로젝트를 생성합니다. 예를 들어 MVC 포틀릿을 만들려면 다음 명령을 사용합니다.

   ```bash
   blade create -t mvc-portlet -p com.acme.z3x1.portlet -c MyPortlet myproject-web
   ```

   이것은 MVC 포틀릿 템플릿(`-t mvc-portlet`)을 사용하여 프로젝트를 만들고, 지정한 Java 패키지에 포틀릿 클래스를 생성하고(`-p com.acme.z3x1.portlet`), 포틀릿 클래스의 이름을 지정합니다. (`-c MyPortlet`), 프로젝트 이름을 `myproject-web`로 지정합니다.

### 수동으로 프로젝트 만들기

프로젝트를 생성하기 위해 Blade CLI가 필요하지 않습니다. 원하는 경우 프로젝트 폴더를 수동으로 생성할 수 있습니다.

1. 작업 공간 내부에서 프로젝트를 보관할 폴더를 만듭니다.

   ```bash
   cd [my project name]
   ```

1. 프로젝트에 대한 `build.gradle` 스크립트를 생성합니다. Liferay Workspace를 사용하고 있으므로 대부분의 경우 하나의 종속성만 필요합니다.

   ```groovy
   dependencies {
      compileOnly group: "com.liferay.portal", name: "release.portal.api"
   }
   ```

1. 프로젝트의 폴더 구조를 만듭니다.

Liferay DXP에서 실행할 코드를 작성하려면 배포할 Liferay 런타임이 있어야 합니다. 따라서 Liferay Workspace를 설치한 후 첫 번째 작업은 Liferay 번들을 작업 공간에 추가하는 것입니다.

## Liferay Workspace와 함께 테마 생성기 사용

Liferay 테마 생성기는 사이트의 모양과 느낌을 변경하기 위해 테마를 생성하는 node.js 기반 도구입니다. 이러한 프로젝트는 Liferay Workspace에서 관리할 수도 있습니다. Blade를 사용하거나 수동으로 테마 프로젝트를 만들 수 있습니다.

Blade로 Theme Generator 프로젝트를 생성하려면 다음 명령을 사용하십시오.

```bash
blade create -t js-theme [project-name]
```

Node.JS와 `yo` 을 다운로드한 다음 `yo liferay-theme` 을 실행하여 시작할 수 있습니다.

Workspace 외부에서 테마 프로젝트를 생성하는 것과 동일한 방식으로 Workspace에서 테마 프로젝트를 생성할 수도 있습니다.

1. 테마 생성기를 설치했다고 가정하고 Liferay Workspace로 이동합니다. 다른 프로젝트와 마찬가지로 테마 프로젝트를 어디에나 배치할 수 있습니다. 다음 명령을 실행하여 테마 프로젝트를 만듭니다.

   ```bash
   yo liferay-theme
   ```

1. 새 테마 폴더로 이동하여 다음을 실행합니다.

   ```bash
   ../gradlew build
   ```

   위의 명령은 작업 공간 루트에서 한 폴더 아래에 있다고 가정합니다. 프로젝트를 중첩했다면(아마도 `themes` 폴더에) 그에 따라 호출을 `gradlew` 으로 조정합니다. 이 명령은 Liferay의 Node Gradle 플러그인을 사용하여 프런트 엔드 테마를 빌드합니다.

Workspace가 프로젝트를 인식하는지 확인하려면 다음 명령을 사용하여 모든 프로젝트를 표시합니다.

```bash
./gradlew projects
```

## 작업 공간에 Liferay 번들 추가

Workspace는 코드에 대한 런타임 다운로드 및 설정을 자동화합니다. 서버에서 코드를 실행할 준비가 되면 몇 단계만 거치면 코드를 다운로드할 수 있습니다.

1. 목표로 삼고 있는 Liferay 릴리스를 찾으십시오.

   **DXP:** [Liferay Workspace 대상 버전](https://help.liferay.com/hc/ko/articles/360041818312) 페이지로 이동하여 번들 URL을 클립보드에 복사합니다.

   **CE:** [releases-cdn.liferay.com/portal](https://releases-cdn.liferay.com/portal) 을 찾아보고 필요한 번들을 찾은 다음 URL을 클립보드에 복사합니다.

1. 작업 공간의 루트 폴더에서 `gradle.properties` 을 열고 번들 URL 속성을 설정합니다.

   ```properties
   liferay.workspace.bundle.url=[paste the URL from your clipboard]
   ```

   Liferay DXP를 사용하는 경우 다음 속성도 설정합니다.

   ```properties
   liferay.workspace.bundle.token.download=true
   liferay.workspace.bundle.token.email.address=[enter the email address registered on liferay.com]
   liferay.workspace.bundle.token.password=[enter your liferay.com password]
   ```

   파일을 저장하고 닫습니다.

1. 번들을 다운로드할 준비가 되셨습니까? 다음 명령을 실행합니다.

   ```bash
   ./gradlew initBundle
   ```

   또는 Blade를 선호한다면,

   ```bash
   blade server init
   ```

DXP의 경우 보안상의 이유로 번들이 다운로드된 후 속성 파일에서 암호를 제거해야 합니다.

## Liferay Workspace를 통해 코드 배포

위 단계에서 추가한 Liferay 번들 또는 Liferay를 실행하는 Docker 컨테이너에 코드를 배포할 수 있습니다.

### Liferay 번들에 코드 배포

Liferay Workspace에 추가된 번들에 코드를 배포하는 것은 간단합니다. 프로젝트 폴더에서 다음 Gradle 작업을 실행합니다.

```bash
../gradlew deploy
```

이것은 Workspace 루트 폴더에서 Gradle 래퍼 스크립트를 호출하고 Workspace에 추가된 Liferay 번들에 프로젝트를 배포합니다.

### Liferay Docker 컨테이너에 코드 배포

Liferay Docker 컨테이너 [을 이미 생성](./configuring-a-liferay-docker-container.md)경우 로컬 번들에 배포하는 것만큼 쉽게 배포할 수 있습니다. 동일한 Gradle 작업을 실행합니다.

```bash
../gradlew deploy
```

## 관련 주제

* [Liferay Docker 컨테이너 구성](./configuring-a-liferay-docker-container.md)
* [Blade CLI로 프로젝트 생성](../blade-cli/generating-projects-with-blade-cli.md)
