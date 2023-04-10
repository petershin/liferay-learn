# 조각 툴킷 사용

Fragments Toolkit은 선호하는 도구를 사용하여 로컬에서 Fragments를 개발하고 관리하는 데 도움이 됩니다. 여기서는 툴킷을 사용하여 샘플 Fragments가 있는 Fragments 프로젝트를 생성하고 이를 배포하고 고유한 Fragments Set을 추가합니다.

```{note}
Liferay DXP 7.4+의 경우 조각 컬렉션은 Liferay UI에서 조각 세트라고 합니다.
```

## 툴킷 설정

툴킷에는 다음 소프트웨어가 필요합니다.

* [NPM](https://www.npmjs.com/)
* [노드JS](https://nodejs.org/)
* [자작농](https://yeoman.io/)
* [실](https://classic.yarnpkg.com/)

NPM 및 Yarn은 의존하는 툴킷 및 모듈을 설치하는 데 사용할 패키지 관리자입니다.

1. [Node.js LTS](https://nodejs.org/en/download/) 을 통해 NPM 및 Node.js를 설치하는 것으로 시작합니다.

1. 예제 JavaScript 프로젝트 ZIP 파일을 다운로드하고 압축을 풉니다.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-x2y6.zip -O
    ```

    ```bash
    unzip liferay-x2y6.zip
    ```

1. `setup_tutorial.sh` 스크립트를 사용하여 Fragments Toolkit 및 해당 종속 항목을 설정합니다.

    ```bash
    cd liferay-x2y6
    ```

    ```bash
    ./setup_tutorial.sh
    ```

    ```{note}
    `setup_tutorial.sh` 스크립트는 Yeoman, Yarn 및 툴킷을 설정하기 위한 명령을 제공합니다. 스크립트는 예제 프로젝트의 ZIP 파일에서 사용할 수 있습니다.
    ```

스크립트에서 보고한 모든 충족되지 않은 요구 사항을 해결하고 환경이 준비되었다고 보고할 때까지 스크립트를 다시 실행하십시오.

## 조각 프로젝트 만들기

Fragments Toolkit의 `liferay-fragments` 명령은 Fragments 프로젝트를 생성하기 위한 인터페이스를 시작합니다.

```{warning}
조각 프로젝트를 중첩하지 마십시오. 기존 Fragments 프로젝트 외부의 자체 위치에 새 Fragments 프로젝트를 만들어야 합니다.
```

`liferay-x2y6` 프로젝트 폴더에 있으면 종료합니다(예: `cd ..`).

조각 프로젝트를 생성하는 방법은 다음과 같습니다.

1. `liferay-fragments` 명령을 실행하여 프로젝트 생성기를 시작합니다.

    ```bash
    yo liferay-fragments
    ```

1. 프로젝트 이름을 지정합니다. 이 예에서는 Enter를 클릭하여 기본 프로젝트 이름을 수락합니다.

    ```bash
    ? Project name (Sample Liferay Fragments)
    ```

1. 샘플 콘텐츠 추가 여부를 표시합니다. 이 예에서는 `예`을 입력합니다.

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

Fragments 프로젝트 생성을 축하합니다!

생성기는 프로젝트 이름에서 파생된 폴더에 각 프로젝트를 만듭니다. 예를 들어 프로젝트 이름을 `Sample Liferay Fragments`지정했으므로 생성기는 `sample-liferay-fragments`이라는 프로젝트 폴더를 생성했습니다.

## 샘플 조각 세트 가져오기
```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps to import the sample Fragment Set to Liferay:

1. Import the Fragment Set to your Liferay instance invoking the `yarn run import` command in the project's root folder (e.g., `sample-liferay-fragments`). Alternatively, you can [import the Fragment Set manually](../../creating-pages/page-fragments-and-widgets/using-fragments/managing-fragments.md).

    ```bash
    cd sample-liferay-fragments
    ```

    ```bash
    yarn run import
    ```

1. 프롬프트에 답하십시오.

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

1. 조각 세트를 사용할 수 있는지 확인합니다. **사이트 메뉴**(![Site Menu](../../../images/icon-product-menu.png))을 열고 **디자인** &rarr; **조각** 로 이동합니다. 세트가 목록에 나타나야 합니다.

    ![세트를 사용할 수 있습니다.](./using-the-fragments-toolkit/images/01.png)

    ```{note}
    Liferay DXP 7.1 및 7.2의 경우 대신 제품 메뉴에서 *사이트* → *사이트 빌더* → *페이지 조각*으로 이동하여 *조각* 페이지로 이동합니다.
    ```

1. Fragments Editor에서 보려면 Fragment를 선택하십시오.

    ![다음은 React가 포함된 샘플 조각입니다.](./using-the-fragments-toolkit/images/02.png)

엄청난! Fragment Set을 성공적으로 배포했습니다.

## 조각 세트 구조

각 단편 세트는 다음 구조를 사용합니다.

* `collection.json`: Fragment Set을 설명하는 텍스트 파일.

    ```json
    {
        "description": "Optional description",
        "name": "Fragment Set Name"
    }
    ```

* `language.properties` (선택 사항): 단편 세트에 대해 정의된 언어 키입니다.

* `[fragment-name]/`: 조각에 대한 모든 파일을 포함하는 폴더.

    * `configuration.json`(선택 사항): Fragment의 구성을 정의하는 JSON 파일입니다. 자세한 내용은 [단편](./adding-configuration-options-to-fragments.md) 에 구성 옵션 추가를 참조하십시오.

    * `fragment.json`: Fragment를 설명하는 JSON 파일입니다.

        ```json
        {
            "cssPath": "styles.css",
            "configurationPath": "configuration.json",
            "htmlPath": "index.html",
            "jsPath": "main.js",
            "name": "Fragment name",
            "type": "[component|react]"

            // This configuration is optional and can be removed
            "sass": {
                "loadPaths": [
                    "../../../node_modules"
                ]
            }
        }
        ```

      CSS, 구성, HTML 및 JavaScript 파일의 이름으로 `fragment.json` 의 `*Path` 속성을 업데이트합니다.

        * `styles.css`: Fragment의 CSS 소스입니다.

        * `index.html`: 조각의 HTML 소스입니다.

        * `main.js`: 조각의 JavaScript 소스입니다.

        ```{note}
        `.css` 파일을 가리키는 것 외에도 `cssPath` 키는 `.scss` 또는 `.sass` 파일을 지정할 수도 있습니다.  `fragment.json`에 `sass: {loadPaths:[]}}`를 추가하여 외부 종속성을 사용할 수도 있습니다.
        ```

* `리소스/` (선택 사항): 조각에 필요한 추가 이미지 또는 파일이 포함된 폴더입니다. 자세한 내용은 [프래그먼트](./including-default-resources-with-fragments.md) 에 기본 리소스 포함을 참조하십시오.

Fragments Toolkit을 사용하여 이 구조로 프로젝트를 빠르게 만들 수 있습니다.

## 프로젝트에 단편 세트 추가

`add-collection` 명령을 사용하여 Fragment Set을 프로젝트에 추가합니다.

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

1. 새 조각 세트가 프로젝트의 `src` 폴더에 성공적으로 생성되었는지 확인합니다. `collection.json` 파일만 포함해야 합니다.

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

    CLI가 프로세스를 시작합니다.

    ```bash
    > yo liferay-fragments:fragment
    ```

1. 조각 이름을 지정합니다.

    ```bash
    ? Fragment name (required) My Jumbotron
    ```

1. React 또는 다른 JavaScript 프레임워크를 사용할지 여부를 선택하십시오. 반응에는 Liferay 7.3 이상이 필요합니다. 이 튜토리얼에서는 React 사용을 거부하십시오.

    ```bash
    ? Use React (or other JS framework)? No
    ```

1. Liferay 7.3+에 대한 새로운 편집 가능한 요소 구문을 사용하십시오.

    ```bash
    ? Use new data-lfr editable syntax? Yes
    ```

    ```{note}
    조각에서 React 사용을 수락한 경우 툴킷은 사용자가 Liferay 7.3 이상에 있다고 가정하고 새로운 편집 가능한 요소 구문을 구성합니다.
    ```

    ```{note}
    Liferay의 편집 가능한 데이터 구문에 대한 자세한 내용은 [Fragment-Specific Tags](../reference/fragments/fragment-specific-tags-reference.md)를 참조하십시오.
    ```

1. 방금 생성한 조각 세트를 선택합니다(`My Set`).

    ```bash
    ? Choose a collection
        My Set
        Sample Set
        + New Collection
    ```

    ```{note}
    `fragment.json`은 Fragment의 CSS, HTML 및 JavaScript에 대한 경로를 정의합니다. 이러한 파일 이름을 변경하는 경우 `fragment.json`에서 해당 경로를 업데이트하십시오.
    ```

다음은 Fragment의 `index.html`입니다.

```html
<div class="my-jumbotron">
    <h1 data-lfr-editable-id="title" data-lfr-editable-type="text">
        My Jumbotron
    </h1>
</div>
```

Fragment HTML은 편집 가능한 새로운 `data-lfr` 구문을 사용합니다.

## 조각 편집

조각의 일부를 수정하십시오.

* HTML(`index.html`)
* CSS (`스타일.css`)
* 자바스크립트(`main.js`)
* [구성 옵션](./adding-configuration-options-to-fragments.md) (`configuration.json`).

예를 들어 위의 HTML에서 빌드하고 [Clay](https://clayui.com/) 의 [Bootstrap](https://getbootstrap.com/) 기반 구성 요소를 사용하여 이 `index.html`에서 보여 주는 것처럼 주의를 끄는 제목과 설명이 있는 Fragment를 만들 수 있습니다.

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
Liferay 7.2 이하를 사용하는 경우 `data-lfr-editable-[id|type]` 속성을 제거하고 [Fragment-Specific Tags](../ reference/fragments/fragment-specific-tags-reference.md).
```

첫 번째 `div` 요소의 `class="component-my-jumbotron"` 속성은 페이지에서 이 조각을 고유하게 식별하려고 시도합니다.

```{tip}
Fragment의 HTML 파일에서 기본 래퍼 요소(위 예에서 `<div>`)를 사용하여 Fragment를 고유하게 식별하여 페이지의 다른 구성 요소와 충돌하지 않도록 합니다.
```

다음으로 `<div class="jumbotron"/>` 요소는 [Bootstrap](https://getbootstrap.com/) 의 jumbotron 구성 요소를 적용하여 콘텐츠를 래핑합니다. 이 구성 요소는 콘텐츠를 돋보이게 합니다. 콘텐츠 요소는 다음과 같습니다.

* `<h1 class="display-4" ...>편집 가능한 Jumbotron ...` 조각의 제목을 만듭니다. [Bootstrap](https://getbootstrap.com/) 의 `display-4` 크기 스타일을 사용합니다. `data-lfr-editable-` 속성은 표제 텍스트 [를 편집 가능](../reference/fragments/fragment-specific-tags-reference.md)만듭니다. `data-lfr-editable-id="03-text"` 속성은 요소를 식별하고 `data-lfr-editable-type="rich-text"` 속성은 콘텐츠 유형을 선언합니다.
* `<p class="lead" ...>Edit this text ...` Clay의 [`리드`](https://clayui.com/docs/css/content/typography.html#css-lead) 스타일 구성 요소로 구별되는 리드 본문 텍스트입니다. `data-lfr-editable-` 속성은 단락을 편집 가능하게 만듭니다.
* `<hr/>` 및 다음 `<p ...` 요소는 각각 가로선과 다른 편집 가능한 단락을 생성합니다.
* `<a class="btn btn-primary btn-lg" ...` 수정 가능한 링크를 지정합니다. `btn-primary` 클래스는 기본 버튼으로 스타일을 지정하고 `btn-lg` 은 크게 만듭니다. `href="#"` 속성은 링크를 클릭할 때 사용자를 페이지 상단으로 이동시킵니다. `data-lfr-editable-type="link"` 속성은 링크를 [편집 가능하게 만듭니다](../reference/fragments/fragment-specific-tags-reference.md).

조각에 리소스를 포함할 수도 있습니다. 자세한 내용은 [프래그먼트](./including-default-resources-with-fragments.md) 에 기본 리소스 포함을 참조하십시오.

```{note}
Fragment 및 구성 개체는 JavaScript에서 인수로 전달되며 각각 `fragmentElement` 및 `configuration` 매개변수로 사용할 수 있습니다.
```

## 새 조각 가져오기

원본 예제 Fragment를 수행한 것처럼 새 Fragment를 가져올 수 있습니다.

1. 가져오기 명령을 실행하고 자격 증명을 제공합니다.

    ```bash
    yarn run import
    ```

1. 조각 세트를 사용할 수 있는지 확인합니다. **사이트 메뉴**(![Site Menu](../../../images/icon-product-menu.png))을 열고 **디자인** &rarr; **조각** 로 이동합니다. 세트가 목록에 나타나야 합니다.

![세트를 사용할 수 있습니다.](./using-the-fragments-toolkit/images/03.png)

엄청난! 이제 Fragments Toolkit을 사용하여 Fragments를 만들고 관리하는 방법을 알았습니다. 자세한 툴킷 명령 정보는 [Fragments Toolkit 명령 참조](../reference/fragments/fragments-toolkit-command-reference.md) 을 참조하십시오.

## 관련 정보

* [기여 조각 세트 생성](./creating-a-contributed-fragment-set.md)
* [조각 편집기 사용](./using-the-fragments-editor.md)
* [Fragments Toolkit 명령 참조](../reference/fragments/fragments-toolkit-command-reference.md)
