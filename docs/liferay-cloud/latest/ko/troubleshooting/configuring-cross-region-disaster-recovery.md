# 지역 간 재해 복구 구성

Liferay Cloud는 고객이 중대한 사고가 발생한 경우 재해 복구(DR) 절차를 활용할 수 있는 두 가지 방법인 자동 재해 복구 및 교차 지역 재해 복구를 제공합니다. 재해 복구 시나리오에 대한 Liferay Cloud의 접근 방식은 [재해 복구 개요](./disaster-recovery-overview.md)에서 자세히 검토할 수 있습니다.

여기에서는 지역 간 재해 발생 시 수동으로 데이터를 복구하는 방법을 알아봅니다. 이러한 단계는 동일한 지리적 지역에 있는 세 영역 모두에서 동시에 손상이 있는 경우에만 필요합니다.

* [초기 설정](#initial-setup)
* [사고 중](#during-an-incident)
* [사후 복구](#post-incident-recovery)

## 초기 설정

Liferay는 교차 지역 재해를 관리하기 위한 전용 Liferay 클라우드 환경을 제공합니다. 이 예에서는 프로덕션 환경이 **europe-west2** 지역에 저장되어 있고 해당 지역이 손상되었다고 가정합니다. 프로덕션 환경에서 다운타임 및 데이터 손실을 방지하려면 재해 복구 환경을 작업 영역 외부(예: **us-west1**)로 이동하십시오. 이 다섯 번째 재해 복구(DR로 단축) 환경은 사고 중에 생성된 새로운 사용자 데이터를 저장하기 위한 백업 역할을 합니다.

재해 복구 환경을 설정하려는 Liferay Cloud 고객은 영업 담당자에게 연락하여 DR 환경을 프로비저닝해야 합니다. 이 새로운 환경은 사용 가능한 다른 환경(예: `dev`, `infra`, `uat`및 `prd`)과 함께 나타납니다.

![재해 복구 환경이 있으면 다른 환경과 마찬가지로 선택할 수 있습니다.](./configuring-cross-region-disaster-recovery/images/01.png)

Liferay Cloud 시스템 관리자는 DR 환경과 프로덕션 환경 모두에 대한 전체 관리 권한이 있어야 합니다.

### DR 환경에서 VPN 설정 확인

프로덕션 환경에서 VPN이 활성화된 경우 DR 환경의 VPN도 활성화되었는지 확인하십시오.

두 환경이 연결되어 있는지 확인하려면

1. 왼쪽 메뉴에서 DR 환경의 **설정** 탭을 클릭합니다.

1. VPN 섹션에서 다음 정보를 입력합니다.

    * **VPN 유형** : OpenVPN
    * **서버 주소** : 서버 주소.
    * **계정 이름** : 관리자의 이메일 주소.
    * **비밀번호** : 관리자의 비밀번호입니다.
    * **인증서** : 인증서 코드.
    * **포워딩 IP** : 포워딩 IP 주소.
    * **포워딩 포트** : 포워딩 포트 번호.
    * **로컬 호스트 이름** : VPN의 호스트 이름입니다.
    * **로컬 포트** : 로컬 포트 번호.

1. **VPN 연결** 을 클릭합니다.

VPN 연결에 대한 자세한 내용은 [VPN 연결](..//configuring-the-cloud-network/connecting-a-vpn-server-to-liferay-cloud.md)을 참조하십시오.

### 프로덕션에서 DR 환경으로 안정적인 최신 빌드 배포

이제 프로덕션의 안정적인 최신 빌드를 DR 환경에 배포해야 합니다. [Liferay Cloud 배포 워크플로우 개요](../build-and-deploy/overview-of-the-liferay-cloud-deployment-workflow.md)에 설명된 것과 동일한 단계를 따르십시오.

### 재해 복구로 자동 백업 복원 설정

재해 복구 환경 설정을 마치려면 자동 백업 복원을 설정하십시오. 이렇게 하면 사건이 발생할 때 최신 백업이 DR 환경에서 항상 준비됩니다.

먼저 프로덕션 환경의 마스터 토큰을 검색합니다( `liferay` 서비스 셸에 액세스하려면 관리자 권한이 필요함).

1. Liferay Cloud 콘솔에서 프로덕션 환경 &rarr; `liferay` 서비스 페이지로 이동합니다.

1. **Shell** 탭을 클릭합니다.

1. 이 명령을 실행하여 환경의 마스터 토큰을 가져옵니다.

    ```bash
    env | grep LCP_PROJECT_MASTER_TOKEN
    ```

    마스터 토큰은 결과에서 `=` 다음의 16진수 ID입니다.

프로덕션 환경의 마스터 토큰이 있으면 DR 환경에서 다음 [개의 환경 변수를](../reference/defining-environment-variables.md) 로 설정합니다.

* **LCP_EXTERNAL_PROJECT_ID**: 프로덕션 환경의 프로젝트 ID(예: `acme-prd`)

* **LCP_BACKUP_RESTORE_SCHEDULE**: 자동 백업 빈도를 정의하는 [cron 스케줄링](https://crontab.guru/) 값. 자세한 내용은 [자동 백업 및 정리 예약](../platform-services/backup-service/backup-service-overview.md#scheduling-automated-backups-and-cleanups) 을 참조하십시오.

DR 환경에서 이 값을 [비밀](..//tuning-security-settings/managing-secure-environment-variables-with-secrets.md) 로 설정합니다.

* **LCP_EXTERNAL_PROJECT_MASTER_TOKEN**: 프로덕션 환경의 마스터 토큰

```{warning}
프로덕션 환경이 **아닌** 재해 복구 환경에서 이러한 환경 변수를 설정하십시오. 프로덕션 환경에서 이러한 변수를 설정하면 예기치 않게 백업이 복원될 수 있습니다.
```

DR 환경에 이러한 변수를 저장하면 자동 복원이 가능합니다.

## 사고 중

위의 예를 계속하여 **europe-west2** 지역에서 호스팅되는 프로덕션 환경이 현지 시간으로 오후 2시에 매시간 백업되도록 예약되어 있다고 가정합니다. 이 시나리오에서 지역은 현지 시간으로 오후 2시 30분에 손상됩니다. 중간 30분 동안 백업이 생성되지 않았기 때문에 프로덕션 환경에서 재해 복구 환경으로 데이터베이스 및 문서의 백업을 복원해야 합니다. 마지막 안정 환경은 오후 2시에 생성된 버전입니다.

지역 간 사고 중에 다음 단계를 따르십시오.

1. [데이터베이스 복원 일정 비활성화](#disable-the-database-restoration-schedule)

1. [DR 환경에 최신 프로덕션 데이터 복사](#copy-latest-production-data-to-the-dr-environment)

1. [DR 환경의 VPN 상태 확인 및 재인덱싱](#verify-the-dr-environments-vpn-status-and-reindex)

1. [사용자 정의 도메인 트래픽을 DR 환경으로 전달](#direct-custom-domain-traffic-to-the-dr-environment)

### 데이터베이스 복원 일정 비활성화

DR 환경은 사고 기간 동안 사용자가 액세스할 수 있는 기본 환경이 되므로 일반 데이터베이스 복원 일정은 프로덕션을 전환한 후 데이터를 덮어쓸 수 있습니다.

[`LCP_BACKUP_RESTORE_SCHEDULE` 환경 변수](../platform-services/backup-service/backup-service-overview.md#environment-variables-reference) 을 사용하여 데이터를 DR 환경으로 정기적으로 복원하는 경우 변수를 제거하여 복원 일정을 일시적으로 비활성화하십시오. 이렇게 하면 사고 중에 생성된 데이터가 예약된 복원으로 덮어쓰이는 것을 방지할 수 있습니다.

액세스할 수 있는 동안 복원 일정을 비활성화하려면 다음 단계를 따르십시오.

1. Liferay Cloud Console에서 DR 환경 &rarr; 백업 서비스 페이지 &rarr; 환경 변수로 이동합니다.

1. 눈 아이콘을 클릭하여 `LCP_BACKUP_RESTORE_SCHEDULE` 변수의 값을 표시합니다.

    ![일정 구성을 표시하려면 눈 아이콘을 클릭하십시오.](./configuring-cross-region-disaster-recovery/images/02.png)

1. 사고 후 신속하게 교체할 수 있도록 `LCP_BACKUP_RESTORE_SCHEDULE` 의 값을 기록해 둡니다.

1. `LCP_BACKUP_RESTORE_SCHEDULE` 환경 변수를 제거하고 변경 사항을 저장합니다.

### DR 환경에 최신 프로덕션 데이터 복사

다음으로 프로덕션 환경에서 백업을 복원하여 DR 환경에 최신 업데이트가 있는지 확인합니다.

```{important}
'LCP_BACKUP_RESTORE_SCHEDULE' 환경 변수를 사용하여 DR 환경으로 정기적으로 복원한 경우 이미 보다 최근의 안정적인 백업이 복원되고 준비되었을 수 있습니다(구성된 빈도에 따라 다름). 보다 최근에 백업을 자동으로 복원한 경우 백업 수동 복원을 건너뜁니다.
```

프로덕션의 안정적인 최신 백업을 DR 환경으로 복원하려면 다음 단계를 따르십시오.

1. DR 환경에서 **백업** 탭을 클릭합니다.

1. 프로덕션 환경에 해당하는 탭을 클릭합니다.

    ```{note}
    백업 기록에는 두 개의 탭(DR 환경용 탭과 프로덕션 환경용 탭)에 백업이 나열됩니다.
    ```

1. 프로덕션 환경에서 안정적인 최신 백업을 위해 **작업**(![Actions](./configuring-cross-region-disaster-recovery/images/03.png))을 클릭합니다. 그런 다음 **복원** 를 선택합니다.

    ![프로덕션 환경에서 DR 환경으로 안정적인 최신 백업을 복원합니다.](./configuring-cross-region-disaster-recovery/images/04.png)

### DR 환경의 VPN 상태 확인 및 재인덱싱

그런 다음 다음 단계에 따라 DR 환경이 들어오는 트래픽에 대해 준비되었는지 확인하십시오.

1. DR 환경의 **설정** &rarr; **VPN** 페이지로 이동하여 VPN이 DR 환경에 연결되어 있는지 확인합니다.

    ![DR 환경의 VPN 상태를 확인하여 올바르게 연결되었는지 확인하십시오.](./configuring-cross-region-disaster-recovery/images/05.png)

    적절한 VPN이 연결되지 않은 경우 연결을 설정하십시오. 자세한 내용은 [VPN 서버를 Liferay Cloud](..//configuring-the-cloud-network/connecting-a-vpn-server-to-liferay-cloud.md) 에 연결을 참조하십시오.

1. DXP 인스턴스에 로그인합니다(사용자 지정 도메인이 아직 DR 환경을 가리키지 않기 때문에 IP 주소 사용).

1. **글로벌 메뉴로 이동**(![Applications Menu icon](./configuring-cross-region-disaster-recovery/images/06.png)) &rarr; **제어판** &rarr; **검색** .

1. **모든 검색 색인 재색인** 을 클릭합니다.

재색인이 완료될 때까지 약간의 시간을 허용합니다.

### 사용자 정의 도메인 트래픽을 DR 환경으로 전달

DR 환경에 있는 웹 서버 서비스의 사용자 정의 도메인은 원래 프로덕션 환경의 것과 일치해야 합니다. 프로덕션 환경에서도 해당 구성을 삭제해야 합니다.

1. DR 환경에서 왼쪽 메뉴에서 **서비스** 을 선택합니다.

1. 서비스 목록에서 **webserver** 을 클릭합니다.

1. **사용자 지정 도메인** 탭을 클릭하고 프로덕션 환경과 일치하도록 사용자 지정 도메인을 구성합니다.

1. 프로덕션 환경에서 동일한 설정으로 이동하고 사용자 지정 도메인 구성을 제거합니다.

1. DNS 레코드를 업데이트하고 DR 환경에 사용자 지정 도메인을 추가합니다. 자세한 내용은 [사용자 정의 도메인](..//configuring-the-cloud-network/custom-domains.md)을 참조하십시오.

이로 인해 모든 트래픽이 DR 환경으로 이동합니다.

![웹 서버 서비스의 경우 프로덕션 환경과 일치하도록 DR 환경의 사용자 지정 도메인을 구성합니다.](./configuring-cross-region-disaster-recovery/images/07.png)

## 사후 복구

지역적 인시던트가 끝나면 원래 지역의 프로덕션 환경(이 예에서는 **europe-west2**)으로 다시 전환해야 합니다. 다음과 같이하세요:

1. [데이터 생성 중단](#put-a-freeze-on-data-creation)

1. [DR 환경의 수동 백업 생성](#create-a-manual-backup-of-the-dr-environment)

1. [수동 백업을 프로덕션으로 복원](#restore-the-manual-backup-to-production)

1. [VPN 상태 확인 및 재색인](#verify-vpn-status-and-reindex)

1. [서버 사용자 지정 트래픽을 프로덕션으로 복원](#restore-server-custom-traffic-to-production)

1. [데이터베이스 복원 일정 복원](#restore-the-database-restoration-schedule)

### 데이터 생성 중단

일반 프로덕션 환경으로 다시 전환할 때 최근 변경 사항으로 인한 데이터 손실을 방지하려면 DR 환경에서 모든 콘텐츠 생성을 중지해야 합니다. 프로덕션 환경으로 다시 전환할 준비가 되면 데이터베이스 관리자와 협력하여 수동 백업을 수행하기 전에 데이터 고정을 조정하십시오.

### DR 환경의 수동 백업 생성

사고가 발생하는 동안 DR 환경은 프로덕션 환경으로 작동하므로 재해 이벤트 중에 생성된 모든 새 데이터를 포함합니다. 이 데이터를 보존하려면 DR 환경을 백업해야 합니다.

1. DR 환경에서 왼쪽 메뉴에서 **백업** 을 클릭합니다.

1. **지금 백업** 을 클릭합니다.

![DR 환경의 수동 백업을 만듭니다.](./configuring-cross-region-disaster-recovery/images/08.png)

### 수동 백업을 프로덕션으로 복원

DR 환경의 데이터를 일반 프로덕션 환경으로 다시 복원합니다.

1. DR 환경에서 왼쪽 메뉴에서 **백업** 을 클릭합니다.

1. DR 환경에 해당하는 탭을 클릭합니다.

    ```{note}
    백업 기록에는 두 개의 탭(DR 환경용 탭과 프로덕션 환경용 탭)에 백업이 나열됩니다.
    ```

1. 가장 최근 백업(방금 만든 백업)의 경우 **작업** 버튼(![Actions](./configuring-cross-region-disaster-recovery/images/03.png))을 클릭하고 **복원** 을 선택합니다.

1. 프로덕션 환경을 선택하고 **빌드** 배포를 클릭합니다.

![프로덕션 환경에 백업을 배포합니다.](./configuring-cross-region-disaster-recovery/images/09.png)

### VPN 상태 확인 및 재색인

프로덕션 환경이 들어오는 트래픽에 대해 준비되었는지 확인하려면 다음 단계를 따르십시오.

1. 프로덕션 환경의 **설정** &rarr; **VPN** 페이지로 이동하여 VPN이 프로덕션 환경에 연결되어 있는지 확인합니다.

   적절한 VPN이 연결되지 않은 경우 연결을 설정하십시오. 자세한 내용은 [VPN 서버를 Liferay Cloud](..//configuring-the-cloud-network/connecting-a-vpn-server-to-liferay-cloud.md) 에 연결을 참조하십시오.

1. DXP 인스턴스에 로그인합니다(사용자 지정 도메인이 여전히 DR 환경을 가리키므로 IP 주소 사용).

1. **전역 메뉴로 이동합니다.** &rarr; **제어판** &rarr; **검색** .

1. **모든 검색 색인 재색인** 을 클릭합니다.

재색인이 완료될 때까지 약간의 시간을 허용합니다.

### 서버 사용자 지정 트래픽을 프로덕션으로 복원

사고가 발생하는 동안 웹 서버 서비스가 모든 트래픽을 DR 환경으로 리디렉션했기 때문에 모든 트래픽이 다시 원래 프로덕션 환경으로 리디렉션되도록 이러한 설정을 다시 업데이트해야 합니다.

1. 왼쪽 메뉴에서 **서비스** 로 이동합니다.

1. 서비스 목록에서 **webserver** 을 클릭합니다.

1. **사용자 지정 도메인** 탭을 클릭합니다.

   ![DR 환경에서 사용자 정의 도메인을 제거하십시오.](./configuring-cross-region-disaster-recovery/images/10.png)

1. DR 환경에서 사용자 정의 도메인을 제거하십시오.

    ```{warning}
    사용자 지정 도메인을 제거하면 프로덕션 환경이 다시 트래픽을 수신할 때까지 다운타임이 발생합니다.
    ```

1. DNS 레코드를 업데이트하고 프로덕션 환경에 사용자 지정 도메인을 다시 추가합니다. 자세한 내용은 [사용자 정의 도메인](..//configuring-the-cloud-network/custom-domains.md)을 참조하십시오.

1. **사용자 지정 도메인 업데이트** 을 클릭합니다.

이제 트래픽이 원래 프로덕션 환경으로 다시 전달되어야 합니다. DR 환경에 자동 예약된 데이터베이스 복원을 사용하지 않으면 재해 복구 프로세스가 완료됩니다.

### 데이터베이스 복원 일정 복원

`LCP_BACKUP_RESTORE_SCHEDULE` 환경 변수를 사용하여 사고 이전에 DR 환경으로 정기적으로 복원한 경우 이 변수를 다시 복원하여 복원 일정을 재개하십시오.

1. Liferay Cloud 콘솔에서 DR 환경 &rarr; 백업 서비스 페이지 &rarr; 환경 변수로 이동합니다.

1. `LCP_BACKUP_RESTORE_SCHEDULE` 환경 변수를 추가하고 이전에 기록해 둔 값을 [제거할 때](#disable-the-database-restoration-schedule) 복원합니다.

1. 변경 사항을 저장합니다.

Liferay Cloud 환경은 이제 정상 작동을 재개할 수 있습니다.
