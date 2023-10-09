# 조직 만들기

Liferay를 사용하여 Delectable Bonsai의 조직 계층 구조를 모델링하십시오. 자세한 내용은 [조직 이해](https://learn.liferay.com/en/w/dxp/users-and-permissions/organizations/understanding-organizations) 참조하세요.

## 상위 및 하위 조직

1. 최상위 조직을 만듭니다.

   * _글로벌 메뉴로 이동_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _제어판_ &rarr; _사용자 및 조직_.
   * _조직_ 탭을 클릭합니다.
   * __ 추가(![Add icon](../../images/icon-add.png))를 클릭합니다.
   * _이름_ 필드에 `Delectable Bonsai` 입력합니다.
   * _저장_클릭하세요.

1. 하위 조직을 만듭니다.

   * _뒤로_ (![Back icon](../../images/icon-angle-left.png))을 클릭하면 조직 목록으로 돌아갑니다.
   * 방금 생성한 Delectable Bonsai 조직을 클릭하세요.
   * _Add_ (![Add icon](../../images/icon-add.png)) 을 클릭하고 _New Organization_선택하십시오.
   * _이름_ 필드에 `IT` 입력합니다. 상위 조직 섹션 아래에는 Delectable Bonsai가 선택되어 있습니다.
   * _저장_클릭하세요.

1. 위의 단계를 사용하여 Delectable Bonsai 상위 조직 아래에 `Sales & Marketing` 라는 또 다른 하위 조직을 만듭니다.

1. 조직 계층 구조는 아래 이미지와 같아야 합니다.

   ![상위 조직에는 두 개의 하위 조직이 있습니다.](./creating-organizations/images/01.png)

## 조직에 기존 사용자 할당

IT 관리자와 IT 직원은 어떤 조직에도 속해 있지 않습니다. 사용자 계정을 편집하여 IT 조직에 할당합니다.

1. _글로벌 메뉴로 이동_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _제어판_ &rarr; _사용자 및 조직_.

1. 사용자 계정 목록에서 _Kyle Klein_클릭하세요. 왼쪽 탐색에서 _조직_ 클릭합니다.

1. _클릭하고_ 선택하면 새 창이 나타납니다. _클릭하세요. IT 조직에 대해_ 선택하세요. _저장_클릭하세요.

1. 동일한 단계에 따라 Marcus Morgan을 IT 조직에 추가합니다.

## 조직에 새 사용자 추가

조직 내에서도 새로운 사용자를 추가할 수 있습니다.

1. _글로벌 메뉴로 이동_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _제어판_ &rarr; _사용자 및 조직_.

   * _조직_ 탭을 클릭합니다.
   * _맛있는 분재_클릭하세요.
   * 영업 & 마케팅 하위 조직에 대해 _옵션_ (![Options icon](../../images/icon-actions.png))을 클릭합니다.
   * _사용자 추가_클릭합니다.

1. 다음 사용자를 추가합니다:

   * 화면 이름: `릴리`
   * 이메일 주소: `lily@delectablebonsai.com`
   * 이름: `릴리`
   * 성: `루이스`
   * 직위 : `회계 관리자`

   페이지 하단에서 _저장_ 클릭하세요.

## 조직 사이트

다음으로 Sales & 마케팅 부서의 조직 사이트를 만들어 내부 블로그를 호스팅합니다. 자세한 내용은 [조직 사이트](https://learn.liferay.com/en/w/dxp/users-and-permissions/organizations/organization-sites) 을 참조하세요.

1. 조직으로 돌아가서 *Delectable Bonsai* 조직을 클릭하세요.

1. 영업 & 마케팅 하위 조직에 대해 _옵션_ (![Options icon](../../images/icon-actions.png))을 클릭하고 _편집_클릭합니다.

1. 왼쪽 탐색에서 _조직 사이트_클릭합니다.
   * 토글을 클릭하여 사이트를 생성하세요.
   * _저장_클릭하세요.

   새로운 조직 사이트가 생성되었습니다.

1. 오른쪽 상단의 프로필 이미지를 클릭하세요. _내 사이트_클릭하세요.

   ![프로필 이미지에서 내 사이트를 클릭하세요.](./creating-organizations/images/02.png)

1. _모든 사이트_ 탭을 클릭합니다. 방금 생성한 _Sales & Marketing_ 사이트를 클릭합니다. 일부 콘텐츠가 추가될 때까지 사이트는 비어 있습니다.

1. 왼쪽 상단에 있는 _제품 메뉴_ 아이콘(![Product Menu icon](../../images/icon-product-menu.png))을 클릭합니다. 사이트 작성기에서 _페이지_을 클릭하세요.

1. __ 추가(![Add icon](../../images/icon-add.png))를 클릭하고 _Page_선택합니다.

   * _공백_ 클릭하면 공백 페이지가 생성됩니다.
   * 페이지 이름을 _Sales & Marketing Blog_로 지정합니다.
   * _추가_클릭합니다.

1. 왼쪽 탐색에서 _+_ (![Plus icon](../../images/icon-plus.png))을 클릭하여 조각 및 위젯 도구를 확인하세요.

   * _위젯_ 탭을 클릭하세요.
   * 블로그 위젯을 페이지로 드래그하여 추가하세요. 위젯이 Collaboration에 있습니다.
   * _게시_클릭하세요.

1. 이제 Sales & Marketing 조직 사이트에는 하위 조직에 속한 모든 사람이 볼 수 있는 Sales & Marketing 블로그 게시물이 있는 페이지가 있습니다. 블로그 및 블로그 항목에 대한 자세한 내용은 [블로그 시작하기](https://learn.liferay.com/en/w/dxp/content-authoring-and-management/blogs/getting-started-with-blogs) 참조하세요.

다음으로, LDAP [에 연결](./connecting-to-ldap.md)사용자를 가져옵니다.

## 관련 개념

- [조직 이해](https://learn.liferay.com/en/w/dxp/users-and-permissions/organizations/understanding-organizations)
- [조직 역할](https://learn.liferay.com/en/w/dxp/users-and-permissions/organizations/organization-sites)
