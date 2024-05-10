# 2단계: 데이터 백업 파일 생성

이제 온프레미스와 Liferay Cloud 환경 간에 Liferay 버전이 일치하므로 마이그레이션을 위해 설치 데이터를 준비해야 합니다. 이 마이그레이션 단계에는 데이터베이스 덤프 만들기, 문서 라이브러리 저장소 마이그레이션 및 문서 라이브러리를 아카이브로 압축하는 작업이 포함됩니다.

```{warning}
데이터베이스 덤프와 (압축된) 문서 라이브러리 아카이브의 결합된 크기는 Liferay 클라우드 지원에 문의하지 않고 다음 단계에서 업로드할 수 있도록 2TB를 초과하지 않아야 합니다.
```

## 데이터 동결

데이터 백업 파일을 생성하기 전에 Liferay 인스턴스의 데이터를 동결할 창을 정렬해야 합니다. 이렇게 하면 백업을 수행하는 동안 데이터가 손실되는 것을 방지할 수 있습니다. 데이터베이스 관리자와 협력하여 마이그레이션을 위해 데이터베이스 및 문서 라이브러리를 고정할 창을 예약하십시오.

## 데이터베이스를 MySQL로 변환

데이터베이스가 MySQL 5.7과 호환되는지 확인하십시오. [DBeaver](https://dbeaver.io/) 과 같은 도구를 사용하여 다른 데이터베이스 형식을 MySQL로 변환할 수 있습니다.

데이터 무결성을 보장하기 위해 변환 전후에 데이터베이스 관리자와 조정하십시오. 이전에 [데이터베이스 구성](https://learn.liferay.com/w/dxp/installation-and-upgrades/installing-liferay/configuring-a-database) 하여 변환된 데이터베이스를 테스트합니다. 진행.

### 올바른 테이블 대소문자 확인

데이터베이스 테이블 및 열 이름은 Liferay Cloud에서 대소문자를 구분하며 테이블 이름은 파스칼 대소문자여야 합니다. 테이블 이름이 소문자로 생성된 경우 Liferay Cloud에서 인식할 수 없습니다. 이는 특정 운영 체제 및 데이터베이스 조합에서 발생할 수 있습니다. 예를 들어 MySQL은 기본적으로 Linux에서 대소문자를 구분하지만 Windows 또는 MacOS(Liferay는 모두 소문자로 된 테이블을 생성할 수 있음)에서는 그렇지 않습니다.

데이터베이스 덤프를 생성하기 전에 데이터베이스 테이블에 파스칼 대소문자가 있는지 확인하십시오. 그렇지 않은 경우(예: 모두 소문자) 수동으로 또는 스크립트를 사용하여 파스칼 케이스로 변환해야 합니다. 또한 테이블 이름을 참조하는 자체 코드가 업데이트된 대소문자를 반영하는지 확인해야 합니다.

예를 들어 다음과 같은 소문자 테이블 이름을 변환합니다.

* **계정 항목** &rarr; **계정 항목**

* **cpdefinition** &rarr; **CPDefinition**

* **휴지통 항목** &rarr; **휴지통 항목**

MySQL에서 [`RENAME TABLE`](https://dev.mysql.com/doc/refman/5.7/en/rename-table.html) 명령을 사용하여 테이블 이름을 변경할 수 있습니다. 테이블 이름을 조정하는 데 도움이 필요하면 [지원 티켓을 제출](https://help.liferay.com) 하십시오.

## 데이터베이스 덤프 생성

```{note}
Windows(OS)를 사용하는 경우 압축 파일 압축/압축 해제 명령을 실행하려면 파일 압축 소프트웨어가 필요합니다. 이를 위해 [7-zip](https://www.7-zip.org/) 또는 유사한 파일 압축 소프트웨어를 설치하십시오.
```

이제 데이터베이스가 MySQL 형식이므로 데이터베이스 서버에서 다음 명령을 실행합니다. `#` 각각 데이터베이스 사용자와 암호로 바꾸고 `lportal` 필요한 경우 데이터베이스 이름으로 바꿉니다.

**Linux 및 MacOS** 의 경우(명령 1개):

```bash
mysqldump -u##### -p##### --databases --add-drop-database lportal | gzip -c | cat > database.gz
```

**Windows** 의 경우(2개의 명령):

```
mysqldump -u##### -p##### --databases --add-drop-database lportal > database.sql
```

```
7za a -tgzip database.gz database.sql
```

서버는 `database.gz`이라는 압축된 데이터베이스 덤프 파일을 생성합니다. 

## 문서 라이브러리를 파일 시스템 저장소로 마이그레이션

문서 라이브러리가 파일 시스템 저장소가 아닌 파일 스토리지 방법(예: Amazon S3Store 또는 DBStore)을 사용하는 경우 계속하기 전에 파일 시스템 저장소로 마이그레이션해야 합니다. 단순 파일 시스템 저장소 또는 고급 파일 시스템 저장소를 사용할 수 있습니다.

```{important}
[파일 스토리지](https://learn.liferay.com/ko/w/dxp/system-administration/file-storage) 는 더 쉽게 대규모로 확장되는 폴더 구조를 사용합니다. 데이터 세트. 장기적으로 문서 라이브러리에 더 많은 파일을 수용하려면 고급 파일 시스템 저장소로 마이그레이션하는 것이 좋으며 모든 프로덕션 환경에서 **필수**입니다.
```

문서 라이브러리를 마이그레이션하는 방법에 대한 단계는 [파일 저장소 마이그레이션](https://learn.liferay.com/w/dxp/system-administration/file-storage/file-store-migration) 참조하십시오.

### 변경 사항으로 Jenkins 빌드 생성

Liferay의 로컬 설치가 마이그레이션된 후 `Portal-ext.properties`로 변경하여 Liferay Cloud 환경에 빌드를 만들고 배포해야 합니다. 문서 라이브러리 저장소를 마이그레이션할 필요가 없는 경우 환경에 변경 사항을 배포할 필요가 없습니다.

Git 명령을 실행하여 Git이 설치된 터미널을 사용하여 변경 사항을 제출하십시오.

1. 변경된 파일을 Git에 추가합니다. 

    ```bash
    git add .
    ```

1. 변경 사항과 메시지를 커밋합니다. 

    ```bash
    git commit -m "Liferay Cloud Migration Stage 2"
    ```

1. GitHub에 변경 사항을 푸시합니다. 

    ```bash
    git push origin master
    ```

프로젝트가 GitHub 리포지토리에 연결되어 있으므로 변경 사항을 푸시하면 자동으로 빌드가 생성됩니다. 진행하기 전에 빌드가 완료될 때까지 기다리십시오.

### 선택한 환경에 빌드 배포

마지막으로 [Liferay Cloud Console](https://console.liferay.cloud/) 사용하여 완성된 빌드를 선택한 환경에 배포합니다.

1. Liferay Cloud Console에서 빌드 페이지로 이동합니다(페이지 상단의 링크 사용).

1. 목록에서 이전에 생성한 빌드를 찾고 작업 메뉴에서 **Deploy build to** 클릭합니다.
   
   ![빌드의 작업 메뉴를 사용하여 배포합니다.](./creating-data-backup-files/images/01.png)

1. 빌드를 배포할 환경을 선택합니다(예: `acme-dev`).

1. 아래 정보를 읽고 확인 상자를 선택하여 배포 결과를 확인합니다.
   
   ![확인란을 선택하고 준비가 되면 빌드를 배포합니다.](./creating-data-backup-files/images/02.png)

1. **빌드** 배포 를 클릭합니다.

선택한 환경에 빌드가 배포되고 `liferay` 서비스가 다시 시작되면 `Portal-ext.properties` 에 대한 변경 사항이 적용됩니다.

```{important}
Liferay Cloud의 모든 환경은 문서 라이브러리에 대해 동일한 구현을 사용하여 [다른 환경으로 복원](../platform-services/backup-service/restoring-data-from-a-backup.md). 마이그레이션된 문서 라이브러리 저장소를 모두 올바르게 사용하려면 모든 환경에 빌드를 배포해야 합니다.
```

## 문서 라이브러리 압축

문서 라이브러리가 있는 서버에서 다음 명령을 실행하여 업로드할 문서 라이브러리를 압축합니다.

**Linux 및 MacOS** 의 경우(2개의 명령):

```bash
cd $LIFERAY_HOME/data
```

```bash
tar -czvf volume.tgz document_library
```

**Windows** 의 경우(세 가지 명령):

```
cd $LIFERAY_HOME\data
```

```
7za a volume.tar document_library
```

```
7za a volume.tgz volume.tar
```

이제 `volume.tgz`이라는 압축된 문서 라이브러리 아카이브가 있습니다.

## 다음 단계

이제 Liferay Cloud 환경에 적용할 준비가 된 두 개의 파일(`database.gz` 및 `volume.tgz`)이 있습니다. 다음으로 이러한 파일을 사용하여 [데이터 백업을 업로드 및 복원](./uploading-and-restoring-the-data-backup.md)합니다.
