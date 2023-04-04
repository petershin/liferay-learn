---
uuid: ab6ec89f-7268-490d-8293-271ea453179d
---

# MVC 작업 명령

MVC 액션 명령은 별도의 클래스로 액션을 처리합니다. Action Commands를 사용하면 액션이 많은 `MVCPortlet`s에 액션 로직을 구성할 수 있습니다. 포틀릿의 JSP에 있는 조치 URL은 지정된 MVC 조치 명령 클래스를 호출합니다.

MVC 작업 명령을 사용하는 예제 포틀릿을 배포한 다음 검사합니다.

## 포틀릿의 MVC 작업 명령 호출

예제 포틀릿의 두 가지 작업은 호출되는 MVC 작업 명령 클래스 및 메서드를 나타내는 메시지를 기록합니다.

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계에 따라 포틀릿을 배포하고 해당 동작을 트리거합니다:

1. 예제를 다운로드하여 압축을 풉니다.

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/building-applications/developing-a-java-web-application/using-mvc/liferay-l6y9.zip -O
   ```

   ```bash
   unzip liferay-l6y9.zip
   ```

1. 예제를 빌드하고 배포합니다.

    ```bash
    cd liferay-l6y9
    ```

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 모듈 JAR을 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```

1. Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```bash
    STARTED com.acme.l6y9.web_1.0.0
    ```

1. *Samples* 카테고리의 *L6Y9 Portlet* 위젯을 위젯 페이지에 추가하십시오. L6Y9 포틀릿이 나타납니다.

   ![페이지에 L6Y9 포틀릿을 추가했습니다.](./mvc-action-command/images/01.png)

   링크는 서로 다른 `MVCActionCommand` 클래스의 메서드를 호출합니다. 학습 목적으로 메서드는 자신을 식별하는 메시지를 기록합니다.

1. *Do L6Y9 Able*클릭합니다. `DoL6Y9AbleMVCActionCommand` `doProcessAction` 메서드를 호출하는 로그를 기록합니다.

    ```bash
    [DoL6Y9AbleMVCActionCommand:26] Invoke #doProcessAction(ActionRequest, ActionResponse)
    ```

1. *Do L6Y9 Baker*을 클릭합니다. `DoL6Y9BakerMVCActionCommand` `doProcessAction` 메서드를 호출하는 로그를 기록합니다.

    ```bash
    [DoL6Y9BakerMVCActionCommand:26] Invoke #doProcessAction(ActionRequest, ActionResponse)
    ```

MVC 작업 명령이 실제로 작동하는 것을 보았습니다. 이제 그들이 어떻게 작동하는지보십시오.

## 포틀릿 검사

`L6Y9Portlet` 최소 [`MVCPortlet`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/portlet/bridges/mvc/MVCPortlet.java)입니다.

```{literalinclude} ./mvc-action-command/resources/liferay-l6y9.zip/l6y9-web/src/main/java/com/acme/l6y9/web/internal/portlet/L6Y9Portlet.java
:language: java
:lines: 9-19
```

