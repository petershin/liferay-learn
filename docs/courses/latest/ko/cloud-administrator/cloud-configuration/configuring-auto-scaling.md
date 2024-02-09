# 자동 크기 조정 구성

원하는 수의 노드로 프로덕션 환경 클러스터링을 활성화한 후에는 피크 시간 동안 사이트 트래픽을 더 잘 처리하도록 자동 크기 조정을 구성할 수 있습니다.

다음 단계에 따라 Marcus가 자동 크기 조정을 구성하도록 도와주세요.

```{important}
Auto Scaling을 통해 자동으로 추가된 인스턴스의 사용량을 기준으로 분기별로 요금이 청구됩니다. 이러한 추가 인스턴스의 요금에 대한 자세한 내용은 Liferay 계정 관리자에게 문의하세요.
```

## 콘솔에서 Auto Scaling 활성화

Liferay Cloud 콘솔을 사용하여 프로덕션 환경에 맞게 자동 크기 조정을 활성화합니다.

1. Liferay Cloud 콘솔에서 프로덕션 환경으로 이동합니다.

1. **서비스** &rarr; **Liferay** 로 이동합니다.

1. **스케일** 탭을 선택합니다.

   ![Liferay 서비스 내의 확장 탭에는 사용 중인 인스턴스 수와 자동 크기 조정을 활성화 또는 비활성화하는 컨트롤이 표시됩니다.](./configuring-auto-scaling/images/01.png)

1. **Auto Scaling 활성화** 클릭합니다.

이제 자동 크기 조정이 활성화되었습니다. 클러스터링 구성으로 인해 최소 2개의 노드가 있으며, 사용량이 증가하면 기본 최대값인 10개까지 더 많은 노드가 추가됩니다.

## 최대 인스턴스 수 설정

피크 시간에 여러 번 반복한 결과 Delectable Bonsai의 웹 사이트에는 기본 10개 이상의 Liferay 인스턴스가 필요한 것으로 나타났습니다. Marcus가 자동 크기 조정 최대값을 10에서 12로 재구성하도록 도와주세요.

Liferay 서비스의 `LCP.json` 파일에서 `maxInstances` 속성을 통해 최대 인스턴스 수를 설정합니다.

1. 프로젝트 리포지토리에서 `liferay/` 디렉터리로 이동하여 `LCP.json` 파일을 엽니다.

1. `자동 크기 조정` JSON 개체 내에서 `maxInstances` 값을 12로 설정합니다.

   ```json
    "autoscale": {
        "maxInstances": 12
    }
   ```

1. Git 리포지토리에 변경 사항을 커밋하고 푸시합니다.

   ```bash
   git add liferay/LCP.json
   ```

   ```bash
   git commit -m "Increase the maximum number of instances to 12."
   ```

   ```bash
   git push origin [branch_name]
   ```

이제 GitHub의 리포지토리에 최대 인스턴스 수가 업데이트되었으며 Liferay Cloud는 변경 사항을 적용하여 새 빌드를 생성합니다.

## 구성 배포

업데이트된 구성을 프로덕션 환경에 배포합니다.

1. Liferay Cloud 콘솔에 로그인합니다.

1. 빌드 페이지에 액세스하려면 화면 오른쪽 상단에 있는 **빌드** 링크를 클릭하세요.

1. 새 변경 사항이 포함된 커밋에 해당하는 빌드에 대해 작업 메뉴 ![Actions menu icon](../../images/icon-actions.png) 을 클릭하고 **빌드 배포...를 선택합니다**

   ![빌드 페이지에서 커밋 메시지와 함께 배포할 빌드를 선택하세요.](./configuring-auto-scaling/images/02.png)

1. **환경** 드롭다운 메뉴에서 프로덕션 환경을 선택합니다.

1. 배포의 영향을 확인하는 확인란을 선택합니다.

   ![프로덕션 환경을 선택하고 양식을 작성하여 빌드를 배포합니다.](./configuring-auto-scaling/images/03.png)

1. **빌드** 배포를 클릭하세요.

서비스가 다시 시작되면 최대 12개의 인스턴스까지 자동 확장이 활성화됩니다.

다음: [데이터베이스 서비스의 비밀번호를 변경하세요.](./rotating-your-database-password.md).

## 관련 개념

* [자동 확장](https://learn.liferay.com/w/liferay-cloud/manage-and-optimize/auto-scaling)
* [Liferay 서비스에 배포](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/deploying-to-the-liferay-service)
* [Liferay 클라우드 콘솔을 통한 변경 사항 배포](https://learn.liferay.com/w/liferay-cloud/updating-services-in-liferay-paas/deploying-changes-via-the-liferay-cloud-console)
