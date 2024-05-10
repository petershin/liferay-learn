# 배포자 애플리케이션에 대한 알림 템플릿 추가

현재까지 Delectable Bonsai의 디스트리뷰터 애플리케이션에는 참가 이벤트에 대한 자동 알림이 없습니다. 즉, 관리자는 개체를 확인하여 새로운 제출물을 확인하고 지원자에게 지원서 상태를 수동으로 알려야 합니다. 이 전략은 확장되지 않고 사람의 실수에 대한 여지를 남기므로 기회를 놓치거나 사용자 경험이 저하됩니다.

여기서는 Distributor Application 개체와 함께 사용할 알림 템플릿을 만듭니다.

| 사건           | 수령인 | 유형  |
|:------------ |:--- |:--- |
| 신청서가 제출되었습니다 | 관리  | 사용자 |
| 지원서 접수 완료    | 응모자 | 이메일 |
| 신청이 승인되었습니다  | 응모자 | 이메일 |
| 신청이 거부되었습니다  | 응모자 | 이메일 |

![배포자 응용 프로그램 개체에 대한 네 개의 알림 템플릿을 만듭니다.](./adding-notification-templates/images/01.png)

## 신청서 제출 템플릿

1. **전역 메뉴**( ![Global Menu](../../images/icon-applications-menu.png) )을 열고 **제어판** 탭으로 이동한 다음 **템플릿** 클릭합니다.

1. **추가**( ![Add Button](../../images/icon-add.png) )을 클릭하고 **사용자 알림** 선택합니다.

1. 용어 정의까지 아래로 스크롤하고 엔터티 드롭다운 메뉴를 사용하여 **Distributor Application** 개체를 선택합니다.

   ![용어 정의까지 아래로 스크롤하고 대리점 신청을 선택합니다.](./adding-notification-templates/images/02.png)

   템플릿에서 이러한 필드 참조를 사용하여 항목 데이터로 알림을 동적으로 채울 수 있습니다. 일반 용어 섹션에는 알림 작업을 트리거하는 사용자의 필드를 참조하는 용어가 있습니다.

1. 기본 정보에 다음 값을 입력하세요.

   | 분야 | 가치                                        |
   |:-- |:----------------------------------------- |
   | 이름 | 신청서 제출됨, 관리자, 사용자                         |
   | 묘사 | 배포자 응용 프로그램이 제출될 때마다 관리 역할에 사용자 알림을 보냅니다. |

   ![기본 정보에 다음 값을 입력하세요.](./adding-notification-templates/images/03.png)

1. 설정에 다음 값을 입력합니다.

   | 분야  | 가치        |
   |:--- |:--------- |
   | 수령인 | 역할        |
   | 역할  | 사업 개발 매니저 |

   ![설정에 다음 값을 입력합니다.](./adding-notification-templates/images/04.png)

1. 콘텐츠에 다음 값을 입력하세요.

   | 분야 | 가치                                                                                                                                             |
   |:-- |:---------------------------------------------------------------------------------------------------------------------------------------------- |
   | 주제 | APP-\[%DISTRIBUTORAPPLICATION_ID%]: [%DISTRIBUTORAPPLICATION **APPLICANTNAME%\] \[%DISTRIBUTORAPPLICATION** BUSINESSNAME%\]에 대한 대리점 신청서를 제출했습니다. |

   ![콘텐츠에 이 값을 입력합니다.](./adding-notification-templates/images/05.png)

1. **저장** 클릭하세요.

   ```{tip}
   알림 템플릿 ERC는 무작위로 생성된 UUID를 사용하지만 템플릿 생성 후 템플릿의 ERC를 변경할 수 있습니다. 일관되고 사람이 읽을 수 있는 ERC를 사용하면 환경(예: `APPLICATION_SUBMITTED_ADMIN_USER`) 간에 템플릿과 개체를 이동할 때 도움이 될 수 있습니다.
   ```

## 신청서 접수 템플릿

1. **추가**( ![Add Button](../../images/icon-add.png) )을 클릭하고 **이메일** 선택하십시오.

1. 기본 정보에 다음 값을 입력하세요.

   | 분야 | 가치                                     |
   |:-- |:-------------------------------------- |
   | 이름 | 지원서 접수, 지원자, 이메일                       |
   | 묘사 | 지원서가 접수되었음을 알리기 위해 지원자에게 이메일 알림을 보냅니다. |

   ![기본 정보에 다음 값을 입력하세요.](./adding-notification-templates/images/06.png)

1. 설정에 다음 값을 입력합니다.

   | 분야     | 가치                                        |
   |:------ |:----------------------------------------- |
   | 에      | [%DISTRIBUTORAPPLICATION_APPLICANTEMAIL%] |
   | 참조     | N/A                                       |
   | 숨은 참조  | N/A                                       |
   | 가정 주소  | `sales@delectable-bonsai.com`             |
   | 확고한 이름 | 맛있는 분재                                    |

   ![설정에 다음 값을 입력합니다.](./adding-notification-templates/images/07.png)

