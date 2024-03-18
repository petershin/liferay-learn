# 마이크로 프런트엔드

마이크로 프런트엔드는 마이크로서비스의 개념을 개발의 프런트엔드 측면으로 확장합니다. 마이크로서비스 아키텍처를 사용하여 애플리케이션을 더 작은 부분으로 나누는 모든 기능을 갖춘 강력한 브라우저 애플리케이션을 구축할 수 있습니다. 그러면 별도의 팀이 다른 프레임워크를 사용하더라도 작은 부품을 제공하는 데 집중할 수 있습니다. 완성되면 부품이 완벽하게 결합되어 훌륭한 사용자 경험을 선사합니다.

![Using Liferay to build a fully-featured and powerful browser application applying Micro Frontends](micro-frontends/images/01.png)

마이크로 프런트 엔드를 구현하기 위해 [조각](../site-building/creating-pages/page-fragments-and-widgets/using-fragments.md) 및 [위젯](../site-building/creating-pages/page-fragments-and-widgets/using-widgets.md) 와 같은 즉시 사용 가능한 솔루션과 결합된 [프런트 엔드 클라이언트 확장](../building-applications/client-extensions/frontend-client-extensions.md) 사용합니다. 개발자는 다양한 프레임워크를 사용하여 애플리케이션을 생성하거나 확장한 다음 클라이언트 확장을 사용하여 Liferay에 연결할 수 있습니다.

사용 가능한 프런트 엔드 클라이언트 확장 중 하나는 [기본 사용자 정의 요소](../building-applications/client-extensions/frontend-client-extensions/tutorials/creating-a-basic-custom-element.md) 입니다. 기본 사용자 정의 요소는 Liferay의 프런트 엔드 인프라를 사용하여 Liferay 플랫폼에 외부 원격 애플리케이션을 등록하고 이를 위젯으로 렌더링합니다. 이러한 방식으로 사용자는 애플리케이션을 별도로 개발하고, 클라이언트 확장을 사용하여 기본 사용자 정의 요소를 생성하고, 이를 페이지에 추가할 수 있습니다.

```{note}
사용자 정의 요소 클라이언트 확장은 구축, 패키지 또는 호스팅 방법에 관계없이 모든 기술을 사용할 수 있습니다.
```

아래 사례는 개념을 보여줍니다.

### 사례 1: 레이라이프

[Raylife](https://marketplace.liferay.com/p/liferay-insurance-agent-portal-accelerator#solutions-details-video) 은 Liferay를 기반으로 구축된 에이전트 포털 솔루션입니다. 이는 사용자 정의할 수 있는 가속기 역할을 합니다.

Raylife에는 네 가지 별도의 애플리케이션이 필요합니다. 다양한 필드로 보험 청구 목록을 표시하는 [React 기반 클라이언트 확장](../building-applications/developing-a-javascript-application/using-react.md) , 정보를 시각화하는 조각 블록(다른 시각화를 표시하기 위해 다른 블록으로 대체 가능), 헤더 및 사이드 메뉴 술집.

페이지의 요소는 DOM에 의해 트리거된 이벤트를 통해 통신하며 동기 통신을 유지하고 리소스를 공유할 수 있습니다.

화면의 모든 데이터는 데이터 지속성을 위해 [헤드리스 API](../building-applications/objects/creating-and-managing-objects/managing-objects-with-headless-apis.md) 및 [객체](../building-applications/objects.md) 을 통해 얻습니다.

여러 팀이 동시에 프로젝트를 진행했습니다. 각 팀은 애플리케이션을 담당했습니다. 클라이언트 확장을 사용했기 때문에 각 팀의 코드는 격리되었습니다. 애플리케이션 중 하나는 React를 기본 프레임워크로 사용했지만 다른 애플리케이션은 HTML, CSS 및 JavaScript를 사용하는 사용자 정의 조각을 통해 생성되었습니다.

![Raylife is an agent portal solution built on Liferay using a Micro Frontend concept.](micro-frontends/images/02.png)

### 사례 2: 상거래 애플리케이션

전자 상점용 웹사이트를 만들어야 한다고 상상해 보세요. 웹사이트에는 머리글, 바닥글 및 4개의 애플리케이션이 있어야 합니다. 사용자가 제품에 대한 정보(제품 이름, 사진 및 설명)를 찾는 기본 디스플레이 애플리케이션, 장바구니/결제 애플리케이션(장바구니에 추가 포함) 버튼), 해당 상품과 관련된 상품을 메인 디스플레이에 표시하는 관련 상품 애플리케이션, 상품에 대한 고객의 의견을 담은 댓글/평점 섹션과 상품 평가를 위한 별점 시스템이 있습니다.

레이아웃 요소를 사용하여 [페이지 레이아웃](../site-building/creating-pages/page-fragments-and-widgets/using-fragments/using-layout-elements.md) 사용자 정의하고, 페이지에서 사용자 정의 가능한 OOTB 조각 및 위젯(예: 머리글 및 바닥글 조각)을 사용하고, 클라이언트 확장을 통해 다른 애플리케이션을 추가할 수 있습니다.

다양한 팀이 원하는 프레임워크를 사용하여 다양한 애플리케이션을 독립적으로 작업할 수 있습니다. 모든 애플리케이션은 Liferay의 기본 API(헤드리스 API 또는 글로벌 JavaScript API)의 이점을 활용합니다.

![A draft that defines the layout of the page with the position of each application/component in the page.](micro-frontends/images/03.png)
