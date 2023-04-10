# 연습: Docker를 사용하여 Liferay 및 Elasticsearch 실행

> 적용 대상: Liferay DXP 7.3+

여기에서 로컬 컴퓨터의 최소 Liferay-Elasticsearch 설정을 살펴보고 Elasticsearch와 Liferay DXP 7.3+ 간의 [REST 클라이언트](https://www.elastic.co/guide/en/elasticsearch/client/java-rest/7.x/java-rest-high.html) 연결이 어떻게 구성되었는지 확인할 수 있습니다. 이 예에서는 두 개의 Docker 컨테이너(Elasticsearch 컨테이너 하나와 Liferay DXP 컨테이너 하나)를 사용합니다. 보다 개념적이고 프로덕션과 유사한 정보는 [Elasticsearch 설치](./getting-started-with-elasticsearch.md)을 참조하십시오.

Elasticsearch 연결에서 인증 및 암호화를 활성화하려면 [Elasticsearch 보안](./securing-elasticsearch.md) 읽으십시오.

## Docker 컨테이너에 바인드 마운트를 위한 로컬 폴더 생성

플러그인 및 구성 파일을 제공하기 위해 Elasticsearch 및 DXP 컨테이너의 시스템 폴더에 바인드 마운트할 수 있는 로컬 폴더 구조를 생성합니다.

```bash
mkdir -p test-es-install/dxp/files/osgi/configs && mkdir -p test-es-install/elasticsearch && cd test-es-install
```

```{tip}
끝에 있는 `cd test-es-install` 명령은 `test-es-install` 폴더에 넣습니다. 이 폴더에서 Elasticsearch 및 Liferay DXP 모두에 대해 나머지 명령을 실행해야 합니다.
```
## Elasticsearch 설치

1. `elasticsearch717`이라는 Elasticsearch `7.17.9` 컨테이너를 구성하고 시작합니다.

   ```bash
   docker run -it --name elasticsearch717 -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -e "node.name=es-node1" -v $(pwd)/elasticsearch:/usr/share/elasticsearch/data docker.elastic.co/elasticsearch/elasticsearch:7.17.9
   ```

1. 필요한 Elasticsearch 플러그인을 설치합니다. `docker exec -it` 사용하여 대화형 bash 셸에 액세스합니다.

   ```bash
   docker exec -it elasticsearch717 bash -c '/usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-kuromoji && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-smartcn && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-stempel'
   ```

1. Elasticsearch 컨테이너를 다시 시작하여 플러그인을 등록합니다. CTRL+C는 컨테이너를 중지한 다음 다음을 실행하여 다시 시작합니다.

   ```bash
   docker start -i elasticsearch717
   ```

1. 실행 중인 Elasticsearch 컨테이너의 IPv4 주소를 가져옵니다.

   ```bash
   docker network inspect bridge
   ```

   이 예에서는 `172.17.0.2`입니다. 시스템에서 다른 IP 주소를 제공하는 경우 Liferay DXP를 실행할 때 `docker run --add-host elasticsearch717:[IP]...` 명령에서 사용해야 합니다.

   ```bash
   "Containers": {
               "2d4614fdcce2159322fa7922bfc5f866b79bd7f609a65cc888f9a260f80731f4": {
                   "Name": "elasticsearch717",
                   "EndpointID": "e89c3d0a87cc528753470eb359cee3b85fea9f9a5df3b249d54d203741a650a8",
                   "MacAddress": "02:42:ac:11:00:02",
                   "IPv4Address": "172.17.0.2/16",
                   "IPv6Address": ""
               }
           },
   ```

## 라이프레이 DXP 설치

Liferay DXP가 Elasticsearch와 연결하는 데 필요한 속성을 지정한 다음 DXP 컨테이너를 실행합니다.

1. 먼저 다음을 실행하여 Elasticsearch 7 구성 파일을 채웁니다.

   ```bash
   cat <<EOT >> dxp/files/osgi/configs/com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config

   operationMode="REMOTE"
   productionModeEnabled=B"true"
   networkHostAddresses="http://elasticsearch717:9200"
   EOT
   ```

1. 구성 파일이 준비되면 다음을 사용하여 DXP 컨테이너를 시작합니다.

   ```bash
   docker run -it --name dxp74  --add-host elasticsearch717:172.17.0.2 -p 8080:8080 -v $(pwd)/dxp:/mnt/liferay [$LIFERAY_LEARN_PORTAL_DOCKER_IMAGE$]
   ```

1. **체크포인트:** 제어판 &rarr; 구성 &rarr; 검색에서 Elasticsearch 연결이 활성화되어 있는지 확인합니다.

   ![검색 관리 패널에 활성 연결이 표시됩니다.](./getting-started-with-elasticsearch/images/01.png)

검색 및 맞춤법 검사 색인을 다시 색인화합니다. 색인 재지정 작업은 모두 제어판 &rarr; 구성 &rarr; 검색의 색인 작업 탭에서 수행됩니다.

## 추가 정보

* [Elasticsearch 보안](./securing-elasticsearch.md)
* [라이프레이 엔터프라이즈 검색](../../liferay-enterprise-search.md)
* [수색 페이지](../../search-pages-and-widgets/working-with-search-pages/search-pages.md)
* [검색 관리 및 조정](../../search-administration-and-tuning.md)
* [Elasticsearch 커넥터 설정](./elasticsearch-connector-configuration-reference.md)
