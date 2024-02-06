# 자동 배포 설정

Kyle은 Liferay Cloud를 사용하여 개발 및 테스트를 시작할 수 있지만 배포 후 즉시 변경 사항을 테스트할 수 있으면 더 쉽습니다.

여기에서는 새로 푸시된 변경 사항을 UAT 환경에 자동으로 배포하도록 분기를 구성합니다.

## 구성 추가

`LCP_CI_DEPLOY_BRANCH` 및 `LCP_CI_DEPLOY_TARGET` CI 서비스 환경 변수를 통해 자동 배포를 구성합니다.

1. Liferay Cloud 콘솔에서 `infra` 환경으로 이동합니다.

1. CI 서비스를 클릭하세요.

1. **환경 변수** 탭을 클릭합니다.

1. 다음 환경 변수 값을 설정합니다.

   * **LCP_CI_DEPLOY_BRANCH** : `실시간 업데이트`

   * **LCP_CI_DEPLOY_TARGET** : `uat`

   ![이러한 환경 변수를 사용하여 CI에 자동 배포를 위한 지점 및 대상 환경을 알립니다.](./setting-up-automatic-deployment/images/01.png)

1. **변경 사항 저장** 클릭합니다.

CI 서비스가 새 구성으로 다시 시작됩니다. 백업이 완료되면 해당 시점부터 `live-update` 분기를 통해 생성된 빌드가 UAT 환경에 자동으로 배포됩니다.

## 새로운 푸시로 테스트

다음으로 커밋을 수행하고 자동 배포가 제대로 작동하는지 테스트합니다.

1. 프로젝트 저장소에서 명령 프롬프트를 엽니다.

1. `live-update`이라는 새 분기를 만들고 전환합니다. 이 분기를 사용하여 UAT에 푸시하는 모든 새로운 개발을 즉시 배포합니다.

   ```bash
   git checkout -b live-update
   ```

1. 새 빌드를 트리거하려면 더미 파일을 추가하고 커밋하세요.

   ```bash
   touch dummy.txt
   ```

   ```bash
   git add dummy.txt
   ```

   ```bash
   git commit -m "First automatic deployment"
   ```

1. 원격 `live-update` 분기에 변경 사항을 푸시합니다.

   ```bash
   git push origin live-update
   ```

1. Liferay Cloud 콘솔로 돌아가서 **배포** 클릭합니다.

   ![UAT 환경에 대한 배포 목록에 새 푸시가 나타납니다.](./setting-up-automatic-deployment/images/02.png)

UAT 환경에 배포된 새 커밋이 배포 목록에 나타납니다.

이제 테스트를 위해 리포지토리에서 바로 새로운 개발이나 변경 사항을 배포할 수 있습니다.

다음: [개발의 변경 사항을 되돌리기 위해 백업을 사용하는 연습](./restoring-data-from-a-backup.md).

# 관련 개념

* [CI 서비스 빌드 자동 배포](https://learn.liferay.com/w/liferay-cloud/updating-services-in-liferay-paas/automatically-deploying-ci-service-builds)
