---
toc:
  - ./implementing-business-logic/validating-fields.md
  - ./implementing-business-logic/managing-access-to-data.md
  - ./implementing-business-logic/defining-a-state-field.md
  - ./implementing-business-logic/adding-an-approval-workflow.md
  - ./implementing-business-logic/adding-notification-templates.md
  - ./implementing-business-logic/adding-notification-actions.md
  - ./implementing-business-logic/automating-account-creation.md
---
# 비즈니스 로직 구현

비즈니스 로직은 비즈니스 요구 사항을 충족하기 위해 시스템 내에서 애플리케이션이 작동하는 방식을 결정하는 규칙 및 프로세스를 나타냅니다. 비즈니스 논리를 효과적으로 구현하면 운영을 간소화하고 효율성을 향상하며 조직 전체의 일관성을 높일 수 있습니다.

예를 들면,

* [필드 유효성 검사](#validations)
* [데이터 액세스 관리](#permissions)
* [워크플로우 정의](#workflows)
* [알림 자동화](#notifications)


<!--TASK:
* Integrating with External Systems
* Calculations
* Data Transformation
* Localization
* Logging

Use cron...
-->

## 검증

유효성 검사는 사용자 입력이 기준을 충족하는지 확인하기 위한 규칙을 설정합니다. 애플리케이션은 입력 시점에서 데이터를 검증함으로써 데이터가 필수 형식, 유형 및 제약 조건을 충족하는지 확인하여 데이터 오류를 방지하고 수동 데이터 정리의 필요성을 줄일 수 있습니다. 이러한 방식으로 검증을 통해 수집된 데이터(예: 이메일 주소, 전화번호)의 무결성과 일관성을 향상시킬 수 있습니다. 여기에서는 개체 정의에 유효성 검사 규칙을 직접 추가합니다. Liferay는 이러한 규칙을 사용하여 항목 제출 시 필드 값을 확인합니다. 값이 유효하지 않으면 Liferay는 오류 메시지를 표시합니다.

![Liferay는 유효성 검사 규칙을 사용하여 항목 제출 시 필드 값을 확인합니다.](./implementing-business-logic/images/01.png)

## 권한

데이터에 대한 액세스를 관리하는 것은 데이터 개인정보 보호 및 보안에 필수적입니다. 역할 권한 및 계정 멤버십을 사용하여 민감한 개체 데이터에 대한 액세스를 제한할 수 있습니다. 이러한 권한은 애플리케이션 및 항목 수준에서 관리할 수 있습니다.

![권한 및 계정 멤버십을 사용하여 개체 데이터에 대한 액세스를 관리합니다.](./implementing-business-logic/images/02.png)

## 워크플로우

워크플로는 애플리케이션 엔터티에 대한 승인 프로세스를 정의하고 작업 가시성을 향상시키고 비즈니스 프로세스의 병목 현상을 제거하며 작업을 완료하는 데 필요한 시간과 리소스를 줄일 수 있습니다. 사용자 정의 개체에 대한 사용자 정의 승인 프로세스를 구축하고 활성화할 수 있습니다. 또한 선택 목록을 사용하여 자체 흐름으로 사용자 정의 상태 필드를 정의할 수 있습니다.

![개체에 상태 필드를 추가합니다.](./implementing-business-logic/images/03.png)

## 알림

알림은 사용자와 시스템 관리자에게 객체 입력 이벤트에 대한 실시간 업데이트를 제공하여 애플리케이션의 가시성을 향상시킬 수 있습니다. 여기에는 알림 템플릿을 만든 다음 해당 템플릿을 개체 작업과 함께 사용하는 작업이 포함됩니다. 템플릿은 알림 내용과 디자인을 제공하는 반면, 개체 작업은 알림을 보내기 위한 트리거와 조건을 결정합니다(예: 항목 생성, 항목 업데이트 시).

![개체 작업과 함께 알림 템플릿을 사용하여 항목 이벤트에 대한 알림을 자동화합니다.](./implementing-business-logic/images/04.png)

## 배포자 애플리케이션 흐름에 대한 비즈니스 로직 구현

Distributor Application 개체를 모델링한 후에는 이 논리를 통합하여 솔루션이 Delectable Bonsai의 비즈니스 요구 사항을 충족하는지 확인할 수 있습니다. 일단 구현되면 유통업체를 빠르고 안전하게 온보딩할 수 있습니다.

준비가 된?

[갑시다!](./implementing-business-logic/validating-fields.md)
