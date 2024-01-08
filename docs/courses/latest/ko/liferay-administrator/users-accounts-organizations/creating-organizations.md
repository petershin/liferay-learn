# 조직 만들기

Liferay를 사용하여 Clarity Vision Solutions의 조직 계층 구조를 모델링하세요. 자세한 내용은 [조직 이해](https://learn.liferay.com/en/w/dxp/users-and-permissions/organizations/understanding-organizations) 를 참조하세요.

## 상위 및 하위 조직

1. 최상위 조직을 만듭니다.

   * **글로벌 메뉴**(![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **사용자 및 조직** 으로 이동합니다.
   * **조직** 탭을 클릭하세요.
   * **추가**(![아이콘 추가](../../images/icon-add.png))를 클릭하세요.
   * **이름** 필드에 `Clarity Vision Solutions`를 입력하세요.
   * **저장** 을 클릭하세요.

1. 하위 조직을 만듭니다.

   * **뒤로**(![뒤로 아이콘](../../images/icon-angle-left.png))를 클릭하면 조직 목록으로 돌아갑니다.
   * 방금 생성한 Clarity Vision Solutions 조직을 클릭하세요.
   * **추가**(![아이콘 추가](../../images/icon-add.png))를 클릭하고 **새 조직** 을 선택합니다.
   * **이름** 필드에 'IT'를 입력하세요. 상위 조직 섹션 아래에 Clarity Vision Solutions가 선택되어 있습니다.
   * **저장** 을 클릭하세요.

1. 위의 단계를 사용하여 Clarity Vision Solutions 상위 조직 아래에 '영업 및 마케팅'이라는 또 다른 하위 조직을 만듭니다.

1. 조직 계층 구조는 아래 이미지와 같아야 합니다.

   ![The parent organization has two child organizations.](./creating-organizations/images/01.png)

## 조직에 기존 사용자 할당

IT 관리자와 IT 직원은 어떤 조직에도 속해 있지 않습니다. 사용자 계정을 편집하여 IT 조직에 할당합니다.

1. **글로벌 메뉴**(![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **사용자 및 조직** 으로 이동합니다.

1. 사용자 계정 목록에서 **Kyle Klein** 을 클릭하세요. 왼쪽 탐색 메뉴에서 **조직** 을 클릭하세요.

1. **선택** 을 클릭하면 새 창이 나타납니다. IT 조직에 대해 **선택** 을 클릭하세요. **저장** 을 클릭하세요.

1. 동일한 단계에 따라 Marcus Morgan을 IT 조직에 추가합니다.

## 조직에 새 사용자 추가

조직 내에서도 새로운 사용자를 추가할 수 있습니다.

1. **글로벌 메뉴**(![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **사용자 및 조직** 으로 이동합니다.

   * **조직** 탭을 클릭하세요.
   * **Clarity Vision 솔루션** 을 클릭하세요.
   * 영업 및 마케팅 하위 조직에 대해 **옵션**(![옵션 아이콘](../../images/icon-actions.png))을 클릭합니다.
   * **사용자 추가** 를 클릭하세요.

1. 다음 사용자를 추가합니다:

   * 화면 이름 : `백합`
   * 이메일 주소: `lily@clarityvisionsolutions.com`
   * 이름: '릴리'
   * 성 : '루이스'
   * 직위 : `계정 관리자`

   페이지 하단의 **저장** 을 클릭하세요.

## 조직 사이트

다음으로 영업 및 마케팅 부서의 조직 사이트를 만들어 내부 블로그를 호스팅합니다. 자세한 내용은 [조직 사이트](https://learn.liferay.com/en/w/dxp/users-and-permissions/organizations/organization-sites) 를 참조하세요.

1. 다시 조직으로 이동하여 **Clarity Vision Solutions** 조직을 클릭하세요.

1. 영업 및 마케팅 하위 조직에 대해 **옵션**(![옵션 아이콘](../../images/icon-actions.png))을 클릭하고 **편집** 을 클릭합니다.

1. 왼쪽 탐색 메뉴에서 **조직 사이트** 를 클릭하세요.

   * 토글을 클릭하여 사이트를 생성하세요.
   * **저장** 을 클릭하세요.

   새로운 조직 사이트가 생성되었습니다.

1. 오른쪽 상단의 프로필 이미지를 클릭하세요. **내 사이트** 를 클릭하세요.

   ![Click on My Sites from the profile image.](./creating-organizations/images/02.png)

1. **모든 사이트** 탭을 클릭하세요. 방금 만든 **영업 및 마케팅** 사이트를 클릭하세요. 일부 콘텐츠가 추가될 때까지 사이트는 비어 있습니다.

1. 왼쪽 상단의 **제품 메뉴** 아이콘(![제품 메뉴 아이콘](../../images/icon-product-menu.png))을 클릭하세요. 사이트 작성기에서 **페이지** 를 클릭하세요.

1. **추가**(![아이콘 추가](../../images/icon-add.png))를 클릭하고 **페이지** 를 선택합니다.

   * 빈 페이지를 만들려면 **Blank** 를 클릭하세요.
   * 페이지 이름을 **영업 및 마케팅 블로그** 로 지정합니다.
   * **추가** 를 클릭하세요.

1. 왼쪽 탐색에서 **Plus**(![Plus 아이콘](../../images/icon-plus.png))를 클릭하여 조각 및 위젯 도구를 확인하세요.

   * **위젯** 탭을 클릭하세요.
   * 블로그 위젯을 페이지로 드래그하여 추가하세요. 위젯이 Collaboration에 있습니다.
   * **게시** 를 클릭하세요.

1. 이제 영업 및 마케팅 조직 사이트에는 하위 조직에 속한 모든 사람이 볼 수 있는 영업 및 마케팅 블로그 게시물이 포함된 페이지가 있습니다. 블로그 및 블로그 항목에 대해 자세히 알아보려면 [블로그 시작하기](https://learn.liferay.com/en/w/dxp/content-authoring-and-management/blogs/getting-started-with-blogs) 를 참조하세요.

다음으로 [LDAP에 연결](./connecting-to-ldap.md)하여 사용자를 가져옵니다.

## 관련 개념

* [조직 이해](https://learn.liferay.com/en/w/dxp/users-and-permissions/organizations/understanding-organizations)
* [조직 사이트](https://learn.liferay.com/en/w/dxp/users-and-permissions/organizations/organization-sites)
