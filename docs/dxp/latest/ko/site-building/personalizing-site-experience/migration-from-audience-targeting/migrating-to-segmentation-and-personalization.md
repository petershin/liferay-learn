# 세분화 및 개인화로 마이그레이션

Liferay 7.2부터 세분화 및 개인화 기능이 핵심 제품에 통합되었습니다. Audience Targeting 사용자는 Audience Targeting 세그먼트를 핵심 Liferay Segmentation으로 마이그레이션해야 합니다.

이 마이그레이션에는 세 단계가 있습니다.

1. Liferay DXP 7.2+로 업그레이드하십시오.
1. 사용자 지정 규칙 및 표시 속성을 마이그레이션합니다.
1. 동작 기반 기능을 마이그레이션합니다.

먼저 [업그레이드 가이드](../../../installation-and-upgrades/upgrading-liferay/upgrade-basics.md)에 따라 최신 버전의 Liferay DXP로 업그레이드하십시오. 대부분의 Audience Targeting 구성은 업그레이드 중에 자동으로 Liferay Segmentation으로 전송됩니다.

다음으로 다음 정보를 고려하여 잠재고객 타겟팅 맞춤 규칙을 마이그레이션합니다.

- Liferay [세분화 기능](../segmentation/creating-and-managing-user-segments.md)고려하여 모든 대상 대상 지정 규칙의 필요성을 재평가합니다.
  - 일부 사용자 지정 규칙에는 이에 상응하는 규칙이 있을 수 있습니다. 자세한 내용은 [사용자 세그먼트 마이그레이션](./migrating-user-segments.md) 참조하십시오.
- 동등 항목이 없는 잠재고객 타겟팅 규칙의 경우 [이러한 규칙을 수동으로 마이그레이션해야 합니다](./manually-migrating-from-audience-targeting.md).
- 규칙을 완전히 다시 구현해야 하는 경우 [사용자 세그먼트 생성 및 관리](../segmentation/creating-and-managing-user-segments.md)의 정보를 따르십시오.
- 또한 Liferay DXP 7.2+의 새로운 개인화 기능이 다른 도구를 사용하므로 [디스플레이 위젯을 마이그레이션](./manually-migrating-from-audience-targeting.md#migrating-display-properties) 해야 합니다.
  
마지막으로 대상 대상 지정에서 행동 기반 기능을 마이그레이션해야 합니다. Liferay DXP 7.2+부터는 행동 기반 규칙이 Liferay Analytics Cloud를 사용하여 관리됩니다. 자세한 내용은 [세그먼트](https://learn.liferay.com/w/analytics-cloud/people/segments/segments) 참조하십시오.

## 관련 정보

* [사용자 세그먼트 마이그레이션](./migrating-user-segments.md)
* [잠재고객 타겟팅에서 수동으로 마이그레이션](./manually-migrating-from-audience-targeting.md)
* [사용자 세그먼트 생성 및 관리](../segmentation/creating-and-managing-user-segments.md)
