# 블랙리스트 앱

번들 블랙리스트는 여러 앱, OSGi 번들(모듈) 및 WAR 플러그인을 한 번에 제거하거나 다시 설치하는 편리한 방법입니다. [Application Manager](./using-the-app-manager.md) 또는 [Gogo shell](../../../liferay-internals/fundamentals/using-the-gogo-shell.md)을 사용하여 앱, 모듈 및 플러그인 설치를 개별적으로 관리하는 수고를 덜 수 있습니다.

```{important}
블랙리스트는 DXP가 앱을 제거하는 데 사용하는 [OSGi 구성](../../configuring-liferay/configuration-files-and-factories/using-configuration-files.md#creating-configuration-files) 입니다. 이를 사용하면 나열된 앱이 제거될 때까지 설치되지 않습니다.
```

[제어판에서](#blacklisting-via-the-control-panel) 또는 [OSGi 구성 사용](#blacklisting-via-a-configuration-file) (`.config`) 파일을 사용하여 목록을 설정할 수 있습니다. ( [내보내기](../../configuring-liferay/configuration-files-and-factories/using-configuration-files.md#creating-configuration-files) 하여 제어판에서).

## 블랙리스트

DXP는 블랙리스트에 설치된 모든 앱, 모듈 또는 플러그인을 제거합니다. 블랙리스트에 있는 동안에는 설치할 수 없습니다. 로그는 각 제거를 보고합니다.

```{note}
LPKG를 블랙리스트에 올리면 모든 내부 모듈이 제거됩니다.
```

### 제어판을 통한 블랙리스트

앱, 모듈 및 플러그인을 블랙리스트에 추가하려면 다음 단계를 따르세요.

1. 제어판에서 **구성** &rarr; **시스템 설정** &rarr; **모듈 컨테이너** 로 이동합니다. 번들 블랙리스트 화면이 나타납니다.

1. 번들 블랙리스트 화면에서 제거할 앱, LPKG 파일, [모듈](https://help.liferay.com/hc/articles/360035467532-OSGi-and-Modularity#modules) JAR 또는 WAR에 대한 번들 기호 이름을 추가합니다. 각 항목에 대해 추가 버튼(![Add](../../../images/icon-add.png))을 클릭하고 항목의 번들 기호 이름을 입력합니다(아래 표 [참조](#blacklist-bundle-symbolic-names) ). 완료되면 **저장** 버튼을 클릭합니다. DXP는 블랙리스트에 있는 항목을 즉시 제거합니다.
   
   ![이 블랙리스트는 클래식 테마 플러그인 WAR, Liferay Collaboration - Liferay Blogs - API 모듈 및 com.acme.greeter 모듈을 제거합니다.](./blacklisting-apps/images/02.png)

### 구성 파일을 통한 블랙리스트

블랙리스트는 제어판에서 OSGi 구성(`.config`) 파일로 내보낼 수도 있습니다. 파일을 수정하고 DXP에 배포하면 다음과 같은 추가 효과가 있습니다.

* DXP 서버 시작 시 변경 사항 유지
* 로컬 클러스터 노드에서 다른 모든 노드로 변경 사항을 전파합니다.

다음 단계를 사용하여 구성 파일을 사용하여 블랙리스트에 추가하십시오.

1. 현재 사용 중인 블랙리스트를 내보내려면 작업 버튼(![액션](./blacklisting-apps/images/03.png)) 다음 **내보내기** 을 클릭합니다. 그러면 블랙리스트 구성 파일이 다운로드됩니다(`com.liferay.portal.bundle.blacklist.internal.BundleBlacklistConfiguration.config`). 다음은 예제 블랙리스트 내보내기의 파일 내용입니다. 

    ```properties
    blacklistBundleSymbolicNames=[ \
      "classic-theme", \
      "Liferay\ Collaboration\ -\ Liferay\ Blogs\ -\ API", \
      "com.acme.greeter", \
    ]
    ```

1. 제거하려는 앱, 모듈 또는 플러그인의 번들 기호 이름을 추가하여 후속 DXP 서버 시작 시 설치를 방지합니다. 

    ```{warning}
    구성 값에는 추가 공백이 포함될 수 없습니다. 추가 공백은 목록을 단락시키거나 구성 항목을 무효화할 수 있습니다.
    ```

1. 구성 파일을 배포하려면 `[Liferay Home]/osgi/configs`폴더에 복사합니다. [Liferay Home](../../../installation-and-upgrades/reference/liferay-home.md) 폴더는 일반적으로 앱 서버의 상위 폴더입니다.

### 블랙리스트 번들 심볼릭 이름

| 유형        | 번들 기호 이름                                                                                         |
|:--------- |:------------------------------------------------------------------------------------------------ |
| 앱         | [앱 관리자에 표시되는 앱 이름](./using-the-app-manager.md)                                                   |
| LPKG      | `.lpkg` 확장자가 없는 LPKG 파일 이름                                                                       |
| 모듈/번들 JAR | `Bundle-SymbolicName` in `bnd.bnd` 또는 `MANIFEST.MF` 파일                                           |
| WAR       | 서블릿 컨텍스트 이름 속성이 없는 경우 `liferay-plugin-package.properties` 파일의 서블릿 컨텍스트 이름 또는 WAR 파일 이름(- `.war`) |

## 블랙리스트 항목 재설치

블랙리스트에 있는 항목을 다시 설치하려면 다음 단계를 따르십시오.

1. 구성 파일 `com.liferay.portal.bundle.blacklist.internal.BundleBlacklistConfiguration.config`을 엽니다.

1. `blacklistBundleSymbolicNames` 목록에서 LPKG, 모듈 JAR 또는 WAR의 기호 이름을 제거하고 파일을 저장하십시오.

**모두** 을 다시 설치하려면 블랙리스트에 있는 항목이 다음 옵션 중 하나를 실행합니다.

* 구성 파일을 제거하십시오.
* [Application Manager](./using-the-app-manager.md) 또는 [Felix Gogo Shell](../../../liferay-internals/fundamentals/using-the-gogo-shell.md)를 사용하여 모듈 `com.liferay.portal.bundle.blacklist` 을 제거합니다.

```{tip}
블랙리스트에 추가된 항목을 일시적으로 다시 설치하려면 *시스템 설정*의 번들 블랙리스트 모듈에서 기호 이름을 제거하고 *업데이트* 버튼을 클릭하십시오. 블랙리스트 구성 파일(``[Liferay Home]/osgi/configs`` 폴더에 있음)을 사용 중이고 이후 서버 시작 시 항목을 설치하려면 파일에서 항목의 기호 이름을 제거해야 합니다.
```

로그는 각 항목 설치를 보고합니다.

축하합니다! 이제 간단한 목록을 사용하여 여러 앱, 모듈 및 플러그인 설치를 관리할 수 있습니다.

## 추가 정보

* [앱 관리](./using-the-app-manager.md)
* [Felix Gogo 셸 사용](../../../liferay-internals/fundamentals/using-the-gogo-shell.md)
* [OSGi 구성요소 블랙리스트 작성](./blacklisting-osgi-components.md)
* [포틀릿, 테마 및 레이아웃 템플릿 구성](./configuring-portlets-themes-and-layout-templates.md)