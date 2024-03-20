---
visibility:
  - Employee
  - Partner
---
# 클라이언트 확장으로 Liferay 확장

**한눈에 보기**

* Liferay 확장은 플랫폼의 잠재력을 최대한 활용하는 데 있어 중요한 측면입니다.
* 특정 비즈니스 요구 사항을 염두에 두고 Liferay를 사용자 정의하면 사용자 요구 사항에 맞는 디지털 경험을 만들 수 있습니다.
* 클라이언트 확장은 플랫폼 코어에서 분리된 Liferay를 확장하는 새로운 방법을 제공합니다.
* Liferay의 코어에서 사용자 정의 코드를 분리하면 더 빠르고 쉬운 업그레이드가 보장되고 개발자가 익숙한 언어와 프레임워크를 사용할 수 있습니다.

```{note}
* 이 모듈의 라이브 워크숍에서 [녹화](https://learn.liferay.com/c/portal/login?p_l_id=3026&redirect=%2Fweb%2Fguest%2Fd%2Fse1-7-extending-liferay) 를 시청하세요.
* 라이브 워크숍에 사용된 프레젠테이션의 [PDF](https://learn.liferay.com/c/portal/login?redirect=%2Fdocuments%2Fd%2Fguest%2Fse1-7-extending-liferay-pdf) 를 다운로드하세요.
```

## Liferay 확장 - 클라이언트 확장(코드)

![Client Extensions are created, managed and evolved by Customers or Partners, while Liferay DXP itself is hosted, managed, and updated with new features quarterly by Liferay.](./client-extensions/images/01.png)

마지막으로 Liferay DXP에는 이제 클라이언트 확장을 통해 Liferay를 사용자 정의할 수 있는 새롭고 흥미로운 방법이 있습니다. 실제로 코드를 사용하여 Liferay를 확장합니다.

지금까지 모듈에서 다룬 Liferay를 확장하는 다양한 방법이 고객의 비즈니스 기대를 충족하지 못할 때마다 클라이언트 확장을 사용하여 고객의 비즈니스 문제를 해결할 수 있습니다.

클라이언트 확장은 Liferay 외부에 있지만 Headless API를 사용하여 Liferay DXP와 통신합니다. Liferay는 모든 유형의 클라이언트 확장에 대한 예와 지원되는 클라이언트 확장을 성공적으로 구축하고 배포하는 데 필요한 도구를 제공합니다.

Liferay DXP는 분기별로 업데이트된다는 점도 언급하는 것이 중요합니다. 핵심 Liferay 플랫폼에서 분리된 사용자 정의를 통해 업그레이드 프로세스가 훨씬 쉬워졌습니다.

이 느슨하게 결합된 접근 방식의 장점은 다음과 같습니다.

* Liferay DXP에서 사용자 정의, 구성 및 확장을 분리한다는 것은 Liferay가 새로운 업데이트를 훨씬 더 빠르게 출시하고 제공을 간소화할 수 있음을 의미합니다.
* 새로운 기능을 얻기 위해 1년 이상을 기다리는 대신 Liferay는 Liferay DXP의 분기별 릴리스를 제공합니다.
* 이를 통해 새로운 개선 사항과 기능으로 출시 기간을 단축할 수 있을 뿐만 아니라 파트너와 Liferay의 고객 성공 팀은 고객과 더 자주 소통하고 새로운 기능을 고객의 솔루션에 홍보하고 통합할 수 있습니다.

**분리된 사용자 정의**

![Frontend Client Extensions can be developed in any popular frontend framework like React, Angular, etc., while Backend client extensions can be developed using popular backend frameworks like Spring Boot.](./client-extensions/images/02.png)

DXP 코어에서 사용자 정의를 분리하면 전체 제공 시 문제가 줄어듭니다. 이는 또한 더 이상 Liferay 관련 개발자를 찾고 교육할 필요가 없으며 대신 REACT, Angular, Vue와 같은 인기 있는 프런트 엔드 JavaScript 프레임워크 또는 Spring Boot 등과 같은 백엔드 프레임워크에 대한 전문 지식을 갖춘 개발자를 고용할 수 있음을 의미합니다. , Headless-API를 통해 Liferay DXP와 다시 통신할 수 있습니다.

파트너는 고객을 지원하는 데 중요한 역할을 합니다.

* 확장을 위한 SDLC 생성
* 낮은 코드 개발
* 백엔드 서비스 또는 프런트엔드 개발용 코드
* 이러한 맞춤형 솔루션의 성능
* 필요한 경우 사용자 정의 유지

여기서 주목해야 할 또 다른 사항은 클라이언트 확장이 어디에나 있을 수 있다는 것입니다. 고객이나 파트너는 원하는 경우 자체 인프라에 클라이언트 확장을 배포하도록 선택할 수 있습니다.

