---
uuid: a047c502-cf80-4e98-811a-8858ae5c9bc6
---

# DXP 패치 코드 액세스

> 가입자

Liferay DXP 수정 팩 및 핫픽스 소스 코드는 `liferay-dxp`이라는 개인 GitHub 리포지토리에서 사용할 수 있습니다. 소스 코드는 프로젝트 또는 사용자 지정 코드에 영향을 미칠 수 있는 변경 사항을 식별하고 이해하는 데 도움이 됩니다. 수정 팩 및 핫픽스에는 GitHub에서 액세스할 수 있는 태그가 있습니다.

![수정 팩 및 핫픽스 태그.](./accessing-dxp-patch-code/images/01.png)

```{note}
수정 팩은 각각의 DXP 버전 브랜치(예: `7.0.x`, `7.1.x`, `7.2.x`, `7.3.x`)에 태그가 지정됩니다. 핫픽스에는 분기 헤드에 태그가 지정된 자체 분기가 있습니다. 핫픽스 브랜치 헤드와 핫픽스 태그의 코드가 동일하므로 브랜치나 태그를 가져오는 것은 동일한 코드에 액세스합니다.
```

코드로 수행할 수 있는 작업은 다음과 같습니다.

* diff를 통해 변경된 파일을 검사합니다.
* 다른 패치의 코드 비교
* 패치 구현 보기
* 컴퓨터에 코드 다운로드 또는 복제

아래 그림은 두 핫픽스 간의 파일 차이점을 보여줍니다.

![태그 비교.](./accessing-dxp-patch-code/images/02.png)

```{note}
Liferay DXP 7.0 및 7.1 패치 소스 코드에 대해 태그가 지정된 분기는 다음 수정 팩 기준선에서 사용할 수 있습니다. 

* Liferay DXP 7.1 수정 팩 19
* Liferay DXP 7.0 수정 팩 96
```

Liferay DXP 소스 코드 사용자 정의가 지원되지 않기 때문에 빌드 파일은 소스 코드에서 제외됩니다. Liferay DXP의 확장 지점은 유일하게 지원되는 사용자 정의 방법입니다.

