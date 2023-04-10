# 업그레이드를 위한 데이터베이스 튜닝

업그레이드를 수행하면 프로덕션 환경에서 매일 실행하는 것과는 다르게 데이터베이스에 영향을 미칩니다. 이 때문에 업그레이드 프로세스를 실행하기 전에 데이터베이스를 조정하고 업그레이드가 완료된 후 프로덕션 설정을 다시 적용해야 합니다.

```{note}
이 기사에 제공된 팁은 각 데이터베이스의 특정 버전에서 테스트 실행 시 잘 작동했습니다. 최적의 조정은 자체 데이터, 인프라 조건 및 데이터베이스 공급업체에 따라 다릅니다. 데이터를 분석하고, 업그레이드를 위해 조정하고, 테스트 업그레이드 시간을 정하여 Liferay DXP 데이터 업그레이드를 위한 최상의 데이터베이스 및 Java 프로세스 구성을 결정하십시오.
```

프로덕션에서보다 데이터 업그레이드 중에 더 많은 업데이트 문이 실행됩니다. 따라서 다음은 데이터베이스 업그레이드를 위해 데이터베이스를 조정하는 몇 가지 방법입니다.

* 성능에 영향을 미치는 데이터 무결성 측정을 비활성화합니다. 장애가 발생하면 백업으로 복원하십시오.

* 트랜잭션 로깅은 데이터 업그레이드에 중요하지 않으므로 비활성화하거나 최소화합니다.

* 커밋 관련 트랜잭션 I/O 작업을 비동기화합니다.

* 커밋을 디스크에 플러시하는 간격을 늘립니다.

```{warning}
일부 데이터베이스 속성 및 구성은 전역적이며 동일한 데이터베이스의 스키마에 영향을 미칩니다.
```

아래 섹션은 위에서 언급한 방식으로 각 데이터베이스를 조정하는 방법에 대한 공급업체별 정보로 연결됩니다.

## IBM DB2

[IBM의 공식 DB2 문서를 참조하십시오](https://www.ibm.com/support/pages/db2-database-product-documentation-4) .

## MariaDB

InnoDB 이중 쓰기를 끄고 트랜잭션 커밋 시 InnoDB 플러시 로그를 `0`로 설정합니다.

## 마이크로소프트 SQL 서버

[트랜잭션 내구성](https://docs.microsoft.com/en-us/sql/relational-databases/logs/control-transaction-durability) 을 `FORCED`으로 설정합니다.

## MySQL

[InnoDB 이중 쓰기](https://dev.mysql.com/doc/refman/5.7/en/innodb-parameters.html#sysvar_innodb_doublewrite) 를 끄고 [트랜잭션 커밋 시 InnoDB 플러시 로그](https://dev.mysql.com/doc/refman/5.7/en/innodb-parameters.html#sysvar_innodb_flush_log_at_trx_commit) 을 `0`으로 변경합니다.

## 오라클 데이터베이스

기본 구성이 잘 작동합니다. [디스크에 대한 비동기 I/O](https://docs.oracle.com/database/121/REFRN/GUID-FD8D1BD2-0F85-4844-ABE7-57B4F77D1608.htm#REFRN10048) 를 자동으로 구성합니다.

## PostgreSQL

[동기 커밋](https://www.postgresql.org/docs/10/wal-async-commit.html) 을 끄고 [미리 쓰기 로그 기록기 지연](https://www.postgresql.org/docs/10/wal-async-commit.html) 을 `1000` 밀리초로 설정합니다.

## 결론

업그레이드가 끝나면 데이터베이스 구성을 프로덕션 설정으로 되돌려야 합니다.
