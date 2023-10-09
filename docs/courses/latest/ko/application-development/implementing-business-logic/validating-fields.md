# 필드 유효성 검사

지금까지 Delectable Bonsai에서는 지원자가 지원서에 유효하고 일관된 데이터를 제공하는지 확인할 수 있는 방법이 없습니다. 여기에서는 데이터 무결성과 일관성을 향상시키기 위해 배포자 애플리케이션의 이메일, 전화번호 및 URL 필드에 대한 유효성 검사를 추가합니다.

![이메일, 전화번호, URL 필드에 대한 유효성 검사를 추가합니다.](./validating-fields/images/01.png)

## 이메일 필드에 대한 유효성 검사 추가

Liferay는 필드 값이 표준 이메일 요소(예: @gmail, .com)를 사용하는지 확인하기 위해 `isEmailAddress()` 함수를 제공합니다.

`지원자 이메일` 및 `기본 연락처 이메일` 필드를 검증하려면 다음 단계를 따르세요.

1. *전역 메뉴* ( ![Global Menu](../../images/icon-applications-menu.png) )을 열고 *제어판* 탭으로 이동한 다음 *개체*클릭합니다.

1. Distributor Application 개체 편집을 시작하고 *Validations* 탭으로 이동합니다.

1. *추가* ( ![Add Button](../../images/icon-add.png) )을 클릭하고 세부 정보를 입력한 후 *저장*클릭합니다.

   | 분야 | 가치          |
   |:-- |:----------- |
   | 라벨 | 이메일, 지원자이메일 |
   | 유형 | 표현식 빌더      |

   ![라벨을 입력하고 유형을 선택한 후 저장을 클릭합니다.](./validating-fields/images/02.png)

1. 새로 생성된 유효성 검사 편집을 시작합니다.

1. 기본 정보 탭에서 다음 값을 설정합니다.

   | 분야      | 가치   |
   |:------- |:---- |
   | 활성 검증   | 여실한  |
   | 이벤트 트리거 | 제출 시 |

   ![유효성 검사를 활성화하고 제출 시 트리거를 선택합니다.](./validating-fields/images/03.png)

1. *조건* 탭으로 이동하여 다음 값을 입력합니다.

   | 분야     | 가치                                                       |
   |:------ |:-------------------------------------------------------- |
   | 표현식 빌더 | `isEmailAddress(applicantEmail) OR applicantEmail == ""` |
   | 오류 메세지 | 유효한 지원자 이메일 주소를 입력하세요.                                   |

   이를 위해서는 필드 값이 표준 이메일 패턴을 따르거나 비어 있어야 합니다.

   ```{tip}
   유효성 검사를 사용하면 사용자가 필드를 비워 두는 것을 허용하지 않음으로써 선택적 필드를 필수로 만들 수 있습니다.
   ```

   ![지원자 이메일 필드와 함께 isEmailAddress 함수를 사용하세요.](./validating-fields/images/04.png)

   사용자가 잘못된 값으로 항목을 제출하려고 하면 Liferay는 설정된 오류 메시지를 표시합니다.

   ![최종 사용자가 잘못된 값을 제출하려고 할 때 표시되는 오류 메시지를 입력하세요.](./validating-fields/images/05.png)

1. *저장*클릭하세요.

   ![저장을 클릭하여 유효성 검사를 활성화합니다.](./validating-fields/images/06.png)

1. `isEmailAddress()` 함수를 사용하여 `PrimaryContactEmail` 필드의 유효성을 검사하려면 위 단계를 반복하세요.

## 전화번호 필드에 대한 유효성 검사 추가

Liferay는 필드 값이 지정된 RegEx 패턴 또는 문자열 값과 일치하는지 확인하기 위해 `match()` 함수를 제공합니다. 이 시나리오에서 Delectable Bonsai는 다음 표현식을 사용하여 전화번호 필드의 유효성을 검사하려고 합니다. `^(\+\d{1,3} ?)?((\(\d{1,3}\))|\d{1,3})[- .]?\ d{3,4}[- .]?\d{4}$`.

다음 단계에 따라 `mainContactPhoneNumber`, `businessPhoneNumber`, `bankPhoneNumber`, `referencePhoneNumber` 필드를 검증하세요.

1. 유효성 검사 탭에서 *추가* ( ![Add Button](../../images/icon-add.png) )을 클릭하고 세부 정보를 입력한 후 *저장*클릭합니다.

   | 분야 | 가치              |
   |:-- |:--------------- |
   | 라벨 | 전화번호, 기본연락처전화번호 |
   | 유형 | 표현식 빌더          |

