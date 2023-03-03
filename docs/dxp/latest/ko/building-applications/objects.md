---
toc:
- ./objects/creating-and-managing-objects.md
- ./objects/objects-tutorials.md
- ./objects/using-forms-with-objects.md
- ./objects/using-fragments-to-build-forms.md
- ./objects/deploying-object-widgets-to-sites.md
- ./objects/displaying-object-entries.md
- ./objects/enabling-workflows-for-objects.md
- ./objects/picklists.md
- ./objects/understanding-object-integrations.md
- ./objects/objects-application-permissions.md
- ./objects/integrating-objects-with-third-party-services.md
---
# 객체

```{toctree}
:maxdepth: 3

objects/creating-and-managing-objects.md
objects/objects-tutorials.md
objects/using-forms-with-objects.md
objects/using-fragments-to-build-forms.md
objects/deploying-object-widgets-to-sites.md
objects/displaying-object-entries.md
objects/enabling-workflows-for-objects.md
objects/picklists.md
objects/understanding-object-integrations.md
objects/objects-application-permissions.md
objects/integrating-objects-with-third-party-services.md
```

{bdg-secondary}`사용 가능한 Liferay DXP/Portal 7.4+`

Liferay Objects를 사용하면 코드를 작성하거나 모듈을 배포하지 않고도 애플리케이션을 구축하고 제공할 수 있습니다. Objects로 구축된 각 애플리케이션은 Liferay의 핵심 프레임워크와 통합되므로 원활한 사용자 경험을 유지하면서 Liferay DXP를 비즈니스 요구에 맞게 조정하는 유연한 솔루션을 신속하게 개발하고 관리할 수 있습니다.

개체를 생성할 때 데이터 [분야](./objects/creating-and-managing-objects/fields.md) 를 정의하고 [relationships](./objects/creating-and-managing-objects/relationships를 추가할 수 있습니다. md) 를 다른 개체 항목에 지정하고 지정된 조건에서 [액션](./objects/creating-and-managing-objects/actions.md) 를 트리거합니다. 또한 [레이아웃](./objects/creating-and-managing-objects/layouts.md) 및 [전망](./objects/creating-and-managing-objects/views.md) 를 디자인하여 필드 및 관계는 항목 작성 중에 그리고 개체의 응용 프로그램 페이지에 표시됩니다.

게시하기 전에 각 개체의 데이터 범위를 회사 또는 사이트로 지정하고 Liferay UI에서 표시되는 사이트를 결정할 수 있습니다.

생성 시점부터 모든 객체는 Liferay의 [핵심 프레임워크](./core-frameworks.md) 와 완전히 통합되어 플랫폼 전체에서 통합된 경험을 제공하고 Liferay의 모든 기능을 활용합니다. 여기에는 모든 개체에 대해 [개의 헤드리스 REST API](./objects/understanding-object-integrations/headless-framework-integration.md) 를 자동으로 생성하는 것이 포함되므로 정의된 끝점을 통해 개체와 상호 작용할 수 있습니다. 또한 이러한 API는 [Job Scheduler](./core-frameworks/job-scheduler-framework/using-job-scheduler.md) 통합과 함께 사용하여 객체 데이터를 외부 시스템과 동적으로 동기화하도록 Talend 작업을 구성할 수 있습니다.

모든 개체는 [워크플로우](./objects/enabling-workflows-for-objects.md)과 통합되어 정의된 검토 및 승인 프로세스를 통해 개체 항목 생성을 안내할 수 있습니다. 개체는 [Forms](objects/using-forms-with-objects.md)과도 통합되므로 개체 필드에 매핑되는 양식을 디자인하고 개체 항목을 만들기 위한 사용자 입력을 받을 수 있습니다.

항목이 생성되면 Liferay의 정보 프레임워크를 활용하여 페이지 조각 및 디스플레이 페이지 템플릿을 사용하여 [개체 항목 표시](./objects/displaying-object-entries.md) 동적 사용자 경험을 생성할 수 있습니다. Liferay DXP 7.4 U1 및 Liferay Portal 7.4 GA5부터 [사이트 페이지에 개체 배포](./objects/deploying-object-widgets-to-sites.md)를 위젯으로 사용할 수도 있습니다.

모든 개체는 Liferay의 [권한 프레임워크](./objects/understanding-object-integrations/permissions-framework-integration.md)와 통합되므로 개체 및 해당 항목에 대한 액세스를 관리하기 위해 응용 프로그램 및 리소스 권한을 할당할 수 있습니다. 범위 지정과 함께 역할 기반 액세스 제어를 사용하면 데이터를 보호하고 적절한 사용자만 액세스할 수 있도록 할 수 있습니다.

객체를 사용하면 객체 프레임워크에 등록된 [시스템 서비스](./objects/creating-and-managing-objects/extending-system-objects.md) 를 확장하고 구성할 수도 있습니다. 여기에는 사용자 지정 관계 및 작업 추가가 포함됩니다. <!--TASK: Add fields when ready.-->

객체가 Liferay의 핵심 프레임워크를 활용하는 방법에 대한 자세한 내용은 [객체 생성](./objects/creating-and-managing-objects/creating-objects.md) 을 참조하여 맞춤형 애플리케이션 구축을 시작하거나 [객체 통합 이해](./objects/understanding-object-integrations.md) 을 참조하십시오.

```{raw} html
:file: ../landingpage_template.html
```

```{raw} html
:file: objects/landing.html
```
