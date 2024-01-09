# 개체 이벤트 감사

{bdg-secondary}`liferay 7.4 U72+/GA72+`

Liferay의 감사 프레임워크를 사용하여 사용자 정의 개체 정의 및 해당 항목에 대한 이벤트를 추적할 수 있습니다. 항목 이벤트를 추적하려면 개체 정의에 대해 항목 [을 활성화](#enabling-entry-history) 합니다. 활성화된 동안 [감사 애플리케이션](#using-the-audit-application) 또는 [REST API](#using-rest-apis) 을 통해 항목 기록을 볼 수 있습니다.

## 감사 애플리케이션 사용

{bdg-primary}`구독`

감사 애플리케이션에 액세스하려면 **전역 메뉴**(![전역 메뉴](../../../images/icon-applications-menu.png))를 엽니다. &rarr; **제어판** &rarr; **감사** 를 클릭합니다.

![Click Audit in the Control Panel to view events related to object definitions.](./auditing-object-events/images/01.png)

이벤트가 테이블에 나타납니다.

| 열        | 묘사                                                                        |
| :------- | :------------------------------------------------------------------------ |
| 사용자 아이디  | 현재 사용자의 ID입니다.                                                            |
| 사용자 이름   | 현재 사용자의 이름입니다.                                                            |
| 자원 아이디   | 영향을 받은 리소스의 ID입니다.                                                        |
| 리소스 이름   | 해당 ID를 포함한 영향을 받는 리소스의 이름(예: `ObjectDefinition#44168`) |
| 리소스 작업   | 수행된 작업(`ADD`, `UPDATE` 또는 `DELETE`)                    |
| 클라이언트 IP | 작업을 담당하는 IP 주소입니다.                                                        |
| 날짜 생성    | 이벤트 레코드가 생성된 시간입니다.                                                       |

특정 작업 세부정보를 포함하여 더 완전한 기록을 보려면 이벤트 필드를 클릭하세요. 키워드 및 기타 용어를 사용하여 결과를 검색하고 필터링할 수 있습니다.

개체 항목 이벤트는 `ObjectDefinition#[ObjectID]` 명명 패턴을 사용합니다.

![Click an event field to view more details.](./auditing-object-events/images/02.png)

## REST API 사용

`auditEvents` 값과 함께 `nestedFields` 매개변수를 사용하여 GET API 호출에서 항목 기록을 반환할 수 있습니다(예: `http://localhost:8080/o/c/tickets/?nestedFields=auditEvents`). 기본 튜토리얼은 [NestedFields를 사용하여 항목 기록 감사](../understanding-object-integrations/using-custom-object-apis/using-nestedfields-to-audit-entry-history.md) 참조하세요.

```{important}
REST API를 사용하여 항목 기록을 보려면 해당 항목에 대한 '보기' 및 '개체 항목 기록' 권한이 모두 필요합니다. 자세한 내용은 [권한 프레임워크 통합](../understanding-object-integrations/permissions-framework-integration.md) 참조하세요.
```

## 항목 기록 활성화

기본적으로 사용자 정의 개체에 대한 항목 기록은 비활성화되어 있습니다. 7.4 U72+/GA72+의 경우 언제든지 이 설정을 구성할 수 있습니다. 이전 버전에서는 개체 정의를 게시하기 전에 [이 설정을 구성할 수 있습니다](./creating-objects.md#publishing-object-drafts) .

항목 기록을 활성화하려면,

1. **전역 메뉴**(![전역 메뉴](../../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **개체** 를 클릭합니다.

1. 원하는 객체 정의 편집을 시작합니다.

1. 세부정보 탭에서 **항목 기록 활성화** 를 전환하세요.

   ![Enable entry history.](./auditing-object-events/images/03.png)

1. **저장** 을 클릭하세요.

활성화된 동안 Liferay는 감사 애플리케이션이나 REST API 호출을 통해 볼 수 있는 입력 이벤트 기록을 유지합니다.

## 관련 주제

* [개체](../../objects.md)
* [객체 생성 및 관리](../creating-and-managing-objects.md)
