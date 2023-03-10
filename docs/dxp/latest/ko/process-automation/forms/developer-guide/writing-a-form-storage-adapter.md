# 양식 저장 어댑터 작성

> 사용 가능: Liferay DXP 7.3 및 [LPS-97208](https://issues.liferay.com/browse/LPS-97208) 에 대한 수정 사항이 포함된 Liferay DXP 7.2 버전(Liferay DXP 7.2 SP3용으로 계획됨).

기본적으로 양식은 Liferay DXP의 데이터베이스에 JSON으로 저장됩니다. 이 예는 양식 레코드 지속성 이벤트에 사용자 지정 논리를 삽입하기 위해 새 스토리지 어댑터를 구현하는 방법을 보여줍니다.

![DDM 스토리지 어댑터를 사용하여 Forms 애플리케이션에 스토리지 유형을 추가하십시오.](./writing-a-form-storage-adapter/images/01.png)

먼저 [기본 스토리지 어댑터](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/dynamic-data-mapping/dynamic-data-mapping-service/src/main/java/com/liferay/dynamic/data/mapping/internal/storage/DefaultDDMStorageAdapter.java) 이 Liferay DXP 데이터베이스에 양식 레코드를 JSON 콘텐츠로 저장하는 방법을 볼 수 있습니다. 그런 다음 파일 시스템에 각 양식 레코드를 저장하는 논리를 추가합니다.

## 실행 중인 DDM 스토리지 어댑터 검사

스토리지 어댑터의 작동 방식을 보려면 예제를 배포한 다음 예제 어댑터를 사용하여 일부 양식 데이터를 추가하십시오.

### 예제 배포

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. [DDM 스토리지 어댑터 프로젝트](./writing-a-form-storage-adapter/resources/liferay-r2f1.zip) 를 다운로드하고 압축을 풉니다.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/process-automation/forms/developer-guide/liferay-r2f1.zip -O
    ```

    ```bash
    unzip liferay-r2f1.zip
    ```

1. 모듈 루트에서 빌드 및 배포합니다.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{tip}
    이 명령은 배포된 jar를 Docker 컨테이너의 /opt/liferay/osgi/modules에 복사하는 것과 동일합니다.
    ```

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```bash
    STARTED com.acme.r2f1.impl_1.0.0 [1009]
    ```

### 배포된 스토리지 어댑터 사용

1. 브라우저에서 <http://localhost:8080>로 엽니다.

1. **사이트 메뉴** &rarr; **콘텐츠 & 데이터** &rarr; **양식** 의 Forms 애플리케이션으로 이동합니다.

1. **추가** 버튼(![Add](./../../../images/icon-add.png))을 클릭하여 양식 작성기를 엽니다.

1. Form Builder 보기에서 **옵션** 버튼(![Options](./../../../images/icon-options.png))을 클릭하고 **설정** 창을 엽니다.

1. **스토리지 유형 선택** 에서 **R2F1 동적 데이터 매핑 스토리지 어댑터** 유형을 선택하고 **완료** 를 클릭합니다.

1. 양식에 [텍스트 필드](../creating-and-managing-forms/creating-forms.md) 을 추가하고 양식을 게시한 다음 몇 번 제출하십시오.

1. 양식 데이터가 유지되었는지 확인하려면 양식의 레코드로 이동하십시오.

**Site Menu** &rarr; **Content** &rarr; **Forms** 에서 Form의 **Actions** 버튼(![Actions](./../../../images/icon-actions.png))을 클릭한 다음 **View Entries** 를 클릭합니다.

   ![양식 항목이 추가되었는지 확인하십시오.](./writing-a-form-storage-adapter/images/02.png)

1. 또한 샘플의 메서드가 호출되고 있음을 보여주기 위해 각 CRUD 메서드에 로깅이 제공됩니다.

   ```bash
   WARN  [http-nio-8080-exec-5][R2F1DDMStorageAdapter:82] Acme storage adapter's save method was invoked
   ```

## 확장점 이해

이 예에는 양식 항목을 저장하기 위한 논리를 제공하기 위해 `DDMStorageAdapter`를 구현하는 서비스인 `R2F1DDMStorageAdapter` 클래스만 포함되어 있습니다. 배포된 예제는 현재 기본 JSON 구현인 `DefaultDDMStorageAdapter`를 래핑합니다. 나중에 이미 여기에 있는 코드에 파일 시스템 저장소를 추가합니다.

### OSGi 컨테이너에 어댑터 클래스 등록

`DDMFileSystemStorageAdapter` 은 `DDMStorageAdapter` 인터페이스를 구현하지만 OSGi 서비스로 등록해야 합니다.

```java
@Component(
    property = "ddm.storage.adapter.type=r2f1-ddm-storage-adapter",
    service = DDMStorageAdapter.class
)
public class R2F1DDMStorageAdapter implements DDMStorageAdapter {
```

```{note}
`r2f1-ddm-storage-adapter` 키는 `src/main/resources/content/Language.properties` 파일과 `bnd.bnd` 파일.
```

`서비스` 구성 요소 속성은 구현을 `DDMStorageAdapter` 서비스로 등록합니다.

속성 `ddm.storage.adapter.type` 은 서비스가 고유한 `DDMStorageAdapter` 구현으로 등록되도록 식별자를 제공합니다. 이제 다른 서비스에서 다음과 같이 참조할 수 있습니다.

```java
@Reference(target = "(ddm.storage.adapter.type=r2f1-ddm-storage-adapter)")
private DDMStorageAdapter defaultWrapperDDMStorageAdapter;
```

### DDMStorageAdapter 인터페이스 이해

인터페이스에는 양식 레코드에 대한 CRUD 작업을 처리하는 세 가지 메서드( `delete`, `get`, `save` (업데이트 논리도 처리))가 필요합니다.

```java
public DDMStorageAdapterDeleteResponse delete(
        DDMStorageAdapterDeleteRequest ddmStorageAdapterDeleteRequest)
    throws StorageException;
```

```java
public DDMStorageAdapterGetResponse get(
        DDMStorageAdapterGetRequest ddmStorageAdapterGetRequest)
    throws StorageException;
```

```java
public DDMStorageAdapterSaveResponse save(
        DDMStorageAdapterSaveRequest ddmStorageAdapterSaveRequest)
    throws StorageException;
```

각 메소드는 정적 내부 `Builder` 클래스의 `newBuilder` 메소드를 사용하여 구성된 **DDMStorageAdapter[ [Save](https://github.com/liferay/liferay-portal/blob/[$LIFERAY** LEARN_PORTAL_GIT_TAG$]/modules/apps/dynamic-data-mapping/dynamic-data-mapping-api/src/main/java/com/liferay/dynamic/data/mapping/storage/DDMStorageAdapterSaveResponse.java) / [Get](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/dynamic-data-mapping/dynamic-data-mapping-api/src/main/java/com/liferay/dynamic/data/mapping/storage/DDMStorageAdapterGetResponse.java) / [Delete](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/dynamic-data-mapping/dynamic-data-mapping-api/src/main/java/com/liferay/dynamic/data/mapping/storage/DDMStorageAdapterDeleteSaveResponse.java) ]Response_ 객체를 반환해야 합니다.

모든 메소드에는 `DDMStorageAdapter[Save/Delete/Get]Request`이 전달됩니다. 요청 객체에는 유용한 컨텍스트 정보를 반환하는 getter 메서드가 포함되어 있습니다.

## 파일 시스템 스토리지 구현

예제는 이미 필요한 메서드를 재정의합니다. 기능에 대한 전용 유틸리티 메서드를 만든 다음 재정의된 메서드에서 호출합니다.

### 서비스 종속성 선언

이 코드는 OSGi 컨테이너에 배포된 두 서비스에 의존합니다. `org.osgi.service.component.annotations.Reference`에서 제공하는 Declarative Services `@Reference` 주석을 사용하여 클래스 끝에 이러한 선언을 추가합니다.

```java
@Reference
private DDMContentLocalService _ddmContentLocalService;

@Reference
private DDMFormValuesSerializerTracker _ddmFormValuesSerializerTracker;
```

`com.liferay.dynamic.data.mapping.service.DDMContentLocalService` 및 `com.liferay.dynamic.data.mapping.io.DDMFormValuesSerializerTracker`가져오기.

### 로거 생성

클래스에 대한 로거를 만들고 `_log` 변수에 설정합니다.

```java
private static final Log _log = LogFactoryUtil.getLog(
    R2F1DDMStorageAdapter.class);
```

이것은 CRUD 메소드 중 하나가 호출될 때마다 일부 로그 메시지를 추가하는 데 사용됩니다.

### 파일 삭제 구현

1. 파일이 저장되는 사이트를 제어할 수 있도록 전용 변수 `_PATHNAME` 을 설정합니다. 여기서 경로는 Docker 컨테이너의 Liferay 설치 사이트를 가리킵니다.

   ```java
   private static final String _PATHNAME = "/opt/liferay/form-records";
   ```

1. `_deleteFile` 유틸리티 메서드를 만듭니다( `java.io.File` 클래스 가져오기).

   ```java
   private void _deleteFile(long fileId) {
       File file = new File(_PATHNAME + "/" + fileId);

       file.delete();

       if (_log.isWarnEnabled()) {
        _log.warn("Deleted file with the ID " + fileId);
       }
   }
   ```

1. 재정의된 `삭제` 메서드를 찾습니다. `return` 문 바로 앞에 다음을 추가합니다.

   ```java
    long fileId = ddmStorageAdapterDeleteRequest.getPrimaryKey();

    _deleteFile(fileId);
   ```

이제 코드는 데이터베이스에서 복사본을 삭제하기 전에 먼저 파일 시스템에서 파일을 삭제합니다.

### 파일 검색 구현

`get` 메서드에 대해 동일한 절차를 따릅니다. 개인 유틸리티 메서드를 만든 다음 호출합니다.

1. `_getFile` 유틸리티 메서드를 추가합니다.

   ```java
    private void _getFile(long fileId) throws IOException {
        try {
            if (_log.isWarnEnabled()) {
                _log.warn(
                    "Reading the file with the ID " + fileId + ": " +
                        FileUtil.read(_PATHNAME + "/" + fileId));
            }
        }
        catch (IOException e) {
            throw new IOException(e);
        }
    }
    ```

   가져오기 `com.liferay.portal.kernel.util.FileUtil` 및 `java.io.IOException`.

1. 재정의된 `get` 메서드( `try` 블록 내)에서 `return` 문 바로 앞에 다음을 삽입하여 `storageId` ( `ddmStorageAdapterGetRequest.getPrimaryKey()`에서 검색)을 `fileId` 로 설정하고 다음을 호출합니다. 검색된 콘텐츠를 Liferay 로그에 인쇄하는 `_getFile` 유틸리티 메서드.

   ```java
   long fileId = ddmStorageAdapterGetRequest.getPrimaryKey();

   _getFile(fileId);
   ```

### 파일 생성 로직 구현

저장 요청에는 두 가지 유형이 있습니다. 1) 새 레코드가 추가되거나 2) 기존 레코드가 업데이트됩니다. 저장할 때마다 `업데이트` 메서드가 현재 `ddmFormValues` 콘텐츠를 사용하여 기존 파일을 덮어씁니다.

1. `_saveFile` 유틸리티 메서드를 만듭니다.

   ```java
   private void _saveFile(long fileId, DDMFormValues formValues)
       throws IOException {

       try {
           String serializedDDMFormValues = _serialize(formValues);

           File abstractFile = new File(String.valueOf(fileId));

           FileUtil.write(
               _PATHNAME, abstractFile.getName(), serializedDDMFormValues);

           if (_log.isWarnEnabled()) {
               _log.warn("Saved a file with the ID" + fileId);
           }
       }
       catch (IOException e) {
           throw new IOException(e);
       }
   }
    ```

   가져오기 `com.liferay.dynamic.data.mapping.storage.DDMFormValues` 및 `java.io.File`.

1. `_serialize` 유틸리티 메서드를 만들어 `DDMFormValues` 개체를 JSON으로 변환합니다.

    ```java
    private String _serialize(DDMFormValues ddmFormValues) {
        DDMFormValuesSerializer ddmFormValuesSerializer =
            _ddmFormValuesSerializerTracker.getDDMFormValuesSerializer("json");

        DDMFormValuesSerializerSerializeRequest.Builder builder =
            DDMFormValuesSerializerSerializeRequest.Builder.newBuilder(
                ddmFormValues);

        DDMFormValuesSerializerSerializeResponse
            ddmFormValuesSerializerSerializeResponse =
                ddmFormValuesSerializer.serialize(builder.build());

        return ddmFormValuesSerializerSerializeResponse.getContent();
    }
    ```

    가져오기 `com.liferay.dynamic.data.mapping.io.DDMFormValuesSerializer`, `com.liferay.dynamic.data.mapping.io.DDMFormValuesSerializerSerializeRequest`및 `com.liferay.dynamic.data.mapping.io.DDMFormValuesSerializerSerializeResponse`.

1. 기존 `return` 문을 대체하여 이 논리와 `_saveFile` 에 대한 호출을 `save` 메서드에 추가합니다.

   ```java
    DDMStorageAdapterSaveResponse defaultStorageAdapterSaveResponse =
        _defaultStorageAdapter.save(ddmStorageAdapterSaveRequest);

    long fileId = defaultStorageAdapterSaveResponse.getPrimaryKey();

    _saveFile(fileId, ddmStorageAdapterSaveRequest.getDDMFormValues());

    return defaultStorageAdapterSaveResponse;
   ```

   `_defaultStorageAdapter.save` 호출이 먼저 이루어지므로 새 양식 항목에 대한 기본 키가 생성됩니다. 이 기본 키는 `Response` 객체에서 검색되어 `fielId`을 생성합니다.

## 스토리지 어댑터 배포 및 테스트

이전과 동일한 `deploy` 명령을 사용하여 스토리지 어댑터를 배포합니다. 모듈 루트 실행에서

```bash
./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

이제 작동하는지 확인합니다.

1. **사이트 메뉴** &rarr; **콘텐츠** &rarr; **양식** 의 양식 애플리케이션으로 이동합니다.

1. **추가** 버튼 ![Add](./../../../images/icon-add.png) 을 클릭하여 양식 작성기를 엽니다.

1. Form Builder 보기에서 **옵션** 버튼(![Options](./../../../images/icon-options.png))을 클릭하고 **설정** 창을 엽니다.

1. **Select a Storage Type** 이라는 선택 목록 필드에서 **R2F1 Dynamic Data Mapping Storage Adapter** 유형을 선택하고 **완료** 를 클릭합니다.

1. [텍스트 필드](../creating-and-managing-forms/creating-forms.md) 을 양식에 추가하고 양식을 게시한 다음 몇 번 제출하십시오.

1. 양식 레코드가 컨테이너의 파일 시스템에 기록되었는지 확인하려면 로그를 확인하십시오. 다음과 같은 메시지가 표시됩니다.

   ```bash
   WARN  [http-nio-8080-exec-5][R2F1DDMStorageAdapter:82] Acme storage adapter's save method was invoked
   WARN  [http-nio-8080-exec-5][R2F1DDMStorageAdapter:134] Saved a file with the ID42088
   WARN  [http-nio-8080-exec-5][R2F1DDMStorageAdapter:61] Acme storage adapter's get method was invoked
   WARN  [http-nio-8080-exec-5][R2F1DDMStorageAdapter:112] Reading the file with the ID 42088: {"availableLanguageIds":["en_US"],"defaultLanguageId":"en_US","fieldValues":[{"instanceId":"EJ5UglA1","name":"Field51665758","value":{"en_US":"Stretched limousine"}}]}
   ```

## 결론

`DDMStorageAdapter`을 구현하면 원하는 저장 형식으로 양식 레코드를 저장할 수 있습니다.
