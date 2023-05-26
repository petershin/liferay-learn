# 원격 라이브 스테이징 구성

**원격 라이브 스테이징** 사용하면 스테이징 및 라이브 환경이 별도의 Liferay 서버에서 호스팅됩니다. 활성화되면 스테이징 구성에 사용된 사이트 또는 자산 라이브러리가 스테이징 환경이 되고 원격 서버가 라이브 환경이 됩니다.

원격 라이브 스테이징을 활성화하기 전에 스테이징 및 라이브 환경에 사용할 Liferay 서버를 구성해야 합니다. 또한 원격 서버에 빈 사이트 또는 자산 라이브러리를 새로 만들고 스테이징 구성 중에 해당 ID를 사용해야 합니다.

## Liferay 서버 준비

아직 구성하지 않은 경우 다음 단계에 따라 원격 라이브 스테이징을 위해 Liferay 서버를 구성하십시오.

1. 두 Liferay 서버의 [`Portal-ext.properties`](../../../installation-and-upgrades/reference/portal-properties.md) 파일에 다음 속성을 추가하여 서버의 공유 인증 키를 지정합니다.

   ```
   tunneling.servlet.shared.secret=[secret]
   tunneling.servlet.shared.secret.hex=[value]
   ```

   각 속성 값은 선택한 암호화 알고리즘과 16진수 인코딩(권장) 또는 인쇄 가능한 ASCII 문자(보안 수준 낮음)를 사용하는지 여부에 따라 다릅니다. 16진수 인코딩을 사용하지 않기로 결정한 경우 `tunneling.servlet.shared.secret` 의 값은 ASCII 규격이어야 합니다.

   사용 가능한 암호화 알고리즘은 다음 키 길이를 지원합니다.

   **AES** : 128, 192 및 256비트 키

   **복어** : 32 - 448비트 키

   **DESede(트리플 DES**) : 112 또는 168비트 키. Liferay의 최소 키 길이는 56비트 키를 지원하지 않습니다. <!--Does this limit apply to Blowfish?-->

1. 각 서버의 `portal-ext.properties` 파일에 다음 속성을 추가하여 각 서버를 다른 서버의 허용된 서버 목록에 추가합니다.

   ```properties
   tunnel.servlet.hosts.allowed=127.0.0.1,SERVER_IP,[OTHER_SERVER_IP]
   ```

   서버에 여러 IP 주소가 있는 경우 각 IP 주소를 추가해야 합니다.

   ```{important}
   IPv6 주소의 유효성을 검사하는 경우 IPv4 주소를 강제로 사용하지 않도록 앱 서버의 JVM을 구성해야 합니다. 예를 들어 Tomcat을 사용하는 경우 `$TOMCAT_HOME\bin\setenv.[bat|sh]` 파일에 `-Djava.net.preferIPv4Stack=false` 속성을 추가합니다.
   ```

1. 원격 인스턴스의 **터널 인증 확인자 구성** 을 업데이트합니다.

   이렇게 하려면 **제어판** &rarr; **구성** &rarr; **시스템 설정** &rarr; **API 인증** &rarr; **터널 인증** 으로 이동하십시오.

   **/api/liferay/do** 클릭하고 **Hosts Allowed** 필드에 사용 중인 추가 IP 주소를 삽입합니다. 완료되면 **업데이트** 을 클릭합니다.

   ![제어판을 통해 원격 인스턴스의 터널 인증 확인자 구성을 업데이트합니다.](./configuring-remote-live-staging/images/01.png)

   ```{note}
   기본적으로 활성화되어 있는 동안 각 Liferay 서버의 터널링 서블릿 [인증 검증자](../../../installation-and-upgrades/securing-liferay/securing-web-services/using-authentication-verifiers.md ) 사용 가능.
   ```

   또는 이 구성을 Liferay 인스턴스의 OSGi 파일에 작성할 수 있습니다(예: `osgi/configs/com.liferay.portal.security.auth.verifier.tunnel.module.configuration.TunnelAuthVerifierConfiguration-default.config`):

   ```
   enabled=true
   hostsAllowed=127.0.0.1,SERVER_IP,[Local server IP address]
   serviceAccessPolicyName=SYSTEM_User_PASSWORD
   urlsIncludes=/api/liferay/do
   ```

1. 변경 사항을 구현하려면 두 Liferay 서버를 모두 다시 시작하십시오.

다시 시작하면 두 서버 모두 스테이징 구성을 위한 준비가 된 것입니다.

