# 사용자 정의 애플리케이션 배포

[사용자 정의 요소 클라이언트 확장](../../../building-applications/client-extensions/frontend-client-extensions.md#custom-element-client-extensions) 을 사용하여 JavaScript를 렌더링할 수 있습니다. Liferay 사이트 페이지의 위젯으로 응용 프로그램. 이 애플리케이션은 Liferay에서 제공되며 [헤드리스 API](../../../headless-delivery/using-liferay-as-a-headless-platform.md)를 통해 Liferay와 상호 작용합니다.

`liferay-ticket-custom-element` 클라이언트 확장을 배포합니다.

1. 다음 명령을 실행하십시오.

   ```bash
   ./gradlew :client-extensions:liferay-ticket-custom-element:deploy
   ```

1. Liferay에서 **제품 메뉴**(![제품 메뉴](../../../images/icon-product-menu.png))를 선택하고 **사이트 빌더** &rarr; **페이지** 로 이동합니다.

1. **추가**(![아이콘 추가](../../../images/icon-add.png))를 클릭하고 **페이지** 를 선택합니다.

1. **Blank** 유형 페이지를 선택합니다. 페이지 이름을 지정합니다(예: '티켓팅 시스템'). **추가** 를 클릭하세요.

1. 조각 및 위젯 아래 왼쪽 탐색에서 **Widgets** 탭을 클릭합니다.

1.  클라이언트 확장 유형 위젯까지 아래로 스크롤합니다. **Liferay Ticket Custom Element** 위젯을 페이지로 드래그하세요.

1. **게시** 를 클릭하세요.

이제 맞춤형 티켓팅 시스템 애플리케이션이 사이트 페이지에서 실행됩니다.

![The custom ticketing system application is now running.](./deploying-a-custom-application/images/01.png)

**새 티켓 생성** 버튼을 클릭하면 추가 무작위 티켓 항목이 생성됩니다. **Control Panel** &rarr; **Tickets** 에서 자신만의 티켓 개체 항목을 만들 수도 있습니다.

## 맞춤 요소 코드 검사

`client-extension.yaml` 파일의 `assemble` 블록 섹션은 다음과 같습니다:

```yaml
assemble:
    - from: build/assets
      into: static
```

JavaScript 애플리케이션의 `.js` 및 `.css` 빌드 파일은 `build/assets` 폴더에서 복사되어 배포 가능한 클라이언트 확장 `.zip` 파일에 배치됩니다.

이 `liferay-ticket-custom-element`는 [맞춤 요소](../../../building-applications/client-extensions/frontend-client-extensions.md#custom-element-client- 확장) 유형 클라이언트 확장. `client-extension.yaml` 파일에 다음과 같이 정의되어 있습니다.

```yaml
liferay-ticket-custom-element:
   cssURLs:
      - "*.css"
   friendlyURLMapping: current-tickets-custom-element
   htmlElementName: current-tickets-custom-element
   instanceable: false
   name: Current Tickets Custom Element
   portletCategoryName: category.client-extensions
   type: customElement
   urls:
      - "*.js"
   useESM: true
```

설명은 [사용자 정의 요소 YAML 구성 참조](../../../building-applications/client-extensions/frontend-client-extensions/custom-element-yaml-configuration-reference.md)를 참조하세요. 각 속성.

애플리케이션의 관련 JavaScript 파일은 `/src` 폴더에 포함되어 있습니다. JavaScript 코드에 대한 전체 설명은 이 튜토리얼의 범위를 벗어나지만 몇 가지 참고할 사항이 있습니다.

* `/src/pages/TicketApp.tsx` 파일은 티켓팅 시스템 페이지의 전체 레이아웃을 정의합니다.
* `/src/services/tickets.ts` 파일에서는 [데이터 스키마](./defining-a-custom-data-schema.ts) 실행 시 생성된 `j3y7ticket` 객체를 사용하여 티켓을 생성하고 가져옵니다. md)를 정의했습니다. `/src/ticket.js` 파일의 `generateNewTicket()` 함수는 무작위 필드 항목으로 추가 티켓 항목을 생성합니다.
* `/src/services/tickets.ts` 파일에서 객체의 헤드리스 API 호출은 `Liferay.authToken` 객체를 통해 인증됩니다. 이 개체는 웹 구성 요소가 Liferay에서 실행 중일 때 사용할 수 있으며 OAuth2 인증을 단순화합니다.
* `package.json` 파일에는 JavaScript 애플리케이션의 초기화 및 빌드를 처리하는 `scripts{ build: }요소가 포함되어 있습니다.

다음: [문서 추천 시스템 구현](./implementing-a-documentation-referral-system.md).

## 관련 개념

* [기본 커스텀 요소 생성](../../../building-applications/client-extensions/frontend-client-extensions/tutorials/creating-a-basic-custom-element.md)
* [사용자 정의 요소 및 Iframe 클라이언트 확장 이해](../../../building-applications/client-extensions/frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md)
