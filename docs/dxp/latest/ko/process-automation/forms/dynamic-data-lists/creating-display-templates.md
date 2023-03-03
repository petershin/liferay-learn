# 표시 템플릿 만들기

모든 데이터 정의에 대해 필요한 만큼의 디스플레이를 생성할 수 있습니다. 데이터 목록의 양식 보기에 특정 데이터 정의의 모든 필드를 표시하지 않는 양식 템플릿을 만든 경우 목록 보기에도 해당 필드를 표시하고 싶지 않을 것입니다. 디스플레이 템플릿을 사용하여 목록 보기를 수정합니다.

참고: [웹 콘텐츠 템플릿](../../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md)에 익숙한 경우 표시 템플릿은 동일한 방식으로 목록 표시를 사용자 지정합니다. 디스플레이 템플릿은 FreeMarker 또는 Velocity로 작성되어 웹 콘텐츠 템플릿이 구조에서 데이터를 가져오는 것과 같은 방식으로 데이터 정의에서 데이터를 가져옵니다. 또한 웹 콘텐츠 템플릿과 유사하게 디스플레이 템플릿은 다른 디스플레이 템플릿에 포함될 수 있습니다. 이를 통해 재사용 가능한 코드, JavaScript 라이브러리 가져오기 또는 시스템의 Velocity 또는 FreeMarker 템플릿에서 가져온 매크로를 사용할 수 있습니다. 표시 템플릿 포함은 유사한 데이터 정의가 여러 개 있을 때 보다 효율적인 프로세스를 제공합니다. 포함된 디스플레이 템플릿을 가져와 새 디스플레이 템플릿에 대해 작업하기만 하면 됩니다.

[양식 템플릿](./creating-form-templates.md)과 마찬가지로 사이트 관리 또는 동적 데이터 목록 표시 위젯에서 표시 템플릿을 생성할 수 있습니다.

사이트 관리에서 새 디스플레이 템플릿을 생성하려면,

1. *콘텐츠 & 데이터* &rarr; *동적 데이터 목록*로 이동합니다.

1. 오른쪽 상단의 옵션 아이콘(![Options](../../../images/icon-options.png))을 클릭하고 *데이터 정의 관리*를 클릭합니다.

1. 데이터 정의 목록에서 정의의 작업 아이콘(![Actions](../../../images/icon-actions.png))을 클릭하고 *템플릿 관리*를 클릭합니다.

1. *추가* 아이콘(![Add](../../../images/icon-add.png))을 클릭하고 *디스플레이 템플릿*를 클릭합니다.

