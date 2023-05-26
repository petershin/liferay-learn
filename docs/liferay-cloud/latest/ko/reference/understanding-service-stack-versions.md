# 서비스 스택 버전 이해

Liferay Cloud 서비스 스택은 Liferay Cloud 환경에 있는 모든 서비스의 주요 버전을 나타냅니다. 각 개별 서비스는 다른 마이너 버전을 가질 수 있지만 모두 서비스 스택 버전(예: 버전 4.xx)을 공유합니다. 새 서비스 스택 버전은 일반적으로 다양한 새 기능을 도입합니다(예: 기본 Jenkinsfile 추가 및 [버전 4.xx](./liferay-cloud-project-changes-in-version-4.md)의 새 리포지토리 구조).

Liferay Cloud 서비스 스택 자체의 버전은 서비스 Docker 이미지의 주 버전으로 표시됩니다. 이 버전은 Docker 이미지 이름에 나타나는 마지막 숫자입니다.

예를 들어 `liferay` 서비스에 대한 이 Docker 이미지 이름을 참조하십시오.

```
liferaycloud/liferay-dxp:7.2.10-sp1-fp4-3.0.21
```

이 이미지의 버전은 `3.0.21`입니다. 이는 이 환경의 서비스 스택이 버전 3.xx임을 나타냅니다.

모든 Liferay Cloud 환경은 서비스의 Docker 이미지 버전을 다양한 사이트에 표시합니다. 환경의 **개요** 또는 **서비스** 페이지 또는 각 개별 서비스의 페이지를 포함하여 이러한 사이트 중 하나에서 표시된 이미지 이름 끝에 있는 번호를 검사하여 환경의 서비스 스택 버전을 확인할 수 있습니다.

![환경으로 이동한 후 표시되는 첫 번째 페이지는 서비스 버전을 보여주는 페이지입니다.](./understanding-service-stack-versions/images/01.png)

## 리포지토리에서 서비스 스택 버전 확인

Docker 이미지 버전은 서비스 스택이 4.xx로 업그레이드되었는지 여부에 따라 다른 사이트에 정의됩니다. 이 때문에 각 버전마다 다른 사이트를 확인해야 합니다. 4.xx로 업그레이드하기 전과 후의 차이점에 대한 자세한 내용은 [버전 4](./liferay-cloud-project-changes-in-version-4.md)의 Liferay Cloud 프로젝트 변경 사항을 참조하십시오.

### 4.xx로 업그레이드하기 전에 확인

리포지토리 버전이 3.xx 이하인 경우 리포지토리 루트에 각 서비스의 버전을 정의하는 `gradle.properties` 문서가 있습니다. 이 파일을 열고 다음 속성을 식별하여 Docker 이미지의 버전을 식별합니다.

```properties
liferay.workspace.lcp.backup.image=liferaycloud/backup:3.2.1
liferay.workspace.lcp.database.image=liferaycloud/database:3.2.1
liferay.workspace.lcp.search.image=liferaycloud/elasticsearch:6.1.4-3.0.3
liferay.workspace.lcp.liferay.image=liferaycloud/liferay-dxp:7.2.10-ga1-3.0.10
liferay.workspace.lcp.webserver.image=liferaycloud/nginx:1.14.2-3.1.1
liferay.workspace.lcp.jenkins.image=liferaycloud/jenkins:2.176.1-3.1.1
```

위의 예에서 각 서비스의 이름은 `3.xx`로 끝납니다. 이는 서비스 스택이 버전 3.xx임을 나타냅니다.

### 4.xx로 업그레이드 후 확인

리포지토리가 버전 4.xx로 업그레이드된 경우 각 서비스의 버전은 대신 각 서비스의 `LCP.json` 파일 내 `이미지` 속성에 정의됩니다. 이러한 각 파일은 서비스 이름을 딴 폴더에 포함되어 있습니다.

예를 들어 `데이터베이스` 서비스에 대한 `LCP.json` 파일의 이 섹션을 참조하세요.

```json
{
   "kind": "Deployment",
   "id": "database",
   "image": "liferaycloud/database:4.0.0",
}
```

이 예에서 `이미지` 속성의 값은 `4.0.0`으로 끝나는 이름을 가지며 이는 서비스 스택이 버전 4.xx임을 나타냅니다.

```{tip}
최신 개선 사항에 액세스하려면 서비스 스택을 버전 `4.xx`로 업그레이드하는 것이 좋습니다. 업그레이드 수행 단계는 [Liferay Cloud Stack 업그레이드](./upgrading-your-liferay-cloud-stack.md)_를 참조하십시오.
```

## 관련 주제

* [버전 4의 Liferay Cloud 프로젝트 변경 사항](./liferay-cloud-project-changes-in-version-4.md)
* [Liferay 클라우드 스택 업그레이드](./upgrading-your-liferay-cloud-stack.md)
