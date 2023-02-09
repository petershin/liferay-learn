# 새 Docker 이미지로 업그레이드

새로운 Liferay 버전이 Docker 이미지로 출시되면 이를 업그레이드할 수 있습니다. [업그레이드 기본 사항](../../upgrading-liferay/upgrade-basics.md) 은 프로세스를 설명합니다.

```{important}
**항상** 업그레이드하기 전에 데이터와 설치를 [백업](../../maintaining-a-liferay-installation/backing-up.md)하십시오. 백업 복사본에서 업그레이드 프로세스를 테스트하는 것이 좋습니다.
```

업그레이드에는 구성, Marketplace 애플리케이션 및 사용자 정의 코드 업데이트가 포함됩니다. 아마도 업그레이드의 가장 큰 부분은 Liferay 데이터베이스를 업그레이드하는 것일 것입니다. 데이터베이스를 업그레이드하는 방법에는 두 가지가 있습니다.

* [Liferay 시작 시 Docker 이미지에서 자동 업그레이드 사용](../../upgrading-liferay/upgrade-basics/upgrading-via-docker.md): 자동 업그레이드가 활성화된 새 Liferay Docker 이미지를 실행하면 Liferay 시작 시 데이터베이스가 업그레이드됩니다. 업그레이드가 완료되면 Docker 컨테이너를 통해 Liferay를 계속 사용할 수 있습니다. 단순하고 작은 데이터 세트가 있는 포털 환경은 이 방법으로 업그레이드할 수 있습니다.

* [데이터베이스 업그레이드 도구 사용](../../upgrading-liferay/upgrade-basics/using-the-database-upgrade-tool.md): 데이터베이스 업그레이드 도구를 사용하여 데이터베이스를 업그레이드하는 것은 컨테이너화되지 않은 Liferay 설치에서 수행되어야 합니다. 업그레이드가 완료되면 새 Liferay Docker 컨테이너를 가리킬 수 있습니다. 복잡하거나 더 큰 데이터 세트가 있거나 많은 사용자 정의가 있는 DXP 환경 및 포털 환경은 Database Upgrade Tool을 사용하여 업그레이드해야 합니다.

## 다음

[업그레이드 기본 사항](../../upgrading-liferay/upgrade-basics.md)을 읽고 시작하십시오. 그런 다음 새 컨테이너에서 자동 업그레이드를 사용하는 데 관심이 있는 경우 [Docker](../../upgrading-liferay/upgrade-basics/upgrading-via-docker.md)을 통한 업그레이드를 참조하십시오. 사용자 환경에서 데이터베이스 업그레이드 도구를 사용해야 하는 경우 [데이터베이스 업그레이드 도구 사용](../../upgrading-liferay/upgrade-basics/using-the-database-upgrade-tool.md)을 참조하십시오.