* 새로운 확장 지점이나 새로운 기능을 원하시면 [JIRA](https://issues.liferay.com)에서 기능 요청을 제출하십시오.
* Liferay DXP를 사용자 지정하거나 기능을 요청하는 데 도움이 필요한 경우 계정 담당자 또는 고객 경험 관리자에게 문의하십시오.

```{note}
이전 Patching Tool 소스 모드 명령 `diff` 및 `store`는 DXP 7.3+에서 사용할 수 없습니다. 직접 교체하지 않고 제거되었습니다. 이전 DXP 버전에서 DXP 소스 코드를 패치하고 DXP 7.3+로 업그레이드하는 경우 새 DXP 소스 코드를 검토하고 적응하십시오.
```

## 리포지토리 액세스 요청

<https://github.com/liferay/liferay-dxp> 의 GitHub 리포지토리에 있는 DXP 소스 코드는 비공개이며 구독자 전용입니다. 저장소 액세스를 요청하는 방법은 다음과 같습니다.

1. 도움말 센터에서 [프로젝트](https://customer.liferay.com/project-details?_ga=2.57624622.528260345.1619731014-1356934316.1588162379) 페이지로 이동합니다.
1. DXP 프로젝트를 선택합니다.
1. *소스 코드 액세스* 탭을 선택합니다.
1. "+" 버튼을 클릭합니다. 소스 코드 액세스 양식이 나타납니다.
1. 요청된 정보를 입력하고 사람의 이름과 성을 포함해야 합니다.
1. *제출*클릭합니다.

```{note}
다른 프로젝트 팀 구성원을 대신하여 액세스 요청을 제출할 수 있습니다.
```

요청이 승인되면 저장소 액세스 초대 이메일을 받게 됩니다. 초대장을 분실한 경우 GitHub( <https://github.com/liferay/liferay-dxp/invitations>에서 액세스하십시오.

```{note}
요청은 접수된 순서대로 최대한 빨리 처리됩니다. 요청량이 많으면 요청을 즉시 처리하지 못할 수 있습니다.
```

리포지토리 액세스 승인은 *읽기* 수준 권한을 부여합니다. 수행할 수 있는 작업은 다음과 같습니다.

* 저장소에서 가져오기
* 저장소 포크
* 게시된 릴리스 보기

액세스는 Liferay DXP 구독 기간 동안 유지됩니다.

```{warning}
초대는 7일 동안 활성 상태로 유지되며 팀 구성원이 더 이상 프로젝트 세부 정보 페이지에 나열되지 않는 경우에도 수락할 수 있습니다. 예를 들어 GitHub 사용자 이름이 잘못 입력된 경우 누군가의 것이므로 해당 사용자는 임시로 저장소에 액세스할 수 있습니다. 이를 방지하기 위해 시스템은 활성 Liferay 프로젝트에 속하지 않은 새로운 리포지토리 공동 작업자를 매주 확인하고 해당 액세스를 자동으로 취소합니다.
```

```{important}
GitHub 사용자 이름이 변경되면 리포지토리 액세스가 무효화됩니다. 사용자 이름을 변경하는 경우 [해당 사용자의 접근권한을 제거](#removing-access)한 후 새로운 GitHub 사용자 이름으로 접근 권한을 요청합니다.
```

## 액세스 제거

GitHub 사용자의 리포지토리 액세스 권한을 제거하는 방법은 다음과 같습니다.

1. [도움말 센터](https://help.liferay.com/hc/en-us/)에서 [프로젝트](https://customer.liferay.com/project-details?_ga=2.57624622.528260345.1619731014-1356934316.1588162379) 페이지로 이동합니다.
1. DXP 프로젝트를 선택합니다.
1. *소스 코드 액세스* 탭을 선택합니다.
1. 사용자의 GitHub 정보를 확장합니다.
1. *삭제*클릭합니다.

사용자에 대한 리포지토리 액세스가 제거됩니다.

## 은둔

승인된 모든 구독자가 동일한 리포지토리에 액세스하더라도 GitHub 사용자 계정과 리포지토리 포크는 기본적으로 비공개로 유지됩니다. 그러나 일부 작업은 다른 리포지토리 공동 작업자에게 표시됩니다. 다음과 같은 행위를 피하고 추천 대체 채널을 대신 사용함으로써 개인정보를 보호할 수 있습니다.

| 피해야 할 행동        | 대체 채널 |
|:--------------- |:----- |
| 자신의 댓글 편집 및 삭제  | (1)   |
| 문제 열기           | (1)   |
| 내가 연 종료 문제      | (1)   |
| 닫은 문제 다시 열기     | (1)   |
| 귀하에게 할당된 문제가 있음 | (1)   |
| 포크에서 풀 요청 보내기   | (2)   |
| 풀 리퀘스트 리뷰 제출    | (2)   |
| Wiki 편집         | (삼)   |

**(1) 문제 및 의견:** 소스 코드 저장소에서 제기된 문제를 닫고 답변하지 않은 상태로 둡니다. Liferay 소프트웨어 문제가 있는 경우 도움말 센터에서 [지원 티켓 생성](https://help.liferay.com/hc/en-us/requests/new)을 통해 Liferay 지원 팀에 알려주십시오.

**(2) 코드 기여의 경우:** 공개 Liferay Portal 리포지토리 <https://github.com/liferay/liferay-portal>에서 코드를 기여할 수 있습니다. 승인된 기여는 다음 Liferay DXP 릴리스에 포함됩니다.

**(3) Wiki의 경우:** 공식 Liferay DXP 문서는 <https://learn.liferay.com>에 있으며 지원 기술 자료는 [도움말 센터](https://help.liferay.com)에 있습니다. /hc/en-us/). 우리는 `liferay-dxp` 저장소 위키를 사용하지 않습니다. 기사 변경을 제안하거나 주제에 대한 문서를 요청하려면 [지원 티켓 생성](https://help.liferay.com/hc/en-us/requests/new)을 통해 Liferay 지원 팀에 알려주십시오. 지원 센터.

## 추가 정보

* [Liferay의 오픈 소스 정보](https://liferay.dev/open-source)
* [GitHub 및 Git 시작하기](https://help.github.com/en/github/getting-started-with-github)
* [GitHub에서 정보 검색](https://help.github.com/en/github/searching-for-information-on-github)
* [GitHub에서 리포지토리 복제](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository-from-github)
* [포크 작업](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/working-with-forks)
* [포크 프로젝트](https://guides.github.com/activities/forking/)
