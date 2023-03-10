# Liferay Home

**Liferay Home** 은 Liferay DXP/Portal이 애플리케이션을 시작하고, 구성을 읽고 적용하고, JAR 파일을 로드하고, 로그를 생성하는 등의 작업을 수행하는 폴더입니다.

Liferay Home의 사이트는 설치 유형에 따라 다릅니다.

* **Liferay Tomcat 번들** 에서 Liferay Home은 설치의 최상위 폴더이며 응용 프로그램 서버를 포함합니다.
* **응용 프로그램 서버** 에 설치할 때 Liferay Home 폴더는 응용 프로그램 서버에 따라 다릅니다. 응용 프로그램 서버에 설치하는 경우 Liferay 홈 사이트에 대해서는 해당 응용 프로그램 서버를 다루는 문서(예: [**앱 서버]에 설치**)를 참조하십시오.

## 라이프레이 홈 구조

DXP/Portal 설치는 애플리케이션 서버에 관계없이 이 폴더 구조를 사용합니다.

```
[LIFERAY_HOME]
    ├── data
    ├── deploy
    ├── elasticsearch-sidecar // Named 'elasticsearch7' in 7.3. Not included in 7.2 and earlier.
    ├── license
    ├── logs
    ├── osgi
    │   └── configs
    │   └── [core] // Included only in 7.2 and earlier
    │   └── marketplace
    │   └── modules
    │   └── portal
    │   └── state
    │   └── static
    │   └── war
    ├── patching-tool // (Subscription)
    ├── tools
    └── [work] // Included only in 7.2 and earlier
```

## Liferay 홈 참조

각 폴더의 용도는 다음과 같습니다.

* `데이터` (HSQL 데이터베이스가 선택된 경우): 임베디드 HSQL 데이터베이스, DXP의 파일 저장소 및 검색 인덱스를 저장합니다. 포함된 HSQL 데이터베이스는 기본적으로 구성되지만 데모 및 평가용으로만 사용됩니다. [포털 속성 `jdbc.default.url`](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#JDBC) 은 Hypersonic 임베디드 HSQL 데이터베이스 사이트를 설정합니다.
* `배포`: 기본적으로 이 폴더는 플러그인을 자동 배포합니다. 자동 배포는 Liferay Marketplace의 애플리케이션 `.lpkg` 파일, 플러그인 `.war` 파일 및 플러그인 `.jar` 파일을 지원합니다. [포털 속성 `auto.deploy.deploy.dir`](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Auto%20Deploy) 를 설정하여 `배포` 폴더에 대한 대체 경로를 구성할 수 있습니다.
* `elasticsearch-sidecar`: DXP/Portal로 시작하는 Elasticsearch 노드를 보유합니다. 폴더 이름은 7.3에서 `elasticsearch7` 입니다. 이 폴더는 7.2 이전 버전에는 포함되어 있지 않습니다. 자세한 내용은 [사이드카 또는 임베디드 Elasticsearch 사용](../../using-search/installing-and-upgrading-a-search-engine/elasticsearch/using-the-sidecar-or-embedded-elasticsearch.md) 을 참조하십시오.
* `라이센스`: 저작권 및 버전 파일이 여기에 있습니다.
* `logs`: DXP/Portal은 이 폴더를 생성하고 여기에 로그 파일을 기록합니다. 문제를 진단할 때 검사하십시오. `portal-impl.jar`의 `portal-impl/src/META-INF/portal-log4j.xml` 파일은 로그 파일 사이트를 설정합니다. 로그 파일 사이트를 재정의하려면 [Ext 플러그인에서 `ext-impl/src/META-INF/portal-log4j-ext.xml` 파일을 사용](https://help.liferay.com/hc/ article/360029030791-Ext를 사용한 핵심 기능 사용자 정의) .
* `osgi`: 모든 JAR 파일과 OSGi 런타임에 대한 몇 가지 구성 파일이 이 폴더에 속합니다. [포털 속성 `module.framework.base.dir`](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Module%20Framework) 은 OSGi 폴더 사이트를 설정합니다. . 하위 폴더는 다음과 같습니다.
  
    * `구성`: 여기에 구성 요소 [구성 파일](../../system-administration/configuring-liferay/system-settings.md#exporting-and-deploying-configurations) 을 배포합니다.
  * `[core]`: 7.2 이전에만 존재합니다. 핵심 모듈을 보유하고 있습니다.
  * `마켓플레이스`: 마켓플레이스 애플리케이션 및 애플리케이션 제품군.
  * `모듈`: 배포한 모듈입니다.
  * `포털`: 비핵심 모듈.
  * `state`: OSGi 번들 설치, 번들 스토리지 등과 같은 OSGi 내부 상태 파일을 포함합니다.
  * `정적`: 여기에서 사용자 지정을 JAR 파일로 배포합니다.
  * `war`: 배포한 WAR 플러그인입니다. 

* `patching-tool`: (구독) 이 폴더에는 패치를 설치하기 위한 패치 및 유틸리티가 들어 있습니다.
* `도구`: 데이터베이스 업그레이드 도구 및 대상 플랫폼 인덱서를 저장합니다.
* `[작업]`: 7.2 이전에만 존재합니다. 모듈 Jasper 작업 파일을 보유합니다.

```{note}
DXP가 Liferay Home 폴더에 리소스를 생성할 수 없거나 DXP가 특정 애플리케이션 서버에서 실행될 때 DXP를 실행 중인 운영 체제 사용자의 홈 폴더에 'liferay'라는 폴더를 생성합니다. 이 경우 해당 `liferay` 폴더는 Liferay 홈이 됩니다. 예를 들어 운영 체제 사용자 이름이 *jbloggs*인 경우 `liferay` 폴더 경로는 `/home/jbloggs/liferay` 또는 `C:\Users\jbloggs\liferay`입니다.
```
