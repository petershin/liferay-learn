# Entity Finder 메서드 정의

Finder 메소드는 지정된 매개변수를 기반으로 데이터베이스에서 엔티티 오브젝트를 검색합니다. 정의된 각 파인더에 대해 Service Builder는 파인더의 매개변수를 기반으로 엔터티 인스턴스를 가져오고, 찾고, 제거하고, 계산하는 여러 메서드를 생성합니다.

Liferay의 다중 테넌시를 지원할 때 사이트별로 엔터티를 찾을 수 있는 것이 중요합니다.

## 파인더 만들기

Finder는 쉽게 만들 수 있습니다.

```xml
<finder name="GroupId" return-type="Collection">
   <finder-column name="groupId" />
</finder> 
```

위의 예는 가장 간단한 파인더 중 하나이며 다중 테넌시를 지원하는 경우 항상 추가해야 하는 것입니다. 이 파인더는 애플리케이션이 배치된 사이트에 속하는 객체 모음을 반환합니다. Service Builder는 `*Persistence` 및 `*PersistenceImpl` 클래스의 엔터티에 대한 찾기 관련 메서드(예: `fetchByGroupId`, `findByGroupId`, `removeByGroupId`, `countByGroupId`)를 생성합니다. 이러한 클래스 중 첫 번째는 인터페이스입니다. 두 번째는 구현입니다. 예를 들어, Liferay의 블로그 애플리케이션은 [`blogs-api/src/main/java/com/liferay/blogs/service/persistence`](https://github.com/liferay/liferay-portal/tree/master/modules/apps/blogs/blogs-api/src/main/java/com/liferay/blogs/service/persistence) 폴더에 있는 `-Persistence` 클래스와 `-PersistenceImpl 폴더에서 엔티티 찾기 메서드를 생성합니다. <a href="https://github.com/liferay/liferay-portal/tree/master/modules/apps/blogs/blogs-service/src/main/java/com/liferay/blogs/service/persistence/impl"><code>blogs-service/src/main/java/com/liferay/blogs/service/persistence/impl`</a> 폴더의</code> 개 클래스.

그러나 하나의 열로 찾는 것으로 제한되지 않습니다. 다중 열 파인더를 만들 수 있습니다.

```xml
<finder name="G_UT" return-type="BlogsEntry" unique="true">
    <finder-column name="groupId" />
    <finder-column name="urlTitle" />
</finder>
```

```{important}
엔티티 기본 키를 매개변수로 사용하는 파인더를 작성하지 마십시오. Service Builder가 모든 엔터티 기본 키에 대해 `findByPrimaryKey` 및 `fetchByPrimaryKey` 메서드를 자동으로 생성하므로 필요하지 않습니다. `*service` 모듈을 배포할 때 Service Builder는 모든 엔터티 기본 키 열과 찾기 열에 대한 인덱스를 생성합니다. 엔티티 기본 키를 사용하는 파인더를 추가하면 동일한 열에 대해 여러 인덱스를 생성하려는 시도가 발생합니다. 예를 들어 Oracle DB는 이러한 시도를 오류로 보고합니다.
```

보시다시피 Service Builder를 사용하여 엔터티에 대한 찾기 메서드를 만드는 것은 복잡하지 않습니다. 
