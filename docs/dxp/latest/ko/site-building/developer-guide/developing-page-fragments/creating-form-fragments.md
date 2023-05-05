# 양식 조각 만들기

{bdg-secondary}`사용 가능한 Liferay 7.4 U45+/GA45+`

[양식 구성 요소 조각](../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md) 콘텐츠 페이지에서 개체의 양식을 작성하기 위한 것입니다. Liferay의 양식 조각이 귀하의 사용 사례를 만족시키지 못하는 경우 양식에 대해 원하는 디자인과 기능을 달성하기 위해 직접 만드십시오.

양식 조각을 만들려면

1. **Site Menu**( ![Site Menu](../../../images/icon-product-menu.png) )을 열고 **Design** 확장한 다음 **Fragments** 으로 이동합니다.

1. **더하기**(![Plus Button](../../../images/icon-plus.png))을 클릭하여 양식 조각을 구성하기 위한 조각 세트를 만듭니다.

1. **추가**(![Add Button](../../../images/icon-add.png))을 클릭하고 **Form Fragment** 유형을 선택한 후 **다음** 클릭합니다.

   ![양식 조각 유형을 선택하고 다음을 클릭하십시오.](./creating-form-fragments/images/01.png)

1. 이름을 입력하세요.

1. 조각에서 허용할 필드 유형을 선택합니다.

   CAPTCHA를 선택하면 다른 필드 유형을 선택할 수 없습니다. 그렇지 않으면 임의의 필드 조합을 선택할 수 있습니다.

   ![조각이 지원하는 필드 유형을 선택합니다.](./creating-form-fragments/images/02.png)

1. **추가** 클릭합니다. 이렇게 하면 초안 조각이 생성되고 조각 편집 페이지로 이동합니다.

1. 코드 탭에서 조각에 대한 HTML, CSS 및 JavaScript를 추가합니다.

   ![코드 탭에서 조각에 대한 HTML, CSS 및 JavaScript를 추가합니다.](./creating-form-fragments/images/03.png)

1. (선택 사항) 구성 탭에서 JSON을 사용하여 조각을 구성하고 옵션을 추가합니다.

   ![구성 탭에서 JSON을 사용하여 조각을 구성하고 여기에 옵션을 추가합니다.](./creating-form-fragments/images/04.png)

1. **게시** 클릭합니다.

이제 양식 조각을 사용하여 콘텐츠 페이지에서 양식을 작성하십시오. 자세한 내용은 [프래그먼트를 사용하여 양식 작성](../../../building-applications/objects/using-fragments-to-build-forms.md) 참조하십시오.

Fragments Toolkit을 사용하는 경우 `yarn run add-fragment`을 실행할 때 조각 유형을 선택할 수 있습니다.

![Fragments Toolkit을 사용할 때 조각 유형을 선택하십시오.](./creating-form-fragments/images/05.png)

지원되는 필드 유형을 지정하려면 `fieldTypes` 속성을 `fragment.json`의 `typeOptions` 에 추가합니다. 필드 유형을 배열로 입력합니다.

```json
{
   "cacheable": false,
   "fragmentEntryKey": "numeric-input",
   "icon": "number",
   "type": "input",
   "typeOptions": {
      "fieldTypes": [
         "number",
         "text"
      ]
   }
}
```

이후 기본 프래그먼트를 생성할 때와 동일한 과정을 거친다. 기본 프래그먼트 생성 및 배포에 대한 자세한 내용은 [프래그먼트 툴킷 사용](./using-the-fragments-toolkit.md) 을 참조하십시오.

## 지원되는 필드 유형 참조

| 급식 유형          | 묘사                                  |
|:-------------- |:----------------------------------- |
| `boolean`      | 부울 필드.                              |
| `captcha`      | 사용자는 제출하기 전에 사람인지 확인해야 합니다.         |
| `date`         | 날짜 필드.                              |
| `file`         | 파일 첨부 지원을 추가합니다.                    |
| `html`         | 서식 있는 텍스트를 추가하기 위한 CKEditor를 추가합니다. |
| `multiselect`  | 확인란 목록에서 선택합니다.                     |
| `number`       | 숫자 필드.                              |
| `relationship` | 개체 관계를 정의합니다.                       |
| `select`       | 드롭다운 목록에서 옵션을 선택합니다.                |
| `text`         | 텍스트 필드에 대한 지원을 추가합니다.               |

