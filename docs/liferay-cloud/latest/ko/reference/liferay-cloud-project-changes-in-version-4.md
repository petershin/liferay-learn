# 버전 4의 Liferay Cloud 프로젝트 변경 사항

Liferay Cloud 스택의 버전 3.x와 4.x 간에 서비스에 대해 Docker 이미지 버전이 정의되는 사이트, 리포지토리의 구조 및 `Jenkinsfiles` 이 사용되는 방법을 포함하여 몇 가지 변경 사항이 있습니다.

**컨텐츠:**

* [Docker 이미지 정의에 대한 변경 사항](#changes-to-docker-image-definitions)
* [프로젝트 조직 변경](#project-organization-changes)
* [Liferay 서비스 변경](#liferay-service-changes)
* [검색 서비스 변경](#search-service-changes)
* [CI 서비스 변경](#ci-service-changes)
* [웹서버 서비스 변경](#webserver-service-changes)
* [백업 서비스 변경](#backup-service-changes)
* [알려진 제한 사항](#known-limitations)

## Docker 이미지 정의에 대한 변경 사항

Liferay Cloud 버전 4.x의 서비스에 대한 Docker 이미지는 더 이상 프로젝트의 `gradle.properties` 파일에 정의되지 않습니다. 이제 각 서비스에 대해 `LCP.json` 파일에 정의됩니다.

Liferay Cloud Stack 버전 4로 업그레이드하면 모든 서비스의 Docker 이미지 버전이 `3.xx` 에서 `4.xx`으로 변경됩니다. 이러한 이미지 변경은 Liferay Cloud 프로젝트의 구성 및 기능에 대한 조직적 변경에 추가됩니다.

## 프로젝트 조직 변경

리포지토리의 가장 큰 변화는 각 서비스의 파일( `LCP.json` 파일 포함)이 리포지토리의 루트에 있는 폴더(예: `liferay/` 또는 `webserver/`)로 이동되었다는 것입니다. 이러한 재배치된 서비스 폴더로 이동하고 [CLI 도구](./command-line-tool.md)를 사용하여 각 서비스를 개별적으로 배포할 수 있습니다. `lcp` 폴더는 제거되고 더 이상 이러한 서비스의 경로에 없습니다. 이러한 폴더 자체는 [Liferay 작업 공간 구조](https://learn.liferay.com/dxp/latest/en/developing-applications/tooling/liferay-workspace/what-is-liferay-workspace.html) 과 유사하도록 재구성되었습니다.

이전에 저장소의 루트에 있던 다른 여러 파일( `gradle.properties`, `build.gradle`및 `settings.gradle`포함)도 `liferay` 서비스로 이동되었습니다.

## Liferay 서비스 변경

`liferay` 서비스 폴더는 이제 [Liferay Workspace](https://learn.liferay.com/dxp/latest/en/developing-applications/tooling/liferay-workspace/what-is-liferay-workspace.html) 의 기능 구조를 따릅니다.

`liferay` 서비스 내의 모든 구성은 이제 프로젝트의 Liferay Cloud 환경에 해당하는 환경별 `configs` 디렉토리에 속합니다. 또한 `라이센스` 폴더가 제거되었습니다. 대신 라이선스를 `배포` 폴더에 추가하십시오.

다음 표에는 `liferay` 서비스 구성의 새로운 구성이 요약되어 있습니다.

| **파일** | **3.x에서의 사이트** | **4.x에서의 사이트** |
|:--------------------------- |:-------------------------- |:----------------------------------- |
| 배포용 파일                      | lcp/liferay/deploy/{ENV}/  | liferay/configs/{ENV}/deploy/       |
| OSGi 구성 파일(.cfg 또는 .config) | lcp/liferay/config/{ENV}/  | liferay/configs/{ENV}/osgi/configs/ |
| 기타 구성 재정의                   | lcp/liferay/config/{ENV}/  | 라이프레이/구성/{ENV}/                     |
| 사용자 지정 셸 스크립트               | lcp/liferay/script/{ENV}/  | 라이프레이/구성/{ENV}/스크립트/                |
| 핫픽스 및 패치 도구                 | lcp/liferay/hotfix/{ENV}/  | liferay/configs/{ENV}/패칭/           |
| 면허                          | lcp/liferay/license/{ENV}/ | lcp/configs/{ENV}/deploy/           |

```{note}
`configs/{ENV}/` 디렉토리 내의 파일은 Liferay Cloud의 Liferay 컨테이너에 있는 `LIFERAY_HOME` 디렉토리에 재정의로 복사됩니다.
```

리포지토리에 핫픽스를 직접 커밋하는 대신 Liferay 서비스를 배포할 때 새로운 CI 서비스 환경 변수를 자동으로 추가할 수 있습니다. 자세한 내용은 [환경 변수](#installing-hotfixes-with-an-environment-variable) 로 핫픽스 설치를 참조하십시오.

### 사용자 지정 스크립트 실행

`liferay/configs/{ENV}/scripts/` 에 배치된 스크립트는 이제 루트 사용자가 아닌 `liferay` 사용자로 실행됩니다. 스크립트를 루트로 실행해야 하는 경우 대신 스크립트를 `Jenkinsfile` 에 추가해야 합니다.

## 검색 서비스 변경

`검색` 서비스 내의 모든 구성은 이제 환경별 `구성` 디렉토리에 속합니다. `검색` 서비스 구성의 새 조직은 다음 표를 참조하세요.

| **파일** | **3.x에서의 사이트** | **4.x에서의 사이트** |
|:---------------------------- |:------------------ |:----------------- |
| Elasticsearch 구성             | lcp/검색/구성/{ENV}/   | 검색/구성/{ENV}/구성/   |
| 사용자 지정 셸 스크립트                | lcp/검색/스크립트/{ENV}/ | 검색/구성/{ENV}/스크립트/ |
| Elasticsearch 라이선스(.json) 파일 | lcp/검색/라이센스/{ENV}/ | 검색/구성/{ENV}/라이센스/ |

```{note}
'search/configs/{ENV}/'에 있는 파일은 Liferay Cloud의 검색 컨테이너에 있는 'usr/shared/elasticsearch/'에 재정의로 복사됩니다. 예를 들어 `elasticsearch.yml`과 같은 `search/configs/{ENV}/config/`의 구성은 `usr/shared/elasticsearch/config/`로 복사되고 기존 기본값을 재정의합니다.
```

### Elasticsearch 플러그인

이제 Elasticsearch 플러그인을 `검색` 서비스에 설치할 수 있습니다. 설치된 Elasticsearch 플러그인을 보려면 `검색` 서비스 내의 셸을 사용하고 다음 명령을 실행합니다.

```bash
bin/elasticsearch-plugin list
```

이미지가 기본적으로 설치하는 것 외에 추가 Elasticsearch 플러그인을 설치하려면 `검색` 서비스의 `LCP_SERVICE_SEARCH_ES_PLUGINS` 환경 변수를 설치할 플러그인 이름의 쉼표로 구분된 목록으로 설정할 수 있습니다. 서비스 배포 중에 설치됩니다.

## CI 서비스 변경

이제 기본 파이프라인이 정의되었으므로 기본 `Jenkinsfile` 은 리포지토리에 더 이상 필요하지 않습니다. 모든 `Jenkinsfile` 은 이제 리포지토리의 루트가 아닌 `ci` 폴더에 정의됩니다.

이제 여러 `Jenkinsfile` 확장 지점을 `ci` 폴더에서 사용하여 빌드를 만드는 여러 단계에서 절차를 정의할 수 있습니다. 자세한 내용은 [기본 Jenkins 파일 확장](../platform-services/continuous-integration.md#extending-the-default-jenkinsfile) 을 참조하십시오.

### 환경 변수로 핫픽스 설치

대규모 핫픽스를 Git 리포지토리에 직접 커밋하는 대신 CI 빌드 프로세스를 통해 핫픽스를 설치할 수 있는 새로운 환경 변수가 추가되었습니다. 핫픽스 이름( `.zip` 확장자 생략)을 `LCP_CI_LIFERAY_DXP_HOTFIXES_{ENV}` 환경 변수에 추가합니다(Liferay Cloud 콘솔의 `환경 변수` 탭 또는 `ci` 서비스의 `LCP.json` 파일을 통해). ) 빌드 프로세스 중에 CI 서비스가 자동으로 적용하도록 합니다.

다음 예에서는 `LCP.json` 파일을 사용하여 핫픽스를 정의합니다.

```
"env": {
    "LCP_CI_LIFERAY_DXP_HOTFIXES_COMMON": "liferay-hotfix-17-7210",
    "LCP_CI_LIFERAY_DXP_HOTFIXES_DEV": "liferay-hotfix-33-7210",
}
```

## 웹서버 서비스 변경

`webserver` 서비스 내의 모든 구성은 이제 환경별 `configs` 디렉토리에 속합니다. 또한 정적 콘텐츠에 대한 `배포` 폴더가 제거되었습니다. 대신 사용자 지정 콘텐츠를 `public` 폴더에 추가하십시오.

`webserver` 서비스 구성의 새 조직은 다음 표를 참조하십시오.

| **파일** | **3.x에서의 사이트** | **4.x에서의 사이트** |
|:------- |:--------------------------- |:-------------------------- |
| 웹서버 구성  | lcp/webserver/config/{ENV}/ | 웹서버/configs/{ENV}/conf.d/  |
| 맞춤 스크립트 | lcp/webserver/script/{ENV}/ | 웹서버/configs/{ENV}/scripts/ |
| 정적 콘텐츠  | lcp/webserver/deploy/{ENV}/ | 웹서버/configs/{ENV}/public/  |

```{note}
`/webserver/configs/{ENV}/`에 있는 파일은 Liferay Cloud의 웹 서버 컨테이너에 있는 `/etc/nginx/`에 재정의로 복사됩니다. `/webserver/configs/{ENV}/public/`에 있는 파일은 재정의로 `var/www/html/`에 복사됩니다.
```

### 웹서버 구성 재정의

`liferay.conf` 파일을 `webserver/configs/{ENV}/conf.d/`에 추가하여 `webserver` 서비스의 루트 사이트를 사용자 정의할 수 있습니다. 이는 `webserver` 서비스 이미지의 컨테이너에서 사용할 수 있는 기본 `liferay.conf`를 재정의합니다. 루트 사이트를 사용자 정의할 때 기본 `liferay.conf` 파일을 참조로 보려면 Liferay Cloud Console에서 셸에 액세스하십시오.

```{warning}
이 파일이 특히 기본 `liferay.conf`를 재정의하도록 `liferay.conf` 이외의 파일 이름을 사용하여 루트 사이트를 사용자 정의하지 마십시오. 그렇지 않으면 컨테이너에 두 파일이 함께 존재하고 두 개의 루트 사이트가 발견되어 오류가 발생할 수 있습니다.

다른 파일 이름은 대신 웹 서버의 추가 사이트를 정의하는 데 사용됩니다.
```

`nginx.conf` 파일을 `webserver/configs/{ENV}/`에 추가하여 기본 NGINX 구성을 재정의할 수도 있습니다. 이를 사용하여 웹 서버의 동작을 추가로 정의할 수 있습니다. 자세한 내용은 [공식 NGINX 문서](https://docs.nginx.com/nginx/admin-guide/basic-functionality/managing-configuration-files/) 를 참조하십시오.

### 공용 디렉터리 구성

사용자 정의 정적 컨텐츠를 추가하려면 이 파일을 `webserver/configs/{ENV}/public/`에 배치하십시오. Liferay Cloud는 이 공용 폴더를 찾아 그 안의 모든 파일을 `/var/www/html`에 복사합니다.

공용 폴더를 구성하려면 `conf.d` 폴더 내에 추가 사이트를 추가해야 합니다. 예를 들어 `.html` 파일(예: `index.html`)을 새 `webserver/configs/{ENV}/public/static` 폴더에 추가하려면 고유한 `.conf` 구성 파일을 `webserver/configs에 추가합니다. /{ENV}/conf.d` 다음 내용:

```apacheconf
location /static/ {
  root /var/www/html;
}
```

## 백업 서비스 변경

`backup` 서비스 내의 모든 구성은 이제 환경별 `configs` 디렉토리에 속합니다. 이것은 주로 사용자 정의 SQL 스크립트와 관련이 있습니다.

| **파일** | **3.x에서의 사이트** | **4.x에서의 사이트** |
|:--------------- |:------------------------ |:-------------------- |
| 사용자 지정 SQL 스크립트 | lcp/backup/script/{ENV}/ | 백업/구성/{ENV}/scripts/ |

`backup` 서비스에 배포된 모든 `.sql` 스크립트는 백업 복원 프로세스가 완료된 후 자동으로 실행되며 복원 중인 환경은 자체 `backup` 서비스에서 스크립트를 실행합니다. 또한 큰 `.sql` 파일 또는 여러 개의 `.sql` 파일을 `.tgz`, `.gz`또는 `.zip` 형식으로 압축하여 이 디렉토리에 둘 수 있습니다.

## 알려진 제한 사항

새 스택에는 로컬 환경을 가동하기 위한 docker-compose 파일이 포함되어 있지 않습니다. 이 때문에 로컬 테스트에는 DXP 번들이 필요합니다.

로컬 환경에서 변경 사항을 테스트한 다음 Liferay Cloud로 마이그레이션할 수 있습니다. 자세한 내용은 [Liferay Cloud](../migrating-to-liferay-cloud.md) 로 마이그레이션을 참조하십시오.

## 추가 정보

* [Liferay 클라우드 스택 업그레이드](./upgrading-your-liferay-cloud-stack.md)