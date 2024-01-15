---
uuid: 6582b43b-bf32-44d5-84dc-d06d677bd5a3
taxonomy-category-names:
- Development and Tooling
- Developer Tools
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Running a Test

1. Open the `poshi-ext.properties` file on your `poshi-standalone` directory and add the following line, replacing the TestCaseFileName#TestCaseName with the one you created in [Creating A Testcase file](./creating-a-testcase-file.md). If you followed the provided testcase and test name, it should be `LiferayLearnSearch#CannotSearchForMyName`.

    ```
    test.name=LiferayLearnSearch#CannotSearchForMyName
    ```
1. Open terminal on the `poshi-standalone` directory and run `./gradlew validatePoshi` (`gradlew.bat validatePoshi` on Windows). This runs poshi validation which checks for errors in syntax, invalid functions, and other errors. If there are no errors, validation should run successfully. If there are errors, see [Debugging Tests](./understanding-test-results-and-debugging-tests.md).

1. Run the command `./gradlew runPoshi` to run the test. A browser should pop up and automatically run the test without user input.

1. Once complete, the results can be viewed in the `poshi-standalone/test-results/LiferayLearnSearch#CannotSearchForMyName` directory. For more information on test results, see [Understanding Test Results](./understanding-test-results-and-debugging-tests.md).
