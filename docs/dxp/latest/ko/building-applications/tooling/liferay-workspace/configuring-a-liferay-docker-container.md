# Liferay Docker 컨테이너 구성

컨테이너 생성 및 배포는 최신 개발자 워크플로의 중요한 부분입니다. Liferay Workspace를 사용하면 Docker 컨테이너를 개발 및 완전히 포함된 작업 구성 생성에 쉽게 사용할 수 있습니다.

컨테이너 생성은 세 가지 주요 단계로 이루어집니다.

1. 컨테이너에 필요한 Docker 이미지를 선택합니다.
1. 해당 컨테이너를 작업 공간에 다운로드합니다.
1. 설정 및 애플리케이션으로 컨테이너를 구성합니다.

아래 지침을 따르기 전에 Docker가 설치되어 실행 중이어야 합니다.

## Liferay 도커 이미지 선택

이미지 버전은 Workspace 버전에서 상속되기 때문에 대부분의 경우 Liferay Docker 이미지를 선택할 필요가 없습니다. 그러나 작업공간에서 지정한 것과 다른 이미지 버전을 설치해야 하는 경우 버전을 명시적으로 설정할 수 있습니다. 이 작업을 수행할 필요가 없으면 다음 섹션으로 건너뜁니다.

Liferay의 Docker 이미지는 [Docker Hub](https://hub.docker.com/r/liferay/portal/tags) 에 있습니다. 두 가지 범주로 나뉩니다.

- [라이프레이/포털](https://hub.docker.com/r/liferay/portal)
- [라이프레이/DXP](https://hub.docker.com/r/liferay/dxp)

1. 위의 링크를 사용하여 필요한 Liferay 컨테이너 버전을 찾으십시오.
1. 컨테이너의 전체 태그 이름을 나열하는 `docker pull` 명령에 유의하십시오. 태그 이름은 `liferay/dxp:7.3.10-ga1` 또는 `liferay/portal:7.3.6-ga7`과 같습니다.
1. Liferay Workspace에서 `gradle.properties` 을 엽니다.
1. 속성 `liferay.workspace.docker.image.liferay`을 사용하여 Docker 태그를 지정합니다. 여기 예시들이 있습니다 :

   ```properties
   liferay.workspace.docker.image.liferay=liferay/dxp:7.3.10-ga1
   ```

   ```properties
   liferay.workspace.docker.image.liferay=liferay/portal:7.3.6-ga7
   ```

1. 파일을 저장합니다. 이제 Docker 이미지를 만들 준비가 되었습니다.

## Liferay 도커 이미지 생성

작업 공간의 루트 폴더에서 다음 명령을 실행합니다.

   ```bash
   ./gradlew createDockerContainer
   ```

`-liferay` 이 추가된 작업 영역 이름을 기반으로 하는 Docker 이미지가 생성됩니다. 예를 들어 작업 공간 폴더가 `my-project`인 경우 Docker 컨테이너는 `my-project-liferay`입니다. 다른 Docker 이미지와 마찬가지로 컨테이너를 시작/중지할 수 있지만 먼저 구성하는 것이 좋습니다.

## Docker 이미지 구성

컨테이너 구성을 위한 일반 Docker 도구 외에도 Gradle 작업에서 컨테이너를 빌드하면 [Liferay Home](../../../installation-and-upgrades/reference/liferay-home.md) 을 가리키는 폴더가 설정되므로 필요한 모든 Liferay 구성을 만들 수 있습니다. 이 폴더는 `configs/docker`에서 찾을 수 있습니다.

예를 들어 컨테이너의 Gogo 셸에 대한 텔넷 액세스를 활성화할 수 있습니다. 방법은 다음과 같습니다.

1. `configs/docker` 폴더에서 `portal-ext.properties` 파일을 만들고 이 속성을 추가합니다.

   ```properties
   module.framework.properties.osgi.console=0.0.0.0:11311
   ```

1. 파일을 저장합니다.

1. 컨테이너를 시작합니다. 방금 만든 `portal-ext.properties` 파일에 포함된 속성이 실행 중인 인스턴스에 적용되며 다음 명령을 사용하여 Gogo 셸에 텔넷으로 연결할 수 있어야 합니다.

```bash
telnet localhost 11311
```

Docker 구성은 여러 환경을 처리할 수 있는 더 큰 [작업 영역 구성](configuring-liferay-workspace.md) 의 일부입니다. 이를 사용하는 경우 `configs/common` 에 저장된 구성이 `configs/docker` 폴더에 있는 구성과 병합됩니다. 
