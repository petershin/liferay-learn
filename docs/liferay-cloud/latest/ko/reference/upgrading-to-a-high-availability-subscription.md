# 고가용성 구독으로 업그레이드

대부분의 경우 Liferay Cloud의 표준 구독 계획은 라이브 프로젝트의 품질 성능을 보장하기에 충분합니다. 요구 사항이 변경되면 구독 계획을 업그레이드하여 환경에 할당된 리소스를 늘려야 할 수 있습니다.

![표준 Liferay Cloud 구독이 포함된 생산 환경.](./upgrading-to-a-high-availability-subscription/images/01.png)

고가용성 구독으로 업그레이드하면 환경에 할당된 리소스의 양이 늘어나 Dynatrace 통합을 사용하고 `liferay`, `webserver`및 `search` 서비스의 인스턴스 수를 늘릴 수 있습니다.

![고가용성 구독이 있는 프로덕션 환경.](./upgrading-to-a-high-availability-subscription/images/02.png)

이 추가 인프라를 활용하려면 다음 단계를 수행해야 합니다.

## 계정 관리자와 커뮤니케이션

Liferay Cloud 구독을 업그레이드하는 첫 번째 단계는 계정 관리자와 통신하는 것입니다. 계정을 업그레이드하면 Liferay Cloud 팀이 프로젝트에서 사용할 수 있는 리소스를 늘립니다.

추가 리소스가 프로비저닝되면 서비스 구성을 업데이트해야 합니다. 이를 위해서는 `liferay`, `webserver`및 `search` 서비스에 대한 구성 업데이트가 필요합니다.

## Liferay 서비스 구성

먼저 환경에서 사용하는 인스턴스 수를 늘리도록 `liferay` 서비스를 구성합니다. Liferay Cloud [프로젝트 리포지토리](../getting-started/configuring-your-github-repository.md)'s `liferay/LCP.json` 파일에서 `척도` 속성 값을 1씩 증가시킵니다(일반적으로 고가용성 구독으로 업그레이드할 때 `1` 에서 `2` 까지).

```
{
    "종류": "배포",
    "id": "liferay",
    "image": "liferaycloud/liferay-dxp:7.2-4.2.1",
    "memory": 8192,
    "cpu": 8,
    "스케일": 2,
...
}
```

### Dynatrace 통합 활성화

고가용성 구독에는 `liferay` 서비스와 Dynatrace 통합을 사용할 수 있는 추가 기능도 포함되어 있습니다. 프로덕션 환경에서 이 기능을 활용하려면 `liferay` 서비스를 구성하는 추가 단계를 수행해야 합니다.

Liferay Cloud 팀은 구독을 업그레이드할 때 이 구성에 사용할 `테넌트` 값을 제공합니다. 이 `테넌트` 값을 사용하여 여기에 나열된 단계 [를 완료하십시오](../tuning-security-settings/managing-secure-environment-variables-with-secrets.md#integrating-dynatrace-with-production-environments) .

## 웹 서버 서비스 구성

그런 다음 환경에서 사용하는 인스턴스 수를 늘리도록 `webserver` 서비스를 구성합니다. `liferay` 서비스에 사용되는 인스턴스 수와 일치하도록 프로젝트 리포지토리의 `webserver/LCP.json` 파일에서 `scale` 속성을 늘립니다.

```
{
    "종류": "배포",
    "id": "웹 서버",
    "이미지": "liferaycloud/nginx:1.16.1-4.1.1",
    "메모리": 512,
    "cpu": 2,
    "스케일": 2,
...
}
```

## 검색 서비스 구성

마지막으로 프로젝트 리포지토리의 `search/LCP.json` 파일에서 `scale` 속성을 늘려 사용하는 인스턴스 수를 늘리도록 `search` 서비스를 업데이트합니다. 서비스 시작 문제를 방지하기 위해 값을 다음 홀수 인스턴스 수로 증가시킵니다(일반적으로 고가용성 구독으로 업그레이드할 때 `1` 에서 `3` 까지).

```
{
    "종류": "StatefulSet",
    "id": "검색",
    "이미지": "liferaycloud/elasticsearch:6.8.13-4.1.1",
    "메모리": 8192,
    "cpu": 8,
    "규모": 3,
    "podManagementPolicy": "병렬",
...
}
```

```{warning}
`search` 서비스의 인스턴스가 서로 제대로 연결될 수 있도록 `scale` 속성을 홀수 노드로 늘리고 `podManagementPolicy` 속성이 `Parallel`로 설정되었는지 확인합니다.
```

## 변경 사항 배포

모든 서비스를 구성했으면 프로덕션 및 [환경에 새 구성을 배포](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md#deploy) . Liferay Cloud에 변경 사항을 배포하는 데 익숙하지 않은 경우 다음 단계를 예로 검토할 수 있습니다.

### 변경 사항으로 Jenkins 빌드 생성

Git 명령을 실행하여 Git이 설치된 터미널을 사용하여 변경 사항을 제출하십시오.

1. 변경된 파일을 Git에 추가합니다.

    ```bash
    git add .
    ```

1. 변경 사항과 메시지를 커밋합니다.

    ```bash
    git commit -m "Liferay Cloud High Availability subscription upgrade"
    ```

1. GitHub(또는 기타)에 변경 사항을 푸시합니다.

    ```bash
    git push origin master
    ```

변경 사항을 푸시하면 빌드가 자동으로 생성됩니다. 진행하기 전에 빌드가 완료될 때까지 기다리십시오.

### 환경에 빌드 배포

마지막으로 [Liferay Cloud 콘솔](https://console.liferay.cloud/login) 을 사용하여 완성된 빌드를 해당 환경에 배포합니다.

1. Liferay Cloud 콘솔에서 빌드 페이지로 이동합니다(페이지 상단의 링크 사용).

1. 목록에서 이전에 생성한 빌드를 찾고 작업 메뉴에서 **Deploy build to** 을 클릭합니다.

    ![빌드의 작업 메뉴를 사용하여 배포합니다.](./upgrading-to-a-high-availability-subscription/images/03.png)

1. 빌드를 배포할 환경을 선택합니다(예: `acme-uat`).

1. 아래 정보를 읽고 확인 상자를 선택하여 배포 결과를 확인합니다.

    ![확인란을 선택하고 준비가 되면 빌드를 배포합니다.](./upgrading-to-a-high-availability-subscription/images/04.png)

1. **빌드** 배포 를 클릭합니다.

빌드가 환경에 배포되고 구성한 추가 인스턴스로 서비스가 다시 시작됩니다.

## 결론

축하합니다! 이 단계를 완료하면 환경이 고가용성 모델로 완전히 업그레이드됩니다. 이러한 환경에는 사용자의 요구 사항을 충족하는 더 많은 리소스와 기능이 있습니다.
