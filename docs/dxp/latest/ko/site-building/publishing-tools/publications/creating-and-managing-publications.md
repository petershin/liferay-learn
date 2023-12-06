# 출판물 생성 및 관리

{bdg-secondary}`라이프레이 DXP/포탈 7.3+`

출판물을 사용하면 사용자는 인스턴스 범위의 변경 블록을 생성할 수 있습니다. 각 게시는 인스턴스 범위이므로 Liferay UI의 어느 곳에서나 액세스할 수 있으며 여러 사이트의 변경 사항을 포함할 수 있습니다. 기본적으로 사용자는 자신이 만든 발행물만 보고 관리할 수 있습니다. 그러나 사용자는 출판물에 대한 공동 작업을 위해 서로를 초대할 수 있습니다. 자세한 내용은 [출판물 공동작업](./collaborating-on-publications.md)을 참조하세요.

[$LIFERAY_LEARN_YOUTUBE_URL$]=https://www.youtube.com/embed/QifaRHHuoX8

출판물이 [enabled](./enabling-publications.md)이면 출판물 애플리케이션 페이지 또는 출판물 드롭다운 메뉴를 통해 출판물을 생성, 편집, 게시 또는 제거할 수 있습니다.

```{important}
Liferay 버전을 업그레이드하기 전에 모든 활성 출판물을 게시했는지 확인하세요. 업그레이드 후에는 활성 게시가 오래된 것으로 표시되어 게시하거나 변경할 수 없습니다. 또한 업그레이드 전에 게시된 출판물은 되돌릴 수 없습니다. 이러한 출판물에서는 *되돌리기* 옵션이 제거되었습니다.
```

## 출판물 만들기

1. **출판** 드롭다운 메뉴를 클릭하고 **새 출판물 만들기** 를 선택합니다.

   ![Click Create New Publication in the Publications drop-down menu.](./creating-and-managing-publications/images/01.png)

   또는 출판물 애플리케이션을 열고 **진행 중** 탭에서 **추가**(![추가 버튼](../../../images/icon-add.png))를 클릭하세요.

1. 출판물의 **이름** 과 **설명** 을 입력하세요.

   또는 [게시 템플릿](./using-publication-templates.md)을 선택하여 이러한 필드를 자동으로 채웁니다.

   ```{note}
  출판물 이름은 고유할 필요가 없습니다. 그러나 구성에는 고유한 이름을 사용하는 것이 좋습니다.
   ```

1. **만들기** 를 클릭하세요.

![Enter a name and description for your publication, and click Create.](./creating-and-managing-publications/images/02.png)

발행물이 생성되면 변경 사항을 추가할 수 있습니다. 편집 및 게시 프로세스에 대해 자세히 알아보려면 [변경 및 게시](./making-and-publishing-changes.md)를 참조하세요.

```{note}
제작 후 각 출판은 출판의 변경 사항과 충돌하지 않는 한 프로덕션에서 변경한 내용으로 자동 업데이트됩니다.
```

## 지속적인 출판물 관리

**진행 중** 탭에서는 귀하에게 보기 권한이 있는 모든 활성, 미출판 간행물의 표를 볼 수 있습니다. 표는 **수정 날짜** 별로 정렬되어 있으며 각 출판물의 이름, 설명, 마지막 수정 시간, 작성 시간 및 소유자가 포함되어 있습니다.

![The Ongoing tab lists all active, unpublished publications.](./creating-and-managing-publications/images/03.png)

여기에서 간행물의 작업 버튼( ![작업 버튼](../../../images/icon-actions.png) )을 클릭하여 다음 작업을 수행할 수 있습니다.

