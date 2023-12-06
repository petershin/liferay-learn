# 사용자 정의 데이터 스키마 정의

티켓팅 애플리케이션에는 사용자 정의 데이터 필드와 선택 항목이 필요합니다. Liferay [객체](../../../building-applications/objects.md) 및 [선택목록](../../../building-applications/objects/picklists.md) 을 사용하여 사용자 정의 데이터 스키마를 정의합니다.

## 사용자 정의 선택 목록 만들기

선택 목록은 사용자가 선택할 수 있는 미리 결정된 값 목록입니다. 티켓 상태, 티켓 유형, 티켓 우선순위 등의 사용자 정의 필드에는 선택 목록이 필요합니다.

### 사용자 정의 선택 목록 배포

다음 명령을 사용하여 `liferay-ticket-batch-list-type-definition` 클라이언트 확장을 배포합니다.

```bash
./gradlew :client-extensions:liferay-ticket-batch-list-type-definition:deploy
```

**제어판 &rarr;** 선택 목록_으로 이동합니다. 5개의 새로운 선택 목록이 생성되었는지 확인하세요.

![Five new picklists have been created.](./defining-a-custom-data-schema/images/01.png)

### 사용자 정의 선택 목록 코드 검사

각 클라이언트 확장 프로젝트는 `client-extension.yaml` 파일에 의해 정의됩니다. 첫 번째 섹션에서는 배포 가능한 `.zip` 파일에 포함된 파일을 지정하는 `assemble` 블록을 정의합니다. 이 클라이언트 확장의 `assemble` 블록은 다음과 같습니다:

```yaml
assemble:
    - from: batch
      into: batch
```

자세한 내용은 [클라이언트 확장 조립](../../../building-applications/client-extensions/working-with-client-extensions.md#assembling-client-extensions) 을 참조하세요.

이 `list-type-batch` 클라이언트 확장은 [배치 유형](../../../building-applications/client-extensions/batch-client-extensions.md) 클라이언트 확장입니다. 이는 다음과 같이 정의됩니다:

```yaml
liferay-ticket-batch-list-type-definition:
    name: Liferay Ticket Batch List Type Definition
    oAuthApplicationHeadlessServer: liferay-ticket-batch-list-type-definition-oauth-application-headless-server
    type: batch
```

각 속성에 대한 설명은 [Batch YAML 구성 참조](../../../building-applications/client-extensions/batch-client-extensions/batch-yaml-configuration-reference.md)를 참조하세요.

클라이언트 확장은 [배치 엔진 헤드리스 API](../../../headless-delivery/소비-apis/batch-engine-api-basics-importing-data.md) 및 [picklists headless API](../../../building-applications/objects/picklists/picklists-api-basics.md). 보안 API 요청을 수행하기 위해 클라이언트 확장은 OAuth2 인증을 사용하도록 구성됩니다. 이는 다음과 같이 정의됩니다:

```yaml
liferay-ticket-batch-list-type-definition-oauth-application-headless-server:
    .serviceAddress: localhost:8080
    .serviceScheme: http
    name: Liferay Ticket Batch List Type Definition OAuth Application Headless Server
    scopes:
        - Liferay.Headless.Admin.List.Type.everything
        - Liferay.Headless.Batch.Engine.everything
    type: oAuthApplicationHeadlessServer
```

'Liferay.Headless.Admin.List.Type' 리소스 및 'Liferay.Headless.Batch.Engine' 리소스에는 전체 CRUD 액세스 권한이 부여됩니다.

[`client-extension.yaml`](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-ticket-workspace/client-extensions/liferay-ticket-batch-list-type 참조) -definition/client-extension.yaml) 전체 정의를 확인하세요.

5개의 선택 목록과 해당 선택 항목은 클라이언트 확장의 `/batch/` 폴더에 있는 JSON 파일에 정의되어 있습니다. [`list-type-definition.batch-engine-data.json`](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-ticket-workspace/client-extensions/) 을 참조하세요. 전체 정의는 liferay-ticket-batch-list-type-definition/batch/list-type-definition.batch-engine-data.json) 파일을 참조하세요.

## 사용자 정의 개체 만들기

선택 목록이 정의되면 응용 프로그램의 사용자 정의 개체를 만들 수 있습니다.

### 사용자 정의 개체 배포

다음 명령을 사용하여 `liferay-ticket-batch-object-definition` 클라이언트 확장을 배포합니다.

```bash
./gradlew :client-extensions:liferay-ticket-batch-object-definition:deploy
```

Liferay에서 **Control Panel** &rarr; **Objects** 로 이동합니다. 새 티켓 개체가 생성되었는지 확인하세요.

![A new ticket object has been created.](./defining-a-custom-data-schema/images/02.png)

### 사용자 정의 개체 코드 검사

이 `liferay-ticket-batch-object-definition` 클라이언트 확장은 [배치 유형](../../../building-applications/client-extensions/batch-client-extensions.md) 클라이언트 확장이기도 합니다. 클라이언트 확장의 YAML 파일은
`liferay-ticket-batch-list-type-definition` 클라이언트 확장과 동일한 방식으로 정의됩니다. 각 속성에 대한 설명은 [배치 YAML 구성 참조](../../../building-applications/client-extensions/batch-client-extensions/batch-yaml-configuration-reference.md)를 참조하세요.

자세한 내용은 [client-extension.yaml](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-ticket-workspace/client-extensions/liferay-ticket-batch-object-definition/client-extension.yaml) 을 참조하세요. 전체 정의.

사용자 지정 티켓 개체는 클라이언트 확장 프로그램의 `/batch/` 폴더에 있는 JSON 파일에 정의되어 있습니다. [`object-definition.batch-engine-data.json`](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-ticket-workspace/client-extensions/liferay-) 을 참조하세요. 전체 정의를 위한 ticket-batch-object-definition/batch/object-definition.batch-engine-data.json) 파일입니다.

## API를 통해 티켓 데이터 생성

사용자 정의 티켓 개체가 완료되면 Liferay 내에서 새 티켓 항목을 생성할 수 있습니다. 객체의 REST API를 사용하여 가져올 수도 있습니다.

티켓 항목을 생성하려면 아래 명령을 실행하세요.

```bash
./gradlew :client-extensions:liferay-ticket-batch-object-entry:deploy
```

Liferay에서 **Control Panel** &rarr; **Tickets** 로 이동합니다. 새 티켓 항목이 생성되었는지 확인하세요.

![A new ticket entry has been created.](./defining-a-custom-data-schema/images/03.png)

다음: 티켓팅 시스템에 [맞춤 테마 적용](./applying-a-custom-theme.md)

## 관련 개념

* [객체 생성 및 관리](../../../building-applications/objects/creating-and-managing-objects.md)
* [선택 목록 만들기](../../../building-applications/objects/picklists/creating-picklists.md)
* [일괄 클라이언트 확장](../../../building-applications/client-extensions/batch-client-extensions.md)
