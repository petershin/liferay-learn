# 사용자 정의 자산 추적

```{note}
[이벤트 추적](../events/tracking-events.md)을 사용하는 것이 맞춤 자산을 추적하는 데 권장되는 방법입니다.
```

Liferay Analytics Cloud는 블로그, 문서, 미디어, 양식, 웹 콘텐츠 등 내장된 Liferay DXP 자산을 감지하고 분석할 수 있습니다. 사이트에 사용자 정의 자산이 있고 Analytics Cloud에서 이를 추적하려면 HTML 속성을 사용하십시오. Analytics Cloud의 JavaScript 플러그인은 이러한 HTML 속성을 감지하고 사용자 상호 작용을 추적하며 해당 자산 유형 대시보드에 데이터를 표시합니다.

## 자산 이벤트

Analytics Cloud JavaScript 플러그인에는 추적할 수 있는 다음 이벤트가 포함되어 있습니다.

`AssetClicked`: 사용자가 자산 영역을 클릭합니다. 또한 클릭한 태그에 대한 정보도 전달합니다.

`AssetDepthReached`: 자산 영역의 스크롤 이벤트입니다. 또한 사용자가 도달한 콘텐츠 깊이에 대한 정보도 전달합니다(예: 사용자가 블로그 게시물을 얼마나 아래로 스크롤했는지).

`AssetViewed`: 사용자가 자산을 봅니다.

`AssetDownloaded`: 사용자가 자산을 다운로드하는 링크를 클릭합니다.

`AssetSubmitted`: 자산 영역에 양식을 제출합니다. 이를 위해서는 HTML 양식 요소 아래에 submit 입력 유형을 배치해야 합니다.

## 필수 메타데이터

사용자 정의 자산에 대한 추적을 활성화하려면 다음 HTML 속성을 지정해야 합니다.

| 이름             | 유형           | 묘사                                                                               |
|:-------------- |:------------ |:-------------------------------------------------------------------------------- |
| `데이터 분석 자산 작업` | 미리보기 또는 다운로드 | 미리보기 - 미리보기 이벤트를 보냅니다. 다운로드 - 다운로드 이벤트를 보냅니다. 이는 문서, 미디어 또는 사용자 정의 자산에만 적용됩니다.   |
| `데이터 분석 자산 ID` | 끈            | 각 사용자 정의 자산의 고유 식별자입니다. 문자열에는 공백이 포함되어서는 안 됩니다.                                  |
| `데이터 분석 자산 제목` | 끈            | 사용자 정의 자산의 제목입니다.                                                                |
| `데이터 분석 자산 유형` | 끈            | Analytics Cloud에서 사용자 정의 자산을 추적할 자산 유형(예: `블로그`, `문서`, `양식`, `웹 콘텐츠`또는 `사용자 정의`) |

```{note}
Analytics Cloud에서 추적하려는 각 개별 자산에 이러한 속성을 추가해야 합니다. 그러나 스크립트를 사용하여 속성 값을 입력하면 각 자산에 대해 이 프로세스를 자동화할 수 있습니다.
```

## 블로그 유형의 예

사용자 정의 자산을 블로그 유형 자산으로 추적하려면 다른 필수 HTML 태그와 함께 `data-analytics-asset-type="blog"` 사용하십시오.

```html
<div
  data-analytics-asset-id="myBlogId"
  data-analytics-asset-title="Blog Title"
  data-analytics-asset-type="blog"
>
  <h3>아이디어에 생명을 불어넣기: 문예 창작에 대한 살펴보기</h3>

  <p>
    이 블로그에서는 창의성을 활용하여
    아이디어에 생명을 불어넣을 수 있는 방법을 탐구합니다. 우리는 영감을 주고,
    생성하고, 매력적인 스토리를 위한 캐릭터와 줄거리를 개발하는 방법에 대한 기술을 살펴볼 것입니다. 또한
    실제 사례를 살펴보고
    지식을 실제 글쓰기에 적용할 수 있는 실제 사용 사례에 대해 논의합니다.
  </p>
</div>
```

## 문서 및 미디어 유형의 예

사용자 정의 자산을 문서 및 미디어 유형 자산으로 추적하려면 다른 필수 HTML 태그와 함께 `data-analytics-asset-type="document"` 을 사용하십시오.

