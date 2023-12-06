# 개체와 함께 양식 사용

{bdg-secondary}`라이프레이 7.4+`

Liferay 객체는 Forms 애플리케이션과 통합되어 있으므로 사용자 입력을 수신하고 객체 항목을 생성하기 위한 양식을 디자인할 수 있습니다. 이렇게 하려면 먼저 새 양식을 추가하고 개체 저장소 유형을 사용하도록 구성하세요. 그런 다음 원하는 개체를 선택하고 양식을 디자인한 다음 해당 필드를 선택한 개체의 필드에 매핑합니다.

```{note}
규칙 및 유효성 검사를 포함하여 개체에 대해 모든 양식 기능이 지원됩니다. 그러나 사용자는 개체 관계를 양식 필드에 매핑할 수 없습니다. 개체 관계를 포함하는 사용자 정의 레이아웃을 만드는 방법은 [개체 레이아웃 디자인](./creating-and-managing-objects/layouts/designing-object-layouts.md)을 참조하세요.
```

## 개체에 대한 양식 추가

개체 항목을 만들기 위한 양식을 추가하려면 다음 단계를 따르세요.

1. 원하는 사이트로 이동하여 **사이트 메뉴**(![사이트 메뉴](../../images/icon-menu.png))를 열고 **콘텐츠 및 데이터** &rarr; **양식** 으로 이동합니다.

1. **추가** 버튼(![추가 버튼](../../images/icon-add.png))을 클릭합니다.

1. 새 양식에 대해 **구성** 버튼(![구성 버튼](../../images/icon-cog.png))을 클릭합니다.

1. **객체** 저장 유형과 양식에 사용할 객체를 선택합니다.

   선택한 개체에 대한 데이터를 저장하는 양식을 구성합니다.

   ![Select the Object storage type and the desired object.](./using-forms-with-objects/images/01.png)

   ```{note}
   게시된 활성 개체만 나타납니다. 양식은 한 번에 하나의 개체에만 연결할 수 있지만 개체는 여러 양식에 연결할 수 있습니다.
   ```

1. **완료** 를 클릭하세요.

원하는 개체에 연결되면 필드 요소를 양식에 추가하고 이를 개체의 필드에 매핑할 수 있습니다.

## 양식 필드를 개체 필드에 매핑

양식 필드를 개체 필드에 매핑하려면 다음 단계를 따르십시오.

1. 원하는 개체 필드와 호환되는 양식 필드를 추가합니다.

   각 개체 필드 유형과 호환되는 양식 필드 목록은 [필드 호환성 참조](#field-compatibility-reference) 를 참조하세요.

1. **고급** 탭을 클릭하세요.

1. 원하는 **객체 필드** 를 선택하세요.

   ```{warning}
   필수 개체 필드에 매핑되면 양식 필드가 자동으로 필수로 표시됩니다. [양식 규칙을 사용하여](../../process-automation/forms/form-rules/form-rules-overview.md) [필수 필드를 조건부로 숨기기](../../ process-automation/forms/form-rules/example-using-hidden-fields-with-form-rules.md), 적절한 데이터가 포함되어 있는지 확인해야 합니다. 그렇지 않으면 양식 제출이 실패합니다. [자동 완성 규칙](.. /../process-automation/forms/form-rules/using-the-autofill-rule.md)는 필수 숨겨진 필드가 올바르게 채워지는지 확인하는 데 도움이 될 수 있습니다.
   ```

   ![In the Advanced tab, select the desired object field.](./using-forms-with-objects/images/02.png)

1. 원하는 개체 필드가 모두 양식 필드에 매핑될 때까지 위 프로세스를 반복합니다.

   ```{note}
   개체 필드는 하나의 양식 필드에만 매핑될 수 있습니다.
   ```

   ![Map all desired object fields to the form fields.](./using-forms-with-objects/images/03.png)

1. 양식 레이아웃을 디자인합니다. 이 프로세스에 대해 자세히 알아보려면 [양식](../../process-automation/forms.md) 설명서를 참조하세요.

1. 양식 디자인을 마쳤으면 **게시** 를 클릭하여 양식 생성을 완료하세요.

   ```{important}
   개체 양식을 게시하려면 먼저 모든 [매핑 요구 사항](#mapping-requirements) 을 충족해야 합니다.
   ```

게시 후 양식을 사용하여 선택한 개체에 대한 개체 항목을 만들 수 있습니다.

![Use the published form to create object entries.](./using-forms-with-objects/images/04.png)

## 매핑 요구 사항

개체 저장소 유형을 사용하는 모든 양식에는 다음 요구 사항이 있습니다.

- 데이터 손실을 방지하려면 모든 양식 필드를 개체 필드에 매핑해야 합니다.

- 모든 필수 개체 필드는 양식 필드에 매핑되어야 합니다.

잘못된 매핑이 포함된 양식을 게시하려고 하면 무엇이 잘못되었는지 식별하는 오류 메시지가 표시됩니다.

![Attempting to publish a form with invalid mappings displays an error message.](./using-forms-with-objects/images/05.png)

## 필드 호환성 참조

| 개체 필드 유형                  | 호환되는 양식 필드          |
| :------------------------ | :------------------ |
| 부착                        | ❌                   |
| 불리언                       | 부울(체크박스)            |
| 날짜                        | 날짜                  |
| 10진수(**이전에는 Double**)       | 숫자 &rarr; 소수   |
| 정수                        | 숫자 &rarr; 정수   |
| Long 정수(**이전의 Long**)       | 숫자 &rarr; 정수   |
| 긴 텍스트(**이전의 Clob**)         | 원본                  |
| 선택목록                      | 목록에서 선택, 단일 선택      |
| 정밀도 십진수(**이전의 BigDecimal**) | 숫자 &rarr; 소수   |
| Relationship              | ❌                   |
| 서식있는 텍스트                  | 서식있는 텍스트            |
| 텍스트(**이전의 문자열**)            | 텍스트, 다중 선택, 그리드, 색상 |

## 관련 주제

* [객체 개요](../objects.md)
* [객체 생성](./creating-and-managing-objects/creating-objects.md)
* [객체 레이아웃 디자인](./creating-and-managing-objects/layouts/designing-object-layouts.md)
