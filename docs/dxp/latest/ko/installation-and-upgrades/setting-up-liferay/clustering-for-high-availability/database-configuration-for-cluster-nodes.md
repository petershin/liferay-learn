# 클러스터 노드에 대한 데이터베이스 구성

최소한 DXP 클러스터의 노드는 [동일한 데이터베이스를 공유하도록 구성](./example-creating-a-simple-dxp-cluster.md#configure-cluster-link-and-the-other-server-connections) 되어야 합니다. )(또는 데이터베이스 클러스터)이 작동해야 합니다. 여기에서 논의된 최적화는 DXP 클러스터의 데이터베이스 성능을 더욱 향상시킬 수 있으며 DXP 사용 및 예상 트랜잭션 볼륨을 고려하여 고려해야 합니다.

```{warning}
클러스터링은 내장된 HSQL 데이터베이스에서는 작동하지 않습니다.
```

## 읽기 쓰기 데이터베이스 구성

데이터베이스 성능을 향상시키기 위해 읽기-작성기 데이터베이스 구성을 사용할 수 있습니다. 읽기 및 읽기-쓰기 작업에 동일한 데이터 소스를 사용하는 대신 이 전략은 각 작업 유형에 대해 별도의 데이터 소스를 사용합니다. DXP의 AOP(Aspect Oriented 프로그래밍) 트랜잭션 인프라는 읽기 트랜잭션을 읽기 데이터 소스로, 읽기-쓰기 트랜잭션을 쓰기 데이터 소스로 지시합니다.

![읽기-작성기 데이터베이스 상호 작용](./database-configuration-for-cluster-nodes/images/01.png)

별도의 읽기 및 읽기-쓰기 [데이터 소스](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#JDBC) 에 대한 연결은 다음 섹션에 설명된 대로 JDBC 또는 JNDI [포털 속성](../../reference/portal-properties.md) (예: [`Portal-ext.properties` 파일](../../reference/portal-properties.md))을 사용하여 구성됩니다. 데이터 소스는 읽기/쓰기 데이터베이스 인스턴스가 읽기 데이터베이스 인스턴스에 복제되는 별도의 DXP 데이터베이스 인스턴스를 사용해야 합니다.

### JDBC

[JDBC](../../installing-liferay/configuring-a-database.md)을 사용하여 별도의 읽기 및 쓰기 데이터 소스에 직접 연결하도록 `Portal-ext.properties` 파일을 편집하려면 다음 단계를 따르세요.

1. 읽기 및 쓰기 데이터 소스를 분리하도록 JDBC 연결을 구성합니다. 자세한 내용은 [JDBC 속성 참조](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#JDBC) 참조하세요. 예는 다음과 같습니다. 

    ```properties
    jdbc.read.driverClassName=[place your driver name here]
    jdbc.read.url=[place the URL to your "read" database here]
    jdbc.read.username=[place your user name here]
    jdbc.read.password=[place your password here]

    jdbc.write.driverClassName=[place your driver name here]
    jdbc.write.url=[place the URL to your "read-write" database here]
    jdbc.write.username=[place your user name here]
    jdbc.write.password=[place your password here]
    ```

    ```{note}
    Liferay는 HikariCP를 연결 풀 공급자로 사용합니다.
    ```

    For example JDBC connection values, please see [데이터베이스 템플릿](../../reference/database-templates.md) .

1. 읽기 및 쓰기 풀 시간 초과 및 크기 설정 구성 

    ```properties
    jdbc.read.connectionTimeout=30000
    jdbc.read.idleTimeout=600000
    jdbc.read.maximumPoolSize=100
    jdbc.read.maxLifetime=0
    jdbc.read.minimumIdle=10
    jdbc.read.registerMbeans=true

    jdbc.write.connectionTimeout=30000
    jdbc.write.idleTimeout=600000
    jdbc.write.maximumPoolSize=100
    jdbc.write.maxLifetime=0
    jdbc.write.minimumIdle=10
    jdbc.write.registerMbeans=true
    ```

1. **(이 단계는 DXP 7.4 U69 이하에만 필요합니다.)** 쓰기 데이터 소스(접두사가 ``인 데이터 소스)를 사용하여 [카운터](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Counter) 데이터 소스를 생성하도록 DXP를 구성합니다. 별도의 데이터 소스는 항상 카운터 전용입니다. 

    ```properties
    counter.jdbc.prefix=jdbc.write.
    ```

1. 선택적으로 데이터 연결의 유효성을 검사하여 잘못된 연결이 정상적으로 처리되는지 확인합니다.

1. **(이 단계는 DXP 7.3 U22, DXP 7.4 U65 이하에만 필요합니다.)** 기본값을 복사하여 읽기-작성기 데이터베이스 구성을 활성화합니다 [`spring.infrastructure.configs` 포털 속성](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Spring) 를 `Portal-ext.properties에` 파일을 만들고 여기에 다음 Spring 구성 파일 경로를 추가합니다.

   `spring.infrastructure.configs`에 추가 : 

    ```
    META-INF/dynamic-data-source-infrastructure-spring.xml
    ```

자세한 내용은 [Spring 구성 포털 속성](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Spring) 을 참조하세요.

### JNDI

JNDI를 사용하여 앱 서버의 읽기 및 쓰기 데이터 소스에 연결하려면 다음 단계에 따라 `Portal-ext.properties` 파일을 편집하세요.

1. 읽기 및 쓰기 JNDI 데이터 소스 사용자 이름과 비밀번호를 설정합니다. 

    ```properties
    jdbc.read.jndi.name=[place your "read" data source JNDI name here]

    jdbc.read.username=*[place your user name here]
    jdbc.read.password=[place your password here]

    jdbc.write.jndi.name=[place your "read-write" data source JNDI name here]

    jdbc.write.username=[place your user name here]
    jdbc.write.password=[place your password here]
    ```

1. 읽기 및 쓰기 풀 시간 초과 및 크기 설정 구성 

    ```properties
    jdbc.read.connectionTimeout=30000
    jdbc.read.idleTimeout=600000
    jdbc.read.maximumPoolSize=100
    jdbc.read.maxLifetime=0
    jdbc.read.minimumIdle=10
    jdbc.read.registerMbeans=true

    jdbc.write.connectionTimeout=30000
    jdbc.write.idleTimeout=600000
    jdbc.write.maximumPoolSize=100
    jdbc.write.maxLifetime=0
    jdbc.write.minimumIdle=10
    jdbc.write.registerMbeans=true
    ```

1. (**이 단계는 DXP 7.4 U69 이하에만 필요합니다.**) 쓰기 데이터 소스(접두사가 ``인 데이터 소스)를 사용하여 [카운터](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Counter) 데이터 소스를 생성하도록 DXP를 구성합니다. 별도의 데이터 소스는 항상 카운터 전용입니다. 

    ```properties
    counter.jdbc.prefix=jdbc.write.
    ```

1. 선택적으로 데이터 연결의 유효성을 검사하여 잘못된 연결이 정상적으로 처리되는지 확인합니다.

1. (**이 단계는 DXP 7.4 U65 이하 또는 DXP 7.3 U22 이하에만 필요합니다.**) 기본 [`spring.infrastructure.configs` 포털 속성](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Spring) `Portal-ext에 복사하여 읽기 기록기 데이터베이스 구성을 활성화합니다. Properties` 파일에 다음 Spring 구성 파일 경로를 추가합니다.
   
   `spring.infrastructure.configs`에 추가: 

    ```
    META-INF/dynamic-data-source-infrastructure-spring.xml
    ```

자세한 내용은 [Spring 구성 포털 속성](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Spring) 을 참조하세요.

DXP는 다음에 시작할 때 읽기 데이터 소스, 쓰기 데이터 소스 및 카운터 데이터 소스를 사용합니다.

## 데이터베이스 복제

데이터베이스 클러스터를 사용하면 내결함성과 DXP 성능이 향상됩니다. 데이터베이스 클러스터 인스턴스는 동기화 상태를 유지해야 합니다. 복제는 한 데이터베이스 인스턴스에서 다른 데이터베이스 인스턴스로 변경된 데이터와 변경된 스키마를 복사하는 프로세스입니다. 지원되는 데이터베이스 [모두](https://help.liferay.com/hc/ko/articles/360049238151) 복제를 지원합니다. 데이터베이스 클러스터를 사용하는 경우 데이터베이스 공급업체의 지침에 따라 복제용 데이터베이스를 설정하세요.

## 다음

이제 클러스터에 대한 데이터베이스를 구성했으므로 계속해서 DXP 클러스터링 요구 사항 [DXP 클러스터링 요구 사항](../clustering-for-high-availability.md#clustering-requirements) 해결할 수 있습니다. 다음 요구 사항은 모든 노드에서 [파일 저장소](../../../system-administration/file-storage.md) 에 액세스할 수 있도록 하고 해당 파일 저장소로 각 노드를 구성하는 것입니다.
