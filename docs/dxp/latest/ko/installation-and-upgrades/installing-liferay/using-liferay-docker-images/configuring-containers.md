# 컨테이너 구성

Liferay 설치에서 구성할 수 있는 모든 것은 Liferay Docker 컨테이너에서 구성할 수 있습니다.

구성해야 할 가장 일반적인 사항은 다음과 같습니다.

* [JVM 옵션](#jvm-options)
* [문맥 재산](#portal-properties)
* [이미지 정의 환경 변수](#image-defined-environment-variables)
* [시스템 특성](#system-properties)
* [시스템 설정](#system-settings)

```{note}
컨테이너에 파일을 제공하는 것과 관련된 구성 사용 사례는 여기에서 [bind mounts](https://docs.docker.com/storage/bind-mounts/) 를 사용하여 설명합니다. [volumes](https://docs.docker.com/storage/volumes/) 을 사용할 수도 있으며 경우에 따라 `docker cp` 명령을 사용할 수도 있습니다. 자세한 내용은 [컨테이너에 파일 제공](./providing-files-to-the-container.md)을 참조하세요.
```

## JVM 옵션

Tomcat의 JVM 옵션을 추가하거나 교체할 수 있습니다.

### CATALINA_OPTS에 JVM 옵션 추가

JVM 옵션은 컨테이너를 생성할 때 `LIFERAY_JVM_OPTS` 환경 변수에 지정하여 Tomcat의 `CATALINA_OPTS` 변수에 추가할 수 있습니다.

```bash
docker run -it -m 8g -p 8080:8080 -e LIFERAY_JVM_OPTS=[value\ with\ space] liferay/dxp:[tag]
```

```{warning}
`LIFERAY_JVM_OPTS` 값에서 백슬래시를 사용하여 공백 문자를 이스케이프합니다. 따옴표를 사용하지 마십시오.
```

컨테이너는 Tomcat의 `CATALINA_OPTS`에 추가된 `LIFERAY_JVM_OPTS` 값으로 실행됩니다.

### setenv.sh 파일 바꾸기

JVM 옵션을 구성하는 또 다른 방법은 Tomcat의 `setenv.sh` 스크립트를 재정의하는 것입니다. `setenv.sh` 스크립트를 만드는 빠른 방법은 Liferay 컨테이너에서 하나를 복사하는 것입니다. 스크립트 사본을 수정하고 새 컨테이너에서 사용하는 방법은 다음과 같습니다.

1. 기존 Liferay 컨테이너가 있는 경우 시작합니다. 그렇지 않으면 새 것을 실행하십시오.

    ```bash
    docker run -it --name tmp-dxp -p 8080:8080 liferay/dxp:[tag]
    ```

1. 컨테이너에서 `setenv.sh` 파일을 복사합니다.

    ```bash
    docker cp tmp-dxp:/opt/liferay/tomcat/bin/setenv.sh .
    ```

1. [컨테이너](../using-liferay-docker-images.md#stopping-a-container) 을 중지합니다.

1. `setenv.sh`사본에서 JVM 옵션을 설정하십시오.

1. 호스트 폴더와 하위 폴더를 만들어 경로 `files/tomcat/bin`을 만듭니다.

    ```bash
    mkdir -p [host folder]/files/tomcat/bin
    cp setenv.sh [host folder]/files/tomcat/bin
    ```

1. 마운트를 호스트 폴더에 바인딩하는 `-v` 옵션을 사용하여 새 컨테이너를 실행합니다.

    ```bash
    docker run -it -m 8g -p 8080:8080 -v [host folder path]:/mnt/liferay liferay/dxp:[tag]
    ```

컨테이너는 `setenv.sh` 스크립트의 JVM 옵션을 사용합니다.

```{note}
컨테이너에 대한 바인딩 마운팅에 대한 자세한 내용은 [컨테이너에 파일 제공](./providing-files-to-the-container.md#bind-mounting-a-host-folder-to-mnt-liferay) 을 참조하세요. `/mnt/liferay` 폴더.
```

```{note}
Liferay 컨테이너 시작 및 작동에 대한 자세한 내용은 [Liferay Docker 이미지 사용](../using-liferay-docker-images.md)을 참조하세요.
```

## 문맥 재산

컨테이너 [포털 속성](../../reference/portal-properties.md) 은 다음 두 가지 방법으로 재정의할 수 있습니다.

* [Liferay 환경 변수 사용](#using-liferay-env-variables)
* [포털 속성 파일 사용](#using-a-portal-properties-file)

### Liferay 환경 변수 사용

각 [Portal Property](../../reference/portal-properties.md)에 대해 **Env** 변수가 있습니다. Env 변수는 Liferay Docker 컨테이너의 포털 속성을 재정의하는 [Docker 환경 변수](https://docs.docker.com/engine/reference/commandline/run/#set-environment-variables--e---env---env-file) 입니다.

1. [Portal Properties](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) 온라인 설명에서 재정의하려는 속성을 찾으십시오.

1. 속성 설명 바로 아래에 표시된 `Env` 변수 이름을 복사합니다. 예를 들어 다음은 [`jdbc.default.jndi.name`](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#JDBC) Portal 속성에 대한 Env 변수입니다.

    ```properties
    Env: LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_JNDI_PERIOD_NAME
    ```

1. `-e VARIABLE_A=value -e VARIABLE_B=value ...`패턴에 따라 `-e` 옵션을 사용하여 Env 변수 할당을 전달하여 컨테이너를 만듭니다. 예를 들어,

    ```bash
    docker run -it -m 8g -p 8080:8080 -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_JNDI_PERIOD_NAME=jdbc/MyPool liferay/dxp:[tag]
    ```

    ```{warning}
    `Env` 변수 값에서 백슬래시를 사용하여 공백 문자를 이스케이프합니다. 따옴표를 사용하지 마십시오.
    ```

    ```{note}
    데이터베이스 환경 변수 예제는 [데이터베이스 템플릿](../../reference/database-templates.md)을 참조하십시오.
    ```

    ```{note}
    컨테이너 시작 및 작동에 대한 자세한 내용은 [Liferay Docker 이미지 사용](../using-liferay-docker-images.md)을 참조하세요.
    ```

속성은 제어판의 **구성** &rarr; **서버 관리** &rarr; **속성** &rarr; **포털 속성** 에서 볼 수 있습니다.

### 포털 속성 파일 사용

`portal-ext.properties` 파일을 사용하여 컨테이너의 포털 속성을 재정의할 수 있습니다. 이 예에서는 [bind mount](./providing-files-to-the-container.md)을 사용합니다.

1. 호스트 폴더와 `files`이라는 하위 폴더를 만듭니다.

    ```bash
    mkdir -p [host folder]/files
    ```

1. 생성한 `파일` 하위 폴더의 `Portal-ext.properties` 파일에 속성 재정의를 추가합니다. 예를 들어,

    ```bash
    echo "jdbc.default.jndi.name=jdbc/MyPool" >> [host folder]/files/portal-ext.properties
    ```

1. `portal-ext.properties` 파일의 폴더를 컨테이너의 `/mnt/liferay/files` 폴더에 매핑하는 바인드 마운트를 포함하는 컨테이너를 생성합니다. 이 예제의 `</a>` 은 `files`폴더에 있으므로
컨테이너의 `/mnt/liferay 폴더` 에 마운트를 바인딩할 수 있습니다. 
   
   

    ```bash
    docker run -it -m 8g -p 8080:8080 -v [host folder path]:/mnt/liferay liferay/dxp:[tag]
    ```
속성은 제어판의 **Configuration** &rarr; **서버 관리** &rarr; **Properties** &rarr; **포털 속성** .

```{note}
데이터베이스 포털 속성 예제는 [데이터베이스 템플릿](../../reference/database-templates.md)을 참조하십시오.
```

## 이미지 정의 환경 변수

Liferay 이미지는 여러 환경 변수를 정의합니다. 일부 변수는 [Liferay Home](../../reference/liferay-home.md) 경로 및 디버그 모드에서 Tomcat을 시작하는 옵션과 같은 내부 항목을 구성합니다. 기타 변수는 [포털 속성](../../reference/portal-properties.md)을 설정합니다. 포털 속성을 설정하는 이미지 정의 환경 변수는 다음과 같습니다.

```properties
LIFERAY_MODULE_PERIOD_FRAMEWORK_PERIOD_PROPERTIES_PERIOD_OSGI_PERIOD_CONSOLE=0.0.0.0:11311
LIFERAY_SETUP_PERIOD_WIZARD_PERIOD_ADD_PERIOD_SAMPLE_PERIOD_DATA=false
LIFERAY_SETUP_PERIOD_WIZARD_PERIOD_ENABLED=false
LIFERAY_TERMS_PERIOD_OF_PERIOD_USE_PERIOD_REQUIRED=false
LIFERAY_USERS_PERIOD_REMINDER_PERIOD_QUERIES_PERIOD_ENABLED=false
```

포털 특성에 해당하는 환경 변수는 포털 특성 파일 설정보다 우선순위가 높습니다.

위의 것을 포함하여 모든 Docker 환경 변수는 변경할 수 없습니다. 환경 변수를 설정하거나 Liferay 이미지 정의 환경 변수에 의존하는 경우 원하는 값이 있는지 확인하십시오.

### 환경 변수 옵션

이미지 정의 환경 변수 작업을 위한 옵션은 다음과 같습니다.

1. 이미지 정의 기본값을 사용합니다. 자동으로 설정됩니다.

1. 컨테이너를 실행할 때 환경 변수를 설정하여 기본값을 재정의합니다. 예를 들어 `docker run -e [variable]=[value] ...`입니다.

1. 할당 없이 선언하여 환경 변수를 비활성화합니다(예: `=` 문자 없음). 형식은 다음과 같습니다. `-e [varable]`
   
   이미지 정의 포털 속성 환경 변수를 비활성화하면 컨테이너 시작 시 [포털 속성 파일](#using-a-portal-properties-file) 에서 원하는 값을 유연하게 지정할 수 있습니다. 예를 들어, 

    ```bash
    docker run -e [varable] -v [host folder path]:/mnt/liferay ...
    ```

### 예: 이미지 정의 포털 속성 환경 변수 작업

다음 이미지 정의 포털 속성 환경 변수는 사용자가 사용 약관에 동의할 필요가 없음을 선언합니다.

```properties
LIFERAY_TERMS_PERIOD_OF_PERIOD_USE_PERIOD_REQUIRED=false
```

비활성화하고 포털 속성 파일을 사용하여 작업하는 방법은 다음과 같습니다.

1. 환경 변수를 비활성화하고 포털 속성 파일에 대한 바인드 마운트를 설정합니다. 

    ```bash
    docker run -e LIFERAY_TERMS_PERIOD_OF_PERIOD_USE_PERIOD_REQUIRED -v $(pwd):/mnt/liferay ...
    ```


사용 조건 요구 사항은 포털 속성을 기반으로 합니다. [기본 포털 속성 설정](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) ( `LIFERAY_TERMS_PERIOD_OF_PERIOD_USE_PERIOD_REQUIRED`검색)에는 사용 약관이 필요합니다. 

    ```properties
    terms.of.use.required=true
    ```

1. 바인드 마운트 경로에 있는 `portal-ext.properties` 파일에서 원하는 설정을 지정하십시오. [포털 속성 파일 사용](#using-a-portal-properties-file) 을 참조하세요.

    ```bash
    echo "terms.of.use.required=false" >> ./files/portal-ext.properties
    ```
1. 컨테이너를 다시 시작합니다.

컨테이너는 속성 설정을 사용합니다.

## 시스템 특성

[시스템 속성](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/system.properties.html) 은 `system-ext.properties` 파일을 사용하여 재정의할 수 있습니다. 이 예에서는 [bind mount](./providing-files-to-the-container.md)을 사용합니다.

1. 호스트 폴더와 하위 폴더를 생성하여 경로 `[host folder]/files/tomcat/webapps/ROOT/WEB-INF/classes`을 생성합니다. 

    ```bash
    mkdir -p [host folder]/files/tomcat/webapps/ROOT/WEB-INF/classes
    ```


1. 생성한 `[호스트 폴더]/files/tomcat/webapps/ROOT/WEB-INF/classes` 폴더의 `system-ext.properties` 파일에 속성 재정의를 추가합니다. 예를 들어, 

    ```bash
    echo "net.sf.ehcache.skipUpdateCheck=false" >> [host folder]/files/tomcat/webapps/ROOT/WEB-INF/classes/system-ext.properties
    ```

1. 마운트를 호스트 폴더에 바인딩하는 `-v` 옵션을 사용하여 새 컨테이너를 실행합니다. 

    ```bash
    docker run -it -m 8g -p 8080:8080 -v [host folder path]:/mnt/liferay liferay/dxp:[tag]
    ```

    ```{note}
    컨테이너에 대한 바인딩 마운팅에 대한 자세한 내용은 [컨테이너에 파일 제공](./providing-files-to-the-container.md#bind-mounting-a-host-folder-to-mnt-liferay) 을 참조하세요. `/mnt/liferay` 폴더.
    ```

속성은 제어판의 **구성** &rarr; **서버 관리** &rarr; **속성** &rarr; **시스템 속성** 에서 볼 수 있습니다.

## 시스템 설정

Liferay 시스템 설정은 [제어판](../../../system-administration/configuring-liferay/system-settings.md) 에서 구성하거나 컨테이너에 [구성 파일](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md) (`.config` 파일)을 제공하여 구성할 수 있습니다. `.config` 파일을 처음부터 만들거나 UI에서 구성 요소 구성 값을 내보내서 만들 수 있습니다.

다음 방법 중 하나를 사용하여 시스템 설정을 수정합니다.

* [새 컨테이너에 구성 적용](#applying-configurations-to-a-new-container)
* [런타임 시 구성 파일 적용](#applying-configuration-files-at-run-time)
* [제어판 사용](../../../system-administration/configuring-liferay/system-settings.md)

### 새 컨테이너에 구성 적용

아직 컨테이너를 만들지 않은 경우 다음 단계에 따라 [바인드 마운트](./providing-files-to-the-container.md)을 사용하여 새 컨테이너에 `.config` 파일을 제공합니다.

1. 호스트 폴더와 하위 폴더를 만들어 경로를 `[host folder]/files/osgi/configs`로 만듭니다. 

    ```bash
    mkdir -p [host folder]/files/osgi/configs
    ```

1. `.config` 파일을 호스트 폴더의 `files/osgi/configs` 하위 폴더에 복사합니다. 예를 들어, 

    ```
    cp ~/*.config [host folder path]/files/osgi/configs
    ```

1. 호스트 폴더를 바인드 마운트하는 `-v` 옵션을 사용하여 컨테이너를 실행합니다. 

    ```bash
    docker run -it -m 8g -p 8080:8080 -v [host folder path]:/mnt/liferay liferay/dxp:[tag]
    ```

    ```{note}
    컨테이너에 대한 바인딩 마운팅에 대한 자세한 내용은 [컨테이너에 파일 제공](./providing-files-to-the-container.md#bind-mounting-a-host-folder-to-mnt-liferay) 을 참조하세요. `/mnt/liferay` 폴더.
    ```

시스템 구성 요소 구성은 해당 구성 요소에 대한 화면의 **구성** &rarr; **시스템 설정** 제어판에서 볼 수 있습니다.

### 런타임 시 구성 파일 적용

이미 컨테이너가 있는 경우 다음과 같이 `docker cp` 명령을 사용하여 런타임에 `.config` 파일을 컨테이너에 복사할 수 있습니다.

```bash
docker cp [config file] [container]:/opt/liferay/osgi/configs
```

## 결론

이제 Liferay 컨테이너의 JVM 옵션, 포털 속성, 이미지 Env 변수, 시스템 속성 및 시스템 설정을 구성하는 방법을 알았습니다.

## 관련 주제

* [Liferay Docker 이미지 사용](../using-liferay-docker-images.md)
* [컨테이너 수명 주기 및 API](./container-lifecycle-and-api.md)
* [컨테이너에 파일 제공](./providing-files-to-the-container.md)
* [컨테이너에 앱 및 기타 아티팩트 설치](./installing-apps-and-other-artifacts-to-containers.md)
* [Docker에서 DXP 패치](./patching-dxp-in-docker.md)