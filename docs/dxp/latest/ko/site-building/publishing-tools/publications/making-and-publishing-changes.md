# 변경 사항 작성 및 게시

{bdg-secondary}`라이프레이 7.3+`

출판물은 Liferay 인스턴스의 변경 사항을 관리하는 편리한 방법을 제공합니다. 이를 통해 귀하와 귀하의 팀은 '게시물'이라는 변경 블록을 만들고 공동 작업할 수 있습니다. 그런 다음 준비가 되면 해당 변경 사항을 프로덕션에 게시할 수 있습니다.

[$LIFERAY_LEARN_YOUTUBE_URL$]=https://www.youtube.com/embed/YNOLwu19oBk

```{note}
기본적으로 사용자는 자신이 만든 출판물에만 기여할 수 있습니다. 그러나 다른 사용자를 초대하여 출판물에 대해 공동 작업을 수행할 수 있습니다. 자세한 내용은 [출판물 공동작업](./collaborating-on-publications.md)을 참조하세요.
```

변경 사항을 추적하기 위한 출판물을 아직 만들지 않은 경우 자세한 내용은 [게시물 만들기](./creating-and-managing-publications.md#creating-a-publication) 를 참조하세요.

발행물이 생성되면 발행물의 변경 사항과 충돌하지 않는 한 프로덕션에 대한 변경 사항이 자동으로 업데이트됩니다. 이를 통해 귀하와 귀하의 팀은 최신 버전의 프로덕션에서 작업할 수 있습니다.

```{important}
Liferay 버전을 업그레이드한 후에는 기존 발행물을 변경, 게시 또는 되돌릴 수 없습니다. 모든 활성 출판물은 오래된 것으로 표시되며 보거나 삭제할 수만 있습니다. 또한 업그레이드 전에 게시된 출판물의 경우 *되돌리기* 옵션이 제거되었습니다.
```

## 출판물 변경

인스턴스를 변경하기 전에 올바른 게시 작업을 하고 있는지 확인하세요. 출판물 표시줄을 통해 이를 확인할 수 있습니다. 현재 출판물에 있지 않은 경우 출판물을 만들거나 기존 출판물을 선택할 수 있습니다.

![Select the desired publication or create one.](./making-and-publishing-changes/images/01.png)

출판물에서 자산을 추가, 편집 또는 제거하면 변경 사항은 해당 출판물에서만 볼 수 있습니다. 출판물에서 자산을 삭제하면 DXP는 해당 자산을 삭제 대상으로 표시하고 출판물을 볼 때 숨깁니다. 자산 제거는 논리적 삭제일 뿐이므로 프로덕션 및 기타 출판물에서 자산을 계속 볼 수 있습니다.

출판물 작업 중에 지원되는 Liferay 구성 요소에 대한 변경 사항이 출판물에서 추적됩니다. 여기에는 여러 사이트의 변경 사항이 포함됩니다.

```{important}
동일한 발행물에서 여러 사이트를 편집하는 경우 발행물이 게시될 때 추적된 모든 변경 내용이 프로덕션에 적용된다는 점을 명심하십시오.
```

### 지원되지 않는 애플리케이션으로 이동

{bdg-link-primary}` [릴리스 기능](../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) `

{bdg-secondary}`라이프레이 7.4 2023.Q3+/GA98+`

출판물을 지원하지 않는 응용 프로그램으로 이동하면 Liferay는 응용 프로그램의 변경 사항을 출판물에 저장할 수 없음을 나타냅니다.

일부 응용 프로그램의 경우 출판 중에 제작물을 직접 편집할 수 있습니다.

![Directly edit production while in a publication.](./making-and-publishing-changes/images/02.png)

다른 애플리케이션의 경우 변경하기 전에 프로덕션으로 전환해야 합니다.

![Switch to production before making changes in the application.](./making-and-publishing-changes/images/03.png)

## 병렬 출판 변경

사용자는 동시에 여러 개의 활성 출판물을 보유할 수 있습니다. 이러한 병렬 게시를 변경하면 인스턴스 엔터티에 대한 대체 편집 기록이 생성됩니다. 이러한 변경 사항은 동일하거나 관련된 콘텐츠를 수정하는지 여부에 따라 호환되거나 충돌할 수 있습니다.

### 호환 가능한 변경 사항

병렬 게시에 호환 가능한 변경 사항이 포함된 경우 문제 없이 게시될 수 있습니다. 이 경우 두 출판물의 추적된 변경 내용이 프로덕션에 적용됩니다.

### 변경이 충돌함

병렬 게시에 호환되지 않는 변경 사항이 포함되어 있고 게시 중 하나가 프로덕션에 먼저 적용되면 다른 게시에서 게시 충돌이 발생합니다. 이러한 충돌은 프로덕션이 직접 업데이트되는 경우에도 발생할 수 있습니다. 이 프로세스에 대한 자세한 내용은 [충돌 해결](./resolving-contributes.md)을 참조하세요.

## 출판물 변경 검토

게시하기 전에 게시의 추적된 변경 사항을 검토하여 원하는 편집 내용만 포함되어 있는지 확인할 수 있습니다. 이렇게 하려면 출판물 드롭다운 메뉴를 열고 **변경 사항 검토** 를 선택하세요.

![Open the Publications drop-down menu and select Review Changes.](./making-and-publishing-changes/images/04.png)

또는 출판 애플리케이션을 통해 출판의 추적된 변경 사항을 검토할 수 있습니다. **진행 중** 탭으로 이동하여 원하는 출판물에 대한 **작업** 버튼( ![작업 버튼](../../../images/icon-actions.png) )을 클릭하고 **검토를 선택하기만 하면 됩니다. 변경사항** .

변경 사항을 검토할 때 추적된 모든 변경 사항은 사용자, 사이트, 제목, 유형, 상태, 변경 유형 또는 마지막 수정 날짜별로 정렬할 수 있는 목록에 표시됩니다.

기본적으로 출판물에는 일부 변경 사항만 표시되지만 모든 시스템 변경 사항도 볼 수 있습니다. 게시에 대해 **작업**(![작업 버튼](../../../images/icon-actions.png))을 클릭하고 **시스템 변경 사항 표시** 를 선택합니다. 그러면 발행물에 포함된 모든 변경 사항이 표시됩니다.

![Select Show System Changes to view all changes included in the publication.](./making-and-publishing-changes/images/05.png)

검토 중에 변경 사항을 선택하여 자세한 내용을 확인하고 추가 작업(예: 편집, 삭제)에 액세스할 수 있습니다. 사용 가능한 작업은 엔터티 유형에 따라 다릅니다.

![Select a change to view more details and access additional actions.](./making-and-publishing-changes/images/06.png)

### 페이지 변경 사항 미리보기

`{bdg-link-primary}` [릴리스 기능](../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) `

`{bdg-secondary}`라이프레이 7.4 2023.Q3+/GA98+`

발행물에 페이지 편집 내용이 포함된 경우 페이지의 원본 버전과 함께 해당 변경 사항을 미리 볼 수 있습니다.

![View page versions in the Display tab.](./making-and-publishing-changes/images/07.png)

대체 [사용자 경험](../../personalizing-site-experience/experience-personalization/creating-and-managing-experiences.md)이 있는 페이지의 변경 사항을 검토할 때 경험 드롭다운 메뉴를 사용하여 다음을 수행할 수 있습니다. 그들 사이를 전환하십시오.

![Select the desired user experience to review.](./making-and-publishing-changes/images/08.png)

선택한 후에는 각 페이지 버전을 개별적으로 보거나 분할 보기를 선택하여 나란히 검토할 수 있습니다.

![Review page versions individually or select Split View to review them side by side.](./making-and-publishing-changes/images/09.png)

### 출판 간 변경 사항 이동

`{bdg-link-primary}` [베타 기능](../../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags) `

`{bdg-secondary}`라이프레이 7.4 2023.Q3+/GA98+`

변경 사항을 검토하는 동안 해당 내용을 다른 출판물로 이동할 수 있습니다. 이는 컨텐츠 관리 시 더 큰 유연성을 제공합니다.

1. 원하는 변경 사항에 대해 **작업** 버튼( ![작업 버튼](../../../images/icon-actions.png) )을 클릭하고 **변경 사항 이동** 을 선택합니다.

   ![Click the Actions button for the desired change and select Move changes.](./making-and-publishing-changes/images/10.png)

1. 원하는 **출판물** 을 선택하세요.

1. **이동** 을 클릭하세요.

이렇게 하면 변경 사항이 하위 항목과 함께 선택한 발행물로 이동됩니다. 또한 현재 게시에서 변경 내용과 해당 하위 항목도 제거됩니다.

## 변경 사항 게시

변경이 완료되면 즉시 게시하거나 나중에 게시되도록 예약할 수 있습니다. 출판되면 출판물 애플리케이션의 **기록** 탭에 출판물이 나열됩니다. 이를 통해 필요할 때 사이트 변경 사항을 검토하고 되돌릴 수 있는 명확한 감사 추적이 유지됩니다. 자세한 내용은 [변경 사항 되돌리기](./reverting-changes.md)를 참조하세요.

출판 프로세스를 시작하면 Liferay는 호환성 검사를 수행하여 출판과 제작 사이에 충돌이 있는지 확인합니다. 충돌이 있는 경우 DXP에서 이를 알려드립니다. 일부 충돌은 자동으로 해결되지만 다른 충돌은 수동으로 해결해야 합니다. 변경 사항을 게시하려면 모든 충돌을 해결해야 합니다. 자세한 내용은 [충돌 해결](./resolving-contributes.md)을 참조하세요.

### 지금 게시 중

변경 사항을 즉시 게시하려면 다음 단계를 따르세요.

1. 출판물 드롭다운 메뉴를 열고 **변경사항 검토** 를 선택하세요.

   또는 출판물 애플리케이션을 열고 원하는 출판물을 클릭하십시오.

1. **게시** 를 클릭하세요.

   ![Navigate to the desired publication and click on Publish.](./making-and-publishing-changes/images/11.png)

1. 필요한 경우 감지된 충돌을 수동으로 해결합니다. 모든 충돌이 해결되면 계속 진행할 수 있습니다.

   ![Resolve all conflicts before publishing.](./making-and-publishing-changes/images/12.png)

1. **게시** 를 클릭하세요.

출판의 변경 사항은 즉시 제작에 적용되며 기록 탭으로 리디렉션됩니다. 여기에서 원하는 경우 게시 세부 정보(예: 날짜, 게시자, 상태) 및 [revert](./reverting-changes.md) 게시 변경 사항을 볼 수 있습니다.

### 나중에 예약하기

나중에 게시하도록 예약하려면 다음 단계를 따르세요.

1. 출판물 드롭다운 메뉴를 열고 **변경사항 검토** 를 선택하세요.

   또는 출판물 애플리케이션을 열고 원하는 출판물을 클릭하십시오.

1. **일정** 을 클릭하세요.

   ![Navigate to the desired publication and click on Schedule.](./making-and-publishing-changes/images/13.png)

1. 필요한 경우 감지된 충돌을 수동으로 해결합니다. 모든 충돌이 해결되면 계속 진행할 수 있습니다.

   ```{important}
   게시 시점에 DXP는 두 번째 충돌 감지를 수행하여 새로운 충돌하는 변경 사항이 없는지 확인합니다. DXP가 자동으로 해결할 수 없는 새로운 충돌을 감지하면 게시가 실패합니다. 충돌을 자동으로 해결할 수 있으면 DXP는 게시를 진행합니다.
   ```

1. 변경 사항이 프로덕션에 게시되는 시기를 결정하려면 날짜와 시간을 입력하세요.

   ![Set a date and time to publish your changes.](./making-and-publishing-changes/images/14.png)

1. 프로세스를 완료하려면 **일정** 을 클릭하세요.

이렇게 하면 예약된 게시를 보고 [관리](./creating-and-managing-publications.md#managing-scheduled-publications) 할 수 있는 예약 탭으로 리디렉션됩니다.

## 불필요한 출판 데이터 제거

출판물 변경 사항을 검토할 때 파일 및 페이지 미리 보기가 문서 라이브러리에 누적될 수 있습니다. 원하는 경우 이 데이터를 제거할 수 있습니다.

1. **전역 메뉴**(![전역 메뉴](../../../images/icon-applications-menu.png))를 열고 **제어판** 으로 이동한 다음 **시스템 설정** 을 클릭합니다.

1. 플랫폼 아래에서 **업그레이드** 를 클릭하세요.

1. 플랫폼 아래에서 **업그레이드** 를 클릭하세요.
**데이터 제거** 탭으로 이동합니다.

1. 플랫폼 아래에서 **업그레이드** 를 클릭하세요.
**DL 미리보기 변경 내용 추적 저장소 콘텐츠 데이터 제거** 를 선택합니다.

   ![Check the change tracking options.](./making-and-publishing-changes/images/15.png)

1. 플랫폼 아래에서 **업그레이드** 를 클릭하세요.
**저장** 을 클릭하세요.

Liferay는 불필요한 데이터를 즉시 제거합니다.

## 관련 주제

* [간행물 개요](../publications.md)
* [게시물 활성화](./enabling-publications.md)
* [출판물 생성 및 관리](./creating-and-managing-publications.md)
