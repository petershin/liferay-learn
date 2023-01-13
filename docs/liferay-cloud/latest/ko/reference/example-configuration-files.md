# 예제 구성 파일

Liferay Cloud의 다양한 서비스(예: [검색](../platform-services/search-service.md) 및 [웹 서버](../platform-services/web-server-service.md) 서비스)는 구성 파일을 사용하여 온프레미스 환경에서 다르게 처리하는 데 사용할 수 있는 작업을 수행합니다. 다음은 Liferay Cloud를 시작할 때 이러한 파일이 어떻게 보이는지 확인하기 위한 시작점으로 사용할 수 있는 몇 가지 예제 리소스입니다.

## 웹 서버 서비스 구성(nginx.conf)

웹 서버 서비스는 [Nginx](https://docs.nginx.com/) 서버를 사용하여 웹 트래픽을 관리합니다. 다음은 `nginx.conf` 파일의 예입니다.

```{literalinclude} ./example-configuration-files/resources/nginx.conf
:lines: 1-81
:language: nginx
```

`nginx.conf` 파일은 프로젝트 저장소의 `webserver/configs/{ENV}/conf.d/` 디렉토리에 속합니다.

## 검색 서비스 구성(elasticsearch.yml)

검색 서비스는 [Elasticsearch](https://www.elastic.co/guide/index.html) 서버를 사용하여 Liferay 인스턴스에서 검색 쿼리를 처리합니다. 다음은 예제 `elasticsearch.yml` 파일입니다.

```{literalinclude} ./example-configuration-files/resources/elasticsearch.yml
:lines: 1-27
:language: yaml
```

`elasticsearch.yml` 파일은 프로젝트 저장소의 `search/configs/{ENV}/config/` 디렉토리에 속합니다.
