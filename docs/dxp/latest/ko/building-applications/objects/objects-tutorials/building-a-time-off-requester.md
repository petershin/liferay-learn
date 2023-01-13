# 휴가 요청자 만들기

> 사용 가능: Liferay DXP/Portal 7.4+

Liferay Objects를 사용하면 코드를 작성하거나 모듈을 배포하지 않고도 전체 애플리케이션을 구축할 수 있습니다. 여기서는 Liferay [Objects](../../objects.md) 및 [Picklists](../picklists/using-picklists.md)을 사용하여 휴가 요청 애플리케이션을 생성합니다.

먼저 부서 [을 정의하기 위한 선택 목록을 추가](#adding-a-department-picklist). 그런 다음 [개의 휴가 요청](#adding-a-time-off-request-object) 에 대한 개체와 [직원](#adding-an-employee-object)에 대한 개체 등 두 개의 개체를 만듭니다. 이 프로세스 중에 이러한 개체를 서로 연결하고 휴가 요청 개체에 웹후크를 추가합니다. 마지막으로 관계 필드를</a> 하기 위해 맞춤
을 디자인합니다.</p> 



```{note}
시스템 개체 확장에 대한 제한으로 인해 요청을 사용자 프로필과 연결하려면 직원 개체를 만들어야 합니다. 
```


![휴가 요청 애플리케이션을 작성하십시오.](./building-a-time-off-requester/images/01.png)

```{include} /_snippets/run-liferay-dxp.md


```

## Adding a Department Picklist

Your Picklist represents company departments:

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Picklists*.

1. Click the *Add* button (![Add Button](../../../images/icon-add.png)), enter *Department* for name, and click *Save*.

1. Select the new *Picklist* and use the *Add* button (![Add Button](../../../images/icon-add.png)) to add items to it (e.g., Marketing, Human Resources, Sales).

   ![Add items to the Department Picklist.](./building-a-time-off-requester/images/02.png)

You can now use the Picklist as a field in the Time Off Request Object.

## Adding a Time Off Request Object

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Objects*.

1. Click the *Add* button ( ![Add Button](../../../images/icon-actions.png) ) and enter these values.

   | Field | Value |
   | :--- | :--- |
   | Label | Time Off Request |
   | Plural Label | Time Off Requests |
   | Object Name | TimeOffRequest |

1. Select the *Object*, click the *Fields* tab, and add these four *fields*.

   | Label | Field Name | Type | Picklist | Required |
   | :--- | :--- | :--- | :--- | :--- |
   | Start Date | `startDate` | Date | n/a | &#10004; |
   | End Date | `endDate` | Date | n/a |  |
   | Department | `department` | Picklist | Department | &#10004; |
   | Comments | `comments` | Text | n/a |  |

   ![Add the Start Date, End Date, Department, and Comments fields to the Object.](./building-a-time-off-requester/images/03.png)

1. Click the *Actions* tab and add this action.

   | Field | Value |
   | :--- | :--- |
   | Action Name | Creation Sync |
   | When | On After Add |
   | Then | Webhook |
   | URL | Enter a test webhook URL from either your app or a site like, https://webhook.site. |

   This action sends data to an external system whenever Time Off Request entries are added. See [Defining Actions](../creating-and-managing-objects/actions/defining-object-actions.md) for more information.

   ![Create a webhook action that's triggered after requests are added.](./building-a-time-off-requester/images/04.png)

1. Click the *Details* tab and set the following Entry Display and Scope settings.

   | Field | Value |
   | :--- | :--- |
   | Title Field | Start Date |
   | Scope | Company |
   | Panel Category Key | Applications > Communication |

1. Click *Publish*. This activates the Object.

Next, you'll create an Employee Object and relate it to the Time Off Request Object, so you can associate request entries with individual users.

## Adding an Employee Object

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Objects*.

1. Click the *Add* button ( ![Add Button](../../../images/icon-actions.png) ) and enter these values.

   | Field | Value |
   | :--- | :--- |
   | Label | Employee |
   | Plural Label | Employees |
   | Object Name | Employee |

1. Select the *Object*, click the *Fields* tab, and add these *fields*.

   | Label | Field Name | Type | Required |
   | :--- | :--- | :--- | :--- |
   | Name | `name` | Text | &#10004; |
   | Email | `email` | Text | &#10004; |

   ![Add the Name and Email fields to the Object.](./building-a-time-off-requester/images/05.png)

1. Click the *Relationships* tab and add this relationship.

   | Field | Value |
   | :--- | :--- |
   | Label | Requester |
   | Relationship Name | requester |
   | Type | One to Many |
   | Object | TimeOffRequest |

   ```{note}
   When you create this relationship, you add a foreign key field automatically to the Time Off Request Object.
   ```


![휴가 요청 개체와 일대다 관계를 추가합니다.](./building-a-time-off-requester/images/06.png)

1. *세부 정보* 탭을 클릭하고 다음 항목 표시 및 범위 설정을 지정합니다.


   | 분야        | 가치        |
   |:--------- |:--------- |
   | 제목 필드     | 이름        |
   | 범위        | 회사        |
   | 패널 카테고리 키 | 제어판 > 사용자 |

   
   1. *게시*을 클릭합니다.

게시되면 Liferay UI 또는 헤드리스 API를 통해 항목을 생성할 수 있습니다. 그러나 이러한 항목을 요청 항목과 연관시키려면 먼저 사용자 정의 레이아웃 [을 작성해야](#designing-custom-object-layouts).



## 사용자 정의 개체 레이아웃 디자인

개체 레이아웃은 개체 항목을 만들고 편집할 때 필드가 구성되는 방식을 결정합니다. 관계는 기본 개체 레이아웃에 표시되지 않으므로 관계 필드를 표시하려면 두 개체 모두에 대한 사용자 정의 레이아웃을 디자인해야 합니다.



### 휴가 요청

1. *개체* 애플리케이션으로 이동하고 *휴가 요청* 개체를 선택합니다.

1. *레이아웃* 탭을 클릭하고 *추가* 버튼( ![Add Button](../../../images/icon-actions.png) )을 클릭한 다음 이름에 *요청* 을 입력하고 *저장*을 클릭합니다.

1. 새 레이아웃을 선택하고 *기본* 로 표시 상자를 선택합니다.
   
   ![새 레이아웃을 추가하고 개체의 기본 레이아웃으로 표시합니다.](./building-a-time-off-requester/images/07.png)

1. *레이아웃* 탭을 클릭하고 2개의 *블록*가 있는 *탭* 을 추가합니다.


   | 요소 | 라벨    | 유형    |
   |:-- |:----- |:----- |
   | 탭  | 정보 요청 | 분야    |
   | 구획 | 날짜    | 해당 없음 |
   | 구획 | 세부사항  | 해당 없음 |

   
   1. 블록에 필드를 추가합니다.


   | 구획   | 분야         |
   |:---- |:---------- |
   | 날짜   | 시작일, 종료일   |
   | 세부사항 | 부서, 직원, 의견 |

   
   ![레이아웃 블록에 시작 날짜, 종료 날짜, 부서, 직원 및 설명 필드를 추가합니다.](./building-a-time-off-requester/images/08.png)
   
   1. *저장*을 클릭합니다.

저장되면 새 레이아웃이 Liferay UI에서 휴가 요청 항목을 생성하고 편집하는 데 사용됩니다. 직원 항목이 있는 경우 개별 요청에 연결할 수 있습니다.

![레이아웃은 휴가 요청 항목을 만들고 편집하는 데 사용됩니다.](./building-a-time-off-requester/images/09.png)



### 직원용

1. *Objects* 애플리케이션으로 이동하여 *Employee* Object를 선택합니다.

1. *레이아웃* 탭을 클릭하고 *추가* 버튼( ![Add Button](../../../images/icon-actions.png) )을 클릭한 다음 이름에 *직원 정보* 을 입력하고 *저장*을 클릭합니다.

1. 새 레이아웃을 선택하고 *기본* 로 표시 상자를 선택합니다.

1. *Layout* 탭을 클릭하고 하나의 블록으로 Fields 탭을 추가합니다.


   | 요소 | 라벨       | 유형    |
   |:-- |:-------- |:----- |
   | 탭  | 기본 세부 정보 | 분야    |
   | 구획 | 직원 정보    | 해당 없음 |

   
   1. *이름* 및 *이메일* 필드를 블록에 추가합니다.

1. 직원 개체의 요청자 관계에 대한 관계 탭을 추가합니다.


   | 요소 | 라벨    | 유형 | 관계  |
   |:-- |:----- |:-- |:--- |
   | 탭  | 휴가 요청 | 관계 | 요청자 |

   
   ![개체의 요청자 관계에 대한 관계 탭을 추가합니다.](./building-a-time-off-requester/images/10.png)
   
   1. *저장*을 클릭합니다.

일단 저장되면 직원 항목을 만들고 편집하기 위해 Liferay UI에서 새 레이아웃이 사용됩니다. 요청 항목이 있는 경우 *휴가 요청* 탭의 직원 항목과 연결할 수 있습니다. 여기에서 선택한 직원 항목과 관련된 모든 요청을 볼 수도 있습니다.

![레이아웃은 직원 항목을 만들고 편집하는 데 사용됩니다.](./building-a-time-off-requester/images/11.png)



## 개체 항목 추가

이제 앱이 완성되었으므로 Liferay UI 및 헤드리스 API를 사용하여 휴가 요청 및 직원 개체에 데이터를 추가할 수 있습니다.



### 직원 추가

헤드리스 API를 사용하여 직원 항목을 추가하려면 다음 단계를 따르십시오.

1. Liferay의 *API Explorer* (즉, `localhost:8080/o/api`)을 열고 *REST Applications* 드롭다운 메뉴를 클릭한 다음 *c/employees*을 클릭합니다.

1. 배치 `POST` API에 대한 요청 본문에 이 스크립트를 입력합니다. 
   
   

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


1. *실행*을 클릭합니다.

이렇게 하면 직원 개체에 세 개의 항목이 추가됩니다.



### 휴가 요청 추가

Liferay UI를 통해 요청 항목을 추가하려면 다음 단계를 따르십시오.

1. *글로벌 메뉴* (![Global Menu](../../../images/icon-applications-menu.png))을 열고 *애플리케이션* 탭을 클릭한 다음 *휴가 요청*을 선택합니다.

1. ** 추가 버튼(![Add Button](../../../images/icon-actions.png))을 클릭하고 양식을 작성하십시오.

1. *저장*을 클릭합니다.

항목을 저장하면 항목의 편집 화면이 표시됩니다. 더 많은 항목을 추가하려면 휴가 요청 기본 페이지로 돌아가십시오. 시간 요청이 추가되면 개체의 웹후크가 트리거되고 항목의 데이터를 설정된 URL에 게시합니다.

요청이 추가되고 직원 항목과 관련되면 직원 애플리케이션에서 볼 수 있습니다. *글로벌 메뉴* (![Global Menu](../../../images/icon-applications-menu.png))을 열고 *제어판* 탭으로 이동하여 *직원*을 클릭합니다. 관련 *항목* 을 선택하고 *휴가 요청* 탭을 클릭합니다.

![휴가 요청 탭에서 직원의 관련 요청을 봅니다.](./building-a-time-off-requester/images/12.png)



## 추가 정보

* [개체 개요](../../objects.md)
* [개체 만들기](../creating-and-managing-objects/creating-objects.md)
* [선택 목록 사용](../picklists/using-picklists.md)