```html
<div>
  <h3>Analytics Cloud 관련 문서 목록</h3>

  <ul>
    <li
      data-analytics-asset-action="preview"
      data-analytics-asset-id="myDocumentA"
      data-analytics-asset-title="Document A"
      data-analytics-asset-type="document"
    >
      <a data-analytics-asset-action="download" href="/document-a.pdf">문서 A</a>
    </li>
    <li
      data-analytics-asset-action="preview"
      data-analytics-asset-id="myDocumentB"
      data-analytics-asset-title="Document B"
      data-analytics-asset-type="document"
    >
      <a data-analytics-asset-action="download" href="document-b.pdf">문서 B</a>
    </li>
    <li
      data-analytics-asset-action="preview"
      data-analytics-asset-id="myDocumentC"
      data-analytics-asset-title="Document C"
      data-analytics-asset-type="document"
    >
      <a data-analytics-asset-action="download" href="document-c.pdf">문서 C</a>
    </li>
  </ul>
</div>
```

## 양식 유형의 예

사용자 정의 자산을 양식 유형 자산으로 추적하려면 다른 필수 html 태그와 함께 `data-analytics-asset-type="form"` 을 사용하십시오.

```html
<form
  data-analytics-asset-id="myFormId"
  data-analytics-asset-title="Form Title"
  data-analytics-asset-type="form"
>
  <h3>신규 사용자 생성</h3>

  <div class="content">
    <label for="name">이름</label>
    <input id="name" type="text" />
  </div>

  <div class="content">
    <label for="city">도시</label>
    <input id="city" type="text" />
  </div>

  <div class="content">
    <label for="age">나이</label>
    <input id="age" type="text" />
  </div>

  <button type="submit">저장</button>
</form>
```

## 웹 콘텐츠 유형의 예

사용자 정의 자산을 웹 콘텐츠 유형 자산으로 추적하려면 다른 필수 HTML 태그와 함께 `data-analytics-asset-type="web-content"` 사용하십시오.

```html
<div
  data-analytics-asset-id="myWebContentId"
  data-analytics-asset-title="Web Content Title"
  data-analytics-asset-type="web-content"
>
  <h3>아이디어에 생명을 불어넣기: 문예 창작에 대한 살펴보기</h3>

  <p>
    이 블로그에서는 창의성을 활용하여
    아이디어에 생명을 불어넣을 수 있는 방법을 탐구합니다. 우리는 영감을 주고,
    생성하고, 매력적인 스토리를 위한 캐릭터와 줄거리를 개발하는 방법에 대한 기술을 살펴볼 것입니다. 또한
    실제 사례를 살펴보고
    지식을 실제 글쓰기에 적용할 수 있는 실제 사용 사례에 대해 논의합니다.
  </p>
</div>
```

## 사용자 정의 유형의 예

위의 예는 자산 유형에 따라 [자산 분석 보고서](assets.md) 제공합니다(예: 블로그 유형 자산은 대시보드에 블로그 관련 지표를 표시합니다). 더 많은 유연성이 필요한 경우 사용자 정의 유형 자산을 사용하십시오. 다른 필수 HTML 태그와 함께 `data-analytics-asset-type="custom"` 사용하세요.

예를 들어, 사용자 정의 설문 조사 포틀릿에서 설문 조사를 추적하려는 경우 다음과 같은 HTML을 사용할 수 있습니다.

```html
<div data-analytics-asset-type="custom"
  data-analytics-asset-id="favorite-food-poll"
  data-analytics-asset-title="What is your favorite food Poll">

<h1> 당신이 가장 좋아하는 음식은 무엇입니까? </h1>
<form action="/submit.php">
<div>
  <input type="radio" id="sushi" name="food" value="Sushi"
     checked>
  <label for="sushi">초밥</label>
</div>
<div>
  <input type="radio" id="pizza" name="food" value="Pizza">
  <label for="pizza">피자</label>
</div>
<input type="submit" value="Submit" />
</form>
</div>
```

다운로드를 추적하려면 작업을 트리거하는 요소에 `data-analytics-asset-action="download"`태그를 지정해야 합니다.

예를 들어, 설문조사 지침이 포함된 PDF 파일에 대한 다운로드 링크가 포함된 위 설문조사는 다음과 같습니다.

```html
<div data-analytics-asset-type="custom"
  data-analytics-asset-id="favorite-food-poll"
  data-analytics-asset-title="What is your favorite food Poll">

<a href="/poll-instructions.pdf" data-analytics-asset-action="download">설문조사 지침 다운로드 </a>

<h1> 가장 좋아하는 음식은 무엇입니까? </h1>
...
</div>
```
