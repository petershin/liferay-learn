# Liferay DXP 인스턴스 업그레이드

Liferay는 보안 및 버그 수정과 향상된 기능을 포함하는 Liferay DXP의 새로운 마이너 및 메이저 버전을 정기적으로 출시합니다. 새로운 주요 Liferay DXP 버전 증분으로 업그레이드하려면 DXP 데이터베이스를 업그레이드해야 합니다.

```{note}
생산 중인 대규모 데이터 세트의 경우 원활한 업그레이드를 수행하기 위한 몇 가지 추가 고려 사항이 있습니다. 예를 들어 맞춤 코드 또는 Marketplace 앱이 제대로 작동하려면 추가 업데이트가 필요할 수 있습니다. 코어 업그레이드에 대한 포괄적인 개요는 [업그레이드 기본 사항](https://learn.liferay.com/w/dxp/installation-and-upgrades/upgrading-liferay/upgrade-basics) 를 참조하세요. .
```

```{note}
새 마이너 버전 또는 서비스 팩으로 업데이트하려면 대신 [Liferay DXP의 새 버전으로 업데이트](./updating-your-dxp-instance-to-a-new-minor-version.md)를 참조하십시오.
```

```{important}
Liferay Cloud에서 환경을 업그레이드하려면 업그레이드된 데이터베이스를 복원해야 하므로 Liferay 서비스를 다시 시작하는 다운타임이 필요합니다. 프로덕션 환경의 가동 중지 시간을 미리 계획하십시오.
```

데이터베이스 업그레이드를 수행하려면 다음 단계를 검토하십시오.

