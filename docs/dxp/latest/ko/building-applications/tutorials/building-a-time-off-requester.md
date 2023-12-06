# 휴가 요청자 구축

{bdg-secondary}`라이프레이 7.4+`

Liferay 객체를 사용하면 코드를 작성하거나 모듈을 배포하지 않고도 전체 애플리케이션을 구축할 수 있습니다. 여기서는 Liferay [객체](../objects.md) 및 [Picklists](../objects/picklists/creating-picklists.md)을 사용하여 휴가 요청 애플리케이션을 생성합니다.

먼저 부서 값을 정의하기 위해 [선택 목록을 추가](#adding-a-department-picklist) 합니다. 그런 다음 두 개의 개체를 생성합니다. 하나는 [휴가 요청](#adding-a-time-off-request-object) 용이고 다른 하나는 [Employees]용(#adding-an-employee-object)입니다. 이 프로세스 중에 이러한 개체를 서로 연결하고 휴가 요청 개체에 웹훅을 추가하게 됩니다. 마지막으로 [사용자 정의 레이아웃을 디자인](#designing-custom-object-layouts) 하여 관계 필드를 표시합니다.

```{note}
시스템 개체 확장의 제한으로 인해 요청을 사용자 프로필과 연결하려면 직원 개체를 만들어야 합니다.
```

![Build a Time Off Request application.](./building-a-time-off-requester/images/01.png)

```{include} /_snippets/run-liferay-dxp.md
```

## 부서 선택 목록 추가

선택 목록은 회사 부서를 나타냅니다.

1. **전역 메뉴**(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **선택 목록** 을 클릭합니다.

1. **추가** 버튼(![추가 버튼](../../images/icon-add.png))을 클릭하고 이름에 **부서** 를 입력한 후 **저장** 을 클릭합니다.

1. 새 **선택 목록** 을 선택하고 **추가** 버튼(![추가 버튼](../../images/icon-add.png))을 사용하여 여기에 항목(예: 마케팅, 인사, 영업)을 추가합니다.

   ![Add items to the Department Picklist.](./building-a-time-off-requester/images/02.png)

이제 선택 목록을 휴가 요청 개체의 필드로 사용할 수 있습니다.

## 휴가 요청 개체 추가

1. **전역 메뉴**(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **개체** 를 클릭합니다.

1. **추가** 버튼( ![추가 버튼](../../images/icon-actions.png) )을 클릭하고 해당 값을 입력합니다.

   | 분야    | 가치        |
   | :---- | :-------- |
   | 라벨    | 휴가 요청     |
   | 복수 라벨 | 휴가 요청     |
   | 객체 이름 | TimeOff요청 |

1. **개체** 를 선택하고 **필드** 탭을 클릭한 다음 4개의 **필드** 를 추가합니다.

   | 라벨    | 필드 이름        | 유형   | 선택목록    | 요구하는 |
   | :---- | :----------- | :--- | :------ | :--- |
   | 시작 날짜 | `startDate`  | 날짜   | 해당사항 없음 | ✔    |
   | 최후 날짜 | `endDate`    | 날짜   | 해당사항 없음 |      |
   | 부서    | `department` | 선택목록 | 부서      | ✔    |
   | 댓글    | `comments`   | 원본   | 해당사항 없음 |      |

   ![Add the Start Date, End Date, Department, and Comments fields to the Object.](./building-a-time-off-requester/images/03.png)

1. **작업** 탭을 클릭하고 이 작업을 추가하세요.

   | 분야    | 가치                                                     |
   | :---- | :----------------------------------------------------- |
   | 액션 이름 | 생성 동기화                                                 |
   | 때     | 추가 이후 시                                                |
   | 그 다음에 | Webhook                                                |
   | URL   | 앱이나 https://webhook.site와 같은 사이트에서 테스트 웹훅 URL을 입력하세요. |

   이 작업은 휴가 요청 항목이 추가될 때마다 외부 시스템으로 데이터를 보냅니다. 자세한 내용은 [액션 정의](../objects/creating-and-managing-objects/actions/defining-object-actions.md)를 참조하세요.

   ![Create a webhook action that's triggered after requests are added.](./building-a-time-off-requester/images/04.png)

1. **세부정보** 탭을 클릭하고 다음 항목 표시 및 범위 설정을 지정합니다.

   | 분야    | 가치        |
   | :---- | :-------- |
   | 제목 필드 | 시작 날짜     |
   | 범위    | 회사        |
   | 패널 링크 | 응용분야 > 통신 |

1. **게시** 를 클릭하세요. 그러면 개체가 활성화됩니다.

다음으로 직원 개체를 생성하고 이를 휴가 요청 개체와 연결하여 요청 항목을 개별 사용자와 연결할 수 있습니다.

## 직원 개체 추가

1. **전역 메뉴**(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **개체** 를 클릭합니다.

1. **추가** 버튼( ![추가 버튼](../../images/icon-actions.png) )을 클릭하고 해당 값을 입력합니다.

   | 분야    | 가치 |
   | :---- | :- |
   | 라벨    | 직원 |
   | 복수 라벨 | 직원 |
   | 객체 이름 | 직원 |

1. **개체** 를 선택하고 **필드** 탭을 클릭한 다음 이러한 **필드** 를 추가합니다.

   | 라벨  | 필드 이름   | 유형 | 요구하는 |
   | :-- | :------ | :- | :--- |
   | 이름  | `name`  | 원본 | ✔    |
   | 이메일 | `email` | 원본 | ✔    |

   ![Add the Name and Email fields to the Object.](./building-a-time-off-requester/images/05.png)

1. **관계** 탭을 클릭하고 이 관계를 추가하세요.

   | 분야     | 가치        |
   | :----- | :-------- |
   | 라벨     | 요청자       |
   | 관계 이름  | 요청자       |
   | 유형     | 원투멀리      |
   | Object | TimeOff요청 |

   ```{note}
   이 관계를 생성하면 휴가 요청 개체에 외래 키 필드가 자동으로 추가됩니다.
   ```

   ![Add a One to Many Relationship with the Time Off Request Object.](./building-a-time-off-requester/images/06.png)

1. **세부정보** 탭을 클릭하고 다음 항목 표시 및 범위 설정을 지정합니다.

   | 분야    | 가치        |
   | :---- | :-------- |
   | 제목 필드 | 이름        |
   | 범위    | 회사        |
   | 패널 링크 | 제어판 > 사용자 |

1. **게시** 를 클릭하세요.

게시되면 Liferay UI 또는 Headless API를 통해 항목을 생성할 수 있습니다. 그러나 이러한 항목을 요청 항목과 연결하려면 먼저 [사용자 정의 레이아웃](#designing-custom-object-layouts) 을 만들어야 합니다.

## 사용자 정의 개체 레이아웃 디자인

개체 레이아웃은 개체 항목을 생성하고 편집할 때 필드가 구성되는 방식을 결정합니다. 관계는 기본 개체 레이아웃에 표시되지 않으므로 관계 필드를 표시하려면 두 개체 모두에 대한 사용자 정의 레이아웃을 디자인해야 합니다.

### 휴가 요청의 경우

1. **객체** 애플리케이션으로 이동하여 **휴가 요청** 객체를 선택합니다.

1. **레이아웃** 탭을 클릭하고 **추가** 버튼( ![추가 버튼](../../images/icon-actions.png) )을 클릭한 다음 이름에 **요청** 을 입력하고 **저장** 을 클릭합니다.

1. 새 레이아웃을 선택하고 **기본값으로 표시** 상자를 선택합니다.

   ![Add a new Layout and mark it as the Object's default layout.](./building-a-time-off-requester/images/07.png)

4. **레이아웃** 탭을 클릭하고 두 개의 **블록** 이 있는 **탭** 을 추가하세요.

   | 요소 | 라벨    | 유형      |
   | :- | :---- | :------ |
   | 탭  | 정보 요청 | 분야      |
   | 구획 | 날짜    | 해당사항 없음 |
   | 구획 | 세부사항  | 해당사항 없음 |

1. 블록에 필드를 추가합니다.

   | 구획   | 분야           |
   | :--- | :----------- |
   | 날짜   | 시작 날짜, 종료 날짜 |
   | 세부사항 | 부서, 직원, 설명   |

   ![Add the Start Date, End Date, Department, Employee, and Comments fields to the layout blocks.](./building-a-time-off-requester/images/08.png)

1. **저장** 을 클릭하세요.

저장되면 Liferay UI에서 휴가 요청 항목을 생성하고 편집하기 위해 새 레이아웃이 사용됩니다. 직원 항목이 있는 경우 이를 개별 요청과 연결할 수 있습니다.

![The layout is used for creating and editing Time Off Request entries.](./building-a-time-off-requester/images/09.png)

### 직원용

1. **객체** 애플리케이션으로 이동하여 **Employee** 객체를 선택합니다.

1. **레이아웃** 탭을 클릭하고 **추가** 버튼( ![추가 버튼](../../images/icon-actions.png) )을 클릭한 다음 이름에 **직원 정보** 를 입력하고 **저장** 을 클릭합니다.

1. 새 레이아웃을 선택하고 **기본값으로 표시** 상자를 선택합니다.

1. **레이아웃** 탭을 클릭하고 하나의 블록이 있는 필드 탭을 추가합니다.

   | 요소 | 라벨      | 유형      |
   | :- | :------ | :------ |
   | 탭  | 기본 세부정보 | 분야      |
   | 구획 | 직원 정보   | 해당사항 없음 |

1. 블록에 **이름** 및 **이메일** 필드를 추가합니다.

1. 직원 개체의 요청자 관계에 대한 관계 탭을 추가합니다.

   | 요소 | 라벨    | 유형 | Relationship |
   | :- | :---- | :- | :----------- |
   | 탭  | 휴가 요청 | 관계 | 요청자          |

   ![Add a Relationships tab for the Object's Requester relationship.](./building-a-time-off-requester/images/10.png)

1. **저장** 을 클릭하세요.

저장되면 직원 항목을 생성하고 편집하기 위해 Liferay UI에서 새 레이아웃이 사용됩니다. 요청 항목이 있는 경우 **휴가 요청** 탭의 직원 항목과 연결할 수 있습니다. 여기서는 직원 선택 항목과 관련된 모든 요청을 볼 수도 있습니다.

![The layout is used to create and edit employee entries.](./building-a-time-off-requester/images/11.png)

## 객체 항목 추가

이제 앱이 완성되었으므로 Liferay UI 및 Headless API를 사용하여 휴가 요청 및 직원 개체에 데이터를 추가할 수 있습니다.

### 직원 추가

Headless API를 사용하여 직원 항목을 추가하려면 다음 단계를 따르세요.

1. Liferay의 **API 탐색기**(예: `localhost:8080/o/api`)를 열고 **REST 응용 프로그램** 드롭다운 메뉴를 클릭한 다음 **c/employees** 를 클릭합니다.

1. 일괄 `POST` API에 대한 요청 본문에 이 스크립트를 입력합니다.

   ```json
   [
     {
       "email": "foo@liferay.com",
       "name": "Able"
     },
     {
       "email": "bar@liferay.com",
       "name": "Baker"
     },
     {
       "email": "goo@liferay.com",
       "name": "Charlie"
     }
   ]
   ```

1. **실행** 을 클릭하세요.

이렇게 하면 Employee 개체에 세 개의 항목이 추가됩니다.

### 휴가 요청 추가

Liferay UI를 통해 요청 항목을 추가하려면 다음 단계를 따르세요.

1. **글로벌 메뉴**(![글로벌 메뉴](../../images/icon-applications-menu.png))를 열고 **애플리케이션** 탭을 클릭한 다음 **휴가 요청** 을 선택합니다.

1. **추가** 버튼(![추가 버튼](../../images/icon-actions.png))을 클릭하고 양식을 작성합니다.

1. **저장** 을 클릭하세요.

항목을 저장하면 해당 항목의 편집 화면이 표시됩니다. 항목을 더 추가하려면 휴가 요청 메인 페이지로 돌아가세요. 시간 요청이 추가되면 개체의 웹후크가 트리거되고 항목의 데이터가 설정된 URL에 게시됩니다.

요청이 추가되고 직원 항목과 관련되면 직원 애플리케이션에서 해당 요청을 볼 수 있습니다. **전역 메뉴**(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **직원** 을 클릭합니다. 관련 **항목** 을 선택하고 **휴가 요청** 탭을 클릭하세요.

![View an employee's related requests in the Time Off Requests tab.](./building-a-time-off-requester/images/12.png)

## 관련 주제

* [객체 개요](../objects.md)
* [객체 생성](../objects/creating-and-managing-objects/creating-objects.md)
* [선택 목록 만들기](../objects/picklists/creating-picklists.md)
