---
toc:
  - ./upgrade-stability-and-performance/database-tuning-for-upgrades.md
  - ./upgrade-stability-and-performance/database-pruning-for-faster-upgrades.md
  - ./upgrade-stability-and-performance/upgrading-modules-using-gogo-shell.md
---
# 안정성 및 성능 업그레이드

프로덕션 릴리스를 위해 DXP 인스턴스를 업그레이드하는 경우 데이터 업그레이드를 정확하고 신속하게 수행해야 합니다. 다음은 성공을 보장하는 몇 가지 방법입니다:

* 데이터베이스 및 설치 복사본을 사용하는 테스트 환경 만들기
* 불필요한 데이터베이스 데이터를 정리하여 성능 개선
* 업그레이드 작업을 위한 데이터베이스 조정
* 데이터베이스 업그레이드 및 업그레이드 문제 해결
* DXP로 업그레이드된 데이터베이스 테스트

## 테스트 환경 만들기

프로덕션 환경과 분리되어 있지만 동일한 데이터, 구성 및 앱을 사용하는 환경에서 업그레이드를 테스트하는 것이 중요합니다. 설치(Liferay 홈), 데이터베이스 및 마켓플레이스 앱의 복사본을 사용할 수 있습니다. [백업](../maintaining-a-liferay-installation/backing-up.md)에서 쉽게 사용할 수 있어야 합니다.

## 불필요한 데이터 정리

DXP 사이트를 적극적으로 업데이트하는 경우 더 이상 필요하지 않은 데이터가 있을 수 있습니다. 여기에는 사용을 중단한 사이트, 역할 또는 조직 또는 더 이상 필요하지 않은 콘텐츠의 수정본이 포함될 수 있습니다. 불필요한 엔티티 및 이와 관련된 데이터를 삭제하면 업그레이드 처리 시간을 절약할 수 있습니다. 자세한 내용은 [빠른 업그레이드를 위한 데이터베이스 가지 치기](./upgrade-stability-and-performance/database-pruning-for-faster-upgrades.md)를 참조하세요. [예제\도 꼭 확인하세요: 중간 저널 논문 버전 제거하기](./upgrade-stability-and-performance/example-removing-intermediate-journal-article-versions.md).

## 업그레이드를 위한 데이터베이스 조정

DXP 업그레이드 프로세스는 일반적으로 프로덕션 환경에서 수행되는 것보다 데이터베이스에 더 많이 기록합니다. 쓰기 작업에 맞게 데이터베이스를 최적화할 수 있습니다. 자세한 내용은 [업그레이드를 위한 데이터베이스 튜닝](./upgrade-stability-and-performance/database-tuning-for-upgrades.md)을 참조하세요.

## 업그레이드 및 문제 해결

테스트 데이터베이스를 정리하고 조정한 후 [데이터베이스 업그레이드 도구를 사용하여](./upgrade-basics/using-the-database-upgrade-tool.md) 업그레이드합니다. 해결되지 않은 종속성과 같은 문제가 발생하면 로그를 검사하고 Gogo 셸 명령을 사용하여 문제를 해결하고 업그레이드를 완료할 수 있습니다. 방법을 알아보려면 [Gogo Shell을 사용한 모듈 업그레이드](./upgrade-stability-and-performance/upgrading-modules-using-gogo-shell.md)를 방문하세요.

## 업그레이드된 데이터베이스 테스트

마지막으로 업그레이드된 데이터베이스로 DXP 인스턴스를 테스트하는 시간을 갖습니다.

DXP 인스턴스를 성공적으로 업그레이드한 후에는 프로덕션 환경으로 릴리스하도록 오케스트레이션할 수 있습니다.

## 관련 주제

* [클러스터된 설치 업데이트](../maintaining-a-liferay-installation/maintaining-clustered-installations.md)
