# 조각 구성 사용에 대한 모범 사례

자신의 [구성](./adding-configuration-options-to-fragments.md)을 사용하여 사이트의 페이지 조각을 만들 때 HTML 프리젠테이션에서 이를 안전하고 효과적으로 사용하는 것은 귀하의 책임입니다. 다음은 조각을 보다 효과적이고 강력하게 만드는 데 사용할 수 있는 몇 가지 기술입니다.

* [이스케이프 구성 텍스트 값](#escape-configuration-text-values)
* [반복되는 HTML 요소에 목록 사용](#use-lists-for-repeated-html-elements)

## 이스케이프 구성 텍스트 값

악성 코드는 [텍스트 필드 구성](../reference/fragments/fragment-configuration-types-reference.md#text-configuration) 에 삽입되어 다른 프래그먼트 사용자에게 큰 피해를 줄 수 있습니다. XSS(교차 사이트 스크립팅) 공격으로부터 보호하려면 조각 텍스트 값을 이스케이프 처리해야 합니다.

일반적인 경우 HTML `escape()` 메서드를 사용할 수 있습니다. 자세한 내용은 [`HtmlUtil`](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/util/HtmlUtil.html) 클래스를 참조하십시오.

```html
<div class="fragment_38816">
    "${htmlUtil.escape(configuration.text)}"
</div>
```

속성 설정 또는 HTML 자식 추가와 같은 JavaScript 공격을 방지하려면 `Liferay.Util.escapeHTML()` 함수를 사용하십시오.

```javascript
function (fragmentElement, configuration) {
    const escapedValue = Liferay.Util.escapeHTML(configuration.text)
}
```

## 반복되는 HTML 요소에 목록 사용

FreeMarker 목록을 사용하여 프래그먼트에 대해 동일한 HTML 요소를 반복적으로 작성하지 마십시오. 구현한 구성 옵션의 값을 사용하여 목록의 논리를 구현할 수 있습니다.

예를 들어 구성에 정의된 여러 행을 반복한 다음(예: [이 예 선택 구성](../reference/fragments/fragment-configuration-types-reference.md#select-configuration) ) 다음 HTML을 사용하여 구성된 행 수를 나열할 수 있습니다.

```html
<div class="fragment_1">
    [#list 1..configuration.numberOfLines as index]
        <li>Line number: ${index}</li>
    [/#list]
</div>
```

[컬렉션 선택기 구성](../reference/fragments/fragment-configuration-types-reference.md#collection-selector) 을 구현한 경우 다음 예와 같이 구성된 컬렉션의 모든 제목을 나열할 수도 있습니다.

```html
<div class="fragment_310">
    <h1>
        List of Items:
    </h1>
    <ul>
        [#if collectionObjectList??]
            [#list collectionObjectList as item]
                <li>${item.title}</li>
            [/#list]
        [/#if]
    </ul>
</div>
```

자세한 내용은 [공식 FreeMarker 문서](https://freemarker.apache.org/docs/ref_directive_list.html) 를 참조하십시오.

## 추가 정보

* [조각에 구성 옵션 추가](./adding-configuration-options-to-fragments.md)
* [조각 구성 유형](../reference/fragments/fragment-configuration-types-reference.md)
