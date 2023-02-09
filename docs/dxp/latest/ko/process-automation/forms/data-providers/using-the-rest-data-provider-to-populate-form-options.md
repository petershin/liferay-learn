# REST 데이터 공급자를 사용하여 양식 옵션 채우기

_목록_ 에서 선택 필드는 많은 옵션을 보유할 수 있습니다. 이러한 옵션은 Liferay DXP 또는 기타 타사 REST 웹 서비스에 등록된 JSON 웹 서비스를 사용하여 자동으로 제공될 수 있습니다. 일반적으로 데이터 공급자에 대해 자세히 알아보려면 [데이터 공급자 개요](./data-providers-overview.md)을 참조하십시오. REST 데이터 공급자를 양식에 적용하기 위해 JSON 웹 서비스를 호출하고 데이터 공급자를 구성하여 양식에서 데이터 공급자를 사용하는 방법을 배웁니다.

## 전제 조건

일반적인 요구 사항은 선택 필드를 옵션 목록으로 채우는 것입니다. 예를 들어 양식에서 개인 정보를 수집할 때 사용자의 국가가 필요합니다.

1. **국가**라는 단일 선택 필드를 포함하는 [양식 만들기](../creating-and-managing-forms/creating-forms.md).
   
2. 다음으로 `get-countries` JSON 웹 서비스를 사용합니다(두 개가 있습니다---둘 중 하나 사용).

   * Liferay를 로컬에서 실행 중인 경우 <http://localhost:8080/api/jsonws>로 이동합니다.
   * "get-countries"를 검색합니다.
     
     ![get-countries 웹 서비스를 검색합니다.](./using-the-rest-data-provider-to-populate-form-options/images/02.png)

   * _호출_을 클릭합니다.

이제 국가 목록을 사용할 준비가 되었습니다.

### 로컬 네트워크의 데이터에 대한 액세스 활성화

기본적으로 사용자는 로컬 네트워크에서 URL을 사용하도록 데이터 공급자를 구성할 수 없습니다. 이것은 프로덕션 환경의 보안을 위한 좋은 기본값이지만 테스트를 더 어렵게 만듭니다.

데이터 공급자의 로컬 네트워크 액세스를 활성화하려면:

1. _제어판_ &rarr; _구성_ &rarr; _시스템 설정_으로 이동합니다.
1. _데이터 공급자_ (콘텐츠 & 데이터 아래)을 클릭합니다.
1. _액세스 로컬 네트워크_ 확인란을 선택합니다.
   
   ![로컬 네트워크에 대한 액세스 권한을 부여합니다.](./using-the-rest-data-provider-to-populate-form-options/images/01.png)

1. 완료되면 _저장_ 을 클릭합니다.

## 기본 REST 데이터 공급자 추가

_Countries of the World_ 데이터 공급자를 추가하려면:

1. _제품 메뉴_ (![Product Menu](../../../images/icon-product-menu.png))을 연 다음 _사이트 관리_ 메뉴에서 나침반 아이콘(![Compass](../../../images/icon-compass.png))을 클릭합니다.
1. 양식을 만들 사이트를 선택합니다.
1. _콘텐츠 & 데이터_ &rarr; _양식_를 클릭합니다.
1. _데이터 공급자_ 탭을 클릭합니다.
   
   ![데이터 공급자 탭으로 이동합니다.](./using-the-rest-data-provider-to-populate-form-options/images/03.png)

1. 추가 버튼(![Add](../../../images/icon-add.png))을 클릭하고 REST 데이터 공급자를 추가합니다.

1. 이 데이터를 입력하십시오:

    * **이름**: 세계 각국
    * **URL**: `http://localhost:8080/api/jsonws/country/get-countries/`
    * **사용자 이름**: `adminuser@liferay.com`
    * **비밀번호**: adminuserpass
    * **타임아웃**: 1000
    * **라벨 출력**: 국가명
    * **출력 경로**: `$..nameCurrentValue`
    * **출력 유형**: 목록
      
      ![값을 입력합니다.](./using-the-rest-data-provider-to-populate-form-options/images/04.png)

1. 완료되면 _저장_ 을 클릭합니다.

```{note}
`nameCurrentValue` 앞의 `$..`는 JSON 데이터 구조를 탐색하고 출력 경로를 지정하는 JsonPath 구문입니다. [JsonPath](https://github.com/json-path/JsonPath) 및 [here](http://goessner.net/articles/JsonPath/)에 대해 자세히 알아보세요.
```

## REST 데이터 공급자에 대한 필터로 입력 사용

위의 예에서는 단일 출력만 사용하여 _Select from List 필드_을 채웁니다. 목록에서 선택 필드에 표시하기 전에 REST 공급자의 응답을 필터링해야 하는 경우가 있습니다. 이를 위해 데이터 공급자 _입력_ 필드가 필요합니다.

