# 대리점 신청 페이지 추가

페이지는 Liferay 사이트의 기본 구성 요소입니다. Delectable Bonsai의 디자인 팀은 배포자 응용 프로그램 개체와 함께 사용할 세 개의 자리 표시자 페이지를 만들고 내보냈습니다. Here you'll import these pages as a LAR file: <!--TASK: If you've completed the [Site Design]() course, then you've already added these pages to your site. 그렇지 않은 경우 LAR 파일로 다운로드하여 가져올 수 있습니다. -->

1. 이 연습을 위해 LAR 파일을 다운로드하세요.

   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/application-development/designing-user-interfaces/distributor-application-pages.lar -O
   ```

1. _사이트 메뉴_(![사이트 메뉴](../../images/icon-product-menu.png))를 열고 _게시_를 확장한 다음 _가져오기_를 클릭합니다.

1. _추가_(![추가 버튼](../../images/icon-add.png))를 클릭하고 `distributor-application-pages.lar` 파일을 선택한 다음 _계속_을 클릭하세요.

   ![Select the distributor-application-pages.lar file and click Continue.](./adding-pages-for-distributor-application/images/01.png)

1. 기본 가져오기 구성을 유지하고 _가져오기_를 클릭합니다.

1. 가져오기가 성공적으로 완료되었는지 확인합니다.

   ![Confirm the import was successful.](./adding-pages-for-distributor-application/images/02.png)

1. 사이트에 다음 페이지가 나타나는지 확인하세요.

   * 적용하십시오
   * 신청서 제출
   * 대리점 신청

   ![Verify the pages appear in your site.](./adding-pages-for-distributor-application/images/03.png)

이 페이지는 배포자 애플리케이션 UI를 구축하기 위한 프레임워크를 제공합니다.

현재는 비어 있습니다. 처음부터 시작하는 대신 제공된 조각 구성을 가져와 애플리케이션 생성, 보기 및 관리에 필요한 조각 또는 위젯을 추가합니다.

다음: [배포자 애플리케이션 페이지에 대한 조각 가져오기](./importing-fragments-for-the-distributor-application-pages.md) 
