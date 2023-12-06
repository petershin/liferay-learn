# 개체 정의 간의 관계 추가

맛있는 분재 신청서는 여러 평가와 연관되어 있어야 합니다. 여기에는 배포자 응용 프로그램 개체에 일대다 관계를 추가하는 작업이 포함됩니다.

1. Distributor Application 개체 편집을 시작합니다.

1. **관계** 탭으로 이동합니다.

1. **추가**(![추가 버튼](../../images/icon-add.png))를 클릭하고 다음 세부정보를 입력합니다.

   | 분야     | 가치                         |
   | :----- | :------------------------- |
   | 라벨     | 평가에의 적용                    |
   | 이름     | `applicationToEvaluations` |
   | 유형     | 원투멀리                       |
   | Object | 신청 평가                      |

1. **저장** 을 클릭하세요.

   이렇게 하면 정의 레이아웃의 별도 탭에 추가할 수 있는 관계 테이블이 배포자 응용 프로그램에 추가됩니다.

   ![Add the applicationToEvaluations relationship to the Distributor Application object.](./adding-a-relationship-between-the-object-definitions/images/01.png)

   또한 관계는 응용 프로그램 평가 개체 정의에 필드를 추가합니다.

   ![For the Application Evaluation object, the relationship appears in the Fields tab.](./adding-a-relationship-between-the-object-definitions/images/02.png)

   Liferay는 또한 REST API를 사용하여 항목을 연결하고 연결 해제하기 위해 두 개체 정의에 전용 관계 REST 끝점을 추가합니다.

   ![Liferay adds dedicated relationship REST endpoints to both object definitions.](./adding-a-relationship-between-the-object-definitions/images/03.png)

개체 항목 연결을 연습하기 전에 각 개체의 사용자 정의 레이아웃에 관계를 추가해야 합니다.

다음: [사용자 정의 레이아웃에 관계 추가](./adding-the-relationship-to-custom-layouts.md)

## 관련 개념

* [Relationships](https://learn.liferay.com/en/w/dxp/building-applications/objects/creating-and-managing-objects/relationships)
* [관계 REST API](https://learn.liferay.com/en/w/dxp/building-applications/objects/understanding-object-integrations/using-custom-object-apis#relationship-rest-apis)