```{important}
원격 스테이징 환경에 패치를 적용할 때 모든 서버에 패치를 적용해야 합니다. 서로 다른 패치 수준에 서버를 두는 것은 좋은 방법이 아니며 가져오기 실패 및 데이터 손상으로 이어질 수 있습니다. 원격 스테이징이 올바르게 작동하려면 모든 서버를 동일한 패치 수준으로 업데이트해야 합니다.
```

## 원격 라이브 스테이징 설정

Liferay 서버를 준비했으면 다음 단계에 따라 사이트 또는 자산 라이브러리에 대한 원격 라이브 스테이징을 설정하십시오.

1. 사이트 또는 자산 라이브러리에서 스테이징 애플리케이션을 엽니다.

   사이트의 경우 **사이트 메뉴**(![Site Menu](../../../images/icon-product-menu.png)) &rarr; **게시** &rarr; **준비** 로 이동합니다.

   Asset Libraries의 경우 **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png)) &rarr; **Applications 탭** &rarr; **Asset Libraries** 로 이동합니다. 그런 다음 원하는 자산 라이브러리를 열고 게시에서 **준비** 클릭합니다.

1. **원격 라이브** 선택합니다. 그러면 추가 구성 필드가 나타납니다.

   ![원격 라이브 스테이징을 선택합니다.](./configuring-remote-live-staging/images/02.png)

1. 다음 원격 라이브 연결 세부 정보를 입력합니다.

   **원격 호스트/IP** : **원격 호스트/IP** 필드에 원격 서버의 IP 주소를 입력합니다. 이는 `portal-ext.properties` 파일에 지정된 `tunnel.servlet.hosts.allowed` 속성과 일치해야 합니다.

   **원격 포트** : 원격 DXP 인스턴스의 포트를 **원격 포트** 필드에 입력합니다.

   **원격 경로 컨텍스트** : **원격 경로 컨텍스트 입력** . 루트가 아닌 포털 서블릿 컨텍스트 경로가 원격 Liferay 서버에서 사용되는 경우에만 필요합니다. 이 컨텍스트에 대한 액세스는 프록시나 방화벽에 의해 차단되어서는 안 됩니다.

   **원격 사이트 ID** / **원격 자산 라이브러리 ID** : 원하는 대상에 대해 **사이트 ID** / **자산 라이브러리 ID** 입력합니다.

   ```{note}
   IPv6 주소를 구성하는 경우 *Remote Host/IP* 필드에 입력할 때 대괄호를 포함해야 합니다(예: [0:0:0:0:0:0:0:1]).

   원격 서버가 클러스터인 경우 원격 호스트/IP를 클러스터의 부하 분산된 IP 주소로 설정하여 게시 프로세스의 가용성을 높일 수 있습니다. 자세한 내용은 [클러스터 환경에서 원격 스테이징 구성](https://help.liferay.com/hc/ko/articles/360018175251-Configuring-Remote-Staging-in-a-Clustered-Environment) 을 참조하십시오.
   ```

1. 스테이징에서 라이브로 페이지를 게시하기 위해 보안 네트워크 연결(즉, HTTPS)을 사용할지 여부를 결정합니다.

1. 사이트 또는 자산 라이브러리에 사용되는 원격 URL을 수동으로 정의할지 여부를 결정합니다.

1. (사이트 전용)**페이지 버전 관리** 활성화 여부를 선택합니다.

   ![페이지 버전 관리를 활성화합니다.](./configuring-local-live-staging/images/03.png)

1. 준비하려는 **데이터** 및 **콘텐츠** 유형을 선택합니다.

   자산 라이브러리는 문서, 미디어 및 웹 콘텐츠 애플리케이션에 대한 스테이징 데이터만 지원합니다.

   사이트를 사용하면 다음 애플리케이션에 대한 데이터를 준비할 수 있습니다.

   ![준비하려는 데이터 및 콘텐츠 유형을 선택합니다.](./configuring-remote-live-staging/images/04.png)

   ```{warning}
   응용 프로그램이 확인되면 해당 데이터가 복사되며 라이브 사이트에서 직접 편집하지 못할 수 있습니다. 응용 프로그램을 선택 해제할 때 스테이징의 변경 사항이 손실될 수 있으므로 먼저 게시되었는지 확인하십시오. 자세한 내용은 [스테이징에서 데이터 및 콘텐츠 유형 관리](./managing-data-and-content-types-in-staging.md)를 참조하세요.
   ```

