---
toc:
  - ./fields/adding-fields-to-objects.md
  - ./fields/adding-and-managing-custom-states.md
  - ./fields/aggregation-fields.md
  - ./fields/attachment-fields.md
  - ./fields/encrypted-fields.md
---
# 분야

```{toctree}
:maxdepth: 3

fields/adding-fields-to-objects.md
fields/adding-and-managing-custom-states.md
fields/aggregation-fields.md
fields/attachment-fields.md
fields/encrypted-fields.md
```

{bdg-secondary}`사용 가능 Liferay 7.4 U78+/GA78+`

개체 필드는 데이터베이스 열을 나타내고 다양한 유형의 값을 저장하는 데이터 정의입니다. 모든 개체에는 기본 시스템 필드가 포함되어 있지만 초안 개체와 게시된 개체 모두에 [사용자 정의 필드를 추가](./fields/adding-fields-to-objects.md)할 수 있습니다.

개체 초안을 게시 [하면 Liferay는 게시 시 초안의 모든 필드와 관계](./creating-objects.md#publishing-object-drafts) 포함하는 초기 데이터베이스 테이블을 생성합니다. 게시 후 추가된 필드 및 관계는 사이드 테이블(예: `[Initial_Table_Name]_x`)에 추가됩니다.

![모든 개체에는 기본 시스템 필드가 포함되어 있지만 사용자 정의 필드를 추가할 수 있습니다.](./fields/images/01.png)

Liferay는 백엔드의 특정 데이터 유형에 해당하는 다음 필드 유형을 제공합니다.

| 필드 유형(UI)                            | 데이터 유형(헤드리스) | 묘사                                                                                                                                                                                     |
|:------------------------------------ |:------------ |:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [집계](./fields/aggregation-fields.md) | 끈            | 관계 테이블의 값을 사용하여 계산된 읽기 전용 값을 저장합니다. 사용 가능한 기능에는 `카운트`, `합계`, `평균`, `최소`및 `최대`가 포함됩니다.                                                                                                  |
| [부착](./fields/attachment-fields.md)  | 관계 > 장기      | 파일을 저장합니다. 기본적으로 업로드된 파일은 100MB를 초과할 수 없습니다. 이 필드는 [문서 및 미디어](../../../content-authoring-and-management/documents-and-media.md)에서 허용되는 모든 파일 형식을 지원합니다.                                |
| 불리언                                  | 불리언          | 참 또는 거짓 값을 저장합니다. 필수 부울 필드에는 항상 참값이 필요합니다.                                                                                                                                             |
| 날짜                                   | 날짜           | 날짜 값을 저장합니다.                                                                                                                                                                           |
| 날자와 시간                               | 날짜 시간        | 날짜 및 시간 값을 저장합니다. 입력된 시간 값을 저장하거나 UTC로 변환할 수 있습니다. <br><br> UTC로 변환: UTC로 시간을 저장하고, 사용자의 시간대로 표시합니다. <br><br> 입력된 시간을 입력한 대로 사용: 시간대에 관계없이 입력된 시간을 저장하고 표시합니다. |
| 10진수(이전에는*Double*)                   | 두 배          | 16자리로 제한되는 10진수 값을 저장합니다. <br><br> 예: `999.9999999999999` (총 16자리)                                                                                                         |
| [암호화됨](./fields/encrypted-fields.md) | 끈            | 암호화된 문자열 값을 저장합니다.                                                                                                                                                                     |
| 정수                                   | 정수           | 최대 9자리 길이의 정수를 저장합니다. 고유한 값만 허용하도록 선택할 수 있습니다. <br><br> 최대값: `2147483647` <br><br> 최소값: `-2147483648`                                                          |
| Long 정수( 이전에는*Long*)                 | 긴            | 최대 16자리의 큰 정수를 저장합니다. <br><br> 최대값: `9007199254740991` <br><br> 최소값: `-9007199254740991`                                                                       |
| 긴 텍스트( 이전*Clob*)                     | 클로브          | 최대 65,000자를 지원하는 텍스트 상자 값을 저장합니다. 긴 텍스트 필드를 생성한 후 허용되는 문자 수를 제한하도록 구성할 수 있습니다.                                                                                                         |
| 다중 선택 선택 목록                          | 끈            | [선택 목록](../picklists.md)에서 하나 이상의 문자열 값을 저장합니다.                                                                                                                                        |
| 선택목록                                 | 끈            | [선택 목록](../picklists.md)에서 하나의 문자열 값을 저장합니다.                                                                                                                                           |
| 정밀도 십진수(이전에는*BigDecimal*)            | BigDecimal   | 반올림 없이 고정밀도의 십진수를 저장하며 최대 16자리의 십진수를 지원합니다. <br><br> 최대값: `99999999999999.9999999999999999` <br><br> 최소값: `-99999999999999.9999999999999999`                   |
| Relationship                         | 긴            | 모든 관련 개체 항목의 숫자 ID를 저장합니다. 개체는 일대다 관계의 하위 측 개체에 관계 필드를 자동으로 추가합니다. 자세한 내용은 [개체 관계 정의](./relationships/defining-object-relationships.md) 참조하세요.                                         |
| 서식있는 텍스트                             | 클로브          | 고급 서식 도구 및 미디어 요소(예: 이미지, 비디오, 오디오)를 사용하여 텍스트를 저장합니다.                                                                                                                                  |
| 텍스트( 이전*문자열*)                        | 끈            | 최대 280자의 간단한 텍스트 값을 저장합니다. 고유한 값만 허용하도록 선택할 수 있습니다. 필드를 생성한 후 허용되는 문자 수를 제한할 수 있습니다.                                                                                                   |


::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 객체에 필드 추가
:link: ./fields/adding-fields-to-objects.md
:::  

:::{grid-item-card} 사용자 정의 상태 추가 및 관리
:link: ./fields/adding-and-managing-custom-states.md
:::  

:::{grid-item-card} 집계 필드
:link: ./fields/aggregation-fields.md
:::  

:::{grid-item-card} 첨부 필드
:link: ./fields/attachment-fields.md
:::  

:::{grid-item-card} 암호화된 필드
:link: ./fields/encrypted-fields.md
:::
::::
