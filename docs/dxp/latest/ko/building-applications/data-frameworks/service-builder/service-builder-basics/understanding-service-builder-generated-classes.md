# 생성된 클래스 이해 및 확장

Service Builder는 엔터티</a> 에 대한

개의 테이블과 엔터티에 대한 모델, 지속성 및 서비스 클래스를 모두 생성합니다. 여기서는 `W9B7Entry`이라는 엔티티에 대해 생성된 클래스를 검사합니다. 그런 다음 새 메서드로 로컬 서비스를 확장하고 호출합니다.</p> 

예제 프로젝트를 다운로드하고 압축을 풀어 시작하십시오.



```bash
curl https://learn.liferay.com/dxp/latest/en/building-applications/data-frameworks/service-builder/service-builder-basics/liferay-w9b7.zip -O
```




```bash
unzip liferay-w9b7.zip
```


`w9b7-service/service.xml` 파일을 검사합니다.



```{literalinclude} ./understanding-service-builder-generated-classes/resources/liferay-w9b7.zip/w9b7-service/service.xml
:language: xml
```


`package-path="com.acme.w9b7"` 설정은 클래스가 `-api` 모듈 및 `-service` 모듈의 `com/acme/w9b7` 패키지 경로에 생성되도록 지정합니다. 유일한 엔터티는 `W9B7Entry`입니다. 로컬 서비스(DXP/Portal과 동일한 JVM에서 액세스할 수 있는 서비스)는 있지만 원격 서비스는 없습니다.

생성된 클래스를 확인하십시오.



## 생성된 클래스 목록

각 모듈의 `com/acme/w9b7` 패키지 폴더에는 Service Builder에서 생성한 Java 클래스가 포함되어 있습니다. 파일 구조에 나타나는 모듈 클래스는 다음과 같습니다.



```
w9b7-api/src/main/java/com/acme/w9b7
├── exception
│   └── NoSuchW9B7EntryException.java
├── model
│   ├── W9B7Entry.java
│   ├── W9B7EntryModel.java
│   ├── W9B7EntrySoap.java
│   ├── W9B7EntryTable.java
│   └── W9B7EntryWrapper.java
└── service
    ├── persistence
    │   ├── W9B7EntryPersistence.java
    │   └── W9B7EntryUtil.java
    ├── W9B7EntryLocalService.java
    ├── W9B7EntryLocalServiceUtil.java
    └── W9B7EntryLocalServiceWrapper.java

w9b7-service/src/main/java/com/acme/w9b7
├── model
│   └── impl
│       ├── W9B7EntryBaseImpl.java
│       ├── W9B7EntryCacheModel.java
│       ├── W9B7EntryImpl.java // MODIFIABLE
│       └── W9B7EntryModelImpl.java
└── service
    ├── base
    │   └── W9B7EntryLocalServiceBaseImpl.java
    ├── impl
    │   └── W9B7EntryLocalServiceImpl.java // MODIFIABLE
    └── persistence
        └── impl
            ├── constants
            │   └── W9B7EntryPersistenceConstants.java
            ├── W9B7EntryModelArgumentsResolver.java
            └── W9B7EntryPersistenceImpl.java
```


`W9B7EntryImpl.java` 및 `W9B7EntryLocalServiceImpl.java` 클래스는 수정할 수 있는 유일한 클래스입니다. 생성된 다른 클래스를 수정하지 마십시오. 서비스 빌더는 서비스 빌더가 실행될 때마다 콘텐츠를 재생성합니다.



```{note}
엔터티에 대해 원격 서비스를 활성화(즉, `remote-service="true"`)하여 서비스 작성기를 실행하면 서비스 작성기는 수정 가능한 원격 서비스 구현 클래스(예: `W9B7EntryServiceImpl.java`)를 포함하여 원격 서비스 클래스를 생성합니다.
```


API 클래스부터 시작하여 모든 클래스에 대해 설명합니다.



## API 클래스

API 클래스는 공용 인터페이스, 유틸리티 및 상수를 정의합니다.

래퍼, `W9B7Entry`을 래핑합니다. 이 클래스는 엔터티</a>을 사용자 정의하기 위해 으로 확장됩니다.</td> </tr> 

</tbody> </table> 



## 구현 클래스

이러한 클래스는 모델, 지속성 및 서비스 계층을 구현합니다.

| 구현 클래스                                  | 묘사                                                                                                                                                                                                                   |
|:--------------------------------------- |:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `W9B7EntryBaseImpl`                     | `W9B7EntryModelImpl` 을 확장하여 각 열이 `W9B7EntryModel` 속성에 매핑된 `W9B7_W9B7Entry` 데이터베이스 테이블의 행을 나타냅니다.                                                                                                                     |
| `W9B7EntryCacheModel`                   | 캐시의 `W9B7Entry` 엔터티를 나타냅니다.                                                                                                                                                                                          |
| `W9B7EntryImpl` (**수정 가능**)             | 모델 구현. 이 클래스를 사용하여 모델에 도우미 메서드 및 애플리케이션 논리를 추가할 수 있습니다. 도우미 메서드 또는 애플리케이션 논리를 추가하지 않으면 자동 생성된 필드 getter 및 setter만 사용할 수 있습니다. 이 클래스에서 메서드를 추가하거나 수정할 때마다 Service Builder는 다음에 실행할 때 변경 사항을 `W9B7Entry` 인터페이스에 전파합니다. |
| `W9B7EntryLocalServiceBaseImpl`         | 로컬 서비스 기반 구현. 이것은 추상 클래스입니다. Service Builder는 다양한 서비스 및 지속성 클래스의 여러 인스턴스를 이 클래스에 주입합니다.                                                                                                                              |
| `W9B7EntryLocalServiceImpl` (**수정 가능**) | 로컬 서비스 구현. 수정해야 하는 로컬 서비스의 유일한 클래스입니다. 비즈니스 로직을 추가하는 곳입니다. 여기에 추가되거나 수정된 모든 메서드에 대해 Service Builder는 다음에 실행할 때 변경 사항을 `W9B7EntryLocalService` 인터페이스에 전파합니다.                                                          |
| `W9B7EntryModelArgumentsResolver`       | 엔터티 값을 검색하기 위한 매개변수를 처리합니다.                                                                                                                                                                                          |
| `W9B7EntryModelImpl`                    | 기본 모델 구현.                                                                                                                                                                                                            |
| `W9B7EntryPersistenceImpl`              | `W9B7EntryPersistence`을 구현하는 지속성 구현 클래스.                                                                                                                                                                             |


