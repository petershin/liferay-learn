# 객체 정의 및 항목 지역화

{bdg-secondary}`liferay 7.4 2023.Q3+/GA98+`

Liferay 객체는 지역화 프레임워크와 통합되어 정의 레이블에 대한 번역을 추가할 수 있으며 사용자는 텍스트 필드에 지역화된 값을 입력할 수 있습니다. 이 통합을 통해 개체를 현지화하여 글로벌 사용자에게 더 나은 서비스를 제공할 수 있습니다.

## 객체 정의 라벨 지역화

개체 정의를 구성할 때 정의의 레이블은 물론 해당 필드, 관계, 작업 및 보기 열에 대한 레이블을 지역화할 수 있습니다. 이에 따라 이러한 요소가 개체 레이아웃과 보기에 표시되는 방식이 결정됩니다.

![Localize the Object definition's labels, as well as labels for its fields, relationships, actions, and view columns.](./localizing-object-definitions-and-entries/images/01.png)

또한 [유효성 검사](./validations/adding-field-validations.md) 오류 메시지를 지역화할 수 있습니다.

![Localize validation error messages.](./localizing-object-definitions-and-entries/images/02.png)

## 텍스트 필드에 대한 지역화 활성화

정의 레이블을 현지화하는 것 외에도 사용자 정의 텍스트 [필드](fields.md) 에 대한 번역 지원을 활성화하여 최종 사용자가 입력을 현지화할 수 있습니다.

1. 개체 애플리케이션을 열고 원하는 정의 편집을 시작합니다.

1. 세부정보 탭에서 **항목 번역 활성화** 를 전환하세요.

   ![Enable entry translation.](./localizing-object-definitions-and-entries/images/03.png)

1. **저장** 을 클릭하세요.

이제 텍스트, 긴 텍스트 또는 서식 있는 텍스트 필드를 추가하거나 구성할 때 해당 필드가 지역화 가능한지 여부를 확인할 수 있습니다.

![Determine whether text fields are localizable.](./localizing-object-definitions-and-entries/images/04.png)

```{important}
현지화된 필드는 필수일 수 없습니다. 또한 지역화를 사용할 때 필드 유효성 검사, 조건, 필터 및 정렬은 기본 언어만 지원합니다.
```

활성화된 동안 언어 선택기 버튼을 사용하여 항목을 생성할 때 필드 값을 현지화할 수 있습니다.

![Use the language selector button to localize text field values.](./localizing-object-definitions-and-entries/images/05.png)

## 관련 주제

* [객체 생성](./creating-objects.md) 
* [객체 통합 이해](../understanding-object-integrations.md) 
