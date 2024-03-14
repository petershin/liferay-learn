# Frontend 토큰 정의

> 사용 가능: Liferay DXP/Portal 7.3+

Style Book에는 테마별로 정의된 다양한 범주로 그룹화된 옵션이 있습니다. 각 옵션은 **토큰** 로 정의됩니다. 테마에 대해 정의된 모든 토큰의 컬렉션은 **토큰 정의** 입니다.

사이트의 페이지에 테마를 할당하면 해당 테마에 포함된 토큰 정의가 사이트에 대한 Style Book을 만들 때 사용됩니다.

## Style Book에 대한 토큰 정의

토큰 정의는 테마에 연결되어 있으므로 토큰 정의는 테마 모듈에 포함된 CSS 변수에 해당해야 합니다. `frontend-token-definition.json`테마 모듈의 `src/WEB-INF/` 폴더에 있는 `.json` 파일에 토큰 정의 자체를 지정합니다.

### 토큰 카테고리

Style Book 구성 옵션을 정의하는 토큰은 범주로 그룹화됩니다. 각 범주는 Style Book을 편집할 때 드롭다운 메뉴의 옵션 중 하나로 나타납니다.

![드롭다운 메뉴의 각 옵션은 하나의 Style Book 토큰 범주에 해당합니다.](./frontend-token-definitions/images/01.png)

`src/WEB-INF/`에 있는 테마의 `frontend-token-definition.json` 파일에 있는 `frontendTokenCategories` 필드 내에서 이러한 각 범주를 정의합니다.

```json
{
    "frontendTokenCategories": [
        {
            "frontendTokenSets": [],
            "label": "buttons",
            "name": "buttons"
        }
    ]
}
```

각 토큰 범주에 대해 `레이블` 및 `이름` 정의합니다. `레이블` 값은 언어 키로 해석되어 해당 범주의 드롭다운 메뉴에 옵션으로 표시됩니다. <!-- Add link to article explaining localization when it is available. -->

### 토큰 세트

각 범주는 토큰 세트로 추가 구성됩니다. 토큰 세트는 Style Book을 편집할 때 나타나는 접을 수 있는 옵션 그룹에 해당합니다.

예를 들어 기본 클래식 테마를 사용하면 **버튼 기본** 토큰 세트(**버튼** 범주 내)에는 표준 버튼 색상 옵션에 대한 모든 토큰이 포함됩니다.

![버튼 기본 토큰 세트에는 클래식 테마의 기본 버튼에 대한 사용자 지정 가능한 모든 색상이 포함되어 있습니다.](./frontend-token-definitions/images/02.png)

범주의 `frontendTokenSets` 필드 내에서 각 토큰 세트를 정의합니다.

```json
{
    "frontendTokenCategories": [
        {
            "frontendTokenSets": [
                {
                    "frontendTokens": [],
                    "label": "primary-buttons",
                    "name": "primaryButtons"
                }
            ],
            "label": "buttons",
            "name": "buttons"
        }
    ]
}
```

각 카테고리와 마찬가지로 각 토큰 세트에 대해 `레이블` 및 `이름` 정의합니다.

### 토큰 정의

마지막으로 각 토큰 집합의 모든 토큰에는 각 옵션을 구성하기 위한 속성이 포함되어 있습니다.

각 토큰 세트의 `frontendTokens` 필드 내에서 모든 토큰을 정의하십시오. 다음은 토큰에 사용할 수 있는 모든 속성 목록입니다.

`defaultValue`: 옵션에 대해 표시되는 기본값입니다. 이 필드는 CSS에서 사용되는 기본값과 일치해야 합니다.

`editorType`: 필드에 색상 선택기 편집기를 사용하려면 이 필드를 사용하십시오. 유일하게 지원되는 값은 `"ColorPicker"`입니다. 값을 설정하지 않으면 텍스트 입력이 사용됩니다. 선택 입력이 필요한 경우 대신 `validValues` 속성을 사용합니다(두 속성을 함께 사용할 수 없음).

`mappings`: 토큰 정의 이름과 해당 CSS 변수 이름 간의 매핑입니다(중첩 필드로 `type` 및 `value`를 포함해야 함). `"cssVariable"`을 `type`으로 사용하고 `value`를 CSS 변수 이름으로 정의합니다.

`레이블`: Style Book을 편집할 때 옵션에 표시되는 언어 키입니다.

`name`: 토큰의 이름.

`유형`: 토큰이 표시하는 데이터의 유형. `"Integer"`, `"Float"`또는 `"String"` 사용하여 해당 유형의 값을 포함하는 텍스트 필드를 표시합니다. `"부울"` 사용하여 확인란을 표시합니다. `"길이"` 사용하여 픽셀, 전각 또는 백분율과 같은 사용자 정의 가능한 측정 단위를 제공하십시오.

`validValues`: UI에서 사용자가 사용할 수 있는 옵션을 나열하는 선택적 속성입니다. 이 필드는 `레이블` 및 `값` 쌍의 중첩된 목록을 포함해야 합니다(`값` 는 CSS에서 필드 값임). 이 속성은 `editorType`과 함께 사용할 수 없습니다. `에 대한 값을 정의합니다. validValues` 은 입력 유형을 자동으로 선택 입력으로 만듭니다.

다음은 토큰 세트 내의 토큰 목록의 예입니다.

```json
"frontendTokens": [
    {
        "defaultValue": "#0B5FFF",
        "editorType": "ColorPicker",
        "label": "primary",
        "mappings": [
            {
                "type": "cssVariable",
                "value": "primary"
            }
        ],
        "name": "primaryColor",
        "type": "String"
    },
    {
        "defaultValue": "sans-serif",
        "label": "font-family",
        "mappings": [
            {
                "type": "cssVariable",
                "value": "fontFamily"
            }
        ],
        "name": "fontFamily",
        "type": "String",
        "validValues": [
            {
                "label": "sans-serif",
                "value": "sans-serif"
            },
            {
                "label": "monospace",
                "value": "Courier New"
            }
        ]
    }
]
```

## Style Book 토큰에 CSS 변수 일치

토큰 정의를 포함하는 `frontend-token-definition.json` 파일은 테마 모듈 폴더의 `src/WEB-INF/` 폴더에 있어야 합니다. 토큰 정의에 정의된 모든 토큰은 테마의 CSS에서 스타일(색상, 간격, 글꼴 등)을 나타내야 합니다.

토큰이 나타내는 모든 스타일은 CSS 변수로 코딩되어야 합니다. 예를 들어 다음과 같은 토큰 정의를 사용합니다(글꼴을 구성하는 옵션 제공).

```json
{
    "defaultValue": "sans-serif",
    "label": "font-family-base",
    "mappings": [
        {
            "type": "cssVariable",
            "value": "font-family-base"
        }
    ],
    "name": "fontFamilyBase",
    "type": "String"
}
```

이 토큰은 다음과 같이 CSS의 스타일을 나타낼 수 있습니다.

```css
:root {
    --font-family-base: 'sans-serif'
}

body {
    font-family: var(--font-family-base);
}
```

토큰 정의의 `매핑` (`font-family-base`)의 값은 CSS의 변수 이름과 일치합니다. CSS 변수 이름 앞에 두 개의 하이픈을 사용하십시오(이 예에서는 `--font-family-base`).

```{important}
`defaultValue` 값이 토큰 정의에 포함된 경우 일치하는 CSS 변수 정의에 정의된 기본값과 일치해야 합니다.
```

## 관련 주제

* [Style Book을 사용하여 현장 모양 표준화](../using-a-style-book-to-standardize-site-appearance.md)
<!-- Add link to token definition tutorial when available -->
