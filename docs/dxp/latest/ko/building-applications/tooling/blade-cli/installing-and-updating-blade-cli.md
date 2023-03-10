# 블레이드 CLI 설치 및 업데이트

블레이드 CLI는 명령줄 인터페이스 또는 그래픽 설치 프로그램을 통해 설치할 수 있습니다. 프록시 뒤에 있는 경우 프록시가 설치되면 프록시를 통해 작동하도록 구성할 수 있습니다. 블레이드 CLI는 새 버전이 출시되면 알려주며 언제든지 CLI에서 업그레이드할 수 있습니다.

## 블레이드 CLI 설치

Blade CLI를 설치하는 방법에 관계없이 Java JDK 구현이 먼저 설치되어 있는지 확인하십시오.

### CLI에서 설치

Linux 및 Mac 운영 체제용 Blade CLI 설치는 한 줄 명령입니다.

```bash
curl -L https://raw.githubusercontent.com/liferay/liferay-blade-cli/master/cli/installers/local | sh
```

설치가 완료되면 `블레이드가 성공적으로 설치되었습니다` 메시지가 나타납니다. 새 명령줄을 열고 `blade`를 입력합니다. 명령을 찾을 수 없음 오류가 발생하면 [경로에 `blade` 명령을 추가해야 합니다](./troubleshooting-blade-cli.md#the-blade-command-is-not-available-in-my-cli ) .

### 그래픽 설치 프로그램에서 설치

설치 프로그램이 더 편하다면 최신 [Liferay 프로젝트 SDK 설치 프로그램](https://github.com/liferay/liferay-ide/releases/) 을 다운로드하여 실행하세요.

1. Java 런타임을 선택합니다. 이것은 자동 감지되어야 합니다.

    ![Liferay Workspace 설치 프로그램이 설치된 JDK를 자동 감지합니다.](./installing-and-updating-blade-cli/images/01.png)

1. 소개가 끝나면 **다음** 을 클릭합니다.

1. 설치 중에 [Liferay Workspace](../liferay-workspace/what-is-liferay-workspace.md)를 초기화할 수 있습니다. Liferay Workspace는 Liferay 프로젝트를 관리할 시스템의 환경(폴더 집합)입니다. 지금 초기화하려면 사이트를 설정하십시오.

    ![Liferay Workspace는 Liferay 프로젝트를 관리하는 파일 시스템의 폴더 집합입니다.](./installing-and-updating-blade-cli/images/02.png)

1. Liferay Workspace를 초기화하는 경우 다음으로 Liferay DXP 또는 Community Edition을 선택해야 합니다.

    ![설치 프로그램의 기본값은 Community Edition이지만 DXP를 선택할 수 있습니다.](./installing-and-updating-blade-cli/images/03.png)

    제품 유형을 선택하고 **다음** 을 클릭합니다.

1. **다음** 을 클릭하여 블레이드 CLI를 설치합니다.

Windows 환경에서 `blade` 명령은 Windows에서 또는 Mac 및 Linux에서 `bash` 또는 `zsh`를 사용하는 경우 경로에 자동으로 추가됩니다. 자세한 내용은 [블레이드 CLI 문제 해결](./troubleshooting-blade-cli.md) 를 참조하십시오. 

## 프록시 구성

프록시 서버 뒤에 있는 경우 CLI에서 구성할 수 있습니다.

```bash
jpm command --jvmargs "-Dhttp(s).proxyHost=[your proxy host] -Dhttp(s).proxyPort=[your proxy port]" jpm
```

이제 Blade는 인터넷에서 Liferay 샘플 및 템플릿에 액세스할 때 프록시 서버를 사용할 수 있습니다.

## 블레이드 CLI 업데이트

Blade CLI를 사용하면 업데이트가 있는지 확인합니다. 업데이트가 있는 경우 명령이 완료되면 다음 메시지가 표시됩니다.

```bash
Update available 3.9.1 -> 3.9.2
Run `blade update` to install
```

Blade를 업데이트하려면 다음 명령을 실행하십시오.

```bash
blade update
```

최첨단 기능을 원하는 경우 선택적으로 더 자주 업데이트되는 스냅샷 버전으로 전환할 수 있습니다.

```bash
blade update -s
```

스냅샷 버전은 불안정할 수 있으므로 위험을 감수하고 사용하십시오.

## 블레이드 명령

다음은 사용 가능한 블레이드 명령에 대한 요약입니다. `blade help [command]`를 입력하면 CLI에서 도움말을 볼 수 있습니다.

| 명령                    | 묘사                                                                                                                                                                                                                                                                                                                                                       |
|:--------------------- |:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `convert`             | 플러그인 SDK 플러그인 프로젝트를 Gradle Workspace 프로젝트로 변환합니다.                                                                                                                                                                                                                                                                                                        |
| `create`              | 사용 가능한 템플릿에서 새 Liferay 프로젝트를 만듭니다.                                                                                                                                                                                                                                                                                                                       |
| `deploy`              | 프로젝트를 빌드하고 Liferay에 배포합니다.                                                                                                                                                                                                                                                                                                                               |
| `extension install`   | 블레이드 CLI에 확장을 설치합니다.                                                                                                                                                                                                                                                                                                                                     |
| `extension uninstall` | Blade CLI에서 확장을 제거합니다.                                                                                                                                                                                                                                                                                                                                   |
| `gw`                  | 감지된 경우 Gradle Wrapper를 사용하여 Gradle 명령을 실행합니다(예: `blade gw tasks`).                                                                                                                                                                                                                                                                                       |
| `help`                | Blade CLI의 명령에 대한 정보를 제공합니다.                                                                                                                                                                                                                                                                                                                             |
| `init`                | 새로운 Liferay Workspace를 초기화합니다.                                                                                                                                                                                                                                                                                                                           |
| `samples`             | 샘플 프로젝트를 생성합니다.                                                                                                                                                                                                                                                                                                                                          |
| `server init`         | Liferay Workspace의 `gradle.properties` 파일에 구성된 Liferay 서버를 초기화합니다. `liferay.workspace.bundle.url` 속성을 설정하여 초기화할 서버를 구성합니다.                                                                                                                                                                                                                               |
| `server start`        | 백그라운드에서 Liferay 서버를 시작합니다. `-d` 플래그를 추가하여 디버그 모드에서 서버를 시작할 수 있습니다. 디버그 모드는 `-p` 태그를 추가하여 사용자 정의 원격 디버깅 포트(기본값은 Tomcat의 경우 `8000` , WildFly의 경우 `8787` 임) 및/또는 부울 `-s` 태그를 추가하여 사용자 정의할 수 있습니다. 디버거가 연결될 때까지 시작된 서버를 일시 중단합니다.                                                                                                                            |
| `server stop`         | Liferay 서버를 중지합니다.                                                                                                                                                                                                                                                                                                                                       |
| `server run`          | 전경에서 Liferay 서버를 시작합니다. 자세한 내용은 `서버 시작` 속성을 참조하세요.                                                                                                                                                                                                                                                                                                       |
| `sh`                  | Liferay DXP에 연결하고 Gogo 명령을 실행하고 출력을 반환합니다. 예를 들어 `blade sh lb` 은 Gogo 셸을 사용하는 모든 번들을 나열합니다.                                                                                                                                                                                                                                                              |
| `update`              | 블레이드 CLI를 최신 버전으로 업데이트합니다.                                                                                                                                                                                                                                                                                                                               |
| `upgradeProps`        | 이전 `Portal-ext.properties` 및 새로 설치된 7.x 서버를 분석하여 속성이 OSGi 구성 파일로 이동되었거나 제품에서 제거되었음을 표시합니다.                                                                                                                                                                                                                                                               |
| `watch`               | 배포된 프로젝트의 변경 사항을 감시하고 변경 사항이 감지되면 자동으로 재배포합니다. 이 명령은 변경 사항이 감지될 때마다 프로젝트를 다시 빌드하고 설치에 복사하지 않고 대신 런타임에 참조로 설치합니다. 즉, Liferay DXP는 프로젝트의 캐시된 복사본을 만들지 않으므로 프로젝트 파일에 대한 변경 사항을 즉시 볼 수 있습니다. `감시` 작업을 취소하면 모듈이 자동으로 제거됩니다. `blade deploy -w` 명령은 변경 사항이 감지될 때마다 프로젝트를 수동으로 재컴파일하고 배포한다는 점을 제외하면 `blade watch`과 유사하게 작동합니다. 속도는 느리지만 재시작 사이에 배포된 프로젝트를 보존합니다. |
| `version`             | 블레이드 CLI에 대한 버전 정보를 표시합니다.                                                                                                                                                                                                                                                                                                                               |
