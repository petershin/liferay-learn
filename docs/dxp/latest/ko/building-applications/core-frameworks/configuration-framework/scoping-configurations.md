# 범위 지정 구성

Liferay DXP에서 응용 프로그램의 구성을 시스템, 인스턴스, 사이트 또는 포틀릿과 같은 다양한 수준의 범위로 설정할 수 있습니다. 예를 들어 인스턴스 범위 구성이 있는 애플리케이션을 생성하는 경우 Liferay DXP 설치에서 설정한 각 인스턴스에 대해 애플리케이션을 독립적으로 구성할 수 있습니다. 이는 각 사용자에게 더 많은 유연성과 제어 기능을 제공하기 때문에 유용합니다. 예를 들어 DXP 인스턴스의 관리자는 다른 인스턴스와 독립적인 자신의 인스턴스에 대한 구성을 설정할 수 있습니다.

범위에 대한 자세한 내용은 [구성 범위 이해](../../../system-administration/configuring-liferay/understanding-configuration-scope.md)을 참조하십시오.

인스턴스 범위 구성의 예를 보려면 [구성 설정 및 액세스](./setting-and-accessing-configurations.md)의 예제 포틀릿을 참조하십시오.

포틀릿 범위 구성은 다른 접근 방식을 취합니다. 자세한 내용은 [포틀릿 수준 구성](./portlet-level-configuration.md) 을 참조하십시오.

## 구성 인터페이스에서 범위 지정

구성 범위를 설정하려면 구성 인터페이스에서 범위를 지정하십시오. `@ExtendedObjectClassDefinition` 주석을 사용하여 범위를 설정하십시오. 시스템 범위에는 `Scope.SYSTEM` 을 사용하십시오. 인스턴스 범위에 `Scope.COMPANY` 을 사용하십시오. 사이트 범위에는 `Scope.GROUP` 을 사용하십시오.

```{literalinclude} ./scoping-configurations/resources/liferay-n2f3.zip/n2f3-web/src/main/java/com/acme/n2f3/web/internal/configuration/N2F3WebConfiguration.java
:language: java
:lines: 7-9
```

## 구성 공급자 사용

구성을 검색하려면 `ConfigurationProvider`을 사용하십시오. 구성 공급자 API는 구성에 쉽게 액세스할 수 있는 방법을 제공합니다. 애플리케이션 요구 사항에 맞는 특정 방법을 선택하십시오.

* `getSystemConfiguration()`: 시스템 범위 구성을 가져옵니다. 응용 프로그램의 시스템 수준 구성은 **제어판** &rarr; **구성** &rarr; **시스템 설정** 에서 찾을 수 있습니다.

* `getCompanyConfiguration()`: 인스턴스 범위 구성을 가져옵니다. `Portal` 의 인스턴스를 사용하여 `companyId`을 검색합니다. 예: `_portal.getCompanyId(renderRequest)`. 애플리케이션의 인스턴스 수준 구성은 **제어판** &rarr; **구성** &rarr; **인스턴스 설정** 에서 찾을 수 있습니다.

* `getGroupConfiguration()`: 사이트 범위 구성을 가져옵니다. `Portal` 인스턴스를 사용하여 `groupId`검색합니다. 예: `_portal.getScopeGroupId(renderRequest)`. 애플리케이션의 사이트 수준 구성은 **제품 메뉴** &rarr; **구성** &rarr; **사이트 설정** 에서 찾을 수 있습니다. Liferay 7.4에서 사용할 수 있습니다.

포틀릿 범위 구성에 대해서는 [포틀릿 수준 구성](./portlet-level-configuration.md)을 참조하십시오.
