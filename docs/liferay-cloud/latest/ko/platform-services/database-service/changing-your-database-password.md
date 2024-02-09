# 데이터베이스 암호 변경

[`데이터베이스` 서비스](./database-service.md) 의 MySQL 암호를 변경하면 데이터베이스에 연결해야 하는 다른 서비스에도 영향을 미칩니다.

```{warning}
데이터베이스 암호를 업데이트하려면 데이터베이스 서비스에 대한 백업을 복원한 다음 모든 서비스를 다시 시작하기 위한 중단 시간이 필요합니다. 데이터베이스 암호를 교체하기 전에 이를 위한 시간을 미리 계획하십시오.
```

## 백업 생성

프로덕션 환경의 암호를 변경하는 경우 업데이트 후 복원할 수 있도록 최신 백업이 있는지 확인해야 합니다.

모든 환경에 대한 백업을 생성하려면 왼쪽 메뉴에서 **백업** 을 클릭합니다.

![선택한 환경의 백업 페이지로 이동합니다.](./changing-your-database-password/images/01.png)

그런 다음 **백업** 페이지에서 **지금 백업** 을 클릭합니다.

![지금 백업을 클릭하여 새 백업을 만듭니다.](./changing-your-database-password/images/02.png)

## 데이터베이스 암호 변경

데이터베이스 암호는 선택한 환경 내에서 [secrets](../../tuning-security-settings/managing-secure-environment-variables-with-secrets.md) 기능을 사용하여 직접 변경됩니다. 그러나 데이터베이스 암호 시크릿의 경우 서비스가 새 값으로 올바르게 업데이트되도록 추가 단계를 따라야 합니다.

<!-- Mention required service versions, and link to possible section on the procedure for 3.x services -->

준비가 되면 다음 단계에 따라 데이터베이스 비밀번호를 변경하십시오.

1. 선택한 환경으로 이동합니다.

1. 왼쪽 메뉴에서 **설정** 을 클릭합니다.

    ![환경의 설정 페이지로 이동합니다.](./changing-your-database-password/images/03.png)

1. **비밀** 섹션에서 `lcp-secret-database-password` 비밀 옆에 있는 작업 메뉴에서 **편집...** 을 클릭합니다.

    ![lcp-secret-database-password 시크릿을 편집하십시오.](./changing-your-database-password/images/04.png)

1. **값** 섹션에서 값 옆에 있는 **표시** 을 클릭하여 암호를 표시하고 편집을 활성화합니다.

    ![편집할 수 있도록 비밀을 표시합니다.](./changing-your-database-password/images/05.png)

1. 암호 값을 편집합니다.

1. 아래로 스크롤하여 암호 값 변경의 영향을 확인하는 모든 상자를 선택합니다.

    ![Publish secret 버튼을 활성화하려면 확인란을 선택합니다.](./changing-your-database-password/images/06.png)

1. **공개 비밀** 을 클릭하십시오.

    ```{note}
    '비밀 게시'를 클릭하면 서비스가 다시 시작됩니다. 그러나 데이터베이스 서비스는 이미지 생성 시에만 암호를 업데이트할 수 있으므로 업데이트하려면 서비스를 삭제하고 다시 배포해야 합니다.
    ```

1. 환경의 **서비스** 페이지로 돌아갑니다.

1. `데이터베이스` 서비스에 대한 조치 메뉴에서 **서비스 삭제** 을 클릭하십시오.

    ![재배포할 수 있도록 서비스를 삭제하고 업데이트된 암호로 시작할 수 있습니다.](./changing-your-database-password/images/07.png)

1. 리포지토리의 로컬 복제본 내에서 명령 프롬프트를 엽니다.

1. [명령줄 인터페이스](../../reference/command-line-tool.md)을 사용하여 `데이터베이스` 서비스를 환경에 배포합니다.

    ```bash
    cd database
    ```

    ```bash
    lcp deploy
    ```

1. 아직 로그인하지 않은 경우 프롬프트에 `y` 을 입력하고 브라우저에서 인증합니다.

1. 메시지가 표시되면 환경에 해당하는 번호를 입력합니다.

    ```bash
    #      Project             Status
    1      lfrlearn-infra      Ready
    2      lfrlearn-uat        Ready
    3      lfrlearn-dev        Ready
    4      lfrlearn-prd        Ready

    ? Type a number (#) or project name: 2
    ```

    업데이트된 암호를 사용하여 데이터베이스 서비스가 시작됩니다. `liferay` 및 `backup` 서비스도 올바른 암호로 데이터베이스 서비스에 다시 연결하기 위해 다시 시작됩니다.

1. [백업을 준비](#creating-a-backup) 한 경우 선택한 환경의 백업 페이지로 이동하여 [백업을 복원](../backup-service/restoring-data-from-a-backup .md).
   
   이제 `데이터베이스` 서비스가 새 암호로 업데이트되고 다른 서비스가 동기화되어 제대로 연결됩니다.

## 관련 주제

* [데이터베이스 서비스](./database-service.md)
* [데이터베이스 사용자 이름 변경](./changing-your-database-username.md)
* [보안 비밀로 보안 환경 변수 관리](../../tuning-security-settings/managing-secure-environment-variables-with-secrets.md)