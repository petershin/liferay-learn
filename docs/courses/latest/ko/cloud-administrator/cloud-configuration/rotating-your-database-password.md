# 데이터베이스 비밀번호 교체

Delectable Bonsai의 데이터베이스 보안 정책은 최소한 90일마다 비밀번호를 교체하는 것입니다.

여기에서는 프로덕션 환경에서 데이터베이스 비밀번호를 변경합니다.

```{important}
데이터베이스 자격 증명을 변경하려면 환경의 서비스를 다시 시작해야 하므로 라이브 프로덕션 환경에 대해 예정된 가동 중지 기간이 필요합니다.
```

## 수동 백업 생성

데이터베이스 자격 증명을 변경하기 전에 업데이트 후 복원할 수 있도록 수동 백업을 생성하십시오.

1. Liferay Cloud 콘솔에서 프로덕션 환경으로 이동합니다.

1. **백업** 을 클릭합니다.

1. 백업 페이지에서 **지금 백업** 클릭합니다.

   ![나중에 복원할 수 있는 수동 백업을 생성하려면 지금 백업을 클릭합니다.](./rotating-your-database-password/images/01.png)

백업이 생성되는 동안에는 백업 서비스 제어를 일시적으로 사용할 수 없습니다. 계속하기 전에 백업이 완료될 때까지 기다리십시오.

```{warning}
이 단계를 건너뛰지 마세요! 계속하기 전에 백업을 생성해야 합니다. 데이터베이스 비밀번호를 변경하려면 데이터베이스 서비스를 삭제하고 다시 만든 다음 데이터를 복원해야 합니다. 먼저 백업을 생성하지 않으면 모든 데이터가 손실됩니다. 
```

## 데이터베이스 비밀번호 변경

다음으로 데이터베이스 비밀번호를 변경합니다.

1. 화면 왼쪽의 **설정** 을 클릭하세요.

1. 설정 화면에서 **비밀** 탭을 선택하세요.

1. `lcp-secret-database-password` 비밀에 대한 행을 클릭합니다.

   ![이 시크릿을 관리하는 페이지에 액세스하려면 lcp-secret-database-password 시크릿을 클릭하십시오.](./rotating-your-database-password/images/02.png)

1. 화면 오른쪽 상단에 있는 **편집** 클릭하세요.

   ![비밀 값을 변경하려면 편집을 클릭하세요.](./rotating-your-database-password/images/03.png)

1. 비밀 편집 페이지의 **값** 아래에서 ** 표시를 클릭하여 비밀을 표시하고 값을 새 데이터베이스 비밀번호로 변경합니다.

   ```{tip}
   보안 강화를 위해 강력한 비밀번호를 사용하도록 선택하세요. 암호는 필요할 때 환경 관리자가 비밀 페이지에서 검색할 수 있으므로 쉽게 기억할 필요가 없습니다.
   ```

1. 변경 사항의 영향을 확인하려면 페이지 하단에 있는 **Publish secret** 아래의 확인란을 선택하세요.

1. **변경 사항 게시** 클릭하세요.

비밀 값이 변경되었지만 데이터베이스 서비스가 아직 새 비밀번호를 사용하고 있지 않습니다.

## 데이터베이스 서비스 삭제 및 배포

새 비밀번호를 적용하려면 데이터베이스 서비스를 삭제하고 다시 배포하세요. 먼저 데이터를 백업했는지 확인하세요!

1. 화면 왼쪽에서 **서비스** 클릭하세요.

1. 데이터베이스 서비스에 대해 **작업**( ![Actions icon](../../images/icon-actions.png) )을 클릭하고 **서비스 삭제** 클릭합니다.

   ![비밀번호 변경 사항을 적용하려면 데이터베이스 서비스를 삭제해야 합니다.](./rotating-your-database-password/images/04.png)

1. **삭제 확인** 아래의 확인란을 클릭하여 삭제의 영향을 확인합니다.

   ![체크박스를 모두 체크하면 서비스 삭제 버튼이 나타납니다.](./rotating-your-database-password/images/05.png)

1. **서비스 삭제** 클릭하십시오.

1. 화면 상단에서 **Builds** 을 클릭하세요.

1. 최신 빌드에 대해 **Actions** ![Actions icon](../../images/icon-actions.png) 를 클릭하고 **Deploy build to...** 를 클릭합니다.

1. **환경** 드롭다운 메뉴에서 프로덕션 환경을 선택합니다.

1. **배포 확인** 아래의 확인란을 클릭하여 배포의 영향을 확인합니다.

   ![모든 확인란을 클릭하면 빌드 배포 버튼이 나타납니다.](./rotating-your-database-password/images/06.png)

1. **빌드** 배포를 클릭하세요.

프로덕션 환경의 서비스가 다시 시작되고, 백업되면 새 데이터베이스 비밀번호를 사용합니다.

## 백업 복원

서비스가 다시 시작되어 실행되면( `Ready` 상태) 이전에 생성한 백업을 복원합니다.

1. Liferay Cloud 콘솔에서 프로덕션 환경으로 다시 이동합니다.

1. 화면 왼쪽에서 **백업** 클릭합니다.

1. 이전에 생성한 수동 백업에 대해 **작업**( ![Actions icon](../../images/icon-actions.png) )을 클릭하고 **다음으로 복원...을 클릭합니다**

   ![데이터베이스 서비스가 백업되어 실행된 후 백업을 복원하십시오.](./rotating-your-database-password/images/07.png)

1. **환경 선택** 드롭다운 메뉴에서 프로덕션 환경을 선택합니다.

1. 복원 프로세스의 영향을 확인하려면 확인란을 클릭합니다.

   ![확인란을 선택하고 백업 복원을 완료합니다.](./rotating-your-database-password/images/08.png)

1. **환경** 로 복원을 클릭합니다.

프로덕션 환경의 서비스가 다시 시작되고, 백업되면 데이터베이스를 사용하는 모든 서비스가 새 비밀번호를 사용합니다.

다음: [핫픽스 설치](./installing-a-hotfix.md) 프로세스를 진행합니다.

## 관련 개념

* [데이터베이스 암호 변경](https://learn.liferay.com/web/guest/w/liferay-cloud/platform-services/database-service/changing-your-database-password)
* [데이터베이스 사용자 이름 변경](https://learn.liferay.com/web/guest/w/liferay-cloud/platform-services/database-service/changing-your-database-username)
* [데이터베이스 서비스(MySQL)](https://learn.liferay.com/web/guest/w/liferay-cloud/platform-services/database-service/database-service)
* [환경 변수 정의](https://learn.liferay.com/w/liferay-cloud/reference/defining-environment-variables)
* [보안 비밀로 보안 환경 변수 관리](https://learn.liferay.com/w/liferay-cloud/tuning-security-settings/managing-secure-environment-variables-with-secrets)