1. 스테이징 프로세스를 시작하려면 **저장** 클릭하십시오. 이 프로세스의 기간은 사이트 또는 자산 라이브러리의 크기에 따라 다릅니다.

   ```{note}
   원격 라이브 스테이징 활성화 시도가 실패하면 서버를 제대로 준비했는지 확인하십시오.
   ```

프로세스가 완료되면 원격 라이브 스테이징을 사용할 준비가 된 것입니다. 스테이징 환경의 게시 기능 탐색에 대한 자세한 내용은 [사이트 스테이징 UI 참조](./site-staging-ui-reference.md) 을 참조하십시오.

## 원격 라이브 스테이징 권한

사용자가 스테이징에서 라이브로 변경 사항을 게시하려고 하면 Liferay는 사용자의 이메일 주소, 화면 이름 또는 사용자 ID를 원격 서버에 전달하여 권한 확인을 수행합니다. 성공하려면 게시 사용자가 두 서버에서 동일한 자격 증명과 권한을 가지고 있어야 합니다.

스테이징에서 프로덕션/라이브로 변경 사항을 게시할 수 있는 로컬 사용자 권한을 부여하려면 원격 서버의 사용자에 대해 동일한 권한을 가진 동일한 사용자 계정을 만듭니다.

이 프로세스를 단순화하기 위해 LDAP를 사용하여 선택한 사용자 계정을 로컬 서버에서 원격 서버로 복사할 수 있습니다. 자세한 내용은 [LDAP 디렉터리에 연결](../../../users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory.md) 을 참조하십시오.

## 원격 스테이징의 버퍼 크기 구성

원격 라이브 준비를 사용 중이고 많은 양의 콘텐츠를 게시하는 경우 이 프로세스가 느려지고 많은 양의 네트워크 트래픽이 발생할 수 있습니다. 이를 돕기 위해 Liferay DXP는 하나의 대용량 데이터 덤프 대신 데이터를 단편적으로 전송합니다. `portal-ext.properties` 파일에서 다음 포털 특성을 설정하여 데이터 트랜잭션의 크기를 제어할 수 있습니다.

```
staging.remote.transfer.buffer.size
```

이 속성은 원격 준비를 위한 파일 블록 크기를 설정합니다. 원격 스테이징에 사용되는 LAR 파일이 이 크기를 초과하면 전송 전에 파일을 여러 파일로 분할한 다음 원격 서버에서 다시 조립합니다. 기본 버퍼 크기는 10MB입니다.

## 원격 라이브 스테이징 비활성화

원격 라이브 스테이징을 비활성화하면 데이터를 삭제하지 않고 환경 간의 연결이 비활성화됩니다. 데이터가 지워지지 않고 프로세스가 시작되지 않기 때문에 원격 라이브 스테이징 비활성화는 거의 즉각적입니다.

```{warning}
원격 스테이징을 비활성화할 때 라이브 사이트 또는 자산 라이브러리에 계속 액세스할 수 있는지 확인하여 양측이 통신할 수 있도록 해야 합니다. 라이브 환경을 종료하지 마십시오. 환경 간에 네트워크 연결이 끊어지면 스테이징을 강제로 비활성화하라는 오류 메시지가 나타납니다.

스테이징을 강제로 비활성화하면 스테이징 서버에서 콘텐츠가 아닌 스테이징 정보가 지워집니다. 라이브 환경은 잠긴 상태로 유지됩니다. 가능한 해결 방법은 새 라이브 사이트 또는 자산 라이브러리를 만들고 필요한 경우 여기에 콘텐츠를 가져오는 것입니다.
```

원격 라이브 스테이징을 비활성화하려면 다음 단계를 따르십시오.

1. 사이트 또는 자산 라이브러리에서 스테이징 애플리케이션을 엽니다.

1. 응용 프로그램 표시줄에 있는 **작업** 버튼( ![Actions button](../../../images/icon-actions.png) )을 클릭하고 **스테이징 구성** 선택합니다.

   ![애플리케이션 표시줄에서 작업 버튼을 클릭하고 스테이징 구성을 선택합니다.](./configuring-remote-live-staging/images/05.png)

1. 스테이징 구성에 대해 **없음** 선택하고 **저장** 클릭합니다.

## 관련 주제

* [스테이징 개요](../staging.md)
* [사이트 준비 UI 참조](./site-staging-ui-reference.md)
* [스테이징 권한 관리](./managing-staging-permissions.md)
* [스테이징에서 데이터 및 콘텐츠 유형 관리](./managing-data-and-content-types-in-staging.md)
