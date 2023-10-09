# 암호화된 필드

{bdg-primary}`자체 호스팅 및 자체 관리만 가능`

{bdg-secondary}`사용 가능 Liferay DXP 7.4 U72/GA72+`

Liferay는 민감한 사용자 데이터를 저장하기 위해 암호화된 필드 유형을 제공합니다. 암호화된 필드를 사용하려면 먼저 포털 속성에 암호화 알고리즘과 키를 추가하세요. 그런 다음 객체 정의에 암호화된 필드를 추가합니다. 데이터가 암호화되면 암호 해독 키를 가진 사용자만 데이터를 읽을 수 있습니다.

```{important}
암호화된 필드는 문자열 값을 저장하며 이미지나 파일 형식을 암호화하는 데 사용할 수 없습니다. 암호화된 필드에는 필터링, 정렬 및 인덱싱이 지원되지 않습니다. 또한 [프록시 객체 정의](../../integrating-objects-with-third-party-services/managing-data-from-external-systems.md)에는 필드 암호화를 사용할 수 없습니다.
```

## 암호화 알고리즘 및 키 추가

객체에 대한 암호화 알고리즘 및 키를 사용하려면 다음 속성을 [`Portal-ext.properties`](../../../../installation-and-upgrades/reference/portal-properties.md) 파일에 추가해야 합니다.

```properties
object.encryption.algorithm=[value]

object.encryption.key=[value]
```

지원되는 알고리즘 값에는 `AES`, `Blowfish`및 `DES`가 포함됩니다. 암호화 키 값은 base64 인코딩을 사용해야 합니다. 예를 들어:

```properties
object.encryption.algorithm=AES

object.encryption.key=D9z5Rwxkn+8SctNWW/q/OA==
```

## 암호화된 필드 추가

1. *전역 메뉴* ( ![Global Menu](../../../../images/icon-applications-menu.png) )을 열고 *제어판* 탭으로 이동한 다음 *개체*클릭합니다.

1. 원하는 객체 정의 편집을 시작합니다.

1. *Fields* 탭으로 이동하여 *Add* ( ![Add Button](../../../../images/icon-add.png) )을 클릭합니다.

1. *라벨* 및 *필드 이름*입력합니다.

1. *암호화됨* 필드 유형을 선택합니다.

1. 필드가 필수인지 확인합니다.

1. *저장*클릭하세요.

   ```{note}
   암호화 알고리즘과 키가 없으면 암호화된 필드를 저장할 수 없습니다.
   ```

이 필드를 사용하여 암호화된 문자열 값을 저장할 수 있습니다. 원하는 경우 허용되는 문자 수에 따라 필드 제한을 구성할 수 있습니다.

## 암호화된 데이터에 접근하기

암호 해독 키가 있는 사용자만 암호화된 필드 값을 읽을 수 있습니다. Liferay 인스턴스에 유효한 암호화 키가 있는 경우 권한 있는 사용자는 Liferay UI 또는 REST API를 통해 필드의 데이터를 보고 내보낼 수 있습니다. 그러나 암호화 키가 분실되거나 유효하지 않게 되면 사용자는 암호화된 필드가 있는 개체 정의에 대한 항목에 액세스하거나 내보낼 수 없습니다. 시도하면 Liferay는 400 오류를 반환하고 사용자에게 유효한 암호화 키를 삽입하거나 객체의 암호화된 필드를 제거하여 항목을 복구하도록 지시합니다.

```{important}
키를 분실하면 데이터가 손실될 수 있습니다. 암호화 키를 주의 깊게 관리하시기 바랍니다. 귀하는 귀하의 데이터와 키를 안전한 장소에 백업하고 보관할 책임이 있습니다.

<!-- 키가 손상된 경우 가져오기/내보내기 센터를 사용하여 개체 데이터를 내보내고 'object.encryption.key' 속성을 업데이트한 후 데이터를 다시 가져오세요. -->
```

## 관련 주제

* [문맥 재산](../../../../installation-and-upgrades/reference/portal-properties.md)
* [객체에 필드 추가](./adding-fields-to-objects.md)
