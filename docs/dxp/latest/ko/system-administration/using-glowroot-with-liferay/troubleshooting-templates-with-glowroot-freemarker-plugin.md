# Glowroot Freemarker 플러그인을 사용한 템플릿 문제 해결

{bdg-secondary}`liferay DXP 2023.Q4+/포탈 7.4 GA100+`

Glowroot는 [FreeMarker 템플릿](../../site-building/displaying-content/using-information-templates.md) 문제를 해결하여 느린 트랜잭션을 찾아낼 수 있습니다.

## FreeMarker 플러그인 구성

1. _Configuration_ &rarr; _Plugins_로 이동합니다. _Liferay FreeMarker 템플릿 플러그인_을 클릭하세요.

1. 계측은 'INFO', 'DEBUG' 또는 'TRACE' 수준에서 구성할 수 있습니다.

   'INFO' 수준은 템플릿 변환에 소요되는 시간을 보여줍니다. 'DEBUG' 수준은 각 템플릿 변환을 개별 검사를 위한 고유한 트랜잭션으로 처리합니다. 이 설정은 더 많은 Glowroot 오버헤드를 사용할 수 있습니다. `TRACE` 수준은 템플릿 스크립트에 대한 자세한 내용과 검사를 위한 추적 세부정보를 제공합니다.

## FreeMarker 템플릿 문제 해결

1. _Transactions_ 탭으로 이동하여 드롭다운 메뉴에서 _FreeMarker Templates_를 선택하세요. 모든 템플릿 거래 목록이 나타납니다.

1. 특정 트랜잭션의 세부정보를 보려면 트랜잭션 패널에서 _느린 추적_ 탭을 클릭하세요.

1. 거래 세부정보를 보려면 데이터 포인트를 클릭하세요. 분석 섹션에서 템플릿의 변환 시간을 확인하세요.

   ![Click on the data point to see details about the transaction.](./troubleshooting-templates-with-glowroot-freemarker-plugin/images/01.png)

1. 더 아래로 스크롤하여 _Trace items_를 클릭하세요. 추적이 확장되어 조각 변환의 세부정보가 표시됩니다.

   ![The trace is expanded to show details of the fragment transformation.](./troubleshooting-templates-with-glowroot-freemarker-plugin/images/02.png)

템플릿 거래 오류를 검사하려면,

1. _Errors_ 탭으로 이동하여 드롭다운 메뉴에서 _FreeMarker Templates_를 선택하세요.

1. 검사를 위해 특정 오류를 클릭하세요.
