---
toc:
- ./getting-started/setup.md
- ./getting-started/creating-a-path-file.md
- ./getting-started/creating-a-macro-file.md
- ./getting-started/creating-a-testcase-file.md
- ./getting-started/syntax-validation.md
- ./getting-started/running-a-test.md
- ./getting-started/understanding-test-results-and-debugging-tests.md
myst:
  html_meta:
    "documentation-type": "user-guide"
---
# 시작하기

이전에는 [Liferay 소스 코드](https://github.com/liferay/liferay-portal/) 내에서 테스트 파일을 다운로드하고 생성해야만 Poshi 테스트를 실행할 수 있었습니다. **Poshi Standalone** gradle 프로젝트를 사용하면 전체 Liferay Portal github 리포지토리를 가져오지 않고도 원하는 디렉터리에서 Poshi를 사용할 수 있습니다.

::::{grid} 1
:gutter: 3 3 3 3

:::{grid-item-card} 설정
:link: ./getting-started/setup.md

Poshi Standalone Gradle 프로젝트를 설정합니다.
:::

:::{grid-item-card} 경로 파일 생성
:link: ./getting-started/creating-a-path-file.md

로케이터에 대한 경로 파일을 만듭니다.
:::

:::{grid-item-card} 매크로 파일 만들기
:link: ./getting-started/creating-a-macro-file.md

매크로 파일의 스크립트 상호 작용.
:::

:::{grid-item-card} 테스트 케이스 파일 생성
:link: ./getting-started/creating-a-testcase-file.md

테스트 케이스 파일에서 사용자 행동을 스크립팅합니다.
:::

:::{grid-item-card} 구문 유효성 검사
:link: ./getting-started/syntax-validation.md

테스트를 실행하기 전에 구문을 확인합니다.
:::

:::{grid-item-card} 테스트 실행
:link: ./getting-started/running-a-test.md

Poshi 테스트 실행
:::

:::{grid-item-card} 테스트 결과 이해 및 Poshi 디버깅
:link: ./getting-started/understanding-test-results-and-debugging-tests.md

테스트 실행의 디버깅 실패
:::
::::
