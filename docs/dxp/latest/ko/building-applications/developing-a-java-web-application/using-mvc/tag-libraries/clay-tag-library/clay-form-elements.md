# 점토 양식 요소

Liferay Clay 태그 라이브러리는 양식 요소를 생성하기 위한 여러 태그를 제공합니다. 각 태그의 예는 다음과 같습니다.

## 체크 박스

확인란은 사용자에게 참 또는 거짓 입력을 제공합니다.

```jsp  
<clay:checkbox 
        checked="<%= true %>" 
        hideLabel="<%= true %>" 
        label="My Input" 
        name="name" 
/>
```

속성:

**체크됨:** 체크박스 체크 여부

**비활성화:** 체크박스 활성화 여부

**hideLabel:** 체크박스 레이블 표시 여부

**불확실:** 다중 선택을 위한 체크박스 변수

**레이블:** 체크박스의 레이블

**name:** 체크박스의 이름

![Clay taglibs는 체크박스를 제공합니다.](./clay-form-elements/images/01.png)

## Radio

라디오 버튼을 사용하면 사용자가 양식의 옵션 집합에서 하나를 선택할 수 있습니다.

```jsp
<clay:radio 
        checked="<%= true %>" 
        hideLabel="<%= true %>" 
        label="My Input" 
        name="name" 
/>
```

속성:

**선택됨:** 라디오 버튼이 선택되었는지 여부

**hideLabel:** 라디오 버튼 레이블 표시 여부

**비활성화됨:** 라디오 버튼 활성화 여부

**레이블:** 라디오 버튼의 레이블

**name:** 라디오 버튼의 이름

![Clay taglibs는 라디오 버튼을 제공합니다.](./clay-form-elements/images/02.png)

## 선택자

선택기는 사용자에게 선택할 수 있는 일련의 옵션이 있는 선택 상자를 제공합니다.

아래의 Java scriplet은 선택기에 대한 8개의 더미 옵션을 생성합니다.

```java
<%
List<Map<String, Object>> options = new ArrayList<>();

for (int i = 0; i < 8; i++) {
    Map<String, Object> option = new HashMap<>();

    option.put("label", "Sample " + i);
    option.put("value", i);

    options.add(option);
}
%>
```

```jsp
<clay:select 
        label="Regular Select Element" 
        name="name" 
        options="<%= options %>" 
/>
```

![Clay taglibs는 선택 상자를 제공합니다.](./clay-form-elements/images/03.png)

사용자가 한 번에 여러 옵션을 선택할 수 있도록 하려면 `multiple`  속성을 `true`으로 설정합니다.

```jsp
<clay:select 
        label="Multiple Select Element" 
        multiple="<%= true %>" 
        name="name" 
        options="<%= options %>" 
/>
```

![사용자가 선택 메뉴에서 여러 옵션을 선택하도록 할 수 있습니다.](./clay-form-elements/images/04.png)

속성:

**disabled:** 선택기 사용 여부 **label:** 선택기 레이블 **multiple:** 여러 옵션을 선택할 수 있는지 여부 **name:** 선택기 이름

이제 Clay taglibs를 사용하여 앱에 공통 양식 요소를 추가하는 방법을 알았습니다!

## 관련 항목

* [클레이 버튼](./clay-buttons.md)
* [클레이 아이콘](./clay-icons.md)
* [점토 라벨 및 링크](./clay-links-and-labels.md)