# 고급 웹 콘텐츠 API

Liferay DXP REST 서비스를 사용하여 사이트의 구조화된 콘텐츠를 만들고 관리할 수 있습니다. 구조화된 콘텐츠는 웹 콘텐츠 구조를 사용하는 [웹 콘텐츠](../web-content-articles/adding-a-basic-web-content-article.md) 입니다. 구조는 웹 콘텐츠 기사에 포함된 작성자, 요약 및 콘텐츠와 같은 정보를 정의합니다. 구조는 콘텐츠에 필요한 모든 정보가 포함되도록 합니다. 구조에 대한 자세한 내용은 [웹 콘텐츠 구조 이해](../web-content-structures/understanding-web-content-structures.md)을 참조하십시오.

여기에서는 미리 빌드된 Liferay DXP Docker 이미지와 여러 [cURL](https://curl.haxx.se/) 코드 샘플을 사용하여 구조 및 구조화된 콘텐츠에 대해 알아봅니다. Liferay DXP에서 REST API 사용에 대한 개요는 [REST 서비스 사용](../../../headless-delivery/consuming-apis/consuming-rest-services.md)을 참조하십시오.

```{note}
Web Content API에 대한 소개는 [Web Content API 기초](./web-content-api-basics.md)를 참조하십시오.
```

## 환경 설정
```{include} /_snippets/run-liferay-dxp.md
```

Then, download and unzip the [sample project](https://learn.liferay.com/dxp/latest/en/content-authoring-and-management/web-content/developer-guide/liferay-m7b2.zip):

```bash
curl https://learn.liferay.com/dxp/latest/en/content-authoring-and-management/web-content/developer-guide/liferay-m7b2.zip -O
```

```bash
unzip liferay-m7b2.zip
```

```{note}
이러한 스크립트는 기본 인증을 사용하며 테스트용으로 설계되었습니다. 프로덕션 Liferay DXP 환경에서 기본 인증을 사용하지 마십시오.
```

### 사이트 ID 식별

1. 사이트 메뉴(![Site menu](../../../images/icon-menu.png))를 열고 *구성* &rarr; *사이트 설정*로 이동합니다.
1. 플랫폼 섹션에서 *사이트 구성*을 클릭하십시오. Liferay DXP 버전 7.3 이하의 경우 *일반* 탭을 클릭합니다.
1. 사이트 ID 아래에서 사이트 식별자를 찾습니다.

   ![사이트 설정 및 사이트 구성 옵션에서 사이트 ID를 식별합니다.](./advanced-web-content-api/images/05.png)

### Liferay DXP에 이미지 추가

여기에서는 이미지를 비롯한 다양한 콘텐츠 필드가 포함된 웹 콘텐츠 기사로 작업합니다. 샘플 웹 콘텐츠 기사에 대해 이러한 이미지를 추가하려면 다음 단계를 따르십시오.

1. 사이트 메뉴(![Site menu](../../../images/icon-menu.png))를 열고 *콘텐츠 & 데이터* &rarr; *문서 및 미디어*으로 이동합니다.
1. *추가* 버튼(![Add](../../../images/icon-add.png))을 클릭하고 *여러 파일*를 선택합니다.
1. `foo.png`, `bar.png`및 `goo.png` 이미지를 [샘플 프로젝트 폴더](https://learn.liferay.com/dxp/latest/en/content-authoring-and-management/web-content/developer-guide/liferay-m7b2.zip) 에서 드롭 영역으로 끌어다 놓습니다.
1. *게시*을 클릭합니다.

또는 `Document_POST_ToSite.sh` 스크립트를 사용하여 REST API `문서` 서비스를 사용하여 각 이미지를 개별적으로 게시할 수 있습니다.

```bash
curl \
    -F "file=@${1}" \
    -H "Content-Type: multipart/form-data" \
    -X POST \
    "http://localhost:8080/o/headless-delivery/v1.0/sites/${2}/documents" \
    -u "test@liferay.com:learn"
```

이 예는 상대 이미지 파일 경로와 사이트 ID를 매개변수로 사용하여 `foo.png` 이미지를 게시합니다.

| 방법    | 서비스        | 끝점                           |
|:----- |:---------- |:---------------------------- |
| 가져 오기 | `Document` | `/v1.0/sites/${2}/documents` |

```bash
./Document_POST_ImageToSite.sh "../images/foo.png" 20125
```

| 매개 변수 # | 묘사        |
|:------- |:--------- |
| $1      | 파일의 상대 경로 |
| $2      | `siteId`  |

JSON 출력에는 `id` 필드에 이미지 식별자가 포함됩니다.

```json
{
  ...
  "encodingFormat" : "image/png",
  "externalReferenceCode" : "44339",
  "fileExtension" : "png",
  "id" : 44339,
  ...
  "title" : "foo.png"
}
```

REST API를 사용하여 문서 작업에 대한 자세한 내용은 [문서 API 기본 사항](../../documents-and-media/developer-guide/document-api-basics.md)을 참조하십시오.

### 샘플 구조 만들기

```{note}
REST API를 사용하여 프로그래밍 방식으로 웹 콘텐츠 구조를 생성할 수 없습니다.
```

1. 사이트 메뉴(![Site menu](../../../images/icon-menu.png))를 열고 *콘텐츠 & 데이터* &rarr; *웹 콘텐츠*으로 이동합니다.
1. *Structures* 탭을 선택하고 *Add* 버튼(![Add](../../../images/icon-add.png))을 클릭합니다.
1. 다음 정보를 사용하여 새 웹 콘텐츠 구조를 만듭니다.

    - 이름: `푸`
    - 필드(이 순서대로): `텍스트`, `이미지`, `날짜`, `단일 선택`

1. 단일 선택 필드에 다음 값을 사용합니다.

   - 첫 번째 옵션 값: `Foo`
   - 두 번째 옵션 값: `Goo`

   ![사용자 인터페이스에서 새 웹 콘텐츠 구조를 만듭니다.](./advanced-web-content-api/images/01.png)

1. 각 구조 필드를 클릭하고 해당 필드 참조 값을 업데이트합니다(아래 표 참조). 사이드바의 고급 섹션에서 필드 참조 값을 찾을 수 있습니다.

1. *저장*을 클릭합니다.

  | 분야       | 새 필드 참조 값                  |
  |:-------- |:-------------------------- |
  | 원본       | `TextReference`            |
  | 심상 화랑 심상 | `ImageReference`           |
  | 날짜       | `DateReference`            |
  | 선택       | `SingleSelectionReference` |

  ![구조 필드 필드 참조 값을 업데이트합니다.](./advanced-web-content-api/images/03.gif)

자세한 내용은 [구조 만들기](../web-content-structures/creating-structures.md)을 참조하십시오.

### 샘플 템플릿 만들기

```{note}
REST API를 사용하여 프로그래밍 방식으로 웹 콘텐츠 템플릿을 만들 수 없습니다.
```

구조의 `이미지` 필드를 포함하는 웹 콘텐츠 템플릿을 만듭니다.

1. 사이트 메뉴(![Site menu](../../../images/icon-menu.png))를 열고 *콘텐츠 & 데이터* &rarr; *웹 콘텐츠*으로 이동합니다.
1. *템플릿* 탭을 선택하고 *추가* 버튼(![Add](../../../images/icon-add.png))을 클릭합니다.
1. 템플릿 이름으로 _Foo_ 을 입력합니다.
1. 속성 측면 패널에서 구조 필드 옆에 있는 *추가* 버튼(![Add](../../../images/icon-plus.png))을 클릭합니다.

   ![구조 필드 옆에 있는 추가 버튼을 클릭하여 템플릿을 구조에 연결합니다.](./advanced-web-content-api/images/06.png)

1. [이전 섹션](#create-the-structure-sample)에서 _Foo_ 웹 콘텐츠 구조를 선택합니다.
1. FreeMarker 편집기에 포함된 기본 `<#-- -->` 블록 주석을 삭제합니다.
1. 사이드바에서 *요소* (![Elements](../../../images/icon-list-ul.png))을 클릭합니다.
1. 필드 그룹에서 *텍스트*, *이미지*, *날짜*및 *단일 선택* 필드를 클릭하여 템플릿에 추가합니다. FreeMarker 편집기에서 각 필드가 새 줄로 시작하는지 확인하십시오.

   ![FreeMarker 편집기에서 웹 콘텐츠 템플릿 필드를 편집합니다.](./advanced-web-content-api/images/07.gif)

1. *저장*을 클릭합니다.

구조의 `이미지` 필드 없이 두 번째 웹 콘텐츠 템플릿을 만듭니다.

1. 템플릿 탭에서 *작업* 버튼(![Actions](../../../images/icon-actions.png))을 클릭하고 *복사*를 선택합니다.

   ![*작업* 메뉴를 사용하여 첫 번째 템플릿을 복사합니다.](./advanced-web-content-api/images/10.png)

1. 템플릿의 이름을 _Goo_ 로 업데이트하고 *Copy*을 클릭합니다.

   ![템플릿의 이름을 "Goo"로 업데이트합니다.](./advanced-web-content-api/images/09.png)

1. 템플릿 탭에서 새 _Goo_ 템플릿을 클릭합니다.
1. 템플릿 편집기에서 FreeMarker 스크립트의 이미지 정보 `<#if (ImageReference.getData())></#if>` 를 제거합니다.

   ![템플릿에서 이미지 정보를 제거합니다.](./advanced-web-content-api/images/11.gif)

1. *저장*을 클릭합니다.

 자세한 내용은 [웹 콘텐츠 템플릿 만들기](../web-content-templates/creating-web-content-templates.md)을 참조하십시오.

## 웹 콘텐츠 구조 ID 가져오기

기존 사이트 구조를 모두 반환하려면 `ContentStructures_GET_FromSite.sh` 스크립트를 사용하십시오. 이 스크립트는 `GET` HTTP 메서드 및 [사이트 ID](#identify-the-site-id) 매개변수와 함께 `ContentStructure` 서비스를 사용합니다.

| 방법    | 서비스                | 끝점                                    |
|:----- |:------------------ |:------------------------------------- |
| 가져 오기 | `ContentStructure` | `/v1.0/sites/${1}/content-structures` |

```bash
./ContentStructures_GET_FromSite.sh 20125
```

| 매개 변수 # | 묘사       |
|:------- |:-------- |
| $1      | `siteId` |

이 코드는 웹 콘텐츠 구조 `id` (`"id" : 43563`) 및 `name` (`"name" : "Foo"`)를 식별할 수 있는 스크립트의 JSON 출력을 보여줍니다. `contentStructureFields` 섹션은 구조 필드를 설명합니다. 이 구조에는 `TextReference`, `ImageReference`, `DateReference`및 `SingleSelectionReference`이라는 이름의 네 가지 필드가 있습니다.

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
      "name" : "TextReference",
      "nestedContentStructureFields" : [ ],
      "options" : [ ],
      "predefinedValue" : "",
      "repeatable" : false,
      "required" : false,
      "showLabel" : true
    }, {
      "dataType" : "image",
      "label" : "Image",
      "localizable" : true,
      "multiple" : false,
      "name" : "ImageReference",
      "nestedContentStructureFields" : [ ],
      "options" : [ ],
      "predefinedValue" : "{}",
      "repeatable" : false,
      "required" : false,
      "showLabel" : true
    }, {
      "dataType" : "date",
      "label" : "Date",
      "localizable" : true,
      "multiple" : false,
      "name" : "DateReference",
      "nestedContentStructureFields" : [ ],
      "options" : [ ],
      "predefinedValue" : "",
      "repeatable" : false,
      "required" : false,
      "showLabel" : true
    }, {
      "dataType" : "string",
      "inputControl" : "radio",
      "label" : "Single Selection",
      "localizable" : true,
      "multiple" : false,
      "name" : "SingleSelectionReference",
      "nestedContentStructureFields" : [ ],
      "options" : [ {
        "label" : "Foo",
        "value" : "Option13142925"
      }, {
        "label" : "Goo",
        "value" : "Option50805674"
      } ],
      "predefinedValue" : "[]",
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
    "dateCreated" : "2021-08-25T07:52:46Z",
    "dateModified" : "2021-08-25T08:01:58Z",
    "description" : "",
    "id" : 43563,
    "name" : "Foo",
    "siteId" : 20125
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 1
}
```

## 이미지 ID 가져오기

이전에 게시한 [이미지의 ID를 얻으려면](#adding-the-images-to-liferay-dxp)Documents_GET_FromSite.sh `스크립트를 사용`. 이 스크립트는 `GET` HTTP 메서드 및 [사이트 ID](#identify-the-site-id) 매개변수와 함께 `문서` 서비스를 사용합니다.

| 방법    | 서비스        | 끝점                           |
|:----- |:---------- |:---------------------------- |
| 가져 오기 | `Document` | `/v1.0/sites/${1}/documents` |

```bash
./Documents_GET_FromSite.sh 20125
```

| 매개 변수 # | 묘사       |
|:------- |:-------- |
| $1      | `siteId` |

## 웹 콘텐츠 템플릿 가져오기

`ContentTemplates_GET_FromSite` 스크립트를 사용하여 사이트의 모든 템플릿을 가져옵니다. 이 스크립트는 `GET` HTTP 메서드 및 [Site Id](#identify-the-site-id) 매개변수와 함께 `ContentTemplate` 서비스를 사용합니다.

| 방법    | 서비스               | 끝점                                   |
|:----- |:----------------- |:------------------------------------ |
| 가져 오기 | `ContentTemplate` | `/v1.0/sites/${1}/content-templates` |

```bash
./ContentTemplates_GET_FromSite.sh 20125
```

| 매개 변수 # | 묘사       |
|:------- |:-------- |
| $1      | `siteId` |

아래는 스크립트의 JSON 출력입니다. 다음 정보를 확인하십시오.

- 이 JSON 출력에는 `"name": "Foo"` 및 `"name": "Goo"`의 두 가지 템플릿이 있습니다.
- `contentStructureId` 필드는 템플릿에 연결된 웹 콘텐츠 구조를 나타냅니다.
- `templateScript` 은 `programmingLanguage`에 지정된 언어로 된 스크립트를 포함합니다. 이 예에서 FreeMarker는 언어입니다.
- `Foo` 템플릿의 `templateScript` 필드는 `<#if (ImageReference.getData())></#if>`에서 참조되는 이미지 필드를 포함합니다. `Goo` 템플릿의 `templateScript` 필드는 이 참조를 포함하지 않습니다.

```bash
{
  "actions" : {
    "get" : {
      "method" : "GET",
      "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/20125/content-templates"
    }
  },
  "facets" : [ ],
  "items" : [ {
    "actions" : {
      "get" : {
        "method" : "GET",
        "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/20125/content-templates/{contentTemplateId}"
      }
    },
    "availableLanguages" : [ "en-US" ],
    "contentStructureId" : 43563,
    "creator" : {
      "additionalName" : "",
      "contentType" : "UserAccount",
      "familyName" : "Bowman",
      "givenName" : "David",
      "id" : 20129,
      "name" : "David Bowman"
    },
    "dateCreated" : "2021-08-25T13:39:20Z",
    "dateModified" : "2021-08-25T13:39:20Z",
    "description" : "",
    "id" : "43823",
    "name" : "Foo",
    "programmingLanguage" : "ftl",
    "siteId" : 20125,
    "templateScript" : "<#if (TextReference.getData())??>\n\t${TextReference.getData()}\n</#if>\n<#if (ImageReference.getData())?? && ImageReference.getData() != \"\">\n\t<img alt=\"${ImageReference.getAttribute(\"alt\")}\" data-fileentryid=\"${ImageReference.getAttribute(\"fileEntryId\")}\" src=\"${ImageReference.getData()}\" />\n</#if>\n<#assign DateReference_Data = getterUtil.getString(DateReference.getData())>\n\n<#if validator.isNotNull(DateReference_Data)>\n\t<#assign DateReference_DateObj = dateUtil.parseDate(\"yyyy-MM-dd\", DateReference_Data, locale)>\n\n\t${dateUtil.getDate(DateReference_DateObj, \"dd MMM yyyy - HH:mm:ss\", locale)}\n</#if>\n<#if (SingleSelectionReference.getData())??>\n\t${SingleSelectionReference.getData()}\n</#if>"
  }, {
    "actions" : {
      "get" : {
        "method" : "GET",
        "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/20125/content-templates/{contentTemplateId}"
      }
    },
    "availableLanguages" : [ "en-US" ],
    "contentStructureId" : 43563,
    "creator" : {
      "additionalName" : "",
      "contentType" : "UserAccount",
      "familyName" : "Bowman",
      "givenName" : "David",
      "id" : 20129,
      "name" : "David Bowman"
    },
    "dateCreated" : "2021-08-26T10:10:22Z",
    "dateModified" : "2021-08-26T14:08:53Z",
    "description" : "",
    "id" : "44177",
    "name" : "Goo",
    "programmingLanguage" : "ftl",
    "siteId" : 20125,
    "templateScript" : "<#if (TextReference.getData())??>\n\t${TextReference.getData()}\n</#if>\n<#assign DateReference_Data = getterUtil.getString(DateReference.getData())>\n\n<#if validator.isNotNull(DateReference_Data)>\n\t<#assign DateReference_DateObj = dateUtil.parseDate(\"yyyy-MM-dd\", DateReference_Data, locale)>\n\n\t${dateUtil.getDate(DateReference_DateObj, \"dd MMM yyyy - HH:mm:ss\", locale)}\n</#if>\n<#if (SingleSelectionReference.getData())??>\n\t${SingleSelectionReference.getData()}\n</#if>"
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 2
}
```

### ID로 웹 콘텐츠 템플릿 가져오기

</a> 위의 스크립트
은 사이트의 모든 웹 콘텐츠 템플릿을 수집하지만 해당 ID를 참조하여 특정 템플릿에 대한 정보를 얻을 수 있습니다. 이를 위해 `ContentTemplate_GET_ById.sh` cURL 스크립트를 사용하십시오. 이 스크립트는 사이트 ID 및 템플릿 ID 매개변수를 사용합니다.</p> 

| 방법    | 서비스               | 끝점                                        |
|:----- |:----------------- |:----------------------------------------- |
| 가져 오기 | `ContentTemplate` | `/v1.0/sites/${1}/content-templates/${2}` |




```bash
./ContentTemplate_GET_ById.sh 20125 43823
```


| 매개 변수 # | 묘사       |
|:------- |:-------- |
| $1      | `siteId` |
| $2      | 템플릿 `ID` |




## 웹 콘텐츠 기사 게시

`StructuredContent_POST_ToSite.sh`</a>스크립트는 `POST` HTTP 메서드와 이전에 생성한 샘플 구조를 사용하여 새 웹 콘텐츠 를 생성합니다. 스크립트는 [Site Id](#identifying-the-site-id), Structure Id 및 foo.png의 [image Id](#getting-the-images-ids) 을 매개변수로 사용합니다.</p> 

| 방법 | 서비스                 | 끝점                                         |
|:-- |:------------------- |:------------------------------------------ |
| 놓다 | `StructuredContent` | `/v1.0/sites/{siteId}/structured-contents` |




```bash
./StructuredContent_POST_ToSite.sh 20125 43563 43795
```


cURL 스크립트 매개변수:

| 매개 변수 # | 묘사                   |
|:------- |:-------------------- |
| $1      | `siteId`             |
| $2      | `contentStructureId` |
| $3      | 이미지 `ID`             |


Liferay DXP에서 새 웹 콘텐츠 기사를 찾으려면 *사이트 메뉴* (![Site menu](../../../images/icon-menu.png))를 열고 *콘텐츠 & 데이터* &rarr; *웹 콘텐츠*로 이동합니다.

![POST HTTP 메서드의 웹 콘텐츠 기사.](./advanced-web-content-api/images/08.png)

아래는 스크립트의 JSON 출력입니다. 스크립트 게시물

- `"제목"이라는 새 웹 콘텐츠 기사: "Able"`
- 기사의 본문을 정의하는 4개의 `contentFields` 값: 
    - `TextReference`의 텍스트 문자열.
  - `ImageReference`의 이미지.
  - `DateReference`의 날짜 정보.
  - `SingleSelectionReference`의 라디오 버튼 컨트롤.



```bash
{
  "actions" : {
    ...
  },
  "availableLanguages" : [ "en-US" ],
  "contentFields" : [ {
    "contentFieldValue" : {
      "data" : "This text describes Foo."
    },
    "dataType" : "string",
    "inputControl" : "text",
    "label" : "Text",
    "name" : "TextReference",
    "nestedContentFields" : [ ],
    "repeatable" : false
  }, {
    "contentFieldValue" : {
      "image" : {
        "contentType" : "Document",
        "contentUrl" : "/documents/20125/0/foo.png/50956e56-9571-8f73-ae6e-9fca20fe0e3a?t=1629897455431",
        "description" : "This text describes Foo's image.",
        "encodingFormat" : "image/png",
        "fileExtension" : "png",
        "id" : 43795,
        "sizeInBytes" : 6232,
        "title" : "Foo"
      }
    },
    "dataType" : "image",
    "label" : "Image",
    "name" : "ImageReference",
    "nestedContentFields" : [ ],
    "repeatable" : false
  }, {
    "contentFieldValue" : {
      "data" : "2021-08-30T00:00:00Z"
    },
    "dataType" : "date",
    "label" : "Date",
    "name" : "DateReference",
    "nestedContentFields" : [ ],
    "repeatable" : false
  }, {
    "contentFieldValue" : {
      "data" : "Foo"
    },
    "dataType" : "string",
    "inputControl" : "radio",
    "label" : "Single Selection",
    "name" : "SingleSelectionReference",
    "nestedContentFields" : [ ],
    "repeatable" : false
  } ],
  "contentStructureId" : 43563,
  "creator" : {
    "additionalName" : "",
    "contentType" : "UserAccount",
    "familyName" : "Bowman",
    "givenName" : "David",
    "id" : 20129,
    "name" : "David Bowman"
  },
  "customFields" : [ ],
  "dateCreated" : "2021-08-26T06:14:06Z",
  "dateModified" : "2021-08-26T06:14:06Z",
  "datePublished" : "2021-08-26T06:14:00Z",
  "description" : "",
  "externalReferenceCode" : "43847",
  "friendlyUrlPath" : "able",
  "id" : 43849,
  "key" : "43847",
  "keywords" : [ ],
  "numberOfComments" : 0,
  "relatedContents" : [ ],
  "renderedContents" : [ {
    "contentTemplateId" : "43823",
    "contentTemplateName" : "Foo",
    "markedAsDefault" : true,
    "renderedContentURL" : "http://localhost:8080/o/headless-delivery/v1.0/structured-contents/43849/rendered-content/43823"
  }, {
    "contentTemplateId" : "43868",
    "contentTemplateName" : "Goo",
    "markedAsDefault" : false,
    "renderedContentURL" : "http://localhost:8080/o/headless-delivery/v1.0/structured-contents/44060/rendered-content/43868"
  } ],
  "siteId" : 20125,
  "subscribed" : false,
  "taxonomyCategoryBriefs" : [ ],
  "title" : "Able",
  "uuid" : "01ace059-814a-132d-d46d-21737ef2ec53"
}
```


<!--
Note: PATCH option information will be included in a follow-up (see LPS-137932).

## Updating the Web Content Article
-->



## 특정 템플릿으로 렌더링된 웹 콘텐츠 기사 가져오기

웹 콘텐츠 기사는 특정 템플릿에 연결되어 있지 않습니다. 템플릿은 웹 콘텐츠가 렌더링되는 방식을 정의하며 동일한 웹 콘텐츠에 대해 다른 템플릿을 사용할 수 있습니다. 자세한 내용은 [웹 콘텐츠 구조 이해](../web-content-structures/understanding-web-content-structures.md)을 참조하십시오.



```{tip}
웹 콘텐츠 기사는 특정 템플릿에 연결되어 있지 않기 때문에 새 기사를 'POST'할 때 템플릿을 지정할 수 없습니다(HTTP 'POST' 메서드는 템플릿을 설명하는 'renderedContents' 섹션을 무시합니다).
```


스크립트 `./StructuredContentRendered_GET_ById.sh` 은 선택한 웹 콘텐츠 및 템플릿을 사용하여 웹 콘텐츠를 렌더링합니다. 이 스크립트는 `StructuredContent` 서비스에서 `GET` HTTP 메서드를 사용합니다.

| 방법 | 서비스                 | 끝점                                                     |
|:-- |:------------------- |:------------------------------------------------------ |
| 놓다 | `StructuredContent` | `/v1.0/structured-contents/${1}/rendered-content/${2}` |




```bash
./StructuredContentRendered_GET_ById.sh 43849 43868
```


다음은 `이미지` 필드가 있는 템플릿을 사용한 스크립트 출력입니다.



```html
Foo<picture data-fileentryid="43795"><source media="(max-width:300px)" srcset="http://localhost:8080/o/adaptive-media/image/43795/Thumbnail-300x300/foo.png?t=1629897455431, /o/adaptive-media/image/43795/Preview-1000x0/foo.png?t=1629897455431 2x" /><source media="(max-width:600px) and (min-width:300px)" srcset="http://localhost:8080/o/adaptive-media/image/43795/Preview-1000x0/foo.png?t=1629897455431" /><img alt="Foo alt-image description" data-fileentryid="43795" src="http://localhost:8080/documents/20125/0/foo.png/50956e56-9571-8f73-ae6e-9fca20fe0e3a?t=1629897455431" /></picture>30 Aug 2021 - 00:00:00Option1314292
```


대신 `이미지` 필드 없이 웹 콘텐츠 템플릿을 지정하면 `<picture></picture>` 정보가 출력에 렌더링되지 않습니다. 다음은 `이미지` 필드 없이 템플릿을 사용한 스크립트 출력입니다.



```bash
./StructuredContentRendered_GET_ById.sh 43849 43823 
```




```html
Foo30 Aug 2021 - 00:00:00Option13142925
```


cURL 스크립트 매개변수:

| 매개 변수 # | 묘사                  |
|:------- |:------------------- |
| $1      | 구조화된 콘텐츠 `ID`       |
| $2      | `contentTemplateId` |




## 웹 콘텐츠 기사 넣기

`PUT` HTTP 메서드를 `StructuredContent` 서비스와 함께 사용하여 원래 웹 콘텐츠 정보를 바꿉니다. `StructuredContent_PUT_ById` 스크립트는 웹 콘텐츠 및 구조 식별자를 사용하여 기사의 이름을 `Baker` 으로 바꾸고 기사의 콘텐츠를 `Bar` 에서 `Goo`로 바꿉니다.

| 방법 | 서비스                 | 끝점                                                |
|:-- |:------------------- |:------------------------------------------------- |
| 놓다 | `StructuredContent` | `/v1.0/structured-contents/{structuredContentId}` |

```bash
./StructuredContent_PUT_ById.sh 43849 43563 43805
```

cURL 스크립트 매개변수:

| 매개 변수 # | 묘사                   |
|:------- |:-------------------- |
| $1      | 구조화된 콘텐츠 `ID`        |
| $2      | `contentStructureId` |
| $3      | 이미지 `ID`             |

## 추가 정보

- [웹 콘텐츠 API 기본 사항](./web-content-api-basics.md)
- [REST 서비스 사용](../../../headless-delivery/consuming-apis/consuming-rest-services.md)
- [웹 콘텐츠 구조 이해](../web-content-structures/understanding-web-content-structures.md)