1. 콘텐츠에 다음 값을 입력합니다.

   | 분야     | 가치                                                                                                                                                                                                                                                                                                                                                     |
   |:------ |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
   | 주제     | 신청서를 제출해 주셔서 감사합니다!                                                                                                                                                                                                                                                                                                                                    |
   | 편집기 유형 | 서식있는 텍스트                                                                                                                                                                                                                                                                                                                                               |
   | 템플렛    | **소스** 버튼( ![Source button](../../images/icon-code.png) )을 클릭합니다. 그런 다음 [`ApplicationReceived_Applicant_Email.html`](https://resources.learn.liferay.com/w/courses/application-development/implementing-business-logic/automating-notifications/adding-notification-templates/ApplicationReceived_Applicant_Email) 내용을 템플릿 필드에 복사하여 붙여넣습니다. |

<!-- Not sure the above will work; we'll have to see. -Rich --> 

   ![콘텐츠에 다음 값을 입력합니다.](./adding-notification-templates/images/08.png)

   렌더링되면 메시지 본문은 다음과 같아야 합니다.

   ![콘텐츠에 다음 값을 입력합니다.](./adding-notification-templates/images/09.png)

1. **저장** 클릭하세요.

## 신청서 승인 템플릿

1. **추가**( ![Add Button](../../images/icon-add.png) )을 클릭하고 **이메일** 선택하십시오.

1. 기본 정보에 다음 값을 입력하세요.

   | 분야 | 가치                                 |
   |:-- |:---------------------------------- |
   | 이름 | 신청서 승인됨, 신청자, 이메일                  |
   | 묘사 | 지원자에게 이메일 알림을 보내 지원서가 승인되었음을 알립니다. |

1. 설정에 다음 값을 입력합니다.

   | 분야     | 가치                                        |
   |:------ |:----------------------------------------- |
   | 에      | [%DISTRIBUTORAPPLICATION_APPLICANTEMAIL%] |
   | 참조     | N/A                                       |
   | 숨은 참조  | N/A                                       |
   | 가정 주소  | `sales@delectable-bonsai.com`             |
   | 확고한 이름 | 맛있는 분재                                    |

1. 콘텐츠에 다음 값을 입력합니다.

   | 분야     | 가치                                                                                                                                                                                                                                                                                                                                                      |
   |:------ |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
   | 주제     | 달콤한 것들이 당신을 위해 준비되어 있습니다!                                                                                                                                                                                                                                                                                                                               |
   | 편집기 유형 | 서식있는 텍스트                                                                                                                                                                                                                                                                                                                                                |
   | 템플렛    | **소스** 버튼( ![Source button](../../images/icon-code.png) )을 클릭합니다. 그런 다음 [`ApplicationApproved_Applicant_Email.html`](https://resources.learn.liferay.com/w/courses/application-development/implementing-business-logic/automating-notifications/adding-notification-templates/ApplicationApproved_Applicant_Email) 내용을 복사하여 템플릿 입력란에 붙여넣습니다. |

   렌더링되면 메시지 본문은 다음과 같아야 합니다.

   ![콘텐츠에 다음 값을 입력합니다.](./adding-notification-templates/images/10.png)

1. **저장** 클릭하세요.

## 애플리케이션 거부 템플릿

1. **추가**( ![Add Button](../../images/icon-add.png) )을 클릭하고 **이메일** 선택하십시오.

1. 기본 정보에 다음 값을 입력하세요.

   | 분야 | 가치                                |
   |:-- |:--------------------------------- |
   | 이름 | 신청 거부됨, 신청자, 이메일                  |
   | 묘사 | 지원자에게 이메일 알림을 보내 지원이 거부되었음을 알립니다. |

1. 설정에 다음 값을 입력합니다.

   | 분야     | 가치                                        |
   |:------ |:----------------------------------------- |
   | 에      | [%DISTRIBUTORAPPLICATION_APPLICANTEMAIL%] |
   | 참조     | N/A                                       |
   | 숨은 참조  | N/A                                       |
   | 가정 주소  | `sales@delectable-bonsai.com`             |
   | 확고한 이름 | 맛있는 분재                                    |

1. 콘텐츠에 다음 값을 입력합니다.

   | 분야     | 가치                                                                                                                                                                                                                                                                                                                                                  |
   |:------ |:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
   | 주제     | 신청 결정 업데이트                                                                                                                                                                                                                                                                                                                                          |
   | 편집기 유형 | 서식있는 텍스트                                                                                                                                                                                                                                                                                                                                            |
   | 템플렛    | **소스** 버튼( ![Source button](../../images/icon-code.png) )을 클릭합니다. 그런 다음 [`ApplicationDenied_Applicant_Email.html`](https://resources.learn.liferay.com/w/courses/application-development/implementing-business-logic/automating-notificiations/adding-notification-templates/ApplicationDenied_Applicant_Email) 내용을 복사하여 템플릿 필드에 붙여넣습니다. |

   렌더링되면 메시지 본문은 다음과 같아야 합니다.

   ![콘텐츠에 다음 값을 입력합니다.](./adding-notification-templates/images/11.png)

1. **저장** 클릭하세요.

엄청난! 이제 이러한 템플릿을 추가했으므로 이를 사용하여 배포자 애플리케이션 개체에서 알림 작업을 정의할 수 있습니다.

다음: [알림 작업 추가](./adding-notification-actions.md)

## 관련 개념

* [알림 템플릿 생성](https://learn.liferay.com/w/dxp/process-automation/notifications/creating-notification-templates)
