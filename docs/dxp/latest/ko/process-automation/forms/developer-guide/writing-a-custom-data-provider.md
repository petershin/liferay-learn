# 사용자 지정 데이터 공급자 작성

Liferay Forms 필드는 [데이터 공급자](../data-providers/data-providers-overview.md)을 사용하여 채울 수 있습니다. 기본적으로 대부분의 REST 끝점에서 데이터를 소비하는 유연한 방법을 제공하는 REST 데이터 공급자가 있습니다. 자세한 내용은 [REST 데이터 공급자를 사용하여 양식 옵션 채우기](../data-providers/using-the-rest-data-provider-to-populate-form-options.md) 을 참조하십시오.

REST 데이터 공급자가 목적에 맞지 않는 경우 `DDMDataProvider` 확장점을 사용하여 고유한 확장 지점을 만드십시오.

```{note}
여기에서 시연한 예제 데이터 공급자는 [GeoDataSource™ 위치 검색 웹 서비스](https://www.geodatasource.com/web-service/location-search)에서 XML 데이터를 사용합니다. Liferay 직원의 API 키는 이 샘플에 하드 코딩되어 있습니다. 샘플을 남용하지 마십시오. 프로덕션 환경에서는 절대 사용하지 마십시오.
```

## 사용자 지정 데이터 공급자 배포
```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps:

1. Download and unzip the Acme XML Data Provider.

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/process-automation/forms/developer-guide/liferay-b4d8.zip -O
   ```

   ```bash
   unzip liferay-b4d8.zip
   ```

1. 모듈 루트에서 빌드 및 배포합니다.

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   ```{tip}
   이 명령은 배포된 jar를 Docker 컨테이너의 /opt/liferay/osgi/modules에 복사하는 것과 동일합니다.
   ```

1. Liferay Docker 컨테이너 콘솔에서 각 모듈의 배포를 확인합니다.

   ```bash
   STARTED com.acme.n4g6.impl_1.0.0
   ```

## 데이터 공급자 테스트

양식에서 데이터 공급자를 사용하려면

1. 데이터 공급자의 인스턴스를 추가합니다.

   1. 사이트 메뉴에서 콘텐츠 및 데이터 &rarr; 양식으로 이동합니다.

   1. 데이터 공급자 탭을 열고 _추가_ 버튼을 클릭합니다.

      ![사용자 지정 데이터 공급자는 Liferay Forms에서 사용할 준비가 되었습니다.](./writing-a-custom-data-provider/images/01.png)

   1. 구성:
      - **이름:** Cites Near Diamond Bar, CA(미국)
      - **설명:** GeoDataSource 위치 검색--Liferay 본사에서 20km 이내의 도시를 가져옵니다.
      - **출력**
         - **라벨:** 도시
         - **경로:** 도시
         - **유형:** 목록

      ![출력을 지정하여 사용자 지정 데이터 공급자를 구성합니다.](./writing-a-custom-data-provider/images/02.png)

   1. *저장*을 클릭합니다.

1. Cities Near Diamond Bar 데이터 공급자를 사용하는 양식을 추가합니다.

   1. 사이트 메뉴에서 콘텐츠 및 데이터 &rarr; 양식으로 이동합니다.

   1. 양식 탭에서 추가 버튼을 클릭합니다.

   1. 다음 설정으로 목록에서 선택 필드를 추가합니다.

      1. **레이블:** Liferay 근처 도시 선택

      1. **목록 만들기:** 데이터 공급자에서

      1. **데이터 공급자 선택:** Cities Near Diamond Bar, CA (USA)

      1. **출력 매개변수 선택:** 도시

   1. 양식을 게시하고 목록이 데이터 공급자로부터 채워졌는지 확인합니다.

   ![데이터 공급자는 Liferay에서 20km 이내의 도시 목록을 반환합니다.](./writing-a-custom-data-provider/images/03.png)

이것은 좋은 예이지만 데이터 공급자의 URL을 하드 코딩합니다. URL을 구성할 수 있도록 허용하면 다른 도시 또는 XML을 제공하는 다른 URL에 대해 동일한 데이터 공급자를 사용할 수 있습니다.

## B4D8 DDM 데이터 공급자 이해

`Acme B4D8 구현` 프로젝트에는 특정 URL에서 XML을 반환하기 위한 사용자 지정 데이터 공급자가 포함되어 있습니다. 여기에는 `B4D8DDMDataProvider`, `B4D8DDMDataProviderSettingsProovider`및 `B4D8DDMDataProviderSettings`의 세 가지 클래스가 포함되어 있습니다.

