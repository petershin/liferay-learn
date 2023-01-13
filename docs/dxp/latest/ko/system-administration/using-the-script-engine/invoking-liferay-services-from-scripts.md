# 스크립트에서 Liferay 서비스 호출

많은 스크립팅 시나리오에는 Liferay 서비스를 호출해야 합니다. [Liferay `*ServiceUtil` 클래스](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/) 은 [스크립트 콘솔](./running-scripts-from-the-script-console.md)에서 Liferay 서비스를 호출하는 가장 빠르고 편리한 방법입니다. Java를 사용하는 것과 동일한 방식으로 Groovy를 사용하여 Liferay 서비스를 호출합니다. Groovy의 구문은 간결하고 우아한 스크립트 작성을 용이하게 합니다.

Java 코드와 `UserLocalServiceUtil` 을 사용하여 사용자 목록을 검색하고 사용자 이름을 Liferay의 로그에 인쇄하는 Groovy 코드를 비교하여 시연합니다.

## 자바

DXP에 배포된 모듈에서 이 Java 코드를 실행하거나 [스크립트 콘솔](./running-scripts-from-the-script-console.md)에서 코드를 실행할 수 있습니다.

```groovy
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.service.UserLocalServiceUtil;
import java.util.List;

...

int userCount = UserLocalServiceUtil.getUsersCount();
List<User> users = UserLocalServiceUtil.getUsers(0, userCount);

for (User user:users) {
    System.out.println("User Name: " + user.getFullName());
}

...
```

## Groovy

또는 스크립트 콘솔에서 Groovy 코드를 사용할 수 있습니다.

```groovy
import com.liferay.portal.kernel.service.UserLocalServiceUtil

userCount = UserLocalServiceUtil.getUsersCount()
users = UserLocalServiceUtil.getUsers(0, userCount)

for (user in users){
    System.out.println("User Name: " + user.getFullName())
}
```

`com.liferay.portal.kernel.model.User` 및 `java.util.List` 가져오기는 스크립트 콘솔에서 사용할 수 있기 때문에 필요하지 않습니다. Groovy 구문은 Java 구문보다 간단합니다.

```{note}
서비스에 `*ServiceUtil` 클래스가 없으면 [Service Tracker](../../building-applications/core-frameworks/dependency-injection.md)를 사용하여 서비스에 액세스합니다.
```

## 다음 단계

* [스크립트 콘솔에서 스크립트 실행](./running-scripts-from-the-script-console.md)
* [워크플로에서 스크립트 엔진 사용](../../process-automation/workflow/developer-guide/using-the-script-engine-in-workflow.md)
* [스크립트 예](./script-examples.md)