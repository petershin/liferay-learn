# 클러스터 링크 구성

클러스터 링크를 활성화하면 분산 캐싱이 활성화됩니다. 캐시는 동시에 실행되는 여러 Liferay DXP 노드에 분산됩니다. 클러스터 링크는 [Ehcache](http://www.ehcache.org) 복제를 사용합니다. Ehcache 글로벌 설정은 [`portal.properties` 파일](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Ehcache)에 있습니다.

기본적으로 Liferay는 노드 간에 캐시된 엔터티를 복사하지 않습니다. 예를 들어 엔터티가 삭제되거나 변경되면 Cluster Link는 다른 노드에 *remove* 메시지를 보내 로컬 캐시에서 이 엔터티를 무효화합니다. 다른 노드에서 해당 엔티티를 요청하면 캐시 *미스*이 발생합니다. 그러면 엔터티가 데이터베이스에서 검색되어 로컬 캐시에 저장됩니다. 한 노드의 로컬 캐시에 추가된 엔티티는 다른 노드의 로컬 캐시에 복사되지 않습니다. 엔터티가 캐시되지 않은 노드에서 새 엔터티를 검색하려고 하면 캐시 *미스*이 발생합니다. 미스는 노드를 트리거하여 데이터베이스에서 엔터티를 검색하고 로컬 캐시에 저장합니다.

![Liferay DXP의 캐시 알고리즘은 매우 효율적입니다.](./configuring-cluster-link/images/01.png)

DXP의 클러스터링은 네트워크 및 클러스터 노드의 위치에 따라 다양한 방식으로 구성될 수 있습니다. Cluster Link 활성화부터 시작하십시오.

## 클러스터 링크 활성화

클러스터 링크를 활성화하려면 이 [포털 속성](../../reference/portal-properties.md) 을 `portal-ext.properties` 파일에 추가합니다.

```properties
cluster.link.enabled=true
```

[클러스터 링크 포털 속성](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Cluster%20Link) 은 필요에 맞게 재정의할 수 있는 기본 구성을 제공합니다.

많은 기본값은 실제 주소 대신 `localhost`을 사용합니다. 그러나 일부 구성에서는 `localhost` 이 호스트의 실제 주소가 아니라 내부 루프백 네트워크(`127.0.0.1` 또는 `::1`)에 바인딩됩니다. 여전히 이 구성이 필요한 경우 다음 속성을 사용하여 DXP가 실제 주소를 자동 감지하도록 할 수 있습니다.

```properties
cluster.link.autodetect.address=www.google.com:80
```

서버에서 연결할 수 있는 다른 호스트에 연결하도록 설정합니다. 기본적으로 Google을 가리키지만 서버가 방화벽 뒤에 있는 경우 작동하지 않을 수 있습니다. 각 호스트의 실제 주소를 사용하면 자동 감지 주소를 설정할 필요가 없습니다.

Cluster Link는 [JGroups](http://www.jgroups.org) 에 종속되며 노드가 통신할 수 있도록 API를 제공합니다. 그것은 할 수 있습니다:

* 클러스터의 모든 노드에 메시지 보내기
* 특정 노드에 메시지 보내기
* 메서드를 호출하고 전체, 일부 또는 특정 노드에서 값 검색
* 구성원을 감지하고 노드가 가입 또는 탈퇴할 때 알림

클러스터 링크에는 노드 간의 일대다 유형 통신을 제공하는 향상된 알고리즘이 포함되어 있습니다. 이것은 기본적으로 JGroups의 UDP 멀티캐스트로 구현되지만 유니캐스트 및 TCP도 사용할 수 있습니다.

## 클러스터 링크 구성

클러스터 링크를 활성화하면 DXP의 기본 클러스터링 구성이 활성화됩니다. 이 구성은 *UDP를 통한 IP 멀티캐스트*을 정의합니다. 자신의 노드에 대해 멀티캐스트를 사용할 수 없는 경우(예: 노드가 지리적으로 또는 방화벽으로 분리되어 있기 때문에) 대신 유니캐스트 구현을 구성할 수 있습니다. 자세한 내용은 [TCP를 통한 유니캐스트 구성](./configuring-unicast-over-tcp.md) 을 참조하십시오.

### UDP를 통한 멀티캐스트 사용

DXP는 UDP를 통한 멀티캐스트를 구현하기 위해 JGroups</a> 의
채널 두 그룹(제어 그룹 및 전송 그룹)을 사용합니다. [채널 속성](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Cluster%20Link)을 사용자 지정하려면 다음 포털 속성을 `portal-ext.properties`에 추가하면 됩니다.</p> 



```properties
cluster.link.channel.name.control=[your control channel name]
cluster.link.channel.properties.control=[your control channel properties]
```


채널 속성은 [JGroups 문서](http://www.jgroups.org/manual4/index.html#protlist) 을 참조하십시오. 기본 구성은 해당 설정이 설명된 많은 속성을 설정합니다.

네트워크의 모든 장치에 대한 멀티캐스트 브로드캐스트. 동일한 네트워크의 클러스터 환경은 기본적으로 서로 통신합니다. 이들 간에 전송된 메시지 및 정보(예: 예약된 작업)는 의도하지 않은 결과를 초래할 수 있습니다. 이러한 클러스터 환경을 네트워크에서 논리적 또는 물리적으로 분리하거나 각 클러스터의 `Portal-ext.properties` 구성을 통해 서로 다른 멀티캐스트 그룹 주소 및 포트 값</a>세트를 사용하도록 격리합니다.</p> 

JGroups는 기본적으로 `localhost` 을 사용하여 바인드 주소를 자동으로 설정합니다. 그러나 일부 구성에서는 `localhost` 이 호스트의 실제 주소가 아니라 내부 루프백 네트워크(`127.0.0.1` 또는 `::1`)에 바인딩됩니다. DXP의 `cluster.link.autodetect.address` 포털 속성이 연결 가능한 서버를 가리키는 한 DXP는 해당 서버를 사용하여 호스트의 실제 주소를 자동으로 감지합니다. 기본 설정은 다음과 같습니다.



```properties
cluster.link.autodetect.address=www.google.com:80
```


서버가 방화벽 뒤에 있으면 Google에 접속하지 못할 수 있습니다.

바인드 주소에 대한 호스트 주소를 자동으로 감지하는 대신 `Portal-ext.properties` 파일에서 바인드 주소를 수동으로 설정할 수 있습니다.

1. `cluster.link.autodetect.address` 속성을 빈 값으로 설정하여 주소 자동 감지를 비활성화합니다. 
   
   

    ```properties
    cluster.link.autodetect.address=
    ```


2. 다음 속성을 호스트의 IP 주소로 설정합니다. 
   
   

    ```properties
    cluster.link.bind.addr["cluster-link-control"]=[place your IP address or host name here]
    cluster.link.bind.addr["cluster-link-udp"]=[place your IP address or host name here]
    ```


네트워크 구성이 TCP를 통한 멀티캐스트 사용을 금지할 수 있습니다. 이러한 상황에 대한 정보는 [TCP를 통한 유니캐스트 구성](./configuring-unicast-over-tcp.md) 을 참조하십시오. 이러한 방법은 모두 JGroups에서 제공합니다.



## 결론

클러스터를 구성했으면 시작할 수 있습니다. 로그 파일 메시지에 클러스터 이름이 표시됩니다(예: `cluster=liferay-channel-control`).



```bash
-------------------------------------------------------------------
GMS: address=oz-52865, cluster=liferay-channel-control, physical address=192.168.1.10:50643
-------------------------------------------------------------------
```


축하합니다! 클러스터가 Cluster Link를 사용하고 있습니다.



## 무엇 향후 계획

로드 상태에서 DXP 클러스터를 테스트하고 시스템 최적화를 조사하는 것이 가장 좋습니다. 사이트에서 가장 많이 사용되는 엔티티를 고려하고 캐시 설정을 적절하게 조정하십시오. 캐시 구성에 대한 자세한 내용은 [캐시 구성](https://help.liferay.com/hc/en-us/articles/360035581451-Introduction-to-Cache-Configuration)을 참조하십시오.



## 추가 정보

* [TCP를 통한 유니캐스트 구성](./configuring-unicast-over-tcp.md)
* [고가용성을 위한 클러스터링](../clustering-for-high-availability.md)