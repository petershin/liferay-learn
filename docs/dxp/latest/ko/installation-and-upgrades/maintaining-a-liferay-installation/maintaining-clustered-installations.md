---
toc:
- ./maintaining-clustered-installations/rolling-restarts.md
- ./maintaining-clustered-installations/blue-green-deployments.md
---
# 클러스터된 설치 유지

[클러스터](../setting-up-liferay/clustering-for-high-availability.md) 에서 작동하도록 Liferay DXP 설치를 설정하면 성능 및 확장성이 향상되지만 적절하게 지원하고 유지하려면 추가 고려 사항이 필요합니다. 여기에는 신규 및 업데이트된 플러그인 및 모듈 배포, [패치 및 수정팩 설치](./patching-dxp-7-3-and-earlier.md), 구성 변경 등이 포함됩니다. Liferay DXP 클러스터 유지 관리 방법은 서버 가동 시간을 최대화하고 서버 유지 관리에 대한 위험을 최소화합니다. Liferay DXP는 표준 클러스터 유지 관리 기술 사용을 지원합니다.

* [롤링 재시작](./maintaining-clustered-installations/rolling-restarts.md): 노드가 한 번에 하나씩 종료되고 업데이트됩니다.
* [Blue-Green 배포](./maintaining-clustered-installations/blue-green-deployments.md): Blue-Green에는 현재 환경 복제(**파란색** 환경), 복제본 업데이트(**녹색** 환경) 및 사용자를 업데이트된 환경(녹색)으로 전환하는 작업이 포함됩니다.

기술은 아래에서 비교됩니다.

## 클러스터 업데이트 기술

| 수정                                                  | 롤링 리스타트  | 청록색      |
|:--------------------------------------------------- |:-------- |:-------- |
| 활성화 키 [1](#one)                                     | &#10004; | &#10004; |
| 애플리케이션 서버 업데이트                                      | &#10004; | &#10004; |
| 클러스터 코드 변경 [2](#two)                                |          | &#10004; |
| 수정팩 설치 및 제거(되돌릴 수 있는 수정팩)                           | &#10004; | &#10004; |
| 수정팩 설치(복구할 수 없는 수정팩)                                |          | &#10004; |
| JVM 설정 변경                                           | &#10004; | &#10004; |
| 자바 버전(주요)                                           |          | &#10004; |
| 자바 버전(부)                                            | &#10004; | &#10004; |
| 플러그인/모듈 설치                                          | &#10004; | &#10004; |
| 플러그인/모듈 업데이트(하위 호환 데이터/스키마 변경)                      | &#10004; | &#10004; |
| 플러그인/모듈 업데이트(이전 버전과 호환되지 않는 데이터/스키마 변경) [3](#three) |          | &#10004; |
| 포털 속성 변경                                            | &#10004; | &#10004; |
| 구성 관리 파일을 통한 시스템 설정 변경                              | &#10004; | &#10004; |

[<a name="one">1</a>] Blue-Green을 사용한 활성화 키 업데이트는 가상 클러스터 활성화 키에 대해서만 지원됩니다. 자세한 내용은 [Liferay DXP 및 Liferay Commerce용 가상 클러스터 활성화 키](https://help.liferay.com/hc/ko/articles/4402390080141) 를 참조하십시오.

[<a name="two">2</a>] 데이터 및 데이터 스키마 변경 사항
이전 버전과 호환되지만 다음이 포함되지만 이에 국한되지는 않습니다.

* 기존 열의 데이터 수정
* 열 삭제
* 열 유형 변경
* 열에 사용되는 데이터 형식 변경(예: XML에서 JSON으로 변경)
* Service Builder 서비스 모듈의 데이터 스키마를 모듈의 필수 데이터 스키마 범위를 벗어난 버전으로 업데이트합니다. 모듈의 `Liferay-Require-SchemaVersion` (해당 `bnd.bnd`에 지정됨)은 `Release_` 테이블의 모듈 스키마 버전 값과 일치해야 합니다. 새 스키마 버전으로 모듈을 설치하면 해당 스키마 버전으로 `Release_` 테이블이 업데이트되고 데이터 업그레이드 프로세스가 트리거됩니다. 이러한 모듈을 한 노드에 설치하면 `Release_` 테이블의 스키마 버전이 더 이상 다른 노드에 있는 모듈의 `Liferay-Require-SchemaVersion` 과 일치하지 않으며 모듈이 설치될 때까지 모듈의 서비스 빌더 서비스를 사용할 수 없게 됩니다. 다른 노드에 설치됩니다. 이러한 변경 사항은 되돌릴 수 없습니다. 데이터베이스는 백업에서 복원해야 합니다. 이러한 스키마 버전 변경은 모든 노드가 종료되는 동안 적용되어야 합니다.

[<a name="three">3</a>] 클러스터 통신은 그대로 유지되어야 합니다. 이러한 이유로 롤링 재시작에서 클러스터 코드를 업데이트하면 안 됩니다. 고객 포털은 되돌릴 수 없는 변경 사항이 포함된 DXP 수정 팩을 식별합니다. 롤링 재시작에서 변경하면 안 되는 패키지는 다음과 같습니다.

* `com.liferay.portal.kernel.cluster`
* `com.liferay.portal.kernel.cluster.*`
* `com.liferay.portal.kernel.exception.NoSuchClusterGroupException`
* `com.liferay.portal.kernel.scheduler.multiple`
* `com.liferay.portal.kernel.scheduler.multiple.*`
* `com.liferay.portal.cache.multiple`
* `com.liferay.portal.cache.multiple.*`
* `com.liferay.portal.scheduler.multiple`
* `com.liferay.portal.scheduler.multiple.*`

## 관련 주제

* [롤링 리스타트](./maintaining-clustered-installations/rolling-restarts.md)
* [청록색 배포](./maintaining-clustered-installations/blue-green-deployments.md)
* [서버 관리](../../system-administration/using-the-server-administration-panel.md)