1. 새로 생성된 유효성 검사 편집을 시작합니다.

1. 기본 정보 탭에서 다음 값을 설정합니다.

   | 분야      | 가치   |
   |:------- |:---- |
   | 활성 검증   | 여실한  |
   | 이벤트 트리거 | 제출 시 |

1. *조건* 탭으로 이동하여 다음 값을 입력합니다.

   | 분야     | 가치                                                                                                                                               |
   |:------ |:------------------------------------------------------------------------------------------------------------------------------------------------ |
   | 표현식 빌더 | `match(primaryContactPhoneNumber, "^(\+\d{1,3} ?)?((\(\d{1,3}\))|\d{1,3})[- .]?\d{3,4}[- .]?\d{4}$") OR primaryContactPhoneNumber == ""` |
   | 오류 메세지 | 기본 연락처로 유효한 전화번호를 입력하세요.                                                                                                                         |

   <!--FINISH: Confirm the above regex pattern renders correctly in the site. In my preview, the | character breaks the table. -->

   이 유효성 검사는 국제 국가 코드, 지역 코드 및 구분 기호를 허용하여 광범위한 국제 전화 번호를 지원합니다. 또한 다양한 형식(예: 공백, 대시, 점)을 허용하지만 최소 7자리, 최대 11자리를 적용합니다. 필드는 선택 사항이므로 이 유효성 검사에서는 빈 값도 허용됩니다.

1. *저장*클릭하세요.

1. `businessPhoneNumber`, ``, `referencePhoneNumber` 필드에 대해 이 단계를 반복합니다.

## 비즈니스 웹사이트 필드에 대한 유효성 검사 추가

Liferay는 필드 값이 표준 URL 요소(예: `http`, `://`, `.com`)를 사용하는지 확인하기 위한 `isURL()` 함수를 제공합니다.

<!--FINISH: Confirm :// renders correctly in the site. My preview renders :/ as an emoji. -->

`businessWebsite` 필드의 유효성을 검사하려면 다음 단계를 따르세요.

1. 유효성 검사 탭에서 *추가* ( ![Add Button](../../images/icon-add.png) )을 클릭하고 세부 정보를 입력한 후 *저장*클릭합니다.

   | 분야 | 가치            |
   |:-- |:------------- |
   | 라벨 | URL, 비즈니스웹사이트 |
   | 유형 | 표현식 빌더        |

1. 새로 생성된 유효성 검사 편집을 시작합니다.

1. 기본 정보 탭에서 다음 값을 설정합니다.

   | 분야      | 가치   |
   |:------- |:---- |
   | 활성 검증   | 여실한  |
   | 이벤트 트리거 | 제출 시 |

1. *조건* 탭으로 이동하여 다음 값을 입력합니다.

   | 분야     | 가치                                                |
   |:------ |:------------------------------------------------- |
   | 표현식 빌더 | `isURL(businessWebsite) OR businessWebsite == ""` |
   | 오류 메세지 | 유효한 웹사이트 URL을 입력하세요.                              |

1. *저장*클릭하세요.

완료되면 7번의 검증을 거쳐야 합니다.

![7개의 검증이 있어야 합니다.](./validating-fields/images/07.png)

## 검증 테스트

활성화되어 있으므로 유효성 검사 테스트를 시작할 수 있습니다.

1. 배포자 응용 프로그램을 열고 항목 편집을 시작합니다.

1. 이메일 필드를 잘못된 값으로 업데이트하고 *저장*클릭하세요. 유효성 검사 오류 메시지가 나타납니다.

   ![Liferay는 유효성 검사 오류 메시지를 표시합니다.](./validating-fields/images/08.png)

1. 해당 필드에 유효한 이메일을 입력하고 *저장*클릭하세요. 성공적으로 저장됩니다.

1. 전화번호 및 웹사이트 유효성 검사를 테스트하려면 이 과정을 반복하세요

   <!-- ![Liferay displays the validation's error message.](./validating-fields/images/09.png) -->

   <!-- ![Liferay displays the validation's error message.](./validating-fields/images/10.png) -->

엄청난! 신청서를 제출하는 대리점은 유효한 필드 값을 입력해야 합니다.

이제 Delectable Bonsai는 의도된 사용자만 배포자 응용 프로그램 및 응용 프로그램 평가 개체에 대한 데이터에 액세스할 수 있도록 보장하려고 합니다.

다음: [데이터에 대한 액세스 관리](./managing-access-to-data.md)

## 관련 개념

* [검증](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects/creating-and-managing-objects/validations)
* [식 작성기 유효성 검사 참조](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects/creating-and-managing-objects/validations/expression-builder-validations-reference)
