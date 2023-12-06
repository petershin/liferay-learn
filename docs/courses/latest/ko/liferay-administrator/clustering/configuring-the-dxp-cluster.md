# DXP 클러스터 구성

두 개의 Docker 컨테이너를 실행하여 간단한 클러스터 환경을 시연할 수 있습니다. 자세한 내용은 고가용성을 위한 클러스터링 [고가용성을 위한 클러스터링](https://learn.liferay.com/web/guest/w/dxp/installation-and-upgrades/setting-up-liferay/clustering-for-high-availability) 참조하세요.

## 각 노드에 대해 Elasticsearch 구성

1. Elasticsearch의 데이터 볼륨을 설정한 동일한 로컬 폴더(예: `[your_folder]`)로 다시 이동합니다. 두 개의 새 폴더를 만듭니다.

   ```bash
   mkdir -p liferay-1/files/osgi/configs liferay-2/files/osgi/configs
   ```

1. `liferay-1` 노드에 대한 구성 파일을 생성합니다.

   ```bash
   cat <<EOT >> liferay-1/files/osgi/configs/com.liferay.portal.search.elasticsearch6.configuration.ElasticsearchConfiguration.config
   operationMode="REMOTE"
   transportAddresses="elasticsearch:9300"
   clusterName="LiferayElasticsearchCluster"
   EOT
   ```

1. `liferay-2` 노드에 대한 구성 파일을 생성합니다.

   ```bash
   cat <<EOT >> liferay-2/files/osgi/configs/com.liferay.portal.search.elasticsearch6.configuration.ElasticsearchConfiguration.config
   operationMode="REMOTE"
   transportAddresses="elasticsearch:9300"
   clusterName="LiferayElasticsearchCluster"
   EOT
   ```

## 각 클러스터 노드 배포

1. `elasticsearch` 및 `some-mariadb` 컨테이너의 IP 주소를 찾습니다.

   ```bash
   docker network inspect bridge
   ```

   아래의 `[IP 주소]` `elasticsearch` 및 `some-mariadb`의 해당 IP 주소로 바꿉니다.

1. 첫 번째 Liferay 노드를 시작합니다.

   ```bash
   docker run -it \
      --add-host elasticsearch:[IP address] \
      --add-host some-mariadb:[IP address] \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_JNDI_PERIOD_NAME="" \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_DRIVER_UPPERCASEC_LASS_UPPERCASEN_AME=org.mariadb.jdbc.Driver \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_URL="jdbc:mariadb://some-mariadb:3306/dxp_db?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false" \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_USERNAME=root \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_PASSWORD=my-secret-pw \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_ENABLED=true \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME_PERIOD_CONTROL=control-channel-logic-name-1 \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME_PERIOD_TRANSPORT_PERIOD_NUMBER0=transport-channel-logic-name-1 \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_AUTODETECT_PERIOD_ADDRESS=some-mariadb:3306 \
      -e LIFERAY_WEB_PERIOD_SERVER_PERIOD_DISPLAY_PERIOD_NODE=true \
      -e LIFERAY_DL_PERIOD_STORE_PERIOD_IMPL=com.liferay.portal.store.db.DBStore \
      --name liferay-1 \
      -p 11311:11311 \
      -p 8009:8009 \
      -p 8080:8080 \
      -v $(pwd)/liferay-1:/mnt/liferay \
      liferay/portal:latest
   ```

1. 두 번째 Liferay 노드를 시작합니다.

   ```bash
   docker run -it \
      --add-host elasticsearch:[IP address] \
      --add-host some-mariadb:[IP address] \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_JNDI_PERIOD_NAME="" \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_DRIVER_UPPERCASEC_LASS_UPPERCASEN_AME=org.mariadb.jdbc.Driver \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_URL="jdbc:mariadb://some-mariadb:3306/dxp_db?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false" \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_USERNAME=root \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_PASSWORD=my-secret-pw \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_ENABLED=true \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME_PERIOD_CONTROL=control-channel-logic-name-2 \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME_PERIOD_TRANSPORT_PERIOD_NUMBER0=transport-channel-logic-name-2 \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_AUTODETECT_PERIOD_ADDRESS=some-mariadb:3306 \
      -e LIFERAY_WEB_PERIOD_SERVER_PERIOD_DISPLAY_PERIOD_NODE=true \
      -e LIFERAY_DL_PERIOD_STORE_PERIOD_IMPL=com.liferay.portal.store.db.DBStore \
      --name liferay-2 \
      -p 11312:11311 \
      -p 9009:8009 \
      -p 9080:8080 \
      -v $(pwd)/liferay-2:/mnt/liferay \
      liferay/portal:latest
   ```

1. 이제 각 노드를 방문할 수 있습니다. `Liferay-1` `http://localhost:8080`에서 사용할 수 있습니다. 그리고 `Liferay-2` `http://localhost:9080`에서 사용 가능합니다.

   ![두 노드는 로컬로 액세스할 수 있습니다.](./configuring-the-dxp-cluster/images/01.png)

```{note}
두 개의 Liferay Docker 노드를 실행하려면 기본 CPU 및 메모리 리소스 설정을 늘려야 할 수 있습니다.
```

## 클러스터 테스트

클러스터에서는 콘텐츠가 한 노드에서 생성되거나 수정되므로 다른 노드에서도 사용할 수 있어야 합니다. 이를 실제로 확인하려면 간단한 블로그 게시물을 작성하세요.

1. `Liferay-1` 노드(예: `http://localhost:8080`)에서 **제품 메뉴**(![Product Menu](../../images/icon-product-menu.png))를 엽니다. **콘텐츠 & 데이터** 아래에서 **블로그** 을 클릭하세요.

1. **추가**(![아이콘 추가](../../images/icon-add.png))를 클릭하세요.

1. 다음 항목을 추가합니다.

   * 제목: 푸
   * 내용: 바

**저장** 클릭하세요.

1. `Liferay-2` 노드(예: `http://localhost:9080`)로 전환합니다. **제품 메뉴**(![Product Menu](../../images/icon-product-menu.png))을 엽니다. **콘텐츠 & 데이터** 아래에서 **블로그** 을 클릭하세요.

1. `Liferay-1` 노드에서 생성된 블로그 항목은 `Liferay-2` 노드에서 볼 수 있습니다.

   ![다른 노드에서 생성된 블로그 항목이 표시됩니다.](./configuring-the-dxp-cluster/images/02.png)

이제 Liferay 환경이 클러스터된 환경으로 구성되었습니다. 다음 단계인 노드 로드 밸런싱은 Liferay 외부에서 구성되므로 이 과정의 범위를 벗어납니다. 클러스터링에 대한 이 모듈을 완료했습니다.

## 관련 개념

* [클러스터된 설치 유지 관리](https://learn.liferay.com/en/w/dxp/installation-and-upgrades/maintaining-a-liferay-installation/maintaining-clustered-installations)
