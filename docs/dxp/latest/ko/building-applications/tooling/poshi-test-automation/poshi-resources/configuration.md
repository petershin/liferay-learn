# 설정

테스트 작성자가 일반적으로 사용되는 기능, 경로 또는 매크로에 쉽게 액세스할 수 있도록 기존 Poshi 파일을 종속 항목으로 저장하도록 Poshi 리소스가 생성되었습니다. 이러한 리소스는 Poshi Runner Resources Gradle 플러그인을 통해 Gradle 종속성으로 Poshi 프로젝트에 로드할 수 있으며 파일 시스템의 로컬 Poshi 파일과 별도로 사용할 수 있습니다.

기본적으로 Poshi Standalone 또는 Liferay Gradle Plugins Defaults 플러그인을 사용하는 모든 Poshi 프로젝트는 자동으로 기본 Poshi 리소스 jar인 `com.liferay:com.liferay.poshi.runner.resources:latest.version`에 액세스할 수 있습니다. 이 게시된 `com.liferay:com.liferay.poshi.runner.resources` jar에는 [Liferay poshi-runner-resources 디렉토리](https://github.com/liferay/liferay-portal/tree/master/modules/test/poshi/poshi-runner-resources/src/main/resources/default) 의 Poshi 파일이 포함되어 있으며 표준 maven 저장소 [Maven Central](https://search.maven.org/artifact/com.liferay/com.liferay.poshi.runner.resources) 및  [Liferay Nexus](https://repository.liferay.com/nexus/#nexus-search;gav~com.liferay~com.liferay.poshi.runner.resources)을 통해 사용할 수 있습니다.

jar 파일을 사용하려면 Poshi 프로젝트의 build.gradle 파일에 다음을 추가합니다. 여기서 변수 `GROUP`, `NAME`및 `VERSION` 는 [Maven 종속성](https://search.maven.org/artifact/com.liferay/com.liferay.poshi.runner.resources) 플러그인을 참조합니다.

```
dependencies {
    poshiRunnerResources group: "GROUP", name: "NAME", version: "VERSION"
}
```

기본 Poshi 리소스 jar 파일을 사용하려면 `GROUP`, `NAME`및 `VERSION` 를 다음 정보로 바꿉니다.

```
dependencies {
    poshiRunnerResources group: "com.liferay", name: "com.liferay.poshi.runner.resources", version: "latest.release"
}
```

Poshi 리소스 jar의 특정 버전을 사용하려면 `GROUP`, `NAME`및 `VERSION` 를 다음과 같이 바꿉니다.

```
dependencies {
poshiRunnerResources group: "com.liferay.poshi.runner.resources", name: "portal-master", version: "20220413-38b5985"
}
```

Poshi 리소스 구성에 대한 자세한 내용은 [Poshi Runner Resources Gradle Plugin](https://github.com/liferay/liferay-portal/blob/master/modules/sdk/gradle-plugins-poshi-runner/README.markdown#poshi-runner-resources-gradle-plugin)을 참조하십시오.
