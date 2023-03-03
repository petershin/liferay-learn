# 구성 파일 사용

[시스템 설정](../system-settings.md) 은 시스템 범위 구성을 변경하고 다른 [범위](../understanding-configuration-scope.md)에 대한 기본 구성을 설정하기 위한 사용자 인터페이스를 제공합니다. 구성 파일을 통해 UI에서 동일한 구성을 만들 수 있습니다.

버전이 동일하다면 구성 파일을 사용하여 사전 프로덕션 시스템에서 프로덕션 시스템으로 또는 다른 Liferay DXP 시스템 간에 구성을 전송할 수 있습니다.

구성 파일은 [Apache Felix 구성 관리 프레임워크](http://felix.apache.org/documentation/subprojects/apache-felix-config-admin.html) 에서 정의한 `.config` 속성 값 형식을 사용합니다.

```{note}
`.cfg` 파일 형식은 OSGi 환경에서 일반적이며 지원되는 형식이지만 속성 값의 유형을 지정하고 다중 값 속성을 허용할 수 있기 때문에 `.config` 파일이 선호됩니다. 이러한 이유로 `.config` 파일이 모범 사례로 사용, 권장 및 문서화됩니다.
```

## 구성 파일 생성

시스템 설정은 구성 항목을 수정하면 사용할 수 있는 [*내보내기*](../system-settings.md#exporting-and-deploying-configurations) 옵션을 제공합니다. 내보내기는 `.config` 파일을 만드는 가장 좋은 방법입니다. `key=value` 형식의 항목 설정이 포함된 `.config` 파일을 다운로드한 다음 필요에 따라 수정하거나 배포합니다. 하나의 값만 변경된 경우에도 사용 가능한 모든 구성 키와 값을 내보냅니다.

단일 구성 항목 또는 수정된 전체 구성 세트를 내보낼 수 있습니다.

구성 파일은 지원 Java 클래스를 따라 이름이 지정됩니다. 예를 들어 웹 콘텐츠 기능을 지원하는 저널 서비스 항목의 파일 이름은 다음과 같습니다.

```bash
com.liferay.journal.configuration.JournalServiceConfiguration.config
```

![웹 콘텐츠 시스템 설정 항목에는 백엔드 ID com.liferay.journal.configuration.JournalServiceConfiguration이 있습니다.](./using-configuration-files/images/01.png)

시스템은 구성 파일의 이름을 적용합니다. 이름을 편집하면 구성 항목에 대한 링크가 끊어지고 추가 사용자 정의가 적용되지 않습니다. 유일한 예외는 [Factory Configuration](./using-factory-configuration.md)이며 경우에 따라 고유한 하위 이름을 제공할 수 있습니다.

### 암호 내보내기 활성화

기본적으로 구성 파일을 내보낼 때 비밀번호는 제외됩니다(예: Elasticsearch 비밀번호, Salesforce 비밀번호 등). 내보내기에 포함하려면 `portal-ext.properties` 파일에 다음 특성을 추가하십시오.

```properties
module.framework.export.password.attributes=true
```

변경 사항을 적용하려면 Liferay 인스턴스를 다시 시작하십시오.

## 키/값 구문

`.config` 파일의 모든 키와 값에 대한 구문은 동일합니다.

```properties
configurationName="value"
```

특수 문자가 없는 단일 값 구성의 경우 알아야 할 전부입니다. 여러 값과 특정 문자가 있는 설정은 약간 다릅니다.

### 다중 값 설정

구성 항목은 여러 값을 허용하는 속성을 가질 수 있습니다. 예를 들어 지원되는 파일 확장명을 지정하기 위한 구성 속성에는 둘 이상의 값이 필요합니다. `.config` 파일에 다중 값 설정을 작성하는 방법은 다음과 같습니다.

```properties
multiValueSetting=["Value 1","Value 2", ...]
```

값 사이(쉼표 뒤)에 공백 문자를 사용하면 속성이 무시됩니다.

시스템 설정(콘텐츠 섹션 아래)에서 웹 콘텐츠 범주를 열고 가상 인스턴스 범위에 대해 *웹 콘텐츠* 을 선택합니다. *Characters Blacklist*에 대한 여러 개의 단일 값 항목이 표시됩니다.

![웹 콘텐츠 시스템 설정 항목에는 많은 문자 블랙리스트 필드가 있습니다.](./using-configuration-files/images/02.png)

구성 파일에서 이것은 쉼표로 구분된 값의 배열이 있는 단일 키로 표시됩니다.

```properties
charactersblacklist=["&","'","@","\\","]","}",":","\=",">","/","<","[","{","%","+","#","`","?","\"",";","*","~"]
```

### 이스케이프 문자

큰따옴표(`"`) 및 등호(`=`)는 `.config` 파일에서 *이스케이프* 되어야 합니다.  이스케이프는 다른 문자를 사용하여 문자를 정상적인 방식으로 사용해서는 안 됨을 나타냅니다. 큰따옴표와 등호는 이미 `.config` 파일에서 사용되기 때문에 이를 이스케이프하면 시스템이 일반적인 방식으로 읽지 않고 값의 일부로 전달하도록 지시합니다. 백슬래시를 사용하여 `.config` 파일의 문자를 이스케이프 처리합니다.

```properties
charactersblacklist=["&","\"","\="]
```

이 설정은 일반 이스케이프 처리되지 않은 문자(`&`)와 두 개의 이스케이프 문자(`\"` 및 `\=`)가 있는 다중 값 설정을 보여줍니다.

큰따옴표 및 등호 문자의 필수 이스케이프와 함께 문제를 방지하기 위해 값 내부의 공백을 이스케이프하는 것이 좋습니다. 이 예에서는 각 공백 문자 앞에 백슬래시가 사용되어 올바르게 읽고 처리되도록 합니다.

```properties
blacklistBundleSymbolicNames=["Liferay\ Marketplace","Liferay\ Sharepoint\ Connector"]
```

공백을 직접 이스케이프하지 않으면 배포 후 시스템에서 백슬래시를 추가합니다.

## 입력된 값

`.config` 파일 형식은 특수 유형 마커 문자를 삽입하여 구성 값의 유형 지정을 지원합니다. 시스템은 이미 각 구성 속성에 대한 올바른 유형을 알고 있기 때문에 유형 문자는 정보 제공용으로만 유용합니다. 예를 들어 부울 유형이 있는 구성에는 부울 유형으로 표시하기 위한 값 바로 앞에 *B* 이 있습니다.

```properties
addDefaultStructures=B"true"
```

`.config` 파일에 유형 마커가 표시되면 무시해도 됩니다. 위에 포함된 예제는 유형 마커 없이 동일하게 작동합니다.

```properties
addDefaultStructures="true"
```

## 구성 파일 배포

구성 파일이 있으면 배포합니다. 등록되고 대상 구성 값이 자동으로 업데이트됩니다.

`.config` 파일을 배포하려면 [Liferay Home의](../../../installation-and-upgrades/reference/liferay-home.md) `osgi/configs` 폴더에 배치하십시오. 구성을 추가로 변경하려면 `.config` 파일을 직접 편집하거나 시스템 설정을 사용할 수 있습니다.

## 구성 파일 및 클러스터링

클러스터 환경에서 각 노드는 각 항목에 대해 동일한 구성 값이 필요합니다. 예를 들어 모든 노드는 동일한 블로그 구성 설정을 사용해야 합니다. 이를 수행하려면 `.config` 파일을 배포합니다. 투명성과 유지 관리를 위해 `.config` 파일을 클러스터의 모든 노드에 배포합니다. 그러나 내부 시스템은 구성 파일이 단일 노드에만 배포되더라도 클러스터의 모든 노드에 변경 사항을 적용합니다.

```{important}
Liferay DXP 구성(예: Liferay Home)을 소스 제어 시스템에 저장하는 경우 OSGi 구성 파일(.config 파일)을 포함해야 합니다.
```

## 스키마에 대한 읽기 전용 구성 설정

{bdg-secondary}`사용 가능 7.4 U19+`

특정 사이트나 인스턴스를 프로비저닝할 때 특정 구성을 읽기 전용으로 설정하는 것이 유용할 수 있습니다. 이것을하기 위해,

1. 읽기 전용으로 설정하려는 특정 구성으로 이동합니다. 예를 들어 *제어판* &rarr; *인스턴스 설정* &rarr; *블로그*로 이동합니다. 

1. 구성 설정을 변경하고 저장합니다. ![Actions](../../../images/icon-actions.png) 아이콘을 클릭합니다. 내보내기를 클릭합니다.

1. 명령줄에서 내보낸 구성 파일을 해당 파일에 대해 읽기 전용으로 설정합니다. 예를 들어, 

   ```bash
   chmod -w com.liferay.blogs.configuration.BlogsGroupServiceConfiguration.scoped_0efd1a18-105e-445d-8b42-0ea2d6117690.config
   ```

1. 구성 파일을 설치의 `/osgi/configs` 폴더에 넣습니다. 설정 페이지를 새로 고칩니다. 이제 구성이 읽기 전용입니다. 
   
   ![구성 파일을 /osgi/configs에 넣으면 이제 구성이 읽기 전용입니다.](./using-configuration-files/images/03.png)

## 단일 읽기 전용 값 지정

단일 읽기 전용 구성 값을 지정하려면 [포털 특성](../../../installation-and-upgrades/reference/portal-properties.md)을 사용하십시오.

{bdg-secondary}`사용 가능 7.4+, 7/3 FP1/SP1 및 7.2 FP14/SP5`

속성 구문은 다음과 같습니다.

```properties
configuration.override.${pid}_${key}=${value}{code}
```

예를 들어,

```properties
configuration.override.com.liferay.journal.configuration.JournalServiceConfiguration_indexAllArticleVersionsEnabled=B"false"
configuration.override.com.liferay.journal.configuration.JournalServiceConfiguration_journalArticleMaxVersionCount=I"5"{code}
```

```{important}
구성 속성은 유형 마커를 지정해야 합니다.
```

속성 구성은 서버 재시작 시 적용됩니다. 속성 구성이 가장 높은 우선 순위를 갖습니다. 구성 파일 및 데이터베이스 지속 구성보다 우선 순위가 높습니다. UI는 모든 읽기 전용 구성 설정을 구분합니다. 읽기 전용 구성 값을 변경해야 하는 경우 포털 속성을 사용하십시오.

```{note}
읽기 전용 [공장 구성 값](./using-factory-configuration.md)은 지원되지 않습니다.
```
