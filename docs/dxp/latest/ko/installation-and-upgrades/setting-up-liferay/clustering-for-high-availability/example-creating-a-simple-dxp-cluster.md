# 예: 간단한 DXP 클러스터 생성

DXP 클러스터링을 배우는 빠르고 쉬운 방법은 Docker 컨테이너 [을 사용하여 한 시스템에](https://docs.docker.com/get-started/overview/) 노드 DXP 클러스터 환경을 설정하는 것입니다. 이 예에서는 데이터베이스, 검색 엔진 및 파일 저장소용 서버 컨테이너와 함께 두 개의 DXP 서버 컨테이너를 만듭니다.

| 서버 유형  | 구현            | 컨테이너 이름         |
| :----- | :------------ | :-------------- |
| 데이타베이스 | MariaDB       | `some-mariadb`  |
| 파일 저장소 | DB스토어         | `some-mariadb`  |
| 검색 엔진  | Elasticsearch | `elasticsearch` |
| DXP 서버 | 수코양이          | `dxp-1`         |
| DXP 서버 | 수코양이          | `dxp-2`         |

```{warning}
이 예는 학습용이므로 프로덕션 사용 사례에는 적합하지 않습니다. 프로덕션 환경의 경우 DXP 서버에 대한 로드 밸런싱 요청을 위해 HTTP 서버를 포함하고, 읽기 전용 및 읽기-쓰기 작업을 위해 별도의 데이터베이스 서버를 사용하고, 데이터베이스 서버, 파일 저장소 서버 및 검색 엔진 서버의 클러스터링 및 로드 밸런싱을 고려해야 합니다. 자세한 내용은 [고가용성을 위한 클러스터링](../clustering-for-high-availability.md)을 참조하세요.
```

주요 단계는 다음과 같습니다.

1. [데이터베이스 서버 시작](#start-a-database-server)
1. [파일 저장소 서버 시작](#start-a-file-store-server)
1. [검색 엔진 서버 시작](#start-a-search-engine-server)
1. [각 노드에 대한 검색 엔진 구성](#configure-the-search-engine-server-for-each-node)
1. [DXP 클러스터](#start-the-dxp-cluster) 시작
1. [DXP 클러스터](#test-the-dxp-cluster) 테스트

## 데이터베이스 서버 시작

DXP 클러스터에는 모든 DXP 클러스터 노드에 액세스할 수 있는 데이터 소스가 필요합니다. 데이터 소스는 JNDI 데이터 소스이거나 데이터베이스 서버 또는 데이터베이스 서버 클러스터에 대한 직접 연결일 수 있습니다. DXP 버전이 지원하는 데이터베이스 서버에 대해서는 [호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360049238151) 참조하세요.

데이터베이스 서버 및 DXP 데이터베이스를 생성합니다.

1. MariaDB Docker 컨테이너를 시작합니다.

   ```bash
   docker run --name some-mariadb -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mariadb:10.2
   ```

1. 컨테이너의 셸에서 [DXP 데이터베이스를 생성합니다](../../reference/database-configurations.md) .

   데이터베이스 서버에 로그인합니다.

   ```bash
   docker exec -it some-mariadb bash -c "/usr/bin/mysql -uroot -pmy-secret-pw"
   ```

   DXP용 데이터베이스를 만듭니다.

   ```sql
   create database dxp_db character set utf8;
   ```

   데이터베이스 세션을 종료합니다.

   ```bash
   quit
   ```

   Bash 세션을 종료합니다.

   ```bash
   exit
   ```

데이터베이스 서버가 DXP를 사용할 준비가 되었습니다. 자세한 내용은 [클러스터 노드에 대한 데이터베이스 구성](./database-configuration-for-cluster-nodes.md)을 참조하세요.

## 파일 저장소 서버 시작

DXP 클러스터에는 모든 DXP 클러스터 노드에 액세스할 수 있는 파일 저장소가 필요합니다. 편의상 이 예에서는 DXP 데이터베이스에 구성된 [DBStore File Store](../../../system-administration/file-storage/other-file-store-types/dbstore.md) 을 사용합니다. 이 예에서 이미 시작된 데이터베이스 서버에는 파일 저장소가 포함되어 있습니다. 모든 파일 저장소 유형 구성에 대한 자세한 내용은 [파일 저장소 구성](../../../system-administration/file-storage.md) 참조하세요.

## 검색 엔진 서버 시작

DXP 클러스터에는 모든 DXP 클러스터 노드에 액세스할 수 있는 검색 엔진(별도의 프로세스로 실행)이 필요합니다. 자세한 내용은 [검색 엔진 설치](../../../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine.md) 참조하세요.

Elasticsearch 서버를 생성하고 구성합니다.

1. Elasticsearch 서버의 데이터 볼륨을 저장하기 위한 로컬 폴더를 설정합니다. 예를 들어,

   ```bash
   mkdir -p elasticsearch/es_data_volume
   ```

1. `elasticsearch`라는 Elasticsearch 컨테이너를 시작합니다.

   ```bash
   docker run -it --name elasticsearch -p 9200:9200 -p 9300:9300 -e cluster.name=LiferayElasticsearchCluster -e ES_JAVA_OPTS="-Xms512m -Xmx512m" -v $(pwd)/elasticsearch/es_data_volume:/var/lib/elasticsearch/data elasticsearch:6.8.7
   ```

   ```{note}
   컨테이너가 `최대 가상 메모리 영역 vm.max_map_count [xxxxx]가 너무 낮다고 보고하는 경우, 최소한 [xxxxxx]`로 늘리고 다음과 같은 명령을 사용하여 `vm.max_map_count`를 충분한 값으로 설정하십시오. `sudo sysctl - w vm.max_map_count=[xxxxxx]`. 그런 다음 컨테이너를 시작합니다.
   ```

1. 필요한 Elasticsearch 플러그인을 설치합니다.

   ```bash
   docker exec -it elasticsearch bash -c '/usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-kuromoji && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-smartcn && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-stempel'
   ```

검색 엔진이 검색 색인을 관리할 준비가 되었습니다.

## 각 노드에 대해 검색 엔진 서버 구성

[구성 파일](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md) 사용하여 각 DXP 노드에 대해 Elasticsearch를 구성합니다.

1. 구성 파일 사이트
를 만듭니다.

   ```bash
   mkdir -p dxp-1/files/osgi/configs dxp-2/files/osgi/configs
   ```

1. `dxp-1` 서버 노드에 대해 Elasticsearch를 구성합니다.

   ```bash
   cat <<EOT >> dxp-1/files/osgi/configs/com.liferay.portal.search.elasticsearch6.configuration.ElasticsearchConfiguration.config
   operationMode="REMOTE"
   transportAddresses="elasticsearch:9300"
   clusterName="LiferayElasticsearchCluster"
   EOT
   ```

1. `dxp-2` 서버 노드에 대한 Elasticsearch를 구성합니다.

   ```bash
   cat <<EOT >> dxp-2/files/osgi/configs/com.liferay.portal.search.elasticsearch6.configuration.ElasticsearchConfiguration.config
   operationMode="REMOTE"
   transportAddresses="elasticsearch:9300"
   clusterName="LiferayElasticsearchCluster"
   EOT
   ```

DXP 서버 컨테이너의 바인드 마운트를 통해 클러스터 노드에서 이러한 구성 파일에 액세스할 수 있게 됩니다.

```{note}
나중에 DXP 서버에 사용되는 `docker run --add-host elasticsearch:[ip] ...` 명령은 `elasticsearch` 이름을 Elasticsearch 서버 호스트 IP 주소에 매핑하는 `/etc/hosts/` 항목을 추가합니다.
```

## DXP 클러스터 시작

1. [`docker network inform bridge`](https://docs.docker.com/engine/reference/commandline/network_inspect/) 명령을 실행하여 `elasticsearch` 및 `some-mariadb` 컨테이너에 대한 컨테이너 IP 주소를 가져옵니다. '브리지' 네트워크가 기본 네트워크입니다.

   ```{important}
   다음에 나오는 `docker run` 명령에서 `[IP address]`를 `elasticsearch` 및 `some-mariadb` 컨테이너 IP 주소로 바꿉니다.
   ```

1. `dxp-1`을 시작하십시오.

   가독성을 위해 확장된 명령:

   ```bash
   docker run -it \
      --add-host elasticsearch:[IP address] \
      --add-host some-mariadb:[IP address] \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_JNDI_PERIOD_NAME="" \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_DRIVER_UPPERCASEC_LASS_UPPERCASEN_AME=org.mariadb.jdbc.Driver \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_URL="jdbc:mariadb://some-mariadb:3306/dxp_db?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false" \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_USERNAME=root \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_PASSWORD=my-secret-pw \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_ENABLED=true \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME_PERIOD_CONTROL=control-channel-logic-name-1 \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME_PERIOD_TRANSPORT_PERIOD_NUMBER0=transport-channel-logic-name-1 \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_AUTODETECT_PERIOD_ADDRESS=some-mariadb:3306 \
      -e LIFERAY_WEB_PERIOD_SERVER_PERIOD_DISPLAY_PERIOD_NODE=true \
      -e LIFERAY_DL_PERIOD_STORE_PERIOD_IMPL=com.liferay.portal.store.db.DBStore \
      --name dxp-1 \
      -p 11311:11311 \
      -p 8009:8009 \
      -p 8080:8080 \
      -v $(pwd)/dxp-1:/mnt/liferay \
      [$LIFERAY_LEARN_PORTAL_DOCKER_IMAGE$]
   ```

   한 줄로 요약된 명령:

   ```bash
   docker run -it --name dxp-1 --add-host elasticsearch:[IP address] --add-host some-mariadb:[IP address] -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_JNDI_PERIOD_NAME="" -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_DRIVER_UPPERCASEC_LASS_UPPERCASEN_AME=org.mariadb.jdbc.Driver -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_URL="jdbc:mariadb://some-mariadb:3306/dxp_db?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false" -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_USERNAME=root -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_PASSWORD=my-secret-pw -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_ENABLED=true -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME_PERIOD_CONTROL=control-channel-logic-name-1 -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME_PERIOD_TRANSPORT_PERIOD_NUMBER0=transport-channel-logic-name-1 -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_AUTODETECT_PERIOD_ADDRESS=some-mariadb:3306 -e LIFERAY_WEB_PERIOD_SERVER_PERIOD_DISPLAY_PERIOD_NODE=true -e LIFERAY_DL_PERIOD_STORE_PERIOD_IMPL=com.liferay.portal.store.db.DBStore --name dxp-1 -p 11311:11311 -p 8009:8009 -p 8080:8080 -v $(pwd)/dxp-1:/mnt/liferay [$LIFERAY_LEARN_PORTAL_DOCKER_IMAGE$]
   ```

1. `dxp-2`를 시작하세요.

   가독성을 위해 확장된 명령:

   ```bash
   docker run -it \
      --add-host elasticsearch:[IP address] \
      --add-host some-mariadb:[IP address] \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_JNDI_PERIOD_NAME="" \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_DRIVER_UPPERCASEC_LASS_UPPERCASEN_AME=org.mariadb.jdbc.Driver \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_URL="jdbc:mariadb://some-mariadb:3306/dxp_db?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false" \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_USERNAME=root \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_PASSWORD=my-secret-pw \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_ENABLED=true \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME_PERIOD_CONTROL=control-channel-logic-name-2 \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME_PERIOD_TRANSPORT_PERIOD_NUMBER0=transport-channel-logic-name-2 \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_AUTODETECT_PERIOD_ADDRESS=some-mariadb:3306 \
      -e LIFERAY_WEB_PERIOD_SERVER_PERIOD_DISPLAY_PERIOD_NODE=true \
      -e LIFERAY_DL_PERIOD_STORE_PERIOD_IMPL=com.liferay.portal.store.db.DBStore \
      --name dxp-2 \
      -p 11312:11311 \
      -p 9009:8009 \
      -p 9080:8080 \
      -v $(pwd)/dxp-2:/mnt/liferay \
      [$LIFERAY_LEARN_PORTAL_DOCKER_IMAGE$]
   ```

   한 줄로 요약된 명령:

   ```bash
   docker run -it --add-host elasticsearch:[IP address] --add-host some-mariadb:[IP address] -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_JNDI_PERIOD_NAME="" -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_DRIVER_UPPERCASEC_LASS_UPPERCASEN_AME=org.mariadb.jdbc.Driver -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_URL="jdbc:mariadb://some-mariadb:3306/dxp_db?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false" -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_USERNAME=root -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_PASSWORD=my-secret-pw -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_ENABLED=true -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME_PERIOD_CONTROL=control-channel-logic-name-2 -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME_PERIOD_TRANSPORT_PERIOD_NUMBER0=transport-channel-logic-name-2 -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_AUTODETECT_PERIOD_ADDRESS=some-mariadb:3306 -e LIFERAY_WEB_PERIOD_SERVER_PERIOD_DISPLAY_PERIOD_NODE=true -e LIFERAY_DL_PERIOD_STORE_PERIOD_IMPL=com.liferay.portal.store.db.DBStore --name dxp-2 -p 11312:11311 -p 9009:8009 -p 9080:8080 -v $(pwd)/dxp-2:/mnt/liferay [$LIFERAY_LEARN_PORTAL_DOCKER_IMAGE$]
   ```

`--add-host [domain]:[IP 주소]` 옵션은 [도메인 이름을 IP 주소에 매핑하는 `/etc/hosts` 파일 항목](https://docs.docker.com/engine/reference/run/#managing-etchosts) 을 추가합니다. 이를 통해 구성(예: 환경 변수, 포털 속성 및 '.config' 파일)이 도메인 이름으로 서버를 참조할 수 있습니다.

`-e [변수]=[값]` 옵션은 DXP 컨테이너 환경 변수를 설정합니다. 자세한 내용은 [부록 A: 환경 설정](#appendix-a-environment-settings) 을 참조하세요.

DXP 클러스터 노드 컨테이너에는 다음과 같은 고유한 설정이 있습니다.

| 설정                  | dxp-1                       | dxp-2                       |
| :------------------ | :-------------------------- | :-------------------------- |
| AJP 포트 매핑           | `8009:8009`                 | `9009:8009`                 |
| HTTP 포트 매핑          | `8080:8080`                 | `9080:8080`                 |
| OSGi 컨테이너 포트 매핑     | `11311:11311`               | `11312:11311`               |
| 바인드 마운트             | `$(pwd)/dxp-1:/mnt/liferay` | `$(pwd)/dxp-2:/mnt/liferay` |
| 클러스터 링크 제어 채널 논리 이름 | 제어 채널 논리 이름-1               | 제어 채널 논리 이름-2               |
| 클러스터 링크 전송 채널 논리 이름 | 전송 채널 논리 이름-1               | 전송 채널 논리 이름-2               |

### DXP 노드 방문

DXP 클러스터 노드는 다음 URL에서 사용할 수 있습니다.

* DXP-1: http://localhost:8080
* DXP-2: http://localhost:9080

아래 그림은 클러스터 노드 홈 페이지를 보여줍니다.

![DXP cluster nodes.](./example-creating-a-simple-dxp-cluster/images/01.png)

각 노드의 컨테이너 ID와 포트(`Node: [id]:[port]`)는 각 페이지 하단에 표시됩니다. `LIFERAY_WEB_PERIOD_SERVER_PERIOD_DISPLAY_PERIOD_NODE=true` 환경 설정으로 이 표시 기능이 활성화되었습니다. [`docker 컨테이너 ls`](https://docs.docker.com/engine/reference/commandline/container_ls/) 명령을 사용하여 컨테이너 ID를 찾을 수 있습니다.

### 검색 엔진에 콘텐츠 인덱싱

1. _제어판_ &rarr; _구성_ &rarr; _검색_으로 이동합니다.

1. 색인 작업 탭에서 _모든 검색 색인 다시 색인화_ 및 _모든 맞춤법 검사 색인 다시 색인화_를 클릭합니다.

콘텐츠는 검색 엔진에 색인됩니다. 자세한 내용은 [검색 개요](../../../using-search/getting-started/search-overview.md) 참조하세요.

## DXP 클러스터 테스트

노드 간 데이터 동기화를 테스트합니다.

1. 클러스터 노드 중 하나에 콘텐츠를 추가합니다. 예를 들어 _New Stuff_라는 새 위젯 페이지를 추가하고 여기에 언어 선택기 위젯을 추가합니다.

1. 다른 클러스터 노드에서 UI를 새로 고칩니다.

두 노드 모두 동일한 새 콘텐츠를 표시합니다.

![Content is synchronized between the cluster nodes.](./example-creating-a-simple-dxp-cluster/images/02.png)

작동하는 DXP 클러스터 생성을 축하합니다!

## 다음

[DXP 클러스터에 대한 데이터베이스](./database-configuration-for-cluster-nodes.md) 을 구성합니다.

## 부록 A: 환경 설정

예제 DXP 서버 컨테이너는 이러한 설정을 사용합니다.

| 설정                                                                                                                                                                                                                                                                                                                                                                                                             | 묘사                                          |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------ |
| LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_JNDI_PERIOD_NAME=                                                                                                                                                                                                        | 데이터 소스 JNDI 이름                              |
| LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_DRIVER_UPPERCASEC_LASS\\<br>_UPPERCASEN_AME=\\<br>org.mariadb.jdbc.Driver                                                                                                      | 데이터베이스 드라이버 클래스                             |
| LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_URL=\\<br>jdbc:mariadb://some-mariadb:3306/dxp_db?\\<br>useUnicode=true\&characterEncoding=UTF-8\&useFastDateParsing=false                                                                                                                    | 데이터 소스 URL                                  |
| LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_USERNAME=\\<br>루트                                                                                                                                                                                                                                                  | 데이터베이스 관리자 사용자 이름                           |
| LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_PASSWORD=\\<br>my-secret-pw                                                                                                                                                                                                                                        | 데이터베이스 관리자 사용자 비밀번호                         |
| LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_ENABLED=\\<br>참                                                                                                                                                                                                                                                    | 클러스터 링크 활성화                                 |
| LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME\\<br>_PERIOD_CONTROL=\\<br>제어 채널-논리-이름-2                                                            | 클러스터 노드의 고유 제어 채널 이름                        |
| LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME\\<br>_PERIOD_TRANSPORT_PERIOD_NUMBER0=\\<br>전송 채널 논리 이름-2 | 클러스터 노드의 고유 전송 채널 이름                        |
| LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_AUTODETECT_PERIOD_ADDRESS=\\<br>some-mariadb:3306                                                                                                                                                                        | 클러스터 노드 주소를 얻기 위해 ping할 알려진 주소              |
| LIFERAY_WEB_PERIOD_SERVER_PERIOD_DISPLAY_PERIOD_NODE=\\<br>참                                                                                                                                                                                                | 서버 주소와 웹 서버 포트를 표시합니다.                      |
| LIFERAY_DL_PERIOD_STORE_PERIOD_IMPL=\\<br>com.liferay.portal.store.db.DBStore                                                                                                                                                                                                                         | 파일 저장소(문서 라이브러리 저장소) 클래스 |

자세한 내용은 Env/ [포털 속성](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) 정의를 참조하세요.

## 관련 주제

* [클러스터 노드에 대한 데이터베이스 구성](./database-configuration-for-cluster-nodes.md)
* [클러스터 링크 구성](./configuring-cluster-link.md)
