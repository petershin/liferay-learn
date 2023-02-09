# 모델 힌트 추가

Service Builder를 사용하여 모델 엔터티를 정의한 후에는 사용자가 해당 데이터를 입력하는 방법을 구체화할 수 있습니다. 모델 힌트는 엔터티 데이터 제한 및 기타 형식을 지정합니다. 예를 들어 모델 힌트는 미래에만 선택할 수 있는 날짜가 있는 달력 필드를 정의할 수 있습니다.

`portlet-model-hints.xml`이라는 파일에서 모델 힌트를 정의합니다. `portlet-model-hints.xml` 파일은 서비스 모듈의 `src/main/resources/META-INF` 폴더에 들어갑니다.

모델 힌트는 다음 두 가지를 정의합니다.

1. 엔터티가 사용자에게 표시되는 방법

1. 데이터베이스 열의 크기

Liferay는 양식 필드를 렌더링할 때 구성에 따라 양식의 입력 필드를 사용자 정의합니다.

```{note}
Spring을 종속성 주입기로 선택한 경우 Service Builder는 서비스 모듈의 ``src/main/resources/META-INF`` 폴더에 여러 XML 구성 파일을 생성합니다. Service Builder는 이러한 파일 대부분을 사용하여 Spring 및 Hibernate 구성을 관리합니다. Spring 또는 Hibernate 구성 파일을 수정하지 마십시오. Service Builder가 실행될 때 변경 사항을 덮어씁니다. 그러나 ``portlet-model-hints.xml`` 파일을 안전하게 편집할 수 있습니다.
```

