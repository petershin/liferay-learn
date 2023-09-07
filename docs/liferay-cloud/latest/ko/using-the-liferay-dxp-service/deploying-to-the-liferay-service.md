# Liferay 서비스에 배포

다른 서비스와 마찬가지로 사용자 지정 추가 기능을 배포하려면 구성 또는 파일을 Git 리포지토리의 적절한 위치에 추가해야 합니다. 그러나 Liferay 서비스를 배포하는 것은 다른 서비스를 배포하는 것과 약간 다릅니다.

Liferay 서비스는 [Liferay 작업 공간이란 무엇입니까?](https://learn.liferay.com/dxp/latest/ko/building-applications/tooling/liferay-workspace/what-is-liferay-workspace.html) 를 사용하여 [배포 가능한 파일](#deploying-themes-portlets-and-osgi-modules) , [소스 코드](#building-and-deploying-source-code) 등을 추가할 수 있는 더 많은 옵션을 제공합니다. 이러한 기능은 [CI 빌드](../build-and-deploy/overview-of-the-liferay-cloud-deployment-workflow.md)에 쉽게 포함되지만, [CLI 도구](../reference/command-line-tool.md)를 사용하는 경우 Liferay 서비스를 위해 특별히 [추가 단계](#cli-tool-deployment) 가 필요합니다.

## Liferay DXP 도커 이미지 정의하기

Liferay 서비스 이미지(다른 서비스와 마찬가지로 `LCP.json` 파일에 정의됨)는 Liferay DXP Docker 이미지와 동일하지 않습니다. Liferay DXP Docker 이미지에 따라 Liferay 서비스에서 실행되는 Liferay의 정확한 버전(수정 팩 포함)이 결정됩니다. 이는 리포지토리의 `liferay/gradle.properties` 파일에 정의되어 있으며, `liferay.workspace.docker.image.liferay` 속성이 있습니다.

사용 중인 DXP 버전에 맞는 이미지를 찾으려면 [Liferay DXP Docker 태그](https://hub.docker.com/r/liferay/dxp/tags) 를 확인하세요.

```{important}
Liferay 서비스의 `LCP.json` 파일의 `image` 속성에 정의된 DXP의 메이저 버전 번호는 `liferay/gradle.properties`의 `liferay.workspace.docker.image.liferay` 속성의 메이저 버전과 **일치**해야 합니다. 이 두 가지가 다른 경우 배포 후 Liferay 서비스가 시작되지 않을 수 있습니다.
```

## CLI 도구 배포

[CLI 도구(](../reference/command-line-tool.md) )를 사용하여 배포하려면 사용자 지정 및 구성과 함께 배포하는 추가 단계가 필요합니다. 배포하기 전에 생성되는 특별한 `Dockerfile` 이미지에 포함되어야 합니다.

[배포 가능한 파일](#deploying-themes-portlets-and-osgi-modules) , [빌드 소스 코드](#building-and-deploying-source-code) , [핫픽스](#deploying-hotfixes) , [라이선스](#deploying-licenses) 는 CLI 도구를 사용하는 경우 배포에 포함해야 하는 추가 단계가 필요합니다. [CI 서비스](../platform-services/continuous-integration.md) 를 사용하여 리포지토리에서 빌드를 생성하는 경우에는 이러한 추가 단계가 필요하지 않습니다.

**CLI를 사용하여 Liferay 서비스를 정상적으로 배포하는 경우(모든 서비스를 한 번에 배포하는 경우 또는 `liferay/` 디렉토리에서 배포하는 경우), 사용자 지정이 포함되지 않은 기본 버전** 의 Liferay DXP 이미지( `LCP.json`에 정의된 주요 버전 사용)가 배포됩니다. 사용자 지정이 포함되도록 하려면 서비스와 함께 모든 사용자 지정을 구체적으로 빌드하고 배포해야 하기 때문에 이런 일이 발생합니다.

다음 단계에 따라 사용자 지정한 Liferay 서비스를 배포하세요:

1. `liferay/` 디렉터리의 명령줄에서 실행합니다:

   ```bash
   gw clean createDockerfile deploy
   ```

  이렇게 하면 모든 사용자 정의가 빌드되어 `build/liferay/` 하위 폴더에 정렬됩니다. 또한 사용자 지정 버전의 DXP를 위해 특별히 `Dockerfile` 을 추가합니다.

1. `LCP.json` 파일을 새로 생성된 `build/docker/` 하위 폴더에 복사합니다.

1. 이 하위 폴더에서 평소와 같이 `lcp deploy` 명령을 실행합니다.

이렇게 하면 기본 버전 대신 사용자 지정 서비스가 배포됩니다.

## 테마, 포틀릿 및 OSGi 모듈 배포하기

테마, 포틀릿 또는 OSGi 모듈을 설치하려면 Liferay DXP 서비스 디렉토리의 `configs/{ENV}/deploy/` 폴더에 WAR 또는 JAR 파일을 포함시킵니다.

예를 들어, 사용자 지정 JAR 파일을 개발 환경( `dev/` 환경 폴더 사용)에 배포하려면 Liferay DXP 서비스 디렉터리는 다음과 같을 수 있습니다:

```
liferay
  ├── LCP.json
  └── configs
      └── dev
          ├── deploy
          │   └── com.liferay.apio.samples.portlet-1.0.0.jar
          ├── osgi
          ├── patching
          ├── scripts
          └── portal-ext.properties
```

배포가 완료되면 `configs/{ENV}/deploy/` 디렉터리 내의 모든 파일은 Liferay 서비스 컨테이너의 `$LIFERAY_HOME/deploy/` 폴더로 복사됩니다.

```{note}
이미지가 배포될 때 특정 파일 및 구성이 강제로 존재해야 하며, 추가된 파일을 덮어쓸 수 있습니다. 서비스 로그에서 'DXPCloud Liferay Overrides'라는 메시지를 확인하여 파일이 재정의된 시점을 파악하세요.
```

## 소스 코드 빌드 및 배포

새로 추가된 기능의 소스 코드도 CI 빌드에 포함할 수 있습니다. 빌드가 시작되면 소스 코드가 자동으로 컴파일됩니다.

CI 빌드는 이러한 폴더 내에서 소스 코드를 컴파일합니다:

* `liferay/modules` 폴더에 새 모듈이 있습니다.
* 사용자 지정 테마를 위한 `liferay/themes` 폴더
* `liferay/wars` 폴더에 폭발한 WAR이 있습니다.

배포가 완료되면 배포 가능한 `.jar` 또는 `.war` 파일이 Liferay 서비스 컨테이너의 `$LIFERAY_HOME/deploy/` 폴더에 복사됩니다. 이는 CI의 빌드에서 코드를 컴파일하거나 배포 전에 사용 가능한 [Gradle 명령(](#cli-tool-deployment) )을 사용하여 직접 코드를 생성할 때 발생합니다.

## 핫픽스 배포

핫픽스를 적용하려면, 핫픽스 ZIP 파일을 Liferay DXP 서비스 디렉터리 내의 `configs/{ENV}/patching/` 폴더에 추가합니다. 이 변경 사항을 배포하면 Liferay DXP 인스턴스에 핫픽스가 적용됩니다.

```{note}
대신 새 [패치 유형 이해](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier/understanding-patch-types-for-dxp-7-3-and-earlier.html#service-packs) 과 같은 새로운 부 버전(예: 새 [서비스 팩])으로 업데이트하려면 [이 지침](./updating-your-dxp-instance-to-a-new-minor-version.md)을 참조하세요.
```

예를 들어 다음과 같은 구조로 개발 환경에 핫픽스를 배포할 수 있습니다:

```
liferay
  ├── LCP.json
  └── configs
      └── dev
          ├── deploy
          ├── osgi
          ├── patching
          │   └── liferay-hotfix-2-7110.zip
          └── scripts
```

서버를 시작할 때마다 핫픽스를 다시 적용해야 한다는 점에 유의하세요. 따라서 장기적으로 이 폴더에 핫픽스를 추가하는 것보다 `LCP.json` 파일에서 최신 수정 팩 또는 서비스 팩으로 업데이트하는 것이 좋습니다. 이 파일( `liferay/` 디렉터리에 있는)의 `이미지` 환경 변수를 교체하여 Docker 버전을 업데이트할 수 있습니다.

### 환경 변수를 통한 패치 적용

핫픽스를 Git 리포지토리에 직접 커밋하는 대신 CI 빌드 프로세스의 일부로 설치할 수도 있습니다. 이 접근 방식은 대용량 핫픽스에 이상적이므로 리포지토리에 대용량 파일을 보관하는 것을 피할 수 있습니다.

쉼표로 구분된 핫픽스 목록을 `LCP_CI_LIFERAY_DXP_HOTFIXES_{ENV}` 환경 변수(Liferay Cloud 콘솔의 `환경 변수` 탭 또는 `ci` 서비스의 `LCP.json` 파일)에 추가하면 CI 서비스가 빌드 프로세스 중에 자동으로 적용하도록 할 수 있습니다.

```{note}
이 환경 변수를 `ci` 서비스에 대한 `LCP.json`에 추가한 경우, 업데이트를 완료하려면 `ci` 서비스를 **인프라 환경**에 배포해야 합니다.
```

`LCP.json` 파일을 통해 핫픽스를 정의하는 다음 예제를 참조하세요:

```
"env": {
    "LCP_CI_LIFERAY_DXP_HOTFIXES_COMMON": "liferay-hotfix-10-7210,liferay-hotfix-17-7210",
    "LCP_CI_LIFERAY_DXP_HOTFIXES_DEV": "liferay-hotfix-15-7210,liferay-hotfix-33-7210",
}
```

```{note}
이 환경 변수는 최소 버전 4.x.x 서비스로 업그레이드한 경우에만 사용할 수 있습니다. 버전 확인에 대한 자세한 내용은 [서비스 스택 버전 이해](../reference/understanding-service-stack-versions.md)를 참조하세요.
```

## 라이선스 배포

라이센스를 Liferay DXP 서비스 디렉터리 내의 `configs/{ENV}/deploy/` 폴더에 넣어서 추가할 수 있습니다.

예를 들어, Liferay DXP 서비스 디렉터리에 다음과 같은 구조로 개발 환경에 라이선스를 추가할 수 있습니다:

```
liferay
  ├── LCP.json
  └── configs
      └── dev
          ├── deploy
          │   ├── license.xml
          │   └── license.aatf
          ├── osgi
          ├── patching
          └── scripts
```

백그라운드에서 XML 라이선스는 `$LIFERAY_HOME/deploy`로 복사되고, AATF 라이선스는 `$LIFERAY_HOME/data`로 복사됩니다.

## 관련 주제

* [Liferay DXP 서비스 사용](../using-the-liferay-dxp-service.md)
* [Liferay DXP 서비스 구성](./configuring-the-liferay-dxp-service.md)
* [Liferay 클라우드 배포 워크플로 개요](../build-and-deploy/overview-of-the-liferay-cloud-deployment-workflow.md)
* [CLI 도구](../reference/command-line-tool.md)
