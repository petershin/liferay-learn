# 사용자 정의 자산 추적

```{note}
맞춤 자산을 추적하는 데 권장되는 방법은 [이벤트 추적](../events/tracking-events.md)을 사용하는 것입니다.
```

Liferay Analytics Cloud는 양식, 블로그, 문서 및 미디어, 웹 콘텐츠와 같은 내장된 Liferay DXP 자산을 감지하고 분석할 수 있습니다. 그러나 맞춤형 앱에서 자산을 분석하려면 Analytics Cloud JavaScript 플러그인이 자산과의 사용자 상호 작용을 감지하고 추적할 수 있도록 앱의 HTML에 태그를 지정해야 합니다.

## 자산 이벤트

Analytics Cloud JavaScript 플러그인에는 추적할 수 있는 다음 이벤트가 포함되어 있습니다.

`AssetClicked`: 사용자가 자산 영역을 클릭합니다. 클릭한 태그에 대한 정보도 전달합니다.

`AssetDepthReached`: 자산 영역에서 스크롤 이벤트. 또한 사용자가 도달한 콘텐츠 깊이에 대한 정보도 전달합니다(예: 사용자가 블로그 게시물을 얼마나 아래로 스크롤했는지).

`AssetViewed`: 사용자가 자산을 봅니다.

`AssetDownloaded`: 사용자가 자산을 다운로드하는 링크를 클릭합니다.

`AssetSubmitted`: 자산 영역에서 양식 제출. HTML 양식 요소 아래에 제출할 입력 유형이 필요합니다.

## 필수 메타데이터

사용자 지정 엔터티에 대한 추적을 활성화하려면 다음 정보가 있어야 합니다. 나열된 속성을 통해 HTML에서 이 정보를 지정해야 합니다.

**자산 유형(문자열):** 추적할 자산 유형입니다. 이에 대한 HTML 속성은 data-analytics-asset-type입니다. 이 속성의 값은 엔티티의 정확한 유형이 아닙니다. 사용자 지정 엔터티의 경우 이 값은 항상 사용자 지정입니다.

**자산 ID(문자열):** 자산의 고유 식별자입니다. 이에 대한 HTML 속성은 data-analytics-asset-id입니다.

**자산 범주(문자열, 선택 사항):** 자산이 포함된 맞춤형 앱의 범주입니다. 이에 대한 HTML 속성은 data-analytics-asset-category입니다. 이를 사용하여 이름으로 맞춤형 앱을 식별할 수 있습니다(예: "설문 조사"). 카테고리 내에서 모든 저작물 ID는 고유해야 합니다.

**자산 제목(문자열, 선택 사항):** 자산의 제목입니다. 이에 대한 HTML 속성은 data-analytics-asset-title입니다.

## 자산 이벤트 추적

예를 들어 사용자 지정 설문 조사 앱에서 설문 조사를 추적하려는 경우 다음과 같은 HTML을 사용할 수 있습니다.

```html
<div>
<h1> What's your favorite food? </h1>
<form action="/submit.php">
<div>
  <input type="radio" id="sushi" name="food" value="Sushi"
     checked>
  <label for="sushi">Sushi</label>
</div>
<div>
  <input type="radio" id="pizza" name="food" value="Pizza">
  <label for="pizza">Pizza</label>
</div>
<input type="submit" value="Submit" />
</form>
</div>
```

이 투표의 이벤트를 추적하려면 위 속성을 div에 추가하십시오.

```html
<div data-analytics-asset-type="custom"
  data-analytics-asset-id="favorite-food-poll"
  data-analytics-asset-category="polls"
  data-analytics-asset-title="What is your favorite food Poll">

<h1> What's your favorite food? </h1>
...
</div>
```

```{note}
Analytics Cloud에서 추적하려는 각 개별 자산에 이러한 속성을 추가해야 합니다. 그러나 스크립트를 통해 속성 값을 채울 수 있으므로 각 자산에 대해 이 프로세스를 자동화할 수 있습니다.
```

### 다운로드 추적

다운로드를 추적하려면 다음 속성으로 작업을 트리거하는 요소에 태그를 지정해야 합니다.

```html
data-analytics-asset-action="download"
```

예를 들어, 다음은 설문 조사 지침이 포함된 PDF 파일에 대한 다운로드 링크가 있는 위 설문 조사입니다.

```html
<div data-analytics-asset-type="custom"
  data-analytics-asset-id="favorite-food-poll"
  data-analytics-asset-category="polls"
  data-analytics-asset-title="What is your favorite food Poll">

<a href="/poll-instructions.pdf" data-analytics-asset-action="download">Download the Poll Instructions </a>

<h1> What's your favorite food? </h1>
...
</div>
```