### `DDMDataProvider 구현`

데이터 공급자 클래스는 `com.liferay.dynamic.data.mapping.data.provider.DDMDataProvider` 인터페이스를 구현하여 `getData` 및 `getSettings`메서드를 재정의합니다. 이러한 메서드 이름은 데이터 공급자의 본질을 포착합니다. 즉, 설정을 기반으로 데이터를 제공합니다(설정은 선택 사항임).

인터페이스의 메서드를 구현하고 두 개의 `@Component` 설정을 제공하는 것만으로도 Liferay Forms 애플리케이션에 데이터 공급자를 등록하기에 충분하므로 Liferay의 기본 데이터 공급자와 함께 양식 UI에 자연스럽게 나타납니다.

```{literalinclude} ./writing-a-custom-data-provider/resources/liferay-b4d8.zip/b4d8-impl/src/main/java/com/acme/b4d8/dynamic/data/mapping/data/provider/internal/B4D8DDMDataProvider.java
   :language: java
   :lines: 38-41,43-46,65-66,67-68,70-71
```

`getData` 메소드가 대부분의 작업을 수행합니다. Forms 프레임워크가 이해하는 `DDMDaProviderResponse` 을 반환해야 합니다. B4D8 데이터 공급자의 주요 사항은 다음과 같습니다.

1. XML 데이터 원본에 대한 URL은 다음과 같이 구성됩니다.

   ```{literalinclude} ./writing-a-custom-data-provider/resources/liferay-b4d8.zip/b4d8-impl/src/main/java/com/acme/b4d8/dynamic/data/mapping/data/provider/internal/B4D8DDMDataProvider.java
      :dedent: 3
      :language: java
      :lines: 49-53
   ```

1. `_createDDMDataProviderResponse` 메소드가 호출됩니다. 이것은 응답 객체의 구성이 발생하는 곳입니다. 이 메서드를 호출하려면 데이터 공급자 설정과 원격 API에서 반환된 XML 문서라는 두 가지 매개 변수를 지정합니다. 둘 다에 대한 논리는 별도의 전용 유틸리티 메서드에 있습니다. 중요한 점은 `HttpUtil.URLtoString(url)` 은 URL을 실행하여 XML을 검색하는 호출입니다.

