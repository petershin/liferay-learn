# 데이터베이스 구성

Liferay는 MySQL, MariaDB 또는 PostgreSQL과 같은 많은 데이터베이스를 지원합니다. 기본적으로 Liferay 번들은 데모 목적에 적합한 내장형 HSQL 데이터베이스를 사용합니다. 프로덕션 용도로 사용하려면 별도의 데이터베이스를 사용해야 합니다. 자세한 내용은 [데이터베이스 구성](https://learn.liferay.com/w/dxp/installation-and-upgrades/installing-liferay/configuring-a-database) 참조하세요.

## Docker에서 MariaDB 실행

1. MariaDB 이미지를 자동으로 다운로드하고 실행하려면 다음 명령을 실행하세요.

   ```bash
   docker run --name some-mariadb -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mariadb:10.7
   ```

1. 데이터베이스 서버에 로그인합니다.

   ```bash
   docker exec -it some-mariadb bash -c "/usr/bin/mysql -uroot -pmy-secret-pw"
   ```

1. 클러스터에서 사용할 데이터베이스를 만듭니다.

   ```bash
   create database dxp_db character set utf8;
   ```

1. 다음 명령을 사용하여 데이터베이스 생성을 확인합니다.

   ```bash
   show databases;
   ```

   `dxp_db` 데이터베이스를 포함하여 데이터베이스 목록이 나타납니다.

다음으로 [Elasticsearch를 구성](./configuring-search.md)합니다.

## 관련 개념

- [데이터베이스 구성](https://learn.liferay.com/w/dxp/installation-and-upgrades/installing-liferay/configuring-a-database)
- [클러스터 노드에 대한 데이터베이스 구성](https://learn.liferay.com/w/dxp/installation-and-upgrades/setting-up-liferay/clustering-for-high-availability/database-configuration-for-cluster-nodes)
