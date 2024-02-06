# 핫픽스 설치

Liferay 인스턴스를 최신 상태로 유지하는 것은 Liferay Cloud 유지 관리의 중요한 부분입니다. [Liferay의 다음 버전](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/updating-your-dxp) 에 문제가 나타나기 전에 문제를 패치해야 하는 경우 -instance-to-a-new-minor-version), 그러나 핫픽스를 배포할 수 있습니다. 핫픽스는 수정된 버전으로 업데이트할 준비가 될 때까지 이러한 문제를 해결하기 위해 Liferay 지원에서 제공하는 임시 솔루션입니다. 

여기에서는 Kyle에게 핫픽스를 요청하고 설치하는 과정을 안내합니다. 그는 핫픽스를 프로덕션 환경에 배포하고 테스트할 수 있도록 이미 사이트 가동 중지 시간을 예약했습니다. 

## 핫픽스 요청

Liferay DXP의 특정 문제에 대한 단기 수정이 필요한 경우 핫픽스를 요청하세요. 이는 최근 수정된 알려진 문제일 수도 있고 Liferay 인스턴스에서 발견한 새로운 문제일 수도 있습니다. 두 경우 모두 [Liferay's Help Center](https://help.liferay.com) 에 요청을 작성하세요.

![Liferay의 도움말 센터에서 티켓을 생성하여 핫픽스를 요청하세요.](./installing-a-hotfix/images/01.png)

새 티켓을 생성하면 Liferay 지원 직원이 티켓에 대해 응답하여 도움을 드릴 것입니다. 문제를 해결하기 위해 핫픽스가 필요한 경우 Liferay가 티켓에 핫픽스를 제공하는 과정을 안내해 드립니다.

핫픽스가 준비된 시기를 포함하여 Liferay 직원이 티켓을 업데이트할 때마다 이메일 업데이트를 받게 됩니다. 핫픽스를 다운로드할 준비가 되면 페이지의 링크 중 하나를 사용하여 생성한 티켓에서 핫픽스를 다운로드하세요.

![핫픽스가 포함된 댓글이나 티켓의 첨부 파일 목록을 통해 핫픽스를 다운로드하세요.](./installing-a-hotfix/images/02.png)

## 핫픽스를 사용하여 새 빌드 만들기

핫픽스가 있으면 이를 리포지토리에 커밋하고 새 CI 빌드에 푸시하세요.

1. 프로젝트 저장소에서 핫픽스를 `liferay/configs/common/patching/` 폴더에 복사합니다.
   
   UAT와 프로덕션 모두에 동일한 빌드를 사용하려면 핫픽스를 `common/` 폴더(모든 환경에 적용되도록)에 배치하세요.

1. 핫픽스를 저장소에 추가하고 커밋합니다. 

   ```bash
   git add .
   ```

   ```bash
   git commit -m "Install new hotfix for issue..."
   ```

1. 변경 사항을 적용하여 브랜치를 밀어 올리세요. 

   ```bash
   git push origin [branch_name]
   ```

Liferay Cloud는 변경 사항을 감지하고 배포할 수 있는 CI에 새 빌드를 생성합니다. 빌드가 완료될 때까지 몇 분 정도 기다립니다.

## 핫픽스 배포 및 테스트

프로덕션에 적용하기 전에 UAT 환경에서 핫픽스를 테스트하세요.

1. Cloud 콘솔의 화면 상단에서 **Builds** 을 클릭합니다.

1. 목록 상단의 새 빌드가 완료되면 **작업**( ![Actions menu](../../images/icon-actions.png) ) &rarr; **배포 대상...** 클릭합니다.
   
   ![먼저 핫픽스가 포함된 빌드를 UAT에 배포하세요.](./installing-a-hotfix/images/03.png)

1. 환경 선택 드롭다운 메뉴에서 UAT 환경을 선택합니다.

1. 변경 사항의 영향을 확인하려면 배포 확인 아래의 확인란을 선택하세요.

1. **빌드** 배포를 클릭하세요.
   
   UAT 환경의 서비스는 지연 후 핫픽스를 사용하여 다시 시작됩니다.

1. 서비스가 백업되어 실행되면 UAT Liferay 인스턴스에 로그인하고 문제를 테스트하여 핫픽스로 해결되었는지 확인하세요.

## 프로덕션에 배포

핫픽스가 올바르게 작동하는지 확인한 후 예약된 가동 중지 시간 동안 프로덕션 환경에 대해 배포 프로세스 [배포 프로세스](#deploy-and-test-the-hotfix) 반복합니다. 나중에 동일한 문제를 해결하는 Liferay 버전으로 업데이트할 때 핫픽스를 제거하는 것을 잊지 마십시오.

축하해요! 클라우드 관리자 과정의 자체 관리형 클라우드 구성 모듈을 완료했습니다.

다음: [클라우드 개발 수명주기](../cloud-development-lifecycle.md). 

## 관련 개념

* [Liferay 서비스에 배포](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/deploying-to-the-liferay-service)
* [DXP 인스턴스를 새 마이너 버전으로 업데이트](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/updating-your-dxp-instance-to-a-new-minor-version)
* [Liferay DXP 인스턴스 업그레이드](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/upgrading-your-liferay-dxp-instance)
