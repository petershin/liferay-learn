# 양식 저장소 어댑터 이해

> 사용 가능: Liferay DXP 7.3 및 [LPS-97208](https://issues.liferay.com/browse/LPS-97208) 에 대한 수정 사항이 포함된 Liferay DXP 7.2 버전(Liferay DXP 7.2 SP3용으로 계획됨).

사용자가 양식 레코드를 추가하면 양식 API는 스토리지 어댑터 API를 통해 요청 처리를 라우팅합니다. 양식 항목(읽기, 업데이트 및 삭제)에서 수행되는 다른 *CRUD* 작업에 대해서도 마찬가지입니다. 스토리지 서비스의 기본 구현은 `DefaultDDMStorageAdapter`이며 이름에서 알 수 있듯이 JSON 형식으로 양식 항목 데이터를 저장하기 위해 `DDMStorageAdapter` 인터페이스를 구현합니다.

DDM(Dynamic Data Mapping</em> 백엔드는 양식 레코드의 다른 저장 형식에 *적응할 수 있습니다. 이를 통해 양식 데이터를 기본 JSON 대신 XML 또는 YAML(또는 원하는 형식)로 쉽게 직렬화할 수 있습니다. 그런 다음 Liferay 데이터베이스를 포함하여 어디에나 양식 데이터를 저장하도록 선택할 수 있습니다.</p>

```{important}
새로 추가된 스토리지 어댑터는 새 양식에만 사용할 수 있습니다. 기존의 모든 Forms는 생성 시 선택한 어댑터(기본적으로 JSON)를 계속 사용하며 다른 스토리지 어댑터를 선택할 수 없습니다.
```

## 양식 레코드 저장

기본 JSON 구현은 저장 요청에 저장된 부울 값 `isInsert`에 따라 다르게 응답합니다. true인 경우 새 양식 레코드를 추가하기 위한 논리가 호출되고 false인 경우 대신 업데이트가 발생합니다. 이 논리는 메서드 `삽입` 및 `업데이트`에 포함되어 있습니다. `DDMStorageAdapter` 구현이 이 패러다임을 설명하는지 확인하십시오.

## 양식 레코드 직렬화 및 역직렬화

양식 레코드를 직렬화 및 역직렬화하기 위한 기본 형식은 JSON입니다. [예제 프로젝트](./writing-a-form-storage-adapter.md) 은 이 기본 형식의 사용을 보여줍니다. `DDMContent` 을 다른 형식으로 저장하려면 추가 인터페이스를 구현해야 합니다.

**직렬화:** `DDMcontent`를 저장할 때 `DDMFormValues` 개체를 대상 스토리지 형식으로 변환해야 합니다.

**역직렬화:** `DDMContent` (스토리지 어댑터의 `get` 메서드에서)을 읽을 때 스토리지 형식에서 `DDMStorageAdapterGetResponse`의 `빌더` 생성자가 요구하는 `DDMFormValues` 개체로 다시 변환되어야 합니다.

이 직렬화 논리에 대해 구현할 `개의 DDMFormValuesSerializer` 인터페이스와 역직렬화 논리에 대해 구현할 `DDMFormValuesDeserializer` 인터페이스가 있습니다. `DDMFormValues` 객체를 JSON으로 또는 그 반대로 변환하는 것을 지원하는 Liferay의 기본 구현은 각각 [여기](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/dynamic-data-mapping/dynamic-data-mapping-service/src/main/java/com/liferay/dynamic/data/mapping/internal/io/DDMFormValuesJSONSerializer.java) 및 [여기](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/dynamic-data-mapping/dynamic-data-mapping-service/src/main/java/com/liferay/dynamic/data/mapping/internal/io/DDMFormValuesJSONDeserializer.java)에서 찾을 수 있습니다.

전체 예제는 [Form Storage Adapter 작성](./writing-a-form-storage-adapter.md)을 참조하십시오.
