# 배포 및 프로덕션으로 승격

Kyle은 Liferay Cloud 개발 작업을 시작하면서 간단한 위젯 모듈을 배포하고 승격하여 첫 번째 전체 배포 프로세스를 진행합니다.

여기에서는 예제 위젯을 배포하고 테스트하여 전체 프로세스를 살펴보겠습니다.

## 새로운 코드 푸시

이러한 단계를 위해 Liferay Cloud 환경에 배포할 수 있는 새롭고 간단한 위젯이 포함된 예제 모듈을 다운로드하세요.

1. 프로젝트 저장소의 `liferay/` 디렉터리 내에서 명령 프롬프트를 엽니다.

1. 예제의 소스 코드를 다운로드하여 `모듈/` 폴더에 압축을 풉니다.

    ```bash
    curl https://resources.learn.liferay.com/courses/latest/en/cloud-administrator/cloud-development-lifecycle/liferay-e3v7.zip -O
    ```

    ```bash
    unzip liferay-e3v7.zip -d modules/
    ```

1. GitHub의 원격 저장소에 소스 코드를 커밋하고 푸시합니다.

    ```bash
    git add modules
    ```

    ```bash
    git commit -m "Add a simple module to push to production."
    ```

    ```bash
    git push origin [branch_name]
    ```

`인프라` 환경은 완료되면 Liferay Cloud 콘솔에서 배포할 수 있는 푸시를 통해 새 빌드를 생성합니다.

## UAT에 배포

다음으로 테스트를 위해 UAT 환경에 빌드를 배포합니다.

```{note}
UAT 또는 다른 '개발' 환경에 배포할지 여부는 구독 및 자체 워크플로에 따라 다릅니다. 자동 배포를 구성한 후에는 프로세스의 첫 번째 환경에 대한 수동 배포를 건너뛸 수 있습니다.
```

1. Liferay Cloud 콘솔에서 화면 상단의 **Builds** 을 클릭합니다.

1. 푸시에서 새 빌드를 찾아 **클릭합니다. 배포 대상...**

   ![빌드 페이지에서 빌드를 찾아 UAT에 배포하세요.](./deploying-and-promoting-to-production/images/01.png)

1. **환경** 드롭다운 메뉴에서 UAT 환경을 선택합니다.

1. 배포의 영향을 확인하려면 확인란을 클릭합니다.

   ![환경을 선택하고 확인란을 클릭하면 빌드 배포 버튼이 나타납니다.](./deploying-and-promoting-to-production/images/02.png)

1. **빌드** 배포를 클릭하세요.

UAT 환경의 서비스가 다시 시작되고, 백업되면 예제 모듈이 Liferay 인스턴스에 배포됩니다.

## UAT 환경에 액세스

그런 다음 새 위젯을 수동으로 테스트하여 올바르게 작동하는지 확인하세요.

1. `인프라` 환경으로 이동합니다.

1. 화면 왼쪽의 **설정** 을 클릭하세요.

1. **비밀** 탭을 선택합니다.

1. `lcp-secret-ci-customer-user` 비밀을 클릭합니다.

   ![lcp-secret-ci-customer-user 비밀에는 UAT 인스턴스에 액세스하는 데 필요한 사용자 이름이 있습니다.](./deploying-and-promoting-to-production/images/03.png)

1. **보기** 클릭하여 UAT 인스턴스에 로그인하는 데 필요한 비밀 값을 확인하세요.

   ![보기를 클릭하여 비밀 값을 보고 확인하세요.](deploying-and-promoting-to-production/images/04.png)

    ```{tip}
    기본 사용자 이름은 `customer`입니다.
    ```

1. 비밀 목록으로 돌아가려면 뒤로 화살표를 클릭하세요.

1. `lcp-secret-ci-customer-password` 비밀을 클릭합니다.

1. **보기** 클릭하면 비밀 값을 볼 수 있습니다. 값 자체를 클릭하여 클립보드에 복사할 수 있습니다.

1. UAT 환경으로 이동합니다.

1. 페이지 상단에서 **사이트** 방문을 클릭하세요.

1. 자격 증명을 묻는 메시지가 나타나면 각각 `lcp-secret-ci-customer-user` 및 `lcp-secret-ci-customer-password` 비밀에서 찾은 사용자 이름과 비밀번호를 입력합니다.

이제 UAT Liferay 인스턴스에 성공적으로 로그인하고 액세스했습니다.

## 승인 테스트

다음으로 새 위젯을 테스트하여 제대로 작동하는지 확인하세요.

1. 기본 [관리자 계정 소개](https://learn.liferay.com/web/guest/w/dxp/getting-started/introduction-to-the-admin-account) 로 로그인합니다.

1. 페이지 상단의 편집 아이콘( ![edit icon](../../images/icon-edit.png) )을 클릭하면 위젯 목록에 접근할 수 있습니다.

1. Fragments and Widgets 사이드바에서 **Widgets** 탭을 클릭하세요.

1. 아래로 스크롤하여 **Sample** 섹션을 확장하여 새 위젯인 **E3V7 Widget** 찾습니다.

    ![E3V7 위젯은 추가한 예제 모듈의 새 위젯입니다.](./deploying-and-promoting-to-production/images/05.png)

1. 페이지의 아무 곳이나 드래그하여 어떻게 보이는지 확인하세요. 예제 위젯은 간단한 텍스트를 표시합니다.

이제 위젯이 작동하는지 확인했으므로 계속해서 빌드를 프로덕션으로 승격하세요.

## 프로덕션에 배포

Kyle은 빌드를 프로덕션으로 승격시키기 전에 관리자인 Marcus의 승인을 받아야 합니다. 일단 승인되면 그는 계획된 다운타임 기간 동안 동일한 빌드를 프로덕션에 배포할 수 있습니다.

테스트 프로세스를 통과했으므로 이제 프로덕션에 빌드를 배포하세요.

1. Liferay Cloud 콘솔에서 **Builds** 을 클릭합니다.

1. 목록에서 이전과 동일한 빌드를 사용하여 **Deploy build to...** 클릭합니다.

1. **환경** 드롭다운 메뉴에서 프로덕션 환경을 선택합니다.

1. 배포의 영향을 확인하려면 확인란을 클릭합니다.

1. **빌드** 배포를 클릭하세요.

프로덕션 환경의 서비스는 빌드의 새로운 추가로 다시 시작됩니다. 서비스가 백업되면 프로덕션 환경의 Liferay 인스턴스를 방문하여 거기에도 나타나는 새 위젯을 확인할 수 있습니다.

다음: [자동 배포를 구성하고](./setting-up-automatic-deployment.md) 개발 작업 흐름 속도를 높입니다.

## 관련 개념

* [Liferay 클라우드 배포 워크플로 개요](https://learn.liferay.com/w/liferay-cloud/updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow)
* [Liferay 서비스에 배포](https://learn.liferay.com/w/liferay-cloud/using-the-liferay-dxp-service/deploying-to-the-liferay-service)
* [Liferay 클라우드 콘솔을 통한 변경 사항 배포](https://learn.liferay.com/w/liferay-cloud/updating-services-in-liferay-paas/deploying-changes-via-the-liferay-cloud-console)
* [Liferay 클라우드 서비스에 로그인](https://learn.liferay.com/w/liferay-cloud/getting-started/logging-into-your-liferay-cloud-services)
