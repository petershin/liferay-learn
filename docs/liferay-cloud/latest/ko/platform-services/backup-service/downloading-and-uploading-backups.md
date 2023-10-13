# 백업 다운로드 및 업로드

Liferay Cloud 백업 서비스는 환경 데이터베이스의 백업과 Liferay 인스턴스의 `LIFERAY_HOME/data` 폴더의 전체 콘텐츠를 생성합니다. 이 콘텐츠는 아카이브 파일(각각`.gz` 및 `.tgz` )로 저장되며 Liferay Cloud 콘솔을 통해 다운로드할 수 있습니다.

사용자는 또한 [Liferay 클라우드 콘솔을 사용하여](#uploading-backups-via-the-console) 또는 [백업 API를 통해](#backup-service-apis) 환경 백업을 다운로드하거나 업로드할 수 있습니다.

```{note}
백업 페이지는 4.3.5 이전 백업 서비스 버전의 프로덕션 환경에서만 사용할 수 있습니다.
```

## 콘솔을 통해 백업 다운로드

선택한 환경의 **백업** 페이지에서 백업을 다운로드하려면 다음 단계를 따르세요.

1. 다운로드하려는 백업에 대해 **작업** 버튼( ⋮ )을 클릭합니다.

1. **다운로드** 클릭하세요.
   
   ![작업 버튼을 클릭한 다음 다운로드를 클릭합니다.](./downloading-and-uploading-backups/images/01.png)

1. **Database**(`.gz`) 또는 **Liferay**(`.tgz`) 파일을 클릭하여 다운로드를 시작하세요. 이러한 zip 아카이브는 함께 환경 백업을 구성합니다.

    ```{note}
    백업 서비스가 아직 '4.2' 버전 이상으로 업데이트되지 않은 경우 데이터베이스 볼륨은 '.gz' 대신 '.tgz' 아카이브로 다운로드됩니다.
    ```

![데이터베이스 및 Liferay 데이터 볼륨 파일을 다운로드하려면 클릭하세요.](./downloading-and-uploading-backups/images/02.png)

```{note}
선택한 환경의 관리자만 백업 페이지에서 백업을 다운로드할 수 있습니다.
```

## 콘솔을 통해 백업 업로드

```{warning}
데이터베이스 테이블 및 열 이름은 Liferay Cloud에서 대소문자를 구분합니다. 데이터베이스를 업로드하기 전에 테이블 이름이 파스칼 표기인지 확인하세요. 자세한 내용은 [올바른 테이블 대문자 사용 보장](../../migating-to-liferay-cloud.md#ensuring-corright-table-capitalization) 을 참조하세요.
```

선택한 환경의 **백업** 페이지를 통해 프로젝트에 백업을 업로드할 수도 있습니다.

Liferay Cloud에 백업을 업로드하려면 먼저 데이터베이스 덤프와 문서 라이브러리를 별도의 아카이브로 압축해야 합니다. 온프레미스 환경을 위한 준비에 대한 자세한 내용은 [업로드를 위한 데이터베이스 및 문서 라이브러리 준비](#preparing-the-database-and-document-library-for-upload) 참조하세요.

```{warning}
업로드가 시작되면 업로드가 완료될 때까지 백업 서비스를 사용하여 다른 백업을 생성하거나 복원할 수 없습니다.
```

**백업** 페이지에서 다음 단계를 따르세요.

1. 화면 상단 근처에서 **백업 업로드...** 클릭합니다.

1. 백업 업로드 페이지에서 해당 환경을 확장한 후 데이터베이스와 문서 라이브러리 모두에 대해 `+` 아이콘을 클릭하여 업로드합니다.
   
   ![데이터베이스와 문서 라이브러리를 모두 .gz 아카이브로 업로드하려면 아이콘을 클릭하세요.](./downloading-and-uploading-backups/images/03.png)

1. 데이터베이스 덤프와 문서 라이브러리가 모두 업로드되면 **업로드 시작** 을 클릭합니다.

Liferay Cloud는 업로드한 파일을 사용하여 백업을 생성하고 이를 환경에 복원할 수 있는 목록에 추가합니다. 백업이 생성되는 동안에는 다른 백업을 생성하거나 복원할 수 없습니다.

백업이 생성되고 서비스가 정상 작동을 재개하면 페이지에 성공 메시지가 나타납니다.

![사용자 환경의 목록에 백업 추가가 완료되면 성공 메시지가 나타납니다.](./downloading-and-uploading-backups/images/04.png)

## CLI 도구를 통해 백업 다운로드

> CLI 도구 버전 3.12.0+, 백업 서비스 버전 5.9.0+ 및 Liferay 서비스 버전 5.3.0+가 필요합니다.

[CLI 도구](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool) 을 사용하여 백업을 직접 다운로드할 수 있습니다. 이 방법을 사용하면 데이터베이스와 문서 라이브러리 볼륨을 동시에 다운로드할 수 있습니다.

특정 백업의 데이터베이스와 문서 라이브러리를 동시에 다운로드하려면 해당 ID를 사용하여 이 명령을 실행하십시오.

```bash
lcp backup download --backupId {ID}
```

또한 이 명령에 `--database` 플래그를 추가하여 데이터베이스만 다운로드하거나 `--doclib` 플래그를 사용하여 문서 라이브러리만 다운로드할 수도 있습니다.

## 업로드를 위한 데이터베이스 및 문서 라이브러리 준비

환경 백업을 Liferay Cloud에 업로드하려면 해당 환경의 데이터베이스와 문서 라이브러리가 별도의 아카이브 파일로 준비되어 있어야 합니다.

### 데이터베이스 파일 생성

MySQL 덤프를 생성하고( `.sql` 스크립트로) 이를 `.gz` 아카이브로 압축하려면 다음 명령을 실행하십시오.

```bash
mysqldump -uroot -ppassword --add-drop-database --databases lportal | gzip -c | cat > database.gz
```

```{note}
백업 서비스가 '4.2' 버전 이상으로 업데이트되지 않은 경우 다음 명령을 실행하여 아카이브를 '.tgz' 파일로 변환해야 합니다: 'tar zcvf Database.tgz Database.gz'. 그런 다음 결과 `.tgz` 아카이브를 사용하여 업로드합니다.
```

백업 복원이 올바르게 작동하려면 `데이터베이스` 및 `add-drop-database` 옵션이 필요합니다. `/backup/download` API를 사용하여 백업 서비스가 MySQL 덤프 파일을 생성하는 방법을 확인할 수도 있습니다.

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

```{tip}
백업을 업로드할 때 Liferay Cloud에 대한 권한이 아직 구성되지 않은 경우 나중에 환경에 백업을 복원하는 데 시간이 더 오래 걸릴 수 있습니다. 복원 시간이 길어지는 것을 방지하려면 'LIFERAY_HOME' 폴더로 이동하여 문서 라이브러리를 압축하기 전에 'chown -R 1000:1000 data/document_library/' 명령을 실행하세요.
```

데이터 볼륨을 압축하려면 다음 명령을 실행하세요.

```bash
cd $LIFERAY_HOME/data && tar -czvf volume.tgz document_library
```

## 백업 서비스 API

```{important}
이러한 API 경로는 **5.9.0 이전** 백업 서비스 버전에 적용됩니다. 버전 5.9.0+의 경우 [CLI 도구](#downloading-backups-via-the-cli-tool) 또는 [Cloud 콘솔](#downloading-backups-via-the-console) 을 대신 사용하세요.
```

백업 서비스에는 백업 버전 5.9.0 이전의 백업을 다운로드하고 업로드하는 데 사용할 수 있는 API가 있습니다. `cur`과 같은 명령줄 도구를 사용하여 이러한 API를 호출할 수 있습니다.

### 호스트 이름 얻기

백업 API를 호출하려면 백업 서비스의 호스트 이름이 필요합니다. **서비스** 페이지에서 확인하실 수 있습니다.

![서비스 페이지에서 백업 서비스의 호스트 이름을 확인합니다.](./downloading-and-uploading-backups/images/05.png)

백업 서비스의 호스트 이름은 서비스, 프로젝트, 환경 이름의 조합입니다.

다음 예를 고려하십시오.

* 서비스 이름: `백업`
* 프로젝트 이름: `lfrjoebloggs`
* 환경 이름: `prd`
* 호스트 이름: `backup-lfrjoebloggs-prd.lfr.cloud`

### 인증

기본 인증 또는 사용자 액세스 토큰을 사용하여 요청을 인증할 수 있습니다.

SSO가 활성화된 경우 토큰 인증이 필요합니다. 쿠키 `access_token` 에서 이 토큰을 검색하여 `dxpcloud-authorization` 헤더와 함께 사용할 수 있습니다.

업로드 API와 함께 토큰 인증을 사용하는 예는 다음과 같습니다.

```bash
curl -X POST \
  https://backup-<PROJECT-NAME>-<ENV>.lfr.cloud/backup/upload \
  -H 'Content-Type: multipart/form-data' \
  -H 'dxpcloud-authorization: Bearer <USER_TOKEN>' \
  -F 'database=@/my-folder/database.gz' \
  -F 'volume=@/my-folder/volume.tgz'
```

```{note}
`dxpcloud-authorization` 헤더에 사용자 토큰을 전달하는 것은 백업 서비스 버전 `3.2.0` 이상에서만 작동합니다. 이전 버전은 최소한 '3.2.0'으로 업그레이드해야 합니다. 이전 버전에 대한 요청은 'Authorization: Bearer <PROJECT_MASTER_TOKEN>' 헤더를 사용해야 합니다. `env | 명령을 실행하여 프로젝트 마스터 토큰을 찾을 수 있습니다. Liferay Cloud 콘솔의 모든 셸에서 grep LCP_PROJECT_MASTER_TOKEN`을 실행합니다.
```

### 데이터베이스 API 다운로드

데이터베이스 다운로드를 위한 API에는 `` 파일을 반환하는 엔드포인트가 포함되어 있습니다. `id` 매개변수는 백업 페이지에서 찾을 수 있는 백업 ID를 나타냅니다. 이 ID는 두 개의 대시로 구분된 세 개의 문자열로 구성됩니다(예: `dxpcloud-lqgqnewltbexuewymq-201910031723`).

#### 매개 변수

| 이름   | 유형       | 요구하는 |
|:---- |:-------- |:---- |
| `id` | `String` | 그렇다  |

#### curl 예제

```bash
curl -X GET \
  https://backup-<PROJECT-NAME>-<ENV>.lfr.cloud/backup/download/database/<ID> \
  -u user@domain.com:password \
  --output database.gz
```

```{note}
백업 서비스가 아직 '4.2' 버전 이상으로 업데이트되지 않은 경우 데이터베이스 볼륨은 '.gz' 대신 '.tgz' 아카이브로 다운로드됩니다.
```

### 데이터 볼륨 API 다운로드

데이터 볼륨을 다운로드하기 위한 API에는 `.tgz` 파일을 반환하는 엔드포인트가 포함되어 있습니다. `id` 매개변수는 백업 페이지에서 찾을 수 있는 백업 ID를 나타냅니다. 이 ID는 두 개의 대시로 구분된 세 개의 문자열로 구성됩니다(예: `dxpcloud-lqgqnewltbexuewymq-201910031723`).

#### 매개 변수

| 이름   | 유형       | 요구하는 |
|:---- |:-------- |:---- |
| `id` | `String` | 그렇다  |

#### curl 예제

```bash
curl -X GET \
  https://backup-<PROJECT-NAME>-<ENV>.lfr.cloud/backup/download/volume/<ID> \
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

**매개 변수**

| 이름         | 유형     | 요구하는 |
|:---------- |:------ |:---- |
| `database` | `File` | 그렇다  |
| `volume`   | `File` | 그렇다  |

**curl 예제**

```bash
curl -X POST \
  https://backup-<PROJECT-NAME>-<ENV>.lfr.cloud/backup/upload \
  -H 'Content-Type: multipart/form-data' \
  -F 'database=@/my-folder/database.gz' \
  -F 'volume=@/my-folder/volume.tgz' \
  -u user@domain.com:password
```

## 관련 주제

* [백업 서비스 개요](./backup-service-overview.md)
* [백업에서 데이터 복원](./restoring-data-from-a-backup.md)
* [데이터베이스 서비스(MySQL)](../database-service/database-service.md)
