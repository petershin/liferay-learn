# 엔티티 열 정의

엔터티의 열은 속성을 나타냅니다. 이러한 속성은 테이블 필드를 Java 객체 필드에 매핑합니다.

여기에서는 열에 대한 자세한 내용을 알아보기 위해 [서비스 빌더 생성 클래스 이해](../service-builder-basics/understanding-service-builder-generated-classes.md) 의 샘플 프로젝트를 검토합니다.

예제를 다운로드하고 압축 해제하여 시작하십시오.

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/building-applications/data-frameworks/service-builder/service-builder-basics/liferay-w9b7.zip -O
   ```

   ```bash
   unzip liferay-w9b7.zip
   ```

`w9b7-service/service.xml` 파일을 검사합니다.

```{literalinclude} ../service-builder-basics/understanding-service-builder-generated-classes/resources/liferay-w9b7.zip/w9b7-service/service.xml
:language: xml
```

엔터티에 대한 특성을 추가하려면 엔터티 정의에 `<column />` 태그를 추가합니다.

```xml
<column name="w9b7EntryId" primary="true" type="long" />
```

Service Builder가 실행될 때 개체 관계형 매핑을 처리하는 Hibernate 구성을 생성합니다. Service Builder는 `service.xml` 파일에 추가하는 각 열에 대한 데이터베이스 필드를 생성합니다. 각 열에 대해 지정된 Java 유형에 적합한 데이터베이스 필드 유형을 매핑하고 Liferay가 지원하는 모든 데이터베이스에서 이 작업을 수행합니다.  Service Builder는 또한 이러한 특성에 대한 모델 클래스에서 getter/setter 메서드를 생성합니다. 열의 `기본` (즉, 기본 키) 속성이 `true`으로 설정되면 해당 열이 엔티티의 기본 키가 됩니다. 이것은 [생성 클래스 이해 및 확장](../service-builder-basics/understanding-service-builder-generated-classes.md)에 있는 W9B7 애플리케이션의 경우입니다. `기본` 속성이 true로 설정된 여러 열을 정의하는 경우 열 조합이 엔터티에 대한 복합 기본 키를 구성합니다.

```{note}
[추가 메서드 구현](../service-builder-basics/understanding-service-builder-generated-classes.md#adding-a-local-service-method) 은 엔터티 인스턴스에 대해 고유한 기본 키를 생성하는 방법을 보여줍니다.
```

## 엔터티 열 만들기

첫 번째 엔터티에 필요한 열을 정의합니다. W9B7 엔터티에는 기본 키, 설명 및 이름의 세 가지 속성만 있습니다.

```xml
<column name="w9b7EntryId" primary="true" type="long" />

<column name="description" type="String" />
<column name="name" type="String" />
```

```{note}
`*service` 모듈을 배포할 때 Service Builder는 모든 엔터티 기본 키에 대한 인덱스를 자동으로 생성합니다.
```

애플리케이션에서 사용할 Java 유형을 사용하여 엔티티의 각 속성에 대한 열을 생성합니다. Service Builder는 SQL에 대한 매핑을 처리합니다.

## 다중 테넌시 지원

엔터티의 기본 키 및 속성에 대한 열 외에도 포털 인스턴스 ID 및 사이트 ID 열을 추가합니다. 그런 다음 Liferay의 멀티테넌시 기능을 지원하여 각 포털 인스턴스와 포털 인스턴스의 각 사이트가 독립적인 애플리케이션 데이터 세트를 가질 수 있습니다. 사이트의 ID를 유지하려면 `long`유형의 `groupId` 이라는 열을 추가합니다. 포털 인스턴스의 ID를 보유하려면 유형 `long`의 `companyId` 이라는 열을 추가하십시오.

```xml
<!-- Group instance -->

<column name="groupId" type="long" />
<column name="companyId" type="long" />
```

## 워크플로우 필드

엔티티의 진행 상황을 추적하는 데 필요한 필드를 추가하여 Liferay의 [워크플로우 시스템](../../../../process-automation/workflow/introduction-to-workflow.md) 지원할 수 있습니다.

```xml
<!-- Status fields -->

<column name="status" type="int" />
<column name="statusByUserId" type="long" />
<column name="statusByUserName" type="String" />
<column name="statusDate" type="Date" />
```

## 엔티티 감사

마지막으로 항목을 감사하는 데 도움이 되는 열을 추가할 수 있습니다. 각 엔터티 인스턴스의 소유자를 추적하려면 `long`유형의 `userId` 이라는 열을 추가합니다. 엔터티 인스턴스의 생성 날짜를 기록하기 위해 유형 `날짜` 의 `createDate` 이라는 열을 만듭니다. 엔터티 인스턴스가 마지막으로 수정된 시간을 추적하려면 유형 `날짜` 의 `modifiedDate` 이라는 열을 추가합니다.

```xml
<!-- Audit fields -->

<column name="userId" type="long" />
<column name="userName" type="String" />
<column name="createDate" type="Date" />
<column name="modifiedDate" type="Date" />
```

엄청난! 엔터티에는 속성을 나타낼 뿐만 아니라 다중 테넌시, 워크플로 및 감사를 지원하는 열이 있습니다.
