# 조각에 구성 옵션 추가

> 사용 가능: Liferay DXP 7.2 SP1+

구성 가능한 옵션을 사용하면 조각을 유연하게 만들 수 있으므로 유사한 조각을 많이 유지 관리할 필요가 없습니다. 예를 들어, 스타일 A의 제목이 있는 조각과 스타일 B의 제목이 있는 조각이 있는 대신, 스타일 A와 B에 대한 옵션을 사용하여 제목에 대해 구성 가능한 스타일을 가진 하나의 조각을 만들 수 있습니다. 여기서는 조각에 구성 옵션을 추가하는 방법에 대해 알아봅니다:

* [구성 가능한 조각 배포](#deploy-a-configurable-fragment)
* [구성 검토](#examine-the-configuration)
* [구성 수정](#modify-the-configuration)
* [변경 사항 전파 및 테스트](#propagate-the-changes-and-test)
* [관련 정보](#related-information)

```{note}
Liferay DXP 7.4+의 경우, 조각 컬렉션은 Liferay UI에서 조각 세트라고 합니다.
```

## 구성 가능한 조각 배포

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계에 따라 예제를 배포하여 조각 구성 옵션이 작동하는 방식을 확인하세요.

1. [예제 조각 세트](https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-c7f8.zip) 를 다운로드하고 압축을 풉니다. :

    ```bash
    curl https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-c7f8.zip -O
    ```

    ```bash
    unzip liferay-c7f8.zip
    ```

1. 조각 툴킷을 설정합니다:

    ```bash
    cd liferay-c7f8
    ```

    ```bash
    ./setup_tutorial.sh 
    ```

1. 조각 툴킷을 사용하여 조각 컬렉션을 Docker 컨테이너로 가져옵니다. 또는 [조각을 수동으로 가져올 수 있습니다](../../creating-pages/page-fragments-and-widgets/using-fragments/managing-fragments.md).

    ```bash
    yarn run import

    > yo liferay-fragments:import

    ? Liferay host & port http://localhost:8080
    ? Username test@liferay.com
    ? Password [hidden]
    Checking connection...
    Connection successful

    ? Company ID liferay.com
    ? Group ID Liferay
    Building project...
    Importing project...
    ✔ Fragment C7F8 Card imported
    Project imported
    ```

1. 조각 세트가 사용 가능한지 확인합니다. **사이트 메뉴**(![Site Menu](../../../images/icon-product-menu.png))를 열고 **디자인** &rarr; **조각** 으로 이동합니다. 세트가 목록에 나타나야 합니다.

    ![세트를 사용할 수 있는지 확인합니다.](./adding-configuration-options-to-fragments/images/01.png)

    ```{note}
    Liferay DXP 7.1 및 7.2의 경우, 대신 제품 메뉴에서 *사이트* → *사이트 빌더* → *페이지 조각*으로 이동하여 조각 페이지로 이동합니다.
    ```

1. 콘텐츠 페이지로 이동하여 **수정** 아이콘(![Edit icon](../../../images/icon-edit-pencil.png))을 클릭하여 수정을 시작합니다.

1. [조각 및 위젯 패널](../../creating-pages/using-content-pages/content-page-editor-ui-reference.md#fragments-and-widgets) 에서 **C7F8 세트** 제목을 확장하고 **C7F8 카드** 조각을 페이지로 드래그합니다.

1. 페이지에서 **C7F8 카드** 를 선택하여 프래그먼트 구성 메뉴를 엽니다. **일반** 탭에서 컴포넌트의 텍스트 스타일을 어둡거나 밝게 설정합니다.

   ![구성 가능한 조각은 조각의 모양과 느낌을 수정할 수 있는 옵션을 제공합니다.](./adding-configuration-options-to-fragments/images/02.png)

좋아요! 구성 가능한 조각을 성공적으로 가져와 구성했습니다.

## 구성 검토

Liferay에 내장된 [조각 편집기](./using-the-fragments-editor.md) 또는 텍스트 파일에서 조각의 구성 옵션을 편집할 수 있습니다.

**조각 편집기 사용:** UI에서 [조각 편집기](./using-the-fragments-editor.md) 를 사용하여 조각을 편집하고 **구성** 탭을 클릭합니다. 조각의 구성이 편집기에 나타납니다.

**조각 구성 파일 편집:** 조각 파일이 없는 경우 조각의 작업 메뉴를 열고 **내보내기** 를 클릭하여 조각에서 조각 파일을 내보내세요. 조각의 `fragment.json` 파일에 있는 `configurationPath` 필드(선택 사항)는 구성 `.json` 파일을 지정합니다. 구성 파일이 없는 경우 구성 파일을 생성하고 `configurationPath` 필드를 구성 파일 이름으로 설정합니다.

예제의 `fragment.json` 파일을 열어 조각의 구성 파일을 확인합니다.

```json
{
    "configurationPath": "index.json",
    "cssPath": "index.css",
    "htmlPath": "index.html",
    "jsPath": "index.js",
    "name": "C7F8 Card",
    "type": "component"
}
```

`"configurationPath": "index.json"` 속성은 이 프래그먼트의 구성 파일이 `index.json`임을 나타냅니다.

구성 파일을 엽니다.

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "dataType": "string",
                    "defaultValue": "dark",
                    "label": "Text Style",
                    "name": "c7f8TextStyle",
                    "type": "select",
                    "typeOptions": {
                        "validValues": [
                            {
                                "value": "dark"
                            },
                            {
                                "value": "light"
                            }
                        ]
                    }
                }
            ],
            "label": "C7F8"
        }
    ]
}
```

위의 구성 파일은 **어두운** 또는 **밝은** 텍스트 스타일을 조각에 적용하기 위한 선택기를 지정합니다. 구성에는 `c7f8TextStyle`이라는 필드가 있습니다. 필드의 `유형` 은 `select`으로, 선택기 구성 요소가 됩니다. 자세한 내용은 [조각 구성 유형](../reference/fragments/fragment-configuration-types-reference.md) 을 참조하세요. 선택기의 유효한 값은 `dark` 또는 `light`입니다. `"데이터 유형": "문자열"` 속성은 선택기가 문자열 데이터에서 작동한다는 것을 의미합니다.

이 선택기는 **C7F8** 레이블이 지정된 필드 집합의 일부입니다(레이블은 선택 사항). UI에서 이 선택기는 **C7F8** 이라는 레이블이 붙은 조각의 구성 섹션에 있습니다. 선택기는 필드의 `레이블` 속성에 따라 `텍스트 스타일` 레이블이 지정됩니다. 아래 그림은 선택기를 보여줍니다.

![다음은 C7F8 카드 조각에 대한 선택기입니다.](./adding-configuration-options-to-fragments/images/03.png)

```{warning}
조각 편집기는 구성이 유효할 때까지 구성을 저장하지 않습니다. 미리 보기 전에 JSON 구성이 유효한지 확인하세요.
```

사용자가 선택한 구성 값은 FreeMarker 컨텍스트를 통해 HTML에서 사용할 수 있습니다. HTML에서는 `${configuration.fieldName}`라는 표기법으로 참조됩니다. 예제(`${configuration.textAppliedStyle}`)는 사용자가 선택한 구성 값에 따라 `dark` 또는 `light` 를 반환하며, CSS 클래스를 `text-light` 또는 `text-dark`로 설정합니다:

```html
<div class="component-c7f8-card">
    <div class="card">
        <img
            class="card-img-top"
            data-lfr-editable-id="01-image"
            data-lfr-editable-type="image"
            src="https://clayui.com/images/home/lexicon_symbol.svg"
        />

        <div class="card-body">
            <h5
                class="card-title text-${configuration.c7f8TextStyle}"
                data-lfr-editable-id="02-title"
                data-lfr-editable-type="rich-text"
            >
                Editable Card Title
            </h5>

            <p
                class="card-text text-${configuration.c7f8TextStyle}"
                data-lfr-editable-id="03-text"
                data-lfr-editable-type="rich-text"
            >
                Here is some editable text.
            </p>

            <a
                class="btn btn-primary"
                data-lfr-editable-id="04-label"
                data-lfr-editable-type="link"
                href="#"
            >
                Editable Link
            </a>
        </div>
    </div>
</div>
```

이 예는 선택 구성을 보여줍니다. 사용 가능한 조각 구성 유형의 전체 목록은 [구성 유형 참조](../reference/fragments/fragment-configuration-types-reference.md) 를 참조하세요.

## 구성 수정

이제 구성이 어떻게 작동하는지 알았으니 이제 구성을 수정할 수 있습니다.

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png)) 및 **디자인** &rarr; **조각** 으로 이동합니다.

    ```{note}
    Liferay DXP 7.1 및 7.2의 경우, 대신 제품 메뉴에서 *사이트* → *사이트 빌더* → *페이지 조각*으로 이동하여 조각 페이지로 이동합니다.
    ```

1. **C7F8 세트** 를 선택하고 C7F8 카드에 대한 **작업** 버튼(![Actions Icon](../../../images/icon-actions.png))을 클릭한 다음 **편집** 을 선택합니다. 그러면 조각 편집기가 열립니다.

1. **구성** 탭을 클릭하고 확인란 필드를 사용하여 카드 설명을 숨기거나 표시하는 구성을 업데이트합니다. `c7f8TextStyle` 필드의 닫는 중괄호와 쉼표(`},`) 뒤에 새 줄에 이 코드를 삽입합니다.

    ```json
    {
        "name": "showDescription",
        "label": "Show Description",
        "description": "show-description",
        "type": "checkbox",
        "defaultValue": true
    }
    ```

    ```{tip}
    필드 집합에 `configurationRole` 값을 추가하여(JSON의 `fields` 객체와 함께) 연결된 필드가 표시되는 탭을 지정할 수 있습니다. 값을 '스타일'로 설정하여 필드가 스타일 탭에 표시되도록 하거나 '고급'으로 설정하여 고급 탭에 표시되도록 합니다(*라이프 레이 DXP 버전 U23+ 또는 GA23+*에서만 해당). 구성 역할`이 설정되어 있지 않으면 기본적으로 일반 탭에 표시됩니다.
    ```

