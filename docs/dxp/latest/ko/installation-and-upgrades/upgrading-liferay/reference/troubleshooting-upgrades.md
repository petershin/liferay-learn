# 업그레이드 문제 해결

업그레이드 단계를 건너뛰거나 Liferay 데이터베이스에 대한 사용자 지정 참조를 생성하면 업그레이드 문제가 발생할 수 있습니다. 다음 질문과 답변은 몇 가지 일반적인 상황을 다룹니다.

## 외래 키 제약 조건으로 인해 발생한 업그레이드 예외를 어떻게 처리해야 합니까?

Liferay 테이블은 외래 키를 사용하지 않습니다. 새 Liferay 버전이 Liferay 테이블에 기본 키를 추가하고 테이블과 연결된 외래 키가 있는 경우 외래 키가 손상되고 업그레이드가 실패합니다.

예를 들어 Liferay 7.3은 `ctCollectionId` 이라는 기본 키를 `user_` 테이블에 추가했습니다. `user_` 테이블과 연결된 외래 키로 인해 `user_` 테이블 업그레이드가 다음과 같은 메시지와 함께 실패합니다.

```
INFO  [main][LoggingTimer:44] Completed com.liferay.portal.kernel.upgrade.UpgradeCTModel#doUpgrade#User_ in 750 ms
INFO  [main][UpgradeProcess:115] Failed upgrade process com.liferay.portal.kernel.upgrade.UpgradeCTModel in 4703 ms
INFO  [main][UpgradeProcess:115] Failed upgrade process com.liferay.portal.upgrade.PortalUpgradeProcess in 53125 ms
com.liferay.portal.kernel.upgrade.UpgradeException: com.liferay.portal.kernel.upgrade.UpgradeException: java.sql.SQLException: Error on rename of '.\liferaydxp\#sql-908_12f' to '.\liferaydxp\user_' (errno: 150 - Foreign key constraint is incorrectly formed)
```

마지막 `UpgradeException` 메시지는 업그레이드가 `user_` 테이블에 대한 외래 키 제약 조건의 이름을 바꿀 수 없음을 나타냅니다.

Liferay 테이블과 연결된 외래 키를 사용하는 사용자 정의 테이블이 있는 경우 외래 키를 Liferay 모델 변경 사항을 기반으로 사용자 정의 테이블을 업데이트하는 [모델 리스너](../../../liferay-internals/extending-liferay/creating-a-model-listener.md) 로 바꿉니다. 예를 들어 사용자 지정 테이블에 현재 `user_` 테이블을 참조하는 외래 키가 있는 경우 `사용자` 인스턴스가 추가되거나 삭제될 때 사용자 지정 테이블을 업데이트하는 모델 리스너를 생성합니다.

교체 방법은 다음과 같습니다.

1. 사용자 정의 테이블 데이터와 관련된 모델 이벤트에 대한 모델 리스너를 생성합니다.

1. 테스트 환경에서 모델 리스너의 유효성을 검사합니다.

1. 업그레이드 환경에서 사용자 지정 테이블을 외래 키를 사용하지 않는 테이블로 바꿉니다.

1. 데이터베이스를 업그레이드하십시오.

1. 새 Liferay 설치에 모델 리스너를 배포합니다.

1. Liferay 서버를 시작하십시오.

모델 리스너는 수신 대기 중인 모델 이벤트를 기반으로 새 사용자 지정 테이블을 업데이트합니다.

## 가상 열 표현식에서 사용하는 테이블 열 이름 바꾸기에 대한 업그레이드 프로세스 경고를 어떻게 처리해야 합니까?

일부 새로운 Liferay 버전은 테이블 열의 이름을 바꿉니다. 이러한 열과 연결된 [가상 열](https://en.wikipedia.org/wiki/Virtual_column) 은 데이터베이스 업그레이드를 금지하므로 업그레이드 전에 제거해야 합니다. 업그레이드 후 동등한 가상 열을 추가할 수 있습니다.

예를 들어, Liferay 7.0은 `JournalArticle` 테이블의 `structureId` 및 `templateId` 열을 각각 `DDMStructureKey` 및 `DDMTemplateKey`로 이름을 변경했습니다. Liferay Portal 6.2에서 업그레이드하고 가상 열을 `JournalArticle` 테이블과 연결한 경우 업그레이드하기 전에 제거하십시오. 예를 들어 Oracle 데이터베이스에서 다음과 같은 쿼리를 사용하여 가상 열을 확인할 수 있습니다.

```sql
select column_name, data_default, hidden_column from user_tab_cols where table_name = 'JOURNALARTICLE';
```

테이블을 업그레이드한 후 데이터베이스에 동등한 가상 열을 추가할 수 있습니다.
