# Liferay 얼굴 버전 체계

이 기사에서는 포틀릿과 함께 사용해야 하는 Liferay Faces 아티팩트를 알아보고 버전의 각 구성 요소가 무엇을 의미하는지 알아봄으로써 Liferay Faces 버전 관리 체계를 탐색합니다. 버전 관리 체계를 숙지하고 나면 몇 가지 구성 예를 볼 수 있습니다.

## Liferay Faces Archetype 포틀릿 사용

[Liferay Faces Archetype 포틀릿](http://liferayfaces.org) 사용하여 포틀릿에 포함해야 하는 Liferay Faces 아티팩트 및 버전을 결정할 수 있습니다. 선호하는 Liferay Portal 버전, JSF 버전, 구성 요소 제품군(선택 사항) 및 빌드 도구를 선택하면 포틀릿이 Maven 원형에서 포틀릿을 생성하는 명령과 빌드에 복사할 수 있는 종속성 목록을 모두 제공합니다. 파일. 다음 섹션에서는 Liferay Faces 아티팩트의 각 버전에 대한 호환성 정보가 제공됩니다.

## Liferay 얼굴 합금

[AlloyUI](http://alloyui.com/) 을 활용하는 JSF 구성 요소 제품군을 제공합니다.

| 브랜치                                                                                                   | 예시 아티팩트                           | 합금UI  | JSF API | 추가 정보                                                           |
| ----------------------------------------------------------------------------------------------------- | --------------------------------- | ----- | ------- | --------------------------------------------------------------- |
| [마스터 \(4.x\)](https://github.com/liferay/liferay-faces-alloy/tree/master) | com.liferay.faces.alloy-4.1.0.jar | 3.1.x | 2.2+    | **AlloyUI 3.1.x는 Liferay Portal 7.3.** 과 함께 번들로 제공되는 버전입니다.      |
| [3.x](https://github.com/liferay/liferay-faces-alloy/tree/3.x)                             | com.liferay.faces.alloy-3.1.0.jar | 3.0.x | 2.2+    | **AlloyUI 3.0.x는 Liferay Portal 7.0/7.1/7.2와 함께 번들로 제공되는 버전입니다.** |
| [2.x](https://github.com/liferay/liferay-faces-alloy/tree/2.x)                             | com.liferay.faces.alloy-2.0.1.jar | 2.0.x | 2.1+    | **AlloyUI 2.0.x는 Liferay Portal 6.2.** 와 함께 번들로 제공되는 버전입니다.      |
| [1.x](https://github.com/liferay/liferay-faces-alloy/tree/1.x)                             | com.liferay.faces.alloy-1.0.1.jar | 2.0.x | 1.2     | **AlloyUI 2.0.x는 Liferay Portal 6.2.** 와 함께 번들로 제공되는 버전입니다.      |

## liferay 페이스 브리지

JSR 286(포틀릿 2.0) 및 JSR 362(포틀릿 3.0)에 대한 참조 구현인 [Apache Pluto](https://portals.apache.org/pluto/) 내에서 JSF 웹 애플리케이션을 포틀릿으로 배포하는 기능을 제공합니다.

| 브랜치                                                                                                                                                                         | 예제 아티팩트                                                                            | 포틀릿 API | JSF API |                                          JCP 사양                                         | 추가 정보                                                                          |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- | :-----: | :-----: | :-------------------------------------------------------------------------------------: | ------------------------------------------------------------------------------ |
| API: [5.x](https://github.com/liferay/liferay-faces-bridge-api/tree/5.x) <br/>구현: [5.x](https://github.com/liferay/liferay-faces-bridge-impl/tree/5.x) | com.liferay.faces.bridge.api-5.0.0.jar<br/>com.liferay.faces.bridge.impl-5.0.0.jar |   3.0   |   2.2   |              [JSR 378](https://www.jcp.org/en/jsr/detail?id=378)             | **JCP의 "최종 검토" 중이며 2020년에 출시될 예정입니다.** |
| API: [4.x](https://github.com/liferay/liferay-faces-bridge-api/tree/4.x) <br/>구현: [4.x](https://github.com/liferay/liferay-faces-bridge-impl/tree/4.x) | com.liferay.faces.bridge.api-4.1.0.jar<br/>com.liferay.faces.bridge.impl-4.0.0.jar |   2.0   |   2.2   |              [JSR 329](https://www.jcp.org/en/jsr/detail?id=329)             | **JSF 2.2에 대한 비표준 브리지 확장을 포함합니다.** |
| API: [3.x](https://github.com/liferay/liferay-faces-bridge-api/tree/3.x) <br/>구현: [3.x](https://github.com/liferay/liferay-faces-bridge-impl/tree/3.x) | com.liferay.faces.bridge.api-3.1.0.jar<br/>com.liferay.faces.bridge.impl-3.0.0.jar |   2.0   |   2.1   |              [JSR 329](https://www.jcp.org/en/jsr/detail?id=329)             | **JSF 2.1에 대한 비표준 브리지 확장을 포함합니다.** |
| API: [2.x](https://github.com/liferay/liferay-faces-bridge-api/tree/2.x) <br/>구현: [2.x](https://github.com/liferay/liferay-faces-bridge-impl/tree/2.x) | com.liferay.faces.bridge.api-2.1.0.jar<br/>com.liferay.faces.bridge.impl-2.0.0.jar |   2.0   |   1.2   | [JSR 329](https://www.jcp.org/en/jsr/detail?id=329) (MR1) | **MR1(유지보수 릴리스 1)에 대한 지원이 포함됩니다.** |
| 1.x                                                                                                                                                                         | N/A                                                                                |   1.0   |   1.2   |              [JSR 301](https://www.jcp.org/en/jsr/detail?id=301)             | **Liferay Faces Bridge는 JSR 301을 구현한 적이 없으므로 N/A(해당 사항 없음).** |

## Liferay Faces Bridge Ext

[Liferay Portal](https://liferay.dev/-/portal) 과의 호환성을 제공하고 친숙한 URL과 같은 Liferay 관련 기능을 활용하는 Liferay Faces Bridge 확장입니다.

| 브랜치                                                                               | 예시 아티팩트                                | &nbsp;&nbsp;liferay 포털 API&nbsp;&nbsp; | &nbsp;&nbsp;브릿지 API&nbsp;&nbsp; | &nbsp;&nbsp;포틀릿 API&nbsp;&nbsp; | JSF API |
| --------------------------------------------------------------------------------- | -------------------------------------- | :------------------------------------------------------: | :-------------------------------------------------: | :-------------------------------------------------: | :-----: |
| [8.x](https://github.com/liferay/liferay-faces-bridge-ext/tree/master) | com.liferay.faces.bridge.ext-8.0.0.jar |                          7.3.0+                          |                         5.x                         |                         3.0                         |   2.3   |
| [7.x](https://github.com/liferay/liferay-faces-bridge-ext/tree/7.x)    | com.liferay.faces.bridge.ext-7.0.0.jar |                          7.3.0+                          |                         5.x                         |                         3.0                         |   2.2   |
| [6.x](https://github.com/liferay/liferay-faces-bridge-ext/tree/6.x)    | com.liferay.faces.bridge.ext-6.0.0.jar |                          7.3.0+                          |                         4.x                         |                         2.0                         |   2.2   |
| [5.x](https://github.com/liferay/liferay-faces-bridge-ext/tree/5.x)    | com.liferay.faces.bridge.ext-5.0.4.jar |                     7.0.x/7.1.x/7.2.x                    |                         4.x                         |                         2.0                         |   2.2   |
| [4.x](https://github.com/liferay/liferay-faces-bridge-ext/tree/4.x)    | 미사용                                    |                            N/A                           |                         N/A                         |                         N/A                         |   N/A   |
| [3.x](https://github.com/liferay/liferay-faces-bridge-ext/tree/3.x)    | com.liferay.faces.bridge.ext-3.0.1.jar |                           6.2.x                          |                         4.x                         |                         2.0                         |   2.2   |
| [2.x](https://github.com/liferay/liferay-faces-bridge-ext/tree/2.x)    | com.liferay.faces.bridge.ext-2.0.1.jar |                           6.2.x                          |                         3.x                         |                         2.0                         |   2.1   |
| [1.x](https://github.com/liferay/liferay-faces-bridge-ext/tree/1.x)    | com.liferay.faces.bridge.ext-1.0.1.jar |                           6.2.x                          |                         2.x                         |                         2.0                         |   1.2   |

## Liferay 얼굴 포털

[Portal](https://liferay.dev/-/portal) 에서 제공하는 JSP 태그를 기반으로 하는 JSF 구성 요소 제품군을 제공합니다.

| 브랜치                                                                           | 예시 아티팩트                            | liferay 포털 API&nbsp;&nbsp; | &nbsp;&nbsp;포틀릿 API | &nbsp;&nbsp;JSF API |
| ----------------------------------------------------------------------------- | ---------------------------------- | :--------------------------------: | :---------------------------: | :---------------------------: |
| [6.x](https://github.com/liferay/liferay-faces-portal/tree/master) | com.liferay.faces.portal-6.0.0.jar |                7.2+                |              3.0              |              2.3              |
| [5.x](https://github.com/liferay/liferay-faces-portal/tree/5.x)    | com.liferay.faces.portal-5.0.0.jar |                7.2+                |              3.0              |              2.2              |
| [4.x](https://github.com/liferay/liferay-faces-portal/tree/4.x)    | com.liferay.faces.portal-4.0.0.jar |               7.2/7.3              |              2.0              |              2.2              |
| [3.x](https://github.com/liferay/liferay-faces-portal/tree/3.x)    | com.liferay.faces.portal-3.0.1.jar |             7.0/7.1/7.2            |              2.0              |              2.2              |
| [2.x](https://github.com/liferay/liferay-faces-portal/tree/2.x)    | com.liferay.faces.portal-2.0.1.jar |                 6.2                |              2.0              |            2.1/2.2            |
| [1.x](https://github.com/liferay/liferay-faces-portal/tree/1.x)    | com.liferay.faces.portal-1.0.1.jar |                 6.2                |              2.0              |              1.2              |

## Liferay 얼굴 활용

Liferay Faces를 구성하는 많은 하위 프로젝트를 지원하는 범용 JSF 유틸리티가 포함된 라이브러리입니다.

| 브랜치                                                                      | 예시 아티팩트                          | &nbsp;&nbsp;JSF API |
| ------------------------------------------------------------------------ | -------------------------------- | :---------------------------: |
| [마스터](https://github.com/liferay/liferay-faces-util)          | com.liferay.faces.util-3.1.0.jar |              2.3              |
| [3.x](https://github.com/liferay/liferay-faces-util/tree/3.x) | com.liferay.faces.util-3.1.0.jar |              2.2              |
| [2.x](https://github.com/liferay/liferay-faces-util/tree/2.x) | com.liferay.faces.util-2.1.0.jar |              2.1              |
| [1.x](https://github.com/liferay/liferay-faces-util/tree/1.x) | com.liferay.faces.util-1.1.0.jar |              1.2              |

다음 이미지는 구성 요소가 상호 작용하고 서로 의존하는 방식을 시각화하는 데 도움이 되는 Liferay Faces 종속성 다이어그램을 나타냅니다.

![Liferay Faces dependency diagram helps visualize how components interact and depend on each other.](./liferay-faces-version-scheme/images/01.png)

다음으로, 새로운 버전 관리 체계가 실제로 작동하는 모습을 볼 수 있는 몇 가지 구성 예를 볼 수 있습니다.
