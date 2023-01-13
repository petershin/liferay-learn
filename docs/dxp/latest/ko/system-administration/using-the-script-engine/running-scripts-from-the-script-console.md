# 스크립트 콘솔에서 스크립트 실행

스크립트 콘솔은 Groovy 스크립트를 실행하고 출력을 인쇄하기 위한 단일 보기를 제공합니다. 여기에는 위젯 및 사용자와의 작업을 용이하게 하는 미리 정의된 변수가 있습니다. 다음 주제는 스크립트 콘솔을 시작하는 데 도움이 됩니다.

* [스크립트 콘솔에서 샘플 스크립트 실행](#running-a-sample-script-in-the-script-console)
* [스크립트 콘솔에서 사용할 수 있는 미리 정의된 변수](#predefined-variables)
* [스크립트 콘솔에서 스크립트를 실행하기 위한 팁](#tips)

```{important}
스크립트 콘솔은 시스템 운영 및 유지 관리를 위한 것입니다. 최종 사용자를 위한 것이 아닙니다. 포털 관리자에 대한 스크립트 콘솔 액세스를 제한합니다.
```

스크립트 콘솔의 샘플 스크립트 실행으로 시작하십시오.

## 스크립트 콘솔에서 샘플 스크립트 실행

스크립트 콘솔에서 샘플 스크립트를 실행하는 방법은 다음과 같습니다.

1. 관리자로 로그인합니다.
1. 제품 메뉴에서 *제어판* 로 이동하여 *구성* &rarr; *서버 관리*을 선택합니다.
1. *스크립트*을 클릭하십시오. 이것은 스크립트 콘솔입니다. 기본 샘플 스크립트는 사용자 수를 콘솔 출력에 인쇄합니다.

    ```groovy
    // ### Groovy Sample ###

    number = com.liferay.portal.kernel.service.UserLocalServiceUtil.getUsersCount();

    out.println(number);
    ```

1. *실행* 을 클릭하고 스크립트 콘솔 *출력* 에서 사용자 수를 확인합니다.

    ![스크립트 콘솔의 샘플 Groovy 스크립트는 사용자 수를 스크립트 콘솔 출력에 인쇄합니다.](./running-scripts-from-the-script-console/images/01.png)

Groovy 샘플은 Liferay 서비스 유틸리티 [`UserLocalServiceUtil`](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/service/UserLocalServiceUtil.html) 을 호출하여 사용자 수를 가져옵니다. 그런 다음 `out` (내장 `PrintWriter`)을 사용하여 스크립트 콘솔에 카운트를 기록합니다.

```{note}
*out.println* 대신 *System.out.println*을 사용하면 스크립트 콘솔이 아닌 Liferay의 로그 파일에 출력이 인쇄됩니다.
```

## 미리 정의된 스크립트 콘솔 변수

스크립트 콘솔에서 스크립트에 사용할 수 있는 미리 정의된 변수는 다음과 같습니다.

| 변하기 쉬운           | 종류                                    |
|:---------------- |:------------------------------------- |
| `out`            | `java.io.PrintWriter`                 |
| `actionRequest`  | `javax.portlet.ActionRequest`         |
| `actionResponse` | `javax.portlet.ActionReponse`         |
| `portletConfig`  | `javax.portlet.PortletConfig`         |
| `portletContext` | `javax.portlet.PortletContext`        |
| `preferences`    | `javax.portlet.PortletPreferences`    |
| `userInfo`       | `java.util.Map<String, String>` |

### 변수 사용

이 스크립트는 `actionRequest` 변수를 사용하여 포털 인스턴스의 `Company`을 가져오는 방법을 보여줍니다.

```groovy
import com.liferay.portal.kernel.util.*

company = PortalUtil.getCompany(actionRequest)
out.println("Current Company:${company.getName()}\n")

out.println("User Info:")
userInfo.each {
        k,v -> out.println("${k}:${v}")
}
```

![다음은 미리 정의된 out, actionRequest 및 userInfo 변수를 사용하여 Company 및 User에 대한 정보를 인쇄하는 Groovy 스크립트를 호출하는 예입니다.](./running-scripts-from-the-script-console/images/02.png)

## 팁

스크립트 콘솔을 사용할 때 다음 사항에 유의하십시오.

* 실행 취소가 없습니다.
* 미리보기가 없습니다.
* 권한 확인은 로컬 서비스에 적용되지 않습니다.
* 스크립트는 동기식으로 실행됩니다. 시간이 오래 걸릴 수 있는 스크립트를 실행하지 마십시오.

스크립트 콘솔을 신중하게 사용하고 프로덕션에서 실행하기 전에 비프로덕션 시스템에서 스크립트를 테스트하십시오.

스크립트 엔진은 Kaleo Workflow와 같은 스크립트 콘솔 외부에서 사용할 수 있습니다. 다음은 워크플로에서 스크립트 엔진을 사용하는 것입니다.

## 추가 정보

* [Liferay 서비스 호출](./invoking-liferay-services-from-scripts.md)
* [워크플로에서 스크립트 엔진 사용](../../process-automation/workflow/developer-guide/using-the-script-engine-in-workflow.md)
* [스크립트 예](./script-examples.md)