1. [필수 구성 요소 설치](#install-prerequisites)
1. [백업 다운로드](#download-a-backup)
1. [데이터 추출 및 가져오기](#extract-and-import-the-data)
1. [데이터 업그레이드 수행](#perform-the-data-upgrade)
1. [문서 라이브러리 및 데이터베이스 압축](#compress-the-document-library-and-database)
1. [문서 라이브러리 및 데이터베이스 업로드](#upload-the-document-library-and-database)
1. [백업 복원](#restore-the-backup)

## 전제 조건 설치

업그레이드 절차를 시작하기 전에 다음 전제 조건을 충족하십시오.

* [로컬에서 사용 가능한 MySQL 설치](https://dev.mysql.com/doc/mysql-installation-excerpt/5.7/en/) .
* [업그레이드하려는 DXP 버전에 대한 Liferay DXP](https://customer.liferay.com/en_US/downloads) 번들을 다운로드했습니다. 이 번들을 선택한 사이트로 추출하십시오.

```{important}
이전 번들을 재사용하는 대신 업그레이드용 새 번들을 다운로드하십시오. 이전 사용 데이터는 데이터 업그레이드를 방해할 수 있습니다.
```

## 백업 다운로드

현재 `prd` 환경에서 실행 중인 DXP 인스턴스의 백업(데이터베이스와 데이터 볼륨 모두로 구성됨)을 다운로드하려면 다음 단계를 수행하십시오.

1. [Liferay 클라우드 콘솔](https://console.liferay.cloud/login) 에 로그인합니다.

1. 프로덕션 환경으로 이동한 다음 메뉴에서 **백업** 을 선택합니다.

    ![프로덕션 환경에서 백업 페이지로 이동합니다.](./upgrading-your-liferay-dxp-instance/images/01.png)

1. 나열된 백업 중 하나를 선택하고 작업 메뉴에서 **다운로드** 을 선택합니다. 데이터 볼륨 및 데이터베이스 zip 파일을 다운로드합니다.

    ![데이터 볼륨과 데이터베이스 아카이브를 모두 다운로드하려면 각 옵션을 클릭하십시오.](./upgrading-your-liferay-dxp-instance/images/02.png)

## 데이터 추출 및 가져오기

다음 단계는 다운로드한 아카이브에서 데이터를 추출하고 업그레이드에 필요한 사이트로 데이터를 이동하는 것입니다.

### 데이터 볼륨 추출

백업에서 데이터 볼륨을 추출하려면 다음 단계를 수행하십시오.

1. 다운로드한 데이터 볼륨의 `.tgz` 아카이브(이름이 `backup-lfr-<PROJECT_NAME>-prd-<BACKUP_ID>.tgz`)를 이전에 추출한 Liferay 번들의 `LIFERAY_HOME/data` 폴더로 이동합니다.

1. 다음 명령을 실행하여 아카이브를 추출하십시오.

    ```bash
    tar -xvzf ARCHIVE_NAME.tgz
    ```

### 데이터베이스 추출 및 가져오기

다운로드한 데이터베이스 아카이브( `backup-db-<PROJECT_NAME>-prd-`&lt;BACKUP_ID&gt;사이트에서 명령 프롬프트를 열고 다음 단계를 수행하여 이를 MySQL로 가져옵니다.

1. 데이터베이스 아카이브를 추출합니다.

    ```bash
    tar -xvzf ARCHIVE_NAME.tgz
    ```

1. 로컬 시스템에서 MySQL 클라이언트에 로그인합니다.

    ```bash
    mysql -u root -ppassword
    ```

1. 파일 이름(확장자 제외)을 데이터베이스 이름으로 사용하여 데이터를 가져올 데이터베이스를 만듭니다.

    ```
    create database DATABASE_NAME;
    ```

1. 추출된 `.sql` 덤프에서 데이터베이스를 가져옵니다.

    ```
    use DATABASE_NAME;
    ```

    ```
    source DATABASE_NAME.sql;
    ```

1. 마지막으로 MySQL 클라이언트에서 연결을 끊습니다.

    ```
    나가기
    ```

이제 데이터베이스와 문서 라이브러리가 준비되었으며 데이터 업그레이드를 수행할 준비가 되었습니다.

## 데이터 업그레이드 수행

DXP 번들은 데이터 업그레이드에 사용되는 업그레이드 도구를 제공합니다. 이 도구는 번들 `db_upgrade.sh`에 포함된 스크립트를 통해 호출됩니다.

```{note}
데이터베이스 업그레이드 도구는 실행할 때 더 많은 유연성을 위해 미리 구성할 수 있습니다. [데이터베이스 업그레이드 도구 사용](https://learn.liferay.com/w/dxp/installation-and-upgrades/upgrading-liferay/upgrade-basics/using-the-database-upgrade-tool 참조) ) 고급 사용에 대한 자세한 내용을 보려면
```

`LIFERAY_HOME/tools/portal-tools-db-upgrade-client` 폴더 내에서 명령 프롬프트를 엽니다. 그런 다음 다음 명령을 실행합니다.

```bash
db_upgrade.sh -j "-Dfile.encoding=UTF-8 -Duser.timezone=GMT -Xmx2048m" -l "output.log"
```

업그레이드 도구는 데이터 업그레이드를 시작하기 전에 설치에 대한 정보를 묻는 메시지를 표시합니다. Tomcat과 함께 Liferay 번들을 다운로드한 경우 일부 디렉터리를 기본값으로 자동 감지합니다.

다음은 이 정보를 입력하는 업그레이드 도구와의 상호 작용 예입니다.

```
Please enter your application server (tomcat):
tomcat

Please enter your application server directory (../../tomcat-9.0.17):

Please enter your extra library directories (../../tomcat-9.0.17/bin):

Please enter your global library directory (../../tomcat-9.0.17/lib):

Please enter your portal directory (../../tomcat-9.0.17/webapps/ROOT):

[ db2 mariadb mysql oracle postgresql sqlserver sybase ]
Please enter your database (mysql):
mysql

Please enter your database host (localhost):

(etc.)
```

필요한 정보를 입력하면 업그레이드 도구가 데이터 업그레이드를 수행합니다. 콘솔에 다음 메시지가 나타나면 업그레이드가 완료된 것입니다.

```
Completed Liferay core upgrade and verify processes in 64 seconds
Checking to see if all upgrades have completed... done.
```

번들을 로컬에서 테스트하여 업그레이드가 원활하게 완료되었는지 확인하십시오. `LIFERAY_HOME/tomcat-9.xx/bin/`에서 다음 명령을 실행하여 로컬에서 인스턴스를 테스트할 수 있습니다.

```bash
./catalina.sh run
```

업그레이드가 완료되고 확인되면 데이터베이스와 데이터 볼륨을 Liferay Cloud에 업로드할 준비가 된 것입니다.

## 문서 라이브러리 및 데이터베이스 압축

이제 Liferay 설치가 업그레이드되었으므로 다음 단계를 사용하여 `백업` 서비스에 업로드할 준비를 하십시오.

### 문서 라이브러리 압축

1. `LIFERAY_HOME/data` 폴더 내에서 명령 프롬프트를 엽니다.

1. 다음 명령을 실행하여 문서 라이브러리를 `.tgz` 아카이브로 압축합니다.

    ```bash
    tar -czvf volume.tgz document_library
    ```

    ```{important}
    다운로드한 데이터 볼륨에 더 많은 폴더(예: `license/` 폴더)가 포함된 경우 이를 `document_library` 뒤에 추가 인수로 추가합니다.
    ```

### 업그레이드된 데이터베이스 내보내기 및 압축

1. 다음 명령을 실행하여 데이터베이스 덤프를 수행하십시오.

    ```
    mysqldump -uroot -ppassword --databases --add-drop-database lportal | gzip -c | cat > database.gz
    ```

1. 다음 명령을 사용하여 이 파일을 `.tgz` 아카이브로 압축합니다.

    ```bash
    tar zcvf database.tgz database.gz
    ```

이제 데이터베이스 및 Liferay 데이터 볼륨을 `백업` 서비스에 업로드할 준비가 되었습니다.

## 문서 라이브러리 및 데이터베이스 업로드

콘솔을 통해 문서 라이브러리 및 데이터베이스 아카이브를 `백업` 서비스에 업로드합니다.

1. 아직 로그인하지 않은 경우 [Liferay Cloud 콘솔](https://console.liferay.cloud/login) 에 로그인합니다.

1. 적절한 환경에 대한 **백업** 페이지로 이동합니다.

1. 화면 상단 근처의 **백업 업로드...** 을 클릭합니다.

    ![백업 업로드 버튼을 클릭하여 업로드 페이지에 액세스합니다.](./upgrading-your-liferay-dxp-instance/images/03.png)

1. 백업 업로드 페이지에서 적절한 환경을 확장하고 데이터베이스와 문서 라이브러리 모두에 대해 `+` 아이콘을 클릭하여 업로드합니다.

    ![아이콘을 클릭하여 데이터베이스와 문서 라이브러리를 모두 .gz 아카이브로 업로드합니다.](./upgrading-your-liferay-dxp-instance/images/04.png)

1. 데이터베이스 덤프와 문서 라이브러리가 모두 업로드되면 **업로드 시작** 을 클릭합니다.

```{note}
업로드 API를 통해 데이터베이스 덤프 및 문서 라이브러리를 업로드할 수도 있습니다. 자세한 내용은 [백업 서비스 API](../platform-services/backup-service/downloading-and-uploading-backups.md#backup-service-apis) 를 참조하세요.
```

업로드가 완료되면 백업 페이지의 목록 상단에 새 백업이 나타납니다.

## 프로젝트의 Liferay 이미지 버전 업데이트

업그레이드된 데이터베이스가 올바르게 작동하도록 환경에서 사용하는 Liferay 이미지 버전을 업데이트해야 합니다.

Liferay DXP의 새 버전을 반영하도록 필요에 따라 다음 사이트를 업데이트합니다.

* `liferay/LCP.json`의 `이미지` 속성. [Services Changelogs](https://help.liferay.com/hc/ko/sections/360006251311-Services-Changelog) 에서 업데이트된 이미지를 확인하고 업그레이드된 DXP 버전이 이미지의 버전과 일치하는지 확인합니다(예: `7.2` in `liferaycloud/liferay-dxp:7.2-4.0.7`).

* `liferay.workspace.docker.image.liferay` 속성 `liferay/gradle.properties`. 업그레이드된 DXP 버전과 일치하는 이미지는 [Liferay DXP Docker Hub 페이지](https://hub.docker.com/r/liferay/dxp/tags) 을 확인하십시오.

이 두 이미지 버전이 모두 업데이트되면 [사항을 선택한 환경에 배포](./deploying-to-the-liferay-service.md). 이렇게 하면 업로드된 백업을 복원할 수 있도록 Liferay 서비스가 준비됩니다.

## 백업 복원

선택한 환경에 백업을 복원하려면 다음 단계를 따르십시오.

1. 아직 로그인하지 않은 경우 Liferay Cloud 콘솔에 로그인합니다.

1. [백업을 업로드한](#upload-the-document-library-and-database) 환경으로 이동한 다음 사이드 메뉴에서 **Backups** 를 클릭합니다.
   
   1 목록에서 백업을 선택한 다음 해당 백업에 대한 작업 메뉴에서 **복원을** 로 클릭합니다.
  
  ![업로드된 백업에 대한 작업 메뉴에서 복원 대상...을 선택합니다.](./upgrading-your-liferay-dxp-instance/images/05.png)

1 드롭다운 목록에서 복원할 환경 중 하나를 선택합니다(예: `dev` 환경).
  
  ![백업을 배포할 환경을 선택합니다.](./upgrading-your-liferay-dxp-instance/images/06.png)

1 **환경으로 복원** 을 클릭합니다. 

    ```{note}
    백업이 배포되는 동안 선택한 환경을 사용할 수 없습니다.
    ```

<!-- I'd also want to know if there is a zero downtime way to do an upgrade - because that's one of the next questions I would ask if I put myself in the shoes of someone trying to run a prod and business critical env. We may not be ready to say anything about that - but just a thought to put in your mind as potentially a future iteration of this - or let's say if we find out that you CAN do a zero downtime upgrade using a DR environment, then we should update this article to say so. An example:

Upgrading the liferay service requires a database upgrade and restoring the liferay service using the upgraded database. The process of restoring the upgraded database from backup requires some downtime and we recommend testing your upgrade on the DEV or UAT environments first. Zero downtime upgrades are possible using a DR environment. 

-->

축하합니다! DXP 데이터베이스를 새 버전으로 업그레이드하고 선택한 환경에 배포했습니다. 필요에 따라 동일한 백업을 다른 환경으로 [](#restore-the-backup) 할 수도 있습니다.

## 관련 주제

DXP 업그레이드에 대해 자세히 알아보십시오.

* [업그레이드 기본 사항](https://learn.liferay.com/w/dxp/installation-and-upgrades/upgrading-liferay/upgrade-basics)
* [DXP 인스턴스를 새 마이너 버전으로 업데이트](./updating-your-dxp-instance-to-a-new-minor-version.md)
* [데이터베이스 업그레이드 도구 사용](https://learn.liferay.com/w/dxp/installation-and-upgrades/upgrading-liferay/upgrade-basics/using-the-database-upgrade-tool)
