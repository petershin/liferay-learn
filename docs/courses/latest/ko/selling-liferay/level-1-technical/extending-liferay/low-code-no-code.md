---
visibility:
  * Employee
  * Partner
---
# 로우 코드/노 코드 및 통합으로 Liferay 확장

**한눈에 보기**

* Liferay 확장은 플랫폼의 잠재력을 최대한 활용하는 데 있어 중요한 측면입니다.
* 특정 비즈니스 요구 사항을 염두에 두고 Liferay를 사용자 정의하면 사용자 요구 사항에 맞는 디지털 경험을 만들 수 있습니다.
* 로우 코드/노 코드 기능을 사용하면 코드를 거의 또는 전혀 작성하지 않고도 플랫폼을 확장할 수 있습니다.
* 외부 시스템과 통합하면 해당 시스템의 데이터를 Liferay 애플리케이션에 통합할 수 있습니다.

## Liferay 확장 - 로우 코드/노 코드

로우 코드 및 노코드 접근 방식을 사용하면 개발자와 비즈니스 사용자가 광범위한 코딩 지식이나 경험 없이도 맞춤형 기능을 만들 수 있으므로 점점 인기가 높아지고 있습니다.

Liferay DXP의 많은 기존 기능이 이 원칙을 염두에 두고 설계되었으므로 로우 코드 및 노코드는 실제로 Liferay의 새로운 개념이 아닙니다.

Liferay DXP의 몇 가지 빠른 예는 다음과 같습니다.

* 양식
* 워크플로우
* 콜렉션
* 객체

### 양식

![Liferay Forms are built using a no-code user interface.](./low-code-no-code/images/01.png)

