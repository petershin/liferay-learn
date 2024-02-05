# Liferay DXP 서비스 구성

[시스템 설정](https://learn.liferay.com/dxp/latest/ko/system-administration/configuring-liferay/system-settings.html) 및 [구성 파일 사용](https://learn.liferay.com/dxp/latest/ko/system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.html) 및 [문맥 재산](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/reference/portal-properties.html) 을 사용하여 Liferay DXP를 구성하는 방법에는 여러 가지가 있습니다. Liferay Cloud의 Liferay DXP 인스턴스에 대한 DXP 속성 및 구성 파일은 저장소의 Liferay DXP 서비스 디렉터리에 있는 `configs/` 폴더 중 하나에 배치하여 배포합니다.

```
liferay
├── configs
│   ├── common
│   ├── dev
│   ├── local
│   ├── prd
│   └── uat
└── LCP.json
```

`common/` 디렉터리를 제외한 환경별 폴더(예: `dev`, `uat`, `prod`)에 추가된 변경 사항은 해당 환경에 배포할 때 **만** 전파됩니다. `common/` 디렉터리에 추가된 변경 사항은 대상 배포 환경에 관계없이 **항상** 배포됩니다. 이는 모든 서비스에 대해 `configs/` 디렉터리 내의 모든 하위 폴더에 적용됩니다.

## 문맥 재산

[문맥 재산](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/reference/portal-properties.html) 은 `portal-ext.properties` 파일에 저장된 속성입니다. Liferay DXP 환경을 구성하는 데 사용됩니다.

온프레미스 Liferay DXP 인스턴스의 경우, 이 파일은 `$LIFERAY_HOME`에 속합니다. Liferay Cloud를 사용하는 경우, 포털 속성 파일을 적절한 `configs/{ENV}/` 폴더에 배치하여 배포 시 Liferay DXP 인스턴스의 경우 `$LIFERAY_HOME` 에 복사합니다.

예를 들어 개발 환경의 프로퍼티는 `configs/common` 디렉터리에 있는 프로퍼티 파일과 `configs/dev` 디렉터리에 있는 프로퍼티에서 생성됩니다. 이름이 같은 파일이 있는 경우 환경별 디렉터리의 파일이 `일반` 디렉터리의 파일을 덮어씁니다.

### 포털 속성을 여러 파일로 분할

기본적으로 Liferay는 `portal-ext.properties` 파일에서만 속성을 직접 읽지만, 환경별 파일과 같이 리포지토리의 다른 파일로 속성을 구성하는 것이 도움이 될 수 있습니다. 포털 속성을 재정의할 추가 파일을 정의할 수 있습니다:

* `portal-all.properties`: 환경 전반에서 Liferay DXP를 변경하는 속성이 포함되어 있습니다.

* `portal-env.properties`: 현재 환경에만 영향을 미치는 속성을 포함합니다(예: 환경마다 다른 외부 서비스에 대한 자격 증명 및 URL 엔드포인트).

이러한 파일을 사용하려면 `portal-ext.properties` 파일에 `include-and-override` 속성을 사용하여 `portal-all.properties` 및 `portal-env.properties` 을 명시적으로 가져와야 합니다:

```
include-and-override=/opt/liferay/portal-all.properties
include-and-override=/opt/liferay/portal-env.properties
```

그런 다음 다음과 같은 구조로 속성을 구성할 수 있습니다:

```
liferay
├── configs
│   ├── common
│   │   ├── portal-ext.properties
│   │   └── portal-all.properties
│   ├── dev
│   │   └── portal-env.properties
│   ├── local
│   │   └── portal-env.properties
│   ├── prd
│   │   └── portal-env.properties
│   └── uat
│       └── portal-env.properties
└── LCP.json
```

`portal-ext.properties` 및 `portal-all.properties` 파일은 모든 환경에서 공유됩니다. 여기에 공유 속성을 추가하고 각각의 `portal-env.properties` 파일에 환경별 속성을 추가할 수 있습니다. 자세한 내용은 [문맥 재산](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/reference/portal-properties.html#portal-property-priority) 를 참조하세요.

```{note}
포털 속성은 환경 변수로 정의할 수도 있습니다. 자세한 내용은 [환경 변수 참조](./liferay-service-환경-변수.md#환경-변수-참조) 를 참조하세요.
```

## OSGi 구성

OSGi 구성(`.cfg` 또는 `.config` 파일)은 Liferay DXP에서 OSGi 구성 요소를 구성하는 데 사용됩니다.

이러한 구성 파일은 `$LIFERAY_HOME`의 `osgi/configs/` 폴더에 있습니다. Liferay Cloud를 사용하는 경우, 이러한 파일을 적절한 `configs/{ENV}/osgi/` 폴더에 배치하여 배포 시 Liferay DXP 인스턴스의 `/osgi/configs` 에 복사합니다.

## Tomcat 구성

적절한 환경의 `liferay/configs/{ENV}` 폴더에 파일을 배포하여 구성 파일을 재정의하여 Liferay 서비스의 Tomcat 서버를 구성합니다. 예를 들어, 사용자 지정 파일을 리포지토리의 적절한 `liferay/configs/{ENV}/tomcat/conf/` 폴더에 배치하고 변경 사항을 배포하여 Liferay 컨테이너의 파일 시스템에서 `{TOMCAT HOME}/conf/web.xml` 파일을 재정의할 수 있습니다.

```{note}
Liferay Cloud의 Liferay 컨테이너에는 일반 `tomcat` 폴더와 버전이 지정된 폴더(`tomcat-x.x.x`)의 두 가지 tomcat 폴더가 존재합니다. 톰캣` 폴더에는 버전이 변경된 `tomcat-x.x.x` 폴더에 대한 심볼릭 링크가 있으므로 일반 `tomcat` 폴더에 있는 파일을 재정의하면 새 파일이 두 폴더에 모두 반영되도록 합니다.
```

```{warning}
기본 Tomcat 구성을 재정의할 때 Liferay Cloud의 Liferay 서비스가 클라우드 플랫폼의 폐쇄형 네트워크에 존재한다는 점에 유의하세요. 온프레미스 Liferay 설치에서 변경할 수 있는 일부 네트워크 구성은 클라우드 환경에서는 기본값에서 변경할 수 없거나 사용자 환경에서 문제를 일으킬 수 있습니다.
```

## 환경 변수

Liferay Cloud의 Liferay 서비스는 JVM 메모리 설정이나 데이터베이스 연결 설정과 같이 온프레미스 인스턴스에서 다르게 수행되는 일부 구성 대신 [환경 변수](../reference/defining-environment-variables.md) (또는 [비밀](..//tuning-security-settings/managing-secure-environment-variables-with-secrets.md))를 사용합니다. 환경 변수를 사용하여 [포털 속성을 재정의하거나 대체할 수도 있습니다](./liferay-service-environment-variables.md#overriding-portal-properties) .

자세한 내용은 [Liferay 서비스 환경 변수](./liferay-service-environment-variables.md) 를 참조하세요.

## 관련 주제

* [Liferay DXP 서비스 사용](../using-the-liferay-dxp-service.md)
* [Liferay Cloud에서 클러스터링 활성화하기](./setting-up-clustering-in-liferay-cloud.md)
* [문맥 재산](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/reference/portal-properties.html)
* [라이프레이 서비스 환경 변수](./liferay-service-environment-variables.md)
