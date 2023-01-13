# 구문 검증

Poshi 독립 실행형 등급 프로젝트에는 테스트를 실행하기 전에 구문 오류가 있는지 코드를 확인하는 데 사용할 수 있는 유효성 검사 작업이 포함되어 있습니다. 이를 사용하려면 루트 디렉토리에서 `./gradlew validatePoshi` 을 실행하기만 하면 됩니다. 오류가 없으면 다음 메시지와 함께 명령이 성공적으로 실행됩니다.

  ```
  BUILD SUCCESSFUL in 1s
  1 actionable task: 1 executed
  ```

유효성 검사의 오류는 설명적이며 오류가 있는 코드 줄을 가리킵니다. 아래 예에는 두 가지 poshi 오류가 있습니다.

1. `LiferayLearnSearch.macro` 의 12행에 있는 `ThisIsNotAFunction` 함수는 유효하지 않습니다.

1. `LiferayLearn.testcase` 의 12행에 있는 매크로 명령 `LiferayLearnSearch#search` 은 유효하지 않습니다.

  ```
  Exception in thread "main"
  2 errors in POSHI

  Unable to find class ThisIsNotAFunction at:
  /L:/poshi-standalone/poshi-tests/macros/LiferayLearnSearch.macro:12
     5 |            value1 = "${searchTerm}");
     6 |
     7 |        Default.AssertElementPresent.assertVisible(locator1 = "LiferayLearn#NO_RESULTS_MESSAGE");
     8 |
     9 |    }
    10 |
    11 |    macro searchForTerm {
  > 12 |        ThisIsNotAFunction(
    13 |            locator1 = "LiferayLearn#SEARCH_BAR");
    14 |
    15 |        Default.Type(
    16 |            locator1 = "LiferayLearn#SEARCH_BAR",
    17 |            value1 = "${searchTerm}");
    18 |
    19 |        Default.KeyPress(

  Invalid macro command LiferayLearnSearch#search at:
  /L:/poshi-standalone/poshi-tests/testcases/LiferayLearn.testcase:12

    10 |   test CannotSearchForMyName {
          at com.liferay.poshi.core.PoshiValidation._throwExceptions(PoshiValidation.java:1870)
    11 |       task("When I search for my name") {
          at com.liferay.poshi.core.PoshiValidation.validate(PoshiValidation.java:106)
  > 12 |           LiferayLearnSearch.search(searchTerm = "yourNameHere");
    13 |       }
    14 |
    15 |       task("Then I should see the no results message.") {
          at com.liferay.poshi.core.PoshiValidation.main(PoshiValidation.java:60)
    16 |           LiferayLearnSearch.assertNoResults(searchTerm = "yourNameHere");
    17 |       }
    18 |
    19 |   }

    FAILURE: Build failed with an exception.

  * What went wrong:
  Execution failed for task ':validatePoshi'.
  > Process 'command 'C:\Program Files\Java\jdk1.8.0_301\bin\java.exe'' finished with non-zero exit value 1

  * Try:
  Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output. Run with --scan to get full insights.

  * Get more help at https://help.gradle.org

  BUILD FAILED in 1s
  1 actionable task: 1 executed
```
