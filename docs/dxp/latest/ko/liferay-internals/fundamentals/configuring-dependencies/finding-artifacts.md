# 유물 찾기

프로젝트에서 외부 아티팩트를 사용하려면 `build.gradle` [Gradle](https://gradle.org/) 스크립트에서 해당 종속성을 구성해야 합니다.

아티팩트를 종속성으로 지정하기 전에 먼저 해당 속성을 찾아야 합니다. 아티팩트에는 다음과 같은 속성이 있습니다.

* **그룹 ID** : 저작 조직
* **Artifact ID** : 이름/식별자
* **버전** : 릴리스 번호

여기에서는 종속성을 지정하기 위해 아티팩트 속성을 찾는 방법을 배웁니다.

## 핵심 유물 속성 찾기

각 Liferay 아티팩트는 아티팩트의 OSGi 번들 메타데이터 속성을 포함하는 `META-INF/MANIFEST.MF` 파일이 있는 JAR 파일입니다. 예를 들어 다음 두 OSGi 헤더는 아티팩트 ID와 버전을 지정합니다.

```
Bundle-SymbolicName:  [artifact ID]
Bundle-Version: [version]
```

```{important}
Liferay DXP 수정 팩의 아티팩트는 Liferay DXP 설치 아티팩트를 재정의합니다. 수정팩의 `binaries` 폴더에는 하위 폴더의 아티팩트가 포함되어 있습니다. 프로젝트에 수정팩에서 제공하는 아티팩트가 필요한 경우 종속성을 선언할 때 수정팩에서 버전을 선언하십시오.
```

핵심 Liferay 아티팩트를 찾을 수 있는 사이트는 다음과 같습니다.

| 파일                     | 그룹 ID                | 인공물 식별                      | 버전                     | 기원                                                |
|:---------------------- |:-------------------- |:--------------------------- |:---------------------- |:------------------------------------------------- |
| `portal-kernel.jar`    | `com.liferay.portal` | `com.liferay.portal.kernel` | (JAR의 `MANIFEST.MF`참조) | 수정 팩 ZIP, Liferay 설치 또는 Liferay 종속성 ZIP           |
| `portal-impl.jar`      | `com.liferay.portal` | `com.liferay.portal.impl`   | (JAR의 `MANIFEST.MF`참조) | 수정 팩 ZIP 또는 Liferay `.war`                        |
| `util-bridges.jar`     | `com.liferay.portal` | `com.liferay.util.bridges`  | (JAR의 `MANIFEST.MF`참조) | 수정 팩 ZIP 또는 Liferay `.war`                        |
| `util-java.jar`        | `com.liferay.portal` | `com.liferay.util.java`     | (JAR의 `MANIFEST.MF`참조) | 수정 팩 ZIP 또는 Liferay `.war`                        |
| `util-slf4j.jar`       | `com.liferay.portal` | `com.liferay.util.slf4j`    | (JAR의 `MANIFEST.MF`참조) | 수정 팩 ZIP 또는 Liferay `.war`                        |
| `util-taglibs.jar`     | `com.liferay.portal` | `com.liferay.util.taglib`   | (JAR의 `MANIFEST.MF`참조) | 수정 팩 ZIP 또는 Liferay `.war`                        |
| `com.liferay.*` JAR 파일 | `com.liferay`        | (JAR의 `MANIFEST.MF`참조)      | (JAR의 `MANIFEST.MF`참조) | 수정 팩 ZIP, Liferay 설치, Liferay 종속성 ZIP 또는 OSGi ZIP |

다음으로 Liferay 앱 및 독립 모듈 아티팩트 속성을 찾는 방법을 알아봅니다.

## Liferay 앱 및 독립 아티팩트 찾기

코어 외부 모듈의 경우 여전히 필요한 모듈에 대한 종속성을 지정해야 합니다. 필요한 종속성을 찾는 세 가지 방법이 있습니다.

| 자원                        | 유물 유형                              |
|:------------------------- |:---------------------------------- |
| [앱 관리자](#app-manager)     | 배포된 모듈                             |
| [참조 문서](#reference-docs)  | Liferay 모듈(릴리스별)                   |
| [메이븐 센트럴](#maven-central) | 모든 아티팩트 유형: Liferay 및 타사, 모듈 및 비모듈 |

```{important}
'com.liferay'는 Liferay의 모든 앱 및 독립 모듈에 대한 그룹 ID입니다.
```

App Manager는 배포된 모듈에 대한 최상의 정보를 제공합니다.

### 앱 관리자

[App Manager](../../../system-administration/installing-and-managing-apps/managing-apps/using-the-app-manager.md) 은 Liferay 인스턴스에 배포된 항목을 보여줍니다.

1. Liferay에서 **글로벌 메뉴**(![Global Menu icon](./finding-artifacts/images/01.png))을 클릭하고 **제어판** 탭을 선택합니다.

1. 시스템 카테고리에서 **App Manager** 을 선택합니다.

1. 표시 이름, 기호 이름 또는 관련 키워드로 모듈을 검색하십시오. 앱 목록을 통해 모듈을 찾아볼 수도 있습니다. 브라우징이든 검색이든 앱 관리자는 각 모듈의 아티팩트 ID와 버전 번호를 표시합니다.

![앱 관리자는 배포된 각 모듈의 아티팩트 ID와 버전 번호를 표시합니다.](./finding-artifacts/images/02.png)

앱 관리자는 독립 모듈 범주에서 독립 모듈을 집계합니다.

![앱 관리자는 독립 모듈을 집계합니다.](./finding-artifacts/images/03.png)

독립 모듈의 그룹 ID를 모르는 경우 [Felix Gogo Shell](../using-the-gogo-shell.md) 을 사용하여 찾으십시오.

1. 제어판의 시스템 범주에서 **Gogo Shell** 을 선택합니다. Gogo Shell 명령 프롬프트에 명령을 입력합니다.

1. 표시 이름(예: `Apache Aries CDI`) 또는 키워드로 모듈을 검색합니다. 결과에서 모듈 번호를 기록해 둡니다. 다음 단계에서 사용할 수 있습니다. 아래 예는 Liferay 알림 API 모듈 번호 `47`을 보여줍니다.

    ![이 Gogo 명령의 결과는 모듈의 번호가 `47`임을 보여줍니다.](./finding-artifacts/images/04.png)

1. 매니페스트 헤더를 표시하려면 모듈 번호와 함께 `headers` 명령을 사용하십시오. `Bundle-Vendor` 또는 `Implementation-Vendor` 값에 유의하십시오. 이후 단계에서 이를 아티팩트 그룹과 일치시킵니다.

    ![`headers` 명령을 실행한 결과에는 모듈의 공급업체 이름과 번들 버전이 표시됩니다.](./finding-artifacts/images/05.png)

1. [Maven Central](https://search.maven.org/) 또는 [MVNRepository](https://mvnrepository.com) 에서 아티팩트 ID로 모듈을 검색합니다.

1. 3단계의 `Bundle-Vendor` 또는 `Implementation-Vendor` 이름을 아티팩트를 제공하는 그룹과 일치시켜 그룹 ID를 결정합니다.

Liferay 참조 문서는 Liferay 앱 아티팩트 속성도 제공합니다.

### 참조 문서

Liferay의 앱 Javadoc에는 각 앱 모듈의 아티팩트 ID, 버전 번호 및 표시 이름이 나열되어 있습니다. 아직 Liferay 인스턴스에 배포되지 않은 Liferay 앱 모듈을 조회하기에 가장 좋은 곳입니다.

```{note}
Core Liferay 이슈에서 이슈 정보를 찾으려면 이전 섹션 *핵심 Liferay 이슈 속성 찾기*를 참조하십시오.
```

Javadoc에서 Liferay 앱 모듈의 속성을 찾으려면 다음 단계를 따르십시오.

1. 앱 모듈 클래스에 대한 Javadoc로 이동합니다. 클래스의 Javadoc에 대한 링크가 없는 경우 Liferay 에디션용 Javadoc 앱을 검색하여 찾을 수 있습니다.

    **라이프레이 DXP** : <https://docs.liferay.com/dxp/apps>

    **라이프레이 포털** : <https://docs.liferay.com/ce/apps>

1. 클래스의 패키지 이름을 복사합니다.

1. **개요** 페이지로 이동합니다.

1. **개요** 페이지에서 2단계에서 복사한 패키지 이름을 검색합니다.

패키지 이름 위의 제목에는 모듈의 아티팩트 ID, 버전 번호 및 표시 이름이 표시됩니다. 모든 앱 모듈의 그룹 ID는 `com.liferay`입니다.

![Liferay의 앱 Javadoc은 표시 이름 다음에 그룹 ID, 아티팩트 ID 및 Gradle 아티팩트 구문의 버전 번호를 표시합니다.](./finding-artifacts/images/06.png)

```{note}
모듈 버전 번호는 현재 태그 라이브러리 참조 문서에 포함되어 있지 않습니다.
```

다음으로 MVNRepository 및 Maven Central에서 아티팩트를 조회하는 방법을 알아봅니다.

### 메이븐 센트럴

유형이나 출처에 관계없이 대부분의 아티팩트는 [MVNRepository](https://mvnrepository.com/) 및 [Maven Central](https://search.maven.org/) 에 있습니다. 이러한 사이트는 클래스 패키지를 기반으로 아티팩트를 찾는 데 도움이 될 수 있습니다. 아티팩트 패키지 이름 시작 부분에 아티팩트 ID를 포함하는 것이 일반적입니다. 예를 들어 클래스 `org.osgi.service.component.annotations.Component`에 의존하는 경우 Maven 사이트 중 하나에서 패키지 이름 `org.osgi.service.component.annotations` 을 검색합니다.

```{note}
필요한 Liferay 아티팩트의 버전을 결정하려면 위의 지침을 따르십시오.
```

## 다음

아티팩트의 속성을 알았으므로 이제 아티팩트에 대한 종속성을 구성할 수 있습니다. 자세한 내용은 [종속성 지정](./specifying-dependencies.md) 을 참조하십시오.

## 관련 주제

* [패키지 가져오기](../importing-packages.md)
* [패키지 내보내기](../exporting-packages.md)
* [타사 라이브러리 패키지 종속성 해결](./resolving-third-party-library-package-dependencies.md)
* [WAR 배포 \(WAB Generator\)](../../../building-applications/reference/deploying-wars-wab-generator.md)