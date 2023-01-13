# 테스트 실행

1. `poshi-ext.properties` 파일을 `poshi-standalone` 디렉토리에서 열고 다음 행을 추가하여 TestCaseFileName#TestCaseName을 [테스트 케이스 파일 생성](./creating-a-testcase-file.md)에서 생성한 것으로 바꿉니다. 제공된 테스트 케이스 및 테스트 이름을 따랐다면 `LiferayLearnSearch#CannotSearchForMyName`이어야 합니다.

    ```
    test.name=LiferayLearnSearch#CannotSearchForMyName
    ```
1. `poshi-standalone` 디렉토리에서 터미널을 열고 `./gradlew.sh validatePoshi` (Windows의 경우`gradlew.bat validatePoshi` )을 실행합니다. 이는 구문 오류, 유효하지 않은 함수 및 기타 오류를 확인하는 poshi 유효성 검사를 실행합니다. 오류가 없으면 유효성 검사가 성공적으로 실행됩니다. 오류가 있는 경우 [Poshi 디버깅](./debugging-poshi.md)을 참조하십시오.

1. `./gradlew.sh runPoshi` 명령을 실행하여 테스트를 실행합니다. 브라우저가 팝업되고 사용자 입력 없이 자동으로 테스트를 실행해야 합니다.

1. 완료되면 결과는 `poshi-standalone/test-results/LiferayLearnSearch#CannotSearchForMyName` 디렉토리에서 볼 수 있습니다. 테스트 결과에 대한 자세한 내용은 [테스트 결과 이해하기](./understanding-test-results-and-debugging-tests.md)을 참조하십시오.
