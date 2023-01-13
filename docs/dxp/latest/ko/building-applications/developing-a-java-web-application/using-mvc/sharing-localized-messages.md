# 현지화된 메시지 공유

응용 프로그램에서 작업할 때 각각 고유한 언어 키가 있는 여러 모듈이 있을 수 있습니다. 다양한 언어 속성 파일을 다른 위치에 유지하는 대신 한 위치로 통합합니다. 이 예제 프로젝트는 여러 모듈에서 언어 키를 공유하는 방법을 보여줍니다.

## 튜토리얼 코드 실행
```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps:

1. Download and unzip the example.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/building-applications/developing-a-java-web-application/using-mvc/liferay-u8t2.zip -O
    ```

    ```bash
    unzip liferay-u8t2.zip
    ```

1. 모듈 루트에서 빌드 및 배포합니다.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 배포된 jar를 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```bash
    STARTED com.acme.u8t2.impl_1.0.0 [1650]
    STARTED com.acme.u8t2.web_1.0.0 [1651]
    ```

1. 예제 모듈이 작동하는지 확인하십시오. 브라우저를 `https://localhost:8080`로 엽니다.

1. U8T2 포틀릿을 페이지에 추가하십시오. 샘플 위젯에서 예제 포틀릿을 찾을 수 있습니다.

    ![U8T2 포틀릿을 페이지에 추가하십시오.](./sharing-localized-messages/images/01.png)

    환영 메시지 헤더와 색상 목록이 표시됩니다. 색상의 언어 키는 공유 언어 키에서 가져옵니다. 언어 키 `색상` 은 Liferay의 글로벌 언어 키에서 가져옵니다.

1. 이 예제 프로젝트에는 포르투갈어 및 일본어용 로케일도 포함되어 있습니다. 예를 들어 언어 선택기를 사용하여 포르투갈어(브라질) 또는 일본어를 선택하면 환영 메시지와 색상 목록이 표시됩니다.

    ![이 예는 포르투갈어 및 일본어에 대한 로케일을 보여줍니다.](./sharing-localized-messages/images/02.png)

이제 그것이 어떻게 작동하는지 배울 시간입니다.

## 언어 속성 파일 만들기

모든 공유 언어 키를 보유할 별도의 프로젝트 모듈을 만듭니다. 예제 프로젝트에서 공유 키는 `Acme U8T2 Impl` 모듈에 있습니다.

`Language.properties` 파일을 만들고 모듈의 `src/main/resources/content` 폴더에 추가합니다. 파일에서 다른 모듈과 공유할 키를 정의합니다.

예제 프로젝트에는 `Acme U8T2 Web` 모듈에서 사용하는 6가지 색상 목록이 있습니다.

```properties
blue=Blue
green=Green
orange=Orange
purple=Purple
red=Red
yellow=Yellow 
```

다른 로캘에 대한 언어 속성 파일도 폴더에 포함될 수 있습니다. 예를 들어 일본어에 대한 언어 키를 포함하려면 폴더에 `Language_ja.properties` 파일을 추가합니다.

## bnd 명령어 추가

언어 키를 공유하려는 각 모듈에 대해 bnd 헤더에 리소스를 지정해야 합니다.

```properties
Bundle-Name: Acme U8T2 Web
Bundle-SymbolicName: com.acme.u8t2.web
Bundle-Version: 1.0.0
-liferay-aggregate-resource-bundles: com.acme.u8t2.impl
```

예제 프로젝트에는 `Acme U8T2 Impl`의 색상 언어 키를 사용하는 웹 포틀릿이 있습니다. `Acme U8T2 Web` 모듈의 `bnd.bnd` 파일에서 리소스 번들이 지정됩니다.

```properties
-liferay-aggregate-resource-bundles: com.acme.u8t2.impl
```

여전히 개별 모듈에 일부 언어 키를 배치하도록 선택할 수 있습니다. 예를 들어, 예제 프로젝트의 환영 메시지는 `Acme U8T2 Impl`의 공유 키가 아닌 `Acme U8T2 Web` 모듈의 언어 키에서 가져옵니다. 개별 모듈의 언어 키는 `-liferay-aggregate-resource-bundles`로 지정된 공유 키보다 우선합니다.

## 관련 주제

* [리소스 번들 집계](../../core-frameworks/localization/reference/aggregating-resource-bundles.md)
