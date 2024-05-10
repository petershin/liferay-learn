# 조직을 사용하여 판매 네트워크 만들기

B2B 판매 네트워크의 조직 구조는 조직 기능을 사용하여 Liferay Commerce에서 미러링할 수 있습니다. 조직은 사용자, 역할, 권한 및 계정의 분산되고 단순화된 관리를 가능하게 하는 실제 조직 계층을 모델링할 수 있는 사용자의 계층적 배열입니다.

조직이 조직 역할에 대한 권한 할당과 함께 사용될 때 조직에 할당된 사용자는 해당 조직에 대해 정의된 역할 기반 권한을 자동으로 상속합니다. <!-- The following sentence is removed because I read it and I don't know what specifically it's telling someone - maybe: Organizations (and sub-organizations) can have accounts assigned to them - ensuring that members of an organization have access to the right accounts at the right time.

For example, a B2B company can give everyone in their sales network access to the right Account information through their organizational membership.

-->

조직은 사용자 관리를 간단하게 만듭니다. 조직의 사용자가 재할당되거나 다른 조직으로 이전되면 해당 사용자의 역할과 권한이 새 조직 구성원 자격에 따라 자동으로 업데이트됩니다. 판매 네트워크의 경우 이는 고객 계정에 대한 능률적이고 안전한 액세스 관리를 의미합니다.

## 실제 조직 계층 미러링


<!-- I'm commenting out the following image because I don't think it clearly depicts how to use organizations to model a sales network. First - it would seem that the image states that "Minium" is the company - and then the company has a sub-org named "Italy". And then "Italy" has sub-orgs per region. I don't think real companies organize like that. The correct model (I think) would be - to make it extremely clear how to understand the image: "Minium Corporation" (Parent Org) > Minium Corporation - Italy Sales Department > [Regions]. Or alternatively: Minium Sales Group > Italy Sales Region > [Regions] - something in the naming to make the hierarchy clearer.
![Image 01](./using-organizations-to-create-a-sales-network/images/01.png) -->

판매 네트워크와 계정을 실제 세계와 동일하게 구성하면 영업 팀원이 Liferay Commerce 내에서 쉽게 탐색할 수 있습니다. 조직 생성 및 구조화에 대해 자세히 알아보려면 여기 [조직 생성 및 관리](https://learn.liferay.com/w/dxp/users-and-permissions/organizations/creating-and-managing-organizations) .

## 조직 역할 및 권한으로 계정 관리 및 액세스 정의

관련 권한이 있는 역할을 사용자에게 할당하면 시스템 내에서 수행할 수 있는 작업과 수행할 수 없는 작업이 지정됩니다. Liferay Commerce는 즉시 사용할 수 있는 여러 조직 역할과 함께 제공됩니다.

![즉시 사용할 수 있는 여러 조직 역할이 있습니다.](./using-organizations-to-create-a-sales-network/images/02.png)

각 역할에 권한 모음을 할당하면 Liferay Commerce 내에서 해당 역할의 액세스 권한이 정의됩니다(그런 다음 사용자에게 적용할 수 있음). 권한의 몇 가지 예는 다음과 같습니다. 하위 조직(예: 지역), 계정 데이터 또는 주문 내역 보기 주문을 관리하고 역할을 할당합니다. 권한에 대한 자세한 내용은 [역할 권한 정의](https://help.liferay.com/hc/ko/articles/360018174391-Defining-Role-Permissions) 을 참조하십시오.

![각 역할에는 정의된 권한이 있을 수 있습니다.](./using-organizations-to-create-a-sales-network/images/03.png)

## 조직 멤버십으로 장기 액세스 관리

장기 역할 및 권한 관리는 사용자의 조직 구성원을 업데이트하여 Liferay Commerce 내에서 쉽게 수행할 수 있습니다(조직, 역할 및 권한이 설정되고 할당되면).

![사용자로부터 조직을 할당하거나 할당 해제하여 해당 사용자의 액세스 권한을 관리할 수 있습니다.](./using-organizations-to-create-a-sales-network/images/04.png)


<!--
(Double/Dual-Screenshot: Show User's permissions before the move and after the move)
-->

## 관련 주제

* [조직 생성 및 관리](https://learn.liferay.com/w/dxp/users-and-permissions/organizations/creating-and-managing-organizations)
* [새 조직 유형 추가](https://learn.liferay.com/w/dxp/users-and-permissions/organizations/adding-a-new-organization-type)
* [역할 관리](https://help.liferay.com/hc/ko/articles/360018174371-Managing-Roles)
* [역할 권한 정의](https://help.liferay.com/hc/ko/articles/360018174391-Defining-Role-Permissions)
* [계정에 조직 추가](./adding-organizations-to-accounts.md)
