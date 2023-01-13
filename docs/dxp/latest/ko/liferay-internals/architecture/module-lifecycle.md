# 모듈 수명 주기

OSGi에서 모든 구성 요소, Java 클래스, 리소스 및 설명자는 모듈(OSGi 번들)을 통해 배포됩니다. `MANIFEST.MF` 파일은 내보내고 가져오는 패키지와 같은 모듈의 물리적 특성을 설명합니다. 모듈의 구성 요소 설명 파일은 기능적 특성(즉, 해당 구성 요소가 제공하고 소비하는 서비스)을 지정합니다. 모듈과 해당 구성 요소에는 고유한 수명 주기와 관리 API도 있습니다. 선언적 서비스 및 셸 도구를 사용하면 모듈 및 구성 요소 배포를 세밀하게 제어할 수 있습니다.

모듈의 내용은 활성화에 따라 다르므로 활성화 단계를 고려하십시오.

1. *설치*: 모듈 JAR을 `[Liferay Home]/deploy` 폴더에 복사하면 OSGi 프레임워크에 모듈이 설치되고 모듈이 `INSTALLED`로 표시됩니다.

1. *해결 방법*: 모듈의 모든 요구 사항이 충족되면(예: 가져오는 모든 패키지를 사용할 수 있음) 프레임워크는 모듈의 내보낸 패키지를 게시하고 모듈 `RESOLVED`를 표시합니다.

1. *활성화*:</em> *기본적으로 활성화됩니다. 즉, 프레임워크에서 시작되고 해결 시 `ACTIVE` 로 표시됩니다. 활성 모듈의 구성 요소가 활성화됩니다. 모듈이 아래 매니페스트 헤더에 표시된 대로 `지연` 활성화 정책을 지정하는 경우 다른 모듈이 해당 클래스 중 하나를 요청한 후에만 활성화됩니다.

   ```properties
   Bundle-ActivationPolicy: lazy
   ```
</p></li> </ol>

아래 그림은 모듈 수명 주기를 보여줍니다.

![이 상태 다이어그램은 모듈 수명 주기를 보여줍니다.](./module-lifecycle/images/01.png)

[Apache Felix Gogo Shell](../fundamentals/using-the-gogo-shell.md)을 사용하여 수명 주기를 관리할 수 있습니다. 모듈을 설치/제거하고 시작/중지할 수 있습니다. 모듈을 업데이트하고 업데이트를 사용하도록 종속 모듈에 알릴 수 있습니다. [Liferay Workspace](../../building-applications/tooling/liferay-workspace/what-is-liferay-workspace.md), [Blade CLI](../../building-applications/tooling/blade-cli/installing-and-updating-blade-cli.md)및 [Liferay Dev Studio](https://liferay.dev/-/ide) 를 포함한 Liferay의 도구는 OSGi Admin API를 사용하는 유사한 셸 명령을 제공합니다.

모듈을 활성화하면 해당 구성 요소가 활성화됩니다. 단, *개의 활성화된* 구성 요소만 사용할 수 있습니다. 구성 요소 활성화를 위해서는 참조된 모든 서비스가 충족되어야 합니다. 즉, 구성 요소가 참조하는 모든 서비스를 등록해야 합니다. 참조와 일치하는 가장 높은 순위의 서비스가 구성 요소에 바인딩됩니다. 컨테이너가 구성 요소가 참조하는 모든 서비스를 찾아 바인딩하면 구성 요소가 등록됩니다. 이제 활성화할 준비가 되었습니다.

구성 요소는 *지연* (기본값) 또는 *즉시* 활성화 정책을 사용할 수 있습니다. 즉각적인 활성화를 지정하기 위해 개발자는 속성 `=true` 을 [`@Component`](https://docs.osgi.org/javadoc/osgi.cmpn/7.0.0/org/osgi/service/component/annotations/Component.html) 주석에 추가합니다.

```java
@Component(
    immediate = true,
    ...
)
```

즉시 활성화를 지정하지 않으면 구성 요소의 활성화가 지연됩니다. 즉, 구성 요소가 요청되면 구성 요소의 객체가 생성되고 해당 클래스가 로드됩니다. 이러한 방식으로 지연된 활성화는 시작 시간을 개선하고 리소스를 절약합니다.

Gogo Shell의 [서비스 구성 요소 런타임 명령](http://felix.apache.org/documentation/subprojects/apache-felix-service-component-runtime.html#shell-command) 을 사용하면 구성 요소를 관리할 수 있습니다.

* `scr:list [bundleID]`: 모듈(번들) 구성 요소를 나열합니다.

* `scr:info [componentID|fullClassName]`: 상태 및 구성 요소가 제공하는 서비스를 포함하여 구성 요소를 설명합니다.

* `scr:enable [componentID|fullClassName]`: 구성 요소를 활성화합니다.

* `scr:disable [componentID|fullClassName]`: 구성 요소를 비활성화합니다. 서버가 다시 시작될 때까지 서버(또는 클러스터의 현재 서버 노드)에서 비활성화됩니다.

서비스 참조는 기본적으로 _정적_ 및 _reluctant_ 입니다. 즉, 삽입된 서비스는 서비스가 비활성화될 때까지 참조 구성 요소에 바인딩된 상태로 유지됩니다. 또는 참조에 대해 *욕심* 서비스 정책을 지정할 수 있습니다. 순위가 높은 매칭 서비스가 등록될 때마다 프레임워크는 구성 요소(서비스 정책이 욕심쟁이)에서 낮은 순위의 서비스를 바인딩 해제하고 자동으로 새 서비스를 제자리에 바인딩합니다. 욕심 많은 정책을 사용하는 [`@Reference`](https://docs.osgi.org/javadoc/osgi.cmpn/7.0.0/org/osgi/service/component/annotations/Reference.html) 주석은 다음과 같습니다.

```java
@Reference(policyOption = ReferencePolicyOption.GREEDY)
```

선언적 서비스 주석을 사용하여 구성 요소 활성화 및 서비스 정책을 지정합니다. Gogo Shell 명령을 사용하여 모듈 및 구성 요소를 제어합니다.

## 추가 정보

* [모듈 프로젝트](../fundamentals/module-projects.md)
* [Gogo 셸 명령](../fundamentals/using-the-gogo-shell/gogo-shell-commands.md)
* [Liferay Workspace](../../building-applications/tooling/liferay-workspace/what-is-liferay-workspace.md)