`*BaseImpl` 추상 클래스는 구현이 풍부합니다. `W9B7EntryImpl` 및 `W9B7EntryLocalServiceImpl` 클래스는 이를 확장하고 기능을 추가하는 방법을 제공합니다.



## 로컬 서비스 방법 추가

주어진 이름과 설명에서 `W9B7Entry` 인스턴스를 생성하기 위한 편리한 방법을 추가하여 로컬 서비스를 확장합니다.

1. `W9B7EntryLocalServiceImpl` 클래스에 다음 편의 메서드를 추가합니다. 
   
   

    ```java
    public W9B7Entry addW9B7Entry(String description, String name)
        throws PortalException {

        W9B7Entry w9b7Entry = w9b7EntryPersistence.create(
            counterLocalService.increment());

        w9b7Entry.setDescription(description);
        w9b7Entry.setName(name);

        return w9b7EntryPersistence.update(w9b7Entry);
    }
    ```


기본 클래스의 `w9b7EntryPersistence` 필드와 `counterLocalService` 필드를 사용하여 카운터 서비스에서 생성된 ID로 `W9B7Entry` 인스턴스를 생성합니다. 설명과 이름이 항목에 지정된 다음 `w9b7EntryPersistence.update` 메서드 호출을 통해 항목이 유지됩니다. 



    ```{note}
    서비스 빌더에서 생성한 'W9B7EntryLocalServiceBaseImpl.java'와 같은 기본 클래스는 애플리케이션에서 사용하기 위한 유용한 필드와 메서드를 제공합니다.
    ```


1. 서비스 빌더를 실행합니다. 
   
   

    ```bash
    cd w9b7-service
    ```




    ```bash
    ../gradlew buildService
    ```


    Output:
    



    ```
    > Task :w9b7-service:buildService
    Building W9B7Entry
    Writing ../w9b7-api/src/main/java/com/acme/w9b7/model/W9B7EntryModel.java
    Writing ../w9b7-api/src/main/java/com/acme/w9b7/service/W9B7EntryLocalService.java
    Writing ../w9b7-api/src/main/java/com/acme/w9b7/service/W9B7EntryLocalServiceUtil.java
    Writing ../w9b7-api/src/main/java/com/acme/w9b7/service/W9B7EntryLocalServiceWrapper.java
    Writing src/main/resources/service.properties
    ```


Service Builder는 새로운 로컬 서비스 메서드 구현을 지원하도록 로컬 서비스 API를 업데이트했습니다.

1. `w9b7-api` 모듈의 `W9B7EntryLocalService` 클래스에서 새 메소드 서명을 확인하십시오. 
   

    ```java
    public W9B7Entry addW9B7Entry(String description, String name) throws PortalException;
    ```


새 방법을 모듈과 함께 게시할 수 있습니다.



## 새로운 서비스 방법 테스트

모듈을 배포하고 새 서비스를 테스트할 때입니다.

```{include} /_snippets/run-liferay-portal.md


```

Then, follow these steps:

1. Build and deploy the example.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```




    ```{note}
    이 명령은 모듈 JAR을 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```


1. Docker 컨테이너 콘솔에서 배포를 확인합니다. 
   
   

    ```bash
    STARTED com.acme.w9b7.api_1.0.0
    STARTED com.acme.w9b7.service_1.0.0
    ```


1. 제어판 → 서버 관리 → 스크립트에서 스크립트 콘솔로 이동합니다.

1. 다음 스크립트를 실행하여 새 방법을 통해 항목을 추가하십시오. 
   
   

    ```groovy
    import com.acme.w9b7.service.W9B7EntryLocalServiceUtil;

    W9B7EntryLocalServiceUtil.addW9B7Entry("Remove clutter from your desk.", "Straighten Desk");

    w9b7Entries = W9B7EntryLocalServiceUtil.getW9B7Entries(-1, -1);

    for (w9b7Entry in w9b7Entries){
        out.println(w9b7Entry);
    }
    ```


산출량: 



    ```
    {w9b7EntryId=1234, description=Remove clutter from your desk., name=Straighten Desk}
    ```


항목은 JSON 형식으로 인쇄됩니다.

축하합니다! 새 서비스 방법을 성공적으로 추가했습니다.



## 무엇 향후 계획

이제 Service Builder에서 생성</a>클래스와 로컬 서비스 메서드를 추가하는 방법을 이해 포틀릿에서 서비스를 호출하는 방법을 배울 수 있습니다.</p>
