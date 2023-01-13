# TCP를 통한 유니캐스트 구성

네트워크 구성 또는 클러스터 노드 간의 지리적 거리로 인해 [UDP 멀티캐스트 클러스터링](./configuring-cluster-link.md#using-multicast-over-udp)을 사용할 수 없는 경우 TCP 유니캐스트를 구성할 수 있습니다. 노드를 분리하는 방화벽이 있거나 노드가 다른 지리적 위치에 있는 경우 이를 사용해야 합니다.

## 유니캐스트 구성

유니캐스트를 구성하려면 다음 단계를 따르십시오.

1. 각 노드에서 앱 서버의 JVM에 JGroups 바인드 주소 매개변수를 추가합니다.

    ```bash
    -Djgroups.bind_addr=[place your IP address or host name here]
    ```

    노드의 IP 주소 또는 호스트 이름을 사용하십시오.

1. 노드가 서로를 찾는 데 사용할 검색 프로토콜을 선택합니다. 다음은 프로토콜 선택 사항입니다.

    * `TCPPing`
    * `JDBCPing`
    * `S3_Ping`
    * `Rackspace_Ping`

    어떤 것을 선택해야 할지 잘 모르겠다면 TCPPing을 사용하십시오. 나머지 단계에서는 TCPPing을 사용합니다. 다른 것에 대한 자세한 내용은 [Alternative Discovery Protocols](#alternative-discovery-protocols) 을 참조하십시오.
    <!-- the craziness in the next step is probably an example of something that Brian Chan would want to see get improved in the product. We should bring this up w/ the core team or with Brian Chan himself to see his thoughts. jrhoun -->

1. `$LIFERAY.HOME/osgi/marketplace/Liferay Foundation - Liferay Portal - Impl.lpkg/com . liferay . portal . cluster . multiple -[version]에서 <code>tcp.xml` 파일을 추출합니다. jar/lib / jgroups -[version]. Final . jar/tcp.xml</code> DXP 웹 응용 프로그램의 `WEB-INF/classes에 있는 <code>jgroups` 이라는 폴더와 같이 DXP에 액세스할 수 있는 위치에</code> 폴더.

    ```
    WEB-INF/classes/jgroups/tcp.xml
    ```

    이 `tcp.xml` 구성 파일은 클러스터 링크의 제어 채널과 전송 채널 모두에 사용됩니다. 별도의 구성 파일을 사용하려면 [다른 제어 및 전송 채널 포트 사용](#using-different-control-and-transport-channel-ports)을 참조하십시오.

1. `tcp.xml` 파일에서 TCP 바인딩 포트를 노드에서 사용하지 않는 포트로 설정합니다. 예를 들면 다음과 같습니다.

    ```xml
    <TCP bind_port="7800"/>
    ```

1. `tcp.xml` 파일에서 노드의 IP 주소와 해당 노드에서 사용되지 않는 포트를 지정하여 TCPPing에서 각 노드를 검색할 수 있도록 합니다. 이전 단계를 기반으로 다음은 `<TCPPing>` 요소의 예입니다.

    ```xml
    <TCP bind_port="7800"/>
    <TCPPING async_discovery="true"
        initial_hosts="192.168.224.154[7800],192.168.224.155[7800]"
        port_range="1"/>
    ```

    ```{important}
    'port_range'는 '1'로 설정되어 TCCPing이 각 채널을 생성하기 위해 추가 포트를 조사합니다. 예를 들어 `initial_hosts="HostA[7800],HostB[7800]`의 경우 TCCPing은 포트 7800 및 7801을 사용하여 HostA와 HostB 모두에 연결을 시도합니다. 필요한 만큼의 포트를 포함하도록 이 값을 설정합니다(채널 수 - 1). 
    ```


    **Regarding Initial Hosts:**

    * 초기 호스트 값이 모든 노드를 설명하는지 확인하십시오. `initial_hosts` 이 TCP XML 파일 또는 JVM 인수에 지정되지 않은 경우 `localhost` 이 초기 호스트입니다.
    * TCP XML 파일에서 초기 호스트를 지정하는 대신 다음과 같이 JVM 인수를 사용하여 앱 서버에 지정하는 방법이 있습니다.

        ```
        -Djgroups.tcpping.initial_hosts=192.168.224.154[7800],192.168.224.155[7800]
        ```

1. `tcp.xml` 파일을 각 노드의 동일한 위치에 복사하고 TCP 바인드 포트를 각 노드에서 사용하지 않는 포트로 설정해야 합니다. JVM 인수를 참조해야 합니다. 예를 들어 IP 주소가 `192.168.224.155`인 노드에서 다음과 같이 TCPPing을 구성합니다.

    ```xml
    <TCP bind_port="7800"/>
    <TCPPING async_discovery="true"
        initial_hosts="${jgroups.tcpping.initial_hosts:192.168.224.154[7800],192.168.224.155[7800]}"
        port_range="1"/>
    ```

1. 클러스터 링크를 활성화하고 각 클러스터 링크 채널에 대한 TCP XML 파일을 가리키도록 각 노드의 [`portal-ext.properties` 파일](../../reference/portal-properties.md) 에서 [클러스터 링크 속성](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Cluster%20Link) 을 수정합니다.

    ```properties
    cluster.link.enabled=true
    cluster.link.channel.properties.control=/jgroups/tcp.xml
    cluster.link.channel.properties.transport.0=/jgroups/tcp.xml
    ```

위에서 설명한 JGroups 구성은 일반적으로 Unicast over TCP에 필요한 전부입니다. 그러나 매우 특정한 경우에 *(및* ) 클러스터 노드가 여러 네트워크에 배포된 경우 각 호스트에서 `external_addr` TCP 전송 매개변수를 방화벽의 외부(공용 IP) 주소로 설정해야 합니다. 이러한 종류의 구성은 일반적으로 노드가 지리적으로 분리된 경우에만 필요합니다. 이를 설정하면 별도의 네트워크(예: 서로 다른 방화벽으로 분리됨)에 배포된 클러스터 노드가 함께 통신할 수 있습니다. 이 구성은 시스템의 보안 감사에서 플래그가 지정될 수 있습니다. 자세한 내용은 [JGroups 설명서](http://www.jgroups.org/manual4/index.html#_transport_protocols) 을 참조하십시오.

```{note}
`singleton_name` TCP 속성은 JGroups v4.0.0에서 더 이상 사용되지 않으므로 JGroups v 4.1.1-Final을 사용하는 Liferay DXP 7.2 SP1 및 Liferay Portal GA2 이후로 제거되었습니다.
```

이제 Unicast over TCP 클러스터링이 설정되었습니다!

## 대체 검색 프로토콜

TCP Ping은 대부분의 사용 사례에 맞게 사용할 수 있는 기본 검색 프로토콜입니다. 그러나 아래에 설명된 다른 검색 프로토콜을 사용할 수도 있습니다.

### JDBC 핑

TCP Ping을 사용하여 클러스터 구성원을 검색하는 대신 모든 노드에서 액세스할 수 있는 중앙 데이터베이스를 사용하여 서로를 찾을 수 있습니다. 클러스터 구성원은 자신의 주소를 쓰고 이 데이터베이스에서 다른 구성원의 주소를 읽습니다. 이 구성을 활성화하려면 [유니캐스트 구성](#unicast-configurations) 단계에서 참조된 `TCPPING` 태그를 해당하는 `JDBC_PING` 태그로 바꿉니다.

```xml
<JDBC_PING
    connection_url="[place the URL to your database here]"
    connection_username="[place your user name here]"
    connection_password="[place your password here]"
    connection_driver="[place your driver name here]"/>
```

예를 들어 JDBC 연결 값은 [데이터베이스 템플릿](../../reference/database-templates.md)을 참조하십시오. JDBC Ping에 대한 자세한 내용은 [JGroups 설명서](http://www.jgroups.org/manual4/index.html#DiscoveryProtocols)을 참조하십시오.

### S3 핑

Amazon S3 Ping은 Amazon의 EC2 클라우드 서비스에서 실행되는 서버에 사용할 수 있습니다. 각 노드는 작은 파일을 S3 버킷에 업로드하고 다른 모든 노드는 이 버킷에서 파일을 읽어 다른 노드를 검색합니다. 노드가 나가면 해당 파일이 삭제됩니다.

S3 Ping을 구성하려면 [유니캐스트 구성](#unicast-configurations) 단계의 `TCPPING` 태그를 해당하는 `S3_PING` 태그로 바꿉니다.

```xml
<S3_PING
    secret_access_key="[SECRETKEY]"
    access_key="[ACCESSKEY]"
    location="ControlBucket"/>
```

위의 매개변수에 대한 값으로 Amazon 키를 제공하십시오. S3 Ping에 대한 자세한 내용은 [JGroups 설명서](http://www.jgroups.org/manual4/index.html#_s3_ping)을 참조하십시오.

### 기타 핑

JGroups는 Rackspace Ping, BPing, File Ping 등을 포함하여 클러스터 구성원이 서로를 발견할 수 있는 다른 수단을 제공합니다. 이러한 검색 방법에 대한 정보는 [JGroups 설명서](http://www.jgroups.org/manual4/index.html#DiscoveryProtocols) 을 참조하십시오.

## 다른 제어 및 전송 채널 포트 사용

제어 및 전송 채널은 다른 포트를 사용하도록 구성할 수 있습니다. 별도의 제어 및 전송 채널 포트를 사용하면 제어 및 전송 트래픽을 모니터링하고 정보를 격리하여 문제를 진단할 수 있습니다.

다음 단계에서는 TCPPing을 통한 유니캐스트를 사용하여 접근 방식을 보여줍니다.

1. 각 노드에서 앱 서버의 JVM에 매개변수를 추가합니다.

    ```bash
    -Djgroups.bind_addr=[node_ip_address]
    ```

1. `$LIFERAY.HOME/osgi/marketplace/Liferay Foundation - Liferay Portal - Impl.lpkg/com . liferay . portal . cluster . multiple -[version]에서 <code>tcp.xml` 파일을 추출합니다. jar/lib / jgroups -[version]. Final . jar/tcp.xml</code> DXP 웹 응용 프로그램의 `WEB-INF/classes에 있는 <code>jgroups` 이라는 폴더와 같이 DXP에 액세스할 수 있는 위치에</code> 폴더.

1. 동일한 위치에 `tcp.xml` 의 복사본을 만들고 두 파일의 이름을 변경하여 하나는 제어 채널용으로, 다른 하나는 전송 채널용으로 지정합니다. 예를 들어 다음 파일 이름을 사용할 수 있습니다.

    * `tcp-control.xml`
    * `tcp-transport.xml`

1. 클러스터 링크를 활성화하고 각 클러스터 링크 채널에 대한 TCP XML 파일을 가리키도록 노드의 [`portal-ext.properties` 파일](../../reference/portal-properties.md) 에서 [클러스터 링크 속성](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Cluster%20Link) 을 수정합니다.

    ```properties
    cluster.link.enabled=true
    cluster.link.channel.properties.control=/jgroups/tcp-control.xml
    cluster.link.channel.properties.transport.0=/jgroups/tcp-transport.xml
    ```

1. 각 `tcp-*.xml` 파일의 TCP 및 검색 프로토콜 태그(예: TCPPing을 사용하는 경우 `TCPPing` 태그)를 수정하여 각 노드의 IP 주소 및 바인드 포트를 설명합니다.

수직으로 클러스터링하는 경우(즉, 동일한 물리적 또는 가상 시스템에서 실행 중인 여러 서버가 있는 경우) 모든 채널은 검색 통신을 위해 사용되지 않는 고유한 바인드 포트를 사용해야 합니다. 각 `tcp-*.xml` 파일에서 TCP 태그의 `bind_port` 속성을 사용되지 않는 고유한 포트에 할당합니다.

예를 들어 처음 두 노드는 이러한 바인드 포트를 할당할 수 있습니다.

| 마디   | 속성 파일               | 항구     |
|:---- |:------------------- |:------ |
| 노드 1 | `tcp-control.xml`   | `7800` |
| 노드 1 | `tcp-transport.xml` | `7801` |
| 노드 2 | `tcp-control.xml`   | `7802` |
| 노드 2 | `tcp-transport.xml` | `7803` |

다음은 동일한 시스템(즉, 동일한 IP 주소)에서 실행 중인 노드의 바인드 포트를 사용하는 TCP 및 TCPPing 요소의 예입니다.

**노드 1 `tcp-control.xml`**

```xml
<TCP bind_port="7800"/>
<TCPPING async_discovery="true"
    initial_hosts="192.168.224.154[7800],192.168.224.154[7802]"
    port_range="0"/>
```

**노드 1 `tcp-transport.xml`**

```xml
<TCP bind_port="7801"/>
<TCPPING async_discovery="true"
    initial_hosts="192.168.224.154[7801],192.168.224.154[7803]"
    port_range="0"/>
```

**노드 2 `tcp-control.xml`**

```xml
<TCP bind_port="7802"/>
<TCPPING async_discovery="true"
    initial_hosts="192.168.224.154[7800],192.168.224.154[7802]"
    port_range="0"/>
```

**노드 2 `tcp-transport.xml`**

```xml
<TCP bind_port="7803"/>
<TCPPING async_discovery="true"
    initial_hosts="192.168.224.154[7801],192.168.224.154[7803]"
    port_range="0"/>
```

캐시할 수 있는 엔터티를 추가했거나 시스템의 캐시 구성을 조정하려는 경우 모듈을 사용하여 수행할 수 있습니다. 캐시 구성에 대한 자세한 내용은 [캐시 구성](https://help.liferay.com/hc/en-us/articles/360035581451-Introduction-to-Cache-Configuration)을 참조하십시오.

## 추가 정보

* [클러스터 링크 구성](./configuring-cluster-link.md)
* [고가용성을 위한 클러스터링](../clustering-for-high-availability.md)
