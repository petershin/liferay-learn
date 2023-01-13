---
toc:
- ./upgrade-stability-and-performance/database-tuning-for-upgrades.md
- ./upgrade-stability-and-performance/database-pruning-for-faster-upgrades.md
- ./upgrade-stability-and-performance/example-removing-intermediate-journal-article-versions.md
- ./upgrade-stability-and-performance/upgrading-modules-using-gogo-shell.md
---
# 업그레이드 안정성 및 성능

```{toctree}
:maxdepth: 2

upgrade-stability-and-performance/database-tuning-for-upgrades.md
upgrade-stability-and-performance/database-pruning-for-faster-upgrades.md
upgrade-stability-and-performance/example-removing-intermediate-journal-article-versions.md
upgrade-stability-and-performance/upgrading-modules-using-gogo-shell.md
```

프로덕션 릴리스를 위해 DXP 인스턴스를 업그레이드할 때 데이터 업그레이드는 정확하고 신속하게 수행되어야 합니다. 다음은 성공을 보장하는 데 도움이 되는 몇 가지 방법입니다.

* 데이터베이스 및 설치 사본을 사용하는 테스트 환경 생성
* 성능 향상을 위해 불필요한 데이터베이스 데이터 제거
* 업그레이드 작업을 위해 데이터베이스 조정
* 데이터베이스 업그레이드 및 업그레이드 문제 해결
* DXP로 업그레이드된 데이터베이스 테스트

## 테스트 환경 만들기

프로덕션과 분리되어 있지만 동일한 데이터, 구성 및 앱을 사용하는 환경에서 업그레이드를 테스트하는 것이 중요합니다. 설치(Liferay Home), 데이터베이스 및 Marketplace 앱의 사본을 사용할 수 있습니다. 이들은 [백업](../maintaining-a-liferay-installation/backing-up.md)에서 쉽게 사용할 수 있어야 합니다.

## 불필요한 데이터 가지치기

DXP 사이트를 적극적으로 업데이트하는 경우 더 이상 필요하지 않은 데이터가 있을 수 있습니다. 여기에는 사용을 중단한 사이트, 역할 또는 조직이나 더 이상 필요하지 않은 콘텐츠 개정판이 포함될 수 있습니다. 불필요한 엔터티 및 이와 관련된 데이터를 삭제하면 업그레이드 처리 시간을 절약할 수 있습니다. 자세한 내용은 [빠른 업그레이드를 위한 데이터베이스 정리](./upgrade-stability-and-performance/database-pruning-for-faster-upgrades.md)을 참조하십시오. 그리고 [예\: 중간 저널 기사 버전 제거](./upgrade-stability-and-performance/example-removing-intermediate-journal-article-versions.md)도 확인하십시오.

## 업그레이드를 위한 데이터베이스 조정

DXP 업그레이드 프로세스는 프로덕션에서 일반적으로 수행되는 것보다 더 많이 데이터베이스에 씁니다. 쓰기 작업을 위해 데이터베이스를 최적화할 수 있습니다. 지침은 [업그레이드를 위한 데이터베이스 튜닝](./upgrade-stability-and-performance/database-tuning-for-upgrades.md)을 참조하십시오.

## 업그레이드 및 문제 해결

테스트 데이터베이스를 정리하고 조정한 후 데이터베이스 업그레이드 도구</a>를 사용하여 업그레이드하십시오

. 해결되지 않은 종속성과 같은 문제가 발생하면 로그를 검사하고 Gogo 셸 명령을 사용하여 문제를 해결하고 업그레이드를 완료할 수 있습니다. 방법을 알아보려면 [Gogo Shell](./upgrade-stability-and-performance/upgrading-modules-using-gogo-shell.md) 을 사용하여 모듈 업그레이드를 방문하십시오.</p> 



## 업그레이드된 데이터베이스 테스트

마지막으로 업그레이드된 데이터베이스로 DXP 인스턴스를 테스트하는 시간을 가지십시오.

DXP 인스턴스를 성공적으로 업그레이드한 후 프로덕션으로 릴리스를 조정할 수 있습니다.



## 추가 정보

* [클러스터된 설치 업데이트](../maintaining-a-liferay-installation/maintaining-clustered-installations.md)