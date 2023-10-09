# 배포자 애플리케이션 개체에 필드 추가

여기에서는 추가 지원자 및 연락처 정보를 수집하기 위해 Distributor Application 개체에 일반 필드를 추가합니다.

1. *전역 메뉴* ( ![Global Menu](../../images/icon-applications-menu.png) )을 열고 *제어판* 탭으로 이동한 다음 *개체*클릭합니다.

1. Distributor Application 개체 편집을 시작하고 *Fields* 탭으로 이동합니다.

1. *Add* (![Add Button](../../images/icon-add.png))을 클릭하고 세부 정보를 입력한 후 *Save*클릭합니다.

   | 분야        | 가치               |
   |:--------- |:---------------- |
   | 라벨        | 지원자 이메일          |
   | 필드 이름     | `applicantEmail` |
   | 유형        | 원본               |
   | 필수적인      | 틀린               |
   | 고유한 값만 허용 | 여실한              |

   ![지원자 이메일 필드를 추가합니다.](./adding-fields-to-the-distributor-application-object/images/01.png)

1. 기본 연락처 이름에 대한 필드를 추가합니다.

   | 분야        | 가치                   |
   |:--------- |:-------------------- |
   | 라벨        | 기본 담당자 이름            |
   | 필드 이름     | `primaryContactName` |
   | 유형        | 원본                   |
   | 필수적인      | 틀린                   |
   | 고유한 값만 허용 | 틀린                   |

1. 기본 연락처의 제목에 대한 필드를 추가합니다.

   | 분야        | 가치                    |
   |:--------- |:--------------------- |
   | 라벨        | 기본 연락처 직함             |
   | 필드 이름     | `primaryContactTitle` |
   | 유형        | 원본                    |
   | 필수적인      | 틀린                    |
   | 고유한 값만 허용 | 틀린                    |

1. 기본 연락처의 이메일 필드를 추가합니다.

   | 분야        | 가치                    |
   |:--------- |:--------------------- |
   | 라벨        | 기본 연락처 이메일            |
   | 필드 이름     | `primaryContactEmail` |
   | 유형        | 원본                    |
   | 필수적인      | 틀린                    |
   | 고유한 값만 허용 | 여실한                   |

1. 기본 연락처의 전화번호 필드를 추가합니다.

   | 분야        | 가치                          |
   |:--------- |:--------------------------- |
   | 라벨        | 기본 연락 전화번호                  |
   | 필드 이름     | `primaryContactPhoneNumber` |
   | 유형        | 원본                          |
   | 필수적인      | 틀린                          |
   | 고유한 값만 허용 | 여실한                         |

1. 설명 필드를 추가합니다.

   | 분야    | 가치         |
   |:----- |:---------- |
   | 라벨    | 댓글         |
   | 필드 이름 | `comments` |
   | 유형    | 긴 텍스트      |
   | 필수적인  | 틀린         |

저장된 각 필드는 배포자 응용 프로그램 개체에 즉시 추가되며 항목을 만들 때 기본 레이아웃에 자동으로 나타납니다.

![새 필드를 포함하는 새 항목을 추가합니다.](./adding-fields-to-the-distributor-application-object/images/02.png)

새 필드는 개체의 기본 테이블 보기에도 나타납니다.

![기본 테이블 보기에는 모든 사용자 정의 필드가 포함됩니다.](./adding-fields-to-the-distributor-application-object/images/03.png)

엄청난! 이 필드는 맛있는 분재가 예비 지원자와 후속 조치를 취하는 데 도움이 될 수 있습니다.

이제 객체 정의에는 KYC 및 AML 정책에 따라 비즈니스 정보를 수집하기 위한 추가 필드가 필요합니다. 이러한 필드를 수동으로 추가하는 대신 `object-admin` REST API를 사용하여 프로그래밍 방식으로 추가합니다.

다음: [REST API를 사용하여 필드 추가](./adding-fields-using-rest-apis.md)

## 관련 개념

* [분야](https://learn.liferay.com/en/w/dxp/building-applications/objects/creating-and-managing-objects/fields)
* [객체에 필드 추가](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/fields/adding-fields-to-objects)
