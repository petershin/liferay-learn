# 엔터티 관계 정의

데이터베이스 엔터티 또는 Java 개체 간의 관계는 대부분의 응용 프로그램에 필요합니다. Liferay의 메시지 보드 애플리케이션을 예로 들어 보겠습니다. 각 Message Board 메시지는 특정 Message Board 스레드에 속합니다. 메시지 보드 스레드는 특정 메시지 보드 범주에 속할 수도 있습니다.

애플리케이션의 [`service.xml`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/message-boards/message-boards-service/service.xml) 파일에서 관계가 어떻게 정의되는지 확인할 수 있습니다.

```xml
<entity external-reference-code="group" human-name="message-boards message" local-service="true" name="MBMessage" remote-service="true" trash-enabled="true" uuid="true">

    <!-- PK fields -->

    <column name="messageId" primary="true" type="long" />

    <!-- Group instance -->

    <column name="groupId" type="long" />

    <!-- Audit fields -->

    <column name="companyId" type="long" />
    <column name="userId" type="long" />
    <column name="userName" type="String" uad-anonymize-field-name="fullName" />
    <column name="createDate" type="Date" />
    <column name="modifiedDate" type="Date" />

    <!-- Other fields -->

    <column name="classNameId" type="long" />
    <column name="classPK" type="long" />
    <column name="categoryId" type="long" />
    <column name="threadId" type="long" />
    ...
```

이 `MBMessage` 객체에서 참조되는 `threadId` 필드는 `MBThread` 객체(위에 표시되지 않음)의 기본 키와 동일한 이름을 가집니다. 이렇게 하면 두 개체 간의 관계가 생성됩니다. `categoryId` 및 `MBCategory` 개체에서도 유사한 관계를 볼 수 있습니다.

축하합니다. 이제 두 엔터티를 연결하는 방법을 알았습니다. 
