# REST 데이터 공급자를 사용하여 양식 옵션 채우기

**목록** 에서 선택 필드는 많은 옵션을 보유할 수 있습니다. 이러한 옵션은 Liferay DXP 또는 기타 타사 REST 웹 서비스에 등록된 JSON 웹 서비스를 사용하여 자동으로 제공될 수 있습니다. 일반적으로 데이터 공급자에 대해 자세히 알아보려면 [데이터 공급자 개요](./data-providers-overview.md)을 참조하십시오. REST 데이터 공급자를 양식에 적용하기 위해 JSON 웹 서비스를 호출하고 데이터 공급자를 구성하여 양식에서 데이터 공급자를 사용하는 방법을 배웁니다.

## 전제 조건

일반적인 요구 사항은 선택 필드를 옵션 목록으로 채우는 것입니다. 예를 들어 양식에서 개인 정보를 수집할 때 사용자의 국가가 필요합니다.

1. **국가** 라는 단일 선택 필드를 포함하는 [양식 만들기](../creating-and-managing-forms/creating-forms.md).
   
2. 다음으로 `get-countries` JSON 웹 서비스를 사용합니다(둘 중 하나 사용).

   * Liferay를 로컬에서 실행 중인 경우 <http://localhost:8080/api/jsonws>로 이동합니다.
   * "get-countries"를 검색합니다.
     
     ![get-countries 웹 서비스를 검색합니다.](./using-the-rest-data-provider-to-populate-form-options/images/02.png)

   * **호출** 클릭합니다.

이제 국가 목록을 사용할 준비가 되었습니다.

### 로컬 네트워크의 데이터에 대한 액세스 활성화

기본적으로 사용자는 로컬 네트워크에서 URL을 사용하도록 데이터 공급자를 구성할 수 없습니다. 이것은 프로덕션 환경의 보안을 위한 좋은 기본값이지만 테스트를 더 어렵게 만듭니다.

데이터 공급자의 로컬 네트워크 액세스를 활성화하려면:

1. **제어판** &rarr; **구성** &rarr; **시스템 설정** 으로 이동합니다.
1. **데이터 공급자**(콘텐츠 & 데이터 아래)을 클릭합니다.
1. **액세스 로컬 네트워크** 확인란을 선택합니다.
   
   ![로컬 네트워크에 대한 액세스 권한을 부여합니다.](./using-the-rest-data-provider-to-populate-form-options/images/01.png)

1. 완료되면 **저장** 클릭합니다.

## 기본 REST 데이터 공급자 추가

**Countries of the World** 데이터 공급자를 추가하려면:

1. **제품 메뉴**(![Product Menu](../../../images/icon-product-menu.png))을 연 다음 **사이트 관리** 메뉴에서 나침반 아이콘(![Compass](../../../images/icon-compass.png))을 클릭합니다.
1. 양식을 만들 사이트를 선택합니다.
1. **콘텐츠 & 데이터** &rarr; **양식** 클릭합니다.
1. **데이터 공급자** 탭을 클릭합니다.
   
   ![데이터 공급자 탭으로 이동합니다.](./using-the-rest-data-provider-to-populate-form-options/images/03.png)

1. 추가 버튼(![Add](../../../images/icon-add.png))을 클릭하고 REST 데이터 공급자를 추가합니다.

1. 이 데이터를 입력하십시오:

    * **이름** : 세계 각국
    * **URL** : `http://localhost:8080/api/jsonws/country/get-countries/`
    * **사용자 이름** : `adminuser@liferay.com`
    * **비밀번호** : adminuserpass
    * **타임아웃** : 1000
    * **라벨 출력** : 국가명
    * **출력 경로** : `$..nameCurrentValue`
    * **출력 유형** : 목록
      
      ![값을 입력합니다.](./using-the-rest-data-provider-to-populate-form-options/images/04.png)

1. 완료되면 **저장** 클릭합니다.

```{note}
`nameCurrentValue` 앞의 `$..`는 JSON 데이터 구조를 탐색하고 출력 경로를 지정하는 JsonPath 구문입니다. [JsonPath](https://github.com/json-path/JsonPath) 및 [here](http://goessner.net/articles/JsonPath/) 에 대해 자세히 알아보세요.
```

## REST 데이터 공급자에 대한 필터로 입력 사용

위의 예에서는 단일 출력만 사용하여 **Select from List 필드** 을 채웁니다. REST 제공자의 응답을 필터링하려면 입력 필드를 사용하십시오.

