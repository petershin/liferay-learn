# Elasticsearch 설치

Elasticsearch 온프레미스를 설치, 구성 및 시작하는 방법은 다음과 같습니다.

```{note}
기본 데이터 스토리지(데이터베이스에서 지원하지 않는 데이터 저장)에 Elasticsearch 인덱스를 사용하는 경우 [스냅샷 및 복원 방식](./upgrading-elasticsearch/backing-up-elasticsearch.conf)을 사용하여 해당 데이터를 새 Elasticsearch 클러스터로 가져올 수 있습니다. md). Liferay 자체 검색 튜닝 인덱스(결과 순위 및 동의어용)는 Liferay DXP 7.2 및 7.3의 기본 스토리지 인덱스입니다.
```

## 프로덕션과 유사한 설치를 위한 환경 설정

### 호스트 추가

localhost 또는 Docker 컨테이너를 사용하여 테스트 환경을 설정하는 경우 이를 건너뛸 수 있습니다. 로컬 시스템에서 프로덕션과 유사한 설정을 위해 Liferay 및 Elasticsearch 클러스터에 대한 호스트를 추가합니다. 이 정보를 운영 체제의 `path/to/etc/hosts` 파일에 추가하십시오.

```properties
<your IP> es-node1
<your IP> es-node2
<your IP> es-node3
<your IP> dxp.liferay.com
```

루프백 주소 `127.0.0.1`이 아닌 시스템의 실제 IP 주소를 사용하십시오.

### mmap 조정

Elasticsearch는 대부분의 운영 체제에 대한 기본값보다 더 높은 _mmap count_ (인덱스를 보유하고 있는 디렉토리를 메모리에 매핑하기 위해)이 필요합니다. Linux에서 루트 사용자로 다음을 실행하십시오.

```bash
sysctl -w vm.max_map_count=262144
```

## Elasticsearch 설치

