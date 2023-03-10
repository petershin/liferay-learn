# 버그 수정 또는 새로운 기능 제공

버그를 수정하거나 기능을 제공하는 방법을 배울 때 가장 먼저 해야 할 일은 시스템 구축 방법에 익숙해지는 것입니다. 이제 Liferay Portal 빌드 시스템에는 ant all을 통해 전체 빌드를 사용하는 대신 야간 스냅샷 번들을 사용하는 옵션이 포함됩니다. 이렇게 하면 시스템 구축에 필요한 시간이 크게 단축됩니다. **ant all** 은 때때로 작동하는 시스템을 구축하는 데 15-30분이 걸릴 수 있지만 스냅샷을 사용하면 몇 분 밖에 걸리지 않습니다.

자세한 내용은 [건물 Liferay 소스](./building-liferay-source.md)을 참조하십시오.

## 버그 수정

Liferay Portal이 구축되면 최신 버전의 플랫폼을 사용하여 버그를 재현할 수 있는지 확인하십시오. 종종 Liferay Portal의 개발 빌드에서 버그가 이미 해결되었습니다. 또한 마스터 브랜치에 대해 풀 요청을 발행해야 합니다. 다른 지점에 대한 풀 요청은 허용되지 않습니다.

버그가 있을 수 있는 사이트를 찾을 수 있는지 알아보려면 Liferay Portal의 기본 코드 구조를 알아보세요. Liferay Portal은 매우 큰 제품이며 특정 기능에 대한 코드가 있는 사이트를 찾는 것이 처음에는 어려울 수 있습니다. 그러나 코드는 잘 정의된 패턴을 따르며 해당 패턴이 학습되면 코드 영역을 매우 쉽게 찾을 수 있습니다. 자세한 내용은 [소스 구성 방법](./organizing-the-source.md)을 참조하십시오.

버그를 수정하고 Liferay를 다시 빌드하고 다시 시작하여 수정했는지 확인하십시오! 그렇지 않다면 고칠 때까지 계속 반복하십시오. 절대적으로 필요한 것보다 더 많은 코드를 건드리지 마십시오.

코드 변경 사항을 git 리포지토리에 커밋하고 기본 [Github의 liferay-portal 리포지토리](https://github.com/liferay/liferay-portal) 에 대해 풀 요청을 발행합니다.

[issues.liferay.com](https://issues.liferay.com/secure/Dashboard.jspa) 의 버그 보고서에서 Contribute Solution을 클릭하여 문제를 해결하고 끌어오기 요청을 기록했음을 문서화하고 커뮤니티에 환원한 것을 축하합니다! 자세한 내용은 [Liferay 소스 구축](./building-liferay-source.md) 을 참조하십시오.

## 새로운 기능 제공

Liferay는 개발자 커뮤니티의 기여와 혁신으로 번성하고 있으며 새로운 아이디어를 구현하면 사용자의 요구를 충족하기 위해 플랫폼의 지속적인 발전을 보장합니다. 이전에 Liferay용으로 개발한 적이 없다면 시간을 들여 코드를 배우고 몇 가지 버그를 수정하여 프로세스를 이해해야 합니다. 

이제 Liferay Portal의 많은 기능이 모듈을 통해 추가되어 Liferay Marketplace를 통해 새로운 기능을 더 쉽게 게시할 수 있습니다. 일반적인 경험 법칙은 Marketplace 플러그인이 될 수 있는 경우 Marketplace 플러그인이어야 한다는 것입니다. Marketplace 플러그인은 일반적으로 핵심 기여보다 수락하기가 더 쉽습니다. 새 기능을 Liferay Marketplace 플러그인으로 구현할 수 없는 경우 [제안 및 기능](https://liferay.dev/en/forums-redirect/-/message_boards/category/1108052) 포럼에서 토론을 시작하여 아이디어에 관심이 있는지 확인하고 도움을 줄 수 있는 잠재적 도우미를 식별하는 것이 가장 좋습니다. 자세한 내용은 [Marketplace WebSite](https://marketplace.liferay.dev/) 을 참조하십시오.

기능, 모든 관련 테스트를 구현하고 철저하게 테스트하고 수행해야 한다고 생각하는 기능을 수행하는지 확인합니다. 필요에 따라 풀 요청을 발행합니다.

[issues.liferay.com](https://issues.liferay.com/secure/Dashboard.jspa) 의 기능 요청 티켓에서 **Contribute Solution** 을 클릭하여 이를 구현하고 끌어오기 요청을 기록했음을 문서화하고 커뮤니티에 환원한 것을 축하합니다!