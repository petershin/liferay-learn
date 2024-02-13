---
toc:
- ./fundamentals/module-projects.md
- ./fundamentals/apis-as-osgi-services.md
- ./fundamentals/using-an-osgi-service.md
- ./fundamentals/importing-packages.md
- ./fundamentals/exporting-packages.md
- ./fundamentals/semantic-versioning.md
- ./fundamentals/configuring-dependencies.md
- ./fundamentals/using-the-gogo-shell.md
---
# 기초

Liferay 개발 프로젝트는 주로 간단한 .jar 파일로 구성됩니다. 여기에는 OSGi 모듈을 만드는 몇 가지 추가 구성 파일이 포함되어 있지만 Java를 아는 사람이라면 누구나 쉽게 이해할 수 있습니다.

OSGi의 강력한 기능 중 하나는 DXP의 API에 액세스하고 다양한 기능을 확장 및 재정의하거나 배포를 위해 새 소프트웨어를 패키징하는 프로젝트를 구축하는 일관된 단일 방법이 있다는 것입니다. 이러한 프로젝트 또는 모듈은 기능에 대해 서로 의존하고 런타임에 조작할 수 있는 에코시스템을 형성합니다.

이것이 Liferay DXP 생태계의 기본입니다.

* **[모듈 프로젝트](./fundamentals/module-projects.md)** OSGi 모듈이 무엇인지, 프로젝트 구조 및 Liferay의 OSGi 프레임워크에서 어떻게 사용되는지 설명합니다.

* **[종속성 구성](./fundamentals/configuring-dependencies.md)** 은 프로젝트에서 Java 패키지를 사용하기 위해 Liferay 아티팩트 및 타사 아티팩트를 식별하고 구성하는 방법을 보여줍니다.

* **[가져오기](./fundamentals/importing-packages.md) 및 [패키지 내보내기](./fundamentals/exporting-packages.md)** 는 다른 모듈의 기능을 사용하고 다른 모듈에서 사용할 기능을 게시하는 방법을 보여줍니다. Liferay의 도구는 패키지 사용을 감지하고 패키지 가져오기를 자동으로 지정합니다.

* **[시맨틱 버전 관리](./fundamentals/semantic-versioning.md)** 은 Liferay가 새 버전으로 발전할 때 코드에 대한 종속성을 관리하는 방법을 설명하므로 동일한 메커니즘을 사용하여 버전을 관리하고 코드 손상을 방지할 수 있습니다.

* **[Gogo Shell](./fundamentals/using-the-gogo-shell.md)** 은 셸에 명령을 실행하여 구성 요소를 검사하고, 문제를 디버그하고, 런타임에 배포를 관리하는 방법을 보여줍니다.

[모듈 프로젝트](./fundamentals/module-projects.md)에 대해 배우는 것으로 시작할 수 있습니다.