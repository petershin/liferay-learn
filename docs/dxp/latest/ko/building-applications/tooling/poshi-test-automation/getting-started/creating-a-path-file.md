---
uuid: 7674a634-411c-4e00-99ea-0eaa927bc2cc
---

# 경로 파일 생성

## 테스트 시나리오

아래 테스트 시나리오를 사용하여 첫 번째 경로 파일을 작성합니다.

  귀하의 이름이 learn.liferay.com 기사에 나타나지 않는지 테스트하고 싶습니다. 취할 조치는 다음과 같습니다. 단계를 테스트하려면 별도의 브라우저에서 수동으로 수행하십시오.

  1. [Liferay Learn 사이트](http://learn.liferay.com)로 이동합니다.

  1. 검색 입력 필드를 클릭합니다.

  1. 검색어로 이름을 입력하십시오.

  1. Enter 키를 눌러 검색어를 입력합니다.

  1. 검색 결과가 없다고 주장하십시오. 귀하의 이름을 검색하면 결과가 반환되면 다른 이름을 선택하십시오.

  1. 사용 가능한 기사가 없다는 메시지가 표시되는지 확인하십시오.

## 로케이터 수집

주어진 테스트 시나리오에서 테스트가 상호 작용해야 하는 요소를 수집합니다.

1. Liferay Learn 사이트의 URL이 필요합니다: `http://learn.liferay.com`.

1. 브라우저의 웹 개발자 콘솔(F12, DOM 표시)을 엽니다. 콘솔에는 검색 표시줄을 검사하여 로케이터를 가져올 수 있는 화살표가 있는 아이콘이 있습니다. 이것을 셀렉터라고 합니다.

1. 선택기 아이콘을 사용하여 검색 표시줄을 클릭하고 DOM의 강조 표시된 부분에서 로케이터를 결정합니다. 이 경우 `//input[@placeholder="Search..."]`사용합니다.

1. 이름을 검색하여 검색 결과 페이지로 이동합니다.

1. 다시 Web Developer Console의 선택기 아이콘을 사용하여 "결과 없음" 메시지를 클릭하고 경로를 결정합니다. 이 경우 `//h4[contains(.,'No results were found.)]`사용합니다.

1. 추가된 어설션의 경우 결과가 확실히 있는 용어를 검색합니다(예: "Staging" 용어 검색). 검색 결과가 표시되면 선택기 아이콘을 사용하여 결과 중 하나의 경로를 가져옵니다. 이 경우 `//ul[@class='search']//a[contains(.,'Staging')]`사용합니다. '스테이징'이라는 용어는 이 검색 결과에만 적용되며 다른 시나리오에서 사용할 수 없도록 경로를 유연하게 만듭니다. 이 경로를 재사용 가능하게 만들려면 테스트 사례에서 전달될 수 있는 변수를 사용하세요: `//ul[@class='search']//a[contains(.,'${key_searchTerm}')]`. 자세한 내용은 [변수](../poshi-basics/poshi-layers/variables.md) 사용을 참조하십시오.

## 경로 파일 만들기

1. `poshi-standalone/poshi-tests/paths` 디렉토리에 있는 빈 파일로 시작하고 이름을 `LiferayLearn.path`으로 지정합니다.

1. html 태그를 추가하여 테이블을 만들고 파일 이름을 제목과 테이블 헤더로 추가합니다.

1. 아래 예와 같이 로케이터의 이름을 지정하고 각 행에 xpath를 추가합니다.

```
<html>
<head>
<title>LiferayLearn</title>
</head>

<body>
<table border="1" cellpadding="1" cellspacing="1">
<thead>
<tr><td rowspan="1" colspan="3">LiferayLearn</td></tr>
</thead>

<tbody>
<tr>
    <td>NO_RESULTS_MESSAGE</td>
    <td>//h4[@id="noResultsMessage"]</td>
    <td></td>
</tr>
<tr>
    <td>SEARCH_BAR</td>
    <td>//input[@id="docsSearch"]</td>
    <td></td>
</tr>
<tr>
    <td>SEARCH_RESULTS</td>
    <td>//ul[@class='search']//a[contains(.,'${key_searchTerm}')]</td>
    <td></td>
</tr>
</tbody>

</table>
</body>
</html>
```
