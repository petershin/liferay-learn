# 조각에 기본 리소스 포함

조각 세트에 이미지(예: `.gif`, `.jpg`, `.jpeg`, 또는 `.png`)를 포함시켜 조각에 사용할 수 있습니다. [문서 및 미디어](../../../content-authoring-and-management/documents-and-media.md)와 같은 다른 애플리케이션이 아닌 조각에 이미지를 보관하는 것이 편리합니다. 여기에서는 조각 세트에 이미지 리소스를 포함하고 조각에서 이미지 리소스를 사용하는 방법에 대해 알아봅니다.

```{note}
Liferay DXP 7.4+의 경우, 조각 컬렉션은 Liferay UI에서 조각 세트라고 합니다.
```

## 리소스가 포함된 조각 세트 가져오기

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계에 따라 예제 Fragment Set을 가져와 Fragment 리소스가 작동하는 방식을 확인합니다.

1. [예제 리소스 조각 집합](https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-i6r3.zip을 다운로드하고 압축을 풉니다. ) :

    ```bash
    curl https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-i6r3.zip -O
    ```

    ```bash
    unzip liferay-i6r3.zip
    ```

1. 조각 툴킷을 설정합니다:

    ```bash
    cd liferay-i6r3
    ```

    ```bash
    ./setup_tutorial.sh
    ```

    스크립트에서 보고한 모든 충족되지 않은 요구 사항을 해결하고 환경이 준비되었다고 보고할 때까지 스크립트를 다시 실행합니다.

1. 아래의 `yarn run import` 명령을 사용하여 조각 툴킷을 사용하여 Docker 컨테이너에서 조각 집합을 가져옵니다.

    ```bash
    yarn run import

    ...
    ? Liferay host & port http://localhost:8080
    ? Username test@liferay.com
    ? Password [hidden]

    Checking connection...
    Connection successful

    ? Company ID liferay.com
    ? Group ID Liferay DXP

    Building project...
    Importing project...

    ✔ Fragment I6R3 Card imported

    Project Imported
    ```

1. 조각 집합을 사용할 수 있는지 확인합니다. 브라우저에서 `https://localhost:8080`로 이동한 다음 화면 왼쪽의 사이트 메뉴에서 **디자인** &rarr; **조각** 으로 이동합니다. I6R3 세트는 다른 조각 세트와 함께 표시되어야 합니다.

1. **I6R3 세트** 를 클릭합니다.

1. **리소스** 탭을 클릭합니다. `books.png` 이미지가 리소스 목록에 표시됩니다.

    ![리소스는 조각 세트에서 사용할 수 있습니다.](./including-default-resources-with-fragments/images/01.png)

## 리소스가 있는 조각 세트 구조

리소스가 포함된 조각 세트는 다음과 같은 구조를 사용합니다:

* `collection.json`: `{"name":"세트 이름","description":"세트 설명"}`형식으로 세트를 설명하는 텍스트 파일입니다.
* `[fragment-name]/`: 조각의 모든 파일을 포함합니다.
* `resources/`: 모든 세트의 조각에 사용할 수 있는 파일이 들어 있습니다.

```{tip}
또는 [조각 편집기](./사용하는-조각-편집기.md)의 *리소스* 탭을 통해 이미지를 업로드할 수도 있습니다.
```

이미지 파일은 프래그먼트의 HTML에서 `[resources:image-name.extension]`구문을 사용하여 참조됩니다. 예제 조각 HTML에는 `img` 요소가 있습니다:

```html
<img
    class="card-img-top"
    src="[resources:books.png]"
/>
```

![이미지 리소스를 조각으로 임베드하세요.](./including-default-resources-with-fragments/images/02.png)

```{note}
리소스 이름은 대소문자를 구분하며 참조에서 이름과 대소문자가 정확히 일치해야 합니다.
```

```{tip}
이미지 리소스는 `img[src="[resources:image-name.extension]"]` 구문을 사용하여 CSS에서 스타일을 지정할 수 있습니다.
```

## 새 리소스 포함

이제 리소스를 포함하고 조각에서 참조하는 방법을 알았으므로 예제 조각 세트에서 새 리소스를 사용할 수 있습니다.

1. <https://www.freeimages.com/>의 이미지와 같은 이미지를 `liferay-i6r3.zip/src/i6r3-set/resources/` 폴더에 복사합니다.

1. 위에서 한 것처럼 Docker 컨테이너에서 조각 집합을 다시 가져옵니다:

    ```bash
    yarn run import
    ```

1. 조각 세트에 리소스가 포함되어 있는지 확인합니다. UI의 **조각** 페이지에서 **I6R3 세트** 를 선택하고 **리소스** 탭을 클릭합니다. 새 이미지가 리소스 목록에 표시되어야 합니다.

    ![세트의 리소스 목록에 새 이미지가 표시되는지 확인합니다.](./including-default-resources-with-fragments/images/03.png)

1. 세트의 **조각** 탭을 선택하고 **I6R3 카드** 조각을 클릭하여 **I6R3 카드** 조각을 엽니다. 조각 소스가 조각 편집기에 나타납니다.

1. 새 이미지 리소스를 사용하도록 조각을 업데이트합니다. `img` 요소의 `src="[resources:books.png]"` 속성에서 `books.png` 을 삭제하고 `src="[resources:`. 이미지 파일 이름이 포함된 속성 값이 커서 아래에 나타납니다. 해당 속성 값을 선택합니다.

    ![조각 편집기에는 일치하는 리소스가 나열됩니다.](./including-default-resources-with-fragments/images/04.png)

1. 조각이 새 이미지를 렌더링하는지 확인합니다.

    ![조각은 새 리소스 이미지를 사용해야 합니다.](./including-default-resources-with-fragments/images/05.png)

```{note}
조각 세트의 모든 조각은 세트의 리소스에 액세스할 수 있습니다.
```

좋아요! 이제 이미지 리소스 조각 세트를 사용하는 방법을 알았습니다.

## 관련 정보

* [조각에 구성 옵션 추가](./adding-configuration-options-to-fragments.md)
* [조각 자동 배포](./auto-deploying-fragments.md)
* [조각 편집기 사용](./using-the-fragments-editor.md)