1. **코드** 탭의 **HTML** 창으로 돌아가서 단락 요소를 조건문으로 감싸서 확인란의 값을 확인합니다. **게시** 를 클릭하여 변경 사항을 적용합니다.

    ```html
    [#if configuration.showDescription]
      <p data-lfr-editable-id="03-card-text" data-lfr-editable-type="rich-text" 
      class="card-text text-${configuration.textAppliedStyle}">
        Here is some editable text.
      </p>
    [/#if]
    ```

```{note}
또한 자바스크립트에서 `const configurationValue = configuration.textAppliedStyle;` 구문을 사용하여 설정 값에 액세스할 수도 있습니다.
```

## 변경 사항 전파 및 테스트

이제 업데이트를 테스트할 수 있습니다.

1. 변경 사항이 콘텐츠 페이지에 반영되도록 전파합니다. C7F8 카드에 대해 **작업**(![Action Icon](../../../images/icon-actions.png))을 클릭하고 **사용량 보기** 를 선택합니다.

1. 콘텐츠 페이지의 확인란을 선택하고 (![propagate button](../../../images/icon-propagate.png)) 버튼을 클릭합니다.

    ![구성 가능한 조각은 조각의 모양과 느낌을 수정할 수 있는 옵션을 제공합니다.](./adding-configuration-options-to-fragments/images/04.png)

1. 콘텐츠 페이지로 돌아가서 (![Edit icon](../../../images/icon-edit-pencil.png)) 아이콘을 다시 한 번 클릭하여 콘텐츠 페이지를 수정합니다.

1. **C7F8 카드** 를 다시 선택하면 오른쪽에 선택 패널이 표시됩니다.

1. **일반** 탭에서 **설명 표시** 확인란을 선택/선택 취소하여 카드의 텍스트를 표시하거나 숨깁니다.

    ![조각에 대해 원하는 만큼 많은 구성 옵션을 가질 수 있습니다.](./adding-configuration-options-to-fragments/images/05.png)

좋아요! 이제 조각에 구성 옵션을 추가하는 방법을 알았습니다. 더 많은 구성 예제는 [조각 구성 유형](../reference/fragments/fragment-configuration-types-reference.md)을 참조하시기 바랍니다.

## 관련 정보

* [조각 자동 배포](./auto-deploying-fragments.md)
* [조각 구성 사용 모범 사례](./best-practices-for-using-fragment-configurations.md)
* [조각에 기본 리소스 포함](./including-default-resources-with-fragments.md)
* [조각 구성 유형 참조](../reference/fragments/fragment-configuration-types-reference.md)
