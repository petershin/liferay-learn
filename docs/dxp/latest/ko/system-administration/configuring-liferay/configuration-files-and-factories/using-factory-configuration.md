# 공장 구성 사용

대부분의 Liferay DXP 시스템 설정은 항목에 대해 하나의 구성 세트만 허용합니다. 구성을 변경하려면 단일 구성 양식을 업데이트하고 영향을 받는 구성 범위 [전체에 적용](../understanding-configuration-scope.md). 흔하지는 않지만 구성은 동시에 공존하는 여러 항목을 지원합니다. 이를 *공장 구성*이라고 합니다. 공장 구성의 경우 각 구성 세트는 고유한 구성을 제공합니다. 일반적인 용도는 타사 서버(예: LDAP 및 Elasticsearch)에 대한 시스템 범위 연결을 구성하는 것입니다. 이러한 서버에 대한 각 연결에는 고유한 구성 값이 필요하므로 이를 가능하게 하기 위해 공장 구성이 사용됩니다.

```{tip}
공장 구성 예: [조직 유형 추가](../../../users-and-permissions/organizations/adding-a-new-organization-type.md)가 지원되며 모델링이 필요한 경우에 유용합니다. 실제 계층을 만들거나 계층 규칙을 적용합니다. Liferay DXP에서 각 조직 유형은 시스템 설정의 공장 구성 항목을 통해 생성됩니다.
```

## 공장 구성 식별

서비스가 공장 구성을 지원하는 경우 시스템 설정 항목에 추가 버튼이 있습니다.

![시스템 설정 항목에 ADD 버튼이 있으면 공장 구성을 지원합니다.](./using-configuration-files/images/01.png)

추가 버튼 ![Add](../../../images/icon-add.png) 을 클릭하여 새 구성 값 집합을 추가합니다.

## 공장 구성 파일

단일 인스턴스 구성과 마찬가지로 시스템 설정 인터페이스(위에서 설명한 추가 버튼 사용</a>통해 공장 구성을 설정할 수 있습니다. 표준 단일 인스턴스 구성 파일은 `.config`이 추가된 구성 개체의 정규화된 클래스 이름을 사용합니다. </p> 



```bash
my.service.ServiceConfiguration.config
```


서비스가 공장 구성을 지원하는 경우 구성의 첫 번째 인스턴스 `~default.config`을 호출하는 규칙을 사용하십시오. 기본 조직 유형의 이름은 다음과 같이 지정됩니다. 



```bash
com.liferay.organizations.internal.configuration.OrganizationTypeConfiguration~default.config
```




```{note}
공장 구성 파일의 이름과 하위 이름을 구분하기 위해 물결표(`~`)를 사용하는 대신 
Liferay DXP/Portal 버전 7.0-7.3에서는 브라우저에 따라 대시(`-`) 또는 밑줄(`_`)을 사용합니다. 및 운영 체제. 예:

대시:

`com.liferay.organizations.internal.configuration.OrganizationTypeConfiguration-default.config`

밑줄:

`com.liferay.organizations.internal.configuration.OrganizationTypeConfiguration_default.config`

물결표가 기본 구분 기호이지만 문자, 대시 및 밑줄은 계속 지원됩니다.
```


다음 인스턴스에는 고유한 *하위 이름* ( *default*이외의 것)이 포함됩니다. 이 인스턴스를 사용해야 하는 경우를 설명하는 이름을 사용하는 것이 좋습니다. [Adding a New Organization Type](../../../users-and-permissions/organizations/adding-a-new-organization-type.md)의 예에 따라 이름이 지정된 구성 파일을 사용하여 _League_ 유형을 추가할 수 있습니다. 



```bash
com.liferay.organizations.internal.configuration.OrganizationTypeConfiguration~league.config
```




```{warning}
구성 파일에 하위 이름을 제공하면 서비스가 여러 구성 항목을 허용하도록 설계되지 않은 경우에도 공장 구성 시나리오가 적용됩니다. 위에서 설명한 대로 시스템 설정 UI를 사용하여 구성 항목에 대해 공장 구성 사용이 지원되는지 확인합니다. 
```


초기 구성을 지원하는 일부 시스템 설정 항목은 기본 인스턴스에 대한 구성 파일과 함께 제공되지 않습니다(예: 익명 사용자 항목). `.config` 파일을 얻기 위해 공장 구성 파일을 내보내는 경우 `~default.config` 명명 규칙을 사용하지 않습니다. 대신 첫 번째 발생이든 추가 발생이든 하위 이름에 대해 보장된 고유 식별자가 제공됩니다.



```bash
com.liferay.user.associated.data.web.internal.configuration.AnonymousUserConfiguration~6befcd73-7c8b-4597-b396-a18f64f8c308.config
```


별도의 시스템에 배포하기 위해 구성 파일을 내보내는 경우 내보낸 파일 이름의 첫 번째 `~` 뒤에 있는 일부 이름을 변경하여 더 설명적인 하위 이름을 사용할 수 있습니다. 주의: 파일의 이름을 바꾸고 파일을 내보낸 동일한 시스템에 배포하면 새 하위 이름이 파일을 완전히 새로운 구성으로 표시합니다. 이 경우 이름이 변경된 것이 아니라 추가 구성 인스턴스가 생성됩니다.



```{warning}
공장 구성을 지원하는 구성 항목의 경우 `.config` 파일 이름에서 하위 이름을 생략하면 시스템 설정에서 이 `.config` 파일이 대상으로 하는 구성 항목에 대한 새 항목 추가를 허용하지 않습니다. 이는 알려진 버그로 인해 발생합니다. 자세한 내용은 [LPS-76352](https://issues.liferay.com/browse/LPS-76352)을 참조하십시오. 부적절하게 명명된 구성 파일이 배포되면 해당 시스템 설정 항목에서 해당 구성에 대한 항목을 추가할 수 없습니다.

잘못된(하위 이름이 없는) `.config` 파일을 배포해도 어떤 것도 영구적으로 비활성화되지 않습니다. 위에서 설명한 적절한 규칙을 사용하여 파일 이름을 바꾸거나 완전히 제거하고 다시 시작하십시오.
```