1. 이제 (데이터 제공자 인스턴스의 출력 매개변수 설정에 따라) 응답을 조건부로 작성하기 위한 조각이 준비되었습니다. 논리에는 다음이 포함됩니다.
   - 정적 내부 `Builder` 클래스의 `newBuilder` 메서드를 사용하여 응답 작성을 시작합니다.

      ```{literalinclude} ./writing-a-custom-data-provider/resources/liferay-b4d8.zip/b4d8-impl/src/main/java/com/acme/b4d8/dynamic/data/mapping/data/provider/internal/B4D8DDMDataProvider.java
         :dedent: 2
         :language: java
         :lines: 77-78
      ```

   - 데이터 공급자의 출력 매개변수 설정을 반복합니다. [Test the Data Provider](#test-the-data-provider) 에서는 한 세트의 출력만 추가했습니다(3개의 중첩 필드 포함). 추가 출력이 있는 데이터 공급자를 생성하는 경우 데이터 공급자 설정 양식에서 더하기 버튼을 클릭하여 이 루프가 각각을 구문 분석합니다.

   - 각 출력에 대해 반환된 XML 문서에서 XML 노드, 출력 매개 변수 ID 및 요청된 출력 데이터 유형(위의 예에서는 목록을 선택함)을 가져옵니다.

   - 출력 매개변수 유형을 확인하고 응답 빌더의 `withOutput` 메서드를 호출합니다. 각 호출은 출력 매개변수 ID와 일치하는 노드(또는 목록이 요청된 경우 노드)의 콘텐츠를 제공합니다.

      ```{literalinclude} ./writing-a-custom-data-provider/resources/liferay-b4d8.zip/b4d8-impl/src/main/java/com/acme/b4d8/dynamic/data/mapping/data/provider/internal/B4D8DDMDataProvider.java
         :dedent: 2
         :language: java
         :lines: 80-118
      ```


   - 메서드 끝에서 응답을 반환합니다: `return builder.build()`.

### `DDMDataProviderSettings`로 설정 정의

데이터 공급자 설정 클래스는 이 데이터 공급자에 필요한 설정을 다음 두 부분으로 정의합니다.

1. 설정 양식 자체의 레이아웃은 `@DDMForm*` 클래스 수준 주석을 사용하여 정의됩니다.

   ```{literalinclude} ./writing-a-custom-data-provider/resources/liferay-b4d8.zip/b4d8-impl/src/main/java/com/acme/b4d8/dynamic/data/mapping/data/provider/internal/B4D8DDMDataProviderSettings.java
      :language: java
      :lines: 10-25
   ```

   데이터 공급자를 구성하는 모든 필드는 이 `@DDMForm`의 설정 양식에 추가해야 합니다. 이 조각은 현재 `B4D8DDMDataProviderSettings` 클래스가 `DDMDataProviderParameterSettings`를 확장하기 때문에 액세스할 수 있는 상속된 `outputParameters` 필드만 사용합니다. 양식에 더 많은 설정을 추가하는 방법에 대해 알아보려면 [데이터 공급자 설정 추가](writing-a-custom-data-provider.md#add-data-provider-settings) 을 참조하십시오.

1. 클래스 선언 및 본문은 사용 가능한 필드를 결정합니다. 현재 추가 설정이 필요하지 않으므로 클래스 본문이 비어 있습니다.

   ```{literalinclude} ./writing-a-custom-data-provider/resources/liferay-b4d8.zip/b4d8-impl/src/main/java/com/acme/b4d8/dynamic/data/mapping/data/provider/internal/B4D8DDMDataProviderSettings.java
      :language: java
      :lines: 26-28
   ```

   ```{note}
   [DDMDataProviderParameterSettings]에서는 `outputParameters` 필드 외에도 `inputParameters` 필드도 제공됩니다(https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/dynamic-data-mapping/ dynamic-data-mapping-api/src/main/java/com/liferay/dynamic/data/mapping/data/provider/DDMDataProviderParameterSettings.java).
   ```

![데이터 공급자 설정 양식이 작동할 준비가 되었습니다.](./writing-a-custom-data-provider/images/05.png)

설정 양식에는 현재 양식 UI에 나타나는 모든 데이터 공급자에 필요한 몇 가지 기본 필드(이름, 설명 및 해당 권한을 정의하기 위한 섹션)가 포함되어 있습니다. `_ddmDataProviderInstanceSettings.getSettings(...)` 호출로 설정을 추가하면 이러한 설정을 얻을 수 있습니다. Outputs 필드는 레이아웃에 추가한 상속된 `outputParameters` 필드이며 실제로는 레이블, 경로 및 유형으로 구성된 중첩 필드입니다.

### `DDMDataProviderSettingsProvider`구현

설정 제공자 클래스에는 지정된 데이터 제공자에 대한 `DDMDataProviderSettings` 클래스를 리턴하는 `getSettings`메소드가 포함되어 있습니다. 데이터 공급자에서 설정 클래스를 인스턴스화하는 데 사용되므로 설정 값을 가져오고 그에 따라 데이터 공급자를 구성할 수 있습니다.

`B4D8DDMDataProviderSettingsProvider` 에 대한 참조를 가져온 다음 데이터 공급자 클래스의 동일한 이름의 `getSettings` 메서드에서 `getSettings` 메서드를 호출합니다.

```{literalinclude} ./writing-a-custom-data-provider/resources/liferay-b4d8.zip/b4d8-impl/src/main/java/com/acme/b4d8/dynamic/data/mapping/data/provider/internal/B4D8DDMDataProvider.java
   :dedent: 1
   :language: java
   :lines: 67-70,158-160
```

## 데이터 공급자 설정 추가

데이터 공급자 설정을 추가하려면 `DataProviderSettings` 인터페이스에 주석이 달린 필드를 추가하고 설정 값에 반응하도록 `DataProvider` 클래스를 업데이트합니다.

### 설정에 URL 필드 추가

1. 먼저 새 `URL` 필드를 `DataProviderSettings`에 추가합니다. 클래스 본문에 주석이 달린 다음 메서드를 추가합니다.

    ```java
    @DDMFormField(
        label = "%url", required = true,
        validationErrorMessage = "%please-enter-a-valid-url",
        validationExpression = "isURL(url)"
    )
    public String url();
    ```

    다음 가져오기가 필요합니다.

    ```java
    import com.liferay.dynamic.data.mapping.annotations.DDMFormField;
    ```

1. 양식 레이아웃을 생성하는 클래스 수준 주석에서 `@DDMFormLayoutColumn` 을 다음으로 바꿉니다.

    ```java
    @DDMFormLayoutColumn(
        size = 12, value = {"url", "outputParameters"}
    )
    ```

이제 `DataProvider` 클래스에서 설정을 사용할 준비가 되었습니다.

### 데이터 공급자의 `getData` 메서드에서 설정 처리

이제 `B4D8DDMDataProvider#getData` 메서드를 업데이트해야 합니다.

- 하드 코딩된 String `url` 변수를 제거합니다.
- 메서드를 리팩터링하여 `B4D8DDMDataProviderSettings` 을 이전에 인스턴스화하고 URL 설정을 검색합니다.
- 응답에 URL을 설정합니다.

이러한 편집을 로컬에서 수행하는 경우 다음 설명 단계 아래에 제공된 전체 `시도` 블록을 복사합니다.

1. 유효한 URL을 얻으려면 이제 사용자 입력이 허용됩니다.

    `키` 변수를 정의하는 줄을 제거하십시오. 이제 URL 설정 필드에서 구성할 수 있습니다.

    ```java
    String key = "LAOOBDZVQ5Z9HHYC4OCXHTGZGQLENMNA";
    ```

1. URL을 정의하는 `문자열` 변수를 데이터 공급자 설정 필드로 채워진 `Http.Options` 으로 바꿉니다.

    ```java
    Http.Options options = new Http.Options();

    options.setLocation(b4d8DDMDataProviderSettings.url());
    ```

1. `_createdDDMDataProviderResponse`에 대한 return 문의 호출에서 `url` 대신 새로운 `옵션` 을 사용합니다. 기존 return 문을 바꿉니다.

    ```java
    return _createDDMDataProviderResponse(
        b4d8DDMDataProviderSettings,
        _toDocument(HttpUtil.URLtoString(options)));
    ```

위의 단계는 메서드의 리팩토링을 생략합니다. 이러한 단계를 컴파일하고 테스트하려면 `getData` 메서드에서 전체 `try` 블록을 덮어씁니다.

```java
try {
    B4D8DDMDataProviderSettings b4d8DDMDataProviderSettings =
        _ddmDataProviderInstanceSettings.getSettings(
            _getDDMDataProviderInstance(
                ddmDataProviderRequest.getDDMDataProviderId()),
            B4D8DDMDataProviderSettings.class);

    Http.Options options = new Http.Options();

    options.setLocation(b4d8DDMDataProviderSettings.url());

    return _createDDMDataProviderResponse(
        b4d8DDMDataProviderSettings,
        _toDocument(HttpUtil.URLtoString(options)));
}
```

Liferay의 `Http` 클래스를 가져옵니다.

```java
import com.liferay.portal.kernel.util.Http;
```

이제 업데이트 데이터 공급자를 테스트할 준비가 되었습니다.

## 업데이트된 데이터 공급자 배포 및 테스트

양식에서 업데이트된 데이터 공급자를 사용하려면

1. 모듈 루트에서 다시 빌드하고 재배포합니다.

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

1. 데이터 공급자의 인스턴스를 추가합니다.
      - **이름: Pernambuco(브라질), Recife 근처의** 인용
      - **설명:** GeoDataSource 위치 검색--Liferay의 브라질 사무소에서 20km 이내의 도시를 가져옵니다.
      - **URL:**
        ```
        https://api.geodatasource.com/cities?key=LAOOBDZVQ5Z9HHYC4OCXHTGZGQLENMNA&format=xml&lat=-8.0342896&lng=-34.9239708
        ```
      - **출력**
         - **라벨:** 도시
         - **경로:** 도시
         - **유형:** 목록

1. Cities Near Recife 데이터 공급자를 사용하는 양식을 추가합니다.

   1. 사이트 메뉴에서 콘텐츠 및 데이터 &rarr; 양식으로 이동합니다.

   1. 양식 탭에서 추가 버튼을 클릭합니다.

   1. 다음 설정으로 목록에서 선택 필드를 추가합니다.

      1. **라벨:** Liferay, BR 근처의 도시를 선택하세요

      1. **목록 만들기:** 데이터 공급자에서

      1. **데이터 공급자 선택:** Cities Near Recife, Pernambuco, (Brazil)

      1. **출력 매개변수 선택:** 도시

   1. 양식을 게시하고 목록이 데이터 공급자로부터 채워졌는지 확인합니다.

   ![데이터 공급자는 브라질의 Liferay에서 20km 이내의 도시 목록을 반환합니다.](./writing-a-custom-data-provider/images/04.png)
