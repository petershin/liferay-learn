# 조각 툴킷 사용

조각 툴킷은 자주 사용하는 도구를 사용하여 로컬에서 조각을 개발하고 관리할 수 있도록 도와줍니다. 여기서는 툴킷을 사용하여 샘플 조각이 포함된 조각 프로젝트를 생성하고, 배포하고, 여기에 나만의 조각 세트를 추가합니다.

```{note}
Liferay DXP 7.4+의 경우, 조각 컬렉션은 Liferay UI에서 조각 세트라고 합니다.
```

## 툴킷 설정

툴킷을 사용하려면 이 소프트웨어가 필요합니다:

* [NPM](https://www.npmjs.com/)
* [NodeJS](https://nodejs.org/)
* [요만](https://yeoman.io/)
* [원사](https://classic.yarnpkg.com/)

NPM과 Yarn은 툴킷과 툴킷에 의존하는 모듈을 설치하는 데 사용하는 패키지 관리자입니다.

1. [Node.js LTS](https://nodejs.org/en/download/) 를 통해 NPM과 Node.js를 설치하는 것으로 시작하세요.

1. 예제 JavaScript 프로젝트 ZIP 파일을 다운로드하여 압축을 풉니다.

    ```bash
    curl https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-x2y6.zip -O
    ```

    ```bash
    unzip liferay-x2y6.zip
    ```

1. `setup_tutorial.sh` 스크립트를 사용하여 조각 툴킷 및 해당 종속성을 설정합니다.

    ```bash
    cd liferay-x2y6
    ```

    ```bash
    ./setup_tutorial.sh
    ```

    ```{note}
    설정_튜토리얼.sh` 스크립트는 요만, 얀, 툴킷을 설정하기 위한 명령을 제공합니다. 스크립트는 예제 프로젝트의 ZIP 파일에서 사용할 수 있습니다.
    ```

스크립트에서 보고된 모든 충족되지 않은 요구 사항을 해결하고 환경이 준비되었다고 보고될 때까지 스크립트를 다시 실행합니다.

## 조각 프로젝트 만들기

프래그먼트 툴킷의 `yo liferay-fragments` 명령은 프래그먼트 프로젝트를 생성하기 위한 인터페이스를 시작합니다.

```{warning}
조각 프로젝트를 중첩하지 마세요. 기존 Fragments 프로젝트 외부의 자체 사이트에 새 Fragments 프로젝트를 만들어야 합니다.
```

`liferay-x2y6` 프로젝트 폴더에 있는 경우, 해당 폴더를 종료합니다(예: `cd ..`).

조각 프로젝트를 생성하는 방법은 다음과 같습니다:

1. `yo liferay-fragments` 명령을 실행하여 프로젝트 생성기를 시작합니다:

    ```bash
    yo liferay-fragments
    ```

1. 프로젝트 이름을 지정합니다. 이 예제에서는 엔터를 클릭하여 기본 프로젝트 이름을 수락합니다.

    ```bash
    ? Project name (Sample Liferay Fragments)
    ```

1. 샘플 콘텐츠를 추가할지 여부를 표시합니다. 이 예에서는 `예`을 입력합니다.

    ```bash
    ? Add sample content? Yes
    Creating directory
       force .yo-rc.json
      create src/.gitkeep
      create .editorconfig
      create .gitignore
      create liferay-npm-bundler.config.js
      create package.json
      create README.md
    Adding sample content...
    Warning: some of these fragments are not compatible all
    portal versions, please check the generator documentation before using them:
    https://www.npmjs.com/package/generator-liferay-fragments#creating-new-fragments
    Running yarn...
    Done!
    You're ready to create fragments.
      create src/sample-collection/collection.json
      create src/sample-collection/sample-fragment/index.html
      create src/sample-collection/sample-fragment/main.js
      create src/sample-collection/sample-fragment/styles.css
      create src/sample-collection/sample-fragment/fragment.json
      create src/sample-collection/sample-fragment/configuration.json
      create src/sample-collection/sample-fragment-with-new-editables/index.html
      create src/sample-collection/sample-fragment-with-new-editables/main.js
      create src/sample-collection/sample-fragment-with-new-editables/styles.css
      create src/sample-collection/sample-fragment-with-new-editables/fragment.json
      create src/sample-collection/sample-fragment-with-new-editables/configuration.json
      create src/sample-collection/sample-fragment-with-react/index.html
      create src/sample-collection/sample-fragment-with-react/main.js
      create src/sample-collection/sample-fragment-with-react/styles.css
      create src/sample-collection/sample-fragment-with-react/fragment.json
      create src/sample-collection/sample-fragment-with-react/configuration.json
    ```

조각 프로젝트를 생성하신 것을 축하드립니다!

생성기는 프로젝트 이름에서 파생된 폴더에 각 프로젝트를 생성합니다. 예를 들어, 프로젝트 이름을 `Sample Liferay Fragments`로 지정했으므로 생성기는 `sample-liferay-fragments`라는 프로젝트 폴더를 생성했습니다.

## 샘플 조각 세트 가져오기

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계에 따라 샘플 조각 세트를 Liferay로 가져옵니다.

1. 프로젝트의 루트 폴더(예: `sample-liferay-fragments`)에서 `yarn run import` 명령을 호출하여 조각 세트를 Liferay 인스턴스로 가져옵니다. 또는 [조각 세트를 수동으로 가져올 수 있습니다](../../creating-pages/page-fragments-and-widgets/using-fragments/managing-fragments.md).

    ```bash
    cd sample-liferay-fragments
    ```

    ```bash
    yarn run import
    ```

1. 메시지에 응답합니다.

    ```bash
    $ yo liferay-fragments:import
    ? Liferay host & port http://localhost:8080
    ? Username test@liferay.com
    ? Password [hidden]
    Checking connection...
    Connection successful

    ? Company ID liferay.com
    ? Group ID Liferay DXP
    Building project...
    Importing project...
    Project imported
        force .yo-rc.json
        force ../../.yo-rc-global.json
    Done in 21.43s.
    ```

1. 조각 세트가 사용 가능한지 확인합니다. **사이트 메뉴**(![Site Menu](../../../images/icon-product-menu.png))를 열고 **디자인** &rarr; **조각** 으로 이동합니다. 세트가 목록에 나타나야 합니다.

    ![세트를 사용할 수 있습니다.](./using-the-fragments-toolkit/images/01.png)

    ```{note}
    Liferay DXP 7.1 및 7.2의 경우, 대신 제품 메뉴에서 *사이트* → *사이트 빌더* → *페이지 조각*으로 이동하여 *조각* 페이지로 이동합니다.
    ```

좋아요! 조각 집합을 성공적으로 배포했습니다.

## 조각 세트 구조

각 조각 세트는 이 구조를 사용합니다:

* `collection.json`: 조각 집합을 설명하는 텍스트 파일입니다.

    ```json
    {
        "description": "Optional description",
        "name": "Fragment Set Name"
    }
    ```

* `language.properties` (선택 사항): 조각 세트에 정의된 언어 키입니다.

* `[fragment-name]/`: 조각에 대한 모든 파일이 들어 있는 폴더입니다.

    * `configuration.json`(선택 사항): 조각의 구성을 정의하는 JSON 파일입니다. 자세한 내용은 [조각에 구성 옵션 추가하기](./adding-configuration-options-to-fragments.md) 를 참조하세요.

    * `fragment.json`: 조각을 설명하는 JSON 파일입니다. 자세한 내용은 [수정을 참조하세요.fragment.json](#modifying-fragmentjson) .

* `resources/` (선택 사항): 조각에 필요한 추가 이미지나 파일이 들어 있는 폴더입니다. 자세한 내용은 [조각에 기본 리소스 포함](./including-default-resources-with-fragments.md) 을 참조하세요.

프래그먼트 툴킷을 사용하여 이 구조로 프로젝트를 빠르게 만들 수 있습니다.

### fragment.json 수정

`fragment.json` 에는 조각의 기능과 사용성을 향상시키기 위해 수정할 수 있는 조각 속성이 포함되어 있습니다.

| 열쇠                     | 묘사                                                                                                     |
| ---------------------- | ------------------------------------------------------------------------------------------------------ |
| `cssPath`              | .css, .scss 또는 .sass 파일을 지정합니다.                                                                        |
| `configurationPath`    | 조각의 구성 소스를 지정합니다.                                                                                      |
| `htmlPath`             | 조각의 HTML 소스를 지정합니다.                                                                                    |
| `jsPath`               | 조각의 자바스크립트 소스를 지정합니다.                                                                                  |
| `name`                 | 조각의 이름입니다.                                                                                             |
| `type`                 | 컴포넌트 또는 React 조각을 지정합니다.                                                                               |
| `icon`                 | 가져온 조각에 점토 아이콘을 추가합니다. 사용 가능한 아이콘은 [클레이 아이콘 목록](https://clayui.com/docs/components/icon.html) 을 참조하세요. |
| `sass {loadPaths:[]}}` | 외부 종속성을 지정합니다.                                                                                         |

 ```json
        {
            "cssPath": "styles.css",
            "configurationPath": "configuration.json",
            "htmlPath": "index.html",
            "jsPath": "main.js",
            "name": "Fragment name",
            "type": "[component|react]",
            "icon": "adjust"

            // This configuration is optional and can be removed
            "sass": {
                "loadPaths": [
                    "../../../node_modules"
                ]
            }
        }
```

## 프로젝트에 프래그먼트 세트 추가

`add-collection` 명령을 사용하여 프로젝트에 프래그먼트 집합을 추가합니다.

1. 프로젝트의 루트 폴더로 이동하여 이 명령을 실행합니다.

    ```bash
    yarn run add-collection
    ```

1. 메시지가 표시되면 조각 세트의 이름과 설명을 입력합니다.

    ```bash
    > yo liferay-fragments:collection
    ? Collection name (required) My Set
    ? Collection description (optional) This is my new Fragment Set.
    create src/my-set/collection.json
    ```

1. 프로젝트의 `src` 폴더에서 새 조각 세트가 성공적으로 생성되었는지 확인합니다. `collection.json` 파일만 포함해야 합니다:

    ```json
    {
        "description": "This is my new Fragment Set.",
        "name": "My Set"
    }
    ```

## 새 조각 만들기

`add-fragment` 명령을 사용하여 세트에 새 조각을 추가합니다.

1. 프로젝트의 루트 폴더로 이동하여 이 명령을 실행합니다.

    ```bash
    yarn run add-fragment
    ```

    CLI가 프로세스를 시작합니다:

    ```bash
    > yo liferay-fragments:fragment
    ```

1. 조각에 이름을 지정합니다.

    ```bash
    ? Fragment name (required) My Jumbotron
    ```

1. React를 사용할지 다른 자바스크립트 프레임워크를 사용할지 선택합니다. React에는 Liferay 7.3 이상이 필요합니다. 이 튜토리얼에서는 React를 사용하여 거부해 주세요.

    ```bash
    ? Use React (or other JS framework)? No
    ```

1. Liferay 7.3 이상에서 새로운 편집 가능한 요소 구문을 사용합니다.

    ```bash
    ? Use new data-lfr editable syntax? Yes
    ```

    ```{note}
    조각에서 React 사용을 수락한 경우, 툴킷은 사용자가 Liferay 7.3 이상을 사용 중이라고 가정하고 새로운 편집 가능한 요소 구문을 구성합니다.
    ```

    ```{note}
    라이프 레이의 편집 가능한 데이터 구문에 대한 자세한 내용은 [조각별 태그](../reference/fragments/fragment-specific-tags-reference.md)를 참조하세요.
    ```

1. 방금 생성한 조각 세트(`내 세트`)를 선택합니다.

    ```bash
    ? Choose a collection
        My Set
        Sample Set
        + New Collection
    ```

    ```{note}
    조각.json`은 조각의 CSS, HTML, 자바스크립트 경로를 정의합니다. 이러한 파일 이름을 변경하는 경우 `fragment.json`에서 해당 경로를 업데이트하세요.
    ```

다음은 프래그먼트의 `index.html`입니다:

```html
<div class="my-jumbotron">
    <h1 data-lfr-editable-id="title" data-lfr-editable-type="text">
        My Jumbotron
    </h1>
</div>
```

조각 HTML은 새로운 `data-lfr` 편집 가능한 구문을 사용합니다.

## 조각 편집

조각의 일부를 수정합니다.

* HTML (`index.html`)
* CSS (`styles.css`)
* 자바스크립트 (`main.js`)
* 조각 속성 (`fragment.json`)
* [구성 옵션](./adding-configuration-options-to-fragments.md) (`configuration.json`).



예를 들어, 위의 HTML을 기반으로 [Clay](https://clayui.com/) 의 [부트스트랩](https://getbootstrap.com/) 기반 컴포넌트를 사용하여 이 `index.html`에서와 같이 관심을 끄는 헤드라인과 설명이 포함된 조각을 만들 수 있습니다:

```html
<div class="component-my-jumbotron">
    <div class="jumbotron">
        <h1
            class="display-4"
            data-lfr-editable-id="01-title"
            data-lfr-editable-type="rich-text"
        >
            Editable Jumbotron Headline
        </h1>

        <p
            class="lead"
            data-lfr-editable-id="02-lead"
            data-lfr-editable-type="rich-text"
        >
            Edit this text to call extra attention to featured content or information.
        </p>

        <hr />

        <p
            data-lfr-editable-id="03-text"
            data-lfr-editable-type="rich-text"
        >
            Edit this text to provide more information.
        </p>

        <a
            class="btn btn-primary btn-lg"
            data-lfr-editable-id="04-label"
            data-lfr-editable-type="link"
            href="#"
        >
            Editable Link
        </a>
    </div>
</div>
```

```{note}
Liferay 7.2 이하를 사용하는 경우, [조각별 태그](../reference/fragments/fragment-specific-tags-reference.md)에 설명된 대로 `data-lfr-editable-[id|type]` 속성을 제거하고 콘텐츠 요소를 `lfr-editable` 요소로 래핑합니다.
```

첫 번째 `div` 요소의 `class="component-my-jumbotron"` 속성은 페이지에서 이 프래그먼트를 고유하게 식별하려고 시도합니다.

```{tip}
조각의 HTML 파일에서 기본 래퍼 요소(위 예시에서는 `<div>`)를 사용하여 조각을 고유하게 식별하여 페이지의 다른 컴포넌트와 충돌하지 않도록 합니다.
```

다음으로 `<div class="jumbotron"/>` 요소는 [부트스트랩](https://getbootstrap.com/) 의 점보트론 컴포넌트를 적용하여 콘텐츠를 래핑합니다. 이 구성 요소는 콘텐츠를 돋보이게 합니다. 콘텐츠 요소는 다음과 같습니다:

* `<h1 class="display-4" ...>편집 가능한 점보트론 ...` 은 조각의 제목을 생성합니다. [부트스트랩](https://getbootstrap.com/) 의 `display-4` 크기 스타일을 사용합니다. `data-lfr-editable-` 속성을 사용하면 제목 텍스트 [를 편집할 수 있습니다](../reference/fragments/fragment-specific-tags-reference.md). `data-lfr-editable-id="03-text"` 속성은 요소를 식별하고 `data-lfr-editable-type="rich-text"` 속성은 콘텐츠 유형을 선언합니다.
* `<p class="lead" ...>이 텍스트 편집 ...` 은 Clay의 [`리드`](https://clayui.com/docs/css/content/typography.html#css-lead) 스타일 컴포넌트로 구분되는 리드 본문 텍스트입니다. `data-lfr-editable-` 속성을 사용하면 단락을 편집할 수 있습니다.
* `<hr/>` 및 다음 `<p ...` 요소는 각각 가로 규칙과 편집 가능한 다른 단락을 생성합니다.
* `<a class="btn btn-primary btn-lg" ...` 수정 가능한 링크를 지정합니다. `btn-primary` 클래스는 메인 버튼으로 스타일을 지정하고 `btn-lg` 클래스는 크게 만듭니다. `href="#"` 속성은 링크를 클릭하면 사용자를 페이지 상단으로 이동시킵니다. `data-lfr-editable-type="link"` 속성을 사용하면 [링크를 편집 가능한](../reference/fragments/fragment-specific-tags-reference.md)으로 만들 수 있습니다.

조각에 리소스를 포함할 수도 있습니다. 자세한 내용은 [조각에 기본 리소스 포함](./including-default-resources-with-fragments.md) 을 참조하세요.

```{note}
조각 및 구성 객체는 자바스크립트에서 인수로 전달되며 각각 `fragmentElement` 및 `configuration` 매개변수로 사용할 수 있습니다.
```

## 새 조각 가져오기

원래 예제 조각을 가져온 것처럼 새 조각을 가져올 수 있습니다:

1. 가져오기 명령을 실행하고 자격 증명을 입력합니다:

    ```bash
    yarn run import
    ```

1. 조각 세트가 사용 가능한지 확인합니다. **사이트 메뉴**(![Site Menu](../../../images/icon-product-menu.png))를 열고 **디자인** &rarr; **조각** 으로 이동합니다. 세트가 목록에 나타나야 합니다.

![세트를 사용할 수 있습니다.](./using-the-fragments-toolkit/images/02.png)

좋아요! 이제 조각 툴킷을 사용하여 조각을 생성하고 관리하는 방법을 알게 되었습니다. 자세한 툴킷 명령 정보는 [조각 툴킷 명령 참조](../reference/fragments/fragments-toolkit-command-reference.md) 를 참조하세요.

## 관련 정보

* [기여한 조각 세트 만들기](./creating-a-contributed-fragment-set.md)
* [조각 편집기 사용](./using-the-fragments-editor.md)
* [프래그먼트 툴킷 명령 참조](../reference/fragments/fragments-toolkit-command-reference.md)
