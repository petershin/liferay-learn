# 검색 서비스(Elasticsearch)

Elasticsearch 서비스는 Liferay DXP 애플리케이션을 위한 텍스트 검색 엔진입니다. 외부 인터넷이 아닌 애플리케이션의 다른 서비스와만 통신하는 개인 서비스입니다.

![Elasticsearch 서비스는 Liferay Cloud에서 사용할 수 있는 여러 서비스 중 하나입니다.](./search-service/images/01.png)

자세한 내용은 [검색 서비스 제한](../reference/platform-limitations.md#search-service) 섹션을 참조하십시오.

## 구성

Liferay Cloud의 서비스는 기본적으로 제대로 작동하도록 미세 조정되어 있지만 Elasticsearch를 추가로 구성해야 할 수도 있습니다. 이렇게 하려면 적절한 `configs/{ENV}/config/` 폴더 안에 YML 파일을 포함할 수 있습니다. 변경 사항을 배포하면 파일이 자동으로 서비스에 삽입되고 기본 구성을 덮어씁니다. 다음은 올바른 폴더 안에 있는 이러한 파일의 폴더 구조 예입니다.

    search
    ├── configs
    │   └── common
    │       └── config
    │           └── elasticsearch.yml
    └── LCP.json

```{important}
Elasticsearch를 구성하려면 `elasticsearch.yml` 구성 파일을 사용해야 합니다. UI를 통한 Elasticsearch 구성은 각 배포에서 덮어쓰여집니다.
```

```{warning}
검색 서비스의 `LCP.json` 파일에는 기본적으로 `"podManagementPolicy": "Parallel"` 값이 포함되어 있습니다. 'LCP.json'에서 이 값을 제거하면 클러스터된 인스턴스가 여러 개 있을 때 검색 서비스가 시작되지 않을 수 있습니다. Elasticsearch 노드가 성공적으로 시작하려면 서로 연결해야 하기 때문입니다.
```

환경의 [서비스 스택 버전](../reference/understanding-service-stack-versions.md) 은 아직 버전 `4.xx`으로 업그레이드되지 않은 경우 구성 파일을 추가해야 하는 폴더에 영향을 미칩니다.

| **서비스 스택 버전** | **구성 폴더**                      |
|:------------- |:------------------------------ |
| **3.xx**      | `lcp/search/config/{ENV}/`     |
| **4.xx**      | `search/configs/{ENV}/config/` |

## 스크립트

보다 광범위한 사용자 정의를 위해 스크립트를 사용할 수 있습니다. 그러나 그렇게 할 때 주의하십시오. 이것은 검색 서비스를 사용자 지정하는 가장 강력한 방법이며 원하지 않는 부작용을 일으킬 수 있습니다. `scripts/configs/{ENV}/scripts/` 폴더에 있는 `.sh` 파일은 서비스를 시작하기 전에 실행됩니다. 예를 들어 모든 로그 파일을 제거하는 스크립트를 포함하려면 다음 디렉터리 구조에 배치할 수 있습니다.

    search
    ├── configs
    │   └── common
    │       └── scripts
    │           └── elasticsearch.yml
    └── LCP.json

환경의 [서비스 스택 버전](../reference/understanding-service-stack-versions.md) 은 버전 `4.xx`으로 아직 업그레이드되지 않은 경우 스크립트를 추가해야 하는 폴더에 영향을 미칩니다.

| **서비스 스택 버전** | **스크립트 폴더**                     |
|:------------- |:------------------------------- |
| **3.xx**      | `lcp/search/script/{ENV}/`      |
| **4.xx**      | `search/configs/{ENV}/scripts/` |

## 검색 서비스에 라이선스 배포

검색 서비스에 라이선스를 배포하려면 경로 `search/configs/{ENV}/license/` 를 만들고 여기에 라이선스 파일을 넣어야 합니다.

환경의 [서비스 스택 버전](../reference/understanding-service-stack-versions.md) 은 버전 `4.xx`으로 아직 업그레이드되지 않은 경우 라이선스 파일을 추가해야 하는 폴더에 영향을 미칩니다.

| **서비스 스택 버전** | **라이선스 폴더**                     |
|:------------- |:------------------------------- |
| **3.xx**      | `lcp/search/license/{ENV}/`     |
| **4.xx**      | `search/configs/{ENV}/license/` |

## 환경 변수 참조

Elasticsearch에 대한 모든 환경 변수 및 기타 구성 형식은 [공식 Elasticsearch 문서](https://www.elastic.co/guide/index.html)에 있습니다. 이러한 구성 및 환경 변수는 각각 `configs/{ENV}/config/` 디렉터리 및 `LCP.json`에서 설정할 수 있습니다. 예를 들면 다음과 같습니다.

| 이름             | 가치              | 묘사                  |
|:-------------- |:--------------- |:------------------- |
| `ES_JAVA_OPTS` | `-Xms4g -Xmx4g` | ES 인스턴스에 대한 Java 설정 |

## 추가 정보

* [LCP JSON을 통한 구성](../reference/configuration-via-lcp-json.md)
