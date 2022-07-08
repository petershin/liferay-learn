# テスト結果とテストのデバッグについて

Poshiのテストは、ターミナルやコマンドラインから実行します。 テスト実行が完了すると、テスト結果を表示したり、テストの問題を診断したりする方法が複数用意されています。

## コンソールログでテスト結果を確認する

テストの実行が成功すると、コンソールログに次のようなメッセージが表示されます。

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

テストが失敗すると、テストが失敗した理由を含む詳細な情報が表示されます。 なお、以下のログでは、障害箇所である`Element is not visible at "//h4[@id="noResultsMessage"]"`が表示されていることに注意してください。

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

## テストレポートを表示する

テスト結果を見るもう一つの方法は、テストレポートです。 テスト実行後、ルートディレクトリに `test-results` フォルダが作成されます。 このフォルダの中には、完了したテストのログとサマリーページがあります。 このチュートリアルのテスト例を実行した場合、test-results フォルダは次のようになります。

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

`index.html` に移動し、ブラウザでファイルを開きます。

テストが成功すると、テストステップが表示され、そのステップが合格したことを示す緑のバーが表示されます。

  ![このテストは正常に終了しました](./understanding-test-results-and-debugging-tests/images//01.png)

テストが失敗した場合、失敗したテストステップが赤いバーとともに表示されます。 感嘆符のアイコンを展開すると、障害発生前後のシステム状態のスクリーンショットなど、障害箇所に関する詳細な情報を表示することができます。

  ![このテストは失敗しました](./understanding-test-results-and-debugging-tests/images/02.png)

これをテストするには、 `CannotSearchForMyName` テストをコピーして、名前を `Blogs`に置き換えてください。 テスト名も変更する場合は、 `poshi-ext.properties` ファイルを忘れずに編集してください。 詳細については、[テストの実行](./running-a-test.md)を参照してください。

## テスト失敗の原因を診断する

ログに記載されている情報から、この問題を診断するには方法がいくつかあります。

1. Poshiテストで提供された変数を含むテストステップを手動でテストすることにより、テスト中のシステムにバグがあるかどうかを判断します。

1. バグがなく、期待通りの動作をする場合は、ページのDOM（Web Developer Console）上でパスを検索し、ロケーターが正しいパスをチェックしているかどうかを判断してください。

1. バグも不正なパスもない場合は、マクロで使用している関数が連携に適しているかどうかを検討します。 例えば、`Click`という関数をチェックボックスで使っている場合、`Check`という関数の方が適切かもしれません。 詳細は[Functions](../poshi-basics/poshi-layers/functions.md)を参照してください。
