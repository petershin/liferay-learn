# MySQL 클라이언트 사용

애플리케이션의 문제를 해결하거나 사용자 지정 개발을 수행하려면 때때로 데이터베이스의 데이터를 확인해야 합니다. 데이터베이스에 액세스하려면 내장 MySQL 클라이언트를 사용하여 데이터베이스와 직접 인터페이스해야 합니다. 이 기능은 최신 버전의 Liferay Cloud에서 사용할 수 있으며 몇 가지 간단한 단계를 거쳐 액세스할 수 있습니다.

```{note}
*Admin* 및 *Contributor* 권한이 있는 Liferay Cloud 사용자만 MySQL 클라이언트를 사용할 수 있습니다.
```

## 전제 조건

Liferay 서비스를 통해 MySQL 클라이언트를 사용하려면 먼저 지원되는 다음 이미지 버전 이상으로 서비스를 업그레이드해야 합니다.

| **서비스** | **지원되는 최소 이미지 버전** |
|:--------------- |:----------------------------------------------- |
| **데이타베이스** | 라이프레이클라우드/데이터베이스:3.2.8                          |
| **DXP(7.0 사용)** | liferaycloud/liferay-dxp:7.0.10-ga1-fp90-3.0.19 |
| **DXP(7.1 사용)** | liferaycloud/liferay-dxp-7.1.10-ga1-fp17-3.0.19 |
| **DXP(7.2 사용)** | liferaycloud/liferay-dxp-7.2.10-sp1-fp4-3.0.19  |

```{warning}
데이터베이스 이미지를 MySQL 클라이언트를 지원하는 버전으로 업그레이드하면 데이터베이스의 읽기 전용 사용자가 초기화됩니다. 업그레이드하기 전에 이 사용자의 암호를 설정하지 않으면 기본값이 사용되며 나중에 변경할 수 없습니다. 자세한 내용은 [읽기 전용 데이터베이스 비밀번호 변경](#change-the-read-only-database-password) 을 참조하세요.
```

## MySQL 클라이언트에 액세스

1. Liferay 클라우드 콘솔에 로그인합니다.

1. 올바른 환경으로 이동하고 **서비스** 을 클릭합니다.

   ![환경에 대한 모든 서비스를 보려면 서비스로 이동하십시오.](./using-the-mysql-client/images/01.png)

1. **liferay** 서비스를 클릭합니다.

1. **Shell** 탭을 클릭합니다.

    ![셸 탭을 클릭하여 MySQL 클라이언트를 사용할 수 있는 셸에 액세스합니다.](./using-the-mysql-client/images/03.png)

1. 이 화면의 셸에 `mysql` 을 입력합니다. 이렇게 하면 모든 읽기 전용 쿼리를 수행할 수 있는 MySQL 클라이언트에 로그인됩니다. 예를 들어 `show tables를 실행하면 모든 테이블을 볼 수 있습니다.`.

    ![mysql 명령 실행 및 테이블 표시 명령](./using-the-mysql-client/images/04.png)

사용 가능한 모든 명령을 보려면 공식 [MySQL 클라이언트 설명서](https://dev.mysql.com/doc/refman/8.0/en/mysql-commands.html) 을 참조하십시오.

### 읽기 및 쓰기 권한으로 로그인

기본 사용자는 데이터베이스에서 읽기 쿼리만 수행할 수 있으며 데이터를 조작할 수 없습니다. 이렇게 하면 서비스 데이터를 손상시킬 수 있는 우발적인 수정을 방지할 수 있습니다.

그러나 데이터베이스의 데이터를 조작할 수 있는 것이 **중요** 인 경우 `mysql`만 입력하는 대신 다음 명령을 셸에 입력하여 데이터베이스 자격 증명을 사용하여 로그인할 수 있습니다.

```bash
mysql -u ${LCP_SECRET_DATABASE_USER} -p${LCP_SECRET_DATABASE_PASSWORD}
```

데이터베이스 이름, 사용자 이름 및 비밀번호는 `데이터베이스` 서비스의 [secrets](..//tuning-security-settings/managing-secure-environment-variables-with-secrets.md#viewing-and-modifying-an-existing-secret) 에서 찾을 수 있습니다.

### 읽기 전용 데이터베이스 암호 변경

지원되는 버전에 데이터베이스 서비스를 아직 배포하지 않은 경우 데이터베이스 서비스의 `LCP.json`에서 `LCP_DATABASE_READONLY_USER_PASSWORD` 환경 변수를 설정하여 기본 사용자에 대한 고유 암호를 설정할 수 있습니다.

```{important}
MySQL 클라이언트를 지원하는 버전을 사용하여 데이터베이스 서비스를 이미 배포한 경우 기본 사용자는 이미 기본 암호로 초기화됩니다. 이 암호는 나중에 변경할 수 없으므로 데이터베이스 서비스를 배포하기 전에(처음으로 또는 위보다 이전 이미지 버전에서 업데이트) `LCP_DATABASE_READONLY_USER_PASSWORD` 환경 변수만 추가할 수 있습니다. 그렇지 않으면 생성된 기본 암호를 사용해야 합니다.
```

그런 다음 적절한 Docker 이미지 버전(또는 최신 버전)으로 업데이트하고 MySQL 클라이언트를 사용할 수 있도록 서비스 [을 다시 배포](../updating-services-in-liferay-paas/deploying-changes-via-the-liferay-cloud-console.md).

기본 사용자의 암호를 `LCP_DATABASE_READONLY_USER_PASSWORD`로 설정한 경우 동일한 환경 변수를 `liferay` 서비스에 추가합니다. 그렇지 않으면 서비스가 기본 암호를 사용하도록 이 변수를 추가하지 마십시오.

**환경 변수** 탭 내에서 이 변수를 추가할 수 있습니다.

![필요한 경우 환경 변수 탭을 클릭하여 비밀번호를 구성하십시오.](./using-the-mysql-client/images/02.png)

## 관련 정보

* [데이터베이스 서비스](../platform-services/database-service/database-service.md)
