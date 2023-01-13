# 데이터 공급자 개요

데이터 공급자는 Forms 애플리케이션에서 사용할 수 있는 데이터를 제공합니다. REST Data Provider는 Forms 애플리케이션에 포함되어 있습니다. 이를 통해 [REST 웹 서비스](https://en.wikipedia.org/wiki/Representational_state_transfer) 의 데이터를 사용하여 양식 필드를 자동으로 채울 수 있습니다.

* [REST 데이터 공급자를 사용하여 양식 옵션을 채웁니다.](./using-the-rest-data-provider-to-populate-form-options.md)
* [REST 데이터 공급자 및 자동 채우기 규칙으로 양식 필드를 자동으로 채웁니다.](../form-rules/using-the-autofill-rule.md)

한 가지 일반적인 예는 REST 데이터 공급자를 사용하여 목록에서 선택 필드의 옵션을 국가 목록으로 채우는 것입니다.

## 등록된 JSON 웹 서비스

일부 데이터 소스는 [restcountries.com](https://restcountries.com) 데이터 공급자와 같은 타사 소스에서 가져옵니다. Liferay DXP에는 자체 등록 웹 서비스도 있습니다. 로컬 서버를 실행 중인 경우 목록은 [http://localhost:8080/api/jsonws](http://localhost:8080/api/jsonws) 을 참조하십시오. 국가 목록을 채우는 경우 두 개의 `get-countries` JSON 웹 서비스를 찾을 수 있습니다. 어느 쪽이든 작동합니다. _Invoke_ 을 클릭하여 결과를 생성합니다.

```{warning}
로컬 테스트 환경에서 데이터 공급자와 함께 Liferay의 웹 서비스를 사용하여 테스트하려면 로컬 네트워크 액세스를 활성화해야 합니다. [로컬 네트워크의 데이터에 대한 액세스 활성화](./using-the-rest-data-provider-to-populate-form-options.md#enabling-access-to-data-on-the-local-network)를 참조하십시오. .
```

_결과_ 탭에는 아프가니스탄에 대한 이 레코드와 같이 JSON 구문을 사용하는 국가 목록이 표시됩니다.

```json
[
  {
    "a2": "AF",
    "a3": "AFG",
    "countryId": "20",
    "idd": "093",
    "mvccVersion": "0",
    "name": "afghanistan",
    "nameCurrentValue": "Afghanistan",
    "number": "4"
  },
    ...
```

웹 서비스에서 선택 가능한 필드를 선택합니다. `get-countries` 의 경우 `nameCurrentValue`일 가능성이 높습니다. 국가의 전체 이름을 적절하게 대문자로 표시하기 때문입니다.

URL 예제 탭에서 데이터 공급자를 생성할 때 사용할 URL을 찾습니다. `get-countries` JSON 웹 서비스에 접근하기 위해 생성된 것과 동일합니다. 사용자는 동일한 절차를 사용하여 등록된 JSON 웹 서비스의 URL을 찾을 수 있습니다.

![URL 예제 탭에는 해당 JSON 웹 서비스가 표시됩니다.](./data-providers-overview/images/02.png)

## 데이터 공급자 구성 참조

_사이트 관리_ &rarr; _콘텐츠 & 데이터_ &rarr; _양식_로 이동하여 양식 애플리케이션에서 데이터 공급자를 구성할 수 있습니다. _Data Provider_ 탭을 클릭한 다음 (![Add icon](../../../images/icon-add.png)) 아이콘을 클릭하여 시작합니다. 데이터 공급자를 구성할 때 작성해야 할 여러 필드가 있습니다.

![이 데이터 서비스는 국가를 반환합니다.](./data-providers-overview/images/03.png)

### URL

내부 또는 외부 REST 서비스 끝점의 URL을 입력합니다. 위의 예는 <https://restcountries.com/> 에 있는 REST 서비스를 보여줍니다. 여기에는 `지역`으로 국가를 찾는 엔드포인트가 포함되어 있습니다.

`https://restcountries.com/rest/v2/region/{region}`

데이터 공급자 URL은 경로 매개변수와 쿼리 매개변수의 두 가지 매개변수 유형을 사용할 수 있습니다.

경로 매개변수는 REST 웹 서비스를 호출하는 URL의 일부이며 `https://service-url.com/service/{path_parameter_name}`패턴을 사용하여 추가됩니다.

예를 들어 `restcountries.com` 서비스의 `지역` 엔드포인트의 경로 매개변수는 `{region}`입니다. 경로 매개변수는 URL의 필수 부분이므로 URL의 경로 매개변수와 일치하는 _매개변수_ 필드 값으로 입력(아래 참조)을 지정해야 합니다.

쿼리 매개변수는 `?query_parameter=query_parameter_value`패턴에 따라 서비스 호출의 출력을 필터링하는 URL의 보완적인 부분입니다.

    https://restcountries.com/rest/v2/all?fields=capital

경로 매개변수와 달리 쿼리 매개변수는 선택사항입니다.

### 사용자 이름과 비밀번호

필요한 경우 REST 웹 서비스에 인증하는 데 사용되는 자격 증명을 입력합니다.

### 첫 요청에 데이터를 캐시합니다

데이터가 캐시되면 REST 서비스 공급자에 대한 두 번째 호출이 필요하지 않으므로 선택 목록 필드의 두 번째 로드가 훨씬 빠릅니다.

### 타임아웃

요청을 중단하기 전에 REST 호출에 대한 응답을 기다리는 시간(밀리초)을 입력합니다.

### 입력

REST 서비스의 응답을 필터링하도록 REST 서비스의 경로 또는 쿼리 매개변수를 구성합니다. 레이블, 매개변수 및 유형(텍스트 또는 숫자)을 지정하고 데이터 공급자를 사용하는 데 입력이 필요한지 여부를 선택합니다.

### 출력

출력은 목록에서 선택 또는 자동 완성이 활성화된 텍스트 필드에 표시할 매개변수입니다. 여러 출력을 추가할 수 있습니다. 출력은 입력으로 필터링할 수 있지만(위 참조) 입력 필터링을 구성하지 않고 표시할 수도 있습니다. 레이블, 경로 및 유형(텍스트, 숫자 또는 목록)을 지정합니다.

여러 입력을 추가할 수 있습니다. 입력 값을 지정하는 방법을 제공하려면 [Autofill Form Rule](../form-rules/using-the-autofill-rule.md)을 사용하십시오. 사용자는 하나의 필드에 입력을 입력하고 해당 입력은 REST 서비스로 전송됩니다. REST 서비스의 응답 데이터는 입력 매개변수로 필터링됩니다.

출력 경로 필드는 [JsonPath 구문](https://github.com/json-path/JsonPath)로 지정되므로 항상 `$`로 시작해야 합니다. 경로에서 반환된 데이터 유형은 유형 필드에서 선택한 유형과 일치해야 합니다. `restcountries.com` 서비스를 사용하여 경로 필드에 enter `$..name` 를 입력하여 `이름` 필드를 출력으로 지정합니다. 구성할 더 복잡한 JsonPath 표현식이 있는 경우(예: 인구가 1억 명 이상인 모든 국가의 이름이 필요한 경우---`$..[?(@.population>100000000)].name` with the `restcountries.com` 서비스), [this one](http://jsonpath.herokuapp.com/) 또는 [this one](https://jsonpath.com/)과 같은 `JsonPath` 평가자를 사용하는 것이 좋습니다.

```{tip}
하나의 값을 표시하지만 데이터베이스에 다른 값을 유지하려면 둘 다 경로 필드에 세미콜론으로 구분하여 입력하십시오: `$..name;$..numericCode`
```

`restcountries.com` 데이터 공급자를 사용하는 경우 사용자에게 국가 이름이 표시되고 숫자 국가 코드는 데이터베이스에 저장됩니다.

## 무엇 향후 계획

* [REST 데이터 공급자를 사용하여 양식 옵션 채우기](./using-the-rest-data-provider-to-populate-form-options.md)
* [자동 채우기 규칙 사용](../form-rules/using-the-autofill-rule.md)
