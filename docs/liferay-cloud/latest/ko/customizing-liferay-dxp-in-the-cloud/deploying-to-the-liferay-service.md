# Liferay 서비스에 배포

다른 서비스와 마찬가지로 사용자 지정 추가 항목을 배포하려면 Git 저장소의 적절한 사이트
에 구성이나 파일을 추가해야 합니다. 그러나 Liferay 서비스 배포는 다른 서비스 배포와 약간 다릅니다.

Liferay 서비스는 [Liferay 작업 공간이란 무엇입니까?](https://learn.liferay.com/w/dxp/building-applications/tooling/liferay-workspace/what-is-liferay-workspace) 활용하여 [배포 가능한 파일](#deploying-themes-portlets-and-osgi-modules) , [소스 코드](#building-and-deploying-source-code) 등을 추가할 수 있는 더 많은 옵션을 제공합니다. 이는 [CI 빌드](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md) 에 쉽게 포함되지만 [CLI 도구](../reference/command-line-tool.md) 을 사용하는 경우 Liferay 서비스를 위해 특별히 [추가 단계](#cli-tool-deployment) 필요합니다.

## Liferay DXP Docker 이미지 정의

Liferay 서비스 이미지(다른 서비스와 마찬가지로 `LCP.json` 파일에 정의됨)는 Liferay DXP Docker 이미지와 동일하지 않습니다. Liferay DXP Docker 이미지는 Liferay 서비스에서 실행되는 Liferay의 정확한 버전(수정 팩 포함)을 결정합니다. 이는 저장소의 `liferay/gradle.properties` 파일에 `liferay.workspace.docker.image.liferay` 속성과 함께 정의됩니다.

[Liferay DXP Docker 태그](https://hub.docker.com/r/liferay/dxp/tags) 을 확인하여 DXP 버전에 적합한 이미지를 찾으세요.

```{important}
Liferay 서비스 `LCP.json` 파일의 `image` 속성에 정의된 DXP의 주요 버전 번호는 `liferay/의 `liferay.workspace.docker.image.liferay` 속성에 있는 주요 버전과 **일치해야 합니다**. gradle.properties`. 두 가지가 서로 다른 경우 배포 후 Liferay 서비스가 시작되지 않을 수 있습니다.
```

## CLI 도구 배포

[배포 가능한 파일](#deploying-themes-portlets-and-osgi-modules) , [빌드된 소스 코드](#building-and-deploying-source-code) , [핫픽스](#deploying-hotfixes) , [CLI 도구](../reference/command-line-tool.md) 를 사용하여 [라이선스](#deploying-licenses) 추가하려면 배포하기 전에 생성되는 특수 `Dockerfile` 이미지에 해당 파일을 포함해야 합니다. [CI 서비스](../platform-services/continuous-integration.md) 을 통해 빌드를 배포하는 경우 이러한 추가 단계는 필요하지 않습니다.

CLI를 사용하여 Liferay 서비스를 정상적으로 배포하는 경우(모든 서비스를 한 번에 배포하는 경우 또는 `liferay/` 디렉터리에서) Liferay DXP 이미지의 **기본 버전**(`LCP. 사용자 정의 내용이 포함되지 않은 json`)이 배포됩니다. 이는 포함할 서비스를 사용하여 사용자 지정 항목을 구체적으로 빌드하고 배포해야 하기 때문에 발생합니다.

사용자 정의를 통해 Liferay 서비스를 배포하려면 다음 단계를 따르세요.

1. `liferay/` 디렉토리의 명령줄에서 다음을 실행합니다.

   ```bash
   ./gradlew clean createDockerfile deploy
   ```

   이렇게 하면 모든 사용자 정의 항목이 빌드되어 `build/liferay/` 하위 폴더에 정렬됩니다. 또한 DXP의 맞춤형 버전을 위해 특별히 'Dockerfile'을 추가합니다.

1. `LCP.json` 파일을 새로 생성된 `build/docker/` 하위 폴더에 복사합니다.

1. 이 하위 폴더에서 평소대로 `lcp 배포` 명령을 실행하세요.

그러면 기본 버전 대신 맞춤형 서비스가 배포됩니다.

## 테마, 포틀릿 및 OSGi 모듈 배포

테마, 포틀릿 또는 OSGi 모듈을 설치하려면 Liferay DXP 서비스 디렉터리의 `configs/{ENV}/deploy/` 폴더에 WAR 또는 JAR 파일을 포함시킵니다.

예를 들어 사용자 정의 JAR 파일을 개발 환경에 배포하려면(`dev/` 환경 폴더 사용) Liferay DXP 서비스 디렉터리는 다음과 같습니다.

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

배포되면 `configs/{ENV}/deploy/` 디렉터리 내의 모든 파일은 Liferay 서비스 컨테이너의 `$LIFERAY_HOME/deploy/` 폴더에 복사됩니다.

```{note}
이미지가 배포될 때 특정 파일 및 구성이 강제로 존재해야 하며 추가된 파일을 재정의할 수 있습니다. 파일이 재정의되는 시기를 확인하려면 서비스 로그에서 `DXPCloud Liferay Overrides` 메시지를 찾아보세요.
```

## 소스 코드 빌드 및 배포

새로운 추가 항목의 소스 코드도 CI 빌드에 포함될 수 있습니다. 빌드가 시작되면 소스 코드가 자동으로 컴파일됩니다.

CI 빌드는 다음 폴더 내에서 소스 코드를 컴파일합니다.

* 새 모듈을 위한 `liferay/modules` 폴더
* 사용자 정의 테마를 위한 `liferay/themes` 폴더
* 폭발된 WAR을 위한 `liferay/wars` 폴더

배포되면 배포 가능한 `.jar` 또는 `.war` 파일이 Liferay 서비스 컨테이너의 `$LIFERAY_HOME/deploy/` 폴더에 복사됩니다. 이는 CI의 빌드가 코드를 컴파일하는지 또는 배포 전에 사용 가능한 [Gradle 명령](#cli-tool-deployment) 사용하여 직접 생성하는지 여부에 따라 발생합니다.

## 핫픽스 배포

핫픽스를 적용하려면 Liferay DXP 서비스 디렉터리 내의 `configs/{ENV}/patching/` 폴더에 핫픽스 ZIP 파일을 추가하세요. 이 변경 사항을 배포하면 Liferay DXP 인스턴스에 핫픽스가 적용됩니다.

```{note}
대신 Liferay DXP의 새로운 부 버전(예: 새로운 [패치 유형 이해](https://learn.liferay.com/w/dxp/installation-and-upgrades/maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier/understanding-patch-types-for-dxp-7-3-and-earlier#service-packs) )으로 업데이트하려면 [DXP 인스턴스를 새로운 부 버전으로 업데이트](./updating-your-dxp-instance-to-a-new-minor-version.md) 참조하세요.
```

예를 들어 다음과 같은 구조를 사용하여 개발 환경에 핫픽스를 배포할 수 있습니다.

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

서버가 시작될 때마다 핫픽스를 다시 적용해야 합니다. 이러한 이유로 `LCP.json` 파일에서 Liferay DXP Docker 이미지의 최신 수정 팩 또는 서비스 팩으로 업데이트하는 것이 장기적으로 이 폴더에 핫픽스를 추가하는 것보다 낫습니다. 이 파일(`liferay/` 디렉터리)에서 `image` 환경 변수를 대체하여 Docker 버전을 업데이트할 수 있습니다.

### 환경 변수를 통한 패치

핫픽스를 Git 리포지토리에 직접 커밋하는 대신 CI 빌드 프로세스의 일부로 설치할 수도 있습니다. 이 접근 방식은 대규모 핫픽스에 이상적이므로 저장소에 큰 파일을 보관하지 않아도 됩니다.

CI 서비스가 자동으로 적용되도록 `LCP_CI_LIFERAY_DXP_HOTFIXES_{ENV}환경 변수(Liferay Cloud 콘솔의 `환경 변수`탭을 통해 또는`ci`서비스의`LCP.json\` 파일을 통해)에 핫픽스를 추가합니다. 빌드 프로세스. 여러 버그 수정이 필요한 경우 지원팀에 요청하여 단일 핫픽스로 패키징하세요.

```{note}
`ci` 서비스의 `LCP.json`에 이 환경 변수를 추가하는 경우 업데이트를 완료하려면 `ci` 서비스를 **인프라 환경**에 배포해야 합니다.
```

`LCP.json` 파일에 핫픽스를 정의하는 다음 예를 참조하세요.

```
"env": {
    "LCP_CI_LIFERAY_DXP_HOTFIXES_COMMON": "liferay-hotfix-17-7210",
    "LCP_CI_LIFERAY_DXP_HOTFIXES_DEV": "liferay-hotfix-33-7210"
}
```

```{note}
이 환경 변수는 서비스 버전 4.xx 이상으로 업그레이드한 경우에만 사용할 수 있습니다. 버전 확인에 대한 자세한 내용은 [서비스 스택 버전 이해](../reference/understanding-service-stack-versions.md) 을 참조하세요.
```

## 라이센스 배포

Liferay DXP 서비스 디렉터리 내의 'configs/{ENV}/deploy/' 폴더에 라이선스를 넣어 추가할 수 있습니다.

예를 들어 Liferay DXP 서비스 디렉터리에 다음과 같은 구조를 사용하여 개발 환경에 라이선스를 추가할 수 있습니다.

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

그 뒤에서 XML 라이센스는 `$LIFERAY_HOME/deploy`에 복사되고, AATF 라이센스는 `$LIFERAY_HOME/data`에 복사됩니다.

## 관련 주제

* [Liferay DXP 서비스 이용하기](../customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service.md)
* [Liferay DXP 서비스 구성](./configuring-the-liferay-dxp-service.md)
* [Liferay Cloud 배포 워크플로우 개요](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md)
* [CLI 도구](../reference/command-line-tool.md)
