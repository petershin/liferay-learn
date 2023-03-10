# 스크립트 예

다음은 DXP에서 스크립트를 사용하는 데 도움이 되는 몇 가지 예입니다. 대부분의 예제는 Liferay 블로그 게시물 [5 Liferay Script Console 사용 개선 팁](https://liferay.dev/blogs/-/blogs/5-tips-to-improve-usage-of-the-liferay-script-console) 에서 가져왔습니다.

## 예 1: 사용자에게 새로운 이용 약관 제공

이 예에서는 데이터베이스에서 사용자 정보를 검색하고 사용자를 수정한 다음 변경 사항을 데이터베이스에 저장합니다. 회사에서 [이용 약관](https://help.liferay.com/hc/ko/articles/360031899692-Instance-Configuration-Instance-Settings#terms-of-use) 을 업데이트하고 이를 사용자에게 제공하려고 한다고 가정합니다. 사용자가 사용 약관에 동의하면 해당 사용자와 연결된 사용자 레코드에 `successfulToTermsOfUse` 이라는 부울 필드가 설정됩니다. 필드 값이 `true`인 한 사용자에게 사용 약관이 표시되지 않습니다. 모든 사용자에 대해 필드 `false` 을 설정하면 로그인하기 전에 사용 약관에 다시 동의해야 합니다.

1. 스크립트 콘솔에서 이 스크립트를 입력하고 실행합니다.

    ```groovy
    import com.liferay.portal.kernel.service.UserLocalServiceUtil

    userCount = UserLocalServiceUtil.getUsersCount()
    users = UserLocalServiceUtil.getUsers(0, userCount)

    for (user in users) { println("User Name: " + user.getFullName() + " -- " +
    user.getAgreedToTermsOfUse()) }
    ```

    이 스크립트는 각 사용자의 `successfulToTermsOfUse` 필드 값을 인쇄합니다.

1. 스크립트를 다음으로 바꿉니다.

    ```groovy
    import com.liferay.portal.kernel.service.UserLocalServiceUtil

    userCount = UserLocalServiceUtil.getUsersCount()
    users = UserLocalServiceUtil.getUsers(0, userCount)

    long currentUserId = Long.parseLong(userInfo.get("liferay.user.id"))

    for (user in users){

        if(!user.isDefaultUser() && (user.getUserId() != currentUserId)) {

                user.setAgreedToTermsOfUse(false)
                UserLocalServiceUtil.updateUser(user)

        }

    }
    ```

    스크립트는 각 사용자의 `successfulToTermsOfUse` 필드를 `false`으로 설정합니다. 기본 사용자와 현재 로그인되어 있고 스크립트를 실행 중인 기본 관리 사용자를 건너뜁니다.

1. **실행** 을 클릭합니다.

1. 첫 번째 스크립트를 다시 실행하여 스크립트가 레코드를 업데이트했는지 확인합니다.

모든 사용자(기본 사용자 및 귀하의 사용자 제외)가 업데이트됩니다. 모든 사용자가 동의할 수 있도록 새 이용약관을 활성화했습니다.

## 예 2: 스크립트 출력에 HTML 마크업 포함

스크립트 콘솔은 출력을 HTML 콘텐츠로 렌더링합니다. 따라서 스크립트 출력에 HTML 마크업을 포함하여 모양과 느낌을 변경할 수 있습니다. 예를 들면 다음과 같습니다.

```groovy
import com.liferay.portal.kernel.service.*

number = com.liferay.portal.kernel.service.UserLocalServiceUtil.getUsersCount();
out.println(
        """
                <div style="background-color:black; text-align: center">
                        <h1 style="color: #37A9CC; font-size:xx-large">${number}</h1>
                </div>
        """);
```

![이 스크립트는 HTML을 사용하여 출력 스타일을 지정합니다.](./script-examples/images/01.png)

## 예제 3: 스크립트 콘솔에서 예외 표시

스크립트 콘솔의 표준 오류 메시지는 다음과 같습니다.

```
Your request failed to complete.
```

메시지는 오류를 설명하거나 세부 정보를 제공하지 않습니다. 오류 정보를 얻으려면 로그를 검사해야 합니다. 그러나 try / catch 블록을 사용하여 예외를 캡처하고 콘솔에 예외 정보를 인쇄할 수 있습니다.

```groovy
try {
        nullVar = null
        out.println(nullVar.length())
} catch(e) {
        out.println("""<div class="portlet-msg-error">${e}</div>""")
        e.printStackTrace(out)
}
```

![다음은 예외를 포착하고 예외 정보를 스크립트 콘솔에 출력하는 Groovy 스크립트의 예입니다.](./script-examples/images/02.png)

## 예 4: 파일에 출력 로깅

스크립트의 출력은 스크립트가 완료될 때만 스크립트 콘솔에 표시됩니다. 스크립트의 진행 상황을 보려면 메시지를 파일에 기록할 수 있습니다.

```groovy
import com.liferay.portal.kernel.service.*
import com.liferay.portal.kernel.dao.orm.*

// Output management

final def SCRIPT_ID = "MYSCRIPT"
outputFile = new File("""${System.getProperty("liferay.home")}/scripting/out-${SCRIPT_ID}.txt""")
outputFile.getParentFile().mkdirs()

def trace(message) {
        out.println(message)
        outputFile << "${message}\n"
}

// Main code

users = UserLocalServiceUtil.getUsers(QueryUtil.ALL_POS, QueryUtil.ALL_POS)
users.each { u ->
        trace(u.getFullName())
}
```

이 스크립트는 [Liferay Home](../../installation-and-upgrades/reference/liferay-home.md) 에 `스크립팅` 이라는 하위 폴더를 만들고 스크립트 출력을 이 폴더의 파일에 저장합니다.

파일 시스템에 직접 액세스할 수 없는 경우 이 코드를 사용하여 스크립트 콘솔에 파일 콘텐츠를 인쇄할 수 있습니다.

```groovy
final def SCRIPT_ID = "MYSCRIPT"
outputFile = new File("""${System.getProperty("liferay.home")}/scripting/out-${SCRIPT_ID}.txt""")
out.println(outputFile.text)
```

축하합니다! 스크립트 콘솔에서 다양한 스크립트를 실행했습니다.

## 추가 정보

* [스크립트 콘솔에서 스크립트 실행](./running-scripts-from-the-script-console.md)
* [워크플로에서 스크립트 엔진 사용](../../process-automation/workflow/developer-guide/using-the-script-engine-in-workflow.md)
* [스크립트 엔진 사용](../using-the-script-engine.md)