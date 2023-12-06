# 교차 원본 리소스 공유 활성화

다른 도메인의 서버가 Liferay 웹 서비스에 액세스하려고 하면 CORS(교차 원본 리소스 공유) 정책에 따라 각 요청이 허용되거나 거부됩니다. 자세한 내용은 [CORS 설정](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/securing-web-services/setting-up-cors)을 참조하세요.

Clarity Vision Solutions는 사용자가 프로필 필드를 맞춤 설정할 수 있도록 [Liferay 개체](https://learn.liferay.com/w/dxp/building-applications/objects)를 생성하도록 선택할 수 있습니다. 로컬에서 실행되는 React 애플리케이션에 대한 예를 보려면 아래 단계를 따르세요.

1. Liferay 개체를 만듭니다.

   * **글로벌 메뉴**(![글로벌 메뉴](../../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Objects** 로 이동합니다.
   * **추가**(![아이콘 추가](../../../images/icon-add.png))를 클릭하세요.
   * 다음 개체를 입력합니다.
     * 라벨: `J4X7-Object`
     * 복수형 레이블: `J4X7-Objects`
     * 이름:`J4X7Object`
   * **저장** 을 클릭하세요.
   * 방금 생성한 J4X7-Object를 선택합니다. **필드** 탭을 클릭하세요.
   * **추가**(![아이콘 추가](../../../images/icon-add.png))를 클릭하고 다음 필드를 추가합니다.
     * 라벨: `이름`
     * 필드 이름: `name`
     * 유형: `텍스트`
   * **저장** 을 클릭하세요.
   * **추가**(![아이콘 추가](../../../images/icon-add.png))를 클릭하고 다음 필드를 추가합니다.
     * 라벨: `설명`
     * 필드 이름: `설명`
     * 유형: `텍스트`
   * **저장** 을 클릭하세요.
   * **세부정보** 탭으로 돌아가서 **게시** 를 클릭하세요.

1. React 애플리케이션을 다운로드하고 압축을 푼다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/developing-a-javascript-application/using-react/liferay-j4x7.zip -O
   ```

   ```bash
   unzip liferay-j4x7.zip
   ```

   ```bash
   cd liferay-j4x7
   ```

1. 애플리케이션 폴더로 이동하여 React 서버를 시작합니다.

   ```bash
   cd j4x7-custom-element
   ```

   ```bash
   yarn start
   ```

1. J4X7 개체 항목을 추가해 보십시오. 이름과 설명에 'foo'를 입력하고 **Add** 를 클릭하세요.

   ![Try to add a J4X7 object entry.](./cross-origin-resource-sharing/images/01.png)

   항목이 추가되지 않았는지 확인하세요.

1. Liferay에서 **글로벌 메뉴**(![글로벌 메뉴](../../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **인스턴스 설정** 으로 이동합니다.

1. 객체에 대한 CORS 정책을 추가합니다.

   * **보안 도구** 를 클릭하세요.
   * 왼쪽 탐색에서 **포털 교차 원본 리소스 공유(CORS**) 를 클릭합니다.
   * **추가** 를 클릭하세요.
   * 이름으로 **Foo** 를 입력하세요.
   * 값 `/o/c/j4x7objects/*`를 사용하여 **URL 패턴** 을 추가하고 **업데이트** 를 클릭합니다.

1. React 앱으로 돌아가서 J4X7 개체 항목을 추가합니다. 이름과 설명에 'foo'를 입력하고 **Add** 를 클릭하세요.

   ![A J4X7 object entry is successfully added.](./cross-origin-resource-sharing/images/02.png)

   CORS 정책이 업데이트되면서 이제 J4X7 객체 항목이 성공적으로 추가되었습니다.

훌륭한! 이제 CORS를 구성하고 웹 서비스 보안 모듈을 완료했습니다.

다음: [승인 및 Single Sign-On](../authorizing-and-single-sign-on.md)
