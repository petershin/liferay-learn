# Poshi 리소스 사용

Poshi 리소스 jar 파일이 Poshi 프로젝트에 로드되면 이제 Liferay의 일반적으로 사용되는 기능, 경로 및 매크로를 사용할 수 있습니다. Poshi 리소스 jar 파일의 파일과 로컬 파일 시스템의 파일을 구별하려면 다음 이름 공간을 사용하십시오.

* 아래 클릭 기능에서와 같이 [Liferay Portal 기능 github 디렉토리](https://github.com/liferay/liferay-portal/tree/master/modules/test/poshi/poshi-runner-resources/src/main/resources/default/testFunctional/functions) 의 기능과 함께 `기본값` 을 사용합니다.

    ```
    Default.Click(locator1 = "//body")
    ```
* 다음과 같은 경우 `Portal` 을 사용하십시오.

  * 아래의 `TextInput#SUBJECT` 경로에서와 같이 [Liferay Portal 경로 github 디렉토리](https://github.com/liferay/liferay-portal/tree/master/portal-web/test/functional/com/liferay/portalweb/paths) 의 경로를 사용하는 경우:

    ```
    AssertElementPresent(locator1 = "Portal.TextInput#SUBJECT");
    ```
  * 아래의 `login()` 명령에서와 같이 [Liferay Portal 매크로 github 디렉토리](https://github.com/liferay/liferay-portal/tree/master/portal-web/test/functional/com/liferay/portalweb/macros) 의 매크로를 사용하는 경우:

    ```
    Portal.Liferay.login()
    ```

로컬 파일 시스템의 Poshi 파일에는 추가된 네임스페이스가 필요하지 않으며 LocalFile 네임스페이스가 자동으로 할당됩니다.