## 비즈니스 기회 증가

이 새로운 접근 방식은 Liferay 파트너에게 추가적인 비즈니스 기회도 창출합니다. 과거에는 파트너가 Liferay의 새 버전이 나올 때마다 새 버전의 애플리케이션을 구축해야 했습니다.

클라이언트 확장을 사용하면 API가 업데이트 전반에 걸쳐 일관되므로 깔끔하게 분리할 수 있습니다. 파트너는 기존 솔루션 업데이트에 소요되는 시간을 절약할 수 있을 뿐만 아니라 커넥터, 솔루션 등과 같은 새로운 비즈니스 기회의 출시 시간을 단축할 수도 있습니다.

## 데모에서 Liferay 확장에 대해 이야기하는 방법

그렇다면 이 모든 것이 왜 중요한가요? 이 모든 것이 무엇을 의미합니까? 그리고 Liferay를 확장하는 데 사용할 수 있는 다양한 방법을 잠재 고객에게 알려야 하는 이유는 무엇입니까?

핵심 메시지는 Liferay가 광범위한 기본 기능을 제공하더라도 Liferay가 턴키 애플리케이션이 아니라는 점을 기억하는 것이 중요하다는 것입니다.

고객이나 파트너는 비즈니스 문제를 해결하는 데 필요한 솔루션을 구현해야 하며 Liferay는 플랫폼에 대한 사용자 정의 및 확장을 사용하여 해당 비즈니스 요구 사항을 충족할 수 있는 광범위한 기능을 제공합니다.

Liferay의 유연한 특성으로 인해 고객을 위해 구축된 애플리케이션과 솔루션은 고객의 특정 요구에 맞게 맞춤화될 수 있습니다. 따라서 이전에 사용되지 않은 기능을 사용하거나 추가 사용자 정의 요구 사항에 대한 확장을 구축하는 등 고객의 비즈니스가 확장 및 변화함에 따라 이러한 솔루션도 성장하고 발전할 수 있습니다.

이는 또한 고객과 파트너가 턴키 솔루션에서는 사용할 수 없는 고유한 특징이나 기능을 제공함으로써 경쟁사와 차별화할 수 있기 때문에 경쟁 우위를 제공합니다.

## 추가 정보

* [조각 사용](https://learn.liferay.com/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments) , [퍼블리싱](https://learn.liferay.com/w/dxp/site-building/publishing-tools/publications) , [주제](https://learn.liferay.com/w/dxp/site-building/site-appearance/themes) 및 [스타일 북](https://learn.liferay.com/web/guest/w/dxp/site-building/site-appearance/style-books)
* [양식](https://learn.liferay.com/w/analytics-cloud/touchpoints/assets/forms) , [워크플로우](https://learn.liferay.com/w/dxp/process-automation/workflow) , [컬렉션 및 컬렉션 페이지](https://learn.liferay.com/w/dxp/content-authoring-and-management/collections-and-collection-pages) , [개체](https://learn.liferay.com/w/dxp/building-applications/objects)
* [OpenOffice / LibreOffice 통합 활성화](https://learn.liferay.com/w/dxp/content-authoring-and-management/documents-and-media/devops/enabling-openoffice-libreoffice-integration) , [Microsoft Office 365로 문서 생성 및 편집 활성화](https://learn.liferay.com/w/dxp/content-authoring-and-management/documents-and-media/devops/enabling-document-creation-and-editing-with-microsoft-office-365) , [Google 드라이브 통합](https://learn.liferay.com/w/dxp/content-authoring-and-management/documents-and-media/devops/google-drive-integration) , [LiveChat](https://learn.liferay.com/w/dxp/site-building/personalizing-site-experience/enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/livechat) , [DocuSign 디지털 서명 활성화](https://learn.liferay.com/w/dxp/content-authoring-and-management/documents-and-media/uploading-and-managing/enabling-docusign-digital-signatures) , [Liferay Talend 구성 요소 개요](https://learn.liferay.com/w/dxp/system-administration/data-integration/liferay-talend-components-overview) , [뮬소프트](https://learn.liferay.com/web/guest/w/commerce/add-ons-and-connectors/mulesoft) , [SAP 커넥터](https://marketplace.liferay.com/p/sap-business-objects-connector) , [헤드리스 배송](https://learn.liferay.com/w/dxp/headless-delivery)
* [원격 앱](https://learn.liferay.com/w/dxp/building-applications/client-extensions)

축하합니다. 이 모듈이 끝났습니다. 다음으로 Liferay의 [배포 전략](../deployment-strategies.md)에 대해 알아보세요.
