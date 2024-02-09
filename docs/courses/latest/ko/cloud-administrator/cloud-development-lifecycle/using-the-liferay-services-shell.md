# Liferay Service의 셸 사용

때로는 무슨 일이 일어나고 있는지 확인하기 위해 시스템에 직접 액세스해야 하는 경우도 있습니다. Kyle은 Liferay 서비스의 셸을 사용하여 디렉터리 구조를 보고 데이터베이스 생성을 확인하려고 합니다.

여기에서는 셸을 사용하고 콘솔에서 Liferay 인스턴스의 데이터베이스를 직접 쿼리합니다.

## 셸에 액세스

서비스 페이지를 통해 Liferay 서비스의 셸에 액세스합니다.

1. Liferay Cloud 콘솔에서 UAT 환경으로 이동합니다.

1. 화면 왼쪽에서 **서비스** 클릭하세요.

1. **Liferay** 서비스를 클릭하세요.

1. **Shell** 탭을 클릭합니다.

1. Liferay 홈 디렉토리 내용을 보려면 쉘에 `ls` 입력하십시오.

    ![Liferay 홈 디렉터리에 있는 파일과 같이 셸을 통해 서비스의 파일을 직접 읽거나 수정합니다.](./using-the-liferay-services-shell/images/01.png)

```{note}
셸을 통해 Liferay 인스턴스에 대한 변경 사항은 영구적이지 않습니다. 다음에 서비스가 다시 시작되면 덮어쓰여집니다.
```

## MySQL 클라이언트 사용

다음으로 MySQL 클라이언트를 사용하여 Liferay 인스턴스의 데이터베이스를 확인하세요.

1. 기본 사용자로 MySQL 클라이언트에 로그인하려면 쉘에 `mysql` 입력하십시오.

    ```{note}
    기본 데이터베이스 사용자로 로그인하면 데이터베이스에 대한 읽기 전용 액세스가 제공됩니다. 데이터를 조작해야 하는 경우 [MySQL 클라이언트 사용](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/using-the-mysql-client#) 로그인하세요. 읽기 및 쓰기 권한으로 로그인).
    ```

1. `표시 테이블을 입력하십시오.` 스크롤할 수 있는 모든 기존 테이블 목록을 표시합니다.

    ![Liferay 데이터베이스의 모든 테이블을 보려면 show tables MySQL 명령을 사용하십시오.](./using-the-liferay-services-shell/images/02.png)

1. 모든 사이트에 걸쳐 [범주 및 태그로 콘텐츠 구성](https://learn.liferay.com/w/dxp/content-authoring-and-management/tags-and-categories/organizing-content-with-categories-and-tags) 목록을 보려면 다른 쿼리를 실행해 보세요.

    ```sql
    select vocabularyId, name, groupId from AssetVocabulary;
    ```

    ![기본 사용자를 사용하여 모든 어휘 보기와 같은 읽기 전용 MySQL 쿼리를 수행할 수 있습니다.](./using-the-liferay-services-shell/images/03.png)

1. 마지막으로 작업이 끝나면 MySQL 클라이언트에서 로그아웃합니다.

    ```sql
    quit
    ```

축하해요! Liferay 클라우드 관리자 과정을 완료하셨습니다.

[강좌로 돌아가기](../../index.md)

## 관련 개념

* [셸 액세스](https://learn.liferay.com/web/guest/w/liferay-cloud/troubleshooting/shell-access)
* [MySQL 클라이언트 사용](https://learn.liferay.com/web/guest/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/using-the-mysql-client)
