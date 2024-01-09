# Gogo Shell을 사용하여 모듈 업그레이드

특정 모듈의 업그레이드 문제를 해결하려면 일괄적으로가 아니라 모듈별로 업그레이드를 테스트하고 수행해야 할 수 있습니다. Liferay에는 개별 모듈을 업그레이드하고 확인하기 위한 Gogo 셸 명령이 있습니다.

예를 들어, 모듈은 새로운 [데이터 스키마 마이크로 버전](https://help.liferay.com/hc/ko/articles/360030959231-Meaningful-Schema-Versioning) 을 가질 수 있습니다. 새 마이크로 버전일 뿐이므로 모듈 데이터를 새 스키마로 업그레이드하는 것은 선택 사항입니다. 새 모듈 버전을 배포하면 활성화되지만 해당 데이터는 업그레이드되지 않습니다. 모듈을 새 데이터 스키마로 업그레이드하려는 경우 Gogo Shell에서 `업그레이드` 명령을 사용할 수 있습니다.

그러나 데이터를 업그레이드하지 않고 새로운 [데이터 스키마 마이너/메이저 버전](https://help.liferay.com/hc/ko/articles/360030959231-Meaningful-Schema-Versioning) 이 있는 모듈을 배포하면 모듈이 비활성화됩니다. 새 모듈 버전을 활성화하려면 모듈의 데이터를 새 데이터 스키마로 업그레이드해야 합니다.

모듈 업그레이드 주제는 다음과 같습니다.

* [Gogo 셸 명령 사용법](#command-usage)
* [업그레이드 준비가 된 모듈 나열](#listing-module-ready-for-upgrade)
* [모듈 종속성 문제 해결](#troubleshooting-module-dependencies)
* [모듈 업그레이드 실행](#executing-module-upgrades)
* [업그레이드 상태 확인](#checking-upgrade-status)
* [확인 프로세스 실행](#executing-verify-processes)

## 명령 사용법

[Gogo Shell 포틀릿](../../../liferay-internals/fundamentals/using-the-gogo-shell.md) 을 사용하여 모듈 업그레이드 및 확인 명령을 실행합니다.

명령은 다음과 같습니다.

| 명령                               | 묘사                                                       |
|:-------------------------------- |:-------------------------------------------------------- |
| `exit` or `quit`                 | Gogo 셸 종료                                                |
| `upgrade:help`                   | 업그레이드 명령 표시                                              |
| `upgrade:check`                  | 과거에 실패했거나 모듈이 최종 버전에 도달하지 않았기 때문에 실행 보류 중인 업그레이드를 나열합니다. |
| `upgrade:execute [module_name]`  | 해당 모듈에 대한 업그레이드 실행                                       |
| `upgrade:executeAll`             | 보류 중인 모든 모듈 업그레이드 프로세스 실행                                |
| `upgrade:list`                   | 등록된 모든 업그레이드를 나열합니다.                                     |
| `upgrade:list [module_name]`     | 모듈의 필수 업그레이드 단계를 나열합니다.                                  |
| `upgrade:list | grep Registered` | 등록된 업그레이드 및 해당 버전을 나열합니다.                                |
| `verify:help`                    | 확인 명령 표시                                                 |
| `verify:check [module_name]`     | 모듈의 확인 프로세스에 대한 최신 실행 결과를 나열합니다.                         |
| `verify:checkAll`                | 모든 확인 프로세스에 대한 최신 실행 결과를 나열합니다.                          |
| `verify:execute [module_name]`   | 모듈의 검증자를 실행합니다.                                          |
| `verify:executeAll`              | 모든 검증자를 실행합니다.                                           |
| `verify:list`                    | 등록된 모든 검증자를 나열합니다.                                       |

다음으로 각 모듈의 업그레이드 가능 여부를 확인합니다.

## 업그레이드 준비가 된 모듈 나열

종속성이 충족되면 모듈을 업그레이드할 준비가 된 것입니다. 준비된 모듈을 나열하는 Gogo 셸 명령과 모듈의 해결되지 않은 종속성을 나열하는 명령이 있습니다.

`upgrade:list` Gogo 셸 명령은 업그레이드 종속성이 충족되는 모듈을 나열합니다. 이러한 모듈은 업그레이드할 수 있습니다.

모듈이 활성 상태이지만 나열되지 않은 경우 해당 종속성을 업그레이드해야 합니다.

## 모듈 종속성 문제 해결

해결되지 않은 종속성을 찾기 위한 Gogo 셸 명령이 있으므로 이를 수정하고 모듈을 업그레이드할 준비를 할 수 있습니다. Gogo 셸 명령 `scr:info [upgrade_step_class_qualified_name]` 는 업그레이드 단계 클래스의 충족되지 않은 종속성을 보여줍니다. 다음은 `scr:info`명령의 예입니다.

```
scr:info com.liferay.journal.upgrade.JournalServiceUpgrade
```

모듈의 업그레이드 단계(클래스)는 순서대로 해결되어야 합니다. `upgrade:list [module_name]` 호출은 모듈의 모든 업그레이드 단계를 나열합니다. 예의 경우 `upgrade:list com.liferay.bookmarks.service` ( 책갈피 서비스 모듈의 경우)를 실행하면 다음이 나열됩니다.

```
Registered upgrade processes for com.liferay.bookmarks.service 1.0.0
        {fromSchemaVersionString=0.0.0, toSchemaVersionString=1.0.0, upgradeStep=com.liferay.portal.spring.extender.internal.context.ModuleApplicationContextExtender$ModuleApplicationContextExtension$1@6e9691da}
        {fromSchemaVersionString=0.0.1, toSchemaVersionString=1.0.0-step-3, upgradeStep=com.liferay.bookmarks.upgrade.v1_0_0.UpgradePortletId@5f41b7ee}
        {fromSchemaVersionString=1.0.0-step-1, toSchemaVersionString=1.0.0, upgradeStep=com.liferay.bookmarks.upgrade.v1_0_0.UpgradePortletSettings@53929b1d}
        {fromSchemaVersionString=1.0.0-step-2, toSchemaVersionString=1.0.0-step-1, upgradeStep=com.liferay.bookmarks.upgrade.v1_0_0.UpgradeLastPublishDate@3e05b7c8}
        {fromSchemaVersionString=1.0.0-step-3, toSchemaVersionString=1.0.0-step-2, upgradeStep=com.liferay.bookmarks.upgrade.v1_0_0.UpgradeClassNames@6964cb47}
```

애플리케이션의 업그레이드 단계 클래스 이름은 일반적으로 해당 의도를 나타냅니다. 예를 들어 예제의 `com.liferay.bookmarks.upgrade.v1_0_0.UpgradePortletId` 업그레이드 단계 클래스는 앱의 포틀릿 ID를 업데이트합니다. 다른 예제 업그레이드 단계 클래스는 클래스 이름 `LastPublishDate`및 `PortletSettings`을 업데이트합니다. `0.0.0` 에서 `1.0.0` 까지의 예제 단계는 빈 데이터베이스에서 모듈을 업그레이드합니다.

모듈의 업그레이드 프로세스를 더 잘 검사하기 위해 나열된 업그레이드 단계를 정신적으로 또는 텍스트 편집기에서 정렬할 수 있습니다. Liferay Portal 6.2(모듈의 데이터베이스가 있음)에서 스키마 버전 `1.0.0`로 업그레이드할 책갈피 서비스 모듈의 업그레이드 단계 순서는 다음과 같습니다.

* `0.0.1` to `1.0.0-step-3`
* `0.0.1-step-3` to `1.0.0-step-2`
* `0.0.1-step-2` to `1.0.0-step-1`
* `0.0.1-step-1` to `1.0.0`

전체 모듈 업그레이드 프로세스는 버전 `0.0.1` 에서 시작하여 버전 `1.0.0`에서 끝납니다. 첫 번째 단계는 초기 버전(`0.0.1`)에서 시작하여 대상 버전의 가장 높은 단계(`step-3`)에서 끝납니다. 마지막 단계는 대상 버전의 가장 낮은 단계(`step-1`)에서 시작하여 대상 버전(`1.0.0`)에서 끝납니다.

모듈의 업그레이드 프로세스를 이해하면 안심하고 실행할 수 있습니다.

## 모듈 업그레이드 실행

`upgrade:execute [module_name]` 를 실행하면 모듈이 업그레이드됩니다. 해결해야 하는 업그레이드 오류가 발생할 수 있습니다. 명령을 다시 실행하면 마지막으로 성공한 단계부터 업그레이드가 시작됩니다.

`upgrade:list [module_name]`를 실행하여 업그레이드 상태를 확인할 수 있습니다. 예를 들어 `upgrade:list com.liferay.iframe.web` 을 입력하면 다음이 출력됩니다.

```
Registered upgrade processes for com.liferay.iframe.web 0.0.1
   {fromSchemaVersionString=0.0.1, toSchemaVersionString=1.0.0, upgradeStep=com.liferay.iframe.web.upgrade.IFrameWebUpgrade$1@1537752d}
```

첫 번째 줄에는 모듈 이름과 현재 버전이 나열됩니다. 예제 모듈의 현재 버전은 `0.0.1`입니다. `toSchemaVersionString` 값은 대상 버전입니다.

성공적으로 업그레이드한 후 모듈에서 `upgrade:list [module_name]` 를 실행하면 모듈 이름 뒤에 대상 버전이 표시됩니다.

예를 들어 `com.liferay.iframe.web` 을 버전 `1.0.0`으로 성공적으로 업그레이드한 경우 `upgrade:list com.liferay.iframe.web` 를 실행하면 모듈의 버전이 `1.0.0`인 것으로 표시됩니다.

```
Registered upgrade processes for com.liferay.iframe.web 1.0.0
   {fromSchemaVersionString=0.0.1, toSchemaVersionString=1.0.0, upgradeStep=com.liferay.iframe.web.upgrade.IFrameWebUpgrade$1@1537752d}
```

완료되지 않은 모듈 업그레이드의 경우 상태를 확인하고 문제를 해결할 수 있습니다.

## 업그레이드 상태 확인

`upgrade:check` 명령은 임박한 업그레이드가 있는 모듈을 나열합니다.

예를 들어 모듈  `com.liferay.dynamic.data.mapping.service` 이 `1.0.0-step-2`단계에서 실패한 경우 `upgrade:check` 를 실행하면 다음이 표시됩니다.

```
Would upgrade com.liferay.dynamic.data.mapping.service from 1.0.0-step-2 to
1.0.0 and its dependent modules
```

모듈은 종종 업그레이드를 완료하기 위해 다른 모듈에 의존합니다. `scr:info [upgrade_step_class_qualified_name]` 를 실행하면 업그레이드 단계 클래스의 종속성이 표시됩니다. 먼저 모듈이 종속된 모듈을 업그레이드해야 합니다.

모듈을 확인하고 활성화하려면 해당 업그레이드를 완료해야 합니다. [Apache Felix Dependency Manager](http://felix.apache.org/documentation/subprojects/apache-felix-dependency-manager/tutorials/leveraging-the-shell.html) Gogo 셸 명령 `dm wtf` 은 해결되지 않은 종속성을 나타냅니다. 모듈에 특정 데이터 스키마 버전(예: `bnd.bnd` 지정 `Liferay-Require-SchemaVersion: 1.0.2`)이 필요하지만 모듈이 해당 버전으로의 업그레이드를 완료하지 않은 경우 `dm wtf` 는 스키마 버전이 등록되지 않았습니다.

```
1 missing dependencies found.
-------------------------------------
The following service(s) are missing:
 * com.liferay.portal.kernel.model.Release (&(release.bundle.symbolic.name=com.liferay.journal.service)(release.schema.version=1.0.2)) is not found in the service registry
```

`dm wtf` 명령은 포틀릿 정의 및 사용자 정의 포틀릿 `schemaVersion` 필드의 오류를 감지하는 데 도움이 될 수도 있습니다.

### Release_ 테이블 확인

각 모듈에는 하나의 `Release_` 테이블 레코드가 있고 해당 `schemaVersion` 필드의 값은 `1.0.0` 이상이어야 합니다. `1.0.0` 은 Liferay DXP 모듈의 초기 버전입니다. 단, 버전 6.2 이하를 위한 이전의 기존 플러그인은 제외됩니다.

## 확인 프로세스 실행

일부 모듈에는 확인 프로세스가 있습니다. 이를 통해 업그레이드가 성공적으로 실행되었는지 확인할 수 있습니다. Liferay DXP를 업그레이드한 후 코어의 프로세스가 자동으로 실행되는지 확인합니다. [`verify.*` 포털 속성](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) 을 구성하고 서버를 다시 시작하여 실행할 수도 있습니다.

사용 가능한 확인 프로세스를 확인하려면 Gogo 셸 명령 `verify:list`을 입력합니다. 확인 프로세스를 실행하려면 `verify:execute [verify_qualified_name]`를 입력하십시오.

## 관련 항목

* [Gogo Shell에서 사용 가능한 Liferay 명령 및 표준 명령](../../../liferay-internals/fundamentals/using-the-gogo-shell/gogo-shell-commands.md)
