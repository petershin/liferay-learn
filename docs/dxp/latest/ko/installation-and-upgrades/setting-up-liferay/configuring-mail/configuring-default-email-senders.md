# 기본 이메일 발신자 구성

기본적으로 Liferay DXP에서 보낸 이메일은 이름과 이메일 주소를 기본 관리 사용자로 사용합니다. 이 동작은 서로 다른 이메일 유형 각각에 대해 구성할 수 있습니다.

## 기본 이메일 발신자 변경

기본 이메일 발신자를 변경하려면 다음 단계를 따르세요.

1. **제품 메뉴** 을 열고 **제어판으로 이동합니다.** → **구성** → **인스턴스 설정** .

    ![인스턴스 설정 메뉴에서 이메일 구성 옵션을 찾습니다.](./configuring-default-email-senders/images/01.png)

1. **이메일** 을 클릭합니다.

1. **이메일 보낸 사람** 을 클릭합니다.

1. 다음 필드에 값을 입력하십시오.

    * 이름
    * 주소

    ![기본 이메일 발신자 이름 및 이메일 주소 변경.](./configuring-default-email-senders/images/02.png)

1. **저장** 을 클릭합니다.

### 포털 속성을 사용하여 기본 이메일 발신자 구성

기본 이메일 발신자는 [`Portal-ext.properties` 파일](../../reference/portal-properties.md)을 사용하여 구성할 수도 있습니다. 다음 속성 값을 자신의 값으로 바꿀 수 있습니다.

```properties
admin.email.from.name=Joe Bloggs
admin.email.from.address=test@domain.invalid
```

## 공지사항 이메일 발신자 변경

공지 사항 애플리케이션은 고유한 발신자를 사용합니다. 알림 이메일의 보낸 사람 이름과 주소를 구성하려면 `portal-ext.properties` 파일을 사용해야 합니다. 다음 속성 값을 자신의 값으로 바꿉니다.

```properties
announcements.email.to.name=
announcements.email.to.address=noreply@domain.invalid
```

## 블랙리스트에 오른 이메일

다음 이메일은 기본적으로 블랙리스트에 포함되며 DXP 설치에서 사용할 수 없습니다.

* `noreply@liferay.com`
* `test@liferay.com`
* `noreply@domain.invalid`
* `test@domain.invalid`

위의 이메일을 사용하려고 하면 `WARN` 추적이 기록됩니다.

```bash
Email xxx will be ignored because it is included in mail.send.blacklist
```
## 관련 주제

* [메일 구성](../configuring-mail.md)
* [대체 이메일 구성 방법](./alternative-email-configuration-methods.md)
* [문맥 재산](../../reference/portal-properties.md)