# 처음으로 Liferay 실행

[Liferay DXP/Portal 설치](./installing-a-liferay-tomcat-bundle.md#installing) 및 [데이터베이스 구성](./configuring-a-database.md)을 완료하면 실행할 준비가 되었습니다.

## 서버 시작

1. 애플리케이션 서버와 함께 번들로 제공되는 시작 스크립트를 실행하십시오. Tomcat 번들 예: 

    ```bash
    ./liferay-dxp-version/tomcat-version/bin/startup.sh
    ```

    ```{note}
    기본적으로 DXP는 `[Liferay Home]/logs`에 로그 파일을 기록합니다.
    ```

    설정 마법사가 웹 브라우저의 `http://localhost:8080`에 나타납니다.
    
     ![시작 완료 시 DXP는 기본 구성 페이지를 표시하는 웹 브라우저를 시작합니다.](./running-liferay-for-the-first-time/images/01.png)

1. 포털의 **이름** , **기본 언어** 및 **시간대** 를 설정합니다.

1. **관리자 사용자** 이름, 성 및 이메일 주소를 설정합니다.

1. **데이터베이스** 섹션에서 **변경** 을 클릭하여 데이터베이스 양식을 표시하십시오. 

    ```{warning}
    프로덕션 등급 Liferay DXP 인스턴스에서 HSQL을 사용하지 마십시오.
    ```


![설치 마법사의 데이터베이스 양식을 사용하면 DXP용으로 생성한 데이터베이스를 지정할 수 있습니다.](./running-liferay-for-the-first-time/images/02.png)

1. 데이터베이스를 지정하십시오.

| 분야          | 묘사                                    |
|:----------- |:------------------------------------- |
| **데이터베이스 유형** | 연결할 데이터베이스 유형을 선택하십시오.                |
| **JDBC URL** | Liferay DXP용으로 만든 데이터베이스 경로를 업데이트합니다. |
| **사용자 이름** | 데이터베이스 사용자 이름                         |
| **암호** | 데이터베이스 사용자 비밀번호                       |


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6\. 관련 **샘플 데이터** : 프로덕션 등급 DXP 인스턴스를 생성하거나 데이터가 필요하지 않은 경우 샘플 데이터 필드를 선택하지 않은 상태로 둡니다. 샘플 데이터에는 데모용으로 사용자, 사이트 및 조직이 포함됩니다.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7\. **구성 완료** 을 클릭합니다.

설정 마법사는 [Liferay Home](../reference/liferay-home.md) 의 `portal-setup-wizard.properties` 파일에 구성 값을 저장합니다.

Liferay DXP Enterprise 구독이 있는 경우 DXP는 활성화 키를 요청합니다. [Liferay DXP](../setting-up-liferay/activating-liferay-dxp.md)활성화를 참조하십시오.

마지막으로 DXP는 서버를 다시 시작하라는 메시지를 표시합니다.

## 서버 다시 시작

애플리케이션 서버와 함께 번들로 제공되는 종료 및 시작 스크립트를 사용하여 서버를 다시 시작하십시오. Tomcat 예제 명령:

### 폐쇄

```bash
./liferay-dxp-version/tomcat-version/bin/shutdown.sh
```

### 시작

```bash
./liferay-dxp-version/tomcat-version/bin/startup.sh
```

DXP는 설치 마법사에서 지정한 데이터베이스 및 포털 구성 값을 사용하여 초기화합니다. DXP 홈 페이지는 `http://localhost:8080`에 나타납니다.

![DXP를 구성하고 서버를 다시 시작하면 DXP 홈 페이지가 나타나고 로그인할 준비가 된 것입니다!](./running-liferay-for-the-first-time/images/03.png)

축하합니다! 온프레미스 Liferay DXP 인스턴스를 시작했습니다.

## 다음 단계

관리자 사용자로 [로그인하고](../../getting-started/introduction-to-the-admin-account.md) /Portal에서 솔루션 구축을 시작할 수 있습니다. 또는 [개의 추가 설정](../setting-up-liferay.md) 항목을 탐색할 수 있습니다.

* [앱 설치 및 관리](../../system-administration/installing-and-managing-apps/installing-apps.md)
* [평가판 기간 동안 플러그인 액세스](../../system-administration/installing-and-managing-apps/installing-apps/accessing-ee-plugins-during-a-trial-period.md)
* [검색 엔진 설치](../../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine.md)
* [라이프레이 확보](../securing-liferay.md)
* [고가용성을 위한 클러스터링](../setting-up-liferay/clustering-for-high-availability.md)