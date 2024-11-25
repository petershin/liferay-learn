---
toc:
  - ./liferay-authentication/other-authentication-methods.md
  - ./liferay-authentication/authorization.md
visibility:
  - Employee
  - Partner
---
# 라이프레이 인증

**한눈에**

* 대부분의 잠재 고객에게는 인증된 애플리케이션이 필요합니다.
* 인증은 애플리케이션에 로그인할 수 있는 사람을 결정합니다.
* 승인은 로그인 후 수행할 수 있는 작업을 결정합니다.
* Liferay는 자체 ID 관리 기능을 제공합니다.
* Liferay 인증은 독립형 및 독립형 고객 애플리케이션에 충분합니다.

```{note}
* 이 모듈의 라이브 워크숍에서 [recording](https://learn.liferay.com/c/portal/login?p_l_id=3026&redirect=%2Fweb%2Fguest%2Fd%2Fse1-3-liferay-authentication) 을 확인하세요.
* 라이브 워크숍에 사용된 프레젠테이션 [PDF](https://learn.liferay.com/c/portal/login?redirect=%2Fdocuments%2Fd%2Fguest%2Fse1-3-liferay-authentication-pdf) 을 다운로드하세요.
```

## 배경

지금까지 데모에서는 [공개 페이지](./public-pages-experience.md) 개만 다루었습니다. 이러한 유형의 페이지는 공용 웹사이트와 같은 애플리케이션에 적합하지만 많은(대부분은 아니지만) Liferay 애플리케이션의 경우 시스템에 액세스할 수 있는 사람과 시스템에 도달한 후 수행할 수 있는 작업을 제어해야 합니다.

이 모듈에서는 Liferay가 모든 사람의 로그인이 허용되지 않는 애플리케이션을 지원하기 위해 제공하는 일종의 기능을 다룹니다. 로그인하더라도 반드시 모든 것에 액세스할 수 있는 것은 아닙니다.

이 모듈에서는 다음을 지원하기 위해 Liferay에서 제공하는 기능을 다룹니다.

* 인증
* 인증

## 인증과 승인

모든 사람은 시스템 로그인(예: 전화나 은행 계좌 로그인)에 익숙합니다. 오늘날 기술은 지문, 얼굴 인식 또는 보안 코드 및 비밀번호와 같은 보다 전통적인 방법을 사용하여 이를 수행하는 다양한 방법을 제공합니다.

때때로 이러한 기술의 조합이 사용됩니다. 이 경우 시스템은 다중 요소 인증(MFA)을 활용합니다.

사용자가 시스템에 "로그인"할 때 두 가지 개별적이지만 관련된 작업인 인증과 권한 부여가 발생한다는 점을 인식하는 것이 중요합니다.

**인증**

간단하게 설명하면 인증은 사용자가 자신이 누구인지 식별하여 시스템에 액세스할 수 있는지 여부를 결정하는 프로세스입니다.

**인증**

사용자가 인증되면 권한 부여는 사용자에게 액세스가 허용되는 정보, 즉 볼 수 있는 정보, 새 정보 생성, 기존 정보 편집 또는 정보 삭제가 허용되는지 여부를 결정하는 프로세스입니다.

비유하자면, 인증 과정은 자물쇠를 여는 것과 같다고 생각할 수 있습니다. Liferay DXP를 사용하면 사용자를 인증할 수 있는 다양한 유형의 잠금 장치를 사용할 수 있습니다.

## 라이프레이 인증

Liferay에는 관리자가 다음을 수행할 수 있는 자체 ID 관리 기능이 포함되어 있습니다.

* 사용자 생성
* 비밀번호를 정의하세요.
* 액세스할 수 있는 항목 지정

클라이언트 포털 또는 전용 내부 시스템과 같이 로그인할 수 있는 제한된 사용자 집합이 있는 일부 독립 실행형 또는 자체 포함 고객 애플리케이션의 경우 이러한 기능은 요구 사항을 충족하기에 충분합니다.

데모 중에 Liferay의 인증 기능에 대해 이야기할 때 Liferay가 사용자를 인증할 수 있는 세 가지 방법을 제공한다는 점을 설명하는 것이 유용합니다.

* 사용자 이름
* Email.address
* 사용자 아이디

판매 프로세스의 이 단계에서는 일반적으로 이러한 기능에 대해 높은 수준에서 설명하는 것으로 충분합니다. 고객이 간단한 사용 사례에 대해 별도의 ID 관리 시스템이 필요하지 않다는 사실만으로도 충분합니다.

그러나 Liferay는 관리자가 다음을 포함하는 비밀번호 정책을 정의할 수 있도록 허용하는 등 기본 인증과 함께 다양한 추가 기능을 제공합니다.

* 비밀번호의 최소 길이
* 비밀번호에 포함되어야 하는 문자
* 만료 빈도
* 이전 비밀번호를 재사용할 수 있는지 여부
* 등.

로그인이 표시되는 대부분의 데모는 Liferay의 자체 ID 관리 기능을 사용한다는 점을 기억하는 것도 중요합니다. 그러나 프로덕션 애플리케이션에 사용할 수 있는 다른 접근 방식도 많이 있으며 그 중 일부는 다음과 같습니다.

* OpenId Connect
* SAML
* 싱글 사인온(SSO)
* 신원 관리 시스템

이들 모두는 다음 섹션인 [인증 방법](./liferay-authentication/other-authentication-methods.md)에서 논의됩니다.
