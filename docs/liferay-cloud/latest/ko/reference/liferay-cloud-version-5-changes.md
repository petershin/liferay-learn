# Liferay 클라우드 버전 5 변경 사항

Liferay Cloud 버전 5에는 몇 가지 변경 사항과 새로운 기능이 포함되어 있습니다.

* [Nginx의 ModSecurity 기능](#modsecurity-capabilities-with-nginx)
* [향상된 지역 지속성](#improved-regional-persistence)
* [백업 복원 전략 준비 및 교체](#prepare-and-swap-backup-restore-strategy)
* [백업 업로드 재시도 구성](#backup-upload-retry-configuration)

## Nginx의 ModSecurity 기능

ModSecurity는 웹 서버 버전 5.xx와 함께 Liferay Cloud에서 사용할 수 있는 웹 애플리케이션 방화벽입니다. 사전 정의된 사용자 정의 규칙 세트에 대해 웹 서버로 전송된 요청을 실시간으로 검사합니다. 이 단계는 XSS 및 SQL 주입과 같은 일반적인 웹 애플리케이션 L7 공격을 방지합니다.

자세한 내용은 [ModSecurity](../tuning-security-settings/web-application-firewall.md) 활성화를 참조하십시오.

## 향상된 지역 지속성

Liferay Cloud의 데이터베이스 및 백업 서비스는 버전 5.xx에서 안정성이 향상되었습니다. 업그레이드하면 서비스가 업데이트되어 지역 지속성이 향상됩니다. 이를 통해 워크로드 성능이 향상되고 장애 조치 대기 시간이 최소화됩니다.

## 백업 복원 전략 준비 및 교체

백업에서 데이터를 복원하면 데이터베이스 서비스 및 모든 종속 서비스(Liferay 포함)가 중단됩니다. 그러나 백업 서비스 버전 5.xx에서는 복원 동작이 먼저 별도의 새로운 데이터베이스 인스턴스 및 볼륨을 시작한 다음 준비가 되면 새 인스턴스로 전환할 수 있습니다. 이렇게 하면 인스턴스의 가동 중지 시간이 최소화됩니다.

이 전략을 사용하려면 [`LCP_BACKUP_RESTORE_STRATEGY` 환경 변수](../platform-services/backup-service/backup-service-overview.md#environment-variables-reference) 의 값을 `PREPARE_AND_SWAP` 로 설정합니다.

## 백업 업로드 재시도 구성

버전 5.xx를 사용하면 백업 업로드에 대한 재시도 횟수와 재시도 사이의 지연을 미세 조정할 수 있습니다. 자세한 내용은 `LCP_GCP_STORAGE_UPLOAD_*` [백업 서비스 환경 변수](../platform-services/backup-service/backup-service-overview.md#environment-variables-reference) 을 참조하세요.