[Forms](https://learn.liferay.com/w/dxp/process-automation/forms) 은 필수 사용자 데이터를 수집하는 강력한 기능을 제공합니다. 예를 들어 고객 피드백이나 채용 지원서 등이 있습니다.

Forms 애플리케이션은 이전 사용자 입력을 기반으로 양식 필드를 동적으로 변경하는 규칙을 사용하여 설문 조사와 같은 간단한 양식을 복잡한 다중 페이지 애플리케이션으로 만드는 데 사용할 수 있습니다.

## 워크플로우

![Liferay's visual workflow designer allows administrators to implement content approval workflows using a drag-and-drop user interface.](./low-code-no-code/images/02.png)

[Workflows](https://learn.liferay.com/w/dxp/process-automation/workflow) 을 사용하면 관리자가 블로그, 웹 콘텐츠, 위키 등의 콘텐츠를 게시하기 전에 검토하고 승인할 수 있습니다.

워크플로 프로세스는 검토자 및 승인자로서 사용자, 그룹 및 역할과 통합될 수도 있습니다.

### 콜렉션

![Collections provide a simple way to create sets of assets which can be easily displayed to end users on pages.](./low-code-no-code/images/03.png)

[Collections](https://learn.liferay.com/w/dxp/content-authoring-and-management/collections-and-collection-pages) 은 정보를 그룹화하고 필터링하는 데 사용할 수 있는 콘텐츠 항목 및 기타 자산 세트입니다.

예를 들어, 컬렉션의 일반적인 사용 사례는 제품 웹 페이지에 새로운 고객 성공 사례가 게시될 때 자동으로 표시하는 섹션을 포함하는 것입니다.

### 객체

![Objects allow business applications to be created without writing any code.](./low-code-no-code/images/04.png)

[Objects](https://learn.liferay.com/w/dxp/building-applications/objects) 은 코드를 작성하거나 모듈을 배포하지 않고도 비즈니스 애플리케이션을 만드는 데 사용할 수 있는 새로운 기능입니다.

여기서 주의할 점:

* 개체와 프로세스를 개체로 모델링하여 훌륭한 디지털 경험을 만들 수 있습니다.
* 모기지 시뮬레이터부터 e-러닝 플랫폼까지 Liferay에 포함되어야 할 거의 모든 기능을 객체로 생성할 수 있습니다.
* 이러한 기본 기능을 통해 개발자는 Liferay DXP의 핵심을 수정하지 않고도 새로운 기능을 추가하고 기본 Liferay 기능을 재정의할 수 있습니다.

## Liferay 확장 * 통합

Liferay DXP는 통합을 사용하여 확장할 수도 있습니다. 이를 통해 Liferay는 CRM(고객 관계 관리) 시스템, ERP(전사적 자원 관리) 시스템 등을 포함한 기존 시스템 및 도구와 연결할 수 있습니다.

Liferay는 고객이 외부 시스템, 서비스 또는 애플리케이션과 통합할 수 있는 여러 통합 지점을 제공합니다.

예는 다음과 같습니다:

* 오픈오피스와 리브레오피스
* 마이크로소프트 오피스 365
* 구글 드라이브
* 라이브 채팅 및 챗봇
* 다큐사인
* ETL 도구
* 엔터프라이즈 서비스 버스
* ERP 플랫폼
* 헤드리스 API

### 오픈오피스와 리브레오피스

[OpenOffice 및 LibreOffice](https://learn.liferay.com/w/dxp/content-authoring-and-management/documents-and-media/devops/enabling-openoffice-libreoffice-integration) Liferay와의 통합을 통해 사용자는 다음을 수행할 수 있습니다. Liferay의 내장 문서 뷰어 및 편집기를 사용하여 포털 내에서 직접 사무실 문서를 보고 편집할 수 있습니다. 이는 문서를 다운로드하고 로컬로 편집한 다음 포털에 다시 업로드할 필요 없이 Liferay 포털 내에서 문서를 공동 작업하는 데 유용할 수 있습니다.

### 마이크로소프트 오피스 365

[Microsoft Office 365](https://learn.liferay.com/w/dxp/content-authoring-and-management/documents-and-media/uploading-and-managing/creating-documents/creating-and-editing-document-with-microsoft-office-365) 비즈니스용 OneDrive 통합을 통해 사용자는 Microsoft Office 365 응용 프로그램을 사용하여 문서를 만들고 편집한 다음 Liferay의 문서 및 미디어 라이브러리에 저장할 수 있습니다.

또한 Office 365의 Exchange Online 달력을 사용하면 통합된 경우 사용자는 Liferay 포털 내에서 직접 달력을 보고 관리할 수 있습니다.

### 구글 드라이브

Liferay는 두 가지 방법으로 Google Drive와 통합될 수도 있습니다.

1. [Google Drive로 문서 생성 및 편집 활성화](https://learn.liferay.com/w/dxp/content-authoring-and-management/documents-and-media/devops/google-drive-integration/enabling-document -Google 드라이브를 이용한 생성 및 편집)
1. [Google 드라이브 문서 링크 활성화](https://learn.liferay.com/w/dxp/content-authoring-and-management/documents-and-media/devops/google-drive-integration/enabling-links-to -google-드라이브-문서)

이 두 모드의 근본적인 차이점은 문서가 궁극적으로 저장되는 사이트입니다. 두 경우 모두 문서는 Google의 브라우저 기반 애플리케이션을 사용하여 생성되고 편집됩니다.

* 첫 번째 모드에서 문서는 궁극적으로 Liferay의 문서 및 미디어 라이브러리에 직접 저장됩니다.
* 두 번째로 Liferay에 저장된 문서에 대한 바로가기와 함께 Google Drive에 저장됩니다.

### 라이브 채팅 및 챗봇

Liferay DXP는 다양한 [라이브 채팅](https://learn.liferay.com/w/dxp/site-building/personalizing-site-experience/enabling-automated-live-chat-systems) 플랫폼에 대한 포괄적인 지원을 제공합니다. 이 통합을 활성화하면 Liferay 인스턴스의 사이트에 채팅 창이 추가되고 사용자를 위한 향상된 지원 및 사이트 경험을 제공하는 데 사용할 수 있습니다.

Liferay는 또한 Zendesk 또는 Hubspot과 같은 챗봇 서비스와 통합되어 자동화된 채팅 기능을 제공합니다. 이는 정규 업무 시간 외에 사용자에게 지원을 제공하거나 간단한 쿼리를 처리하는 데 유용할 수 있습니다.

### 다큐사인

[DocuSign](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/documents-and-media/uploading-and-managing/enabling-docusign-digital-signatures) 디지털 서명 Liferay 문서와도 통합될 수 있습니다.

DocuSign은 전자적으로 서명할 문서를 관리하는 서비스입니다. 이 통합을 통해 문서의 서명을 관리하고 수집할 수 있습니다.

### ETL 도구

Liferay는 [Talend]과 같은 ETL(Exchange-Transform-Load) 도구와 통합할 수 있습니다. 개요). Liferay의 Talend 구성 요소 덕분에 고객은 Liferay에서 데이터를 가져오고 내보낼 수 있습니다. 예를 들어 사용자 데이터, 웹 콘텐츠 또는 제품을 CRM, ERP 또는 데이터베이스와 같은 다른 시스템에서 가져오거나 내보낼 수 있습니다.

### 엔터프라이즈 서비스 버스

Liferay는 ESB(Enterprise Service Bus)와 같은 아키텍처와 통합할 수도 있습니다. [MuleSoft](https://learn.liferay.com/w/commerce/add-ons-and-connectors/mulesoft) 은 Liferay 커넥터도 포함하는 잘 알려진 ESB입니다. Liferay의 일반적인 사용 사례는 고객이 Liferay와 ERP 또는 CRM 시스템과 같은 다른 애플리케이션 간의 워크플로를 자동화하는 것입니다.

### ERP

Liferay는 SAP와 같은 ERP 플랫폼과의 통합을 허용합니다. SAP의 Liferay Connector를 사용하면 SAP 시스템에서 Liferay로 데이터를 가져오고 내보낼 수 있습니다.

예로는 고객 데이터, 제품 데이터, 판매 데이터 등이 있습니다. 그러나 가능한 사용 사례는 더 많습니다.

### 헤드리스 API

Liferay [헤드리스 통합](https://learn.liferay.com/w/dxp/headless-delivery/using-liferay-as-a-headless-platform) 은 개발자에게 Liferay의 백엔드를 통합하는 유연하고 효율적인 방법을 제공합니다. 최신 REST API를 사용하여 자체 애플리케이션으로 기능을 제공합니다.

* 이 접근 방식을 통해 개발자는 사용자 경험을 더욱 효과적으로 제어할 수 있으며 애플리케이션 출시 기간을 단축할 수 있습니다.

```{note}
* 위에서 언급한 통합 중 일부는 Liferay Experience Cloud SaaS에서는 불가능할 수 있습니다.
* Liferay Experience Cloud SaaS를 사용하는 경우 지정된 Liferay 담당자에게 최신 지원 통합을 확인하세요.
```

다음 [클라이언트 확장으로 Liferay 확장](./client-extensions.md)