1. 템플릿에 이름을 지정하고 양식의 세부 정보 섹션을 확장한 다음 설명을 입력합니다. 양식의 세부 정보 섹션에 있는 언어 선택기에서 사용할 템플릿 언어를 선택합니다. [FreeMarker](https://freemarker.apache.org/index.html) 또는 [Velocity](https://velocity.apache.org/) 을 선택할 수 있습니다.

1. 양식의 스크립트 섹션에서 이전 단계에서 선택한 템플릿 언어를 사용하여 편집기에서 템플릿을 만듭니다. 편집기 왼쪽의 팔레트에는 공통 변수가 포함되어 있습니다. 변수를 클릭하여 편집기에 삽입하십시오. 편집기도 자동 완성됩니다. FreeMarker 템플릿에서 `${`을 입력하면 일반 변수의 자동 완성 목록이 열립니다. 편집기에 삽입할 변수를 선택합니다. 또는 편집기 아래에 있는 *파일* 선택 버튼을 클릭하여 전체 스크립트 파일을 업로드할 수 있습니다.

    ![스크립트 섹션을 사용하여 템플릿을 만듭니다.](./creating-display-templates/images/01.png)

    템플릿 편집기의 도우미 변수에 대한 자세한 내용은 아래를 참조하십시오.

1. 템플릿 생성이 완료되면 *저장* 을 클릭합니다.

또는 동적 데이터 목록 표시 위젯에서 표시 템플릿을 만들 수 있습니다.

1. 사이트 페이지에서 위젯을 추가하고 구성하려면 [데이터 목록 만들기](./creating-data-lists.md) 기사의 지침을 따르십시오. 템플릿을 만들고 있는 목록을 표시하도록 위젯을 구성해야 합니다.

1. 위젯의 *디스플레이 템플릿 추가* 링크를 클릭합니다. 이렇게 하면 목록 정의에 대한 양식 템플릿을 만들기 위해 위와 동일한 양식이 열립니다.

## 디스플레이 템플릿 편집기

도우미 변수는 템플릿 편집기에서 사용할 수 있습니다. 이를 통해 디스플레이 템플릿을 만드는 데 사용할 대부분의 데이터에 액세스할 수 있습니다. 데이터 목록 변수 제목 아래의 변수를 사용하면 템플릿이 생성되는 데이터 정의에 대한 특정 정보를 삽입할 수 있습니다.

**데이터 정의 ID:** `reserved_ddm_structure_id`

**데이터 목록 설명:** `reserved_record_set_description`

**데이터 목록 ID:** `reserved_record_set_id`

**데이터 목록 이름:** `reserved_record_set_name`

**템플릿 ID:** `reserved_ddm_template_id`

템플릿 내에서 이러한 변수는 레코드 집합의 ID와 이름, 설명 및 데이터 정의를 제공합니다.

레코드를 검색하고 편리한 `레코드` 변수에 할당하여 레코드 목록을 표시합니다. 다음 함수를 포함하는 `DDLDisplayTemplateHelper`에서 목록의 레코드를 검색합니다.

```
getDocumentLibraryPreviewURL

getHTMLContent

getLayoutFriendlyURL

getRecords

renderRecordFieldValue
```

`DDLDisplayTemplateHelper` 은 일반적인 작업을 수행합니다. `getRecords` 메소드를 사용하여 데이터 정의의 항목에 액세스하고 이를 `레코드` 변수에 할당합니다.

```
<#assign records = ddlDisplayTemplateHelper.getRecords(reserved_record_set_id)>
```

연결된 데이터 목록의 레코드를 가져옵니다. 아직 아무것도 하지 않았으므로 디스플레이는 여전히 비어 있습니다. 모든 레코드를 나열하려면 템플릿 편집기의 사이드바에서 데이터 목록 레코드 도우미를 사용하십시오. 템플릿 편집기 창의 적절한 사이트에 커서를 놓은 다음 데이터 목록 레코드를 클릭하십시오. 이 코드는 커서에 나타납니다.

```
<#if records?has_content>
    <#list records as cur_record>
        ${cur_record}
    </#list>
</#if>
```

이 기본 코드 스니펫은 주어진 데이터 정의에 대한 데이터베이스의 모든 것을 뱉어내며 이는 사람이 읽을 수 없습니다.

```
{uuid=52c4ac1c-afe7-963c-49c6-5279b7030a99, recordId=35926, groupId=20126, companyId=20099, userId=20139, userName=Test Test, versionUserId=20139, versionUserName=Test Test, createDate=2018-07-26 14:31:51.056, modifiedDate=2018-07-26 14:31:51.058, DDMStorageId=35927, recordSetId=35922, recordSetVersion=1.0, version=1.0, displayIndex=0, lastPublishDate=null}
```

다음은 포함된 연락처 데이터 정의를 기반으로 목록을 사용하고 글머리 기호 목록에 회사 이름 및 이메일 필드만 표시하는 간단한 예제 템플릿입니다.

```
    <#assign records = ddlDisplayTemplateHelper.getRecords(reserved_record_set_id)>

    <h1>Here are contacts by company name and email address.</h1>

    <#if records?has_content>
        <#list records as cur_record>
            <ul>
                <li>
                    <#-- The below gets the Company field and wraps it in an <em> tag -->
                    Company Name: <em>${ddlDisplayTemplateHelper.renderRecordFieldValue(cur_record.getDDMFormFieldValues("company")?first, locale)}</em><br /> 
                    <#-- The below gets the Email field  and wraps it in an <em> tag --> 
                    Email: ${ddlDisplayTemplateHelper.renderRecordFieldValue(cur_record.getDDMFormFieldValues("email")?first, locale)} 
                </li> 
            </ul> 
        </#list> 
    </#if>
```

다음과 같습니다.

![회사 이름과 이메일을 보여주는 디스플레이 템플릿의 예.](./creating-display-templates/images/02.png)
