---
uuid: 1ad4c7f0-4666-4cae-868a-63be6308923f
---

# 데이터베이스 구성

데모용으로 기본적으로 Liferay DXP/Portal은 임베디드 HSQL 데이터베이스를 사용하도록 구성되어 있습니다. 데모 목적 외에도 다음과 같이 완전한 기능을 갖춘 지원되는 RDBMS를 사용하는 것이 좋습니다.

* MariaDB
* MySQL
* Oracle
* PostgreSQL

```{note}
[Liferay DXP 호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360049238151)에는 지원되는 데이터베이스 및 버전이 나와 있습니다.
```

데이터베이스에 연결하려면 다음이 필요합니다.

* [데이터베이스 구성](#database-configuration)
* [JDBC 커넥터 설치](#install-a-jdbc-connector)
* [데이터 소스 구성](#configuring-a-data-source)

## 데이터베이스 구성

데이터베이스를 선택했으면 다음 단계에 따라 구성하십시오.

* [UTF-8을 지원하는 빈 데이터베이스 생성](#create-a-blank-database-with-utf-8-support)
* [데이터베이스 사용자 액세스 구성](#configure-database-user-access)
* [쿼리 결과 정렬 순서 구성(선택 사항)](#configure-the-query-result-sort-order-optional)

```{important}
데이터베이스를 수정하기 전에 항상 데이터베이스 공급업체의 설명서를 참조하십시오.
```

### UTF-8을 지원하는 빈 데이터베이스 생성

다국어 문자 세트는 UTF-8을 사용해야 합니다. UTF-8을 사용하는 데이터베이스를 만듭니다. 다음은 MySQL 명령 예입니다.

```sql
create database lportal character set utf8;
```

### 데이터베이스 사용자 액세스 구성

Liferay DXP는 데이터를 유지하기 위해 데이터베이스 사용자 자격 증명이 필요합니다. 가장 간단하고 쉬운 방법은 테이블 생성 및 삭제 권한을 포함하여 전체 데이터베이스 권한이 있는 데이터베이스 사용자를 통하는 것입니다. 이러한 사용자와 함께 DXP 플러그인은 데이터베이스와 원활하게 상호 작용하고 업그레이드 작업이 자동으로 수행됩니다. 이보다 더 많은 데이터베이스 사용자 권한을 제한하는 것은 권장되지 않습니다.

그러나 데이터베이스가 초기화된 후 조직에서 Liferay DXP 데이터베이스 사용자 권한을 제한해야 하는 경우 다음에 나오는 높은 보안 데이터베이스 사용자 사례를 참조하십시오.

#### 높은 보안 데이터베이스 사용자 관행

조직에는 데이터베이스가 초기화되면 Liferay DXP 데이터베이스 사용자 권한을 제한해야 하는 보다 엄격한 보안 정책이 있을 수 있습니다. 선택, 삽입, 업데이트 및 삭제 작업에 대한 권한만 사용자에게 허용되는 경우 데이터베이스를 수동으로 초기화하고 유지 관리해야 합니다. 이를 달성하기 위해 권장되는 사항은 다음과 같습니다.

1. Liferay DXP 데이터베이스 사용자에게 데이터베이스에 대한 모든 작업을 수행할 수 있는 전체 권한을 부여합니다.

1. Liferay DXP를 설치하고 시작하여 자동으로 데이터베이스를 채웁니다.

1. 데이터베이스가 Liferay DXP 테이블로 채워지면 Liferay DXP 데이터베이스 사용자로부터 선택, 삽입, 업데이트 및 삭제 작업을 수행할 수 있는 권한을 제외한 모든 권한을 제거하십시오.

```{warning}
일부 Liferay 이벤트는 이러한 높은 보안 단계와 호환되지 않는 데이터베이스 작업(예: 테이블 생성 및 삭제)을 유발합니다. 이러한 이벤트를 위해서는 Liferay 데이터베이스 사용자가 데이터베이스에 대한 전체 권한을 가지고 있어야 합니다.

| 이벤트 | 진행 방법 | 
| :---- | :---------- | 
| [개체 정의 게시](../../building-applications/objects/creating-and-managing-objects/creating-objects.md#publishing-object-drafts) | Liferay 데이터베이스 사용자에게 전체 데이터베이스 권한이 없으면 개체를 사용하지 마십시오. |
| 테이블을 생성하는 플러그인 배포 | 배포하기 전에 Liferay 데이터베이스 사용자에게 전체 권한을 부여한 다음 배포된 데이터베이스를 다시 보안하십시오. |
| 라이프레이 업그레이드 | 업그레이드하기 전에 Liferay 데이터베이스 사용자에게 전체 권한을 부여한 다음 업그레이드 후 데이터베이스를 다시 보호하십시오. |
```

### 쿼리 결과 정렬 순서 구성(선택 사항)

모든 데이터베이스에는 결과 정렬을 위한 기본 순서가 있습니다( [이 문서](https://help.liferay.com/hc/en-us/articles/360029315971-Sort-Order-Changed-with-a-Different-Database)참조). 이 순서가 우려되는 경우 데이터베이스 공급업체 설명서를 참조하여 정렬 순서를 알아보고 필요한 경우 Liferay DXP 엔터티에 대해 선호하는 기본 쿼리 결과 순서를 사용하도록 데이터베이스를 구성하십시오.

데이터베이스 서버, 데이터베이스 및 데이터베이스 사용자를 구성했습니다. Liferay DXP가 데이터베이스와 통신하는 데 사용하는 JDBC 커넥터를 설치할 준비가 되었습니다.

## JDBC 커넥터 설치

Liferay DXP는 데이터베이스와 통신하기 위해 JDBC 커넥터가 필요합니다.

### 오픈 소스 데이터베이스

Liferay DXP 번들에는 여러 오픈 소스 JDBC 커넥터가 포함되어 있습니다. 커넥터 파일은 일반적으로 애플리케이션 서버의 전역 폴더(예: Tomcat의 `/lib/ext` 또는 JBoss EAP 및 WildFly의 `/module` )에 제공 및 설치됩니다.

Oracle 또는 DB2와 같은 독점 데이터베이스에 연결하는 경우 공급업체에서 커넥터를 다운로드하여 애플리케이션 서버의 전역 폴더에 설치합니다.

**독점 데이터베이스:**

| 데이타베이스 | 커넥터           | 공급업체 사이트                                    | 주                                                                                                                                                     |
|:------ |:------------- |:------------------------------------------- |:----------------------------------------------------------------------------------------------------------------------------------------------------- |
| DB2    | `db2jcc4.jar` | [IBM](https://www.ibm.com/)                 | `dbc2jcc` 커넥터는 3.72 이후에 더 이상 사용되지 않습니다.                                                                                                               |
| Oracle | `ojdbc8.jar`  | [Oracle](https://www.oracle.com/index.html) | 최소한 Oracle 12.2.0.1.0 JDBC 4.2 버전이 있는 `ojdbc8.jar` 라이브러리는 CLOB 열에서 데이터를 읽는 것이 감지된 [데이터 잘림 문제](https://issues.liferay.com/browse/LPS-79229) 때문에 필요합니다. |

## 데이터 소스 구성

아래 표에 나열된 방법 중 하나를 사용하여 기본 제공 데이터 소스 연결로 DXP를 구성할 수 있습니다.

| 방법           | Docker 이미지와 함께 사용 가능 | 프로덕션에 권장됨 |
|:------------ |:-------------------- |:--------- |
| Docker 환경 변수 | 그렇다                  | 그렇다       |
| 문맥 재산        | 그렇다*                 | 그렇다       |
| 설정 마법사       | 부정                   | 부정        |

### 도커 환경 변수

DXP 환경 변수를 Docker 이미지에 전달하여 기본 제공 데이터 소스 연결을 구성할 수 있습니다. 예제는 [데이터베이스 템플릿](./database-templates.md) 참조하십시오.

### 문맥 재산

[포털 속성](./portal-properties.md) 파일을 사용하여 Liferay Tomcat 번들, 애플리케이션 서버 설치 또는 Docker 이미지에서 데이터 소스 연결을 구성할 수 있습니다. 예제는 [데이터베이스 템플릿](./database-templates.md) 참조하십시오.

```{note}
Docker 이미지와 함께 포털 속성 파일을 사용하려면 바인드 마운트 또는 볼륨을 사용하여 파일을 전달해야 합니다. 자세한 내용은 [컨테이너에 파일 제공](../installing-liferay/using-liferay-docker-images/providing-files-to-the-container.md)을 참조하세요.
```

### 설정 마법사

번들 또는 애플리케이션 서버에서 비생산적인 목적으로 DXP를 실행하는 경우 설정 마법사를 사용하여 [DXP 시작](../installing-liferay/running-liferay-for-the-first-time.md) 중에 데이터 소스 연결을 구성할 수 있습니다.

![설정 마법사의 데이터베이스 섹션에서 DXP의 내장 데이터 소스를 구성할 수 있습니다.](./database-configurations/images/01.png)

```{note}
애플리케이션 서버에서 관리되는 데이터 소스를 사용하는 경우 애플리케이션 서버에 대한 지침을 참조하십시오. [Tomcat](../installing-liferay/installing-liferay-on-an-application-server/installing-on-tomcat.md ), [WildFly](../installing-liferay/installing-liferay-on-an-application-server/installing-on-wildfly.md), [JBoss EAP](../installing-liferay/installing-liferay-on- an-application-server/installing-on-jboss-eap.md), [WebLogic](../installing-liferay/installing-liferay-on-an-application-server/installing-on-weblogic.md), 또는 [WebSphere]( ../installing-liferay/installing-liferay-on-an-application-server/installing-on-websphere.md).
```
