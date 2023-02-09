# 솔라 설치

Solr는 Apache Lucene을 기반으로 구축된 인기 있는 엔터프라이즈 검색 플랫폼입니다. 안정적이고 확장 가능하며 내결함성이 있습니다. [여기](http://lucene.apache.org/solr/)에 대해 자세히 읽어보십시오.

이 지침에서는 Liferay 7.1~7.3용 Solr 8 설치에 대해 설명합니다. Liferay 7.1-7.2용 Solr 7 설치에 동일하게 적용되지만 버전 이름에 대한 일부 조정이 필요할 수 있습니다.

```{important}
- Liferay의 Solr 지원이 중단되었습니다. Solr 8은 마지막으로 지원되는 Solr 버전입니다. [Elasticsearch](../elasticsearch/getting-started-with-elasticsearch.md)으로 마이그레이션할 계획을 세우십시오.

- Solr를 설치할 때 알아야 할 중요한 제한 사항이 있습니다. 설치를 진행하기 전에 [Solr Limitations](./solr-limitations.md)를 읽으십시오.
```

진행하면서 다음 용어를 기억하십시오.

*Solr Home*: 기본 Solr 구성 디렉토리인 `solr-[version]/server/solr/`를 참조합니다. 여기에서 Liferay 코어가 구성됩니다.

*Liferay 홈*: Liferay 설치의 루트 폴더입니다. 여기에는 `osgi`, `deploy`, `data`및 `license` 폴더가 포함되어 있습니다.

## 호환성

패치 수준별로 호환되는 Solr 및 Liferay 버전에 대한 자세한 내용은 [검색 엔진 호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360016511651) 을 참조하십시오.

## Elasticsearch 전용 기능 비활성화

Solr에 Liferay 커넥터를 설치하기 전에 블랙리스트에 추가하거나 비활성화해야 합니다.

- Elasticsearch에서만 작동하는 특정 DXP 기능용 모듈
- Elasticsearch 모듈에 대한 Liferay 커넥터

```{tip}
Gogo 셸 명령 `lb [substring-to-search] -s`를 사용하여 OSGi 런타임에 배포된 모듈을 검색하고 기호 이름별로 나열합니다. Symbolic Name은 `blacklistBundleSymbolicNames` 속성에 입력할 값입니다.

다음 명령은 블랙리스트에 추가해야 하는 모듈 목록을 반환합니다.

`lb -s | grep '검색' | grep 'elasticsearch|튜닝'`
```

### Elasticsearch 전용 기능 블랙리스트 작성

Liferay DXP 고객인 경우 블랙리스트 기능을 사용하여 Elasticsearch 전용 기능을 비활성화해야 합니다. CE 사용자는 다음 접근 방식도 사용할 수 있습니다.

1. 이름이 지정된 구성 파일을 만듭니다.

   ```bash
   com.liferay.portal.bundle.blacklist.internal.BundleBlacklistConfiguration.config
   ```

1. 다음 내용을 제공하십시오.

   ```properties
   blacklistBundleSymbolicNames=[\
        "com.liferay.portal.search.elasticsearch6.api",\
        "com.liferay.portal.search.elasticsearch6.impl",\
        "com.liferay.portal.search.elasticsearch6.spi",\
        "com.liferay.portal.search.elasticsearch7.api",\
        "com.liferay.portal.search.elasticsearch7.impl",\
        "com.liferay.portal.search.elasticsearch7.spi",\
        "com.liferay.portal.search.tuning.rankings.web",\
        "com.liferay.portal.search.tuning.synonyms.web",\
        "com.liferay.portal.search.tuning.web",\
        "com.liferay.portal.search.tuning.web.api"\
   ]
   ```

1. 파일을 `Liferay Home/osgi/configs`에 넣습니다.

### Elasticsearch 전용 기능으로 모듈 중지

App Manager 및 Gogo 셸은 번들의 상태를 "기억"하기 위해 `osgi/state` 폴더에 의존합니다. 이 폴더를 삭제하면([Liferay DXP 패치](../../../installation-and-upgrades/maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier.md 중에 권장됨) )) Elasticsearch 커넥터가 다시 설치되고 자동으로 시작됩니다. Liferay CE 사용자는 블랙리스트 접근 방식을 사용하거나 App Manager 또는 Gogo 셸에서 Elasticsearch 및 검색 튜닝 모듈을 비활성화할 수 있습니다.

앱 관리자를 통해 비활성화하려면,

1. 제어판 &rarr; 앱 &rarr; 앱 관리자로 이동합니다.

