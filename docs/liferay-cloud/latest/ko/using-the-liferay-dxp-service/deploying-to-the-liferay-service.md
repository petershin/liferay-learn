# Liferay 서비스에 배포

다른 서비스와 마찬가지로 사용자 지정 추가 배포에는 구성 또는 파일을 Git 리포지토리의 적절한 위치에 추가하는 작업이 포함됩니다. 그러나 Liferay 서비스 배포는 다른 서비스 배포와 약간 다릅니다.

Liferay 서비스는 [Liferay 작업 공간](https://learn.liferay.com/dxp/latest/en/building-applications/tooling/liferay-workspace/what-is-liferay-workspace.html) 을 사용하여 배포 가능한 파일 [](#deploying-themes-portlets-and-osgi-modules), 소스 코드 [](#building-and-deploying-source-code)등을 추가할 수 있는 더 많은 옵션을 제공합니다. 이들은 [CI 빌드](../build-and-deploy/overview-of-the-liferay-cloud-deployment-workflow.md)에 쉽게 포함되지만 [CLI 도구](../reference/command-line-tool.md)를 사용하는 경우에는 특히 Liferay 서비스에 [추가 단계](#cli-tool-deployment) 가 필요합니다.

## Liferay DXP Docker 이미지 정의

Liferay 서비스 이미지(다른 서비스와 마찬가지로 `LCP.json` 파일에 정의됨)는 Liferay DXP Docker 이미지와 동일하지 않습니다. Liferay DXP Docker 이미지는 Liferay 서비스에서 실행되는 Liferay의 정확한 버전(수정 팩 포함)을 결정합니다. 이는 리포지토리의 `liferay/gradle.properties` 파일에서 `liferay.workspace.docker.image.liferay` 속성으로 정의됩니다.

[Liferay DXP Docker 태그](https://hub.docker.com/r/liferay/dxp/tags) 을 확인하여 DXP 버전에 적합한 이미지를 찾으십시오.

```{important}
Liferay 서비스 `LCP.json` 파일의 `image` 속성에 정의된 DXP의 주 버전 번호는 **liferay/의 `liferay.workspace.docker.image.liferay` 속성에 있는 주 버전과 **일치해야 합니다**. gradle.properties`. 둘이 다른 경우 Liferay 서비스가 배포 후 시작되지 않을 수 있습니다.
```

## CLI 도구 배포

[CLI 도구](../reference/command-line-tool.md) 을 사용하여 배포하려면 사용자 지정 및 구성과 함께 배포하기 위한 추가 단계가 필요합니다. 배포하기 전에 생성되는 특수 `Dockerfile` 이미지에 포함되어야 합니다.

[배포 가능한 파일](#deploying-themes-portlets-and-osgi-modules), [빌드된 소스 코드](#building-and-deploying-source-code), [핫픽스](#deploying-hotfixes)및 [라이선스](#deploying-licenses) CLI 도구를 사용하는 경우 배포에 포함할 추가 단계가 필요합니다. [CI 서비스](../platform-services/continuous-integration.md) 을 사용하여 리포지토리에서 빌드를 생성하는 경우 이러한 추가 단계는 필요하지 않습니다.

CLI를 사용하여 정상적으로 Liferay 서비스를 배포하는 경우(모든 서비스를 한 번에 배포하거나 `liferay/` 디렉터리에서 배포할 때) Liferay DXP 이미지의 **기본 버전** ( `LCP.json에 정의된 주 버전 사용)`) 사용자 정의가 포함되지 않은 배포됩니다. 포함할 사용자 지정을 서비스와 함께 구체적으로 빌드하고 배포해야 하기 때문에 이런 일이 발생합니다.

사용자 정의와 함께 Liferay 서비스를 배포하려면 다음 단계를 따르십시오.

1. `liferay/` 디렉토리의 명령줄에서 다음을 실행합니다.

   ```bash
   gw clean createDockerfile deploy
   ```

  이렇게 하면 모든 사용자 지정 항목이 빌드되고 `build/liferay/` 하위 폴더에 정렬됩니다. 또한 DXP의 맞춤형 버전을 위해 특별히 `Dockerfile` 을 추가합니다.

1. `LCP.json` 파일을 새로 생성된 `build/docker/` 하위 폴더에 복사합니다.

1. 이 하위 폴더에서 평소와 같이 `lcp deploy` 명령을 실행합니다.

이렇게 하면 기본 버전 대신 사용자 지정 서비스가 배포됩니다.

## 테마, 포틀릿 및 OSGi 모듈 배포

테마, 포틀릿 또는 OSGi 모듈을 설치하려면 WAR 또는 JAR 파일을 Liferay DXP 서비스 디렉토리의 `configs/{ENV}/deploy/` 폴더에 포함시키십시오.

예를 들어 사용자 정의 JAR 파일을 개발 환경에 배포하려면( `dev/` 환경 폴더 사용) Liferay DXP 서비스 디렉토리는 다음과 같을 수 있습니다.

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

배포되면 `configs/{ENV}/deploy/` 디렉토리 내의 모든 파일이 Liferay 서비스 컨테이너의 `$LIFERAY_HOME/deploy/` 폴더에 복사됩니다.

```{note}
특정 파일 및 구성은 이미지가 배포될 때 존재하도록 강제되며 추가된 파일을 재정의할 수 있습니다. 서비스 로그에서 'DXPCloud Liferay Overrides' 메시지를 찾아 파일이 재정의된 시기를 식별합니다.
```

```{note}
저장소에서 버전 3.xx 서비스를 사용하는 경우 테마, 포틀릿 및 OSGi 모듈은 대신 적절한 `lcp/liferay/deploy/{ENV}` 폴더에 속합니다. 버전 확인에 대한 자세한 내용은 [서비스 스택 버전 이해하기](../reference/understanding-service-stack-versions.md)를 참조하십시오.
```

## 소스 코드 빌드 및 배포

새로 추가된 소스 코드는 CI 빌드에 포함될 수도 있습니다. 빌드가 시작되면 자동으로 소스 코드를 컴파일합니다.

CI 빌드는 다음 폴더 내에서 소스 코드를 컴파일합니다.

* 새 모듈의 `liferay/modules` 폴더
* 사용자 지정 테마용 `liferay/themes` 폴더
* 폭발된 WAR의 `liferay/wars` 폴더

```{note}
버전 3.xx 서비스를 사용하는 경우 이러한 하위 폴더는 `liferay/` 디렉토리가 아닌 저장소의 루트에 있습니다. 버전 확인에 대한 자세한 내용은 [서비스 스택 버전 이해하기](../reference/understanding-service-stack-versions.md)를 참조하십시오.
```

배포되면 배포 가능한 `.jar` 또는 `.war` 파일이 Liferay 서비스 컨테이너의 `$LIFERAY_HOME/deploy/` 폴더에 복사됩니다. 이는 CI의 빌드가 코드를 컴파일하는지 또는 배포 전에 사용 가능한</a>
사용하여 직접 생성하는지 여부에 관계없이 발생합니다.</p> 



## 핫픽스 배포

핫픽스를 적용하려면 핫픽스 ZIP 파일을 Liferay DXP 서비스 디렉토리 내의 `configs/{ENV}/patching/` 폴더에 추가하십시오. 이 변경 사항을 배포하면 핫픽스가 Liferay DXP 인스턴스에 적용됩니다.



```{note}
Liferay DXP의 새로운 부 버전으로 업데이트하려면 [이 지침](./updating-your-dxp-instance-to-a-new-minor-version.md)을 참조하세요(예: 새 [서비스 팩](https ://learn.liferay.com/dxp/latest/en/installation-and-upgrades/maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier/understanding-patch-types-for-dxp -7-3-and-earlier.html#service-packs)).
```


예를 들어 다음과 같은 구조로 개발 환경에 핫픽스를 배포할 수 있습니다.



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


서버가 시작될 때마다 핫픽스를 다시 적용해야 합니다. 이러한 이유로 `LCP.json` 파일에 있는 Liferay DXP Docker 이미지의 최신 수정 팩 또는 서비스 팩으로 업데이트하는 것이 장기적으로 이 폴더에 핫픽스를 추가하는 것보다 낫습니다. 이 파일( `liferay/` 디렉토리에 있음)에서 `이미지` 환경 변수를 대체하여 Docker 버전을 업데이트할 수 있습니다.



```{note}
버전 3.xx 서비스를 사용하는 경우 핫픽스가 대신 `lcp/liferay/hotfix/` 폴더에 추가됩니다. 이 경우 Docker 이미지 버전은 리포지토리의 `gradle.properties` 파일에서 `liferay.workspace.lcp.liferay.image` 속성으로 대신 정의됩니다. 버전 확인에 대한 자세한 내용은 [서비스 스택 버전 이해하기](../reference/understanding-service-stack-versions.md)를 참조하십시오.
```




### 환경 변수를 통한 패치

Git 리포지토리에 직접 커밋하는 대신 CI 빌드 프로세스의 일부로 핫픽스를 설치할 수도 있습니다. 이 접근 방식은 대용량 핫픽스에 이상적이므로 대용량 파일을 리포지토리에 보관하지 않아도 됩니다.

쉼표로 구분된 핫픽스 목록을 `LCP_CI_LIFERAY_DXP_HOTFIXES_{ENV}` 환경 변수에 추가(Liferay Cloud 콘솔의 `환경 변수` 탭을 통해 또는 `ci` 서비스의 `LCP.json` 파일에서) 빌드 프로세스 중에 자동으로 적용합니다.



```{note}
`ci` 서비스의 `LCP.json`에 이 환경 변수를 추가하는 경우 `ci` 서비스를 **infra 환경**에 배포하여 업데이트를 완료해야 합니다.
```


`LCP.json` 파일을 통해 핫픽스를 정의하는 다음 예를 참조하십시오.



```
"env": {
    "LCP_CI_LIFERAY_DXP_HOTFIXES_COMMON": "liferay-hotfix-10-7210,liferay-hotfix-17-7210",
    "LCP_CI_LIFERAY_DXP_HOTFIXES_DEV": "liferay-hotfix-15-7210,liferay-hotfix-33-7210",
}
```




```{note}
이 환경 변수는 버전 4.xx 이상의 서비스로 업그레이드한 경우에만 사용할 수 있습니다. 버전 확인에 대한 자세한 내용은 [서비스 스택 버전 이해하기](../reference/understanding-service-stack-versions.md)를 참조하십시오.
```




## 라이선스 배포

Liferay DXP 서비스 디렉터리 내의 `configs/{ENV}/deploy/` 폴더에 자신의 라이선스를 추가하여 라이선스를 추가할 수 있습니다.

예를 들어 Liferay DXP 서비스 디렉터리에서 다음과 같은 구조로 개발 환경에 라이선스를 추가할 수 있습니다.



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


배후에서 XML 라이센스는 `$LIFERAY_HOME/deploy`에 복사되고 AATF 라이센스는 `$LIFERAY_HOME/data`에 복사됩니다.



```{note}
버전 3.xx 서비스를 사용하는 경우 라이센스는 대신 리포지토리의 `lcp/liferay/license/{ENV}/` 폴더에 속합니다. 버전 확인에 대한 자세한 내용은 [서비스 스택 버전 이해하기](../reference/understanding-service-stack-versions.md)를 참조하십시오.
```




## 추가 정보

* [Liferay DXP 서비스 사용](../using-the-liferay-dxp-service.md)
* [Liferay DXP 서비스 구성](./configuring-the-liferay-dxp-service.md)
* [Liferay 클라우드 배포 워크플로 개요](../build-and-deploy/overview-of-the-liferay-cloud-deployment-workflow.md)
* [CLI 도구](../reference/command-line-tool.md)