이 예에서는 다른 데이터 공급자를 사용하고 전 세계 국가에 대해 지역(예: 아메리카, 유럽 또는 오세아니아) 필터를 적용합니다.

1. 이 데이터를 입력하십시오:
   
   * **이름** : `나머지 국가`
   * **URL** : `https://restcountries.com/v3.1/region/{region}?fields=name`
   * **입력 파라미터** : 지역
   * **입력 유형** : 텍스트
   * **입력 라벨** : 지역
   * **출력 경로** : `$..name.common`
   * **출력 유형** : 목록
   * **출력 라벨** : 국가명
이러한 값에 대한 자세한 내용은 [데이터 공급자 개요](./data-providers-overview.md) 참조하십시오.

이 예제에서는 입력 매개변수를 사용하므로 API 호출이 제대로 해결되도록 데이터 공급자에 입력을 제공해야 합니다. 텍스트 필드의 값을 데이터 공급자에 입력으로 보내는 자동 채우기 규칙을 설정할 수 있습니다. 예제는 [자동 완성 규칙](../form-rules/using-the-autofill-rule.md) 설명서를 참조하십시오. 

## 데이터 공급자 권한 부여

사용자가 제공하는 옵션을 보려면 데이터 공급자에 대한 보기 권한이 있어야 합니다. 예를 들어 게스트가 양식을 작성해야 하는 경우 보기 권한을 부여합니다.

데이터 공급자의 권한을 구성하려면:

1. **사이트 관리** &rarr; **콘텐츠 & 데이터** &rarr; **양식** 로 이동합니다.
1. 데이터 공급자 탭을 클릭합니다.
1. 작업 버튼(![Actions](../../../images/icon-actions.png))을 클릭한 다음 데이터 공급자 옆에 있는 **권한** 클릭합니다.
   
   ![게스트 보기 권한을 부여합니다.](./using-the-rest-data-provider-to-populate-form-options/images/05.png)

1. 필요한 권한을 부여합니다.

1. 완료되면 **저장** 클릭합니다.

## 선택 필드에서 데이터 공급자 사용

데이터 공급자가 구성되면 이를 사용하여 목록에서 선택 필드를 채웁니다.

1. **콘텐츠 & 데이터** &rarr; **양식** 클릭합니다.
1. **목록** 에서 선택 필드를 양식으로 드래그합니다.
1. 목록 만들기 드롭다운 메뉴에서 **From Data Provider** 선택합니다.
1. 데이터 공급자 선택 드롭다운 메뉴에서 **세계 국가** 을 선택합니다.
1. 출력 매개변수 선택 드롭다운 메뉴에서 **국가 이름** 선택합니다.
   
   ![목록에서 선택 필드에서 데이터 공급자 값을 구성합니다.](./using-the-rest-data-provider-to-populate-form-options/images/06.png)

1. 완료되면 **양식** 저장을 클릭합니다.

이제 데이터 공급자는 올바른 권한으로 양식에 액세스하는 모든 사용자에 대해 선택 필드를 채웁니다.

![양식 사용자는 데이터 공급자가 채운 목록에서 옵션을 선택합니다.](./using-the-rest-data-provider-to-populate-form-options/images/07.png)

## 데이터 공급자 오류 문제 해결

데이터 공급자 실패로 인해 발생하는 오류를 발견하려면 다음 서비스에 대해 [구성 로그 수준](../../../system-administration/using-the-server-administration-panel/configuring-logging.md) 을 수행하십시오.

1. **제어판** &rarr; **시스템** &rarr; **서버 관리** 로 이동합니다.
1. **로그 수준** 탭을 클릭합니다.
1. 로깅 범주 `com.liferay.dynamic.data.mapping.data.provider.internal.DDMDataProviderInvokerImpl` 추가하고 **WARN** 수준에서 로깅하도록 구성합니다. **완료되면** 저장합니다.
1. 로깅 범주 `com.liferay.dynamic.data.mapping.form.field.type.internal.DDMFormFieldOptionsFactoryImpl` 추가하고 **WARN** 수준에서 로깅하도록 구성합니다. **완료되면** 저장합니다.

이제 콘솔은 데이터 공급자에 오류가 있을 때마다 경고 메시지를 보냅니다.

## 관련 주제

* [데이터 공급자 개요](./data-providers-overview.md)
* [자동 채우기 규칙 사용](../form-rules/using-the-autofill-rule.md)
