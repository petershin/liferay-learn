# 식 작성기 유효성 검사 참조

{bdg-secondary}`liferay 7.4 U67+/GA67+`

사용자 정의 개체를 사용하면 Liferay의 Expression Builder를 사용하여 필드 유효성 검사를 만들 수 있습니다. 이 도구는 사전 정의된 필드, 연산자 및 함수를 사용하여 복잡한 유효성 검사 규칙을 신속하게 정의할 수 있는 통합 편집기를 제공합니다. 조건 측면 패널에서 사용 가능한 요소를 찾아볼 수 있습니다.

```{important}
식 작성기 유효성 검사는 텍스트, 숫자, 날짜 및 부울 필드 유형에만 사용할 수 있습니다.
```

## 텍스트 필드

Liferay는 텍스트 및 긴 텍스트 필드에 대해 다음 연산자와 기능을 제공합니다. 이러한 필드 중 하나를 인수로 사용할 수 있습니다. 일부 요소의 경우 문자열 값을 추가하여 필드 값과 비교할 수도 있습니다(예: `"foo"`, `"[A-Za-z]{1,50}"`).

### 붙임

여러 문자열 또는 텍스트 필드를 결합하고 다른 유효성 검사 기능과 함께 사용할 수 있는 단일 문자열을 반환합니다.

```
concat([textField], "[string]")
```

### 조건(텍스트 포함)

