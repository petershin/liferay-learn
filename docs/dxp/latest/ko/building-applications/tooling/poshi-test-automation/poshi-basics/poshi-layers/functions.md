# 기능

Poshi에서 함수는 요소가 페이지 개체 또는 요소와 상호 작용하는 데 필요할 수 있는 추가 WebDriver 명령을 처리합니다. 함수는 `BaseWebDriverImpl` 계층에 정의된 기본 메서드를 결합하여 테스트 사례에 대해 재사용 가능한 함수를 생성하며 Java 경험이 필요하지 않습니다.

예를 들어 테스트에 페이지의 편집 버튼 클릭이 포함된다고 가정해 보겠습니다. 표면적으로 필요한 유일한 방법은 `selenium.click()`인 것 같습니다. 테스트의 신뢰성을 향상시키려면 페이지가 로드될 때까지 대기하고 콘솔 로그 오류를 어설션하는 것을 포함하는 것이 좋습니다. 그러면 단계는 다음과 같습니다.

1. 페이지가 로드될 때까지 기다리십시오.

1. 버튼이 보일 때까지 기다립니다.

1. 버튼을 클릭하십시오.

1. 콘솔 로그에 오류가 없는지 확인하십시오.

이 4가지 단계를 스크립팅하는 대신 BaseWebDriverImpl 레이어에서 결합하여 _Click_ 기능이라는 하나의 실용적인 방법을 만듭니다.

```
Click.function
@default = "click"
@summary = "Click on '${locator1}'"
...
function click {
        WaitForSPARefresh();

        selenium.waitForVisible();

        selenium.mouseOver();

        selenium.click();

        selenium.assertJavaScriptErrors();

        selenium.assertLiferayErrors();
}
```

그런 다음 xpath 로케이터를 사용하여 테스트에서 이 `Click` 함수를 호출하면 함수가 클릭할 요소 또는 페이지 개체를 알 수 있습니다. 이 로케이터는 묵시적으로 Java 계층에 문자열로 전달됩니다. 사용법은 다음과 같습니다.
```
Click(locator1 = "//button[contains(.,'Edit')]");
```

기능은 Poshi 독립형에서 쉽게 사용할 수 있습니다. 사용 가능한 기능은 [Liferay Portal 소스의 기능 디렉토리](https://github.com/liferay/liferay-portal/tree/master/portal-web/test/functional/com/liferay/portalweb/functions) 에서 찾을 수 있습니다. 
