# Liferay Commerce 수정 전달 방법

> 요구되는 기부금

수정 사항 제공은 Liferay 기업 구독에 포함된 필수 서비스 중 하나입니다. Liferay Commerce의 경우 프로젝트 단계에 맞게 수정 제공 방법을 설계하여 최신 업데이트에 지속적으로 액세스할 수 있습니다. 아래 차트와 다음 정의를 사용하여 Liferay Commerce에 대한 수정 사항을 제공하는 방법을 더 잘 이해하십시오.

Liferay Commerce는 Liferay 디지털 경험 플랫폼(DXP)을 기반으로 합니다. 따라서 Liferay Commerce를 업데이트하려면 Liferay Commerce에서 지정한 대로 핵심 플랫폼을 업데이트해야 할 수 있습니다.

## 개발 단계: 유지 관리 업데이트

유지 관리 업데이트는 Liferay Commerce에 대해 주기적으로 릴리스됩니다. 이 업데이트에는 알려진 문제를 해결하여 제품의 품질과 안정성을 유지하고 엄선한 수정 사항 모음이 포함되어 있습니다. 유지 관리 업데이트는 광범위한 QA 테스트를 거치며 긴급 업데이트보다 위험이 훨씬 적습니다. 이들은 최신 코드 베이스를 나타내며 Liferay는 현재 코드 베이스의 알려진 문제를 해결하는 데 중점을 두므로 프로젝트 개발 단계 동안 최신 유지 관리 업데이트를 최신 상태로 유지하는 것이 좋습니다.

Liferay Digital Experience Platform의 일부인 핵심 모듈 및 제품군의 경우 유지 관리 업데이트는 Liferay Connected Services 및 고객 포털을 통해 단일 [DXP 7.1](https://customer.liferay.com/group/customer/downloads? **com** liferay **osb** customer **downloads** display **web** DownloadsDisplayPortlet **formDate=1542377673692&p** p **id=com** liferay **osb** customer **downloads** display **web** DownloadsDisplayPortlet&p **p** lifecycle=0&p **p** state=normal&p **p** mode=view& **com** liferay **osb** customer **downloads** display **web** DownloadsDisplayPortlet **product=dxp** 71& **com** liferay **osb** customer **downloads** display **web** DownloadsDisplayPortlet_fileType=fixPacks) 수정 팩으로 릴리스됩니다.

| 예상 출시 목표         | 일정한      | 필요에 따라   |
|:---------------- |:-------- |:-------- |
| 라이프레이 DXP *      | &#10003; | &#10003; |
| Liferay Commerce | &#10003; | &#10003; |

## 생산 단계: 긴급 업데이트

긴급 업데이트는 프로덕션 환경에 배포된 Liferay 구성 요소에 대해 사례별로 제공됩니다. 프로덕션 배포 일정이 프로덕션 환경에 대해 수행할 수 있는 변경의 양 또는 빈도를 제한하는 경우 Liferay 지원 팀에 긴급 업데이트를 요청하는 것이 좋습니다. 이러한 업데이트는 향후 유지 관리 업데이트에 포함될 고객별 임시 솔루션입니다. Liferay Digital Experience Platform의 경우 긴급 업데이트는 핵심 모듈 및 제품군을 패치할 수 있는 단기 솔루션인 핫픽스라고도 합니다. 긴급 업데이트를 설치한 경우 새 개발 단계에 들어가는 즉시 최신 유지 관리 업데이트로 Liferay DXP 시스템을 최신 상태로 유지하는 것이 좋습니다.

| 예상 출시 목표         | 일정한      |
|:---------------- |:-------- |
| 라이프레이 DXP *      | &#10003; |
| Liferay Commerce | &#10003; |

\* 핵심 모듈 및 제품군(Static, Foundation, Web Experience, Collaboration, Forms 및 Workflow)