## 양식 조각에 `입력` 변수 사용

양식 조각에는 각 조각의 JavaScript 및 FreeMarker 코드와 함께 사용할 `입력` 변수가 포함됩니다. 이 변수에는 조각을 구성하기 위한 속성이 포함되어 있습니다.

## 입력 변수 속성 참조

| 재산             | 유형        | 묘사                                                 |
|:-------------- |:--------- |:-------------------------------------------------- |
| `fieldTypes`   | `string`  | 입력에 매핑된 필드 유형입니다.                                  |
| `name`         | `string`  | 입력의 이름입니다.                                         |
| `required`     | `boolean` | 입력이 필요한지 여부입니다.                                    |
| `value`        | `string`  | 필드 값입니다.                                           |
| `label`        | `string`  | 입력의 레이블입니다.                                        |
| `showLabel`    | `boolean` | 라벨 가시성.                                            |
| `errorMessage` | `string`  | 양식 제출 오류.                                          |
| `helpText`     | `string`  | 양식 필드에 대한 UI 도움말 메시지입니다. 정의되지 않은 경우 이 속성은 비어 있습니다. |
| `showHelpText` | `boolean` | 도움말 텍스트 가시성.                                       |
| `attributes`   | `object`  | 특정 입력 유형에 대해 조각에 옵션이 추가되었습니다.                      |

### `파일` 입력에 대한 속성

| 재산                             | 유형                      | 묘사                                                                                                                                           |
|:------------------------------ |:----------------------- |:-------------------------------------------------------------------------------------------------------------------------------------------- |
| `allowedFileExtensions`        | `string`                | 허용된 파일 확장자. 지원되는 파일 정보 표시가 활성화된 경우 허용된 확장자가 필드의 도움말 텍스트에 나타납니다.                                                                              |
| `maxFileSize`                  | `number`                | 최대 업로드 크기(MB)입니다. 지원되는 파일 정보 표시가 활성화된 경우 필드의 도움말 텍스트에 최대 허용 크기가 나타납니다.                                                                       |
| `selectFromDocumentLibrary`    | `boolean`               | 사용자가 문서 라이브러리에서 파일을 선택할 수 있는지 여부입니다. 이것은 객체의 [첨부 필드](../../../building-applications/objects/creating-and-managing-objects/fields.md)에 설정됩니다. |
| `selectFromDocumentLibraryURL` | `string` or `undefined` | `selectFromDocumentLibrary` 이 true인 경우 이 속성에는 해당하는 `ItemSelector`을 렌더링하기 위한 URL이 포함됩니다.                                                      |

### `숫자` 입력에 대한 속성

| 재산         | 유형                      | 묘사                                                            |
|:---------- |:----------------------- |:------------------------------------------------------------- |
| `dataType` | `integer` or `decimal`  | 정수 또는 십진수를 선택하십시오.                                            |
| `max`      | `number` or `undefined` | 허용되는 최대 수입니다.                                                 |
| `min`      | `number` or `undefined` | 허용되는 최소 수입니다.                                                 |
| `step`     | `string` or `undefined` | 허용되는 최대 정밀도를 나타내기 위해 HTML 입력 "step" 속성과 함께 사용할 수 있는 문자열 값입니다. |

### `관계` 입력에 대한 속성

| 재산                           | 유형       | 묘사                                                                                                      |
|:---------------------------- |:-------- |:------------------------------------------------------------------------------------------------------- |
| `relationshipLabelFieldName` | `string` | 레이블로 사용되는 관련 개체의 필드 이름입니다.                                                                              |
| `relationshipValueFieldName` | `string` | 값으로 사용되는 관련 개체의 필드 이름입니다.                                                                               |
| `relationshipURL`            | `string` | API에서 옵션을 가져오는 데 사용되는 URL입니다. API 응답은 페이지 매김을 포함하여 Liferay의 헤드리스 목록 형식을 사용합니다. 추가 매개변수를 전달하여 응답을 쿼리합니다. |

### `선택` 입력에 대한 속성

| 재산        | 유형                                            | 묘사               |
|:--------- |:--------------------------------------------- |:---------------- |
| `options` | `Array<{label: string, value: string}>` | 사용 가능한 옵션 목록입니다. |

## 추가 정보

* [페이지 조각 개발](../developing-page-fragments.md)
* [프래그먼트를 사용하여 양식 작성](../../../building-applications/objects/using-fragments-to-build-forms.md)