예를 들어 [Blogs 앱 서비스 모듈의](https://github.com/liferay/liferay-portal/blob/master/modules/apps/blogs/blogs-service/src/main/resources/META-INF/portlet-model-hints.xml) 모델 힌트 파일을 고려하십시오.

```xml
<?xml version="1.0"?>

<model-hints>
    <model name="com.liferay.blogs.model.BlogsEntry">
        <field name="mvccVersion" type="long" />
        <field name="ctCollectionId" type="long" />
        <field name="uuid" type="String" />
        <field name="externalReferenceCode" type="String" />
        <field name="entryId" type="long" />
        <field name="groupId" type="long" />
        <field name="companyId" type="long" />
        <field name="userId" type="long" />
        <field name="userName" type="String" />
        <field name="createDate" type="Date" />
        <field name="modifiedDate" type="Date" />
        <field name="title" type="String">
            <hint name="max-length">255</hint>
            <sanitize content-type="text/plain" modes="ALL" />
            <validator name="required" />
        </field>
        <field name="subtitle" type="String">
            <hint-collection name="TEXTAREA" />
        </field>
        <field name="urlTitle" type="String">
            <hint name="max-length">255</hint>
        </field>
        <field name="description" type="String">
            <hint-collection name="TEXTAREA" />
            <hint name="display-width">350</hint>
        </field>
        <field name="content" type="String">
            <hint-collection name="CLOB" />
            <sanitize content-type="text/html" modes="ALL" />
        </field>
        <field name="displayDate" type="Date" />
        <field name="allowPingbacks" type="boolean" />
        <field name="allowTrackbacks" type="boolean" />
        <field name="trackbacks" type="String">
            <hint-collection name="CLOB" />
        </field>
        <field name="coverImageCaption" type="String">
            <hint-collection name="TEXTAREA" />
            <sanitize content-type="text/html" modes="ALL" />
        </field>
        <field name="coverImageFileEntryId" type="long" />
        <field name="coverImageURL" type="String">
            <hint-collection name="URL" />
        </field>
        <field name="smallImage" type="boolean" />
        <field name="smallImageFileEntryId" type="long" />
        <field name="smallImageId" type="long" />
        <field name="smallImageURL" type="String">
            <hint-collection name="URL" />
            <hint name="display-width">210</hint>
        </field>
        <field name="lastPublishDate" type="Date" />
        <field name="status" type="int" />
        <field name="statusByUserId" type="long" />
        <field name="statusByUserName" type="String" />
        <field name="statusDate" type="Date" />
    </model>
</model-hints>
```

루트 수준 요소는 `model-hints`입니다. 모델 엔티티는 `model-hints` 요소의 `model` 하위 요소로 표현됩니다. 각 `model` 요소에는 정규화된 클래스 이름을 지정하는 `name` 속성이 있어야 합니다. 모델에는 항목의 열을 나타내는 'field' 요소가 있습니다. 마지막으로 `field` 요소에는 이름과 유형이 있어야 합니다. 각 `field` 요소의 이름과 유형은 서비스 모듈의 `service.xml` 파일에서 엔티티 열에 대해 지정된 이름과 유형에 매핑됩니다. Service Builder는 `service.xml`을 기반으로 이러한 모든 요소를 생성합니다.

필드에 힌트를 추가하려면 `힌트` 하위 요소를 추가하십시오. 예를 들어 `디스플레이 너비 힌트` 을 추가하여 필드를 표시하는 데 사용할 픽셀 너비를 지정할 수 있습니다. 기본 픽셀 너비는 `350`입니다. 50픽셀이 있는 `문자열` 필드를 표시하려면 `display-width` 라는 이름의 `힌트` 요소를 중첩하고 `50`값을 지정할 수 있습니다.

필드에 대한 힌트의 효과를 확인하려면 [서비스 빌더](../service-builder-basics/generating-model-persistence-and-service-code.md#generate-the-persistence-code) 을 다시 실행하고 [모듈을 재배포합니다](../../../../liferay-internals/fundamentals/module-projects.md#deploy-a-simple-module). `표시 너비` 을 변경해도 사용자가 `이름` 필드에 입력할 수 있는 문자 수는 제한되지 않습니다. 입력 양식에서 필드의 너비만 제어합니다.

모델 필드의 데이터베이스 열의 최대 크기(즉, 필드에 저장할 수 있는 최대 문자 수)를 구성하려면 `최대 길이` 힌트를 사용하십시오. 기본 `최대 길이` 값은 `75` 자입니다. `이름` 필드를 최대 100자까지 유지하려면 해당 필드에 `최대 길이` 힌트를 추가합니다.

```xml
<field name="name" type="String">
    <hint name="display-width">50</hint>
    <hint name="max-length">100</hint>
</field>
```

portlet-model-</code> `을 업데이트한 후 Service Builder를 실행하고 프로젝트를 재배포해야 합니다.</p>

<h2 spaces-before="0">모델 힌트 유형</h2>

<p spaces-before="0">다음 표에서는 사용할 수 있는 포틀릿 모델 힌트를 설명합니다.</p>

<p spaces-before="0"><strong x-id="1">모델 힌트 값 및 설명</strong></p>

<table spaces-before="0">
<thead>
<tr>
  <th>이름</th>
  <th align="left">값 유형</th>
  <th align="left">묘사</th>
  <th align="left">기본</th>
</tr>
</thead>
<tbody>
<tr>
  <td><code>auto-escape`</td> 

</tr> 

</tbody> </table>

```{note}
aui taglib는 완전히 지원되며 더 이상 사용되지 않는 AlloyUI(JavaScript 라이브러리)와 관련이 없습니다.
```

```{note}
양식에서 Clay 및 aui 태그를 혼합하여 사용할 수 있습니다. 그러나 모델 힌트는 aui 태그에만 영향을 미칩니다.
```

Liferay DXP/Portal에는 자체 모델 힌트 파일[`portal-model-hints.xml`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/META- INF/portal-model-hints.xml). `portal-impl.jar`의 `META-INF` 폴더에 있습니다. 이 파일에는 많은 힌트 예제가 포함되어 있으므로 `portlet-model-hints.xml` 파일을 생성할 때 참조할 수 있습니다.

## 기본 힌트

`default-hints` 요소를 사용하여 모델의 모든 필드에 적용할 힌트 목록을 정의할 수 있습니다. 예를 들어 모델 요소 내에 다음 요소를 추가하면 각 필드에 300픽셀의 `디스플레이 너비` 이 적용됩니다.

```xml
<default-hints>
    <hint name="display-width">300</hint>
</default-hints>
```

## 힌트 컬렉션

`model-hints` root-level 요소 안에 `개의 hint-collection` 개의 요소를 정의하여 함께 적용할 힌트 목록을 정의할 수 있습니다. 힌트 컬렉션에는 이름이 있어야 합니다. 예를 들어 Liferay의 `portal-model-hints.xml` 은 다음 힌트 모음을 정의합니다.

```xml
<hint-collection name="CLOB">
    <hint name="max-length">2000000</hint>
</hint-collection>
<hint-collection name="EDITOR">
    <hint name="editor">true</hint>
    <hint name="max-length">2000000</hint>
</hint-collection>
<hint-collection name="EMAIL-ADDRESS">
    <hint name="max-length">254</hint>
</hint-collection>
<hint-collection name="HOSTNAME">
    <hint name="max-length">200</hint>
</hint-collection>
<hint-collection name="SEARCHABLE-DATE">
    <hint name="month-nullable">true</hint>
    <hint name="day-nullable">true</hint>
    <hint name="year-nullable">true</hint>
    <hint name="show-time">false</hint>
</hint-collection>
<hint-collection name="TEXTAREA">
    <hint name="display-height">105</hint>
    <hint name="display-width">500</hint>
    <hint name="max-length">4000</hint>
</hint-collection>
<hint-collection name="URL">
    <hint name="max-length">4000</hint>
</hint-collection>
```

힌트 컬렉션의 이름을 참조하여 모델 필드에 힌트 컬렉션을 적용할 수 있습니다. 예를 들어, `model-hints` 요소에서 위의 것과 같은 `SEARCHABLE-DATE` 컬렉션을 정의하는 경우 컬렉션을 참조하는 `hint-collection` 요소를 사용하여 모델의 날짜 필드에 적용할 수 있습니다. 이름:

```xml
<field name="date" type="Date">
    <hint-collection name="SEARCHABLE-DATE" />
</field>
```

프로젝트에서 몇 가지 모델 힌트를 사용하려고 한다고 가정합니다. 코멘트 필드를 채울 수 있는 편집기를 사용자에게 제공하는 것부터 시작하십시오. 여러 엔터티에 동일한 힌트를 적용하려면 힌트 컬렉션으로 정의합니다. 그런 다음 각 엔터티에서 힌트 컬렉션을 참조합니다.

힌트 콜렉션을 정의하려면 `portlet-model-hints.xml` 파일의 `model-hints` 루트 요소 내에 `hint-collection` 요소를 추가하십시오. 예를 들어:

```xml
<hint-collection name="COMMENT-TEXTAREA">
    <hint name="display-height">105</hint>
    <hint name="display-width">500</hint>
    <hint name="max-length">4000</hint>
</hint-collection>
```

특정 필드에 대한 힌트 컬렉션을 참조하려면 필드의 `field` 요소 내에 `hint-collection` 요소를 추가합니다.

```xml
<field name="comment" type="String">
    <hint-collection name="COMMENT-TEXTAREA" />
</field>
```

힌트 컬렉션을 정의하고 힌트 컬렉션 참조를 추가한 후 서비스를 다시 빌드하고 프로젝트를 재배포하고 힌트 컬렉션에 정의된 힌트가 적용되었는지 확인합니다.

잘 하셨어요! 이제 모델의 입력 필드가 표시되는 방식에 영향을 미칠 수 있을 뿐만 아니라 데이터베이스 테이블 열 크기도 설정할 수 있습니다. 힌트를 구성하거나, 개별 힌트를 필드에 직접 삽입하거나, 모델의 모든 필드에 기본 힌트 세트를 적용하거나, 해당 범위 중 하나에 적용할 힌트 모음을 정의할 수 있습니다.
