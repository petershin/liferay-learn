# 비밀번호 정책 구성

암호 정책은 설치 보안을 강화합니다. Liferay(수정 또는 그대로)와 함께 제공되는 기본 정책을 사용하거나 자체 정책을 생성할 수 있습니다. 정책은 사용자 또는 조직에 할당할 수 있습니다.

```{note}
새 사용자는 기본적으로 기본 암호 정책에 할당됩니다. 사용자를 사용자 지정 암호 정책과 연결하려면 해당 정책의 구성원으로 할당해야 합니다.
```

## 개요

1. [기본 비밀번호 정책 수정](#modifying-the-default-password-policy)
1. [사용자 지정 암호 정책 만들기](#creating-a-custom-password-policy)
1. [비밀번호 정책에 구성원 할당](#assigning-members-to-a-password-policy)
1. [속성 파일 활용](#using-the-properties-file)
1. [암호 속성 참조](#password-properties-reference)

## 기본 비밀번호 정책 수정

기본 정책을 변경하려면,

1. *제어판* &rarr; *보안* &rarr; *비밀번호 정책*로 이동합니다.

1. Default Password Policy 옆에 있는 Actions 버튼(![Actions](../../images/icon-actions.png))을 클릭하고 *Edit*를 클릭합니다.

   ![정책을 변경하려면 편집을 클릭하십시오.](./configuring-a-password-policy/images/01.png)

1. 구성 창에서 원하는 대로 변경합니다.

   ![구성 창에서 원하는 대로 변경합니다.](configuring-a-password-policy/images/02.png)

1. 완료되면 *저장*을 클릭합니다.

### 정책 구성 참조

**암호 변경:** 암호 변경을 허용하거나 금지하고 암호 재설정 링크의 유효성에 대한 시간 제한을 설정합니다.

**암호 구문 검사:** 암호를 선택할 때 특정 구문이 필요합니다. 이 섹션에서 사전 단어를 허용하지 않거나 최소 길이를 설정하는 등의 작업을 할 수 있습니다.

**암호 기록:** 기록에 보관할 암호 수를 결정하여 이전 암호가 재사용되는 것을 방지합니다.

**비밀번호 만료:** 비밀번호가 만료된 경우 비밀번호 유효 기간, 경고 전송 시기 및 여부, *Grace Limit*: 비밀번호가 만료된 후 비밀번호를 강제로 변경하기 전에 허용되는 로그인 횟수를 지정합니다.

**잠금:** 계정이 잠기기 전에 최대 인증 시도 실패 횟수, 시도 횟수가 저장되는 기간 및 잠금이 지속되는 시간을 설정합니다.

## 사용자 지정 암호 정책 만들기

사용자 지정 암호 정책은 일부 시나리오에서 유용할 수 있습니다. 예를 들어 특정 사용자 또는 사용자 그룹이 더 엄격한 암호 규칙을 갖기를 원할 수 있습니다. 사용자 지정 정책을 만들려면

1. *제어판* &rarr; *보안* &rarr; *암호 정책*로 이동합니다.

1. *추가* 아이콘(![Add](../../images/icon-add.png))을 클릭하여 새 정책을 추가합니다.

1. 구성 창에서 암호 정책에 대한 이름 및 설명을 제공합니다.

1. 정책의 속성을 설정합니다(위 참조). 완료되면 *저장*을 클릭합니다.

## 비밀번호 정책에 구성원 할당

1. 암호 정책 옆에 있는 *작업* 버튼(![Actions button](../../images/icon-actions.png))을 클릭합니다. *구성원 할당*을 클릭합니다.

   ![구성원 할당 링크를 클릭합니다.](configuring-a-password-policy/images/03.png)

1. 암호 정책에 개별 사용자 또는 조직을 추가할 수 있습니다. ** 추가 아이콘(![Add icon](../../images/icon-add.png))을 클릭하면 새 양식이 나타납니다.

1. 사용자 또는 조직을 선택합니다. 완료되면 *추가*을 클릭합니다.

   ![선택하고 추가 버튼을 클릭합니다.](configuring-a-password-policy/images/04.png)

   이제 사용자 또는 조직이 암호 정책과 연결됩니다.

## 속성 파일 사용

Liferay 인스턴스의 초기 설정 중에 [`Portal-ext.properties`](../../installation-and-upgrades/reference/portal-properties.md) 파일을 사용하여 사용자 정의 비밀번호 정책을 생성할 수 있습니다. 사용자 지정하려는 속성과 값을 파일에 추가합니다. 암호 정책의 이름을 추가해야 합니다.

예를 들어 최소 길이, 숫자, 기호를 요구하는 사용자 지정 암호 정책을 원할 경우 다음 값을 설정할 수 있습니다.

```properties
#
# Properties for a Custom Password Policy
#

...
passwords.default.policy.name=Custom Password Policy
passwords.default.policy.check.syntax=true
passwords.default.policy.min.length=10
passwords.default.policy.min.numbers=1
passwords.default.policy.min.symbols=1
...
```

```{note}
포털 속성을 사용하여 초기 Liferay 인스턴스 설정 중에만 사용자 정의 암호 정책을 생성할 수 있습니다. 나중에 수정하려면 제어판 UI를 사용해야 합니다. 기본 암호 정책을 수정하려면 제어판 UI도 사용해야 합니다.
```

암호 정책을 사용자 지정하는 데 사용할 수 있는 속성의 전체 목록은 아래 참조를 참조하십시오.

`portal-ext.properties` 파일이 있으면 [`[Liferay Home]`](../../installation-and-upgrades/reference/liferay-home.md) 폴더에 넣습니다. [포털 속성](../../installation-and-upgrades/reference/portal-properties.md) 또는 Docker를 사용하는 경우 [Docker 컨테이너 구성](../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/configuring-containers.md)에 대해 자세히 알아보세요.

## 암호 속성 참조

| 재산                                                | 기정값                      | 묘사                                                                 |
|:------------------------------------------------- |:------------------------ |:------------------------------------------------------------------ |
| `passwords.default.policy.allow.dictionary.words` | 여실한                      | 일반적인 사전 단어는 사용자의 비밀번호로 허용됩니다.                                      |
| `passwords.default.policy.changeable`             | 여실한                      | 사용자는 비밀번호를 변경할 수 있습니다.                                             |
| `passwords.default.policy.change.required`        | 여실한                      | 사용자는 처음 로그인할 때 비밀번호를 변경해야 합니다.                                     |
| `passwords.default.policy.check.syntax`           | 틀린                       | 암호는 특정 단어, 특정 길이, 특정 문자 등에 대해 확인됩니다.                               |
| `passwords.default.policy.expireable`             | 틀린                       | 설정된 시간이 지나면 암호 만료                                                  |
| `passwords.default.policy.grace.limit`            | 0                        | 사용자가 비밀번호가 만료된 후 새 비밀번호를 입력해야 하기 전에 로그인할 수 있는 횟수                   |
| `passwords.default.policy.history`                | 틀린                       | 사용자 비밀번호 기록을 유지하고 이전 비밀번호를 재사용하지 못하도록 방지                           |
| `passwords.default.policy.history.count`          | 6                        | 기록에 보관할 이전 암호의 수를 결정합니다.                                           |
| `passwords.default.policy.lockout`                | 틀린                       | 사용자는 계정이 잠기기 전에 특정 횟수만큼 로그인을 시도할 수 있습니다.                           |
| `passwords.default.policy.lockout.duration`       | 0                        | 사용자 계정이 잠긴 시간입니다. 관리자만 암호를 잠금 해제할 수 있는 경우 0입니다. 시간은 초 단위입니다        |
| `passwords.default.policy.max.age`                | 8640000                  | 암호를 변경하기 전에 암호가 유효한 기간을 결정합니다. 시간은 초 단위입니다                         |
| `passwords.default.policy.max.failure`            | 삼                        | 사용자가 잘못된 비밀번호로 로그인을 시도할 수 있는 최대 횟수                                 |
| `passwords.default.policy.min.age`                | 0                        | 사용자가 암호를 다시 변경하기 전에 기다려야 하는 시간을 결정합니다. 시간은 초 단위입니다                 |
| `passwords.default.policy.min.alphanumeric`       | 0                        | 사용자 비밀번호에 필요한 최소 영숫자 수                                             |
| `passwords.default.policy.min.length`             | 6                        | 사용자 비밀번호에 필요한 최소 길이                                                |
| `passwords.default.policy.min.lowercase`          | 0                        | 사용자 비밀번호에 필요한 최소 소문자 수                                             |
| `passwords.default.policy.min.numbers`            | 1                        | 사용자 비밀번호에 필요한 최소 숫자 수                                              |
| `passwords.default.policy.min.symbols`            | 0                        | 사용자 비밀번호에 필요한 최소 기호 수                                              |
| `passwords.default.policy.min.uppercase`          | 1                        | 사용자 비밀번호에 필요한 최소 대문자 수                                             |
| `passwords.default.policy.name`                   | 기본 비밀번호 정책               | 비밀번호 정책의 이름                                                        |
| `passwords.default.policy.regex`                  | (?=.{4})(?:[a-zA-Z0-9]*) | RegExpToolkit을 사용하여 암호를 생성하는 경우 암호를 생성하고 확인하는 데 사용할 정규식 패턴을 설정합니다. |
| `passwords.default.policy.reset.failure.count`    | 600                      | 실패한 로그인 기록이 사용자에 대해 유지되는 시간입니다. 시간은 초 단위입니다                        |
| `passwords.default.policy.reset.ticket.max.age`   | 86400                    | 비밀번호 재설정 링크의 유효 기간입니다. 시간은 초 단위입니다                                 |
| `passwords.default.policy.warning.time`           | 86400                    | 비밀번호가 만료되기 전까지 사용자에게 알림이 전송되는 시간입니다. 시간은 초 단위입니다                   |

## 추가 정보

* [인증 기본 사항](../../installation-and-upgrades/securing-liferay/authentication-basics.md)
