# 백업에서 데이터 복원

Kyle은 사이트의 데이터에 영향을 미칠 수 있는 변경 사항을 테스트하기를 원합니다.

여기에서는 테스트 중에 손실된 데이터를 복구하기 위해 수동 백업을 복원합니다.

## 프로덕션에서 수동 백업 생성

데이터 손실이나 불안정성을 유발할 수 있는 변경 사항을 테스트하기 전에 항상 Liferay 인스턴스가 백업되었는지 확인해야 합니다.

테스트를 시작하기 전에 수동 백업을 만드십시오.

1. Liferay Cloud 콘솔에서 프로덕션 환경으로 이동합니다.

1. 화면 왼쪽에서 *백업* 클릭합니다.

1. 수동 백업을 생성하려면 *지금 백업* 클릭하세요.

![이 연습에서는 수동 백업을 사용하십시오.](./restoring-data-from-a-backup/images/01.png)

백업 서비스를 사용할 수 없으며 백업이 완료될 때까지 페이지의 버튼이 비활성화됩니다.

## 백업을 UAT로 복원

프로덕션 백업이 완료되면 UAT 환경으로 복원합니다.

1. 목록 상단의 수동 백업 옆에 있는 _작업_ ( ![Actions icon](../../images/icon-actions.png) )을 클릭하고 *다음으로 복원...을 클릭합니다*

   ![원하는 백업을 선택하고 다음으로 복원을 클릭하세요.](./restoring-data-from-a-backup/images/02.png)

1. 환경 선택 드롭다운 메뉴에서 UAT 환경을 선택합니다.

1. 백업 복원의 영향을 확인하려면 확인란을 클릭합니다.

   ![백업 복원의 영향을 확인하면 환경으로 복원 버튼이 나타납니다.](./restoring-data-from-a-backup/images/03.png)

1. *환경*로 복원을 클릭합니다.

백업이 복원되는 동안 UAT 환경의 서비스를 일시적으로 사용할 수 없습니다.

## 재해 시뮬레이션

UAT Liferay 인스턴스에서 기본 홈 페이지를 삭제하여 재해를 시뮬레이션하세요.

1. UAT 환경으로 이동합니다.

1. 페이지 상단의 *사이트 방문*을 클릭하여 UAT Liferay 인스턴스에 액세스합니다. 이전에 로그인한 세션이 만료된 경우, [프로젝트의 자격 증명 사용](./deploying-and-promoting-to-production.md#accessing-your-uat-environment)을 통해 인증하세요.

1. [기본 관리자](https://learn.liferay.com/web/guest/w/dxp/getting-started/introduction-to-the-admin-account)로 로그인하십시오.

1. 화면 왼쪽 탐색 메뉴에서 *사이트 빌더* &rarr; *페이지*클릭하세요.

1. 홈 페이지 옆에서 작업 메뉴( ![Actions icon](../../images/icon-actions.png) )를 열고 *삭제*클릭합니다.

   ![페이지 메뉴에서 홈 페이지를 삭제합니다.](./restoring-data-from-a-backup/images/04.png)

   삭제 확인을 요청하는 팝업 대화 상자가 나타납니다.

1. *삭제*를 클릭하세요.

홈 페이지가 삭제되며 삭제를 취소할 수 없습니다. 더 이상 홈 페이지가 없기 때문에 화면 오른쪽 상단에 있는 *홈* 버튼도 사라집니다.

## 백업 복원

카일은 페이지를 삭제한 후 페이지가 삭제되어서는 안 된다는 사실을 깨닫고 새 페이지를 쉽게 만드는 방법을 기억하지 못합니다. Liferay 인스턴스에 액세스하기 전에 수행한 백업을 복원하여 Kyle이 UAT에서 데이터를 복구할 수 있도록 도와주세요.

1. Liferay Cloud 콘솔에서 프로덕션 환경으로 이동합니다.

1. *백업*을 클릭합니다.

1. 수동 백업 옆에 있는 작업 메뉴( ![Actions icon](../../images/icon-actions.png) )를 클릭하고 *다음으로 복원...*을 클릭합니다.

1. *환경 선택* 드롭다운 메뉴에서 UAT 환경을 선택합니다.

1. 백업 복원의 영향을 확인하려면 나타나는 확인란을 클릭합니다.

1. *환경*로 복원을 클릭합니다.

백업이 복원되는 동안 UAT Liferay 서비스를 일시적으로 사용할 수 없습니다. 완료되면 사이트를 다시 방문하여 홈페이지가 복원된 것을 확인할 수 있습니다.

다음: [Liferay Cloud 콘솔의](./using-the-liferay-services-shell.md) 을 사용하여 Liferay 데이터베이스를 직접 쿼리합니다.

## 관련 개념

* [백업 서비스](https://learn.liferay.com/web/guest/w/liferay-cloud/platform-services/backup-service/backup-service-overview)
* [백업에서 데이터 복원](https://learn.liferay.com/web/guest/w/liferay-cloud/platform-services/backup-service/restoring-data-from-a-backup)
* [Liferay Cloud 서비스에 로그인](https://learn.liferay.com/w/liferay-cloud/getting-started/logging-into-your-liferay-cloud-services)
