# Liferay 소스 구축

이 섹션은 가능한 한 빨리 소스에서 Liferay Portal을 구축하기 위한 지침을 제공하는 것을 목표로 합니다. 야간 스냅샷 번들을 사용하면 더 이상 *과 모두* 을 사용하는 전체 빌드가 필요하지 않으므로 Liferay Portal을 구축할 때 많은 시간을 절약할 수 있습니다.

첫 번째 단계는 Liferay Portal을 구축하는 데 필요한 도구가 설치되어 있는지 확인하는 것입니다. Liferay Portal 구축에는 다음이 필요합니다.

* 아파치 개미
* Gradle
* 라이프레이 블레이드 CLI

## Liferay 포털 구축

다음 단계는 Github에서 *liferay-portal* repo를 포크하고 야간 스냅샷 번들을 사용하도록 빌드를 구성하는 것입니다.

소스에서 Liferay Portal을 구축하려면 다음을 수행하십시오.

* *liferay-binaries-cache-2020* repo를 복제하여 빌드 속도를 높입니다.

    ```
    git clone https://github.com/liferay/liferay-binaries-cache-2020 --branch master --single-branch --depth 1
    ```

* Github에서 liferay-portal 저장소 포크: https://github.com/liferay/liferay-portal
* 포크된 저장소의 마스터 브랜치를 복제합니다.

    ```
    git clone https://github.com/<github-username>/liferay-portal
    ```

* 변경 사항을 가져오기 위한 업스트림으로 기본 liferay-portal 저장소를 추가합니다.

    ```
    git remote add upstream https://github.com/liferay/liferay-portal
    ```

* liferay-portal 디렉토리에서 실행:

    ```
    ant compile install-portal-snapshots
    ant snapshot-bundle
    git checkout `cat ../bundles/.githash` -b my-custom-change
    ```

* 스냅샷 해시와 스냅샷을 동기화하려면 두 번째 실행:

    ```
    ant compile install-portal-snapshots
    ```

이제 Liferay 핵심 구성 요소를 빌드하고 스냅샷 번들에 배포할 수 있습니다.  핵심 구성 요소가 빌드된 경우 구성 요소가 핫 스왑 가능하지 않으므로 번들을 다시 시작해야 합니다.

* 핵심 프로젝트(portal-impl, Portal-kernel 등)를 빌드하려면 다음을 실행합니다.

    ```
    ant deploy
    ```

* *liferay-portal* 디렉토리에서 스냅샷 번들을 시작합니다.

    ```
    ../bundles/tomcat-9.0.17/bin/startup.sh | bat
    ```

이제 전체 플랫폼을 다시 컴파일하지 않고도 liferay-portal 내에서 모듈을 구축할 수 있습니다. 빌드 환경을 초기화하므로 모듈을 컴파일하기 전에 위의 단계를 완료해야 합니다.

* 모듈(portal-workflow-web, message-boards-web)을 빌드하려면 다음을 실행합니다.

    ```
    blade gw deploy
    ```

번들 로그에 다음 메시지가 표시되어야 합니다.

```
2019-05-20 20:25:08.613 INFO [fileinstall-/Users/jamie/Repos/bundles/osgi/portal][BundleStartStopLogger:42] STOPPED com.liferay.portal.workflow.web_3.0.0 [248]
```

```
2019-05-20 20:25:09.312 INFO [Refresh Thread: Equinox Container: a8a147ab-cda3-4184-b37e-17724c1005f4][BundleStartStopLogger:39] STARTED com.liferay.portal.workflow.web_3.0.0 [248]
```

## 변경하기

변경할 때 [JIRA](https://issues.liferay.com/secure/Dashboard.jspa) 에서 티켓을 만들고 모든 커밋 및 풀 요청 내에서 티켓 번호를 참조하여 시작하는 것이 가장 좋습니다.

## JIRA

다음을 수행하여 JIRA에서 티켓을 만듭니다.

* 구현하려는 기능, 개선 또는 버그 수정에 대한 진행 상황을 추적하려면 [JIRA 계정](https://issues.liferay.com/secure/Dashboard.jspa) 에 가입하세요. 지금부터 *건* 건이라고 하겠습니다.
* [문제에 대한 티켓](https://issues.liferay.com/secure/Dashboard.jspa) 을 제출하십시오. 티켓에 대해 아래 작업을 정의/완료해야 합니다.
* 문제를 명확하게 설명하십시오. 버그인 경우 재현 단계를 포함합니다.
* 문제에 적합한 카테고리를 선택합니다.
* 문제의 영향을 받는 제품의 가장 초기 버전을 선택하십시오.
* *Contribute Solution 버튼*을 클릭하여 표시되는 Contributor 라이선스 계약에 응답합니다.
* 문제에 대한 티켓이 이미 있는 경우 기존 티켓을 통해 참여하세요.

## Github

다음 프로세스를 사용하여 사용자 정의 변경 사항을 Github에 제출하십시오.

* JIRA에서 티켓에 대한 참조를 포함하여 작업의 논리적 단위를 커밋합니다. 예: `LPS-83432 CONTRIBUTING 명령형 및 구체적인 예를 작성하십시오.`
* 변경 사항을 철저히 테스트하십시오! Liferay Portal이 지원하는 다양한 운영 체제, 데이터베이스, 애플리케이션 서버 및 기타 관련 기술을 고려하십시오. 한 환경의 변경 사항이 다른 환경의 변경 사항에 영향을 미치지 않는지 확인하십시오.

분기를 Github의 포크로 푸시하기 전에 업스트림/마스터의 업데이트된 버전을 리베이스하는 것이 좋습니다.

* 마스터에서 최신 커밋을 가져옵니다.

    ```
    git fetch upstream
    ```

* 최신 스냅샷 번들 가져오기:

    ```
    ant snapshot-bundle
    ```

* 최신 스냅샷 리비전 기반 리베이스:

    ```
    git rebase `cat ../bundles/.githash`
    ```

* 브랜치의 변경 사항을 포크로 푸시합니다.

    ```
    git push origin my-custom-change
    ```

* 풀 요청을 liferay/liferay-portal 저장소에 제출하십시오.
* LPS 티켓에서 GitHub pull 요청에 대한 링크를 제공합니다.

끝났어! 글쎄요. 풀 리퀘스트가 종료될 때까지 풀 리퀘스트에 대한 의견과 질문에 반드시 응답해야 합니다.