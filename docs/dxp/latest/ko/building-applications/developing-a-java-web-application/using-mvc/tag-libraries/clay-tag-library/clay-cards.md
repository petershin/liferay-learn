# 클레이 카드

카드는 시각적으로 데이터를 나타냅니다. 이미지, 문서 라이브러리, 사용자 프로필 등에 사용하십시오. 카드에는 네 가지 주요 유형이 있습니다.

* 이미지 카드
* 파일 카드
* 사용자 카드
* Horizontal Cards

이러한 각 유형은 아래에서 다룹니다.

## 이미지 카드

이미지 카드는 이미지/문서 갤러리에 사용됩니다.

이미지 카드:

```jsp
<clay:image-card
    actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    href="#1"
    imageAlt="thumbnail"
    imageSrc="https://images.unsplash.com/photo-1506976773555-b3da30a63b57"
    subtitle="Author Action"
    title="Madrid"
/>
```

![이미지 카드는 이미지와 문서를 표시합니다.](./clay-cards/images/01.png)

아이콘이 있는 이미지 카드:

```jsp
<clay:image-card
    actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    icon="camera"
    subtitle="Author Action"
    title="<%= SVG_FILE_TITLE %>"
/>
```

![이미지 카드는 이미지 대신 아이콘을 표시할 수도 있습니다.](./clay-cards/images/02.png)

이미지 카드 비어 있음:

```jsp
<clay:image-card 
  actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    subtitle="Author Action"
    title="<%= SVG_FILE_TITLE %>"
/>
```

![카드는 아무것도 표시하지 않을 수도 있습니다.](./clay-cards/images/03.png)

카드에는 파일 형식도 포함될 수 있습니다. `filetype` 속성으로 파일 유형을 지정합니다.

```jsp
<clay:image-card
    actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    fileType="JPG"
    fileTypeStyle="danger"
    href="#1"
    imageAlt="thumbnail"
    imageSrc="https://images.unsplash.com/photo-1499310226026-b9d598980b90"
    subtitle="Author Action"
    title="California"
/>
```

![카드에는 파일 형식도 포함될 수 있습니다.](./clay-cards/images/04.png)

카드에 라벨을 추가하려면 `라벨` 속성을 포함하세요.

```jsp
<clay:image-card
    actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    fileType="JPG"
    fileTypeStyle="danger"
    href="#1"
    imageAlt="thumbnail"
    imageSrc="https://images.unsplash.com/photo-1503703294279-c83bdf7b4bf4"
    labels="<%= cardsDisplayContext.getLabels() %>"
    subtitle="Author Action"
    title="Beetle"
/>
```

![카드에 레이블을 포함할 수 있습니다.](./clay-cards/images/05.png)

`선택 가능` 속성을 포함하여 카드를 선택 가능하게 만듭니다(확인란 포함).

```jsp
<clay:image-card
    actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    fileType="JPG"
    fileTypeStyle="danger"
    href="#1"
    imageAlt="thumbnail"
    imageSrc="https://images.unsplash.com/photo-1506020647804-b04ee956dc04"
    labels="<%= cardsDisplayContext.getLabels() %>"
    selectable="<%= true %>"
    selected="<%= true %>"
    subtitle="Author Action"
    title="Beetle"
/>
```

![카드는 선택 가능합니다.](./clay-cards/images/06.png)

## 파일 카드

파일 카드에는 파일 유형의 아이콘이 표시됩니다. 이미지 파일 이외의 파일 유형을 나타냅니다(예: PDF, MP3, DOC 등).

```jsp
<clay:file-card
    actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    fileType="MP3"
    fileTypeStyle="warning"
    labels="<%= cardsDisplayContext.getLabels() %>"
    labelStylesMap="<%= cardsDisplayContext.getLabelStylesMap() %>"
    selectable="<%= true %>"
    selected="<%= true %>"
    subtitle="Jimi Hendrix"
    title="<%= MP3_FILE_TITLE %>"
/>
```

![파일 카드는 파일 유형 아이콘을 표시합니다.](./clay-cards/images/07.png)

위와 같이 선택적으로 `labelStylesMap` 속성을 사용하여 여러 레이블의 `HashMap` 을 전달할 수 있습니다.

아래 예에서는 기본 파일 아이콘 대신 목록 `아이콘` 을 지정합니다.

```jsp
<clay:file-card
    actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    fileType="DOC"
    fileTypeStyle="info"
    icon="list"
    labels="<%= cardsDisplayContext.getLabels() %>"
    selectable="<%= true %>"
    selected="<%= true %>"
    subtitle="Paco de Lucia"
    title="<%= DOC_FILE_TITLE %>"
/>
```

```{note}
사용 가능한 Liferay 아이콘의 전체 목록은 [Clay CSS 웹사이트](https://clayui.com/docs/components/icon.html)에서 확인할 수 있습니다.
```

## 사용자 카드

사용자 카드에는 사용자 프로필 이미지 또는 사용자 이름 또는 이름+성이 이니셜이 표시됩니다.

이니셜이 있는 사용자 카드:

```jsp
<clay:user-card
    actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    initials="HS"
    name="User Name"
    subtitle="Latest Action"
    userColor="danger"
/>
```

![사용자 카드는 사용자의 이니셜을 표시할 수 있습니다.](./clay-cards/images/08.png)

프로필 이미지가 있는 사용자 카드:

```jsp
<clay:user-card
    actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    disabled="<%= true %>"
    imageAlt="thumbnail"
    imageSrc="https://images.unsplash.com/photo-1502290822284-9538ef1f1291"
    name="User name"
    selectable="<%= true %>"
    selected="<%= true %>"
    subtitle="Latest Action"
/>
```

![사용자 카드는 프로필 이미지를 표시할 수도 있습니다.](./clay-cards/images/09.png)

## Horizontal Cards

수평 카드는 폴더를 나타내며 다른 카드와 동일한 양의 정보를 가질 수 있습니다. 주요 차이점은 수평 카드를 사용하면 폴더 아이콘만 필요하므로 카드의 이미지 부분을 제거할 수 있다는 것입니다.

```jsp
<clay:horizontal-card
    actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    selectable="<%= true %>"
    selected="<%= true %>"
    title="ReallySuperInsanelyJustIncrediblyLongAndTotallyNotPossibleWordButWeAreReallyTryingToCoverAllOurBasesHereJustInCaseSomeoneIsNutsAsPerUsual"
/>
```

![수평 카드는 폴더를 표시하는 데 적합합니다.](./clay-cards/images/10.png)

이제 UI에서 카드를 사용하여 앱에 정보를 표시하는 방법을 알았습니다.

## 관련 주제

* [점토 배지](./clay-badges.md)
* [점토 라벨 및 링크](./clay-links-and-labels.md)
* [점토 스티커](./clay-stickers.md)