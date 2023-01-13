# 테스트 결과 이해 및 테스트 디버깅

Poshi 테스트는 터미널 또는 명령줄에서 실행됩니다. 테스트 실행이 완료되면 테스트 결과를 보고 테스트 문제를 진단하는 여러 가지 방법이 있습니다.

## 콘솔 로그에서 테스트 결과 보기

테스트 실행이 성공하면 콘솔 로그에 다음과 유사한 메시지가 표시됩니다.

```
###
### LocalFile.LiferayLearn#CannotSearchForMyName
###

Using "L:\poshi-standalone\build\webdriver/chromedriver.exe" as "webdriver.chrome.driver" path

com.liferay.poshi.runner.PoshiRunner > test[LocalFile.LiferayLearn#CannotSearchForMyName] STANDARD_ERROR
   Starting ChromeDriver 2.37.544315 (730aa6a5fdba159ac9f4c1e8cbc59bf1b5ce12b7) on port 46142
   Only local connections are allowed.
   Mar 21, 2022 9:42:39 AM org.openqa.selenium.remote.ProtocolHandshake createSession
   INFO: Detected dialect: OSS

com.liferay.poshi.runner.PoshiRunner > test[LocalFile.LiferayLearn#CannotSearchForMyName] STANDARD_OUT
   There should be no search results when I search for my name.
   Total duration of 'LiferaySelenium.pause' usages: 0 ms

BUILD SUCCESSFUL in 2m 5s
4 actionable tasks: 2 executed, 2 up-to-date
```

실패한 테스트 실행에는 테스트가 실패한 이유를 포함하는 자세한 정보가 표시됩니다. 다음 로그는 실패 지점이 `요소인 것을 "//h4[@id="noResultsMessage"]"`에서 볼 수 없음을 표시합니다.

```
###
### LocalFile.LiferayLearn#CannotSearchForMyName
###

Using "L:\poshi-standalone\build\webdriver/chromedriver.exe" as "webdriver.chrome.driver" path

com.liferay.poshi.runner.PoshiRunner > test[LocalFile.LiferayLearn#CannotSearchForBlogs] STANDARD_ERROR
Starting ChromeDriver 2.37.544315 (730aa6a5fdba159ac9f4c1e8cbc59bf1b5ce12b7) on port 29070
Only local connections are allowed.
Mar 21, 2022 9:27:57 AM org.openqa.selenium.remote.ProtocolHandshake createSession
INFO: Detected dialect: OSS

com.liferay.poshi.runner.PoshiRunner > test[LocalFile.LiferayLearn#CannotSearchForBlogs] STANDARD_OUT
There should be no search results when a user searches for Blogs.

BUILD FAILED: Element is not visible at "//h4[@id="noResultsMessage"]"
L:\poshi-standalone\poshi-tests\macros\LiferayLearnSearch.macro[assertNoResults]:7
L:\poshi-standalone\poshi-tests\testcases\LiferayLearn.testcase[CannotSearchForBlogs]:16


com.liferay.poshi.runner.PoshiRunner > test[LocalFile.LiferayLearn#CannotSearchForBlogs] STANDARD_ERROR
java.lang.Exception: Element is not visible at "//h4[@id="noResultsMessage"]"
    at com.liferay.poshi.runner.selenium.BaseWebDriverImpl$Condition.assertTrue(BaseWebDriverImpl.java:4489)
    at com.liferay.poshi.runner.selenium.BaseWebDriverImpl$Condition.waitFor(BaseWebDriverImpl.java:4524)
    at com.liferay.poshi.runner.selenium.BaseWebDriverImpl.waitForVisible(BaseWebDriverImpl.java:3451)
    at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
    at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
    at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
    at java.lang.reflect.Method.invoke(Method.java:498)
    at com.liferay.poshi.runner.PoshiRunnerExecutor$1.call(PoshiRunnerExecutor.java:1174)
    at java.util.concurrent.FutureTask.run(FutureTask.java:266)
    at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
    at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
    at java.lang.Thread.run(Thread.java:748)

com.liferay.poshi.runner.PoshiRunner > test[LocalFile.LiferayLearn#CannotSearchForBlogs] STANDARD_OUT
Total duration of 'LiferaySelenium.pause' usages: 0 ms
Test retry attempts exceeded in Poshi Runner JVM

com.liferay.poshi.runner.PoshiRunner > test[LocalFile.LiferayLearn#CannotSearchForBlogs] FAILED
java.lang.Exception at BaseWebDriverImpl.java:4489

1 test completed, 1 failed

> Task :runPoshi FAILED

FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':runPoshi'.
> There were failing tests. See the report at: file:///L:/poshi-standalone/tests/index.html
```

## 테스트 보고서 보기

테스트 결과를 보는 또 다른 방법은 테스트 보고서를 통하는 것입니다. 테스트 실행 후 루트 디렉토리에 `test-results` 폴더가 생성됩니다. 이 폴더에는 완료된 테스트 실행의 테스트 로그 및 요약 페이지가 있습니다. 이 자습서에서 테스트 예제를 실행한 경우 test-results 폴더는 다음과 유사해야 합니다.

```
poshi-standalone
├── ...
├── test-results   
|   ├── binary
|   ├──  index.html LocalFile.LiferayLearn_CannotSearchForMyName
|   |  ├── screenshots
|   |  ├── index.html
|   |  └── summary.html
|   ├── poshi-warnings.xml
|   └── TEST-com.liferay.poshi.runner.PoshiRunner.xml
├── ...
├── ...
```

`index.html` 로 이동하고 브라우저에서 파일을 엽니다.

성공적인 테스트 결과는 단계가 통과되었음을 나타내는 녹색 막대와 함께 테스트 단계를 표시합니다.

  ![이 테스트는 성공적으로 통과했습니다.](./understanding-test-results-and-debugging-tests/images//01.png)

실패한 테스트 결과에는 단계가 실패했음을 나타내는 빨간색 막대와 함께 실패한 테스트 단계가 표시됩니다. 느낌표 아이콘을 확장하여 실패 전후의 시스템 상태 스크린샷을 포함하여 실패 지점에 대한 자세한 정보를 볼 수 있습니다.

  ![테스트 실패](./understanding-test-results-and-debugging-tests/images/02.png)

이를 테스트하려면 `CannotSearchForMyName` 테스트 사본을 만들고 이름을 `Blogs`으로 바꾸십시오. 테스트 이름도 변경하는 경우 `poshi-ext.properties` 파일을 편집해야 합니다. 자세한 내용은 [테스트 실행](./running-a-test.md) 을 참조하십시오.

## 테스트 실패 원인 진단

로그에 제공된 정보에서 문제를 진단하는 몇 가지 방법이 있습니다.

1. Poshi 테스트에서 제공되는 변수를 포함하여 테스트 단계를 수동으로 테스트하여 테스트 중인 시스템에 버그가 있는지 확인합니다.

1. 버그가 없고 시스템이 예상대로 작동하는 경우 페이지 DOM(Web Developer Console)에서 경로를 검색하여 로케이터가 올바른 경로를 확인하고 있는지 확인합니다.

1. 버그나 잘못된 경로가 없으면 매크로에서 사용 중인 기능이 인터랙션에 적합한지 고려하십시오. 예를 들어, `확인` 기능이 더 적합할 수 있는 확인란에서 `클릭` 기능을 사용할 수 있습니다. 자세한 내용은 [기능](../poshi-basics/poshi-layers/functions.md) 을 참조하십시오.
