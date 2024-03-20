# 솔라 설치

{bdg-secondary}`7.2-7.3(CE, DXP); 7.4 DXP U60+`

Solr는 Apache Lucene을 기반으로 구축된 인기 있는 엔터프라이즈 검색 플랫폼입니다. 안정적이고 확장 가능하며 내결함성이 있습니다. [여기](http://lucene.apache.org/solr/) 에 대해 자세히 읽어보십시오.

이 지침은 [호환 가능한 Liferay 버전](https://help.liferay.com/hc/ko/articles/360016511651-Search-Engine-Compatibility-Matrix) 용 Solr 8 설치에 대해 설명합니다. Solr 7을 설치하는 경우 필요에 따라 버전 이름을 조정하십시오.

```{important}
Solr를 사용할 때 중요한 제한 사항이 있습니다. 설치하기 전에 [솔라 제한 사항](./solr-limitations.md) 를 읽으십시오.
```

## 호환성

패치 수준별로 호환되는 Solr 및 Liferay 버전에 대한 자세한 내용은 [검색 엔진 호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360016511651) 을 참조하십시오.

## Solr 커넥터 다운로드

```{warning}
[blacklist](#disabling-elasticsearch-only-features) 및 [connector](#installing-and-configuring-the-solr-connector) 구성이 제자리에 있고 [Solr가 실행 중임]( #설치 및 구성-solr) .
```

Solr에 대한 커넥터를 아직 획득하지 않은 경우,

1. 실행 중인 Liferay에서 제어판 &rarr; 마켓플레이스 &rarr; 스토어로 이동합니다. 로그인합니다.

1. 앱에 대한 액세스 권한을 부여합니다.

1. Solr 8을 검색하고 Liferay 설치에 해당하는 앱을 선택합니다.

   | 라이프레이 맛             | Solr 커넥터 이름               |
   |:------------------- |:------------------------- |
   | Liferay 포털/커뮤니티 에디션 | Solr 8에 대한 Liferay CE 커넥터 |
   | Liferay DXP         | Solr 8에 대한 Liferay 커넥터    |

1. 앱의 랜딩 페이지에서 **Free** 버튼을 클릭하세요.

1. 존재하는 경우 프로젝트를 선택하거나 추가합니다.

1. 조건에 동의하고 **구매** 클릭합니다.

구매 후 과거 버전 페이지에서 LPKG 파일을 다운로드하십시오.

1. 다음 URL에서 <https://liferay.com> `user.name` 을 대체하십시오.

   CE: <https://web.liferay.com/web/[user.name]/apps/-/marketplace_apps/225525277/versions> 
   DXP: [https://web.liferay.com/web/[user.name]/apps/-/marketplace_apps/182518167/versions)

1. **App** 을 클릭하여 앱의 LPKG 파일을 다운로드합니다.

Liferay 버전 및 패치 수준에 대한 호환되는 응용 프로그램 버전은 [검색 엔진 호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360016511651) 참조하십시오.

## Elasticsearch 전용 기능 비활성화

Liferay Connector를 Solr에 설치할 때 블랙리스트에 추가하거나 비활성화해야 합니다.

- Elasticsearch에서만 작동하는 특정 DXP 기능용 모듈
- Elasticsearch 모듈에 대한 Liferay 커넥터

### Elasticsearch 전용 기능 블랙리스트 작성

```{important}
진행하기 전에 Liferay를 중지하십시오.
```

Elasticsearch 전용 기능을 블랙리스트에 추가하려면,

1. Liferay DXP 7.4에서 포털 속성 또는 Docker 환경 변수를 사용하여 모든 [라이프레이 엔터프라이즈 검색](../../liferay-enterprise-search.md) 기능을 비활성화합니다.

   이 특성을 `portal-ext.properties`에 추가하십시오.

   ```properties
   enterprise.product.enterprise.search.enabled=false
   ```

   이 Docker 환경 변수를 설정합니다.

   ```properties
   LIFERAY_ENTERPRISE_PERIOD_PRODUCT_PERIOD_ENTEPRISE_PERIOD_SEARCH_PERIOD_ENABLED=false
   ```

   자세한 내용은 [Liferay Enterprise 검색 활성화](../../liferay-enterprise-search/activating-liferay-enterprise-search.md) 참조하십시오.

1. 블랙리스트 [구성 파일](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md)을 만듭니다. 이름은 Liferay 버전에 따라 다릅니다.

   Liferay 7.4의 경우 생성

   ```bash
   com.liferay.portal.bundle.blacklist.internal.configuration.BundleBlacklistConfiguration.config
   ```

   Liferay 7.2 및 7.3의 경우 생성

   ```bash
   com.liferay.portal.bundle.blacklist.internal.BundleBlacklistConfiguration.config
   ```

1. Liferay 버전에 대한 구성을 입력하십시오.

   **라이프레이 7.4:**

   ```properties
   blacklistBundleSymbolicNames=[\
      "com.liferay.portal.search.elasticsearch7.api",\
      "com.liferay.portal.search.elasticsearch7.impl",\
      "com.liferay.portal.search.elasticsearch7.spi",\
   ]
   ```

   이 구성은 [Elasticsearch 7 검색 엔진 커넥터의](../elasticsearch/installing-elasticsearch.md) 모듈을 비활성화합니다. `enterprise.product.enterprise.search.enabled=false` 속성은 [라이프레이 엔터프라이즈 검색](../../liferay-enterprise-search.md) 모듈을 비활성화합니다. Solr를 설치하면 다른 [호환되지 않는 기능이 자동으로 비활성화됩니다](./solr-limitations.md).

   **라이프레이 7.2 및 7.3:**

   ```properties
   blacklistBundleSymbolicNames=[\
      "com.liferay.portal.search.elasticsearch7.api",\
      "com.liferay.portal.search.elasticsearch7.impl",\
      "com.liferay.portal.search.elasticsearch7.spi",\
      "com.liferay.portal.search.tuning.rankings.web",\
      "com.liferay.portal.search.tuning.synonyms.web",\
      "com.liferay.portal.search.tuning.web",\
      "com.liferay.portal.search.tuning.web.api"\
   ]
   ```

1. 파일을 Liferay의 `osgi/configs` 폴더에 넣습니다.

## Solr 설치 및 구성

Liferay용 Solr을 설치 및 구성하려면

1. [호환](https://help.liferay.com/hc/ko/articles/360016511651) Solr 서버를 다운로드하고 압축을 풉니다.

1. `solr-[version]/server/solr`로 이동합니다.

1. `liferay` 이라는 새 폴더와 두 개의 하위 폴더( `liferay/conf` 및 `liferay/data`를 만듭니다.

1. `configsets/_default/conf` 의 내용을 `liferay/conf` 폴더에 복사합니다.

1. 아카이브 관리자를 사용하여 Solr 8의 LPKG 파일에 대한 Liferay 커넥터를 엽니다.

1. `Liferay Connector to Solr 8 - Impl.lpkg`을 엽니다.

1. `com.liferay.portal.search.solr8.impl.jar` 파일을 열고 압축을 풉니다.

   ```
   META-INF/resources/solrconfig.xml
   ```

   그리고

   ```
   META-INF/resources/schema.xml
   ```

   에

   ```
   liferay/conf
   ```

   이것은 현재 `solrconfig.xml` 및 `schema.xml` 파일을 Solr에 Liferay에서 오는 데이터를 인덱싱하는 방법을 알려주는 파일로 대체합니다.

1. `liferay` 폴더에 `core.properties` 파일을 생성하고 다음 구성을 추가합니다.

   ```properties
   config=solrconfig.xml
   dataDir=data
   name=liferay
   schema=schema.xml
   ```

1. 체크포인트: 이제 `liferay` 폴더의 구조는 다음과 같습니다.

   ```bash
   liferay
   ├── conf
   │   ├── lang
   │   │   ├── contractions_ca.txt
   │   │   ├── ....txt
   │   ├── managed-schema
   │   ├── protwords.txt
   │   ├── schema.xml
   │   ├── solrconfig.xml
   │   ├── stopwords.txt
   │   └── synonyms.txt
   ├── core.properties
   └── data
   ```

1. Solr 설치의 최상위 폴더(`solr-[version]`)에서 다음을 입력하여 Solr 서버를 시작합니다.

   ```bash
   ./bin/solr start -f
   ```

1. Solr 서버는 기본적으로 포트 `8983` 에서 수신 대기합니다. <http://localhost:8983/solr/#/~cores> ( `localhost` 을 호스트로 사용하여 로컬에서 테스트한다고 가정)으로 이동하고 `liferay` 코어를 사용할 수 있는지 확인합니다.

이제 Solr이 설치되고 시작됩니다. 다음으로 Liferay용 Solr 커넥터를 설치하고 구성합니다.

## Solr 커넥터 설치 및 구성

```{important}
진행하기 전에 Liferay를 중지하십시오.
```

Solr에 대한 커넥터가 설치되면 Solr에 대한 Liferay 커넥터의 기본값이 Solr의 자체 기본값과 일치하기 때문에 기본 구성이 테스트 설치에 대해 작동합니다. 사용 가능한 설정의 전체 목록은 [구성 참조](#solr-connector-configuration-reference) 참조하십시오. 최소한 프로덕션 환경에서 커넥터에 대한 읽기 및 쓰기 URL을 구성해야 합니다.

Liferay의 `osgi/configs` 폴더에 배포된 구성 파일을 사용하여 Solr 커넥터의 기본 구성을 편집하는 것이 가장 일반적입니다.

1. 파일 이름 지정

   ```
   com.liferay.portal.search.solr8.configuration.SolrConfiguration.config
   ```

1. 다운로드한 [Solr 커넥터 LPKG를 Liferay의 `osgi/marketplace` 폴더에](#downloading-the-solr-connector) 하고 해당 구성 파일을 `osgi/configs`에 배치합니다.

1. 라이프레이를 시작합니다.

1. Liferay에서 Solr 연결을 확인합니다. 전역 메뉴를 열고 **제어판** &rarr; **구성** &rarr; **검색** 로 이동하여 연결이 활성화되어 있는지 확인합니다.

   ![검색 관리 콘솔에서 Solr 연결을 확인하십시오.](./installing-solr/images/01.png)

1. Liferay 데이터를 Solr로 재색인합니다. 전역 메뉴를 열고 **제어판** &rarr; **구성** &rarr; **검색** 로 이동합니다. Index Actions 창에서 Reindex Search Indexes 옵션 옆에 있는 **Execute** 클릭합니다.

   맞춤법 검사 색인도 다시 색인화합니다.

## SolrCloud를 통한 고가용성

Solr 서버 클러스터가 필요한 경우 SolrCloud를 사용하십시오. 프로덕션 환경에서 SolrCloud를 사용하려면 외부 ZooKeeper 앙상블 [](https://cwiki.apache.org/confluence/display/solr/Setting+Up+an+External+ZooKeeper+Ensemble) 설정해야 합니다. [ZooKeeper](http://zookeeper.apache.org/) SolrCloud 클러스터와 같은 분산 시스템을 관리하기 위한 중앙 집중식 조정 서비스입니다.

여기에 포함된 단계는 Liferay로 SolrCloud를 구성하기 위해 수행해야 하는 최소한의 단계입니다. 예를 들어 이 지침에서는 단일 시스템에서 SolrCloud 구성을 다룹니다. 프로덕션 환경에는 여러 물리적 또는 가상 머신이 있어야 합니다. 이 지침은 또한 위의 **Solr 설치 및 구성** 을 따랐다고 가정합니다. 자세한 내용은 [SolrCloud 가이드를 참조하십시오](https://cwiki.apache.org/confluence/display/solr/SolrCloud) .

1. 실행 중인 경우 Solr 서버를 중지합니다.

1. Solr 설치의 `configsets` 폴더(`solr-[version]/server/solr/configsets`)로 이동합니다.

1. `liferay_configs`이라는 폴더를 만듭니다.

1. `conf` 폴더를 `solr-[version]/server/solr/liferay` 에서 방금 만든 `liferay_configs` 폴더로 복사합니다.

   `configset/liferay_configs` 폴더에는 SolrCloud Liferay 컬렉션 구성이 포함되어 있으며 ZooKeeper에 업로드됩니다. 앞서 구성한 `liferay` 서버에서 `conf` 폴더를 복사할 때 Liferay Solr Adapter와 함께 제공되는 `schema.xml` 및 `solrconfig.xml` 파일을 사용합니다.

1. 대화식 SolrCloud 세션을 시작하여 SolrCloud 클러스터를 구성하십시오. Solr 설치 루트에서 다음을 실행하십시오.

   ```bash
   ./bin/solr -e cloud
   ```

1. 설정 마법사를 완료합니다. 다음 단계는 2노드 클러스터 생성을 보여줍니다.

    - 노드 수에 `2` 입력합니다.
    - 포트 `8983` 및 `7574` (기본값)을 지정합니다. 두 노드 모두 로그에 인쇄된 시작 명령으로 시작됩니다.

       ```
       Starting up Solr on port 8983 using command:
       "bin/solr" start -cloud -p 8983 -s "example/cloud/node1/solr"

       Waiting up to 180 seconds to see Solr running on port 8983 [|]  [-]  
       Started Solr server on port 8983 (pid=8846). Happy searching!


       Starting up Solr on port 7574 using command:
       "bin/solr" start -cloud -p 7574 -s "example/cloud/node2/solr" -z localhost:9983

       Waiting up to 180 seconds to see Solr running on port 7574 [|]  [/]  
       Started Solr server on port 7574 (pid=9026). Happy searching!
       ```

    - 컬렉션 이름을 **liferay** 로 지정합니다.
    - 컬렉션을 두 개의 샤드로 나눕니다.
    - 샤드당 두 개의 복제본을 지정합니다.
    - 구성을 선택하라는 메시지가 표시되면 **liferay_configs** 입력합니다. 클러스터가 시작되면 다음과 같이 결론을 내리는 로그 메시지가 표시되어야 합니다.

    ```bash
    SolrCloud example running, please visit http://localhost:8983/solr
    ```

이제 로컬 SolrCloud 클러스터에 **liferay** 이라는 새 컬렉션이 있습니다. `status` 명령을 실행하여 상태를 확인합니다.

```bash
./bin/solr status
```

로그 출력에는 노드가 발견되었음을 알리고 각 노드에 대한 정보가 나열됩니다.

```
Found 2 Solr nodes: 

Solr process 725273 running on port 8983
{
  "solr_home":"/home/me/_temp/solr-8.11.2/example/cloud/node1/solr",
  "version":"8.11.2 17dee71932c683e345508113523e764c3e4c80fa - mdrob - 2022-06-13 11:27:54",
  "startTime":"2023-01-05T20:29:45.779Z",
  "uptime":"0 days, 0 hours, 1 minutes, 29 seconds",
  "memory":"99.6 MB (%19.4) of 512 MB",
  "cloud":{
    "ZooKeeper":"localhost:9983",
    "liveNodes":"2",
    "collections":"1"}}
...
```

SolrCloud 모드에서 실행하는 동안 Solr를 중지하려면 다음과 같이 `stop` 명령을 사용하십시오.

```bash
./bin/solr stop -all
```

## SolrCloud용 Solr 커넥터 구성

Liferay에서 SolrCloud를 지원하려면 Liferay의 Solr 커넥터에서 클라이언트 유형을 **CLOUD** 로 지정하십시오.

1. 시스템 설정 또는 OSGi 구성 파일에서 **Client Type** 을 **CLOUD** 으로 설정합니다.

   ```properties
   clientType="CLOUD"
   ```

1. 라이프레이를 시작합니다. Solr 커넥터 LPKG를 설치한 후 처음 시작하는 경우 로그의 지침에 따라 Liferay를 다시 시작하십시오.

![Solr 시스템 설정 항목에서 클라이언트 유형을 클라우드로 설정합니다.](./installing-solr/images/03.png)

## Solr 커넥터 구성 참조

구성 파일을 사용하는 것 외에도 시스템 설정을 사용하여 Solr 8 구성을 업데이트할 수 있습니다.

![Liferay의 시스템 설정 응용 프로그램에서 Solr를 구성하는 것은 개발 및 테스트 중에 가장 유용합니다.](./installing-solr/images/02.png)

다음은 Solr 커넥터 응용 프로그램을 설치할 때 사용할 수 있는 설정과 함께 기본 구성입니다(시스템 설정 검색 범주에서 또는 `.config` 파일로 구성 가능). 이러한 설정은 제한된 값 집합을 허용합니다.

**구성 파일:** `com.liferay.portal.search.solr8.configuration.SolrConfiguration.config`\

**시스템 설정 항목:** **Solr 8**

```properties
authenticationMode=["BASIC" or "CERT"]
clientType=["REPLICATED" or "CLOUD"]
defaultCollection="liferay"
logExceptionsOnly=B"true"
readURL="http://localhost:8983/solr/liferay"
writeURL="http://localhost:8983/solr/liferay"
zkHost="localhost:9983"
```

**구성 파일:** `com.liferay.portal.search.solr8.configuration.SolrHttpClientFactoryConfiguration.config`\

**시스템 설정 항목:** **Solr 8 HTTP 클라이언트 팩토리**

```properties
basicAuthPassword="solr"
basicAuthUserName="solr"
defaultMaxConnectionsPerRoute="20"
maxTotalConnections="20"
```

**구성 파일:** `com.liferay.portal.search.solr8.configuration.SolrSSLSocketFactoryConfiguration.config`\

**시스템 설정 항목:** **Solr 8 SSL Factory**

```properties
keyStorePassword="secret"
keyStorePath="classpath:/keystore.jks"
keyStoreType="JKS"
trustStorePassword="secret"
trustStorePath="classpath:/truststore.jks"
trustStoreType="JKS"
verifyServerCertificate=B"true"
verifyServerName=B"true"
```
