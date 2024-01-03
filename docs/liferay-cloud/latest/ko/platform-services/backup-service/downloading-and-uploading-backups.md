# 백업 다운로드 및 업로드

Liferay Cloud 백업 서비스는 환경 데이터베이스의 백업과 Liferay 인스턴스의 `LIFERAY_HOME/data` 폴더의 전체 콘텐츠를 생성합니다. 이 콘텐츠는 아카이브 파일(각각 '.gz' 및 '.tgz')로 저장되며 Liferay Cloud 콘솔을 통해 다운로드할 수 있습니다.

사용자는 Liferay Cloud Console [을 사용하거나](#backup-service-apis) Backup API [통해 환경 백업](#uploading-backups-via-the-console) 을 다운로드하거나 업로드할 수도 있습니다.

```{note}
백업 페이지는 4.3.5 이전 버전의 백업 서비스에 대한 프로덕션 환경에서만 사용할 수 있습니다.
```

## CLI 도구를 통해 백업 다운로드

{bdg-secondary}`CLI 도구 버전 3.12.0+, 백업 서비스 버전 5.9.0+, Liferay 서비스 버전 5.3.0+ 필요`

[CLI 도구](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool) 사용하여 데이터베이스와 문서 라이브러리 볼륨을 모두 포함하는 백업을 직접 다운로드할 수 있습니다.

특정 백업의 ID를 사용하여 이 명령을 실행하면 해당 데이터베이스와 문서 라이브러리를 동시에 다운로드할 수 있습니다.

```bash
lcp backup download --backupId [ID]
```

세 가지 선택적 명령줄 스사이트
가 있습니다.

`--database`는 데이터베이스만 다운로드하도록 지정합니다.

`--doclib`은 문서 라이브러리만 다운로드하도록 지정합니다.

`--concurrency`는 병렬로 다운로드할 파일 수(최대 10,000개)를 정의합니다.

다음은 여러 스사이트
를 사용하는 예입니다.

```bash
lcp backup download --backupId [ID] --doclib --concurrency 500
```

동시에 다운로드할 최적의 파일 수는 시스템 및 네트워크 사양에 따라 다릅니다. 데이터베이스가 단일 파일로 다운로드되므로 `--concurrency` 플래그는 문서 라이브러리 다운로드에만 영향을 미칩니다.

## CLI 도구를 통해 백업 업로드

{bdg-secondary}`CLI 도구 버전 3.12.0+, 백업 서비스 버전 5.9.0+, Liferay 서비스 버전 5.3.0+ 필요`

```{warning}
데이터베이스 테이블 및 열 이름은 Liferay Cloud에서 대소문자를 구분합니다. 데이터베이스를 업로드하기 전에 테이블 이름이 파스칼 표기인지 확인하세요. 자세한 내용은 [올바른 테이블 대문자 사용 보장](../../migrating-to-liferay-cloud.md#ensuring-correct-table-capitalization) 참조하세요.
```

데이터베이스와 문서 라이브러리가 모두 포함된 백업을 업로드하려면 다음 명령을 실행하세요.

```bash
lcp backup upload --project [Project name] --environment [Environment] --doclib [Path to document library folder] --database [Path to database .gz file]
```

업로드하려면 데이터베이스 덤프 [데이터베이스 덤프 생성 및 압축](#creating-the-database-file) `.gz` 아카이브로 생성하고 압축해야 합니다.

병렬로 업로드할 스트림 수(최대 10,000개)와 함께 `--concurrency` 플래그를 추가할 수도 있습니다.

## 업로드를 위한 데이터베이스 및 문서 라이브러리 준비

Liferay Cloud에 환경 백업을 업로드하려면 자체 아카이브 파일에 데이터베이스가 준비되어 있어야 합니다. 5.9.0 이전 백업 서비스 버전의 경우 문서 라이브러리도 별도의 아카이브 파일로 압축해야 합니다.

### 데이터베이스 파일 생성

MySQL 덤프를 `.sql` 스크립트로 생성하고 `.gz` 아카이브로 압축하려면 다음 명령을 실행하세요.

```bash
mysqldump -uroot -ppassword --add-drop-database --databases lportal | gzip -c | cat > database.gz
```

```{note}
백업 서비스가 `4.2` 버전 이상으로 업데이트되지 않은 경우 다음 명령을 실행하여 아카이브를 `.tgz` 파일로 변환해야 합니다: `tar zcvf Database.tgz Database.gz`. 그런 다음 결과 `.tgz` 아카이브를 사용하여 업로드합니다.
```

백업 복원이 올바르게 작동하려면 `--databases` 및 `--add-drop-database` 플래그가 필요합니다. 또한 '/backup/download' API를 사용하여 백업 서비스가 MySQL 덤프 파일을 생성하는 방법을 확인할 수 있습니다.

이러한 옵션을 사용하면 결과 덤프 파일에는 create table 문 바로 앞에 다음 코드가 포함됩니다.

```sql
--
-- Current Database: `lportal`
--

/*!40000 DROP DATABASE IF EXISTS `lportal`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `lportal` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `lportal`;
```

### 볼륨 파일 생성

[LCP 도구](#uploading-backups-via-the-cli-tool) 을 사용하여 백업을 업로드하는 경우 도구가 문서 라이브러리의 파일을 자동으로 압축하므로 볼륨 파일을 만들 필요가 없습니다.

Cloud 콘솔 UI 또는 API를 통해 백업을 업로드하려면 문서 라이브러리를 압축하여 업로드해야 합니다.

```{tip}
백업을 업로드할 때 Liferay Cloud에 대한 권한이 아직 구성되지 않은 경우 나중에 환경에 백업을 복원하는 데 시간이 더 오래 걸릴 수 있습니다. 복원 시간이 길어지는 것을 방지하려면 'LIFERAY_HOME' 폴더로 이동하여 문서 라이브러리를 압축하기 전에 'chown -R 1000:1000 data/document_library/' 명령을 실행하세요.
```

데이터 볼륨을 압축하려면 다음 명령을 실행하세요.

```bash
cd $LIFERAY_HOME/data && tar -czvf volume.tgz document_library
```

## 콘솔을 통해 백업 다운로드

```{important}
**백업 서비스 5.9.0** 이전에는 콘솔을 통해서만 백업을 다운로드할 수 있습니다. 버전 5.9.0+의 경우 대신 [CLI 도구](#downloading-backups-via-the-cli-tool) 사용하십시오.
```

선택한 환경의 _백업_ 페이지에서 백업을 다운로드하려면 관리자로서 다음 단계를 따르세요.

1. 다운로드하려는 백업에 대해 _작업_( ⋮ )을 클릭하세요.

1. _다운로드_를 클릭하세요.

   ![Click on the Actions button, and then click Download.](./downloading-and-uploading-backups/images/01.png)

1. _Database_(`.gz`) 또는 _Liferay_(`.tgz`) 파일을 클릭하여 다운로드를 시작하세요. 이러한 zip 아카이브는 함께 환경 백업을 구성합니다.

   ```{note}
   백업 서비스가 아직 '4.2' 버전 이상으로 업데이트되지 않은 경우 데이터베이스 볼륨은 '.gz' 대신 '.tgz' 아카이브로 다운로드됩니다.
   ```

   ![Click to download the database and Liferay data volume files.](./downloading-and-uploading-backups/images/02.png)

## 콘솔을 통해 백업 업로드

Liferay Cloud에 백업을 업로드하려면 먼저 데이터베이스 덤프와 문서 라이브러리를 별도의 아카이브로 압축해야 합니다. 온프레미스 환경을 위한 준비에 대한 자세한 내용은 [업로드를 위한 데이터베이스 및 문서 라이브러리 준비](#preparing-the-database-and-document-library-for-upload) 참조하세요.

```{warning}
데이터베이스 테이블 및 열 이름은 Liferay Cloud에서 대소문자를 구분합니다. 데이터베이스를 업로드하기 전에 테이블 이름이 파스칼 표기인지 확인하세요. 자세한 내용은 [올바른 테이블 대문자 사용 보장](../../migrating-to-liferay-cloud.md#ensuring-correct-table-capitalization) 참조하세요.
```

백업 페이지에서 다음 단계를 따르세요.

1. 화면 상단 근처에서 *백업 업로드...*를 클릭합니다.

1. 백업 업로드 페이지에서 해당 환경을 확장한 다음 데이터베이스와 문서 라이브러리 모두에 대해 '+' 아이콘을 클릭하여 업로드합니다.

   ![Click the icons to upload both the database and document library as .gz archives.](./downloading-and-uploading-backups/images/03.png)

1. 데이터베이스 덤프와 문서 라이브러리가 모두 업로드되면 _업로드 시작_을 클릭합니다.

Liferay Cloud는 업로드한 파일을 사용하여 백업을 생성하고 이를 환경에 복원할 수 있는 목록에 추가합니다. 백업이 생성되는 동안에는 다른 백업을 생성하거나 복원할 수 없습니다.

백업이 생성되면 페이지에 성공 메시지가 나타나고 서비스는 정상 작동을 재개합니다.

![When the backup is finished being added to the list in your environment, a success message appears.](./downloading-and-uploading-backups/images/04.png)

## 백업 서비스 API

백업 서비스에는 백업 버전 5.9.0 이전의 백업을 다운로드하고 업로드하는 데 사용할 수 있는 API가 있습니다. `curl`과 같은 명령줄 도구를 사용하여 이러한 API를 호출할 수 있습니다.

### 호스트 이름 얻기

백업 API를 호출하려면 백업 서비스의 호스트 이름이 필요합니다. _서비스_ 페이지에서 이를 찾을 수 있습니다.

![View the backup service's host name from the Services page.](./downloading-and-uploading-backups/images/05.png)

백업 서비스의 호스트 이름은 서비스, 프로젝트, 환경 이름의 조합입니다.

다음 예를 고려하십시오.

* 서비스 이름:`백업`
* 프로젝트 이름: `lfrjoebloggs`
* 환경 이름: `prd`
* 호스트 이름: `backup-lfrjoebloggs-prd.lfr.cloud`

### 인증

기본 인증 또는 사용자 액세스 토큰을 사용하여 요청을 인증할 수 있습니다.

SSO가 활성화된 경우 토큰 인증이 필요합니다. 쿠키 'access_token'에서 이 토큰을 검색하여 'dxpcloud-authorization' 헤더와 함께 사용할 수 있습니다.

업로드 API에서 토큰 인증을 사용하는 예는 다음과 같습니다.

```bash
curl -X POST \
  https://backup-[Project name]-[Environment].lfr.cloud/backup/upload \
  -H 'Content-Type: multipart/form-data' \
  -H 'dxpcloud-authorization: Bearer [User token]' \
  -F 'database=@/my-folder/database.gz' \
  -F 'volume=@/my-folder/volume.tgz'
```

```{note}
헤더 `dxpcloud-authorization`에 사용자 토큰을 전달하면 백업 서비스 `3.2.0` 이상 버전에서만 작동합니다. 이전 버전은 `3.2.0` 이상으로 업그레이드해야 합니다. 이전 버전에 대한 요청은 `인증` 헤더를 사용해야 합니다: 무기명 [프로젝트 마스터 토큰]` 헤더를 사용해야 합니다. 프로젝트 마스터 토큰은 Liferay Cloud 콘솔의 모든 셸에서 `env | grep LCP_PROJECT_MASTER_TOKEN` 명령을 실행하여 찾을 수 있습니다.
```

### 데이터베이스 API 다운로드

데이터베이스 다운로드를 위한 API에는 `.gz` 파일을 반환하는 엔드포인트가 포함되어 있습니다. 'id' 매개변수는 백업 페이지에서 찾을 수 있는 백업 ID를 나타냅니다. 이 ID는 두 개의 대시로 구분된 세 개의 문자열로 구성됩니다(예: `dxpcloud-lqgqnewltbexuewymq-201910031723`).

#### 매개 변수

| 이름   | 유형       | 요구하는 |
| :--- | :------- | :--- |
| `id` | `String` | 그렇다  |

#### curl 예제

```bash
curl -X GET \
  https://backup-[Project name]-[Environment].lfr.cloud/backup/download/database/[ID] \
  -u user@domain.com:password \
  --output database.gz
```

```{note}
백업 서비스가 아직 '4.2' 버전 이상으로 업데이트되지 않은 경우 데이터베이스 볼륨은 '.gz' 대신 '.tgz' 아카이브로 다운로드됩니다.
```

### 데이터 볼륨 API 다운로드

데이터 볼륨을 다운로드하기 위한 API에는 '.tgz' 파일을 반환하는 엔드포인트가 포함되어 있습니다. 'id' 매개변수는 백업 페이지에서 찾을 수 있는 백업 ID를 나타냅니다. 이 ID는 두 개의 대시로 구분된 세 개의 문자열로 구성됩니다(예: `dxpcloud-lqgqnewltbexuewymq-201910031723`).

#### 매개 변수

| 이름   | 유형       | 요구하는 |
| :--- | :------- | :--- |
| `id` | `String` | 그렇다  |

#### curl 예제

```bash
curl -X GET \
  https://backup-[Project name]-[Environment].lfr.cloud/backup/download/volume/[ID] \
  -u user@domain.com:password \
  --output volume.tgz
```

### 백업 API 업로드

업로드 백업 API를 사용하여 Liferay Cloud에 백업을 업로드하려면 다음 단계를 따르세요.

1. [데이터베이스 파일을 생성합니다.](#creating-the-database-file) .

1. [볼륨 파일을 생성합니다.](#creating-the-volume-file) .

1. [데이터베이스 및 볼륨 파일을 사용하여 백업 API](#invoking-the-backup-api) 을 호출합니다.

업로드 API를 사용하려면 먼저 데이터베이스 덤프와 문서 라이브러리를 별도의 아카이브로 압축해야 합니다. 온-프레미스 환경에 대한 업로드 준비에 대한 자세한 내용은 [업로드를 위한 데이터베이스 및 문서 라이브러리 준비](#preparing-the-database-and-document-library-for-upload) 참조하세요.

#### 백업 API 호출

**매개변수**

| 이름         | 유형     | 요구하는 |
| :--------- | :----- | :--- |
| `database` | `File` | 그렇다  |
| `volume`   | `File` | 그렇다  |

**curl 예제**

```bash
curl -X POST \
  https://backup-[Project name]-[Environment].lfr.cloud/backup/upload \
  -H 'Content-Type: multipart/form-data' \
  -F 'database=@/my-folder/database.gz' \
  -F 'volume=@/my-folder/volume.tgz' \
  -u user@domain.com:password
```

## 관련 주제

* [백업 서비스 개요](./backup-service-overview.md)
* [백업에서 데이터 복원](./restoring-data-from-a-backup.md)
* [데이터베이스 서비스(MySQL)](../database-service/database-service.md)
