# 헤드리스 API를 사용한 원격 애플리케이션

{bdg-secondary}`7.4+ 사용 가능`

[객체 생성 및 게시](../../objects/creating-and-managing-objects/creating-objects.md) 후 헤드리스 REST API가 자동으로 생성됩니다. 여기에서는 이러한 엔드포인트를 통합하여 간단한 CRUD(생성, 읽기, 업데이트 및 삭제) 원격 애플리케이션을 만드는 방법을 보여줍니다.

## Liferay DXP 설정

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계에 따라 `/o/c/*` URL 패턴을 **기본 포털 CORS 구성** 에 추가하세요.

1. **전역 메뉴**(![전역 메뉴](../../../images/icon-applications-menu.png))를 열고 **제어판** 탭을 클릭한 다음 **시스템 설정** &rarr; 으로 이동합니다. **보안 도구** .

1. **포털 CORS(Cross-Origin Resource Sharing)** 탭으로 이동하여 **기본 포털 CORS 구성** 을 클릭합니다.

1. `/o/c/*` 값으로 **URL 패턴** 을 추가하고 **저장** 을 클릭하세요. 이를 통해 모든 객체 API에 대해 CORS가 활성화됩니다.

   ![Add the /o/c/* URL Pattern for Object APIs.](./remote-applications-with-headless-apis/images/01.png)

## CRUD 애플리케이션을 위한 객체 생성

1. **전역 메뉴**(![전역 메뉴](../../../images/icon-applications-menu.png))를 열고 **제어판** 탭을 클릭한 다음 **개체** 로 이동합니다.

1. **추가** 버튼(![추가 버튼](../../../images/icon-add.png))을 클릭하고 다음 값을 입력합니다.

   | 분야    | 가치      |
   | :---- | :------ |
   | 라벨    | J4X7-객체 |
   | 복수 라벨 | J4X7-객체 |
   | 이름    | J4X7객체  |

   ```{note}
   제공된 React 애플리케이션은 이러한 값을 사용합니다.
   ```

1. 새 **개체** 초안을 선택하고 **필드** 탭을 클릭한 후 다음 **필드** 를 추가하세요.

   | 라벨 | 필드 이름 | 유형 |
   | :- | :---- | :- |
   | 이름 | 이름    | 원본 |
   | 묘사 | 묘사    | 원본 |

1. **세부정보** 탭을 클릭하고 **게시** 를 클릭하세요.

## CRUD 애플리케이션 설정

1. [CRUD 애플리케이션](./liferay-j4x7.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/developing-a-javascript-application/using-react/liferay-j4x7.zip -O
   ```

   ```bash
   unzip liferay-j4x7.zip
   ```

   ```bash
   cd liferay-j4x7
   ```

1. `node`와 `yarn`이 설치되어 있는지 확인하세요. 그렇지 않은 경우 다음 명령을 실행하고 프롬프트를 따르십시오.

   ```bash
   ./setup_tutorial.sh
   ```

1. CRUD 애플리케이션 폴더로 이동하여 React 서버를 시작합니다.

   ```bash
   cd j4x7-custom-element
   ```

   ```bash
   yarn start
   ```

   시작되면 'localhost:3000'으로 이동하여 CRUD 애플리케이션을 확인하세요.

1. 이름과 설명을 입력하고 **추가** 를 클릭하여 J4X7 개체를 추가합니다. 새로운 항목이 추가되었습니다.

   ![Input a name and description and click Add.](./remote-applications-with-headless-apis/images/02.png)

1. 방금 생성한 J4X7 개체의 ID 번호를 기록해 둡니다. ID 번호와 새 이름 및 설명을 입력합니다. **패치** 를 클릭하세요. 항목이 새 이름과 설명으로 업데이트되었습니다.

1. ID 번호를 입력하고 **삭제** 를 클릭하세요. 이제 항목이 삭제되었습니다.

## 코드를 살펴보세요

샘플 CRUD 애플리케이션은 API 요청이 포함된 파일과 CRUD 작업을 처리하기 위한 양식이 포함된 파일의 두 부분으로 구분됩니다.

### 요청 처리

`Requests.js` 파일은 JavaScript에 내장된 `fetch()` 메소드를 사용합니다.

`getObjects()`는 모든 객체에 대해 GET 요청을 만듭니다.

```{literalinclude} ./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/utils/Requests.js
:language: javascript
:lines: 25-33
```

`addObject()`는 새 객체에 대한 이름과 설명이 포함된 POST 요청을 만듭니다.

```{literalinclude} ./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/utils/Requests.js
:language: javascript
:lines: 1-13
```

`patchObject()`는 특정 개체 ID와 새 이름 및 설명을 사용하여 PATCH 요청을 만듭니다.

```{literalinclude} ./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/utils/Requests.js
:language: javascript
:lines: 35-47
```

`deleteObject()`는 특정 객체 ID를 사용하여 DELETE 요청을 만듭니다.

```{literalinclude} ./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/utils/Requests.js
:language: javascript
:lines: 15-23
```

```{note}
여기서는 데모 목적으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth 2.0](../../../headless-delivery/using-oauth2.md)을 통해 사용자에게 권한을 부여해야 합니다. OAuth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](../../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md)을 참조하세요.
```

### 양식 구현

[`GetForm.js`](./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/comComponents/GetForm.js) 는 `getObjects` 메서드를 호출하고 응답을 JSON으로 구문 분석합니다. 각 J4X7 항목은 양식별로 나열됩니다.

[`AddForm.js`](./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/comComponents/AddForm.js) 는 입력을 받고 사용자가 클릭하면 `addObject` 메서드를 호출합니다. **추가하다** .

[`PatchForm.js`](./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/comComponents/PatchForm.js) 는 입력을 받고 사용자가 클릭하면 `patchObject` 메서드를 호출합니다. **반점** .

[`DeleteForm.js`](./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/comComponents/DeleteForm.js) 는 입력을 받고 사용자가 클릭하면 `deleteObject` 메서드를 호출합니다. **삭제** .

양식은 함께 모여 [`App.js`](./remote-apps-with-headless-apis/resources/liferay-j4x7-overlay/src/App.js) 파일과 함께 한 페이지에 표시됩니다.

## 관련 주제

[기본 사용자 정의 요소 생성](../../client-extensions/frontend-client-extensions/tutorials/creating-a-basic-custom-element.md)
[헤드리스 프레임워크 통합](../../objects/understanding-object-integrations/using-custom-object-apis.md)
