# 검색 서비스(Elasticsearch)

Elasticsearch 서비스는 Liferay DXP 애플리케이션을 위한 텍스트 검색 엔진입니다. 외부 인터넷이 아닌 애플리케이션의 다른 서비스와만 통신하는 비공개 서비스입니다.

![Elasticsearch 서비스는 Liferay Cloud에서 사용할 수 있는 여러 서비스 중 하나입니다.](./search-service/images/01.png)

자세한 내용은 [검색 서비스 제한 사항](../reference/platform-limitations.md#search-service) 섹션을 참조하세요.

## 구성

Liferay Cloud의 서비스는 기본적으로 잘 작동하도록 미세 조정되어 있지만, Elasticsearch를 추가로 구성해야 할 수도 있습니다. 이렇게 하려면 적절한 `configs/{ENV}/config/` 폴더에 YML 파일을 포함하면 됩니다. 변경 사항을 배포하면 파일이 서비스에 자동으로 삽입되고 기본 구성을 덮어씁니다. 다음은 올바른 폴더에 있는 이러한 파일의 폴더 구조 예시입니다:

    search
    ├── configs
    │   └── common
    │       └── config
    │           └── elasticsearch.yml
    └── LCP.json

```{important}
Elasticsearch를 구성하려면 `elasticsearch.yml` 구성 파일을 사용해야 합니다. UI를 통한 Elasticsearch 구성은 각 배포에서 덮어쓰게 됩니다.
```

```{warning}
검색 서비스의 `LCP.json` 파일에는 기본적으로 이 값이 포함되어 있다: `"podManagementPolicy: "Parallel"`. LCP.json`에서 이 값을 제거하면 클러스터된 인스턴스가 여러 개 있을 때 검색 서비스가 시작되지 않을 수 있습니다. Elasticsearch 노드가 성공적으로 시작되려면 서로 연결되어야 하기 때문입니다.
```

## 스크립트

스크립트를 사용하여 보다 광범위한 사용자 지정을 할 수 있습니다. 하지만 그렇게 할 때는 주의하세요. 이는 검색 서비스를 맞춤 설정하는 가장 강력한 방법이지만 원치 않는 부작용이 발생할 수 있습니다. `.sh` 파일은 서비스를 시작하기 전에 `scripts/configs/{ENV}/scripts/` 폴더에 있는 모든 파일을 실행합니다. 예를 들어 모든 로그 파일을 제거하는 스크립트를 포함하려면 이 디렉토리 구조에 스크립트를 배치하면 됩니다:

    search
    ├── configs
    │   └── common
    │       └── scripts
    │           └── elasticsearch.yml
    └── LCP.json

## 검색 서비스에 라이선스 배포

검색 서비스에 라이선스를 배포하려면 `search/configs/{ENV}/license/` 경로를 생성하고 라이선스 파일을 여기에 넣어야 합니다.

## 환경 변수 참조

모든 환경 변수 및 기타 형태의 구성은 [공식 Elasticsearch 문서](https://www.elastic.co/guide/index.html)에 나와 있습니다. 이러한 구성 및 환경 변수는 각각 `configs/{ENV}/config/` 디렉토리와 `LCP.json`에서 설정할 수 있습니다. 예를 들면 다음과 같습니다:

| 이름             | 가치              | 묘사               |
|:-------------- |:--------------- |:---------------- |
| `ES_JAVA_OPTS` | `-Xms4g -Xmx4g` | ES 인스턴스의 Java 설정 |

## 관련 주제

* [LCP JSON을 통한 구성](../reference/configuration-via-lcp-json.md)
