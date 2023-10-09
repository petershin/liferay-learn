# 배포자 응용 프로그램에 대한 표시 페이지 만들기

게시된 개체는 Info 프레임워크와 통합되므로 표시 페이지 템플릿의 콘텐츠 유형으로 선택할 수 있습니다. 선택하면 개체가 템플릿의 매핑 소스로 설정되므로 조각 필드를 개체 필드에 매핑하여 개별 개체 항목에 대한 유연한 페이지 표시를 만들 수 있습니다.

사용자가 애플리케이션을 제출하면 Liferay는 애플리케이션의 표시 페이지를 볼 수 있는 친숙한 URL을 할당합니다. 이 URL을 사용하여 응용 프로그램의 데이터를 보려면 배포자 응용 프로그램 개체에 대한 기본 표시 페이지 템플릿을 만들어야 합니다. 여기에서는 이 템플릿을 만들고 제공된 조각 구성을 사용하여 디자인합니다.

<!-- Refine intro. -->

1. *사이트 메뉴* (![Site Menu](../../images/icon-product-menu.png))을 열고 *디자인*확장한 다음 *페이지 템플릿*클릭합니다.

1. *표시 페이지 템플릿* 탭으로 이동하여 *추가* (![Add Button](../../images/icon-add.png))을 클릭합니다.

1. *Blank* 마스터 템플릿을 선택합니다.

1. 세부 정보를 입력하고 *저장*클릭하세요.

   | 분야     | 가치           |
   |:------ |:------------ |
   | 이름     | 애플리케이션 디스플레이 |
   | 컨텐츠 유형 | 대리점 신청       |

   ![이름을 입력하고 콘텐츠 유형으로 배포자 애플리케이션을 선택합니다.](./creating-a-display-page-for-distributor-applications/images/01.png)

   배포자 애플리케이션 콘텐츠 유형을 선택하면 페이지 조각을 배포자 애플리케이션 필드에 매핑하고 페이지를 현재 애플리케이션의 값으로 채울 수 있습니다.

1. *Display Page* 조각을 빈 템플릿에 끌어다 놓습니다.

   ![표시 페이지 조각을 빈 템플릿에 끌어다 놓습니다.](./creating-a-display-page-for-distributor-applications/images/02.png)

   이 구성에는 배포자 애플리케이션 필드에 매핑된 수많은 조각이 포함되어 있습니다.

   ![조각은 배포자 애플리케이션 필드에 매핑됩니다.](./creating-a-display-page-for-distributor-applications/images/03.png)

1. *게시*클릭하세요.

1. 표시 페이지 템플릿에 대해 *작업* 버튼(![Actions Button](../../images/icon-actions.png))을 클릭하고 *기본값으로 표시*를 선택합니다.

   이를 통해 Liferay는 배포자 애플리케이션용 템플릿을 사용합니다.

   ![템플릿을 기본값으로 설정합니다.](./creating-a-display-page-for-distributor-applications/images/04.png)

엄청난! 이제 사용자가 애플리케이션의 친숙한 URL로 이동하면 표시 페이지 템플릿이 해당 데이터로 채워집니다.

![표시 페이지 템플릿은 애플리케이션의 데이터로 채워집니다.](./creating-a-display-page-for-distributor-applications/images/05.png)

성공 페이지와 마찬가지로 표시 페이지에는 제출 후 지원서를 보고 편집할 수 있는 지원서 개요 페이지에 액세스할 수 있는 지원서 편집 버튼이 포함되어 있습니다. 이제 이 페이지 설정을 완료할 수 있습니다.

다음: [개요 페이지에 배포자 애플리케이션 위젯 추가](./adding-the-distributor-application-widget-to-the-overview-page.md)
