# Jenkins 단계 다시 시작

Jenkins 숨김을 보존하도록 CI 서비스를 구성할 수 있습니다. 그런 다음 스태시를 사용하여 Jenkins 빌드의 특정 단계를 다시 시작할 수 있습니다.

## Jenkins 보관 유지

다음 CI 서비스 변수를 사용하여 스태시 및 아티팩트가 보존되는 완료된 빌드 수를 판별하십시오.

* `LCP_CI_PRESERVE_STASHES_BUILD_COUNT`
* `LCP_CI_ARTIFACT_NUM_TO_KEEP`

다음 예에서 보관함은 마지막 3개 빌드에 대해 보존되고 아티팩트는 마지막 6개에 대해 보존됩니다.

![이러한 변수를 사용하여 어떤 아티팩트가 보존되는지 결정하십시오.](./restarting-jenkins-stages/images/01.png)

기본적으로 `LCP_CI_PRESERVE_STASHES_BUILD_COUNT` 값은 `20`으로 설정되고 `LCP_CI_ARTIFACT_NUM_TO_KEEP` 값은 `1`로 설정됩니다. 단계를 다시 시작하는 것이 중요하지 않은 경우 해당 값을 `0` 로 설정하여 CI가 숨김 또는 아티팩트를 유지하지 않도록 할 수 있습니다.

```{important}
`LCP_CI_PRESERVE_STASHES_BUILD_COUNT` 변수에 대해 설정된 빌드 수에 관계없이 `LCP_CI_ARTIFACT_NUM_TO_KEEP` 변수에서 허용하는 것보다 더 많은 빌드에 대해 스태시를 보존할 수 없습니다.
```

## Jenkins 단계를 다시 시작하는 방법

Jenkins 단계를 다시 시작하려면 다음 단계를 따르세요.

1. 프로젝트의 CI 서비스 페이지(예: `</em> <project>` *하여 프로젝트의 파이프라인을 봅니다.

   ```{note}
   파이프라인 단계는 표준 Jenkins 콘솔을 통해 다시 시작할 수 있지만 Open Blue Ocean 플러그인은 파이프라인 단계를 보거나 관리할 때 보다 명확하고 직관적인 사용자 경험을 제공합니다.
   ```
</p>

   ![프로젝트의 파이프라인을 보려면 Open Blue Ocean 플러그인을 클릭하십시오.](./restarting-jenkins-stages/images/02.png)</li>

1

원하는 파이프라인을 선택하고 원하는 빌드를 클릭합니다.

   ![다시 시작하려는 단계가 있는 빌드를 클릭합니다.](./restarting-jenkins-stages/images/03.png)

1

원하는 단계를 선택하고 **다시 시작** 을 클릭합니다.

   ![원하는 단계를 선택하고 다시 시작을 클릭합니다.](./restarting-jenkins-stages/images/04.png)

   이렇게 하면 선택한 단계에서 시작하는 새로운 Jenkins 실행이 시작되고 기반이 되는 실행과 동일한 PR 및 커밋 정보가 있습니다. 이전 실행과 다시 시작된 단계의 이름을 식별하는 새 설명이 자동으로 생성됩니다. 탐색 표시줄의 왼쪽 상단에 있는 이동 경로 탐색 버튼을 사용하여 이전 실행으로 빠르게 돌아갈 수 있습니다.

   ![이렇게 하면 선택한 빌드를 기반으로 새 빌드가 실행됩니다.](./restarting-jenkins-stages/images/05.png)</ol>

## 관련 주제

* [지속적인 통합](../platform-services/continuous-integration.md)
* [Liferay 클라우드 배포 워크플로 개요](./overview-of-the-liferay-cloud-deployment-workflow.md)
* [CLI 도구를 통해 변경 사항 배포](./deploying-changes-via-the-cli-tool.md)