[`@Component`](https://osgi.org/javadoc/r6/residential/org/osgi/service/component/annotations/Component.html) `javax.portlet.name` 속성은 포틀릿의 이름을 설정합니다.

```{literalinclude} ./mvc-action-command/resources/liferay-l6y9.zip/l6y9-web/src/main/java/com/acme/l6y9/web/internal/portlet/L6Y9Portlet.java
:dedent: 2
:language: java
:lines: 14
```

포틀릿은 기본적으로 `/view.jsp` 렌더링합니다.

```{note}
`MVCActionCommand`는 포틀릿의 이름(예: 포틀릿 구성 요소 `javax.portlet.name` 속성 값)으로 포틀릿에 바인딩됩니다.
```

예제 포틀릿은 기본적으로 `view.jsp` 렌더링합니다. 다음으로 JSP가 MVC Action Command 클래스를 호출하는 방법을 볼 수 있습니다.

## 포틀릿 작업 URL 검사

포틀릿의 `view.jsp` 파일은 포틀릿의 MVC 조치 명령을 호출하기 위한 링크를 렌더링합니다.

```{literalinclude} ./mvc-action-command/resources/liferay-l6y9.zip/l6y9-web/src/main/resources/META-INF/resources/view.jsp
:language: jsp
```

첫 번째 줄은 `포틀릿` 접두사를 통해 Portlet 2.0 태그 라이브러리를 사용할 수 있도록 합니다. 이 JSP는 태그 라이브러리의 `portlet:actionURL` 태그를 사용하여 UI 구성 요소에 작업을 바인딩합니다. 각 태그는 MVC 작업 명령의 `mvc.command.name` 속성 값을 태그의 `이름` 특성에 할당하여 UI 구성 요소를 MVC 명령에 매핑합니다.

| `view.jsp` 포틀릿 작업 URL                              | `DoL6Y9AbleMVCActionCommand` 구성 요소 속성 |
|:-------------------------------------------------- |:------------------------------------- |
| `<portlet:actionURL name="/do_l6y9_able" />` | `mvc.command.name=/l6y9/do_l6y9_able` |

| `view.jsp` 포틀릿 작업 URL                               | `DoL6Y9BakerMVCActionCommand` 구성 요소 속성 |
|:--------------------------------------------------- |:-------------------------------------- |
| `<portlet:actionURL name="/do_l6y9_baker" />` | `mvc.command.name=/l6y9/do_l6y9_baker` |

예를 들어 *Do L6Y9 Able* 링크를 클릭하면 `DoL6Y9AbleMVCActionCommand`의 `doProcessAction` 메서드가 호출됩니다.

## MVCActionCommand 클래스 검사

MVC Action Command 클래스는 [`MVCActionCommand`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/portlet/bridges/mvc/MVCActionCommand.java) 직접 구현하거나 [`BaseMVCActionCommand`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/portlet/bridges/mvc/BaseMVCActionCommand.java)확장하여 구현할 수 있습니다. `DoL6Y9AbleMVCActionCommand` `BaseMVCActionCommand`확장합니다.

```{literalinclude} ./mvc-action-command/resources/liferay-l6y9.zip/l6y9-web/src/main/java/com/acme/l6y9/web/internal/portlet/action/DoL6Y9AbleMVCActionCommand.java
:language: java
:lines: 13-34
```

`DoL6Y9AbleMVCActionCommand` `MVCActionCommand` 서비스를 제공하는 [`구성 요소`](https://docs.osgi.org/javadoc/osgi.cmpn/7.0.0/org/osgi/service/component/annotations/Component.html) 입니다. `DoL6Y9AbleMVCActionCommand`의 구성 요소 속성은 `javax.portlet.name=com_acme_l6y9_web_internal_portlet_L6Y9Portlet` 속성이 있는 포틀릿에 구성 요소를 적용하고 구성 요소를 `/do_l6y9_able`라는 MVC 명령에 매핑합니다. 사용자가 해당 명령 이름에 바인딩된 작업을 트리거하면 `DoL6Y9AbleMVCActionCommand`의 `doProcessAction` 메서드가 실행됩니다. 데모를 위해 위의 `doProcessAction` 메서드는 자신을 식별하는 메시지를 기록합니다.

```{note}
각 포틀릿에 대해


      의 `javax.portlet.name` 속성을 선언하여 `MVCActionCommand` 구성
            
            
         포틀릿과 연결할 수 있습니다. .name=com_acme_l6y9_web_internal_portlet_L6Y0Portlet",
            "mvc.command.name=/l6y9/download"
         },
         서비스 = MVCActionCommand.class
)
```

`DoL6Y9BakerMVCActionCommand` `DoL6Y9AbleMVCActionCommand` 과 유사하지만 이름에 `Baker` 또는 `baker` 대신 `Able` 또는 ``이 포함되어 있습니다.

다음으로 포틀릿의 JSP가 UI 구성 요소 작업을 명령에 매핑하는 방법을 확인합니다.

## 무엇 향후 계획

이제 MVC 작업 명령을 사용하는 방법을 알았으므로 [MVC 렌더링 명령](./mvc-render-command.md) 및 [MVC 리소스 명령](./mvc-resource-command.md)을 확인하고 싶을 수 있습니다. 앱의 콘텐츠 현지화를 시작하려면 [현지화된 메시지 사용](./using-localized-messages-in-an-mvc-portlet.md)참조하십시오. 모델, 지속성 및 서비스 계층 개발을 시작할 준비가 되었으면 [Service Builder](../../data-frameworks/service-builder.md)을 방문하십시오.

## 추가 정보

* [MVC 사용](../using-mvc.md)
* [MVC 렌더링 명령](./mvc-render-command.md)
* [MVC 리소스 명령](./mvc-resource-command.md)