1. [Elastic 웹사이트](https://www.elastic.co)에서 Elasticsearch 아카이브를 다운로드합니다.

    ```{important}
    [Liferay 버전과 호환](./connecting-to-elasticsearch.html#available-liferay-elasticsearch-connectors) 최신 Elasticsearch 아카이브를 다운로드합니다.
    ```

1. Elasticsearch를 실행하려는 로컬 폴더에 아카이브 콘텐츠의 압축을 풉니다. 이 폴더는 *Elasticsearch Home*입니다.

1. `[Elasticsearch Home]/bin` 폴더에서 다음 명령을 실행하여 필요한 Elasticsearch 플러그인을 설치합니다.

   ```bash
   ./elasticsearch-plugin install analysis-icu
   ```

   ```bash
   ./elasticsearch-plugin install analysis-kuromoji
   ```

   ```bash
   ./elasticsearch-plugin install analysis-smartcn
   ```

   ```bash
   ./elasticsearch-plugin install analysis-stempel
   ```

## Elasticsearch 구성

각 Elasticsearch 서버는 `[Elasticsearch Home]/config/elasticsearch.yml` 파일로 구성됩니다.

다음은 단일 노드 및 다중 노드 Elasticsearch 클러스터 구성의 예입니다.

Elasticsearch 서버와의 통신 인증 및 암호화에 대해 알아보려면 [Elasticsearch 보안](./securing-elasticsearch.md) 을 참조하십시오.

### 예: 단일 노드 프로덕션 Elasticsearch 클러스터

단일 노드 클러스터에 대한 `elasticsearch.yml` 구성은 다음과 같습니다.

```yaml
cluster.name: LiferayElasticsearchCluster

discovery.type: single-node
discovery.seed_hosts:
  - es-node1:9300
http.port: 9200
network.host: es-node1
node.name: es-node1
transport.port: 9300

# Additional security settings 
```

`LiferayElasticsearchCluster` 이라는 이 클러스터에는 `es-node1`이라는 하나의 노드가 있습니다.

```{tip}
프로덕션 모드 설정을 위해 호스트를 구성하지 않는 경우 `localhost`를 호스트 값으로 사용하십시오. Elasticsearch는 HTTP 및 전송 통신을 위해 루프백 주소에 바인딩할 수 있습니다. 단일 노드 검색과 함께 이는 Elasticsearch 서버가 '개발 모드'에서 실행 중임을 의미합니다.
```

### 예: 다중 노드 프로덕션 Elasticsearch 클러스터

다음은 3노드 클러스터의 `es-node3` 이라는 노드에 대한 `elasticsearch.yml` 입니다.

```yaml
cluster.name: LiferayElasticsearchCluster

# Example production mode settings - 3-node cluster
cluster.initial_master_nodes:
  - es-node1
  - es-node2
  - es-node3
discovery.seed_hosts:
  - es-node1:9300
  - es-node2:9301
  - es-node3:9302
http.port: 9202
network.host: es-node3
node.name: es-node3
transport.port: 9302

# Add security settings here
```

```{tip}
프로덕션 모드 설정을 위해 호스트를 구성하지 않는 경우 `localhost`를 호스트 값으로 사용하십시오. Elasticsearch는 HTTP 및 전송 통신을 위해 루프백 주소에 바인딩할 수 있습니다. 이를 '개발 모드'라고 합니다.

관련 Elasticsearch 문서:

- [중요한 Elasticsearch 구성](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/important-settings.html)

- [Elasticsearch의 보안 설정](https ://www.elastic.co/guide/en/elasticsearch/reference/7.x/security-settings.html)

- [부트스트랩 검사, 개발 및 생산 모드](https://www.elastic.co/ guide/en/elasticsearch/reference/7.x/bootstrap-checks.html)
```

```{important}
각 Elasticsearch 노드의 `elasticsearch.yml` 파일은 다음 속성에 대해 고유한 값을 사용해야 합니다.

- `node.name`

- `http.port`

- `network.host`

- `transport.port`
```

### 프로덕션 모드에서 단일 서버에 대한 부트스트랩 검사 시행

Elasticsearch [부트스트랩 검사](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/bootstrap-checks.html) 시작 시 구성을 검사하고 누락되거나 의심스러운 구성에 대한 경고를 기록합니다. 프로덕션 환경에서는 잘못 구성된 경우 시작을 중지하도록 부트스트랩 검사를 구성해야 합니다.

단일 노드 클러스터에서 부트스트랩 확인을 적용하려면 노드의 `[Elasticsearch Home]/config/jvm.options` 파일 끝에 이 속성을 추가합니다.

```properties
-Des.enforce.bootstrap.checks=true
```

## Elasticsearch 시작

`bin` 폴더에서 Elasticsearch를 시작합니다.

```bash
./elasticsearch
```

Elasticsearch가 시작되고 상태 메시지 중 하나에 전송 주소가 포함됩니다.

```sh
[2019-04-01T16:55:50,127][INFO ][o.e.t.TransportService   ] [HfkqdKv] publish_address {127.0.0.1:9300}, bound_addresses {[::1]:9300}, {127.0.0.1:9300}
```

Liferay 7.2를 실행 중인 경우 `TransportService` 상태 메시지의 `publish_address` 주소를 기록하십시오. 이 주소에서 Elasticsearch에 연결하도록 Liferay 서버를 구성해야 합니다.

Elasticsearch는 Liferay</a>에서
개의 연결을 준비합니다.</p> 

프로덕션에서 실행 중인 경우 [Liferay와 Elasticsearch](./securing-elasticsearch.md)간의 보안 통신.



## 추가 주제

* [Elasticsearch 보안](./securing-elasticsearch.md)
* [라이프레이 엔터프라이즈 검색](../../liferay-enterprise-search.md)
* [수색 페이지](../../search-pages-and-widgets/working-with-search-pages/search-pages.md)
* [검색 관리 및 조정](../../search-administration-and-tuning.md)
* [Elasticsearch 커넥터 설정](./elasticsearch-connector-configuration-reference.md)
