---
toc:
  - ./configuring-dependencies/finding-artifacts.md
  - ./configuring-dependencies/specifying-dependencies.md
  - >-
    - ./../../building-applications/reference/jars-excluded-from-wabs.md
---
# 종속성 구성

Liferay는 모듈이 Java 패키지를 통해 기능을 게시하고 사용할 수 있는 컨테이너를 제공합니다. 모듈은 종속성으로 구성하여 다른 모듈이나 기존 라이브러리의 패키지를 활용할 수 있습니다. 여기서는 아티팩트(모듈 또는 라이브러리)를 찾고 이에 대한 종속성을 구성하는 방법을 알아봅니다.

* [아티팩트 찾기](./configuring-dependencies/finding-artifacts.md) 에서는 애플리케이션 관리자, Gogo Shell 및 Liferay 참조 문서를 사용하여 Liferay에 배포되고 리포지토리에서 사용 가능한 아티팩트를 찾는 방법을 설명합니다.

* [종속성 지정하기](./configuring-dependencies/specifying-dependencies.md) 에서는 Liferay Workspace의 모듈 프로젝트에서 아티팩트를 참조하는 방법을 보여줍니다. 아티팩트에서 이미 패키지를 내보내고 있는지 확인하는 방법과 컴파일 시간 종속성과 같은 아티팩트를 구성하는 방법을 배우게 됩니다.

* [타사 라이브러리 패키지 종속성 해결(](./configuring-dependencies/resolving-third-party-library-package-dependencies.md) )은 기존 라이브러리 JAR(OSGi 모듈이 아닌 JAR)에서만 사용할 수 있는 패키지를 사용하기 위한 워크플로를 제공합니다. 전이 종속성을 최소화하여 종속성을 더 빠르게 해결하고 불필요한 JAR로 인해 프로젝트가 부풀어 오르는 것을 방지할 수 있습니다.

첫 번째 단계는 필요한 아티팩트를 찾는 것입니다.
