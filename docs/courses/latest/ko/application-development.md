---
toc:
  - ./application-development/modeling-data-structures.md
  - ./application-development/implementing-business-logic.md
  - ./application-development/designing-user-interfaces.md
---
# 응용 프로그램 개발

때로는 Liferay의 기본 기능이 필요한 모든 기능을 포함하지 못하는 경우가 있습니다. 이런 일이 발생하면 Liferay와 인터페이스하고 해당 기능을 활용하는 자체 애플리케이션을 개발할 수 있습니다.

여기에서는 전 세계 유통업체에 메이플 시럽 제품을 공급하는 가상의 B2B 생산업체인 Delectable Bonsai의 이야기를 계속하겠습니다. 최근 성장으로 인해 Delectable Bonsai에는 B2B 환경에서 유통업체 신청을 접수하고 승인하기 위한 맞춤형 솔루션이 필요합니다.

<!--TASK:
Due to recent growth, Delectable Bonsai needs two custom solutions to streamline business processes and better serve customers: 

1. A distributor application flow for receiving and approving distributors in a B2B context

1. A Ticketing System for customers to report issues and open requests
-->

![배포자 신청 흐름을 만듭니다.](./application-development/images/01.png)

이 애플리케이션은 LXC, LXC-SM 및 자체 호스팅 환경에 배포 가능하며 Delectable Bonsai의 파트너는 이를 사용하여 새로운 비즈니스 계정을 신청하고 얻을 수 있습니다.

완료되면 다음 방법을 배우게 됩니다.

* Liferay 개체를 사용하여 헤드리스 API, 권한 등을 포함하여 Liferay의 핵심 프레임워크를 활용하는 사용자 정의 데이터 구조를 정의하고 관리하세요.
* Liferay의 페이지 빌더 기능을 사용하여 객체 항목 생성 및 표시 경험을 디자인하세요.
* 마이크로서비스 클라이언트 확장을 사용하여 솔루션에 백엔드 기능을 제공하세요.
<!--TASK: * Use frontend client extensions to build dynamic user experiences that integrate with object APIs. -->
<!--TASK: * Promote custom applications from UAT/DEV to PRD environments. -->

[데이터 구조 모델링](./application-development/modeling-data-structures.md)부터 시작하세요!



<!--TASK:
:::{grid-item-card} Module Four: Building a Ticketing System
:link: ./application-development/building-a-ticketing-system.md

Learn how to use advanced features to develop a ticketing system.
:::  
-->