사용자 입력이 하나 이상의 조건을 충족하는지 확인하고 부울 값을 반환합니다. 이 함수는 `if` 문처럼 작동합니다. 각 표현식에는 하나 이상의 '조건'(예: 'textFieldName == "foo"`)이 포함되어 있으며 'true' 또는 'false'를 반환합니다. 동일한 표현식에 여러 조건을 추가하고 조건 중 어느 것도 충족되지 않는 경우 반환 값을 결정할 수 있습니다(예: `textFieldName == "foo", textFieldName == "bar", true, false`).

```
condition([condition], [return-value])
```

### 포함(텍스트 포함)

텍스트 필드에 특정 문자열 값이 포함되어 있는지 확인하고 부울을 반환합니다. 필드에 값이 **포함되어 있지 않으면** `false`를 반환합니다.

```
contains([textField], "[string]")
```

### 포함하지 않음(텍스트 포함)

텍스트 필드에 특정 문자열 값이 포함되어 있지 않은지 확인하고 부울을 반환합니다. 필드에 값이 **포함되어 있으면** 'false'를 반환합니다.

```
NOT(contains([textField], "[string]"))
```

### URL 임

텍스트 필드가 URL인지 확인하고 부울을 반환합니다. 필드가 URL 패턴과 일치하지 않으면 `false`를 반환합니다. `true`를 반환하려면 항목이 표준 URL 요소(예: `http`, `://`, `.com`)를 사용해야 합니다.

```
isURL([textField])
```

### 이메일인가요?

텍스트 필드가 이메일인지 확인하고 부울을 반환합니다. 필드가 특정 이메일 또는 이메일 패턴과 일치하지 않으면 `false`를 반환합니다. 'true'를 반환하려면 항목이 표준 이메일 요소(예: `@gmail`, `.com`)를 사용해야 합니다.

```
isEmailAddress([textField])
```

### 빈 값임

텍스트 필드가 비어 있는지 확인하고 부울을 반환합니다.  필드가 비어 있지 않으면 'false'를 반환합니다.

```
isEmpty([textField])
```

### 같음(텍스트 포함)

텍스트 필드가 특정 문자열 값과 같은지 확인하고 부울을 반환합니다. **같지** 않으면 'false'를 반환합니다.

```
[textField] == "[string]"
```

### 다음과 같지 않음(텍스트 포함)

텍스트 필드가 특정 문자열 값과 다른지 확인하고 부울을 반환합니다. **같으면** 'false'를 반환합니다.

```
[textField] != "[string]"
```

### 성냥

텍스트 필드가 특정 문자열 값이나 RegEx 표현식과 일치하는지 확인하고 부울을 반환합니다. 필드가 값과 일치하지 않으면 'false'를 반환합니다.

```
match([textField], "[string]")

match([textField], "[regex]")
```

### 이전 값(텍스트 포함)

지정된 텍스트 필드의 이전 값을 검색합니다. 다른 함수 및 연산자와 함께 값을 사용할 수 있습니다.

```
oldValue([textFieldName])
```

## 숫자 필드

Liferay는 Integer, Long Integer, Decimal 및 Precision Decimal 필드에 대해 다음 연산자 및 함수를 제공합니다. 이러한 필드 중 하나를 인수로 사용할 수 있습니다. 일부 요소의 경우 숫자 값을 추가하여 필드 값(예: `123`, `3.1415`)과 비교할 수도 있습니다.

### 조건(숫자 포함)

사용자 입력이 하나 이상의 조건을 충족하는지 확인하고 부울 값을 반환합니다. 이 함수는 `if` 문처럼 작동합니다. 각 표현식에는 하나 이상의 '조건'(예: 'numericFieldName == 10')이 포함되어 있으며 'true' 또는 'false'를 반환합니다. 동일한 표현식에 여러 조건을 추가하고 조건 중 어느 것도 충족되지 않는 경우 반환 값을 결정할 수 있습니다(예: `numericFieldName == 10, NumericFieldName != 100, true, false`).

```
condition([condition], [return-value])
```

### 포함(숫자 포함)

숫자 필드에 특정 숫자 값이 포함되어 있는지 확인하고 부울을 반환합니다. 필드에 값이 **포함되어 있지 않으면** `false`를 반환합니다.

```
contains([numericField], [number])
```

### 포함하지 않음(숫자 포함)

숫자 필드에 특정 숫자 값이 포함되어 있는지 확인하고 부울을 반환합니다. 필드에 값이 **포함되어 있으면** 'false'를 반환합니다.

```
NOT(contains([numericField], [number]))
```

### 십진수임

숫자 필드가 소수인지 확인하고 부울을 반환합니다. 필드가 십진수가 **아닌** 경우 'false'를 반환합니다.

```
isDecimal([numericField])
```

### 정수임

숫자 필드가 정수인지 확인하고 부울을 반환합니다. 필드가 정수가 **아닌** 경우 'false'를 반환합니다.

```
isInteger([numericField])
```

### 같음(숫자 포함)

숫자 필드가 특정 숫자 값과 같은지 확인하고 부울을 반환합니다. **같지** 않으면 'false'를 반환합니다.

```
[numericField] == [number]
```

### 같지 않음(숫자 포함)

숫자 필드가 특정 숫자 값과 다른지 확인하고 부울을 반환합니다. **같으면** 'false'를 반환합니다.

```
[numericField] != [number]
```

### 다음보다 큼

숫자 필드가 특정 숫자 값보다 큰지 확인하고 부울을 반환합니다. 필드가 **더 크지** 않으면 'false'를 반환합니다.

```
[numericField] > [number]
```

### 다음보다 크거나 같음

숫자 필드가 특정 숫자 값보다 크거나 같은지 확인하고 부울을 반환합니다. 필드가 같거나 크지 **않으면** 'false'를 반환합니다.

```
[numericField] >= [number]
```

### 다음보다 작음

숫자 필드가 특정 숫자 값보다 작은지 확인하고 부울을 반환합니다. 필드가 **작지** 않으면 'false'를 반환합니다.

```
[numericField] < [number]
```

### 다음보다 작거나 같음

숫자 필드가 특정 숫자 값보다 작거나 같은지 확인하고 부울을 반환합니다. 필드가 같거나 작지 **않으면** 'false'를 반환합니다.

```
[numericField] <= [number]
```

### 이전 값(숫자 포함)

지정된 숫자 필드의 이전 값을 검색합니다. 다른 함수 및 연산자와 함께 값을 사용할 수 있습니다.

```
oldValue([numericField])
```

### 합집합

여러 숫자 필드를 함께 추가하고 다른 유효성 검사 기능과 함께 사용할 수 있는 단일 숫자를 반환합니다.

```
sum([numericField], [numericField])
```

## 날짜 필드

Liferay는 날짜 필드에 대해 다음 연산자와 기능을 제공합니다. 모든 날짜 필드를 인수 또는 매개변수로 사용할 수 있습니다. 또한 날짜 필드(예: `2020-03-19`)와 비교하기 위해 고정 날짜 값(`"yyyy-MM-dd"`)을 입력할 수 있습니다.

### 날짜 비교

날짜 필드의 값이 매개변수와 동일한지 확인합니다. 필드가 매개변수와 일치하지 않으면 'false'를 반환합니다.

```
compareDates([dateField], [parameter])
```

### 조건(날짜 포함)

사용자 입력이 하나 이상의 조건을 충족하는지 확인하고 부울 값을 반환합니다. 이 함수는 `if` 문처럼 작동합니다. 각 표현식에는 하나 이상의 '조건'(예: 'dateFieldName == 2020-01-01')이 포함되어 있으며 'true' 또는 'false'를 반환합니다. 동일한 표현식에 여러 조건을 추가하고 조건 중 어느 것도 충족되지 않는 경우 반환 값을 결정할 수 있습니다(예: `dateFieldName == 2020-01-01, dateFieldName != 2022-01-01, true, false`). <!--TASK: Update Example-->

```
condition([condition], [return-value])
```

### 미래 날짜

날짜 필드의 값이 설정된 매개변수와 같거나 그 이후인지 확인합니다. **아님** 인 경우, 함수는 `false`를 반환합니다.

```
futureDates([dateField], [parameter])
```

예를 들어,

```
futureDates(endDate, startDate)
```

```
futureDates(endDate, "2024-01-01")
```

첫 번째 예에서는 'endDate'가 'startDate' 값과 같거나 그 이후인지 확인합니다. 두 번째 예에서는 'endDate' 값이 '2024-01-01'과 같거나 그 이후인지 확인합니다.

### 이전 값(날짜 포함)

지정된 날짜 필드에 대한 이전 값을 검색합니다. 다른 함수 및 연산자와 함께 값을 사용할 수 있습니다.

```
oldValue([dateField])
```

### 지난 날짜

날짜 필드의 값이 설정된 매개변수와 같거나 이전인지 확인합니다. **아님** 인 경우, 함수는 'false'를 반환합니다.

```
pastDates([dateField], [parameter])
```

예를 들어,

```
pastDates(startDate, endDate)
```

```
pastDates(startDate, "2024-01-01")
```

첫 번째 예에서는 `startDate`가 `endDate` 값과 같거나 이전인지 확인합니다. 두 번째는 `startDate` 값이 `2024-01-01`과 같거나 이전인지 확인합니다.

### 범위

날짜 필드 값이 과거 날짜로 시작하고 미래 날짜로 끝나는지 확인합니다. 날짜가 범위 내에 **없으면** 'false'를 반환합니다.

```
futureDates([dateField], [parameter])
AND
pastDates([dateField], [parameter])
```

예를 들어,

```
futureDates(endDate, startDate)
AND
pastDates(startDate, endDate)
```

이는 `endDate` 값이 `startDate` 값과 같은지/이후인지, 그리고 `startDate` 값이 `endDate` 값과 같거나 이전인지 여부를 확인합니다.

## 수학 연산자

숫자 필드에는 다음 수학 연산자 중 하나를 사용할 수 있습니다.

### 플러스( `+` )

표현식을 생성하기 위해 숫자 필드를 추가합니다.

```
[numericField] + [numericField]
```

### 빼기( `-` )

숫자 필드를 서로 빼서 표현식을 만듭니다.

```
[numericField] * [numericField]
```

### 나누기 ( `/` )

하나의 숫자 필드를 다른 숫자 필드로 나누어 표현식을 만듭니다.

```
[numericField] / [numericField]
```

### 곱하기( `*` )

숫자 필드를 곱하여 표현식을 만듭니다.

```
[numericField] * [numericField]
```

## 논리 연산자

논리 연산자는 여러 요소와 함께 사용되어 여러 요소의 복잡한 조건을 집계합니다. 현재 Expression Builder 유효성 검사에서는 'AND' 및 'OR' 연산자를 제공합니다.

- `AND`: 종속 관계를 나타냅니다.

- `OR`: 독립적인 관계를 나타냅니다.

다음 예에서 `AND` 절은 서로 종속되어 있으므로 함께 사용해야 합니다. 대조적으로 'OR' 절은 논리적으로 분리되어 있으며 서로 종속되지 않습니다.

```
match([phoneNumberField], "^([1-9]{2}) (?:[2-8]|9[1-9])[0-9]{3}-[0-9]{4}$")
AND match([nameField], "[A-Za-z]{1,50}")
AND match([addressField], "[A-Za-z]{1,50}")
OR [numericField] == 1
OR match([lastNameField], "[A-Za-z]{1,50}")
```

## 검증 예

다음 검증은 일반적인 예입니다. 이를 사용하려면 'fieldName'을 유효성을 검사할 필드 이름으로 바꾸세요.

### 이름 확인(텍스트 포함)

값을 영문자로 제한하고 허용되는 문자 수를 제한합니다.

```
match(fieldName, "[A-Za-z]{1,50}")
```

성에 숫자를 허용합니다.

```
match(fieldName, "[A-Za-z][0-9]{1,50}")
```

### 비밀번호(텍스트 포함)

항목이 다음 비밀번호 기준을 충족하는지 확인합니다.

* 8자 이상
* 최소 5명의 고유 문자
* 기호 1개 이상
* 숫자 1개 이상
* 공백은 허용되지 않습니다.

```
match(fieldName, "^(?=.*[A-Za-z])(?=.*d)(?=.*[@$!%*#?&])[A-Za-zd@$!%*#?&]{8,}$")
```

### 휴대폰 번호(숫자 포함)

항목이 전화번호 패턴과 일치하는지 확인합니다. 항목을 숫자로 제한하고 문자 수를 제한하며 표준 전화번호 패턴을 설정합니다.

```
match(fieldName, "^([1-9]{2}) (?:[2-8]|9[1-9])[0-9]{3}-[0-9]{4}$")
```

### 우편번호(숫자 포함)

항목이 우편번호 패턴과 일치하는지 확인합니다. 항목을 숫자로 제한하고 문자 수를 제한하며 표준 우편 번호 패턴을 설정합니다.

```
match(fieldName, "^([1-9]{2}) (?:[2-8]|9[1-9])[0-9]{3}-[0-9]{4}$")
```

### 연령 범위(날짜) 지정

항목이 18-65 사이인지 확인합니다.

```
pastDates(fieldName, startsFrom, responseDate, years, -120, endsOn, responseDate, years, -18)
AND
futureDates(fieldName, startsFrom, responseDate, years, 0, endsOn, responseDate, years, 65)
```

## 관련 주제

* [객체 생성](../creating-objects.md)
* [개체에 필드 추가](../fields/adding-fields-to-objects.md)
* [필드 유효성 검사 추가](../validations/adding-field-validations.md)