1. 앱 관리자에서 *elasticsearch*을 검색합니다. Elasticsearch 6/7 모듈에 대한 Liferay 커넥터를 찾아 작업(![Actions](../../../images/icon-actions.png)) 메뉴를 엽니다. _비활성화_을 선택합니다.  이렇게 하면 번들이 설치된 상태로 유지되지만 OSGi 런타임에서 중지됩니다. 검색 조정 모듈에 대해 동일한 작업을 수행합니다.

[Felix Gogo 셸](../../../liferay-internals/fundamentals/using-the-gogo-shell.md) 을 사용하여 Elasticsearch 및 검색 튜닝 모듈을 중지하려면,

1. `-s를 입력하십시오 | grep '검색' | grep 'elasticsearch|튜닝'`
   
   Elasticsearch에 대한 커넥터 및 검색 조정 모듈에 대한 여러 활성 번들이 표시됩니다.

1. 나열된 각 번들에 대해 `stop [bundle ID]`을 입력하십시오.

## Solr 커넥터 다운로드

Solr[7 또는 8]에 Liferay 커넥터를 설치하려면 [Liferay Marketplace](https://web.liferay.com/marketplace/) 로 이동하여 Liferay 버전에 해당하는 앱 버전을 다운로드합니다.

   - **라이프레이 CE:**
     
           - [Solr 8에 대한 Liferay CE 커넥터](https://web.liferay.com/marketplace/-/mp/application/181462322)
      - [Solr 7에 대한 Liferay CE 커넥터](https://web.liferay.com/marketplace/-/mp/application/118014614)
   - **Liferay DXP:**
     
           - [Solr 8에 대한 Liferay 커넥터](https://web.liferay.com/marketplace/-/mp/application/181462183)
      - [Solr 7에 대한 Liferay 커넥터](https://web.liferay.com/marketplace/-/mp/application/117931595)

Liferay 버전 및 패치 수준에 대한 호환되는 응용 프로그램 버전은 [검색 엔진 호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360016511651) 을 참조하십시오.

## Solr 설치 및 구성

**계속하기 전에 Liferay 인스턴스를 중지하십시오.**

Liferay용 Solr을 설치하고 적절하게 구성하려면:

1. [호환](https://help.liferay.com/hc/en-us/articles/360016511651) Solr 서버를 다운로드하고 압축을 풉니다. 아래 링크는 편의상 제공되며 작성 당시의 최신 호환 Solr 버전을 나타냅니다. 최신 호환 버전을 사용할 수 있는지 확인하려면 [검색 엔진 호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360016511651) 을 참조하십시오. 이 가이드에서는 다음 버전을 예로 사용하고 있습니다.
   
      - 라이프레이 7.1-7.3: [솔루션 8.6.3](https://archive.apache.org/dist/lucene/solr/8.6.3/)
   - 라이프레이 7.1-7.2: [솔루션 7.5.0](http://archive.apache.org/dist/lucene/solr/7.5.0/)
1. Solr Home(`solr-[version]/server/solr`)으로 이동하여 `liferay`라는 새 폴더를 만듭니다.

1. 두 개의 새 하위 폴더를 만듭니다: `liferay/conf` 및 `liferay/data`.

1. `Solr_Home/configsets/_default/conf` 의 내용을 `Solr_Home/liferay/conf`에 복사합니다.

1. 아카이브 관리자를 사용하여 Solr 8의 LPKG 파일에 대한 Liferay 커넥터를 엽니다.
   
   다음으로 'Liferay Connector to Solr 7/8 - Impl.lpkg'를 엽니다.

   마지막으로 `com.liferay.portal.search.solr7/8.impl.jar` 파일을 열고 압축을 풉니다.

   ```
   META-INF/resources/solrconfig.xml
   ```

그리고 

   ```
   META-INF/resources/schema.xml
   ```

에 

   ```
   Solr_Home/liferay/conf
   ```

이것은 현재 `solrconfig.xml` 및 `schema.xml` 파일을 Solr에 Liferay에서 오는 데이터를 인덱싱하는 방법을 알려주는 파일로 대체합니다.

1. `Solr_Home/liferay` 에 `core.properties` 파일을 생성하고 다음 구성을 추가합니다. 

   ```properties
   config=solrconfig.xml
   dataDir=data
   name=liferay
   schema=schema.xml
   ```

1. 체크포인트: 이제 `Solr_Home/liferay` 폴더의 구조는 다음과 같습니다. 

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

이제 Solr이 설치되고 시작됩니다. 다음으로 Liferay용 Solr 커넥터를 구성하고 설치합니다.

## Solr 커넥터 설치 및 구성

Solr에 대한 Liferay 커넥터의 기본 구성이 Solr의 자체 기본값과 일치하기 때문에 기본 커넥터 구성은 테스트 설치에 적합합니다. 사용 가능한 설정의 전체 목록은 [구성 참조](#solr-connector-configuration-reference) 을 참조하십시오. 최소한 프로덕션 환경의 커넥터에 대해 읽기 및 쓰기 URL을 구성해야 합니다.

프로덕션 배포에서는 `Liferay_Home/osgi/configs` 폴더에 배포된 구성 파일을 사용하여 Solr 커넥터의 기본 구성을 편집하는 것이 가장 일반적입니다. 

1. 파일 이름 지정 

```
com.liferay.portal.search.solr8.configuration.SolrConfiguration.config
```

    or

```
com.liferay.portal.search.solr7.configuration.SolrConfiguration.config
```

또는 커넥터 구성을 위해 UI를 사용할 수 있습니다. 제어판 &rarr; 구성 &rarr; 시스템 설정에서 Solr 7 시스템 설정 항목을 찾습니다.

![Liferay의 시스템 설정 애플리케이션에서 Solr를 구성할 수 있습니다. 이는 개발 및 테스트 중에 가장 유용합니다.](./installing-solr/images/02.png)

1. 앱 LPKG가 다운로드되면 `Liferay_Home/osgi/marketplace` 에 복사하고 모든 구성 파일을 `Liferay_Home/osgi/configs`에 넣습니다.

1. 라이프레이를 시작합니다.

1. Liferay 데이터를 Solr로 재색인합니다. 전역 메뉴를 열고 *제어판* &rarr; *구성* &rarr; *검색*로 이동합니다. 인덱스 작업 창에서 *실행* *모든 검색 인덱스 다시 인덱싱* 옵션 옆을 클릭합니다.
   
   맞춤법 검사 색인도 다시 색인화합니다.
   
   ![Solr 연결은 검색 관리 콘솔에서 확인할 수 있습니다.](./installing-solr/images/01.png)

## SolrCloud를 통한 고가용성

Solr 서버 클러스터가 필요한 경우 SolrCloud를 사용하십시오. 프로덕션 환경에서 SolrCloud를 사용하려면 외부 ZooKeeper 앙상블 [을 설정해야](https://cwiki.apache.org/confluence/display/solr/Setting+Up+an+External+ZooKeeper+Ensemble). [ZooKeeper](http://zookeeper.apache.org/) 은 SolrCloud 클러스터와 같은 분산 시스템을 관리하기 위한 중앙 집중식 조정 서비스입니다.

여기에 포함된 단계는 Liferay로 SolrCloud를 구성하기 위해 수행해야 하는 최소한의 작업으로 간주되어야 합니다. 예를 들어 이 지침은 단일 시스템에서 SolrCloud 구성을 다루는 반면 프로덕션 환경에는 여러 물리적 또는 가상 시스템이 있습니다. 이 지침은 또한 *Solr 설치 및 구성*의 이전 섹션을 따랐다고 가정합니다. 자세한 내용은 [SolrCloud 가이드를 참조하십시오](https://cwiki.apache.org/confluence/display/solr/SolrCloud).

1. 실행 중인 경우 Solr 서버를 중지합니다.

1. `Solr_Home/configsets` 폴더로 이동하여 다음 폴더를 만듭니다. 
   
   `liferay_configs`

1. `conf` 폴더를 `Solr_Home/liferay` 에서 방금 만든 `liferay_configs` 폴더로 복사합니다.
   
   `configset/liferay_configs` 폴더에는 SolrCloud Liferay 컬렉션 구성이 포함되어 있으며 ZooKeeper에 업로드됩니다. 앞서 구성한 `liferay` 서버에서 `conf` 폴더를 복사할 때 Liferay Solr Adapter와 함께 제공되는 `schema.xml` 및 `solrconfig.xml` 파일을 사용합니다.

1. 대화형 SolrCloud 세션을 시작하여 SolrCloud 클러스터를 구성합니다. 

   ```bash
   ./bin/solr -e cloud
   ```

1. 설정 마법사를 완료합니다. 다음 단계는 2노드 클러스터 생성을 보여줍니다.

    -  노드 수에 `2` 을 입력합니다.
    -  포트 `8983` 및 `7574` (기본값)을 지정합니다. 두 노드 모두 로그에 인쇄된 시작 명령으로 시작됩니다. 
      
      

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

    -  컬렉션 이름을 *liferay*로 지정합니다.

    -  컬렉션을 두 개의 샤드로 나눕니다.
    -  샤드당 두 개의 복제본을 지정합니다.
    -  구성을 선택하라는 메시지가 표시되면 *liferay_configs*을 입력합니다. 클러스터가 시작되면 다음과 같이 결론을 내리는 로그 메시지가 표시되어야 합니다. 

    ```bash
    SolrCloud example running, please visit http://localhost:8983/solr
    ```

이제 로컬 SolrCloud 클러스터에 *liferay* 이라는 새 컬렉션이 있습니다.  *status* 명령을 실행하여 상태를 확인합니다.

```bash
./bin/solr status
```

로그 출력에는 노드가 발견되었음을 알리고 각 노드에 대한 정보가 나열됩니다.

```
Found 2 Solr nodes: 

Solr process 223597 running on port 8983
{
  "solr_home":"/home/user/liferay-bundles/solr8_7.3/solr-8.6.3/example/cloud/node1/solr",
  "version":"8.6.3 e001c2221812a0ba9e9378855040ce72f93eced4 - jasongerlowski - 2020-10-03 18:12:03",
  "startTime":"2021-03-23T18:26:45.450Z",
  "uptime":"0 days, 0 hours, 25 minutes, 4 seconds",
  "memory":"306.5 MB (%59.9) of 512 MB",
  "cloud":{
    "ZooKeeper":"localhost:9983",
    "liveNodes":"2",
    "collections":"1"}}
...
```

SolrCloud 모드에서 실행하는 동안 Solr를 중지하려면 다음과 같이 *stop* 명령을 사용하십시오.

```bash
./bin/solr stop -all
```

## SolrCloud용 Solr 커넥터 구성

남은 작업은 하나뿐입니다. Liferay의 Solr 커넥터에서 클라이언트 유형을 *CLOUD* 로 지정하십시오.

1. 시스템 설정 또는 OSGi 구성 파일에서 *Client Type* 을 *CLOUD*으로 설정합니다. 

   ```properties
   clientType="CLOUD"
   ```

1. 아직 실행 중이 아니면 Liferay를 시작합니다. Solr 커넥터 LPKG를 설치한 후 처음 시작하는 경우 로그의 지침에 따라 Liferay를 다시 시작하십시오.

![Solr 시스템 설정 항목에서 클라이언트 유형을 클라우드로 설정합니다.](./installing-solr/images/03.png)

## Solr 커넥터 구성 참조

```{note}
Solr 커넥터 속성은 Solr 7 및 Solr 8 커넥터에 동일하게 적용됩니다. 구성 파일 이름에서 `solr8` 대신 `solr7`을 대체하십시오. 시스템 설정에서 _Solr 7_로 시작하는 항목을 참조하십시오.
```

다음은 Solr 커넥터 응용 프로그램을 설치할 때 사용할 수 있는 설정과 함께 기본 구성입니다(시스템 설정 검색 범주에서 또는 `.config` 파일로 구성 가능). 이러한 설정은 제한된 값 집합을 허용합니다. 

**구성 파일:** `com.liferay.portal.search.solr8.configuration.SolrConfiguration.config` \
**시스템 설정 항목:** _Solr 8_

```properties
authenticationMode=["BASIC" or "CERT"]
clientType=["REPLICATED" or "CLOUD"]
defaultCollection="liferay"
logExceptionsOnly=B"true"
readURL="http://localhost:8983/solr/liferay"
writeURL="http://localhost:8983/solr/liferay"
zkHost="localhost:9983"
```

**구성 파일:** `com.liferay.portal.search.solr8.configuration.SolrHttpClientFactoryConfiguration.config` \
**시스템 설정 항목:** _Solr 8 HTTP 클라이언트 팩토리_

```properties
basicAuthPassword="solr"
basicAuthUserName="solr"
defaultMaxConnectionsPerRoute="20"
maxTotalConnections="20"
```

**구성 파일:** `com.liferay.portal.search.solr8.configuration.SolrSSLSocketFactoryConfiguration.config` \
**시스템 설정 항목:** _Solr 8 SSL Factory_

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

이제 Liferay for Solr 및 Solr for Liferay를 구성할 수 있습니다. Solr은 [deprecated](../../../installation-and-upgrades/upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-3.md)이라는 것을 기억하십시오. Solr를 사용하도록 제한되지 않았거나 이미 Solr 전문가라면 Elasticsearch를 사용하세요.
