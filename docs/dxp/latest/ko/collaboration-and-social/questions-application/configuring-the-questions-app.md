# 질문 앱 구성

> 사용 가능: Liferay DXP/Portal 7.3+

질문 앱을 구성하는 두 가지 기본 방법이 있습니다. 직접 앱 구성을 통한 방법과 시스템 설정 구성을 통한 방법입니다.

애플리케이션을 통해 구성하려면

1. 앱의 옵션 아이콘(![Options icon](../../images/icon-options.png))을 클릭하고 **구성** 를 클릭합니다.

    ![앱의 구성 링크를 클릭합니다.](./configuring-the-questions-app/images/01.png)

시스템 설정을 통해 구성하려면,

1. **제어판** &rarr; **시스템 설정** &rarr; **타사** 로 이동합니다.
1. 위젯 범위에서 **질문** 을 클릭합니다.

    ![시스템 설정에서 질문 앱 설정으로 이동합니다.](./configuring-the-questions-app/images/05.png)

## 주제 표시 스타일

주제는 카드 또는 목록으로 표시할 수 있습니다.

1. 앱의 옵션 아이콘(![Options icon](../../images/icon-options.png))을 클릭하고 **구성** 를 클릭합니다.

    ![앱의 구성 링크를 클릭합니다.](./configuring-the-questions-app/images/01.png)

1. 일반 설정 아래에는 주제 탐색을 위한 카드 표시 옵션이 있습니다.

  이 항목을 선택하면 앱에서 각 질문 주제에 대해 별도의 카드를 표시합니다. 선택하지 않으면 앱에 모든 질문 목록이 표시됩니다.

  ![다양한 옵션이 있는 구성 창이 열립니다.](./configuring-the-questions-app/images/02.png)

## 주제 표시 제한

질문 기본 표시 동작은 모든 주제를 표시하는 것입니다. 루트 주제를 구성하여 특정 주제만 표시하도록 선택할 수 있습니다. 특정 하위 주제 또는 질문만 표시하려면 다음을 수행하십시오.

1. 앱의 옵션 아이콘(![Options icon](../../images/icon-options.png))을 클릭하고 **구성** 를 클릭합니다.

    ![앱의 구성 링크를 클릭합니다.](./configuring-the-questions-app/images/01.png)

1. Root Topic ID 아래의 **Select** 버튼을 클릭합니다.

    ![개별 주제를 루트 주제로 선택합니다.](./configuring-the-questions-app/images/03.png)

1. 주제를 선택하고 **저장** 을 클릭합니다. 이제 앱은 선택한 주제에 대한 하위 주제와 질문만 표시합니다.

## 앱 권한 관리

앱에 대한 권한을 수정하려면,

1. 앱의 옵션 아이콘(![Options icon](../../images/icon-options.png))을 클릭하고 **권한을 클릭합니다.** .

    ![앱의 구성 링크를 클릭합니다.](./configuring-the-questions-app/images/01.png)

1. 새 창이 열립니다.

    ![이 페이지에서 다양한 역할에 대한 권한을 할당합니다.](./configuring-the-questions-app/images/04.png)

1. 다른 역할에 대한 권한을 할당합니다. **저장** 을 클릭합니다.

## 게스트 사용자를 로그인으로 리디렉션

이 기능을 활성화하려면 시스템 설정을 통해 구성해야 합니다.

1. **제어판** &rarr; **시스템 설정** &rarr; **타사** 로 이동합니다.
1. 위젯 범위에서 **질문** 을 클릭합니다.

    ![시스템 설정에서 질문 앱 설정으로 이동합니다.](./configuring-the-questions-app/images/05.png)

1. 체크 **로그인으로 리디렉션 활성화**
1. 게스트 사용자는 이제 **Ask Question** 을 클릭하려고 하면 로그인 페이지로 리디렉션됩니다.

```{note}
게스트 사용자가 앱을 볼 수 있도록 서비스 액세스 정책을 생성해야 합니다.
```

### 게스트 뷰어를 허용하는 서비스 액세스 정책 생성

새 정책을 만들려면

1. **제어판** &rarr; **서비스 액세스 정책** 로 이동합니다. ** 추가 아이콘(![Add icon](../../images/icon-add.png))을 클릭합니다.

1. 정책에 이름과 제목을 지정합니다. 하단의 **고급 모드로 전환** 버튼을 클릭합니다. 허용된 서비스 서명 아래에 다음 두 서명을 추가합니다.

    ```java
    com.liferay.message.boards.service.MBCategoryService#getCategoriesCount
    com.liferay.message.boards.service.MBCategoryService#getCategory
    ```

    ![새 정책을 만들고 서명을 추가합니다.](./configuring-the-questions-app/images/06.png)

1. **저장** 을 클릭하여 새 정책을 저장합니다.

## 시스템 구성 참조

| 환경             | 묘사                                                                     |
|:-------------- |:---------------------------------------------------------------------- |
| 내비게이션 위한 카드 표시 | 이 항목을 선택하면 앱에서 각 질문 주제에 대해 별도의 카드를 표시합니다. 선택하지 않으면 앱에 모든 질문 목록이 표시됩니다. |
| URL에서 주제 이름 사용 | 이 항목을 선택하면 각 주제 이름이 주제 ID 번호 대신 더 친숙한 URL로 사용됩니다.                      |
| 루트 주제 ID       | 이 설정은 무시됩니다.                                                           |
