---
toc:
  - ./objects/creating-and-managing-objects.md
  - ./objects/using-forms-with-objects.md
  - ./objects/using-fragments-to-build-forms.md
  - ./objects/deploying-object-widgets-to-sites.md
  - ./objects/displaying-object-entries.md
  - ./objects/displaying-object-entries-with-collection-providers.md
  - ./objects/enabling-workflows-for-objects.md
  - ./objects/picklists.md
  - ./objects/understanding-object-integrations.md
  - ./objects/objects-application-permissions.md
  - ./objects/integrating-objects-with-third-party-services.md
---
# 개체

{bdg-secondary}`liferay 7.4+`

Liferay Objects를 사용하면 코드를 작성하거나 모듈을 배포할 필요 없이 애플리케이션을 구축하고 제공할 수 있습니다. Objects로 구축된 각 애플리케이션은 Liferay의 핵심 프레임워크와 통합되므로 원활한 사용자 경험을 유지하면서 Liferay DXP를 비즈니스 요구에 맞게 조정하는 유연한 솔루션을 신속하게 개발하고 관리할 수 있습니다.

객체 정의를 생성할 때 데이터 [필드](./objects/creating-and-managing-objects/fields.md), [관계](./objects/creating-and-managing-objects/relationships.md)를 추가할 수 있습니다. )를 다른 정의로 변환하고 지정된 조건에서 실행되는 [액션](./objects/creating-and-managing-objects/actions.md) 를 추가합니다. 또한 [레이아웃](./objects/creating-and-managing-objects/layouts.md) 및 [뷰](./objects/creating-and-managing-objects/views.md)를 디자인하여 필드 및 관리 방식을 결정할 수도 있습니다. 관계는 항목 생성 중과 개체의 응용 프로그램 페이지에 나타납니다.

생성 시점부터 모든 객체는 Liferay의 [프레임워크](./core-frameworks.md) 와 완전히 통합되어 플랫폼 전반에 걸쳐 통합된 경험을 제공하고 Liferay의 모든 기능을 활용합니다. 여기에는 모든 개체에 대해 자동으로 [헤드리스 REST API](./objects/understanding-object-integrations/using-custom-object-apis.md) 이 생성되므로 정의된 엔드포인트를 통해 개체와 상호 작용할 수 있습니다. 이러한 API는 [Job Scheduler](./core-frameworks/job-scheduler-framework/using-job-scheduler.md) 통합과 함께 사용하여 Talend 작업을 구성하여 개체 데이터를 외부 시스템과 동적으로 동기화할 수도 있습니다.

모든 개체는 [워크플로](./objects/enabling-workflows-for-objects.md) 과 통합되므로 정의된 검토 및 승인 프로세스를 통해 개체 항목 생성을 안내할 수 있습니다. 개체는 [Forms](objects/using-forms-with-objects.md) 에도 통합되어 개체 필드에 매핑되고 개체 항목 생성을 위한 사용자 입력을 받는 양식을 디자인할 수 있습니다.

항목이 생성되면 Liferay의 정보 프레임워크를 활용하여 페이지 조각 및 표시 페이지 템플릿을 [하여 객체](./objects/displaying-object-entries.md) 을 표시함으로써 동적 사용자 경험을 생성할 수 있습니다. 사이트 페이지에 개체를 [위젯](./objects/deploying-object-widgets-to-sites.md) 로 추가할 수도 있습니다.

모든 객체는 Liferay의 [권한 프레임워크](./objects/understanding-object-integrations/permissions-framework-integration.md) 과 통합되어 있으므로 애플리케이션 및 리소스 권한을 할당하여 객체 및 해당 항목에 대한 액세스를 관리할 수 있습니다. 범위 지정과 함께 역할 기반 액세스 제어를 사용하면 데이터를 보호하고 적절한 사용자만 액세스할 수 있도록 할 수 있습니다.

객체를 사용하면 객체 프레임워크에 등록된 [시스템 서비스](./objects/creating-and-managing-objects/extending-system-objects.md) 확장하고 구성할 수도 있습니다. 여기에는 사용자 지정 관계 및 작업 추가가 포함됩니다. <!--TASK: Add fields when ready.-->

[객체 생성](./objects/creating-and-managing-objects/creating-objects.md) 참조하여 사용자 정의 애플리케이션 구축을 시작하거나 [객체 통합 이해](./objects/understanding-object-integrations.md) 참조하여 객체가 Liferay의 핵심 프레임워크를 활용하는 방법에 대해 자세히 알아보세요.

<!--
## Modeling Data Structures

Fields, Relationships

## Implementing Business Logic

Actions, Validations, Notifications

## Integrating with External Systems

Proxy, APIs

## Designing User Interfaces

-->
