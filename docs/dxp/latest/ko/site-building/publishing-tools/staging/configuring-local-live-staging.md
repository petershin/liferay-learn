# 로컬 라이브 스테이징 구성

로컬 라이브 스테이징을 사용하면 스테이징 환경과 라이브 환경이 모두 동일한 Liferay 서버에서 호스팅됩니다. 활성화되면 Liferay DXP는 스테이징 환경 역할을 하는 사이트 또는 자산 라이브러리의 로컬 복제본을 생성하고 원본은 라이브 환경이 됩니다. 두 환경 모두 동일한 JVM, 데이터베이스, 선택한 애플리케이션 데이터 및 구성(예: 포털 속성)을 공유합니다.

![Local staging hosts both environments on the same server.](./configuring-local-live-staging/images/01.png)

## 사이트에 대한 로컬 라이브 스테이징 설정

1. **사이트 메뉴** &rarr; **게시** &rarr; **준비** 로 이동하세요.

   ![Go to Staging in the Site Menu.](./configuring-local-live-staging/images/02.png)

1. **페이지 버전 관리** 및 **단계별 콘텐츠** 에 대한 추가 필드를 표시하는 **로컬 라이브** 를 선택합니다.

   ![Select Local Live.](./configuring-local-live-staging/images/03.png)

1. (사이트에만 해당)**페이지 버전 관리** 활성화 여부를 선택합니다.

   ![Enable Page Versioning.](./configuring-local-live-staging/images/04.png)

1. 준비하려는 데이터 및 콘텐츠 유형을 선택합니다.

   ![Select the data and content types you want to stage.](./configuring-local-live-staging/images/05.png)

   ```{warning}
   애플리케이션을 확인하면 해당 데이터가 스테이징 환경에 복사되며, 라이브 환경에서는 직접 편집이 불가능할 수 있습니다. 애플리케이션 선택을 취소할 때 스테이징의 변경 사항이 손실될 수 있으므로 먼저 게시되었는지 확인하세요. 자세한 내용은 [스테이징에서 데이터 및 콘텐츠 유형 관리](./managing-data-and-content-types-in-staging.md)를 참조하세요.
   ```

1. 복제 프로세스를 시작하려면 **저장** 을 클릭하세요. 이 프로세스의 기간은 사이트 크기에 따라 다릅니다.

   ```{tip}
   페이지 버전 관리를 활성화한 후에만 업데이트가 기록되므로 복제 시간을 줄이고 사이트 업데이트 기록의 보다 완전한 기록을 기록하려면 사이트를 미리 준비하세요.
   ```

프로세스가 완료되면 로컬 라이브 스테이징을 사용할 준비가 된 것입니다. 스테이징 환경의 게시 기능 탐색에 대한 자세한 내용은 [사이트 스테이징 UI 참조](./site-staging-ui-reference.md)를 참조하세요.

## 자산 라이브러리에 대한 준비 설정

1. **전역 메뉴**(![전역 메뉴](../../../images/icon-applications-menu.png))를 열고 애플리케이션 탭에서 **자산 라이브러리** 를 클릭합니다.

1. 원하는 자산 라이브러리를 열고 게시 아래에서 **스테이징** 을 클릭하세요.

1. **로컬 라이브** 를 선택하세요.

   ![Select Local Live.](./configuring-local-live-staging/images/06.png)

1. 준비할 애플리케이션 데이터를 선택합니다.

   자산 라이브러리의 경우 **문서 및 미디어** 와 **웹 콘텐츠** 에 대한 데이터를 준비할 수 있습니다.

   ![Select the application data you want to stage.](./configuring-local-live-staging/images/07.png)

1. 복제 프로세스를 시작하려면 **저장** 을 클릭하세요. 이 프로세스의 기간은 자산 라이브러리의 크기에 따라 다릅니다.

   프로세스가 완료되면 자산 라이브러리에서 로컬 라이브 스테이징을 사용할 준비가 된 것입니다.

## 로컬 라이브 스테이징 비활성화

어떤 이유로든 사이트 또는 자산 라이브러리에 대한 스테이징을 비활성화해야 하는 경우 스테이징 환경에서 이를 수행할 수 있습니다. 그러나 로컬 라이브 스테이징을 비활성화하면 게시되지 않은 모든 콘텐츠와 함께 스테이징 환경이 삭제된다는 점에 유의하세요. 이러한 이유로 스테이징을 비활성화하기 전에 필요한 모든 정보가 다른 곳에 게시되거나 보존되어 있는지 확인하십시오.

```{tip}
이 프로세스는 스테이징 환경의 크기에 따라 다소 시간이 걸릴 수 있습니다. Liferay 인스턴스가 사용 중일 때는 스테이징을 비활성화하지 않는 것이 가장 좋습니다.
```

로컬 라이브 스테이징을 비활성화하려면 다음 단계를 따르십시오.

1. 사이트 또는 자산 라이브러리에서 스테이징 애플리케이션을 엽니다.

1. 응용 프로그램 표시줄에서 **작업**( ![작업 버튼](../../../images/icon-actions.png) )을 클릭하고 **스테이징 구성** 을 선택합니다.

   ![Click the Actions button in the Application bar, and select Staging Configuration](./configuring-local-live-staging/images/08.png)

1. 구성에 대해 **없음** 을 선택하고 **저장** 을 클릭합니다.

```{important}
대부분의 콘텐츠 유형의 경우 스테이징에서는 각 콘텐츠 항목의 승인된 최신 버전만 게시합니다. 이러한 이유로 로컬 라이브 스테이징을 비활성화하면 이전 콘텐츠 버전(예: 문서)이 손실됩니다. 스테이징이 비활성화되면 라이브 환경에 게시된 최신 버전만 보존됩니다. 웹 콘텐츠는 유일한 예외입니다.
```

## 관련 주제

* [스테이징 개요](../staging.md)
* [사이트 스테이징 UI 참조](./site-staging-ui-reference.md)
* [스테이징에서 데이터 및 콘텐츠 유형 관리](./managing-data-and-content-types-in-staging.md)
* [스테이징 권한 관리](./managing-staging-permissions.md)