**출판물 작업** : 변경 사항을 추가할 출판물을 선택합니다. 선택한 후에는 출판물 드롭다운 메뉴를 통해 출판물과 제작물 간을 쉽게 전환할 수 있습니다. 자세한 내용은 [출판물 변경](./making-and-publishing-changes.md#making-changes-in-a-publication) 을 참조하세요.

**수정** : 출판물의 이름이나 설명을 수정합니다.

**변경 사항 검토** : 출판물에 포함된 모든 변경 사항을 봅니다. 자세한 내용은 [출판물 변경 검토](./making-and-publishing-changes.md#reviewing-publication-changes) 를 참조하세요.

**사용자 초대** : 출판물에 대한 공동 작업을 위해 사용자를 초대합니다. 자세한 내용은 [출판물 공동작업](./collaborating-on-publications.md)을 참조하세요.

**게시** : 출판물 출판 프로세스를 시작합니다. 이렇게 하면 사용자가 충돌을 해결할 수 있는 게시 페이지로 리디렉션됩니다. 충돌이 없으면 **게시** 를 클릭하여 변경 사항을 적용할 수 있습니다. 자세한 내용은 [게시 변경 사항](./making-and-publishing-changes.md#publishing-changes) 및 [충돌 해결](./resolving-con conflicts.md)을 참조하세요.

**일정** : 출판물의 변경 사항이 제작에 적용되도록 일정을 잡습니다. 자세한 내용은 [게시 변경 사항](./making-and-publishing-changes.md#publishing-changes) 을 참조하세요.

**권한** : 사용자 역할에 출판 관련 권한을 할당합니다. 이러한 방식으로 구성된 권한은 개별 게시에 적용됩니다. <!--TASK: Link to the permissions article once finished.-->

**삭제** : 인스턴스에서 발행물을 제거합니다. 선택하면 선택을 확인하라는 메시지가 표시됩니다.

```{warning}
출판물을 삭제하면 데이터베이스의 모든 변경 사항이 영구적으로 제거되며 취소할 수 없습니다. 출판물을 삭제하기 전에 보존하려는 데이터를 모두 저장했는지 확인하세요.
```

## 예약 출판물 관리

**일정** 탭에서는 보기 권한이 있는 모든 예약 출판물의 표를 볼 수 있습니다. 기본적으로 예약된 출판물은 **이름** 별로 나열되지만 수정된 날짜 또는 각 출판물이 출판 예정된 날짜별로 정렬할 수 있습니다.

![The Schedule tab lists all scheduled publications for your instance.](./creating-and-managing-publications/images/04.png)

예약된 후에는 출판물에 변경 사항을 추가할 수 없습니다. 그러나 작업 버튼(![작업 버튼](../../../images/icon-actions.png))을 클릭하여 다음 작업을 수행할 수 있습니다.

**예약 취소** : 예약된 게시를 취소하고 게시를 **진행 중** 상태로 되돌립니다.

**일정 변경** : 변경사항을 프로덕션에 게시할 대체 날짜와 시간을 설정합니다.

**변경 사항 검토** : 출판물에 포함된 모든 변경 사항을 봅니다.

## 출판 이력 관리

**기록** 탭에서는 다른 사용자가 게시한 출판물을 포함하여 DXP 인스턴스에 대해 게시된 모든 출판물의 테이블을 볼 수 있습니다. 기본적으로 출판물은 **게시 날짜** 별로 정렬되지만 이름별로 정렬할 수도 있습니다.

![The History tab lists all previously published publications for your instance.](./creating-and-managing-publications/images/05.png)

여기에서 발행물의 **되돌리기** 를 클릭하면 변경 사항을 되돌리는 새 발행물이 자동으로 생성됩니다. 되돌리기 게시의 일부로 DXP 인스턴스를 추가로 변경할 수도 있습니다. 자세한 내용은 [변경 사항 되돌리기](./reverting-changes.md)를 참조하세요.

```{note}
인스턴스에 게시된 모든 게시는 기록 탭에 나열되지만 게시 소유자와 공동작업자만 게시의 변경 내용 목록을 보거나 되돌릴 수 있습니다.
```

## 관련 주제

* [간행물 개요](../publications.md)
* [게시물 활성화](./enabling-publications.md)
* [변경 사항 작성 및 게시](./making-and-publishing-changes.md)
