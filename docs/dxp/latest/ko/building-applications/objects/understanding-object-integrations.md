---
toc:
- ./understanding-object-integrations/permissions-framework-integration.md
- ./understanding-object-integrations/headless-framework-integration.md
- ./understanding-object-integrations/assets-framework-integration.md
---
# 개체 통합 이해

```{toctree}
:maxdepth: 3

understanding-object-integrations/permissions-framework-integration.md
understanding-object-integrations/headless-framework-integration.md
understanding-object-integrations/assets-framework-integration.md
```

게시된 사용자 지정 개체는 Liferay의 핵심 프레임워크와 통합되므로 Liferay의 기능을 활용하여 플랫폼 전체에서 통합된 경험을 구축할 수 있습니다. 이 차트는 개체가 이러한 통합을 활용하는 방법에 대한 개요를 제공합니다.

| 뼈대       | 묘사                                                                                                                                                                                                                                                                                                                                                                                                                   |
|:-------- |:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 애셋       | [첨부 파일 필드](./creating-and-managing-objects/fields/attachment-fields.md) 을 사용하여 인스턴스의 문서 라이브러리에 파일을 업로드합니다.                                                                                                                                                                                                                                                                                                           |
| 감사       | [감사 애플리케이션](./creating-and-managing-objects/auditing-object-definition-events.md) 을 사용하여 사용자 및 리소스 정보와 함께 개체 이벤트를 검토합니다.                                                                                                                                                                                                                                                                                             |
| 분류       | 사용자 정의 개체 레이아웃에 범주화 도구를 추가하여 사용자가 항목에 태그 [개와 범주](./creating-and-managing-objects/layouts/designing-object-layouts.md#adding-categorization) 를 추가할 수 있도록 합니다.                                                                                                                                                                                                                                                         |
| 목이 없는    | Liferay는 게시된 각 객체에 대해 [헤드리스 엔드포인트](./understanding-object-integrations/headless-framework-integration.md) 을 생성하므로 REST 호출을 할 수 있습니다. <!-- TASK: Add GraphQL when supported.--> |
| 정보 프레임워크 | [표시 페이지 템플릿](../../site-building/displaying-content/using-display-page-templates.md), [단편](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments.md), [탐색 메뉴](../../site-building/site-navigation/using-the-navigation-menus-application.md)와 함께 객체 데이터 사용 . Liferay는 항목을 표시하기 위해 [Collection Provider](../../content-authoring-and-management/collections-and-collection-pages.md) 도 생성합니다. |
| 지역화      | 글로벌 사용자에게 더 나은 서비스를 제공하기 위해 개체 정의 필드를 현지화합니다.                                                                                                                                                                                                                                                                                                                                                                        |
| 권한       | 개체 정의 및 해당 데이터에 대한 액세스를 제어하기 위해 애플리케이션 및 리소스 권한을 관리합니다.                                                                                                                                                                                                                                                                                                                                                              |
| 워크플로우    | 개체 항목의 생성, 검토 및 게시를 지시하기 위해 개체에 대한 사용자 정의 워크플로를 활성화합니다.                                                                                                                                                                                                                                                                                                                                                              |

<!-- TASK: Add the following integrations when ready -->
<!-- | Job Scheduler | Use the \[Job Scheduler\](../core-frameworks/dispatch-framework/using-job-scheduler.md) application to run Talend data integration tasks (e.g., bulk imports, data syncs). You can run them manually or schedule them to run at regular intervals. |--> <!-- | Publications |  | -->

```{raw} html
:file: ../../landingpage_template.html
```

```{raw} html
:file: understanding-object-integrations/landing.html
```
