# 배포 환경 만들기

코드를 공유할 준비가 된 시점이 옵니다. 그러기 위해서는 환경을 구축해야 합니다. 기업 세계에는 일반적으로 세 가지 환경이 있습니다.

* 개발자: 코드를 수정하고 신속하게 재배포할 수 있는 초기 테스트 환경입니다. 개발자와 고급 사용자는 여기에서 테스트합니다.
* UAT(User Acceptance Testing): 프로덕션 구성을 보다 밀접하게 미러링하는 환경입니다. 애플리케이션이 거의 완성되면 일반적으로 여기에서 테스트할 더 많은 사용자 세그먼트를 초대합니다.
* 프로덕션: 라이브 사이트가 있는 환경입니다. 배포는 엄격하게 제어되며 다른 두 환경에서 테스트된 코드만 배포됩니다.

Liferay Workspace를 사용하면 컨테이너 기반이든 기존이든 배포 환경을 쉽게 생성할 수 있습니다. 구성을 제공하고 Gradle 작업을 실행하면 설치할 준비가 된 배포 가능한 Docker 컨테이너 또는 서버 아카이브를 생성할 수 있습니다. Workspace에는 작업이 발생하는 선택적 `configs` 폴더가 포함되어 있습니다.

[Blade CLI](../blade-cli/generating-projects-with-blade-cli.md)을 사용하여 작업 공간을 생성한 경우 `configs` 폴더가 이미 존재합니다. Workspace [을 수동으로](./creating-a-liferay-workspace.md)생성한 경우 Workspace 디렉토리에 다음 폴더 구조를 생성합니다.

   ```
   ├── common
   │   └── portal-setup-wizard.properties
   ├── dev
   │   └── portal-ext.properties
   ├── docker
   ├── local
   ├── prod
   └── uat
       └── portal-ext.properties
   ```

아직 파일에 아무 것도 넣지 마십시오.

## 배포 환경의 작동 방식

`configs` 폴더는 특정 시나리오를 정의합니다.

`공통`: 모든 환경에 적용되는 구성을 포함합니다.

`dev`: 개발 환경에 대한 구성을 포함합니다.

`docker`: Docker 구성을 포함합니다.

`local`: Workspace가 상주하는 로컬 환경에 대한 구성을 포함합니다.

`prod`: 프로덕션 환경에 대한 구성을 포함합니다.

`uat`: User Acceptance Testing 환경에 대한 구성을 포함합니다.

특정 폴더에 구성 파일을 배치하면 해당 환경에 대한 구성이 정의됩니다. `common` 및 `docker`의 경우 다른 모든 구성이 이를 재정의합니다. 이는 재정의할 환경에 대한 기본 구성을 제공할 수 있도록 하기 위한 것입니다. 이제 몇 가지 환경을 구축할 준비가 되었습니다.

## 배포 환경 구축

환경에 대해 다음 시나리오를 가정합니다.

- 개발자 환경은 개발자 속성을 사용해야 합니다.
- 로컬 환경이 로컬 데이터베이스를 가리킴
- 개발자 및 UAT 환경은 자체 데이터베이스를 가리킵니다.
- 모든 환경에서 설정 마법사 건너뛰기

해당 시나리오를 구성하는 방법은 다음과 같습니다.

1. `common` 폴더에서 이 속성을 `portal-setup-wizard.properties`에 추가합니다.

   ```properties
   setup.wizard.enabled=false
   ```
1. `local` 폴더에서 `portal-ext.properties`에 로컬 데이터베이스를 구성합니다.

   ```properties
   #
   # MySQL
   #
   jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver
   jdbc.default.url=jdbc:mysql://localhost/lportal?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false
   jdbc.default.username=root
   jdbc.default.password=password
   ```

1. `dev` 폴더에서 개발자 속성을 활성화하고 `Portal-ext.properties`의 개발 서버에서 데이터베이스를 구성합니다.

   ```properties
   include-and-override=portal-developer.properties

   #
   # MySQL
   #
   jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver
   jdbc.default.url=jdbc:mysql://devel.server/lportaldev?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false
   jdbc.default.username=root
   jdbc.default.password=password
   ```

