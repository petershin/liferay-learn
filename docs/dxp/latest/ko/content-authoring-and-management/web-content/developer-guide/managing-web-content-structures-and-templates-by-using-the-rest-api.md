# REST API를 사용하여 구조 및 템플릿 관리

웹 콘텐츠 구조는 웹 콘텐츠 기사에 포함된 정보를 정의합니다. 구조는 웹 콘텐츠 생성 및 관리를 용이하게 하는 동시에 콘텐츠에 필요한 모든 정보가 포함되도록 보장합니다. 구조를 웹 콘텐츠 템플릿과 연결할 수 있습니다. 템플릿은 페이지에서 콘텐츠 필드가 렌더링되는 방식을 결정합니다. 다음 표에는 웹 콘텐츠 구조 및 템플릿과 함께 Liferay DXP REST API를 사용하여 사용 가능한 옵션이 요약되어 있습니다.

| 사용 가능한 옵션      | 사용할 수 없는 옵션  |
|:---------------|:-------------|
| 구조 및 템플릿 정보 수집 | 구조 또는 템플릿 생성 |
| 구조 교체 권한       | 구조 또는 템플릿 삭제 |

여기에서는 여러 [cURL](https://curl.haxx.se/) 코드 샘플과 함께 사전 구축된 Liferay DXP Docker 이미지를 사용하여 구조화된 콘텐츠를 관리하는 방법을 알아봅니다. 다음 주제에 대해 알아볼 수 있습니다.

* [환경 설정](#setting-up-your-environment)
* [사용할 서비스 식별](#identifying-the-service-to-consume)
* [사이트 구조 가져오기](#getting-the-web-content-structures)
* [사이트 템플릿 가져오기](#getting-the-web-content-templates)
* [구조 권한 얻기](#getting-the-web-content-structure-permissions)
* [구조 권한 교체](#replacing-the-web-content-structure-permissions)

## 환경 설정

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르세요.

1. [샘플 프로젝트](https://learn.liferay.com/dxp/latest/en/content-authoring-and-management/web-content/developer-guide/liferay-m7b1.zip) 을 다운로드하고 압축을 풉니다.

   <!-- This project isn't in the repo -->

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/content-authoring-and-management/web-content/developer-guide/liferay-m7b1.zip -O
   ```

   ```bash
   unzip liferay-m7b1.zip
   ```

    ```{note}
    이러한 스크립트는 기본 인증을 사용하며 테스트용으로 설계되었습니다. 프로덕션 Liferay DXP 환경에서는 기본 인증을 사용하지 마십시오.
    ```

1. 환경을 설정하려면 다음 단계를 완료하세요.

   1. [사이트 ID 확인](#identifying-the-site-id)
   1. [샘플 구조 만들기](#create-a-sample-structure)
   1. [구조 ID 식별](#identifying-the-structure-id)

### 사이트 ID 식별

1. 사이트 메뉴(![사이트 메뉴](../../../images/icon-menu.png))를 열고 **구성** &rarr; **사이트 설정** 으로 이동합니다.
1. 플랫폼 섹션에서 **사이트 구성** 을 클릭합니다.
1. 사이트 ID 아래에서 사이트 식별자를 찾으세요.

   ![Identify the Site ID under the Site Settings and Site Configuration option.](./managing-web-content-structures-and-templates-by-using-the-rest-api/images/01.png)

### 구조 및 템플릿 샘플 생성

```{note}
REST API를 사용하여 프로그래밍 방식으로 구조 또는 템플릿을 생성할 수 없습니다.
```

구조를 생성하려면 [구조 생성](../web-content-structures/creating-structures.md) 을 읽어보세요. 템플릿을 생성하려면 [웹 콘텐츠 템플릿 생성](../web-content-templates/creating-web-content-templates.md) 읽고 샘플 구조를 기반으로 템플릿을 생성하십시오. 이 튜토리얼에서는 단일 텍스트 필드가 있는 기본 구조를 사용하여 `ContentStructure` 서비스를 보여줍니다.

![Basic sample Structure using a single Text field.](./managing-web-content-structures-and-templates-by-using-the-rest-api/images/02.png)

### 샘플 구조 및 템플릿 식별

1. 사이트 메뉴(![사이트 메뉴](../../../images/icon-menu.png))를 열고 **콘텐츠 및 데이터** &rarr; **웹 콘텐츠** 로 이동합니다.
1. **구조** 탭을 클릭하세요.
1. ID 열에서 구조의 ID를 식별합니다.

   ![In the Structures tab, identify the ID for your Structure under the ID column.](./managing-web-content-structures-and-templates-by-using-the-rest-api/images/01.png)

프로그래밍 방식으로 구조 ID를 식별할 수도 있습니다. 자세한 내용은 [REST API를 사용하여 구조 및 템플릿 관리](./managing-web-content-structures-and-templates-by-using-the-rest-api.md) 참조하세요.

## 사용할 서비스 식별

Liferay DXP Headless Delivery API의 `StructuredContent` 서비스를 사용하여 웹 콘텐츠를 관리하세요. 이 서비스와 다양한 HTTP 메서드를 모두 식별하려면 Liferay API Explorer를 사용하세요. 자세한 내용은 [REST 서비스 사용](../../../headless-delivery/consuming-apis/consuming-rest-services.md) 참조하세요.

## 사이트 구조 가져오기

`ContentStructures_GET_FromSite.sh` cURL 스크립트는 기존 사이트 구조를 나열합니다. 이 스크립트는 사이트 ID를 유일한 매개변수로 사용하여 `GET` HTTP 메서드와 함께 `ContentStructure` 서비스를 사용합니다.

테이블

| 방법 | 서비스                | 엔드포인트                       |
| :- | :----------------- | :-------------------------- |
| 얻다 | `ContentStructure` | /v1.0/sites/{siteId}/콘텐츠 구조 |

```bash
   ./ContentStructures_GET_FromSite.sh 20125
```

| 매개 변수 # | 묘사       |
| :------ | :------- |
| $1      | `siteId` |

다음 코드는 스크립트에서 생성된 JSON 출력을 보여줍니다. 스크립트는 사이트의 모든 구조를 반환합니다. 이 예에서는 `id`와 `name`으로 식별되는 단일 구조를 볼 수 있습니다.

```json
   {
    "actions" : { },
    "facets" : [ ],
    "items" : [ {
        "availableLanguages" : [ "en-US" ],
        "contentStructureFields" : [ {
        "dataType" : "string",
        "inputControl" : "text",
        "label" : "Text",
        "localizable" : true,
        "multiple" : false,
        "name" : "Text86549034",
        "nestedContentStructureFields" : [ ],
        "options" : [ ],
        "predefinedValue" : "",
        "repeatable" : false,
        "required" : false,
        "showLabel" : true
        } ],
        "creator" : {
        "additionalName" : "",
        "contentType" : "UserAccount",
        "familyName" : "Bowman",
        "givenName" : "David",
        "id" : 20129,
        "name" : "David Bowman"
        },
        "dateCreated" : "2021-08-02T13:15:42Z",
        "dateModified" : "2021-08-02T13:16:57Z",
        "description" : "",
        "id" : 41837,
        "name" : "Simple Structure",
        "siteId" : 20125
    } ],
    "lastPage" : 1,
    "page" : 1,
    "pageSize" : 20,
    "totalCount" : 1
   }
```

구조에는 `contentStructureFields` 아래의 `dataType` 섹션에 설명된 단일 텍스트 필드가 있습니다. 구조에 더 많은 요소를 포함하면 `contentStructureFields` 아래에 추가 섹션이 표시됩니다. 다음은 텍스트(`"dataType" : "string"`) 및 이미지 필드(`"dataType" : "image"`)가 있는 구조에 대한 부분 JSON 출력입니다.

```json
{
  "actions": {},
  "facets": [],
  "items": [
    {
      "availableLanguages": ["en-US"],
      "contentStructureFields": [
        {
          "dataType": "string",
          "inputControl": "text",
          "label": "Text",
          "localizable": true,
          "multiple": false,
          "name": "Text86549034",
          "nestedContentStructureFields": [],
          "options": [],
          "predefinedValue": "",
          "repeatable": false,
          "required": false,
          "showLabel": true
        },
        {
          "dataType": "image",
          "label": "Image",
          "localizable": true,
          "multiple": false,
          "name": "Image96876678",
          "nestedContentStructureFields": [],
          "options": [],
          "predefinedValue": "{}",
          "repeatable": false,
          "required": false,
          "showLabel": true
        }
      ]
    }
  ]
}
```

## 사이트 템플릿 가져오기

`ContentTemplates_GET_FromSite.sh` cURL 스크립트는 기존 사이트 템플릿을 나열합니다. 이 스크립트는 사이트 ID를 유일한 매개변수로 사용하여 `GET` HTTP 메서드와 함께 `ContentTemplate` 서비스를 사용합니다.

테이블

| 방법 | 서비스               | 엔드포인트                        |
| :- | :---------------- | :--------------------------- |
| 얻다 | `ContentTemplate` | /v1.0/sites/{siteId}/콘텐츠-템플릿 |

```bash
   ./ContentTemplates_GET_FromSite.sh 20125
```

cURL 스크립트 매개변수:

| 매개 변수 # | 묘사       |
| :------ | :------- |
| $1      | `siteId` |

다음은 스크립트에서 생성된 부분 JSON 출력입니다. 스크립트는 사이트의 모든 템플릿을 반환합니다. 이 예에서는 `id`와 `name`으로 식별되는 단일 템플릿을 볼 수 있습니다. `contentStructureId`는 관련 구조 ID에 해당하고 `templateScript`는 템플릿을 설명하는 FreeMarker 템플릿 언어에 해당합니다.

```json
{
  ...
    "availableLanguages" : [ "en-US" ],
    "contentStructureId" : 41837,
    "creator" : {
      "additionalName" : "",
      "contentType" : "UserAccount",
      "familyName" : "Bowman",
      "givenName" : "David",
      "id" : 20129,
      "name" : "David Bowman"
    },
    "dateCreated" : "2021-08-02T13:24:32Z",
    "dateModified" : "2021-08-02T14:33:24Z",
    "description" : "",
    "id" : "41847",
    "name" : "Simple Template",
    "programmingLanguage" : "ftl",
    "siteId" : 20125,
    "templateScript" : "<#if (Text86549034.getData())??>\n\t${Text86549034.getData()}\n</#if>"
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 1
}
```

```{note}
템플릿에 대한 자세한 내용은 [웹 콘텐츠 템플릿 생성](../web-content-templates/creating-web-content-templates.md) 참조하세요.
```

## 구조 권한 얻기

`ContentStructure_GET_Permissions.sh` cURL 스크립트는 구조의 권한을 나열합니다. 이 스크립트는 구조 ID를 유일한 매개변수로 사용하여 `GET` HTTP 메소드와 함께 `ContentStructure` 서비스를 사용합니다.

| 방법 | 서비스                | 엔드포인트                                                       |
| :- | :----------------- | :---------------------------------------------------------- |
| 놓다 | `ContentStructure` | `/v1.0/content-structures/{contentStructureId}/permissions` |

```bash
   ./ContentStructure_GET_Permissions.sh 41837
```

cURL 스크립트 매개변수:

| 매개 변수 # | 묘사      |
| :------ | :------ |
| $1      | 구조 `id` |

JSON 출력에는 `items` 섹션 아래의 권한이 포함됩니다. 이 예에는 `roleName`의 샘플 구조에 대한 권한이 있고 `actionIds`에 권한 목록이 있는 역할이 하나만 있습니다.

```json
{
  "actions": {
    "get": {
      "method": "GET",
      "href": "http://localhost:8080/o/headless-delivery/v1.0/content-structures/41837/permissions"
    },
    "replace": {
      "method": "PUT",
      "href": "http://localhost:8080/o/headless-delivery/v1.0/content-structures/41837/permissions"
    }
  },
  "facets": [],
  "items": [
    {
      "actionIds": ["DELETE", "PERMISSIONS", "UPDATE", "VIEW"],
      "roleName": "Owner"
    }
  ],
  "lastPage": 1,
  "page": 1,
  "pageSize": 2,
  "totalCount": 2
}
```

```{note}
권한 관리 방법에 대해 알아보려면 [웹 콘텐츠 구조 및 템플릿에 권한 할당](../designing-web-content-structures/designing-permissions-to-structures-and-templates.md)을 참조하세요.
```

## 구조 권한 교체

원래 구조 권한을 대체하려면 `ContentStructure` 서비스와 함께 `PUT` HTTP 메서드를 사용하세요. 이 스크립트 예는 구조화된 콘텐츠 식별자 `id`를 사용하여 고급 사용자 역할에 대한 `DELETE` 및 `VIEW` 권한을 포함합니다.

| 방법 | 서비스                | 엔드포인트                                                       |
| :- | :----------------- | :---------------------------------------------------------- |
| 놓다 | `ContentStructure` | `/v1.0/content-structures/{contentStructureId}/permissions` |

```bash
   ./ContentStructure_PUT_Permissions.sh 41837
```

cURL 스크립트 매개변수:

| 매개 변수 # | 묘사      |
| :------ | :------ |
| $1      | 구조 `id` |

JSON 출력은 `items` 섹션 아래에 각 역할에 대해 하나씩 두 개의 항목을 표시합니다.

```json
{
  "actions": {
    "get": {
      "method": "GET",
      "href": "http://localhost:8080/o/headless-delivery/v1.0/content-structures/41837/permissions"
    },
    "replace": {
      "method": "PUT",
      "href": "http://localhost:8080/o/headless-delivery/v1.0/content-structures/41837/permissions"
    }
  },
  "facets": [],
  "items": [
    {
      "actionIds": ["DELETE", "PERMISSIONS", "UPDATE", "VIEW"],
      "roleName": "Owner"
    },
    {
      "actionIds": ["DELETE", "VIEW"],
      "roleName": "Power User"
    }
  ],
  "lastPage": 1,
  "page": 1,
  "pageSize": 2,
  "totalCount": 2
}
```
