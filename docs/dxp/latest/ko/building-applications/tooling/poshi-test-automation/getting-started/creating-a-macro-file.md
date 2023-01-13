# 매크로 파일 생성

## 테스트 시나리오

아래의 테스트 시나리오를 사용하여 첫 번째 매크로 파일을 작성하십시오.

  귀하의 이름이 learn.liferay.com 기사에 나타나지 않는지 테스트하고 싶습니다. 취할 조치는 다음과 같습니다. 단계를 테스트하려면 별도의 브라우저에서 수동으로 수행하십시오.

  1. [Liferay Learn 사이트](http://learn.liferay.com)로 이동합니다.

  1. 검색 입력 필드를 클릭합니다.

  1. 검색어로 이름을 입력하십시오.

  1. Enter 키를 눌러 검색어를 입력합니다.

  1. 검색 결과가 없다고 주장하십시오. 귀하의 이름을 검색하면 결과가 반환되면 다른 이름을 선택하십시오.

  1. 사용 가능한 기사가 없다는 메시지가 표시되는지 확인하십시오.

## 매크로 파일 만들기

1. `poshi-standalone/poshi-tests/macros` 디렉토리에 빈 파일을 만들고 이름을 `LiferayLearnSearch.macro`으로 지정합니다.

1. 매크로 파일은 정의 블록으로 시작합니다. 이것을 `LiferayLearnSearch.macro` 파일에 추가하십시오.

    ```
    definition {

    }
    ```

1. .macro 파일의 정의 블록 내에서 매크로 블록은 개별 매크로를 정의하는 데 사용됩니다. 이렇게 하려면 매크로 키워드와 문자열 식별자 이름을 사용하십시오. 이러한 매크로 이름은 고유해야 하며 의도한 상호 작용을 설명해야 합니다. 자세한 내용은 [매크로](../poshi-basics/poshi-layers/macros.md) 을 참조하십시오. 주어진 시나리오에서 용어를 검색하는 매크로는 간단히 `searchForTerm`이라고 할 수 있습니다.

1.  테스트 시나리오의 2~4단계는 함께 단일 검색 상호 작용을 만드는 작업입니다. 이 세 단계는 `searchForTerm` 매크로 블록에 포함됩니다. 이러한 작업은 [경로 파일 생성](./creating-a-path-file.md) 기사에서 생성된 로케이터와 함께 [함수](https://github.com/liferay/liferay-portal/tree/master/modules/test/poshi/poshi-runner-resources/src/main/resources/default/testFunctional/functions) 을 사용하여 스크립팅할 수 있습니다. 함수 사용에 대한 자세한 내용은 [함수](../poshi-basics/poshi-layers/functions.md)에서 확인할 수 있습니다.

    결과 매크로는 다음과 같습니다.

    ```
    macro searchForTerm {
        Default.Click(
            locator1 = "LiferayLearn#SEARCH_BAR");

        Default.Type(
            locator1 = "LiferayLearn#SEARCH_BAR",
            value1 = "${searchTerm}");

        Default.KeyPress(
            locator1 = "LiferayLearn#SEARCH_BAR",
            value1 = "\ENTER");
    }
    ```

1. `searchForTerm` 매크로와 별도로 테스트 시나리오는 결과를 확인하기 위해 두 번째 매크로를 호출합니다. 5단계와 6단계는 별도의 어설션이지만 함께 검색 결과가 없다고 어설션하는 단일 사용자 상호 작용을 형성합니다. 이 매크로는 `assertNoResults`로 이름을 지정할 수 있습니다.

    ```
    macro assertNoResults {
        Default.AssertElementNotPresent(locator1 = "LiferayLearn#SEARCH_RESULTS",
            value1 = "${searchTerm}");

        Default.AssertElementPresent.assertVisible(locator1 = "LiferayLearn#NO_RESULTS_MESSAGE");
    }
    ```

1. 결과 매크로 파일은 다음과 같아야 합니다.

    ```
    definition {

        macro assertNoResults {
            Default.AssertElementNotPresent(locator1 = "LiferayLearn#SEARCH_RESULTS",
                value1 = "${searchTerm}");

            Default.AssertElementPresent.assertVisible(locator1 = "LiferayLearn#NO_RESULTS_MESSAGE");

        }

        macro searchForTerm {
            Default.Click(
                locator1 = "LiferayLearn#SEARCH_BAR");

            Default.Type(
                locator1 = "LiferayLearn#SEARCH_BAR",
                value1 = "${searchTerm}");

            Default.KeyPress(
                locator1 = "LiferayLearn#SEARCH_BAR",
                value1 = "\ENTER");
        }
    }
    ```
