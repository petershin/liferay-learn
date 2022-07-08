# 構文の検証

Poshi Standaloneのgradeプロジェクトには検証タスクが含まれており、テストを実行する前にコードの構文エラーをチェックするのに使用することができます。 これを使うには、ルートディレクトリで`./gradlew validatePoshi` を実行するだけです。 エラーがない場合、コマンドは正常に実行され、次のメッセージが表示されます。

  ```
  BUILD SUCCESSFUL in 1s
  1 actionable task: 1 executed
  ```

検証でのエラーは説明的で、エラーのあるコード行を指し示します。 以下の例では、2つのposhiエラーがあります。

1. `LiferayLearnSearch.macro` の 12 行目にある関数 `ThisIsNotAFunction` は有効ではありません。

1. `LiferayLearn.testcase` の12行目のマクロコマンド `LiferayLearnSearch#search`は有効ではありません。

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
