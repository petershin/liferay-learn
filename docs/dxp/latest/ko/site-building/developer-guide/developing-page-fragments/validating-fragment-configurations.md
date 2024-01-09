# 조각 구성 검증

조각 [구성 옵션](./adding-configuration-options-to-fragments.md) 을 정의할 때 유효한 항목에 대한 규칙을 결정하는 `텍스트` 유형 필드에 `검증` 속성을 추가할 수 있습니다. 규칙 유형(`text`, `number`, `email`, `url` 또는 `pattern`)을 지정하여 각 필드가 허용하는 데이터 유형을 결정합니다. 또한 잘못된 항목을 사용자에게 알리기 위해 사용자 정의 오류 메시지를 추가할 수도 있습니다.

```{important}
이 문서에서 다루는 유효성 검사는 페이지 편집기 보기의 설정 패널에만 적용할 수 있는 조각 구성 필드의 유효성을 검사하기 위한 것입니다. 사용자 입력의 유효성을 검사하려면 [객체 유효성 검사](./../../../building-applications/objects/creating-and-managing-objects/validations.md) 또는 JavaScript 유효성 검사와 함께 양식 조각을 사용하세요.
```

## 텍스트 유효성 검사 규칙

다음 JSON 코드는 `text` 유형 필드에 대해 유효한 항목(즉, `minLength` 및 `maxLength`)에 사용되는 최소 및 최대 문자 수를 설정하기 위해 `text` 유효성 검사 규칙을 추가합니다.

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "label": "validate text length",
                    "name": "text1",
                    "type": "text",
                    "typeOptions": {
                      "validation": {
                        "errorMessage": "Enter a minimum of 10 characters. Entries cannot exceed 30 characters.",
                        "type": "text",
                        "minLength": 10,
                        "maxLength": 30
                      }
                    }
                }
            ]
        }
    ]
}
```

![Use text validation rules to set the minimum and maximum number of characters used in valid entries.](./adding-validation-rules/images/01.png)

## 번호 확인 규칙

다음 JSON 코드는 `text` 유형 필드에 대한 유효한 항목의 숫자 범위(예: `min` 및 `max`)를 정의하기 위해 `number` 유효성 검사 규칙을 추가합니다.

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "dataType": "int",
                    "label": "validate number",
                    "name": "text2",
                    "type": "text",
                    "typeOptions": {
                      "validation": {
                        "errorMessage": "Enter a number between 5 and 10.",
                        "type": "number",
                        "min": 5,
                        "max": 10
                      }
                    }
                }
            ]
        }
    ]
}
```

![Use number validation rules to define the numerical range of valid entries.](./adding-validation-rules/images/02.png)

## 이메일 확인 규칙

다음 JSON 코드는 이메일 구문을 요구하고 `text` 유형 필드에 대한 유효한 항목의 문자 길이(즉, `minLength` 및 `maxLength`)를 정의하기 위해 `email` 유효성 검사 규칙을 추가합니다.

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "label": "validate email",
                    "name": "text3",
                    "type": "text",
                    "typeOptions": {
                      "validation": {
                        "errorMessage": "Enter a valid email address.",
                        "type": "email",
                        "minLength": 1,
                        "maxLength": 30
                      }
                    }
                }
            ]
        }
    ]
}
```

![Use email validation rules to require email syntax and define the character length of valid entries.](./adding-validation-rules/images/03.png)

## URL 유효성 검사 규칙

다음 JSON 코드는 적절한 URL 프로토콜을 요구하고 `text` 유형 필드에 대한 유효한 URL의 문자 길이(즉, `minLength` 및 `maxLength`)를 정의하기 위해 `url` 유효성 검사 규칙을 추가합니다.

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "label": "validate url",
                    "name": "text4",
                    "type": "text",
                    "typeOptions": {
                      "validation": {
                        "errorMessage": "Enter a valid URL.",
                        "type": "url",
                        "minLength": 1,
                        "maxLength": 100
                      }
                    }
                }
            ]
        }
    ]
}
```

![Use url validation rules to require proper URL protocol and define the character length of valid URLs.](./adding-validation-rules/images/04.png)

## 패턴 검증 규칙

다음 JSON 코드는 유효한 항목을 정의하기 위해 정규 표현식을 사용하여 `텍스트` 유형 필드에 `패턴` 유효성 검사 규칙을 추가합니다.

```{note}
백슬래시를 사용하여 정규식 값(예: `\d`)의 문자를 이스케이프하는 경우 먼저 백슬래시(예: `\\d`)를 이스케이프하려면 `JSON` 파일 내에서 두 개의 백슬래시를 사용해야 합니다. JSON 문법에 대한 자세한 내용은 [IETF](https://www.ietf.org/rfc/rfc4627.txt) 설명서를 참조하세요.
```

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "label": "validate pattern",
                    "name": "text5",
                    "type": "text",
                    "typeOptions": {
                      "validation": {
                        "errorMessage": "Enter a valid 10 digit phone number.",
                        "type": "pattern",
                        "regexp": "([0-9]{3})[.\\-]?([0-9]{3})[.\\-]?([0-9]{4})"
                      }
                    }
                }
            ]
        }
    ]
}
```

![Use pattern validation rules using regex to define valid entries.](./adding-validation-rules/images/05.png)

## 관련 주제

* [조각 개발](./developing-fragments-intro.md)
* [조각 편집기 사용하기](./using-the-fragments-editor.md)
* [조각에 구성 옵션 추가](./adding-configuration-options-to-fragments.md)
