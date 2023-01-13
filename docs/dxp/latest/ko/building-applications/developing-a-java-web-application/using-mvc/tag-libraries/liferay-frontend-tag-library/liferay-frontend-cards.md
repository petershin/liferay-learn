# Liferay 프런트 엔드 카드

이미지 사용량이 많은 비교하려는 데이터가 있는 경우 카드가 작업의 구성 요소입니다. 카드는 최소한의 간결한 형식으로 데이터를 시각적으로 나타냅니다. 이미지, 문서 라이브러리, 사용자 프로필 등에 사용하십시오. 카드에는 네 가지 주요 유형이 있습니다.

* Horizontal Cards
* 아이콘 카드
* 수직 카드
* 사용자 카드

각 카드의 예는 다음과 같습니다.

## 수평 카드

수평 카드는 주로 파일 및 폴더와 같은 문서를 표시하는 데 사용됩니다. 구성 예는 다음과 같습니다.

```jsp
<liferay-frontend:horizontal-card
    text="Documents"
  url="https://portal.liferay.dev/docs/7-1/tutorials/-/knowledge_base/t/clay-icons"
>
    <liferay-frontend:horizontal-card-col>
                <liferay-frontend:horizontal-card-icon
                    icon="folder"
                />
    </liferay-frontend:horizontal-card-col>
</liferay-frontend:horizontal-card>
```

![가로형 카드는 파일과 문서를 표시하는 데 적합합니다.](./liferay-frontend-cards-intro/images/01.png)

`<liferay-frontend:horizontal-card-icon>` 태그는 `아이콘` 속성에 대해 [Clay Icons](../clay-tag-library/clay-icons.md) 를 사용합니다.

## 아이콘 세로형 카드

아이콘 세로 카드는 이름에서 알 수 있듯이 아이콘을 강조하는 세로 형식으로 정보를 표시하는 카드입니다. 이 카드는 연결된 이미지가 없는 콘텐츠를 보여줍니다. 대신 콘텐츠의 종류를 나타내는 아이콘이 표시됩니다. 아래 예제 스니펫은 웹 콘텐츠 기사에 대한 정보를 표시합니다.

```jsp
<liferay-frontend:icon-vertical-card
  cssClass="article-preview-content"
  icon="web-content"
  title="<%= title %>"
>
  <liferay-frontend:vertical-card-sticker-bottom>
    <liferay-ui:user-portrait
      cssClass="sticker sticker-bottom"
      userId="<%= assetRenderer.getUserId() %>"
    />
  </liferay-frontend:vertical-card-sticker-bottom>

  <liferay-frontend:vertical-card-footer>
    <aui:workflow-status 
      markupView="lexicon" 
      showIcon="<%= false %>" 
      showLabel="<%= false %>" 
      status="<%= article.getStatus() %>" 
    />
  </liferay-frontend:vertical-card-footer>
</liferay-frontend:icon-vertical-card>
```

![세로 아이콘 카드는 웹 콘텐츠 기사와 같은 엔터티 선택을 표시하는 데 적합합니다.](./liferay-frontend-cards-intro/images/02.png)

## 수직 카드

세로 카드는 가로 형식과 달리 세로 카드 형식으로 정보를 표시합니다. 콘텐츠에 연결된 이미지(예: 블로그 헤더 이미지)가 있는 경우 수직 카드를 사용하여 이미지를 표시할 수 있습니다. 연결된 이미지가 없는 경우 아이콘 세로 카드를 대신 사용하여 콘텐츠 유형(예: PDF 파일)을 나타낼 수 있습니다. 아래 예는 이미지 미리보기를 사용할 수 있을 때 웹 콘텐츠 기사에 대한 세로 카드를 표시합니다.

```jsp
<liferay-frontend:vertical-card
  cssClass="article-preview-content"
  imageUrl="<%= articleImageURL %>"
  title="<%= title %>"
>
  <liferay-frontend:vertical-card-sticker-bottom>
    <liferay-ui:user-portrait
      cssClass="sticker sticker-bottom"
      userId="<%= assetRenderer.getUserId() %>"
    />
  </liferay-frontend:vertical-card-sticker-bottom>

  <liferay-frontend:vertical-card-footer>
    <aui:workflow-status 
      markupView="lexicon" 
      showIcon="<%= false %>" 
      showLabel="<%= false %>" 
      status="<%= article.getStatus() %>" 
    />
  </liferay-frontend:vertical-card-footer>
</liferay-frontend:vertical-card>
```

![수직 카드는 파일과 문서를 표시하는 데 적합합니다.](./liferay-frontend-cards-intro/images/03.png)

## HTML 수직 카드

HTML 수직 카드를 사용하면 수직 카드의 헤더에 사용자 정의 HTML을 표시할 수 있습니다. 아래 예는 비디오를 포함합니다.

```
<liferay-util:buffer var = "customThumbnailHtml">
    <div class="embed-responsive embed-responsive-16by9">
      <iframe class="embed-responsive-item" 
    src="https://www.youtube.com/embed/8Bg9jPJpGOM?rel=0" 
    allowfullscreen></iframe>
    </div>
</liferay-util:buffer>

<div class="container">
  <div class="row">
    <div class="col-md-4">
      <liferay-frontend:html-vertical-card
        html="<%= customThumbnailHtml %>"
        title="My Video"
      >
      </liferay-frontend:html-vertical-card>
    </div>
  </div>
</div>
```

![Html 수직 카드를 사용하면 카드 헤더에 사용자 지정 HTML을 표시할 수 있습니다.](./liferay-frontend-cards-intro/images/04.png)

## 사용자 수직 카드

사용자 수직 카드는 관리 표시줄의 아이콘 보기에서 사용자 프로필 선택을 표시합니다. 다음은 사용자 관리 포틀릿의 예제 스니펫입니다.

```jsp
<liferay-frontend:user-vertical-card
  actionJsp="/membership_request_action.jsp"
  actionJspServletContext="<%= application %>"
  resultRow="<%= row %>"
  subtitle="<%= membershipRequestUser.getEmailAddress() %>"
  title="<%= HtmlUtil.escape(membershipRequestUser.getFullName()) %>"
  userId="<%= membershipRequest.getUserId() %>"
>
  <liferay-frontend:vertical-card-header>
    <liferay-ui:message 
      arguments="<%= LanguageUtil.getTimeDescription(
      request, 
      System.currentTimeMillis() - membershipRequest.getCreateDate().getTime(), 
      true) %>" 
      key="x-ago" 
      translateArguments="<%= false %>" 
    />
  </liferay-frontend:vertical-card-header>
</liferay-frontend:user-vertical-card>
```

![사용자 세로형 카드는 파일과 문서를 표시하는 데 적합합니다.](./liferay-frontend-cards-intro/images/05.png)

## 관련 항목

* [Liferay 프런트 엔드 추가 메뉴](./liferay-frontend-add-menu.md)
* [Liferay 프런트 엔드 정보 표시줄](./liferay-frontend-info-bar.md)
* [Liferay 프런트 엔드 관리 바](./liferay-frontend-management-bar.md)