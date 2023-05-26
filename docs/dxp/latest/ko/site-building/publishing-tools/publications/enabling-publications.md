# 간행물 활성화

{bdg-secondary}`사용 가능한 Liferay 7.3+`

Publications는 귀하와 귀하의 팀이 변경 사항을 개발, 추적 및 게시할 수 있는 편리하고 유연한 방법을 제공합니다. 사용하도록 설정하면 출판물이 전역적으로 활성화되며 지원되는 엔터티를 편집하기 위해 어디에서나 액세스할 수 있습니다.

[$LIFERAY_LEARN_YOUTUBE_URL$]=https://www.youtube.com/embed/8N6djs7Gcs4

```{important}
준비 및 게시는 동시에 활성화할 수 없습니다. 사이트에서 스테이징이 활성화된 경우 게시를 활성화하기 전에 먼저 스테이징을 비활성화해야 합니다. [로컬 라이브 스테이징 비활성화](../staging/configuring-local-live-staging.md#disabling-local-live-staging) 및 [원격 라이브 스테이징 비활성화](../staging/configuring-remote-live-staging.md#disabling-remote-live-staging) 에서 자세한 내용을 확인하십시오.

[Workflow](../../../process-automation/workflow/introduction-to-workflow.md)은 Liferay 7.3의 발행물과 함께 사용할 수 없습니다.
```

## 간행물을 활성화하는 방법

간행물을 활성화하려면 다음 단계를 따르십시오.

1. **글로벌 메뉴**(![Global Menu](../../../images/icon-applications-menu.png))을 열고 **애플리케이션** 탭으로 이동한 다음 **출판물** 클릭합니다.

1. Toggle **간행물 활성화** .

   ![스사이트를 전환하고 저장을 클릭합니다.](./enabling-publications/images/01.png)

1. (선택 사항)**Sandbox Only** 모드를 전환합니다. 활성화된 상태에서 사용자는 로그인할 때 마지막으로 작업한 발행물로 자동으로 이동됩니다. 없는 경우 `screen.name - 날짜` 명명 패턴을 사용하여 새 발행물이 생성됩니다. 게시 템플릿을 사용하여 이러한 자동 생성 게시에 대한 기본값을 설정할 수 있습니다. 자세한 내용은 [출판 템플릿 사용](./using-publication-templates.md) 참조하십시오.

   ```{tip}
   샌드박스만 사용하면 프로덕션에서 실수로 편집하는 것을 줄이는 데 도움이 될 수 있습니다.
   ```

1. (선택 사항)**승인되지 않은 변경 허용** 활성화하여 사용자가 승인되지 않은 변경 사항을 프로덕션에 게시할 수 있도록 합니다.

1. **저장** 클릭하여 구성을 저장합니다. 출판물 신청 페이지로 리디렉션됩니다.

활성화되면 Liferay 인스턴스의 어디에서나 드롭다운 간행물 표시줄 메뉴에 액세스할 수 있습니다.

![DXP 인스턴스의 어디에서나 드롭다운 발행물 표시줄 메뉴에 액세스합니다.](./enabling-publications/images/02.png)

이 메뉴를 사용하여 새 출판물을 만들고, 작업할 출판물을 선택하고, 편집 모드와 프로덕션 모드 간에 전환하고, 현재 출판물의 변경 사항을 검토 및 게시할 수 있습니다. 개별 발행물 생성, 편집 및 제거에 대해 알아보려면 [발행물 생성 및 관리](./creating-and-managing-publications.md) 참조하십시오.

## 간행물 비활성화 방법

원하는 경우 간행물 애플리케이션 페이지를 통해 언제든지 간행물을 비활성화할 수 있습니다.

1. **글로벌 메뉴**(![Global Menu](../../../images/icon-applications-menu.png))을 열고 **애플리케이션** 탭으로 이동한 다음 **출판물** 클릭합니다.

1. 응용 프로그램 표시줄에서 **작업**(![Actions Button](../../../images/icon-actions.png))을 클릭하고 **설정** 선택합니다.

   ![Publications 애플리케이션을 열고 작업 버튼을 클릭한 다음 설정을 선택합니다.](./enabling-publications/images/03.png)

1. 간행물을 비활성화하려면 스사이트를 토글합니다.

1. **저장** 클릭합니다.

```{important}
비활성화되면 모든 활성 간행물이 비활성화되고 예약된 간행물이 취소되며 더 이상 간행물 기록에 액세스할 수 없습니다. 그러나 Liferay는 인스턴스의 게시 기록을 유지하므로 게시를 다시 활성화하면 다시 액세스할 수 있습니다.
```

## 7.3.x용 출판 활성화

1. **글로벌 메뉴**(![Global Menu](../../../images/icon-applications-menu.png))을 열고 **애플리케이션** 탭으로 이동한 다음 출판물에서 **설정** 클릭합니다.

   ![전역 메뉴에서 발행물 아래의 설정을 클릭합니다.](./enabling-publications/images/04.png)

1. 스사이트를 **예** 로 전환합니다.

1. **제출** 클릭하여 구성을 저장합니다.

   또는 **저장 후 개요** 로 이동 을 클릭하여 구성을 저장하고 간행물 개요 페이지로 리디렉션할 수 있습니다.

   ![토글을 예로 설정하고 제출 또는 저장 후 개요로 이동을 클릭합니다.](./enabling-publications/images/05.png)

## 7.3.x에 대한 발행물 비활성화

원하는 경우 간행물 **설정** 페이지를 통해 언제든지 간행물을 비활성화할 수 있습니다.

1. **글로벌 메뉴**(![Global Menu](../../../images/icon-applications-menu.png))을 열고 **애플리케이션** 탭으로 이동한 다음 출판물에서 **설정** 클릭합니다.

1. 스사이트를 **아니오** 로 전환합니다.

1. **제출** 클릭합니다.

```{important}
비활성화되면 모든 활성 간행물이 비활성화되고 예약된 간행물이 취소되며 더 이상 간행물 기록에 액세스할 수 없습니다. 그러나 DXP는 인스턴스의 게시 기록을 유지하므로 게시를 다시 활성화하면 다시 액세스할 수 있습니다.
```

## 관련 주제

* [간행물 개요](../publications.md)
* [출판물 생성 및 관리](./creating-and-managing-publications.md)
* [변경 및 게시](./making-and-publishing-changes.md)