예를 들어 전 세계 국가에 지역(예: 아메리카, 유럽 또는 오세아니아) 필터를 적용하려면 다음을 수행합니다.

1. 이 데이터를 입력하십시오:
   
      * **이름**: `나머지 국가`
   * **URL**: `https://restcountries.com/v3.1/region/{region}?fields=name`(다른 REST 공급자 사용)
   * **입력 라벨**: 지역
   * **파라미터**: 지역
   * **입력 유형**: 텍스트
   * **라벨 출력**: 국가명
   * **출력 경로**: `$..name.common`
   * **출력 유형**: 목록
이러한 값에 대한 자세한 내용은 [Data Providers Overview](./data-providers-overview.md)을 참조하십시오.

이 예제에서는 입력 매개변수를 사용하므로 API 호출이 제대로 해결되도록 데이터 공급자에 입력을 제공해야 합니다. 텍스트 필드의 값을 데이터 공급자에 입력으로 보내는 자동 채우기 규칙을 설정할 수 있습니다. 예제는 [자동 완성 규칙](../form-rules/using-the-autofill-rule.md) 설명서를 참조하세요. 

## 데이터 공급자 권한 부여

사용자가 양식을 작성하기 전에 인증을 받아야 하는지 여부에 따라 사용자는 데이터 공급자에게 추가 권한을 부여해야 할 수 있습니다. 예를 들어 게스트가 양식을 작성하려면 _보기_ 권한이 필요합니다. 그렇지 않으면 데이터 공급자가 제공하는 옵션을 볼 수 없습니다.

데이터 공급자의 권한을 구성하려면:

1. _사이트 관리_ &rarr; _콘텐츠 & 데이터_ &rarr; _양식_로 이동합니다.
1. 데이터 공급자 탭을 클릭합니다.
1. 작업 버튼(![Actions](../../../images/icon-actions.png))을 클릭한 다음 데이터 공급자 옆에 있는 _권한_ 를 클릭합니다.
   
   ![게스트 보기 권한을 부여합니다.](./using-the-rest-data-provider-to-populate-form-options/images/05.png)

1. 필요한 권한을 부여합니다.

1. 완료되면 _저장_ 을 클릭합니다.

## 선택 필드에서 데이터 공급자 사용

데이터 공급자가 구성되면 이를 사용하여 목록에서 선택 필드를 채웁니다.

1. _콘텐츠 & 데이터_ &rarr; _양식_를 클릭합니다.
1. _목록_ 에서 선택 필드를 양식으로 드래그합니다.
1. 목록 만들기 드롭다운 메뉴에서 _From Data Provider_ 을 선택합니다.
1. 데이터 공급자 선택 드롭다운 메뉴에서 _세계 국가_ 을 선택합니다.
1. 출력 매개변수 선택 드롭다운 메뉴에서 _국가 이름_ 을 선택합니다.
   
   ![목록에서 선택 필드에서 데이터 공급자 값을 구성합니다.](./using-the-rest-data-provider-to-populate-form-options/images/06.png)

1. 완료되면 _양식_ 저장을 클릭합니다.

데이터 공급자는 이제 올바른 권한으로 양식에 액세스하는 모든 사용자에 대해 선택 필드를 채웁니다.

![양식 사용자는 데이터 공급자가 채운 목록에서 옵션을 선택합니다.](./using-the-rest-data-provider-to-populate-form-options/images/07.png)

## 데이터 공급자 오류 문제 해결

데이터 공급자 실패로 인해 발생하는 오류를 발견하려면 다음 서비스에 대해 [구성 로그 수준](../../../system-administration/using-the-server-administration-panel/configuring-logging.md) 을 수행하십시오.

1. _제어판_ &rarr; _시스템_ &rarr; _서버 관리_로 이동합니다.
1. _로그 수준_ 탭을 클릭합니다.
1. 로깅 범주 `com.liferay.dynamic.data.mapping.data.provider.internal.DDMDataProviderInvokerImpl` 을 추가하고 _WARN_ 수준에서 로깅하도록 구성합니다. _완료되면_ 을 저장합니다.
1. 로깅 범주 `com.liferay.dynamic.data.mapping.form.field.type.internal.DDMFormFieldOptionsFactoryImpl` 을 추가하고 _WARN_ 수준에서 로깅하도록 구성합니다. _완료되면_ 을 저장합니다.

이제 콘솔은 데이터 공급자에 오류가 있을 때마다 경고 메시지를 보냅니다.

## 추가 정보

* [데이터 공급자 개요](./data-providers-overview.md)
* [자동 채우기 규칙 사용](../form-rules/using-the-autofill-rule.md)
