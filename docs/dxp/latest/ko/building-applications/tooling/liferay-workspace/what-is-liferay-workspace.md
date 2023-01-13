# Liferay 작업 공간이란 무엇입니까?

Liferay Workspace는 전체 개발 수명 주기를 처리하는 Liferay의 독창적인 방식을 나타내는 폴더 및 Gradle 스크립트 세트입니다.

- [프로젝트 생성](#creating-projects)
- [건축 프로젝트](#building-projects)
- [프로젝트 배포](#deploying-projects)
- [테스트 프로젝트](#testing-projects)

## 프로젝트 생성

Liferay Workspace는 Gradle 스크립트 및 플러그인을 사용하여 구현됩니다. 따라서 모든 IDE 또는 개발 도구에 통합됩니다. 또한 Liferay의 CLI 유틸리티와 함께 작동합니다. 표준 도구를 사용하거나 [Blade CLI](../blade-cli/generating-projects-with-blade-cli.md)을 사용하여 프로젝트를 생성할 수 있습니다.

## 건축 프로젝트

Liferay Workspace는 Liferay의 Gradle 플러그인을 원활하게 통합하여 Liferay 프로젝트 구축을 바로 시작할 수 있습니다. Gradle 래퍼는 Workspace와 함께 제공되므로 컴퓨터에 전체적으로 설치하지 않고도 Gradle을 사용할 수 있습니다.

Workspace는 Liferay 애플리케이션을 빌드하도록 사전 구성되어 있으므로 빌드 구성을 생성하기 위해 리포지토리 및 종속성을 찾는 시간을 절약할 수 있습니다.

## 프로젝트 배포

Gradle 또는 Blade CLI를 사용하여 Liferay Workspace에서 쉽게 프로젝트를 배포할 수 있습니다. 즉, 해당 CLI 도구를 지원하는 IDE에서도 쉽게 배포할 수 있습니다. 또한 Workspace에는 코드를 디버깅할 Liferay 런타임을 자동으로 다운로드하는 메커니즘이 있으므로 배포 및 테스트가 간단합니다.

## 테스트 프로젝트

Liferay Workspace는 Docker를 사용하여 개발, 사용자 승인 테스트 및 프로덕션 구성을 구성하여 코드를 테스트할 환경을 시뮬레이션합니다. 환경은 폴더로 구분되며 각 폴더는 자체 데이터베이스, `Portal-ext.properties` 파일, Elasticsearch 구성 등을 제공할 수 있습니다. 이러한 구성은 Liferay DXP 또는 CE의 Workspace 제어 설치를 오버레이합니다.

[Blade CLI](../blade-cli/installing-and-updating-blade-cli.md)을 사용하거나 사용하지 않고 Workspace를 사용할 수 있습니다. </a> 번째 Workspace를 생성하는 방법을 알아보려면 계속 읽으십시오. </p> 
