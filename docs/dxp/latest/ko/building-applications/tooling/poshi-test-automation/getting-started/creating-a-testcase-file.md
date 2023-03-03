# 테스트 케이스 파일 생성

## 테스트 시나리오

아래 테스트 시나리오를 사용하여 첫 번째 테스트 케이스 파일을 작성하십시오.

  귀하의 이름이 learn.liferay.com 기사에 나타나지 않는지 테스트하고 싶습니다. 취할 조치는 다음과 같습니다. 단계를 테스트하려면 별도의 브라우저에서 수동으로 수행하십시오.

  1. [Liferay Learn 사이트](http://learn.liferay.com) 로 이동합니다.

  1. 검색 입력 필드를 클릭합니다.

  1. 검색어로 이름을 입력하십시오.

  1. Enter 키를 눌러 검색어를 입력합니다.

  1. 검색 결과가 없다고 주장하십시오. 귀하의 이름을 검색하면 결과가 반환되면 다른 이름을 선택하십시오.

  1. 사용 가능한 기사가 없다는 메시지가 표시되는지 확인하십시오.

## 테스트 케이스 파일 빌드

1. `poshi-standalone/poshi-tests/testcase` 디렉토리에 빈 파일을 만들고 이름을 `LiferayLearnSearch.testcase`으로 지정합니다.

1. 매크로 파일은 정의 블록으로 시작합니다. 이것을 `LiferayLearnSearch.testcase` 파일에 추가하십시오.

    ```
    definition {

    }
    ```

1. 정의 블록 내에서 setUp 블록을 만듭니다. 테스트는 Liferay Learn 사이트로 이동하는 것으로 시작하므로 설정 블록에는 다음 기능이 포함될 수 있습니다.

    ```
    setUp {
        task("Setup: Navigate to the Liferay Learn website.") {
          Default.Open(locator1 = "http://learn.liferay.com");
        }
    }
    ```

1. 설명과 테스트 이름을 추가하여 테스트 블록을 시작합니다. 간결하고 구체적이며 설명적인 방식으로 테스트 이름을 지정하십시오. 주어진 테스트 시나리오의 경우 `CannotSearchForMyName`을 사용하십시오.

    ```
    @description = "There should be no search results when I search for my name."
    test CannotSearchForMyName {

    }
    ```

1. 테스트 블록 내에서 테스트 시나리오에 설명된 순서대로 `LiferayLearnSearch.macro` 파일의 매크로를 추가합니다. 변수 검색어를 전달하는 것을 잊지 마십시오. 변수에 대한 자세한 내용은 [변수 사용](../poshi-basics/poshi-layers/variables.md)을 참조하십시오. 결과 테스트는 다음과 같아야 합니다.

    ```
    definition {

      setUp {
        task("Setup: Navigate to the Liferay Learn website.") {
          Default.Open(locator1 = "http://learn.liferay.com");
        }
      }

      @description = "There should be no search results when I search for my name."
      test CannotSearchForMyName {
        task("When I search for my name") {
          LiferayLearnSearch.searchForTerm(searchTerm = "yourNameHere");
        }

        task("Then I should see the No Results message.") {
          LiferayLearnSearch.assertNoResults(searchTerm = "yourNameHere");
        }

      }
    }
    ```
