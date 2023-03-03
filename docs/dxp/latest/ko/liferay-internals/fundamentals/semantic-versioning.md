# 시맨틱 버전 관리

[Semantic Versioning](https://semver.org) 은 릴리스 가능한 소프트웨어 구성 요소에서 이루어진 API 변경 정도에 따라 버전 번호를 증가시키는 3계층 버전 관리 시스템입니다. 종속 소비자 및 API 구현을 위한 패키지 또는 모듈의 프로그래밍 방식 호환성을 전달하기 위한 표준입니다. 패키지가 프로그래밍 방식으로(즉, 의미론적으로) 프로젝트와 호환되지 않는 경우 [Bnd](http://bnd.bndtools.org) ( [Liferay 생성 모듈 프로젝트](../../building-applications/tooling/blade-cli/generating-projects-with-blade-cli.md)을 빌드할 때 사용됨)은 해당 프로젝트의 빌드를 즉시 실패합니다.

시맨틱 버전 형식은 다음과 같습니다.

```
MAJOR.MINOR.MICRO
```

특정 이벤트는 각 계층을 강제로 증가시킵니다.

* *주요:* 호환되지 않는 API 브레이킹 변경이 이루어짐
* *MINOR:* API 제공자에게만 영향을 미치는 변경 또는 새로운 이전 버전과 호환되는 기능이 추가됨
* *MICRO:* 이전 버전과 호환되는 버그가 수정되었습니다.

시맨틱 버전 관리에 대한 자세한 내용은 공식 [Semantic Versioning](https://semver.org/) 사이트 및 [OSGi Alliance의 Semantic Versioning](http://www.osgi.org/wp-content/uploads/SemanticVersioning1.pdf) 기술 백서를 참조하십시오.

Liferay의 모든 모듈은 Semantic Versioning을 사용합니다.

시맨틱 버전 관리를 따르는 것은 DXP가 수백 개의 독립적인 OSGi 모듈을 포함하는 모듈식 플랫폼이기 때문에 특히 중요합니다. 서로 의존하는 독립적인 모듈이 많기 때문에 호환성을 선언하지 않고 새 패키지 버전을 출시하는 것이 두려울 수 있습니다. Semantic Versioning의 간단한 시스템과 [Liferay 도구](../../building-applications/tooling/developer-tools-overview.md) 은 모듈의 호환성을 관리하는 데 도움이 됩니다.

## 프로젝트 기준 설정

Semantic Versioning을 수동으로 따라가는 것은 믿을 수 없을 정도로 쉬워 보입니다. 선의의 개발자가 프로젝트의 시맨틱 버전을 수동으로 업데이트했지만 나중에 실수를 했다는 슬픈 역사가 있습니다. 사실 단순한 업데이트의 영향을 예상하기는 어렵습니다. 이를 방지하려면 프로젝트를 업데이트한 후 프로젝트를 *기준선* 로 설정할 수 있습니다. 이를 통해 프로젝트가 Semantic Versioning 규칙을 준수하는지 확인하고 인간에게 항상 명확하지 않은 API 변경 사항을 포착할 수 있습니다. Liferay의 Baseline Gradle 플러그인을 사용하여 기준 설정 기능을 제공할 수 있습니다. Gradle 빌드 구성에 추가하고 다음 명령을 실행합니다.

```bash
./gradlew baseline
```

이 Baseline Gradle 플러그인 플러그인은 기본적으로 [Liferay Workspace](../../building-applications/tooling/liferay-workspace/what-is-liferay-workspace.md) 에서 제공되지 않습니다.

`baseline` 명령을 실행하면 플러그인이 새 모듈의 공개 내보낸 API를 최신 릴리스된 스냅샷이 아닌 모듈과 비교합니다. 변경 사항이 있으면 OSGi Semantic Versioning 규칙을 사용하여 최소 새 버전을 계산합니다. 새 모듈의 버전이 낮으면 오류가 발생합니다.

도구에만 의존하지 마십시오. Java 클래스 또는 인터페이스의 서명 또는 API *사용* 변경 사항(예: 메서드 호출 순서에 대한 가정 또는 입력 및/또는 출력 인코딩 변경 사항)에 표시되지 않은 호환성 변경 사항을 식별할 만큼 똑똑하지 않습니다. Baseline은 이름에서 알 수 있듯이 많은 종류의 호환성 문제가 스쳐 지나가지 않도록 *기준선* 편안함의 특정 척도를 제공합니다.

베이스라이닝을 사용하면 프로젝트의 Semantic Versioning이 API가 표현하는 것만큼 정확합니다.

## 아티팩트 및 종속성 버전 관리

Semantic Versioning을 사용하여 프로젝트의 아티팩트 및 종속성 버전을 추적하는 두 가지 방법이 있습니다.

* 버전 범위
* 정확한 버전(일대일)

여러 DXP 버전용으로 프로젝트를 빌드하고 최대 호환성을 유지하려는 경우 버전 범위를 추적해야 합니다. 즉, 앱에 대해 여러 패키지 버전이 작동하는 경우 그 중 하나를 사용하도록 앱을 구성할 수 있습니다. 또한 Bnd는 모듈이 종속된 각 패키지의 의미상 호환 가능한 범위를 자동으로 결정하고 모듈의 매니페스트에 범위를 기록합니다.

버전 범위 구문에 대한 도움말은 [OSGi 사양](https://osgi.org/specification/osgi.core/7.0.0/framework.module.html#i3189032) 을 참조하십시오.

OSGi 번들의 `bnd.bnd` 에서 가져온 패키지의 버전 범위는 다음과 같습니다.

```properties
Import-Package: com.liferay.docs.test; version="[1.0.0,2.0.0)"
```

널리 사용되는 빌드 도구도 이 구문을 따릅니다. Gradle에서 종속성의 버전 범위는 다음과 같습니다.

```groovy
compile group: "com.liferay.portal", name: "com.liferay.portal.test", version: "[1.0.0,2.0.0)"
```

최신 릴리스 버전을 지정하는 것도 상한선이 없는 버전 범위로 간주할 수 있습니다. Gradle에서 지정하는 방법은 다음과 같습니다.

```properties
version: "latest.release"`
```

다양한 버전을 추적하려면 대가가 따릅니다. 문제를 디버깅할 때 이전 빌드를 재현하기는 어렵습니다. 또한 사용되는 버전에 따라 동작이 달라질 위험이 있습니다. 또한 최신 릴리스에 의존하면 주요 변경 사항이 도입된 경우 프로젝트와의 호환성이 깨질 수 있습니다. 버전 범위를 지정할 때 주의를 기울이고 포함된 모든 버전에서 프로젝트를 테스트하십시오.

종속성의 정확한 버전을 추적하는 것이 더 안전하지만 덜 유연합니다. 특정 DXP 버전으로 제한되거나 해당 특정 버전에만 존재하는 API에 잠길 수 있습니다. 그러나 모듈은 테스트하기가 훨씬 쉽고 예기치 않은 오류가 발생할 가능성이 적습니다.

```{note}
`bnd.bnd` 파일에서 패키지 버전을 지정할 때 정확한 버전은 일반적으로 `version="1.1.2"`와 같이 지정됩니다. 그러나 이 구문은 기술적으로 범위입니다. [1.1.2, ∞)로 해석됩니다. 따라서 더 높은 버전의 패키지를 사용할 수 있는 경우 지정한 버전 대신 사용됩니다. 이러한 경우 테스트를 거친 호환 버전의 버전 범위를 지정하는 것이 좋습니다. 진정한 정확한 일치를 지정하려는 경우 구문은 다음과 같습니다. `[1.1.2]`. 자세한 내용은 OSGi 사양의 [버전 범위](https://osgi.org/specification/osgi.core/7.0.0/framework.module.html#i3189032) 섹션을 참조하세요.

Gradle은 버전이 하나만 지정된 경우 정확한 버전을 사용합니다.
```

이제 종속성을 범위 및 정확한 일치로 추적하는 장단점을 알게 되었습니다.

## 추가 정보

* [패키지 가져오기](./importing-packages.md)
* [패키지 내보내기](./exporting-packages.md)
* [종속성 구성](./configuring-dependencies.md)