1. `uat` 폴더에서 `portal-ext.properties`의 UAT 환경에 데이터베이스를 구성합니다.

   ```properties
   #
   # MySQL
   #
   jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver
   jdbc.default.url=jdbc:mysql://uat.server/lportaluat?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false
   jdbc.default.username=root
   jdbc.default.password=password
   ```

훌륭한! 이제 환경을 생성하고 배포할 준비가 모두 완료되었습니다.

## 배포 환경 생성

이제 Docker 컨테이너 또는 번들을 생성하여 로컬로 실행하거나 서버에 배포할 수 있습니다.

### 도커 컨테이너 생성

Docker 컨테이너를 생성하면 모든 환경에 대한 구성이 포함됩니다. `liferay.workspace.environment` 변수를 사용하여 사용하려는 환경을 선택합니다.

배포 환경 구성에서 Docker 컨테이너를 생성하려면 다음 명령을 사용합니다.

```bash
./gradlew buildDockerImage
```

Docker 컨테이너가 빌드되면 이 명령은 위의 dev 구성을 사용하여 컨테이너를 시작합니다.

```bash
./gradlew startDockerContainer -Pliferay.workspace.environment=dev
```

구성은 Liferay 컨테이너 내부에서 생성되며 변수는 사용할 구성을 결정합니다.

![모든 구성은 Docker 컨테이너 내부에서 생성됩니다.](./creating-deployment-environments/images/01.png)

### 번들 생성

이것은 `initBundle` 또는 `distBundle` Gradle 작업을 사용하여 수행됩니다.

1. 먼저 환경을 테스트해야 합니다. 로컬로 빌드하려면 `initBundle` 명령을 사용하십시오. 예를 들어 `dev` 환경을 구축하려면 다음을 실행합니다.

   ```bash
   ./gradlew initBundle -Pliferay.workspace.environment=dev
   ```
   이렇게 하면 작업공간의 모든 프로젝트가 컴파일되어 `번들` 폴더의 런타임에 배포됩니다. 또한 지정한 구성(이 예에서는 `dev` 환경의 구성)을 제공합니다. `bundles` 폴더에 있는 `portal-ext.properties` 파일을 검사하면 `dev` 구성에 대해 제공한 것과 일치하는 것을 볼 수 있습니다.

1. 환경이 좋아 보이고 테스트가 잘 되면 모든 애플리케이션과 구성을 포함하는 배포 가능한 번들을 빌드할 수 있습니다. 다음 명령을 실행합니다.

   ```bash
   ./gradlew distBundleTar -Pliferay.workspace.environment=dev
   ```

   이렇게 하면 `빌드` 폴더에 gzip으로 압축된 `tar` 파일이 빌드됩니다. 이 아카이브를 가져와 다른 Liferay 번들과 마찬가지로 개발 서버에 설치할 수 있습니다. 단, 이 번들은 원하는 방식으로 완전히 구성되어 있고 모든 애플리케이션이 이미 설치되어 있습니다.

```{note}
.zip 아카이브를 원한다면 `distBundleZip` 명령을 사용할 수 있습니다.
```

위의 단계에 따라 각 환경을 테스트하고 빌드합니다.

모든 환경을 한 번에 구축할 수도 있습니다. 다음 두 단계만 거치면 됩니다.

1. Workspace의 `gradle.properties` 파일에서 속성 `liferay.workspace.bundle.dist.include.metadata` 을 `true` 으로 설정합니다.

   ```properties
   liferay.workspace.bundle.dist.include.metadata=true
   ```

2. 모든 번들을 빌드하려면 대상을 호출하십시오. 모든 번들을 gzip으로 압축된 tar 파일로 빌드하려면 다음을 사용하십시오.

   ```bash
   ./gradlew distBundleTarAll
   ```

   모든 번들을 .zip 파일로 빌드하려면 다음을 사용하십시오.

   ```bash
   ./gradlew distBundleZipAll
   ```

