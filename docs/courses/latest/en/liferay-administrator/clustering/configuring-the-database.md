---
toc:
uuid: 134cc9ab-cbad-40b2-b44b-b085708bf0f8
---
# Configuring the Database

Liferay supports many of the popular database software. Note, a Liferay bundle uses an embedded HSQL database by default but we recommend using a full-featured database for your production environment. See [configuring a database](https://learn.liferay.com/w/dxp/installation-and-upgrades/installing-liferay/configuring-a-database) to learn more.

## Setup a Docker Network

First create a docker network for the different containers to be able to connect to each other.

1. Open terminal and run the following command:

   ```bash
   docker network create lr-network --subnet=172.30.30.0/24 --ip-range=172.30.30.128/25 --gateway=172.30.30.1
   ```

1. Verify that `lr-network` was created:

   ```bash
   docker network ls
   ```

## Running MySQL in Docker

1. Create the following folder for the different configuration files to reside:

   `~/liferay-services/database`

1. Inside the folder, create the following `docker-compose.yml` file. 

   ```yaml
   services:
     mysql:
      image: mysql:8.0
      container_name: lr-mysql
      command: --default-authentication-plugin=mysql_native_password --character-set-server=utf8 --collation-server=utf8_general_ci --lower_case_table_names=1
      restart: always
      environment:
         MYSQL_DATABASE: lportal
         MYSQL_ROOT_PASSWORD: test
      hostname: lr-mysql
      networks:
         - lr-network
      ports:
         - 127.0.0.1:3306:3306
      volumes:
         - ./container_files/mysql:/var/lib/mysql
      ulimits:
         nproc: 65535
         nofile:
         soft: 20000
         hard: 40000
      healthcheck:
         test: mysql -h localhost -uroot -p$$MYSQL_ROOT_PASSWORD --protocol tcp -e 'select 1' 2>&1 | grep -qvF "Can't connect"
         interval: 5s
         retries: 10
         start_period: 5s
   networks:
      lr-network:
      external: true
   ```

1. Navigate to this folder in terminal. Run the following command:

   ```bash
   docker compose up -d
   ```

1. Verify that MySQL is running by accessing the container. Run the following command:

   ```bash
   docker exec -it lr-mysql bash -c "/usr/bin/mysql -uroot -ptest"
   ```

1. In the MySQL terminal, run the following command:

   ```bash
   show databases;
   ```

   A list of databases should be listed including the `lportal` database that will be used in the next step.

Next, we will [configure Elasticsearch](./configuring-search.md)

## Relevant Concepts

- [Configuring a Database](https://learn.liferay.com/w/dxp/installation-and-upgrades/installing-liferay/configuring-a-database)
