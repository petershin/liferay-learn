# PunchOut2Go 참조 가이드에 대한 Liferay Commerce 커넥터

> 요구되는 기부금

이 문서에서는 PunchOut2Go에 대한 Liferay Commerce Connector의 구성 용어에 대해 설명합니다.

| 용어           | 묘사                                                                                  |
|:------------ |:----------------------------------------------------------------------------------- |
| 펀치 아웃 세션     | 사용자가 Liferay Commerce 플랫폼에 성공적으로 로그인한 시점과 카트가 Punch Out 시스템으로 다시 전송되는 시점 사이의 일련의 작업 |
| HttpSession  | Punch out 세션과 관련된 데이터를 저장하는 데 사용되는 Liferay에 내장된 기존 세션 저장소                           |
| 펀치 아웃 시작 URL | 펀치 아웃 세션을 시작하고 지정된 Liferay Commerce 채널의 카탈로그 페이지로 이동하기 위한 사용자의 URL                  |
| 펀치 아웃 반환 URL | 사용자가 조달 시스템으로 돌아가는 URL                                                              |
| 펀치 아웃 카트     | 구매를 위해 선택한 구매자의 항목이 포함된 장바구니                                                        |
| 구매 주문        | 구매자가 제출한 주문의 최종 승인 초안                                                               |
| 펀치 아웃 액세스 토큰 | Punch out 사용자 자동 로그인에 사용되는 일회용 토큰                                                   |
| 펀치 아웃 벤더     | 펀치 아웃 카탈로그와 구매자 조달 시스템을 연결하는 타사 공급업체                                                |

## 관련 주제

* [PunchOut2Go에 대한 Liferay Commerce 커넥터](./liferay-commerce-connector-to-punchout2go.md)
