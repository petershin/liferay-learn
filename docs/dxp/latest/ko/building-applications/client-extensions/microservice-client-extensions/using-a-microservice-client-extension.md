# 마이크로서비스 클라이언트 확장 사용

마이크로서비스 클라이언트 확장은 Liferay와의 통신을 위해 OAuth 2에 의존하는 독립 실행형 서버 프로세스입니다. 마이크로 서비스는 리소스 서버이고 Liferay는 인증 서버입니다. 자세한 내용은 [OAuth 사용 2](../../../headless-delivery/using-oauth2.md) 을 참조하십시오. 이 데모의 샘플 프로젝트는 리소스 서버(마이크로 서비스)의 보호된 경로에서 페이로드를 수집하고 [사용자 지정 요소](../frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) 클라이언트 확장을 기반으로 프런트 엔드 위젯에 표시합니다. 독립 실행형 [Spring Boot 애플리케이션](https://docs.spring.io/spring-boot/docs/current/reference/html/getting-started.html#getting-started) 과 조정하기 위해 이 예제에서는 두 가지 클라이언트 확장 유형이 사용됩니다.

| 배포 가능하거나 실행 가능한 코드                  | 유형                                                                                                                           | 묘사                                                         | 작업 공간 샘플                        |
|:----------------------------------- |:---------------------------------------------------------------------------------------------------------------------------- |:---------------------------------------------------------- |:------------------------------- |
| Liferay 샘플 OAuth 애플리케이션 사용자 에이전트 배포 | 클라이언트 확장: [`oAuthApplicationUserAgent`](../configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md) | 로그인한 사용자가 사용자 정의 요소에서 마이크로서비스의 페이로드를 볼 수 있도록 인증 채널을 구성합니다. | liferay-sample-etc-spring-boot  |
| Spring Boot 마이크로서비스 애플리케이션 실행       | 보호된 엔드포인트: `/dad/joke`                                                                                                       | 리소스 서버에 대한 보호된 엔드포인트. JWT 토큰을 사용하고 페이로드를 반환합니다.            | liferay-sample-etc-spring-boot  |
| Liferay 샘플 사용자 정의 요소 2 배포           | 클라이언트 확장: [`customElement`](../frontend-client-extensions/custom-element-yaml-configuration-reference.md)                   | 사용자 정의 요소를 정의하고 OAuth 2 클라이언트 코드를 통해 리소스 서버에서 페이로드를 요청합니다. | liferay-sample-custom-element-2 |

```{note}
편의를 위해 이 자습서에서는 샘플 작업 영역에서 배포할 준비가 된 사용자 지정 요소를 사용합니다. 그러나 사용자 정의 요소 클라이언트 확장은 여기서 초점이 아닙니다. 권한 부여 서버를 호출하고 리소스 서버의 페이로드를 표시할 수 있는 모든 프런트 엔드 기술을 사용자 지정 요소 대신 사용할 수 있습니다.
```

리소스 서버에는 보호 경로 `/dad/joke`있습니다. 로그인한 사용자를 대신하여 클라이언트(예: 위젯)는 인증 서버(Liferay)에서 인증 코드를 요청합니다. 토큰이 부여되면 클라이언트는 리소스 서버(Spring Boot 애플리케이션)와 통신합니다.

유형 `oAuthApplicationUserAgent` 의 확장은 클라이언트 프로필 사용자 에이전트 애플리케이션을 갖는 것으로 등록되며, 이는 인증 코드 흐름이 사용됨을 의미합니다.

## 전제 조건

클라이언트 확장 프로그램 개발을 시작하려면

1. Java(JDK 8 또는 JDK 11)를 설치합니다.

   ```{note}
   지원되는 JDK, 데이터베이스 및 환경에 대한 [호환성 매트릭스](https://help.liferay.com/hc/ko/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) 를 확인하세요. 권장 JVM 설정은 [JVM 구성](../../../installation-and-upgrades/reference/jvm-configuration.md)을 참조하십시오.
   ```

1. 샘플 작업 공간을 다운로드하고 압축을 풉니다.

   ```bash
   curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
   ```

   ```bash
   unzip -d liferay-sample-workspace com.liferay.sample.workspace-latest.zip
   ```

이제 마이크로서비스를 시작하고 클라이언트 확장을 Liferay에 배포할 수 있는 도구가 있습니다.

```{include} /_snippets/run-liferay-portal.md
```

## 마이크로서비스 프로젝트의 클라이언트 확장 검사

`client-extensions/liferay-sample-etc-spring-boot/client-extension.yaml` 파일은 샘플 작업공간에서 마이크로서비스 클라이언트 확장 프로젝트를 정의합니다. 대부분의 정의된 클라이언트 확장(예: `type: *Action`이 있는 것)은 이 예제에 필요하지 않습니다. `client-extension.yaml`에서 필요한 줄은 다음과 같이 요약할 수 있습니다.

```yaml
assemble:
    - fromTask: bootJar
liferay-sample-etc-spring-boot-oauth-application-user-agent:
    .serviceAddress: localhost:58081
    .serviceScheme: http
    name: Liferay Sample Etc Spring Boot Spring Boot OAuth Application User Agent
    scopes:
        - Liferay.Headless.Admin.Workflow.everything
    type: oAuthApplicationUserAgent
```

외부 애플리케이션/마이크로서비스는 [Spring Boot Gradle Plugin](https://docs.spring.io/spring-boot/docs/current/gradle-plugin/reference/htmlsingle/) 에서 사용할 수 있는 `bootJar` 명령으로 생성됩니다. 애플리케이션 JAR은 LXC에 배포하기 위해 LUFFA에 포함되어야 합니다.

`client-extension.yaml` 의 가장 중요한 부분은 `liferay-sample-etc-spring-boot-oauth-application-user-agent` 정의에 있습니다. 이렇게 하면 Liferay가 인증 서버로 설정되므로 다음에 배포하는 프런트 엔드 클라이언트 확장이 리소스 서버의 보안 엔드포인트를 호출하고 해당 페이로드를 표시할 수 있습니다.

## 사용자 지정 요소 프로젝트의 클라이언트 확장 검사

`client-extensions/liferay-sample-custom-element-2/client-extension.yaml` 파일은 샘플 작업공간에서 사용자 정의 요소 클라이언트 확장 프로젝트를 정의합니다.

```yaml
assemble:
    - from: build/static
      into: static
liferay-sample-custom-element-2:
    cssURLs:
        - css/main.*.css
    friendlyURLMapping: liferay-sample-custom-element-2
    htmlElementName: liferay-sample-custom-element-2
    instanceable: false
    name: Liferay Sample Custom Element 2
    portletCategoryName: category.client-extensions
    type: customElement
    urls:
        - js/main.*.js
    useESM: true
```

자세한 내용은 [맞춤 요소 및 IFrame 클라이언트 확장 이해](../frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) 을 참조하세요.

## OAuth 애플리케이션 사용자 에이전트 클라이언트 확장 배포

1. 샘플 작업 공간의 `client-extensions/liferay-sample-etc-spring-boot` 폴더로 이동합니다.

1. 실행

   ```bash
   ../../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

1. Liferay의 로그에서 클라이언트 확장이 배포되고 시작되었는지 확인합니다.

   ```log
   STARTED liferay-sample-etc-spring-boot_1.0.0 [1588]
   2023-06-07 14:24:56.245 INFO  [fileinstall-directory-watcher][BundleStartStopLogger:77] STARTED liferay-sample-etc-spring-boot_1.0.0 [1702]
   2023-06-07 14:24:56.315 INFO  [CM Event Dispatcher (Fire ConfigurationEvent: pid=com.liferay.oauth2.provider.configuration.OAuth2ProviderApplicationUserAgentConfiguration~liferay-sample-etc-spring-boot-oauth-application-user-agent)][InterpolationConfigurationPlugin:135] Replaced value of configuration property 'homePageURL' for PID com.liferay.oauth2.provider.configuration.OAuth2ProviderApplicationUserAgentConfiguration~liferay-sample-etc-spring-boot-oauth-application-user-agent
   2023-06-07 14:24:56.365 INFO  [CM Event Dispatcher (Fire ConfigurationEvent: pid=com.liferay.oauth2.provider.configuration.OAuth2ProviderApplicationUserAgentConfiguration~liferay-sample-etc-spring-boot-oauth-application-user-agent)][OAuth2ProviderApplicationUserAgentConfigurationFactory:179] OAuth 2 application with external reference code liferay-sample-etc-spring-boot-oauth-application-user-agent and company ID 20096 has client ID id-df5840e5-a91c-dcae-9bd8-873508a699
   ```

   또한 OAuth 사용자 에이전트에 대한 메시지가 기록됩니다.

1. OAuth 애플리케이션 사용자 에이전트가 Liferay에 추가되었는지 확인합니다. **제어판** &rarr; **OAuth2 관리** 로 이동합니다.

   ![Liferay 샘플 OAuth 애플리케이션 사용자 에이전트는 클라이언트 확장을 배포할 때 추가됩니다.](./using-a-microservice-client-extension/images/01.png)

Liferay 샘플 OAuth 애플리케이션 사용자 에이전트는 Liferay가 보호된 엔드포인트를 통해 Spring Boot 애플리케이션의 데이터에 액세스할 수 있도록 필요한 [OAuth 2 인증](../../../headless-delivery/using-oauth2.md) 제공합니다. 이 경우 Liferay가 애플리케이션을 승인하는 데 필요한 모든 것은 `application-default.properties`에서 외부 참조 코드를 선언하는 것입니다.

```properties
liferay.oauth.application.external.reference.codes=liferay-sample-etc-spring-boot-oauth-application-user-agent
```

## 마이크로서비스 시작

`client-extensions/liferay-etc-spring-boot/` 폴더에서 다음을 실행합니다.

```sh
../../gradlew bootRun
```

Spring Boot 애플리케이션이 시작되고 로그에 메시지가 출력됩니다.

```log
...
2023-06-07 10:33:44.514  INFO 2897671 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 58081 (http) with context path ''
2023-06-07 10:33:44.519  INFO 2897671 --- [           main] c.l.sample.SampleSpringBootApplication   : Started SampleSpringBootApplication in 1.094 seconds (JVM running for 1.262)
<==========---> 80% EXECUTING [1h 43m 56s]
> :client-extensions:liferay-sample-etc-spring-boot:bootRun
```

## 사용자 지정 요소 클라이언트 확장 배포

마이크로서비스가 실행 중이고 OAuth2 애플리케이션 통신 채널이 이제 프로비저닝되어 DXP에서 사용할 수 있습니다. 이 예제에서는 [Custom Element 클라이언트 확장](../frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) 을 사용하여 마이크로서비스에서 생성된 데이터를 표시합니다. 배포하려면

1. `client-extensions/liferay-sample-custom-element-2` 폴더로 이동합니다.

1. 실행

   ```bash
   ../../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

## 페이지에 아빠 농담 표시

실행 중인 Liferay의 페이지에 Liferay 샘플 사용자 정의 요소 2 위젯을 추가합니다. 페이지를 게시하면 아빠 농담이 위젯에 나타납니다.

![맞춤 요소 2는 페이지가 로드될 때마다 나쁜 농담을 표시합니다.](./using-a-microservice-client-extension/images/02.png)

## OAuth2가 요청을 승인하는 방법

인증된 사용자가 클라이언트 애플리케이션이 있는 페이지(사용자 정의 요소)를 로드하면 사용자 에이전트 확장에 의해 구성된 통신 채널(즉, Liferay가 인증 서버임)로 인해 사용 가능한 인증 코드를 요청합니다. Liferay가 코드를 반환하면 클라이언트가 액세스 토큰을 요청합니다. 토큰을 사용하여 클라이언트는 마이크로서비스의 엔드포인트에 액세스할 수 있습니다. 리소스 서버는 JWKS URI 끝점을 사용하여 Liferay로 JWT 토큰의 유효성을 검사합니다. 이는 백그라운드에서 자동으로 수행됩니다.

`liferay-sample-custom-element-2` 클라이언트 확장의 `DadJoke.js` 파일에는 권한 부여 파이프라인을 시작하는 중요한 호출이 있습니다.

```js
try {
    oAuth2Client = Liferay.OAuth2Client.FromUserAgentApplication(
        'liferay-sample-etc-spring-boot-oauth-application-user-agent'
    );
}
```

이 호출은 리소스 서버의 `/dad/joke` 경로에서 리소스를 요청할 때 클라이언트가 전달자 토큰으로 사용할 수 있는 토큰을 클라이언트에 제공합니다. 클라이언트 코드는 요청하는 서버의 사이트에 대해 걱정할 필요가 없습니다. 이 정보는 OAuth 2 애플리케이션에 캡슐화되어 있기 때문입니다. 자체 호스팅 환경에서는 OAuth 애플리케이션 사용자 에이전트의 `client-extension.yaml` 속성에서 `.serviceAddress` 및 `.serviceScheme`로 선언됩니다. LXC 환경에서 리소스 서버는 Liferay에 의해 제어되므로 해당 사이트를 선언할 필요가 없습니다. 이렇게 하면 클라이언트와 리소스 서버 통신에 대한 인증 코드 흐름이 설정되므로 남은 것은 클라이언트가 리소스 서버의 엔드포인트를 호출하는 것뿐입니다. `DadJoke.js` 다음과 같이 `/dad/joke` 경로에서 가져옵니다.

```js
React.useEffect(() => {
   oAuth2Client
      ?.fetch('/dad/joke')
      .then((response) => response.text())
      .then((joke) => {
         setJoke(joke);
      })
      .catch((error) => console.log(error));
}, []);
```

<!-- Greg 
I think it would be good I think to show the request coming into the RestController and explain a bit about the JWT that is available there (representing the user)
     Russ
I'm leaving this comment because Greg hasn't validated the below text.
-->

OAuth 클라이언트는 인증된 사용자를 나타내는 `Jwt` 토큰을 마이크로 서비스로 보냅니다. 인증 코드, 부여된 권한 및 기타 많은 세부 정보가 포함됩니다. 이 샘플은 편의를 위해 다음 세부 정보를 로그에 인쇄합니다.

```log
2023-06-08 16:01:42.617  INFO 3851009 --- [io-58081-exec-5] c.liferay.sample.DadJokeRestController   : JWT Claims: {sub=20123, grant_type=authorization_code, authorization_code=404dd760ffcaa322fd38387319941990e5e10bb2d97ab360e63271f613eb33f1, scope=Liferay.Headless.Admin.Workflow.everything, iss=localhost, exp=2023-06-08T20:10:51Z, iat=2023-06-08T20:00:51Z, jti=8ffd31c001c54b1331d484731ff1e43b341dd4cb7232b98da96a4aaec6b6a6d, client_id=id-60ac3dc8-f5e8-484e-25b3-23d435e838c6, code_verifier=~zACCmEV6ZuhZHAZ0Q.RaEvGo5YUMF6x2QimtgT4lgXjWB6_Jc0QtVDNrtnxeOTfondPxH4pwxY0aAI-Op0oz1vajQTTqhrNegJnSZ4vLEBZGgE9m5Jgmi3ORDy1Bg7Q, username=test@liferay.com}
2023-06-08 16:01:42.618  INFO 3851009 --- [io-58081-exec-5] c.liferay.sample.DadJokeRestController   : JWT ID: 8ffd31c001c54b1331d484731ff1e43b341dd4cb7232b98da96a4aaec6b6a6d
2023-06-08 16:01:42.618  INFO 3851009 --- [io-58081-exec-5] c.liferay.sample.DadJokeRestController   : JWT Subject: 20123
```