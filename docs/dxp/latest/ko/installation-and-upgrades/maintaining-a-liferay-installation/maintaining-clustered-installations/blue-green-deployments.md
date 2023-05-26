# 청록색 배포

청록색은 프로덕션 환경(**파란색** 환경)을 복제하고 소프트웨어 및 데이터 변경으로 복제본(**녹색** 환경)을 수정하는 배포 기술입니다. 그린 환경을 성공적으로 테스트한 경우 사용자를 블루 환경에서 그린 환경으로 전환합니다. 청록색은 시스템 다운 시간을 제거합니다.

데이터 변경 및 데이터 스키마 변경에는 특별한 주의가 필요합니다. 기존 코드와의 호환성을 깨는 사용자 지정 플러그인/모듈 데이터 스키마 변경은 이전 열이 불필요해질 때까지 데이터가 전환되고 이전 열과 새 열에서 유지되는 여러 릴리스에 도입되어야 합니다.

데이터 및 스키마 변경에는 다음 단계가 필요합니다.

1. 새 열을 만듭니다.

1. 데이터를 새 열에 복사합니다.

1. 이전 열이 클러스터 노드에서 더 이상 사용되지 않을 때까지 두 열을 모두 유지합니다.

1. 다음 릴리스에서 이전 열을 삭제하십시오.

자세한 내용은 다음 블루-그린 배포 문서를 참조하십시오.

* [BlueGreen배포](http://martinfowler.com/bliki/BlueGreenDeployment.html)
* [AWS로 블루-그린 배포 구현](https://www.thoughtworks.com/insights/blog/implementing-blue-green-deployments-aws)

## 관련 주제

* [롤링 리스타트](./rolling-restarts.md)
* [고가용성을 위한 클러스터링](../../setting-up-liferay/clustering-for-high-availability.md)
* [DXP 패칭](../patching-dxp-7-3-and-earlier.md)