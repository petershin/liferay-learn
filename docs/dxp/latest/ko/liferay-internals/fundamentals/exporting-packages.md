# 패키지 내보내기

OSGi에서 패키지는 기본적으로 비공개입니다. 다른 모듈이 가져 [사용할 수 있도록 패키지를 명시적으로 내보내야](./importing-packages.md).

패키지를 내보내는 방법은 다음과 같습니다.

1. `bnd.bnd` 파일을 엽니다.

1. 아직 추가하지 않은 경우 `Export-Package:` 헤더를 추가합니다.

1. `Export-Package:` 헤더 뒤에 패키지 이름을 나열합니다.

    ```groovy
    Export-Package: com.liferay.petra.io,com.liferay.petra.io.unsync
    ```

[ [Blade CLI](../../building-applications/tooling/blade-cli/generating-projects-with-blade-cli.md) 또는 Liferay Developer Studio를 사용하여 생성된 Workspace](../../building-applications/tooling/liferay-workspace/what-is-liferay-workspace.md)기반 프로젝트에는 [Bnd](http://bnd.bndtools.org/) 가 있습니다. Bnd는 `bnd.bnd` 파일에서 모듈 JAR `META-INF/MANIFEST.MF` 파일로 OSGi 헤더를 전파합니다.

```{important}
여러 JAR에서 동일한 패키지를 내보내지 마십시오. 다른 모듈에서 동일한 패키지를 내보내면 예측할 수 없는 부작용이 있는 "패키지 분할" 문제가 발생합니다.
```

```{note}
Bnd는 모듈의 내보낸 패키지를 *대체 가능*하게 만듭니다. 즉, Bnd는 모듈의 내보낸 패키지를 다른 모듈에서 내보낸 이름은 같지만 잠재적으로 다른 버전의 호환 가능한 패키지로 대체합니다. Bnd는 모듈이 내보내는 모든 패키지를 자동으로 가져오게 함으로써 이를 가능하게 합니다. 이러한 방식으로 모듈은 자체적으로 작동할 수 있지만 패키지의 다른(호환 가능한) 버전 또는 심지어 동일한 버전을 제공하는 모듈과 함께 작동할 수도 있습니다. 다른 모듈의 패키지는 다른 모듈과 더 나은 "연결" 기회를 제공할 수 있습니다. [Peter Kriens의 블로그 게시물](http://blog.osgi.org/2007/04/importance-of-exporting-nd-importing.html) 은 대체 가능한 내보내기를 설명합니다.
```

이제 모듈의 멋진 패키지를 공유할 수 있습니다!

## 관련 주제

* [종속성 구성](./configuring-dependencies.md)
* [시맨틱 버전 관리](./semantic-versioning.md)
* [Liferay Workspace](../../building-applications/tooling/liferay-workspace/what-is-liferay-workspace.md)
* [블레이드 CLI](../../building-applications/tooling/blade-cli/generating-projects-with-blade-cli.md)